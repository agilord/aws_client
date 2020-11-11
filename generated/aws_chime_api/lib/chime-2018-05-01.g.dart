// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chime-2018-05-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    accountId: json['AccountId'] as String,
    awsAccountId: json['AwsAccountId'] as String,
    name: json['Name'] as String,
    accountType:
        _$enumDecodeNullable(_$AccountTypeEnumMap, json['AccountType']),
    createdTimestamp: iso8601FromJson(json['CreatedTimestamp'] as String),
    defaultLicense:
        _$enumDecodeNullable(_$LicenseEnumMap, json['DefaultLicense']),
    signinDelegateGroups: (json['SigninDelegateGroups'] as List)
        ?.map((e) => e == null
            ? null
            : SigninDelegateGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    supportedLicenses:
        (json['SupportedLicenses'] as List)?.map((e) => e as String)?.toList(),
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

const _$AccountTypeEnumMap = {
  AccountType.team: 'Team',
  AccountType.enterpriseDirectory: 'EnterpriseDirectory',
  AccountType.enterpriseLWA: 'EnterpriseLWA',
  AccountType.enterpriseOIDC: 'EnterpriseOIDC',
};

const _$LicenseEnumMap = {
  License.basic: 'Basic',
  License.plus: 'Plus',
  License.pro: 'Pro',
  License.proTrial: 'ProTrial',
};

AccountSettings _$AccountSettingsFromJson(Map<String, dynamic> json) {
  return AccountSettings(
    disableRemoteControl: json['DisableRemoteControl'] as bool,
    enableDialOut: json['EnableDialOut'] as bool,
  );
}

Map<String, dynamic> _$AccountSettingsToJson(AccountSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DisableRemoteControl', instance.disableRemoteControl);
  writeNotNull('EnableDialOut', instance.enableDialOut);
  return val;
}

AlexaForBusinessMetadata _$AlexaForBusinessMetadataFromJson(
    Map<String, dynamic> json) {
  return AlexaForBusinessMetadata(
    alexaForBusinessRoomArn: json['AlexaForBusinessRoomArn'] as String,
    isAlexaForBusinessEnabled: json['IsAlexaForBusinessEnabled'] as bool,
  );
}

Map<String, dynamic> _$AlexaForBusinessMetadataToJson(
    AlexaForBusinessMetadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlexaForBusinessRoomArn', instance.alexaForBusinessRoomArn);
  writeNotNull('IsAlexaForBusinessEnabled', instance.isAlexaForBusinessEnabled);
  return val;
}

Map<String, dynamic> _$AssociatePhoneNumberWithUserRequestToJson(
    AssociatePhoneNumberWithUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('E164PhoneNumber', instance.e164PhoneNumber);
  return val;
}

AssociatePhoneNumberWithUserResponse
    _$AssociatePhoneNumberWithUserResponseFromJson(Map<String, dynamic> json) {
  return AssociatePhoneNumberWithUserResponse();
}

Map<String, dynamic>
    _$AssociatePhoneNumbersWithVoiceConnectorGroupRequestToJson(
        AssociatePhoneNumbersWithVoiceConnectorGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('E164PhoneNumbers', instance.e164PhoneNumbers);
  writeNotNull('ForceAssociate', instance.forceAssociate);
  return val;
}

AssociatePhoneNumbersWithVoiceConnectorGroupResponse
    _$AssociatePhoneNumbersWithVoiceConnectorGroupResponseFromJson(
        Map<String, dynamic> json) {
  return AssociatePhoneNumbersWithVoiceConnectorGroupResponse(
    phoneNumberErrors: (json['PhoneNumberErrors'] as List)
        ?.map((e) => e == null
            ? null
            : PhoneNumberError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AssociatePhoneNumbersWithVoiceConnectorRequestToJson(
    AssociatePhoneNumbersWithVoiceConnectorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('E164PhoneNumbers', instance.e164PhoneNumbers);
  writeNotNull('ForceAssociate', instance.forceAssociate);
  return val;
}

AssociatePhoneNumbersWithVoiceConnectorResponse
    _$AssociatePhoneNumbersWithVoiceConnectorResponseFromJson(
        Map<String, dynamic> json) {
  return AssociatePhoneNumbersWithVoiceConnectorResponse(
    phoneNumberErrors: (json['PhoneNumberErrors'] as List)
        ?.map((e) => e == null
            ? null
            : PhoneNumberError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AssociateSigninDelegateGroupsWithAccountRequestToJson(
    AssociateSigninDelegateGroupsWithAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SigninDelegateGroups',
      instance.signinDelegateGroups?.map((e) => e?.toJson())?.toList());
  return val;
}

AssociateSigninDelegateGroupsWithAccountResponse
    _$AssociateSigninDelegateGroupsWithAccountResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateSigninDelegateGroupsWithAccountResponse();
}

Attendee _$AttendeeFromJson(Map<String, dynamic> json) {
  return Attendee(
    attendeeId: json['AttendeeId'] as String,
    externalUserId: json['ExternalUserId'] as String,
    joinToken: json['JoinToken'] as String,
  );
}

Map<String, dynamic> _$BatchCreateAttendeeRequestToJson(
    BatchCreateAttendeeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Attendees', instance.attendees?.map((e) => e?.toJson())?.toList());
  return val;
}

BatchCreateAttendeeResponse _$BatchCreateAttendeeResponseFromJson(
    Map<String, dynamic> json) {
  return BatchCreateAttendeeResponse(
    attendees: (json['Attendees'] as List)
        ?.map((e) =>
            e == null ? null : Attendee.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : CreateAttendeeError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchCreateRoomMembershipRequestToJson(
    BatchCreateRoomMembershipRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MembershipItemList',
      instance.membershipItemList?.map((e) => e?.toJson())?.toList());
  return val;
}

BatchCreateRoomMembershipResponse _$BatchCreateRoomMembershipResponseFromJson(
    Map<String, dynamic> json) {
  return BatchCreateRoomMembershipResponse(
    errors: (json['Errors'] as List)
        ?.map((e) =>
            e == null ? null : MemberError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchDeletePhoneNumberRequestToJson(
    BatchDeletePhoneNumberRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PhoneNumberIds', instance.phoneNumberIds);
  return val;
}

BatchDeletePhoneNumberResponse _$BatchDeletePhoneNumberResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDeletePhoneNumberResponse(
    phoneNumberErrors: (json['PhoneNumberErrors'] as List)
        ?.map((e) => e == null
            ? null
            : PhoneNumberError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchSuspendUserRequestToJson(
    BatchSuspendUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UserIdList', instance.userIdList);
  return val;
}

BatchSuspendUserResponse _$BatchSuspendUserResponseFromJson(
    Map<String, dynamic> json) {
  return BatchSuspendUserResponse(
    userErrors: (json['UserErrors'] as List)
        ?.map((e) =>
            e == null ? null : UserError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchUnsuspendUserRequestToJson(
    BatchUnsuspendUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UserIdList', instance.userIdList);
  return val;
}

BatchUnsuspendUserResponse _$BatchUnsuspendUserResponseFromJson(
    Map<String, dynamic> json) {
  return BatchUnsuspendUserResponse(
    userErrors: (json['UserErrors'] as List)
        ?.map((e) =>
            e == null ? null : UserError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchUpdatePhoneNumberRequestToJson(
    BatchUpdatePhoneNumberRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'UpdatePhoneNumberRequestItems',
      instance.updatePhoneNumberRequestItems
          ?.map((e) => e?.toJson())
          ?.toList());
  return val;
}

BatchUpdatePhoneNumberResponse _$BatchUpdatePhoneNumberResponseFromJson(
    Map<String, dynamic> json) {
  return BatchUpdatePhoneNumberResponse(
    phoneNumberErrors: (json['PhoneNumberErrors'] as List)
        ?.map((e) => e == null
            ? null
            : PhoneNumberError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchUpdateUserRequestToJson(
    BatchUpdateUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UpdateUserRequestItems',
      instance.updateUserRequestItems?.map((e) => e?.toJson())?.toList());
  return val;
}

BatchUpdateUserResponse _$BatchUpdateUserResponseFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateUserResponse(
    userErrors: (json['UserErrors'] as List)
        ?.map((e) =>
            e == null ? null : UserError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Bot _$BotFromJson(Map<String, dynamic> json) {
  return Bot(
    botEmail: json['BotEmail'] as String,
    botId: json['BotId'] as String,
    botType: _$enumDecodeNullable(_$BotTypeEnumMap, json['BotType']),
    createdTimestamp: iso8601FromJson(json['CreatedTimestamp'] as String),
    disabled: json['Disabled'] as bool,
    displayName: json['DisplayName'] as String,
    securityToken: json['SecurityToken'] as String,
    updatedTimestamp: iso8601FromJson(json['UpdatedTimestamp'] as String),
    userId: json['UserId'] as String,
  );
}

const _$BotTypeEnumMap = {
  BotType.chatBot: 'ChatBot',
};

BusinessCallingSettings _$BusinessCallingSettingsFromJson(
    Map<String, dynamic> json) {
  return BusinessCallingSettings(
    cdrBucket: json['CdrBucket'] as String,
  );
}

Map<String, dynamic> _$BusinessCallingSettingsToJson(
    BusinessCallingSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CdrBucket', instance.cdrBucket);
  return val;
}

Map<String, dynamic> _$CreateAccountRequestToJson(
    CreateAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

CreateAccountResponse _$CreateAccountResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAccountResponse(
    account: json['Account'] == null
        ? null
        : Account.fromJson(json['Account'] as Map<String, dynamic>),
  );
}

CreateAttendeeError _$CreateAttendeeErrorFromJson(Map<String, dynamic> json) {
  return CreateAttendeeError(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    externalUserId: json['ExternalUserId'] as String,
  );
}

Map<String, dynamic> _$CreateAttendeeRequestToJson(
    CreateAttendeeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExternalUserId', instance.externalUserId);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$CreateAttendeeRequestItemToJson(
    CreateAttendeeRequestItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExternalUserId', instance.externalUserId);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateAttendeeResponse _$CreateAttendeeResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAttendeeResponse(
    attendee: json['Attendee'] == null
        ? null
        : Attendee.fromJson(json['Attendee'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateBotRequestToJson(CreateBotRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DisplayName', instance.displayName);
  writeNotNull('Domain', instance.domain);
  return val;
}

CreateBotResponse _$CreateBotResponseFromJson(Map<String, dynamic> json) {
  return CreateBotResponse(
    bot: json['Bot'] == null
        ? null
        : Bot.fromJson(json['Bot'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateMeetingRequestToJson(
    CreateMeetingRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClientRequestToken', instance.clientRequestToken);
  writeNotNull('ExternalMeetingId', instance.externalMeetingId);
  writeNotNull('MediaRegion', instance.mediaRegion);
  writeNotNull('MeetingHostId', instance.meetingHostId);
  writeNotNull('NotificationsConfiguration',
      instance.notificationsConfiguration?.toJson());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateMeetingResponse _$CreateMeetingResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMeetingResponse(
    meeting: json['Meeting'] == null
        ? null
        : Meeting.fromJson(json['Meeting'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreatePhoneNumberOrderRequestToJson(
    CreatePhoneNumberOrderRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('E164PhoneNumbers', instance.e164PhoneNumbers);
  writeNotNull(
      'ProductType', _$PhoneNumberProductTypeEnumMap[instance.productType]);
  return val;
}

const _$PhoneNumberProductTypeEnumMap = {
  PhoneNumberProductType.businessCalling: 'BusinessCalling',
  PhoneNumberProductType.voiceConnector: 'VoiceConnector',
};

CreatePhoneNumberOrderResponse _$CreatePhoneNumberOrderResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePhoneNumberOrderResponse(
    phoneNumberOrder: json['PhoneNumberOrder'] == null
        ? null
        : PhoneNumberOrder.fromJson(
            json['PhoneNumberOrder'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateProxySessionRequestToJson(
    CreateProxySessionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Capabilities', instance.capabilities);
  writeNotNull('ParticipantPhoneNumbers', instance.participantPhoneNumbers);
  writeNotNull('ExpiryMinutes', instance.expiryMinutes);
  writeNotNull('GeoMatchLevel', _$GeoMatchLevelEnumMap[instance.geoMatchLevel]);
  writeNotNull('GeoMatchParams', instance.geoMatchParams?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull('NumberSelectionBehavior',
      _$NumberSelectionBehaviorEnumMap[instance.numberSelectionBehavior]);
  return val;
}

const _$GeoMatchLevelEnumMap = {
  GeoMatchLevel.country: 'Country',
  GeoMatchLevel.areaCode: 'AreaCode',
};

const _$NumberSelectionBehaviorEnumMap = {
  NumberSelectionBehavior.preferSticky: 'PreferSticky',
  NumberSelectionBehavior.avoidSticky: 'AvoidSticky',
};

CreateProxySessionResponse _$CreateProxySessionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProxySessionResponse(
    proxySession: json['ProxySession'] == null
        ? null
        : ProxySession.fromJson(json['ProxySession'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateRoomMembershipRequestToJson(
    CreateRoomMembershipRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MemberId', instance.memberId);
  writeNotNull('Role', _$RoomMembershipRoleEnumMap[instance.role]);
  return val;
}

const _$RoomMembershipRoleEnumMap = {
  RoomMembershipRole.administrator: 'Administrator',
  RoomMembershipRole.member: 'Member',
};

CreateRoomMembershipResponse _$CreateRoomMembershipResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRoomMembershipResponse(
    roomMembership: json['RoomMembership'] == null
        ? null
        : RoomMembership.fromJson(
            json['RoomMembership'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateRoomRequestToJson(CreateRoomRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('ClientRequestToken', instance.clientRequestToken);
  return val;
}

CreateRoomResponse _$CreateRoomResponseFromJson(Map<String, dynamic> json) {
  return CreateRoomResponse(
    room: json['Room'] == null
        ? null
        : Room.fromJson(json['Room'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Email', instance.email);
  writeNotNull('UserType', _$UserTypeEnumMap[instance.userType]);
  writeNotNull('Username', instance.username);
  return val;
}

const _$UserTypeEnumMap = {
  UserType.privateUser: 'PrivateUser',
  UserType.sharedDevice: 'SharedDevice',
};

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateVoiceConnectorGroupRequestToJson(
    CreateVoiceConnectorGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('VoiceConnectorItems',
      instance.voiceConnectorItems?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateVoiceConnectorGroupResponse _$CreateVoiceConnectorGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateVoiceConnectorGroupResponse(
    voiceConnectorGroup: json['VoiceConnectorGroup'] == null
        ? null
        : VoiceConnectorGroup.fromJson(
            json['VoiceConnectorGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateVoiceConnectorRequestToJson(
    CreateVoiceConnectorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('RequireEncryption', instance.requireEncryption);
  writeNotNull(
      'AwsRegion', _$VoiceConnectorAwsRegionEnumMap[instance.awsRegion]);
  return val;
}

const _$VoiceConnectorAwsRegionEnumMap = {
  VoiceConnectorAwsRegion.usEast_1: 'us-east-1',
  VoiceConnectorAwsRegion.usWest_2: 'us-west-2',
};

CreateVoiceConnectorResponse _$CreateVoiceConnectorResponseFromJson(
    Map<String, dynamic> json) {
  return CreateVoiceConnectorResponse(
    voiceConnector: json['VoiceConnector'] == null
        ? null
        : VoiceConnector.fromJson(
            json['VoiceConnector'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CredentialToJson(Credential instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Password', instance.password);
  writeNotNull('Username', instance.username);
  return val;
}

Map<String, dynamic> _$DeleteAccountRequestToJson(
        DeleteAccountRequest instance) =>
    <String, dynamic>{};

DeleteAccountResponse _$DeleteAccountResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAccountResponse();
}

Map<String, dynamic> _$DeleteAttendeeRequestToJson(
        DeleteAttendeeRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteEventsConfigurationRequestToJson(
        DeleteEventsConfigurationRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteMeetingRequestToJson(
        DeleteMeetingRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeletePhoneNumberRequestToJson(
        DeletePhoneNumberRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteProxySessionRequestToJson(
        DeleteProxySessionRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteRoomMembershipRequestToJson(
        DeleteRoomMembershipRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteRoomRequestToJson(DeleteRoomRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteVoiceConnectorGroupRequestToJson(
        DeleteVoiceConnectorGroupRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteVoiceConnectorOriginationRequestToJson(
        DeleteVoiceConnectorOriginationRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteVoiceConnectorProxyRequestToJson(
        DeleteVoiceConnectorProxyRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteVoiceConnectorRequestToJson(
        DeleteVoiceConnectorRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteVoiceConnectorStreamingConfigurationRequestToJson(
        DeleteVoiceConnectorStreamingConfigurationRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DeleteVoiceConnectorTerminationCredentialsRequestToJson(
    DeleteVoiceConnectorTerminationCredentialsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Usernames', instance.usernames);
  return val;
}

Map<String, dynamic> _$DeleteVoiceConnectorTerminationRequestToJson(
        DeleteVoiceConnectorTerminationRequest instance) =>
    <String, dynamic>{};

Map<String, dynamic> _$DisassociatePhoneNumberFromUserRequestToJson(
        DisassociatePhoneNumberFromUserRequest instance) =>
    <String, dynamic>{};

DisassociatePhoneNumberFromUserResponse
    _$DisassociatePhoneNumberFromUserResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociatePhoneNumberFromUserResponse();
}

Map<String, dynamic>
    _$DisassociatePhoneNumbersFromVoiceConnectorGroupRequestToJson(
        DisassociatePhoneNumbersFromVoiceConnectorGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('E164PhoneNumbers', instance.e164PhoneNumbers);
  return val;
}

DisassociatePhoneNumbersFromVoiceConnectorGroupResponse
    _$DisassociatePhoneNumbersFromVoiceConnectorGroupResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociatePhoneNumbersFromVoiceConnectorGroupResponse(
    phoneNumberErrors: (json['PhoneNumberErrors'] as List)
        ?.map((e) => e == null
            ? null
            : PhoneNumberError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DisassociatePhoneNumbersFromVoiceConnectorRequestToJson(
    DisassociatePhoneNumbersFromVoiceConnectorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('E164PhoneNumbers', instance.e164PhoneNumbers);
  return val;
}

DisassociatePhoneNumbersFromVoiceConnectorResponse
    _$DisassociatePhoneNumbersFromVoiceConnectorResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociatePhoneNumbersFromVoiceConnectorResponse(
    phoneNumberErrors: (json['PhoneNumberErrors'] as List)
        ?.map((e) => e == null
            ? null
            : PhoneNumberError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DisassociateSigninDelegateGroupsFromAccountRequestToJson(
    DisassociateSigninDelegateGroupsFromAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupNames', instance.groupNames);
  return val;
}

DisassociateSigninDelegateGroupsFromAccountResponse
    _$DisassociateSigninDelegateGroupsFromAccountResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateSigninDelegateGroupsFromAccountResponse();
}

EventsConfiguration _$EventsConfigurationFromJson(Map<String, dynamic> json) {
  return EventsConfiguration(
    botId: json['BotId'] as String,
    lambdaFunctionArn: json['LambdaFunctionArn'] as String,
    outboundEventsHTTPSEndpoint: json['OutboundEventsHTTPSEndpoint'] as String,
  );
}

GeoMatchParams _$GeoMatchParamsFromJson(Map<String, dynamic> json) {
  return GeoMatchParams(
    areaCode: json['AreaCode'] as String,
    country: json['Country'] as String,
  );
}

Map<String, dynamic> _$GeoMatchParamsToJson(GeoMatchParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AreaCode', instance.areaCode);
  writeNotNull('Country', instance.country);
  return val;
}

GetAccountResponse _$GetAccountResponseFromJson(Map<String, dynamic> json) {
  return GetAccountResponse(
    account: json['Account'] == null
        ? null
        : Account.fromJson(json['Account'] as Map<String, dynamic>),
  );
}

GetAccountSettingsResponse _$GetAccountSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return GetAccountSettingsResponse(
    accountSettings: json['AccountSettings'] == null
        ? null
        : AccountSettings.fromJson(
            json['AccountSettings'] as Map<String, dynamic>),
  );
}

GetAttendeeResponse _$GetAttendeeResponseFromJson(Map<String, dynamic> json) {
  return GetAttendeeResponse(
    attendee: json['Attendee'] == null
        ? null
        : Attendee.fromJson(json['Attendee'] as Map<String, dynamic>),
  );
}

GetBotResponse _$GetBotResponseFromJson(Map<String, dynamic> json) {
  return GetBotResponse(
    bot: json['Bot'] == null
        ? null
        : Bot.fromJson(json['Bot'] as Map<String, dynamic>),
  );
}

GetEventsConfigurationResponse _$GetEventsConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return GetEventsConfigurationResponse(
    eventsConfiguration: json['EventsConfiguration'] == null
        ? null
        : EventsConfiguration.fromJson(
            json['EventsConfiguration'] as Map<String, dynamic>),
  );
}

GetGlobalSettingsResponse _$GetGlobalSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return GetGlobalSettingsResponse(
    businessCalling: json['BusinessCalling'] == null
        ? null
        : BusinessCallingSettings.fromJson(
            json['BusinessCalling'] as Map<String, dynamic>),
    voiceConnector: json['VoiceConnector'] == null
        ? null
        : VoiceConnectorSettings.fromJson(
            json['VoiceConnector'] as Map<String, dynamic>),
  );
}

GetMeetingResponse _$GetMeetingResponseFromJson(Map<String, dynamic> json) {
  return GetMeetingResponse(
    meeting: json['Meeting'] == null
        ? null
        : Meeting.fromJson(json['Meeting'] as Map<String, dynamic>),
  );
}

GetPhoneNumberOrderResponse _$GetPhoneNumberOrderResponseFromJson(
    Map<String, dynamic> json) {
  return GetPhoneNumberOrderResponse(
    phoneNumberOrder: json['PhoneNumberOrder'] == null
        ? null
        : PhoneNumberOrder.fromJson(
            json['PhoneNumberOrder'] as Map<String, dynamic>),
  );
}

GetPhoneNumberResponse _$GetPhoneNumberResponseFromJson(
    Map<String, dynamic> json) {
  return GetPhoneNumberResponse(
    phoneNumber: json['PhoneNumber'] == null
        ? null
        : PhoneNumber.fromJson(json['PhoneNumber'] as Map<String, dynamic>),
  );
}

GetPhoneNumberSettingsResponse _$GetPhoneNumberSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return GetPhoneNumberSettingsResponse(
    callingName: json['CallingName'] as String,
    callingNameUpdatedTimestamp:
        iso8601FromJson(json['CallingNameUpdatedTimestamp'] as String),
  );
}

GetProxySessionResponse _$GetProxySessionResponseFromJson(
    Map<String, dynamic> json) {
  return GetProxySessionResponse(
    proxySession: json['ProxySession'] == null
        ? null
        : ProxySession.fromJson(json['ProxySession'] as Map<String, dynamic>),
  );
}

GetRoomResponse _$GetRoomResponseFromJson(Map<String, dynamic> json) {
  return GetRoomResponse(
    room: json['Room'] == null
        ? null
        : Room.fromJson(json['Room'] as Map<String, dynamic>),
  );
}

GetUserResponse _$GetUserResponseFromJson(Map<String, dynamic> json) {
  return GetUserResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

GetUserSettingsResponse _$GetUserSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return GetUserSettingsResponse(
    userSettings: json['UserSettings'] == null
        ? null
        : UserSettings.fromJson(json['UserSettings'] as Map<String, dynamic>),
  );
}

GetVoiceConnectorGroupResponse _$GetVoiceConnectorGroupResponseFromJson(
    Map<String, dynamic> json) {
  return GetVoiceConnectorGroupResponse(
    voiceConnectorGroup: json['VoiceConnectorGroup'] == null
        ? null
        : VoiceConnectorGroup.fromJson(
            json['VoiceConnectorGroup'] as Map<String, dynamic>),
  );
}

GetVoiceConnectorLoggingConfigurationResponse
    _$GetVoiceConnectorLoggingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return GetVoiceConnectorLoggingConfigurationResponse(
    loggingConfiguration: json['LoggingConfiguration'] == null
        ? null
        : LoggingConfiguration.fromJson(
            json['LoggingConfiguration'] as Map<String, dynamic>),
  );
}

GetVoiceConnectorOriginationResponse
    _$GetVoiceConnectorOriginationResponseFromJson(Map<String, dynamic> json) {
  return GetVoiceConnectorOriginationResponse(
    origination: json['Origination'] == null
        ? null
        : Origination.fromJson(json['Origination'] as Map<String, dynamic>),
  );
}

GetVoiceConnectorProxyResponse _$GetVoiceConnectorProxyResponseFromJson(
    Map<String, dynamic> json) {
  return GetVoiceConnectorProxyResponse(
    proxy: json['Proxy'] == null
        ? null
        : Proxy.fromJson(json['Proxy'] as Map<String, dynamic>),
  );
}

GetVoiceConnectorResponse _$GetVoiceConnectorResponseFromJson(
    Map<String, dynamic> json) {
  return GetVoiceConnectorResponse(
    voiceConnector: json['VoiceConnector'] == null
        ? null
        : VoiceConnector.fromJson(
            json['VoiceConnector'] as Map<String, dynamic>),
  );
}

GetVoiceConnectorStreamingConfigurationResponse
    _$GetVoiceConnectorStreamingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return GetVoiceConnectorStreamingConfigurationResponse(
    streamingConfiguration: json['StreamingConfiguration'] == null
        ? null
        : StreamingConfiguration.fromJson(
            json['StreamingConfiguration'] as Map<String, dynamic>),
  );
}

GetVoiceConnectorTerminationHealthResponse
    _$GetVoiceConnectorTerminationHealthResponseFromJson(
        Map<String, dynamic> json) {
  return GetVoiceConnectorTerminationHealthResponse(
    terminationHealth: json['TerminationHealth'] == null
        ? null
        : TerminationHealth.fromJson(
            json['TerminationHealth'] as Map<String, dynamic>),
  );
}

GetVoiceConnectorTerminationResponse
    _$GetVoiceConnectorTerminationResponseFromJson(Map<String, dynamic> json) {
  return GetVoiceConnectorTerminationResponse(
    termination: json['Termination'] == null
        ? null
        : Termination.fromJson(json['Termination'] as Map<String, dynamic>),
  );
}

Invite _$InviteFromJson(Map<String, dynamic> json) {
  return Invite(
    emailAddress: json['EmailAddress'] as String,
    emailStatus:
        _$enumDecodeNullable(_$EmailStatusEnumMap, json['EmailStatus']),
    inviteId: json['InviteId'] as String,
    status: _$enumDecodeNullable(_$InviteStatusEnumMap, json['Status']),
  );
}

const _$EmailStatusEnumMap = {
  EmailStatus.notSent: 'NotSent',
  EmailStatus.sent: 'Sent',
  EmailStatus.failed: 'Failed',
};

const _$InviteStatusEnumMap = {
  InviteStatus.pending: 'Pending',
  InviteStatus.accepted: 'Accepted',
  InviteStatus.failed: 'Failed',
};

Map<String, dynamic> _$InviteUsersRequestToJson(InviteUsersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UserEmailList', instance.userEmailList);
  writeNotNull('UserType', _$UserTypeEnumMap[instance.userType]);
  return val;
}

InviteUsersResponse _$InviteUsersResponseFromJson(Map<String, dynamic> json) {
  return InviteUsersResponse(
    invites: (json['Invites'] as List)
        ?.map((e) =>
            e == null ? null : Invite.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListAccountsResponse _$ListAccountsResponseFromJson(Map<String, dynamic> json) {
  return ListAccountsResponse(
    accounts: (json['Accounts'] as List)
        ?.map((e) =>
            e == null ? null : Account.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListAttendeeTagsResponse _$ListAttendeeTagsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAttendeeTagsResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListAttendeesResponse _$ListAttendeesResponseFromJson(
    Map<String, dynamic> json) {
  return ListAttendeesResponse(
    attendees: (json['Attendees'] as List)
        ?.map((e) =>
            e == null ? null : Attendee.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListBotsResponse _$ListBotsResponseFromJson(Map<String, dynamic> json) {
  return ListBotsResponse(
    bots: (json['Bots'] as List)
        ?.map((e) => e == null ? null : Bot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMeetingTagsResponse _$ListMeetingTagsResponseFromJson(
    Map<String, dynamic> json) {
  return ListMeetingTagsResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListMeetingsResponse _$ListMeetingsResponseFromJson(Map<String, dynamic> json) {
  return ListMeetingsResponse(
    meetings: (json['Meetings'] as List)
        ?.map((e) =>
            e == null ? null : Meeting.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListPhoneNumberOrdersResponse _$ListPhoneNumberOrdersResponseFromJson(
    Map<String, dynamic> json) {
  return ListPhoneNumberOrdersResponse(
    nextToken: json['NextToken'] as String,
    phoneNumberOrders: (json['PhoneNumberOrders'] as List)
        ?.map((e) => e == null
            ? null
            : PhoneNumberOrder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListPhoneNumbersResponse _$ListPhoneNumbersResponseFromJson(
    Map<String, dynamic> json) {
  return ListPhoneNumbersResponse(
    nextToken: json['NextToken'] as String,
    phoneNumbers: (json['PhoneNumbers'] as List)
        ?.map((e) =>
            e == null ? null : PhoneNumber.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListProxySessionsResponse _$ListProxySessionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListProxySessionsResponse(
    nextToken: json['NextToken'] as String,
    proxySessions: (json['ProxySessions'] as List)
        ?.map((e) =>
            e == null ? null : ProxySession.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRoomMembershipsResponse _$ListRoomMembershipsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRoomMembershipsResponse(
    nextToken: json['NextToken'] as String,
    roomMemberships: (json['RoomMemberships'] as List)
        ?.map((e) => e == null
            ? null
            : RoomMembership.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRoomsResponse _$ListRoomsResponseFromJson(Map<String, dynamic> json) {
  return ListRoomsResponse(
    nextToken: json['NextToken'] as String,
    rooms: (json['Rooms'] as List)
        ?.map(
            (e) => e == null ? null : Room.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListUsersResponse _$ListUsersResponseFromJson(Map<String, dynamic> json) {
  return ListUsersResponse(
    nextToken: json['NextToken'] as String,
    users: (json['Users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListVoiceConnectorGroupsResponse _$ListVoiceConnectorGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListVoiceConnectorGroupsResponse(
    nextToken: json['NextToken'] as String,
    voiceConnectorGroups: (json['VoiceConnectorGroups'] as List)
        ?.map((e) => e == null
            ? null
            : VoiceConnectorGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListVoiceConnectorTerminationCredentialsResponse
    _$ListVoiceConnectorTerminationCredentialsResponseFromJson(
        Map<String, dynamic> json) {
  return ListVoiceConnectorTerminationCredentialsResponse(
    usernames: (json['Usernames'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListVoiceConnectorsResponse _$ListVoiceConnectorsResponseFromJson(
    Map<String, dynamic> json) {
  return ListVoiceConnectorsResponse(
    nextToken: json['NextToken'] as String,
    voiceConnectors: (json['VoiceConnectors'] as List)
        ?.map((e) => e == null
            ? null
            : VoiceConnector.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LoggingConfiguration _$LoggingConfigurationFromJson(Map<String, dynamic> json) {
  return LoggingConfiguration(
    enableSIPLogs: json['EnableSIPLogs'] as bool,
  );
}

Map<String, dynamic> _$LoggingConfigurationToJson(
    LoggingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EnableSIPLogs', instance.enableSIPLogs);
  return val;
}

Map<String, dynamic> _$LogoutUserRequestToJson(LogoutUserRequest instance) =>
    <String, dynamic>{};

LogoutUserResponse _$LogoutUserResponseFromJson(Map<String, dynamic> json) {
  return LogoutUserResponse();
}

MediaPlacement _$MediaPlacementFromJson(Map<String, dynamic> json) {
  return MediaPlacement(
    audioFallbackUrl: json['AudioFallbackUrl'] as String,
    audioHostUrl: json['AudioHostUrl'] as String,
    screenDataUrl: json['ScreenDataUrl'] as String,
    screenSharingUrl: json['ScreenSharingUrl'] as String,
    screenViewingUrl: json['ScreenViewingUrl'] as String,
    signalingUrl: json['SignalingUrl'] as String,
    turnControlUrl: json['TurnControlUrl'] as String,
  );
}

Meeting _$MeetingFromJson(Map<String, dynamic> json) {
  return Meeting(
    externalMeetingId: json['ExternalMeetingId'] as String,
    mediaPlacement: json['MediaPlacement'] == null
        ? null
        : MediaPlacement.fromJson(
            json['MediaPlacement'] as Map<String, dynamic>),
    mediaRegion: json['MediaRegion'] as String,
    meetingId: json['MeetingId'] as String,
  );
}

Map<String, dynamic> _$MeetingNotificationConfigurationToJson(
    MeetingNotificationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SnsTopicArn', instance.snsTopicArn);
  writeNotNull('SqsQueueArn', instance.sqsQueueArn);
  return val;
}

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    accountId: json['AccountId'] as String,
    email: json['Email'] as String,
    fullName: json['FullName'] as String,
    memberId: json['MemberId'] as String,
    memberType: _$enumDecodeNullable(_$MemberTypeEnumMap, json['MemberType']),
  );
}

const _$MemberTypeEnumMap = {
  MemberType.user: 'User',
  MemberType.bot: 'Bot',
  MemberType.webhook: 'Webhook',
};

MemberError _$MemberErrorFromJson(Map<String, dynamic> json) {
  return MemberError(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
    memberId: json['MemberId'] as String,
  );
}

const _$ErrorCodeEnumMap = {
  ErrorCode.badRequest: 'BadRequest',
  ErrorCode.conflict: 'Conflict',
  ErrorCode.forbidden: 'Forbidden',
  ErrorCode.notFound: 'NotFound',
  ErrorCode.preconditionFailed: 'PreconditionFailed',
  ErrorCode.resourceLimitExceeded: 'ResourceLimitExceeded',
  ErrorCode.serviceFailure: 'ServiceFailure',
  ErrorCode.accessDenied: 'AccessDenied',
  ErrorCode.serviceUnavailable: 'ServiceUnavailable',
  ErrorCode.throttled: 'Throttled',
  ErrorCode.unauthorized: 'Unauthorized',
  ErrorCode.unprocessable: 'Unprocessable',
  ErrorCode.voiceConnectorGroupAssociationsExist:
      'VoiceConnectorGroupAssociationsExist',
  ErrorCode.phoneNumberAssociationsExist: 'PhoneNumberAssociationsExist',
};

Map<String, dynamic> _$MembershipItemToJson(MembershipItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MemberId', instance.memberId);
  writeNotNull('Role', _$RoomMembershipRoleEnumMap[instance.role]);
  return val;
}

OrderedPhoneNumber _$OrderedPhoneNumberFromJson(Map<String, dynamic> json) {
  return OrderedPhoneNumber(
    e164PhoneNumber: json['E164PhoneNumber'] as String,
    status:
        _$enumDecodeNullable(_$OrderedPhoneNumberStatusEnumMap, json['Status']),
  );
}

const _$OrderedPhoneNumberStatusEnumMap = {
  OrderedPhoneNumberStatus.processing: 'Processing',
  OrderedPhoneNumberStatus.acquired: 'Acquired',
  OrderedPhoneNumberStatus.failed: 'Failed',
};

Origination _$OriginationFromJson(Map<String, dynamic> json) {
  return Origination(
    disabled: json['Disabled'] as bool,
    routes: (json['Routes'] as List)
        ?.map((e) => e == null
            ? null
            : OriginationRoute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OriginationToJson(Origination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Disabled', instance.disabled);
  writeNotNull('Routes', instance.routes?.map((e) => e?.toJson())?.toList());
  return val;
}

OriginationRoute _$OriginationRouteFromJson(Map<String, dynamic> json) {
  return OriginationRoute(
    host: json['Host'] as String,
    port: json['Port'] as int,
    priority: json['Priority'] as int,
    protocol: _$enumDecodeNullable(
        _$OriginationRouteProtocolEnumMap, json['Protocol']),
    weight: json['Weight'] as int,
  );
}

Map<String, dynamic> _$OriginationRouteToJson(OriginationRoute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Host', instance.host);
  writeNotNull('Port', instance.port);
  writeNotNull('Priority', instance.priority);
  writeNotNull(
      'Protocol', _$OriginationRouteProtocolEnumMap[instance.protocol]);
  writeNotNull('Weight', instance.weight);
  return val;
}

const _$OriginationRouteProtocolEnumMap = {
  OriginationRouteProtocol.tcp: 'TCP',
  OriginationRouteProtocol.udp: 'UDP',
};

Participant _$ParticipantFromJson(Map<String, dynamic> json) {
  return Participant(
    phoneNumber: json['PhoneNumber'] as String,
    proxyPhoneNumber: json['ProxyPhoneNumber'] as String,
  );
}

PhoneNumber _$PhoneNumberFromJson(Map<String, dynamic> json) {
  return PhoneNumber(
    associations: (json['Associations'] as List)
        ?.map((e) => e == null
            ? null
            : PhoneNumberAssociation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    callingName: json['CallingName'] as String,
    callingNameStatus: _$enumDecodeNullable(
        _$CallingNameStatusEnumMap, json['CallingNameStatus']),
    capabilities: json['Capabilities'] == null
        ? null
        : PhoneNumberCapabilities.fromJson(
            json['Capabilities'] as Map<String, dynamic>),
    createdTimestamp: iso8601FromJson(json['CreatedTimestamp'] as String),
    deletionTimestamp: iso8601FromJson(json['DeletionTimestamp'] as String),
    e164PhoneNumber: json['E164PhoneNumber'] as String,
    phoneNumberId: json['PhoneNumberId'] as String,
    productType: _$enumDecodeNullable(
        _$PhoneNumberProductTypeEnumMap, json['ProductType']),
    status: _$enumDecodeNullable(_$PhoneNumberStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$PhoneNumberTypeEnumMap, json['Type']),
    updatedTimestamp: iso8601FromJson(json['UpdatedTimestamp'] as String),
  );
}

const _$CallingNameStatusEnumMap = {
  CallingNameStatus.unassigned: 'Unassigned',
  CallingNameStatus.updateInProgress: 'UpdateInProgress',
  CallingNameStatus.updateSucceeded: 'UpdateSucceeded',
  CallingNameStatus.updateFailed: 'UpdateFailed',
};

const _$PhoneNumberStatusEnumMap = {
  PhoneNumberStatus.acquireInProgress: 'AcquireInProgress',
  PhoneNumberStatus.acquireFailed: 'AcquireFailed',
  PhoneNumberStatus.unassigned: 'Unassigned',
  PhoneNumberStatus.assigned: 'Assigned',
  PhoneNumberStatus.releaseInProgress: 'ReleaseInProgress',
  PhoneNumberStatus.deleteInProgress: 'DeleteInProgress',
  PhoneNumberStatus.releaseFailed: 'ReleaseFailed',
  PhoneNumberStatus.deleteFailed: 'DeleteFailed',
};

const _$PhoneNumberTypeEnumMap = {
  PhoneNumberType.local: 'Local',
  PhoneNumberType.tollFree: 'TollFree',
};

PhoneNumberAssociation _$PhoneNumberAssociationFromJson(
    Map<String, dynamic> json) {
  return PhoneNumberAssociation(
    associatedTimestamp: iso8601FromJson(json['AssociatedTimestamp'] as String),
    name:
        _$enumDecodeNullable(_$PhoneNumberAssociationNameEnumMap, json['Name']),
    value: json['Value'] as String,
  );
}

const _$PhoneNumberAssociationNameEnumMap = {
  PhoneNumberAssociationName.accountId: 'AccountId',
  PhoneNumberAssociationName.userId: 'UserId',
  PhoneNumberAssociationName.voiceConnectorId: 'VoiceConnectorId',
  PhoneNumberAssociationName.voiceConnectorGroupId: 'VoiceConnectorGroupId',
};

PhoneNumberCapabilities _$PhoneNumberCapabilitiesFromJson(
    Map<String, dynamic> json) {
  return PhoneNumberCapabilities(
    inboundCall: json['InboundCall'] as bool,
    inboundMMS: json['InboundMMS'] as bool,
    inboundSMS: json['InboundSMS'] as bool,
    outboundCall: json['OutboundCall'] as bool,
    outboundMMS: json['OutboundMMS'] as bool,
    outboundSMS: json['OutboundSMS'] as bool,
  );
}

PhoneNumberError _$PhoneNumberErrorFromJson(Map<String, dynamic> json) {
  return PhoneNumberError(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
    phoneNumberId: json['PhoneNumberId'] as String,
  );
}

PhoneNumberOrder _$PhoneNumberOrderFromJson(Map<String, dynamic> json) {
  return PhoneNumberOrder(
    createdTimestamp: iso8601FromJson(json['CreatedTimestamp'] as String),
    orderedPhoneNumbers: (json['OrderedPhoneNumbers'] as List)
        ?.map((e) => e == null
            ? null
            : OrderedPhoneNumber.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    phoneNumberOrderId: json['PhoneNumberOrderId'] as String,
    productType: _$enumDecodeNullable(
        _$PhoneNumberProductTypeEnumMap, json['ProductType']),
    status:
        _$enumDecodeNullable(_$PhoneNumberOrderStatusEnumMap, json['Status']),
    updatedTimestamp: iso8601FromJson(json['UpdatedTimestamp'] as String),
  );
}

const _$PhoneNumberOrderStatusEnumMap = {
  PhoneNumberOrderStatus.processing: 'Processing',
  PhoneNumberOrderStatus.successful: 'Successful',
  PhoneNumberOrderStatus.failed: 'Failed',
  PhoneNumberOrderStatus.partial: 'Partial',
};

Proxy _$ProxyFromJson(Map<String, dynamic> json) {
  return Proxy(
    defaultSessionExpiryMinutes: json['DefaultSessionExpiryMinutes'] as int,
    disabled: json['Disabled'] as bool,
    fallBackPhoneNumber: json['FallBackPhoneNumber'] as String,
    phoneNumberCountries: (json['PhoneNumberCountries'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

ProxySession _$ProxySessionFromJson(Map<String, dynamic> json) {
  return ProxySession(
    capabilities:
        (json['Capabilities'] as List)?.map((e) => e as String)?.toList(),
    createdTimestamp: iso8601FromJson(json['CreatedTimestamp'] as String),
    endedTimestamp: iso8601FromJson(json['EndedTimestamp'] as String),
    expiryMinutes: json['ExpiryMinutes'] as int,
    geoMatchLevel:
        _$enumDecodeNullable(_$GeoMatchLevelEnumMap, json['GeoMatchLevel']),
    geoMatchParams: json['GeoMatchParams'] == null
        ? null
        : GeoMatchParams.fromJson(
            json['GeoMatchParams'] as Map<String, dynamic>),
    name: json['Name'] as String,
    numberSelectionBehavior: _$enumDecodeNullable(
        _$NumberSelectionBehaviorEnumMap, json['NumberSelectionBehavior']),
    participants: (json['Participants'] as List)
        ?.map((e) =>
            e == null ? null : Participant.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    proxySessionId: json['ProxySessionId'] as String,
    status: _$enumDecodeNullable(_$ProxySessionStatusEnumMap, json['Status']),
    updatedTimestamp: iso8601FromJson(json['UpdatedTimestamp'] as String),
    voiceConnectorId: json['VoiceConnectorId'] as String,
  );
}

const _$ProxySessionStatusEnumMap = {
  ProxySessionStatus.open: 'Open',
  ProxySessionStatus.inProgress: 'InProgress',
  ProxySessionStatus.closed: 'Closed',
};

Map<String, dynamic> _$PutEventsConfigurationRequestToJson(
    PutEventsConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LambdaFunctionArn', instance.lambdaFunctionArn);
  writeNotNull(
      'OutboundEventsHTTPSEndpoint', instance.outboundEventsHTTPSEndpoint);
  return val;
}

PutEventsConfigurationResponse _$PutEventsConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return PutEventsConfigurationResponse(
    eventsConfiguration: json['EventsConfiguration'] == null
        ? null
        : EventsConfiguration.fromJson(
            json['EventsConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutVoiceConnectorLoggingConfigurationRequestToJson(
    PutVoiceConnectorLoggingConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LoggingConfiguration', instance.loggingConfiguration?.toJson());
  return val;
}

PutVoiceConnectorLoggingConfigurationResponse
    _$PutVoiceConnectorLoggingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return PutVoiceConnectorLoggingConfigurationResponse(
    loggingConfiguration: json['LoggingConfiguration'] == null
        ? null
        : LoggingConfiguration.fromJson(
            json['LoggingConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutVoiceConnectorOriginationRequestToJson(
    PutVoiceConnectorOriginationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Origination', instance.origination?.toJson());
  return val;
}

PutVoiceConnectorOriginationResponse
    _$PutVoiceConnectorOriginationResponseFromJson(Map<String, dynamic> json) {
  return PutVoiceConnectorOriginationResponse(
    origination: json['Origination'] == null
        ? null
        : Origination.fromJson(json['Origination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutVoiceConnectorProxyRequestToJson(
    PutVoiceConnectorProxyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DefaultSessionExpiryMinutes', instance.defaultSessionExpiryMinutes);
  writeNotNull('PhoneNumberPoolCountries', instance.phoneNumberPoolCountries);
  writeNotNull('Disabled', instance.disabled);
  writeNotNull('FallBackPhoneNumber', instance.fallBackPhoneNumber);
  return val;
}

PutVoiceConnectorProxyResponse _$PutVoiceConnectorProxyResponseFromJson(
    Map<String, dynamic> json) {
  return PutVoiceConnectorProxyResponse(
    proxy: json['Proxy'] == null
        ? null
        : Proxy.fromJson(json['Proxy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutVoiceConnectorStreamingConfigurationRequestToJson(
    PutVoiceConnectorStreamingConfigurationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'StreamingConfiguration', instance.streamingConfiguration?.toJson());
  return val;
}

PutVoiceConnectorStreamingConfigurationResponse
    _$PutVoiceConnectorStreamingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return PutVoiceConnectorStreamingConfigurationResponse(
    streamingConfiguration: json['StreamingConfiguration'] == null
        ? null
        : StreamingConfiguration.fromJson(
            json['StreamingConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutVoiceConnectorTerminationCredentialsRequestToJson(
    PutVoiceConnectorTerminationCredentialsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Credentials', instance.credentials?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$PutVoiceConnectorTerminationRequestToJson(
    PutVoiceConnectorTerminationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Termination', instance.termination?.toJson());
  return val;
}

PutVoiceConnectorTerminationResponse
    _$PutVoiceConnectorTerminationResponseFromJson(Map<String, dynamic> json) {
  return PutVoiceConnectorTerminationResponse(
    termination: json['Termination'] == null
        ? null
        : Termination.fromJson(json['Termination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RegenerateSecurityTokenRequestToJson(
        RegenerateSecurityTokenRequest instance) =>
    <String, dynamic>{};

RegenerateSecurityTokenResponse _$RegenerateSecurityTokenResponseFromJson(
    Map<String, dynamic> json) {
  return RegenerateSecurityTokenResponse(
    bot: json['Bot'] == null
        ? null
        : Bot.fromJson(json['Bot'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResetPersonalPINRequestToJson(
        ResetPersonalPINRequest instance) =>
    <String, dynamic>{};

ResetPersonalPINResponse _$ResetPersonalPINResponseFromJson(
    Map<String, dynamic> json) {
  return ResetPersonalPINResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RestorePhoneNumberRequestToJson(
        RestorePhoneNumberRequest instance) =>
    <String, dynamic>{};

RestorePhoneNumberResponse _$RestorePhoneNumberResponseFromJson(
    Map<String, dynamic> json) {
  return RestorePhoneNumberResponse(
    phoneNumber: json['PhoneNumber'] == null
        ? null
        : PhoneNumber.fromJson(json['PhoneNumber'] as Map<String, dynamic>),
  );
}

Room _$RoomFromJson(Map<String, dynamic> json) {
  return Room(
    accountId: json['AccountId'] as String,
    createdBy: json['CreatedBy'] as String,
    createdTimestamp: iso8601FromJson(json['CreatedTimestamp'] as String),
    name: json['Name'] as String,
    roomId: json['RoomId'] as String,
    updatedTimestamp: iso8601FromJson(json['UpdatedTimestamp'] as String),
  );
}

RoomMembership _$RoomMembershipFromJson(Map<String, dynamic> json) {
  return RoomMembership(
    invitedBy: json['InvitedBy'] as String,
    member: json['Member'] == null
        ? null
        : Member.fromJson(json['Member'] as Map<String, dynamic>),
    role: _$enumDecodeNullable(_$RoomMembershipRoleEnumMap, json['Role']),
    roomId: json['RoomId'] as String,
    updatedTimestamp: iso8601FromJson(json['UpdatedTimestamp'] as String),
  );
}

SearchAvailablePhoneNumbersResponse
    _$SearchAvailablePhoneNumbersResponseFromJson(Map<String, dynamic> json) {
  return SearchAvailablePhoneNumbersResponse(
    e164PhoneNumbers:
        (json['E164PhoneNumbers'] as List)?.map((e) => e as String)?.toList(),
  );
}

SigninDelegateGroup _$SigninDelegateGroupFromJson(Map<String, dynamic> json) {
  return SigninDelegateGroup(
    groupName: json['GroupName'] as String,
  );
}

Map<String, dynamic> _$SigninDelegateGroupToJson(SigninDelegateGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('GroupName', instance.groupName);
  return val;
}

StreamingConfiguration _$StreamingConfigurationFromJson(
    Map<String, dynamic> json) {
  return StreamingConfiguration(
    dataRetentionInHours: json['DataRetentionInHours'] as int,
    disabled: json['Disabled'] as bool,
  );
}

Map<String, dynamic> _$StreamingConfigurationToJson(
    StreamingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataRetentionInHours', instance.dataRetentionInHours);
  writeNotNull('Disabled', instance.disabled);
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

Map<String, dynamic> _$TagAttendeeRequestToJson(TagAttendeeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$TagMeetingRequestToJson(TagMeetingRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TelephonySettings _$TelephonySettingsFromJson(Map<String, dynamic> json) {
  return TelephonySettings(
    inboundCalling: json['InboundCalling'] as bool,
    outboundCalling: json['OutboundCalling'] as bool,
    sms: json['SMS'] as bool,
  );
}

Map<String, dynamic> _$TelephonySettingsToJson(TelephonySettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InboundCalling', instance.inboundCalling);
  writeNotNull('OutboundCalling', instance.outboundCalling);
  writeNotNull('SMS', instance.sms);
  return val;
}

Termination _$TerminationFromJson(Map<String, dynamic> json) {
  return Termination(
    callingRegions:
        (json['CallingRegions'] as List)?.map((e) => e as String)?.toList(),
    cidrAllowedList:
        (json['CidrAllowedList'] as List)?.map((e) => e as String)?.toList(),
    cpsLimit: json['CpsLimit'] as int,
    defaultPhoneNumber: json['DefaultPhoneNumber'] as String,
    disabled: json['Disabled'] as bool,
  );
}

Map<String, dynamic> _$TerminationToJson(Termination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CallingRegions', instance.callingRegions);
  writeNotNull('CidrAllowedList', instance.cidrAllowedList);
  writeNotNull('CpsLimit', instance.cpsLimit);
  writeNotNull('DefaultPhoneNumber', instance.defaultPhoneNumber);
  writeNotNull('Disabled', instance.disabled);
  return val;
}

TerminationHealth _$TerminationHealthFromJson(Map<String, dynamic> json) {
  return TerminationHealth(
    source: json['Source'] as String,
    timestamp: iso8601FromJson(json['Timestamp'] as String),
  );
}

Map<String, dynamic> _$UntagAttendeeRequestToJson(
    UntagAttendeeRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

Map<String, dynamic> _$UntagMeetingRequestToJson(UntagMeetingRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

Map<String, dynamic> _$UntagResourceRequestToJson(
    UntagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

Map<String, dynamic> _$UpdateAccountRequestToJson(
    UpdateAccountRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

UpdateAccountResponse _$UpdateAccountResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAccountResponse(
    account: json['Account'] == null
        ? null
        : Account.fromJson(json['Account'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateAccountSettingsRequestToJson(
    UpdateAccountSettingsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountSettings', instance.accountSettings?.toJson());
  return val;
}

UpdateAccountSettingsResponse _$UpdateAccountSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAccountSettingsResponse();
}

Map<String, dynamic> _$UpdateBotRequestToJson(UpdateBotRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Disabled', instance.disabled);
  return val;
}

UpdateBotResponse _$UpdateBotResponseFromJson(Map<String, dynamic> json) {
  return UpdateBotResponse(
    bot: json['Bot'] == null
        ? null
        : Bot.fromJson(json['Bot'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateGlobalSettingsRequestToJson(
    UpdateGlobalSettingsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BusinessCalling', instance.businessCalling?.toJson());
  writeNotNull('VoiceConnector', instance.voiceConnector?.toJson());
  return val;
}

Map<String, dynamic> _$UpdatePhoneNumberRequestToJson(
    UpdatePhoneNumberRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CallingName', instance.callingName);
  writeNotNull(
      'ProductType', _$PhoneNumberProductTypeEnumMap[instance.productType]);
  return val;
}

Map<String, dynamic> _$UpdatePhoneNumberRequestItemToJson(
    UpdatePhoneNumberRequestItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PhoneNumberId', instance.phoneNumberId);
  writeNotNull('CallingName', instance.callingName);
  writeNotNull(
      'ProductType', _$PhoneNumberProductTypeEnumMap[instance.productType]);
  return val;
}

UpdatePhoneNumberResponse _$UpdatePhoneNumberResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePhoneNumberResponse(
    phoneNumber: json['PhoneNumber'] == null
        ? null
        : PhoneNumber.fromJson(json['PhoneNumber'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdatePhoneNumberSettingsRequestToJson(
    UpdatePhoneNumberSettingsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CallingName', instance.callingName);
  return val;
}

Map<String, dynamic> _$UpdateProxySessionRequestToJson(
    UpdateProxySessionRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Capabilities', instance.capabilities);
  writeNotNull('ExpiryMinutes', instance.expiryMinutes);
  return val;
}

UpdateProxySessionResponse _$UpdateProxySessionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProxySessionResponse(
    proxySession: json['ProxySession'] == null
        ? null
        : ProxySession.fromJson(json['ProxySession'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateRoomMembershipRequestToJson(
    UpdateRoomMembershipRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Role', _$RoomMembershipRoleEnumMap[instance.role]);
  return val;
}

UpdateRoomMembershipResponse _$UpdateRoomMembershipResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRoomMembershipResponse(
    roomMembership: json['RoomMembership'] == null
        ? null
        : RoomMembership.fromJson(
            json['RoomMembership'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateRoomRequestToJson(UpdateRoomRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

UpdateRoomResponse _$UpdateRoomResponseFromJson(Map<String, dynamic> json) {
  return UpdateRoomResponse(
    room: json['Room'] == null
        ? null
        : Room.fromJson(json['Room'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AlexaForBusinessMetadata', instance.alexaForBusinessMetadata?.toJson());
  writeNotNull('LicenseType', _$LicenseEnumMap[instance.licenseType]);
  writeNotNull('UserType', _$UserTypeEnumMap[instance.userType]);
  return val;
}

Map<String, dynamic> _$UpdateUserRequestItemToJson(
    UpdateUserRequestItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UserId', instance.userId);
  writeNotNull(
      'AlexaForBusinessMetadata', instance.alexaForBusinessMetadata?.toJson());
  writeNotNull('LicenseType', _$LicenseEnumMap[instance.licenseType]);
  writeNotNull('UserType', _$UserTypeEnumMap[instance.userType]);
  return val;
}

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) {
  return UpdateUserResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateUserSettingsRequestToJson(
    UpdateUserSettingsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UserSettings', instance.userSettings?.toJson());
  return val;
}

Map<String, dynamic> _$UpdateVoiceConnectorGroupRequestToJson(
    UpdateVoiceConnectorGroupRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('VoiceConnectorItems',
      instance.voiceConnectorItems?.map((e) => e?.toJson())?.toList());
  return val;
}

UpdateVoiceConnectorGroupResponse _$UpdateVoiceConnectorGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateVoiceConnectorGroupResponse(
    voiceConnectorGroup: json['VoiceConnectorGroup'] == null
        ? null
        : VoiceConnectorGroup.fromJson(
            json['VoiceConnectorGroup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateVoiceConnectorRequestToJson(
    UpdateVoiceConnectorRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('RequireEncryption', instance.requireEncryption);
  return val;
}

UpdateVoiceConnectorResponse _$UpdateVoiceConnectorResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateVoiceConnectorResponse(
    voiceConnector: json['VoiceConnector'] == null
        ? null
        : VoiceConnector.fromJson(
            json['VoiceConnector'] as Map<String, dynamic>),
  );
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userId: json['UserId'] as String,
    accountId: json['AccountId'] as String,
    alexaForBusinessMetadata: json['AlexaForBusinessMetadata'] == null
        ? null
        : AlexaForBusinessMetadata.fromJson(
            json['AlexaForBusinessMetadata'] as Map<String, dynamic>),
    displayName: json['DisplayName'] as String,
    invitedOn: iso8601FromJson(json['InvitedOn'] as String),
    licenseType: _$enumDecodeNullable(_$LicenseEnumMap, json['LicenseType']),
    personalPIN: json['PersonalPIN'] as String,
    primaryEmail: json['PrimaryEmail'] as String,
    primaryProvisionedNumber: json['PrimaryProvisionedNumber'] as String,
    registeredOn: iso8601FromJson(json['RegisteredOn'] as String),
    userInvitationStatus: _$enumDecodeNullable(
        _$InviteStatusEnumMap, json['UserInvitationStatus']),
    userRegistrationStatus: _$enumDecodeNullable(
        _$RegistrationStatusEnumMap, json['UserRegistrationStatus']),
    userType: _$enumDecodeNullable(_$UserTypeEnumMap, json['UserType']),
  );
}

const _$RegistrationStatusEnumMap = {
  RegistrationStatus.unregistered: 'Unregistered',
  RegistrationStatus.registered: 'Registered',
  RegistrationStatus.suspended: 'Suspended',
};

UserError _$UserErrorFromJson(Map<String, dynamic> json) {
  return UserError(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
    userId: json['UserId'] as String,
  );
}

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return UserSettings(
    telephony: json['Telephony'] == null
        ? null
        : TelephonySettings.fromJson(json['Telephony'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Telephony', instance.telephony?.toJson());
  return val;
}

VoiceConnector _$VoiceConnectorFromJson(Map<String, dynamic> json) {
  return VoiceConnector(
    awsRegion: _$enumDecodeNullable(
        _$VoiceConnectorAwsRegionEnumMap, json['AwsRegion']),
    createdTimestamp: iso8601FromJson(json['CreatedTimestamp'] as String),
    name: json['Name'] as String,
    outboundHostName: json['OutboundHostName'] as String,
    requireEncryption: json['RequireEncryption'] as bool,
    updatedTimestamp: iso8601FromJson(json['UpdatedTimestamp'] as String),
    voiceConnectorId: json['VoiceConnectorId'] as String,
  );
}

VoiceConnectorGroup _$VoiceConnectorGroupFromJson(Map<String, dynamic> json) {
  return VoiceConnectorGroup(
    createdTimestamp: iso8601FromJson(json['CreatedTimestamp'] as String),
    name: json['Name'] as String,
    updatedTimestamp: iso8601FromJson(json['UpdatedTimestamp'] as String),
    voiceConnectorGroupId: json['VoiceConnectorGroupId'] as String,
    voiceConnectorItems: (json['VoiceConnectorItems'] as List)
        ?.map((e) => e == null
            ? null
            : VoiceConnectorItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

VoiceConnectorItem _$VoiceConnectorItemFromJson(Map<String, dynamic> json) {
  return VoiceConnectorItem(
    priority: json['Priority'] as int,
    voiceConnectorId: json['VoiceConnectorId'] as String,
  );
}

Map<String, dynamic> _$VoiceConnectorItemToJson(VoiceConnectorItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Priority', instance.priority);
  writeNotNull('VoiceConnectorId', instance.voiceConnectorId);
  return val;
}

VoiceConnectorSettings _$VoiceConnectorSettingsFromJson(
    Map<String, dynamic> json) {
  return VoiceConnectorSettings(
    cdrBucket: json['CdrBucket'] as String,
  );
}

Map<String, dynamic> _$VoiceConnectorSettingsToJson(
    VoiceConnectorSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CdrBucket', instance.cdrBucket);
  return val;
}
