// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-05-01.dart';

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
    createdTimestamp:
        const IsoDateTimeConverter().fromJson(json['CreatedTimestamp']),
    defaultLicense:
        _$enumDecodeNullable(_$LicenseEnumMap, json['DefaultLicense']),
    signinDelegateGroups: (json['SigninDelegateGroups'] as List)
        ?.map((e) => e == null
            ? null
            : SigninDelegateGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    supportedLicenses: (json['SupportedLicenses'] as List)
        ?.map((e) => _$enumDecodeNullable(_$LicenseEnumMap, e))
        ?.toList(),
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

AppInstance _$AppInstanceFromJson(Map<String, dynamic> json) {
  return AppInstance(
    appInstanceArn: json['AppInstanceArn'] as String,
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    lastUpdatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimestamp']),
    metadata: json['Metadata'] as String,
    name: json['Name'] as String,
  );
}

AppInstanceAdmin _$AppInstanceAdminFromJson(Map<String, dynamic> json) {
  return AppInstanceAdmin(
    admin: json['Admin'] == null
        ? null
        : Identity.fromJson(json['Admin'] as Map<String, dynamic>),
    appInstanceArn: json['AppInstanceArn'] as String,
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
  );
}

AppInstanceAdminSummary _$AppInstanceAdminSummaryFromJson(
    Map<String, dynamic> json) {
  return AppInstanceAdminSummary(
    admin: json['Admin'] == null
        ? null
        : Identity.fromJson(json['Admin'] as Map<String, dynamic>),
  );
}

AppInstanceRetentionSettings _$AppInstanceRetentionSettingsFromJson(
    Map<String, dynamic> json) {
  return AppInstanceRetentionSettings(
    channelRetentionSettings: json['ChannelRetentionSettings'] == null
        ? null
        : ChannelRetentionSettings.fromJson(
            json['ChannelRetentionSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppInstanceRetentionSettingsToJson(
    AppInstanceRetentionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ChannelRetentionSettings', instance.channelRetentionSettings?.toJson());
  return val;
}

AppInstanceStreamingConfiguration _$AppInstanceStreamingConfigurationFromJson(
    Map<String, dynamic> json) {
  return AppInstanceStreamingConfiguration(
    appInstanceDataType: _$enumDecodeNullable(
        _$AppInstanceDataTypeEnumMap, json['AppInstanceDataType']),
    resourceArn: json['ResourceArn'] as String,
  );
}

Map<String, dynamic> _$AppInstanceStreamingConfigurationToJson(
    AppInstanceStreamingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AppInstanceDataType',
      _$AppInstanceDataTypeEnumMap[instance.appInstanceDataType]);
  writeNotNull('ResourceArn', instance.resourceArn);
  return val;
}

const _$AppInstanceDataTypeEnumMap = {
  AppInstanceDataType.channel: 'Channel',
  AppInstanceDataType.channelMessage: 'ChannelMessage',
};

AppInstanceSummary _$AppInstanceSummaryFromJson(Map<String, dynamic> json) {
  return AppInstanceSummary(
    appInstanceArn: json['AppInstanceArn'] as String,
    metadata: json['Metadata'] as String,
    name: json['Name'] as String,
  );
}

AppInstanceUser _$AppInstanceUserFromJson(Map<String, dynamic> json) {
  return AppInstanceUser(
    appInstanceUserArn: json['AppInstanceUserArn'] as String,
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    lastUpdatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimestamp']),
    metadata: json['Metadata'] as String,
    name: json['Name'] as String,
  );
}

AppInstanceUserMembershipSummary _$AppInstanceUserMembershipSummaryFromJson(
    Map<String, dynamic> json) {
  return AppInstanceUserMembershipSummary(
    readMarkerTimestamp:
        const UnixDateTimeConverter().fromJson(json['ReadMarkerTimestamp']),
    type: _$enumDecodeNullable(_$ChannelMembershipTypeEnumMap, json['Type']),
  );
}

const _$ChannelMembershipTypeEnumMap = {
  ChannelMembershipType.$default: 'DEFAULT',
  ChannelMembershipType.hidden: 'HIDDEN',
};

AppInstanceUserSummary _$AppInstanceUserSummaryFromJson(
    Map<String, dynamic> json) {
  return AppInstanceUserSummary(
    appInstanceUserArn: json['AppInstanceUserArn'] as String,
    metadata: json['Metadata'] as String,
    name: json['Name'] as String,
  );
}

AssociatePhoneNumberWithUserResponse
    _$AssociatePhoneNumberWithUserResponseFromJson(Map<String, dynamic> json) {
  return AssociatePhoneNumberWithUserResponse();
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

BatchCreateRoomMembershipResponse _$BatchCreateRoomMembershipResponseFromJson(
    Map<String, dynamic> json) {
  return BatchCreateRoomMembershipResponse(
    errors: (json['Errors'] as List)
        ?.map((e) =>
            e == null ? null : MemberError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
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

BatchSuspendUserResponse _$BatchSuspendUserResponseFromJson(
    Map<String, dynamic> json) {
  return BatchSuspendUserResponse(
    userErrors: (json['UserErrors'] as List)
        ?.map((e) =>
            e == null ? null : UserError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
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
    createdTimestamp:
        const IsoDateTimeConverter().fromJson(json['CreatedTimestamp']),
    disabled: json['Disabled'] as bool,
    displayName: json['DisplayName'] as String,
    securityToken: json['SecurityToken'] as String,
    updatedTimestamp:
        const IsoDateTimeConverter().fromJson(json['UpdatedTimestamp']),
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

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel(
    channelArn: json['ChannelArn'] as String,
    createdBy: json['CreatedBy'] == null
        ? null
        : Identity.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    lastMessageTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastMessageTimestamp']),
    lastUpdatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimestamp']),
    metadata: json['Metadata'] as String,
    mode: _$enumDecodeNullable(_$ChannelModeEnumMap, json['Mode']),
    name: json['Name'] as String,
    privacy: _$enumDecodeNullable(_$ChannelPrivacyEnumMap, json['Privacy']),
  );
}

const _$ChannelModeEnumMap = {
  ChannelMode.unrestricted: 'UNRESTRICTED',
  ChannelMode.restricted: 'RESTRICTED',
};

const _$ChannelPrivacyEnumMap = {
  ChannelPrivacy.public: 'PUBLIC',
  ChannelPrivacy.private: 'PRIVATE',
};

ChannelBan _$ChannelBanFromJson(Map<String, dynamic> json) {
  return ChannelBan(
    channelArn: json['ChannelArn'] as String,
    createdBy: json['CreatedBy'] == null
        ? null
        : Identity.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    member: json['Member'] == null
        ? null
        : Identity.fromJson(json['Member'] as Map<String, dynamic>),
  );
}

ChannelBanSummary _$ChannelBanSummaryFromJson(Map<String, dynamic> json) {
  return ChannelBanSummary(
    member: json['Member'] == null
        ? null
        : Identity.fromJson(json['Member'] as Map<String, dynamic>),
  );
}

ChannelMembership _$ChannelMembershipFromJson(Map<String, dynamic> json) {
  return ChannelMembership(
    channelArn: json['ChannelArn'] as String,
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    invitedBy: json['InvitedBy'] == null
        ? null
        : Identity.fromJson(json['InvitedBy'] as Map<String, dynamic>),
    lastUpdatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimestamp']),
    member: json['Member'] == null
        ? null
        : Identity.fromJson(json['Member'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$ChannelMembershipTypeEnumMap, json['Type']),
  );
}

ChannelMembershipForAppInstanceUserSummary
    _$ChannelMembershipForAppInstanceUserSummaryFromJson(
        Map<String, dynamic> json) {
  return ChannelMembershipForAppInstanceUserSummary(
    appInstanceUserMembershipSummary:
        json['AppInstanceUserMembershipSummary'] == null
            ? null
            : AppInstanceUserMembershipSummary.fromJson(
                json['AppInstanceUserMembershipSummary']
                    as Map<String, dynamic>),
    channelSummary: json['ChannelSummary'] == null
        ? null
        : ChannelSummary.fromJson(
            json['ChannelSummary'] as Map<String, dynamic>),
  );
}

ChannelMembershipSummary _$ChannelMembershipSummaryFromJson(
    Map<String, dynamic> json) {
  return ChannelMembershipSummary(
    member: json['Member'] == null
        ? null
        : Identity.fromJson(json['Member'] as Map<String, dynamic>),
  );
}

ChannelMessage _$ChannelMessageFromJson(Map<String, dynamic> json) {
  return ChannelMessage(
    channelArn: json['ChannelArn'] as String,
    content: json['Content'] as String,
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    lastEditedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastEditedTimestamp']),
    lastUpdatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimestamp']),
    messageId: json['MessageId'] as String,
    metadata: json['Metadata'] as String,
    persistence: _$enumDecodeNullable(
        _$ChannelMessagePersistenceTypeEnumMap, json['Persistence']),
    redacted: json['Redacted'] as bool,
    sender: json['Sender'] == null
        ? null
        : Identity.fromJson(json['Sender'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$ChannelMessageTypeEnumMap, json['Type']),
  );
}

const _$ChannelMessagePersistenceTypeEnumMap = {
  ChannelMessagePersistenceType.persistent: 'PERSISTENT',
  ChannelMessagePersistenceType.nonPersistent: 'NON_PERSISTENT',
};

const _$ChannelMessageTypeEnumMap = {
  ChannelMessageType.standard: 'STANDARD',
  ChannelMessageType.control: 'CONTROL',
};

ChannelMessageSummary _$ChannelMessageSummaryFromJson(
    Map<String, dynamic> json) {
  return ChannelMessageSummary(
    content: json['Content'] as String,
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    lastEditedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastEditedTimestamp']),
    lastUpdatedTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTimestamp']),
    messageId: json['MessageId'] as String,
    metadata: json['Metadata'] as String,
    redacted: json['Redacted'] as bool,
    sender: json['Sender'] == null
        ? null
        : Identity.fromJson(json['Sender'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$ChannelMessageTypeEnumMap, json['Type']),
  );
}

ChannelModeratedByAppInstanceUserSummary
    _$ChannelModeratedByAppInstanceUserSummaryFromJson(
        Map<String, dynamic> json) {
  return ChannelModeratedByAppInstanceUserSummary(
    channelSummary: json['ChannelSummary'] == null
        ? null
        : ChannelSummary.fromJson(
            json['ChannelSummary'] as Map<String, dynamic>),
  );
}

ChannelModerator _$ChannelModeratorFromJson(Map<String, dynamic> json) {
  return ChannelModerator(
    channelArn: json['ChannelArn'] as String,
    createdBy: json['CreatedBy'] == null
        ? null
        : Identity.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    createdTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreatedTimestamp']),
    moderator: json['Moderator'] == null
        ? null
        : Identity.fromJson(json['Moderator'] as Map<String, dynamic>),
  );
}

ChannelModeratorSummary _$ChannelModeratorSummaryFromJson(
    Map<String, dynamic> json) {
  return ChannelModeratorSummary(
    moderator: json['Moderator'] == null
        ? null
        : Identity.fromJson(json['Moderator'] as Map<String, dynamic>),
  );
}

ChannelRetentionSettings _$ChannelRetentionSettingsFromJson(
    Map<String, dynamic> json) {
  return ChannelRetentionSettings(
    retentionDays: json['RetentionDays'] as int,
  );
}

Map<String, dynamic> _$ChannelRetentionSettingsToJson(
    ChannelRetentionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RetentionDays', instance.retentionDays);
  return val;
}

ChannelSummary _$ChannelSummaryFromJson(Map<String, dynamic> json) {
  return ChannelSummary(
    channelArn: json['ChannelArn'] as String,
    lastMessageTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastMessageTimestamp']),
    metadata: json['Metadata'] as String,
    mode: _$enumDecodeNullable(_$ChannelModeEnumMap, json['Mode']),
    name: json['Name'] as String,
    privacy: _$enumDecodeNullable(_$ChannelPrivacyEnumMap, json['Privacy']),
  );
}

ConversationRetentionSettings _$ConversationRetentionSettingsFromJson(
    Map<String, dynamic> json) {
  return ConversationRetentionSettings(
    retentionDays: json['RetentionDays'] as int,
  );
}

Map<String, dynamic> _$ConversationRetentionSettingsToJson(
    ConversationRetentionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RetentionDays', instance.retentionDays);
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

CreateAppInstanceAdminResponse _$CreateAppInstanceAdminResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAppInstanceAdminResponse(
    appInstanceAdmin: json['AppInstanceAdmin'] == null
        ? null
        : Identity.fromJson(json['AppInstanceAdmin'] as Map<String, dynamic>),
    appInstanceArn: json['AppInstanceArn'] as String,
  );
}

CreateAppInstanceResponse _$CreateAppInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAppInstanceResponse(
    appInstanceArn: json['AppInstanceArn'] as String,
  );
}

CreateAppInstanceUserResponse _$CreateAppInstanceUserResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAppInstanceUserResponse(
    appInstanceUserArn: json['AppInstanceUserArn'] as String,
  );
}

CreateAttendeeError _$CreateAttendeeErrorFromJson(Map<String, dynamic> json) {
  return CreateAttendeeError(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    externalUserId: json['ExternalUserId'] as String,
  );
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

CreateBotResponse _$CreateBotResponseFromJson(Map<String, dynamic> json) {
  return CreateBotResponse(
    bot: json['Bot'] == null
        ? null
        : Bot.fromJson(json['Bot'] as Map<String, dynamic>),
  );
}

CreateChannelBanResponse _$CreateChannelBanResponseFromJson(
    Map<String, dynamic> json) {
  return CreateChannelBanResponse(
    channelArn: json['ChannelArn'] as String,
    member: json['Member'] == null
        ? null
        : Identity.fromJson(json['Member'] as Map<String, dynamic>),
  );
}

CreateChannelMembershipResponse _$CreateChannelMembershipResponseFromJson(
    Map<String, dynamic> json) {
  return CreateChannelMembershipResponse(
    channelArn: json['ChannelArn'] as String,
    member: json['Member'] == null
        ? null
        : Identity.fromJson(json['Member'] as Map<String, dynamic>),
  );
}

CreateChannelModeratorResponse _$CreateChannelModeratorResponseFromJson(
    Map<String, dynamic> json) {
  return CreateChannelModeratorResponse(
    channelArn: json['ChannelArn'] as String,
    channelModerator: json['ChannelModerator'] == null
        ? null
        : Identity.fromJson(json['ChannelModerator'] as Map<String, dynamic>),
  );
}

CreateChannelResponse _$CreateChannelResponseFromJson(
    Map<String, dynamic> json) {
  return CreateChannelResponse(
    channelArn: json['ChannelArn'] as String,
  );
}

CreateMeetingDialOutResponse _$CreateMeetingDialOutResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMeetingDialOutResponse(
    transactionId: json['TransactionId'] as String,
  );
}

CreateMeetingResponse _$CreateMeetingResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMeetingResponse(
    meeting: json['Meeting'] == null
        ? null
        : Meeting.fromJson(json['Meeting'] as Map<String, dynamic>),
  );
}

CreateMeetingWithAttendeesResponse _$CreateMeetingWithAttendeesResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMeetingWithAttendeesResponse(
    attendees: (json['Attendees'] as List)
        ?.map((e) =>
            e == null ? null : Attendee.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : CreateAttendeeError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    meeting: json['Meeting'] == null
        ? null
        : Meeting.fromJson(json['Meeting'] as Map<String, dynamic>),
  );
}

CreatePhoneNumberOrderResponse _$CreatePhoneNumberOrderResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePhoneNumberOrderResponse(
    phoneNumberOrder: json['PhoneNumberOrder'] == null
        ? null
        : PhoneNumberOrder.fromJson(
            json['PhoneNumberOrder'] as Map<String, dynamic>),
  );
}

CreateProxySessionResponse _$CreateProxySessionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProxySessionResponse(
    proxySession: json['ProxySession'] == null
        ? null
        : ProxySession.fromJson(json['ProxySession'] as Map<String, dynamic>),
  );
}

CreateRoomMembershipResponse _$CreateRoomMembershipResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRoomMembershipResponse(
    roomMembership: json['RoomMembership'] == null
        ? null
        : RoomMembership.fromJson(
            json['RoomMembership'] as Map<String, dynamic>),
  );
}

CreateRoomResponse _$CreateRoomResponseFromJson(Map<String, dynamic> json) {
  return CreateRoomResponse(
    room: json['Room'] == null
        ? null
        : Room.fromJson(json['Room'] as Map<String, dynamic>),
  );
}

CreateSipMediaApplicationCallResponse
    _$CreateSipMediaApplicationCallResponseFromJson(Map<String, dynamic> json) {
  return CreateSipMediaApplicationCallResponse(
    sipMediaApplicationCall: json['SipMediaApplicationCall'] == null
        ? null
        : SipMediaApplicationCall.fromJson(
            json['SipMediaApplicationCall'] as Map<String, dynamic>),
  );
}

CreateSipMediaApplicationResponse _$CreateSipMediaApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSipMediaApplicationResponse(
    sipMediaApplication: json['SipMediaApplication'] == null
        ? null
        : SipMediaApplication.fromJson(
            json['SipMediaApplication'] as Map<String, dynamic>),
  );
}

CreateSipRuleResponse _$CreateSipRuleResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSipRuleResponse(
    sipRule: json['SipRule'] == null
        ? null
        : SipRule.fromJson(json['SipRule'] as Map<String, dynamic>),
  );
}

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
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

DNISEmergencyCallingConfiguration _$DNISEmergencyCallingConfigurationFromJson(
    Map<String, dynamic> json) {
  return DNISEmergencyCallingConfiguration(
    callingCountry: json['CallingCountry'] as String,
    emergencyPhoneNumber: json['EmergencyPhoneNumber'] as String,
    testPhoneNumber: json['TestPhoneNumber'] as String,
  );
}

Map<String, dynamic> _$DNISEmergencyCallingConfigurationToJson(
    DNISEmergencyCallingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CallingCountry', instance.callingCountry);
  writeNotNull('EmergencyPhoneNumber', instance.emergencyPhoneNumber);
  writeNotNull('TestPhoneNumber', instance.testPhoneNumber);
  return val;
}

DeleteAccountResponse _$DeleteAccountResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAccountResponse();
}

DescribeAppInstanceAdminResponse _$DescribeAppInstanceAdminResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAppInstanceAdminResponse(
    appInstanceAdmin: json['AppInstanceAdmin'] == null
        ? null
        : AppInstanceAdmin.fromJson(
            json['AppInstanceAdmin'] as Map<String, dynamic>),
  );
}

DescribeAppInstanceResponse _$DescribeAppInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAppInstanceResponse(
    appInstance: json['AppInstance'] == null
        ? null
        : AppInstance.fromJson(json['AppInstance'] as Map<String, dynamic>),
  );
}

DescribeAppInstanceUserResponse _$DescribeAppInstanceUserResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAppInstanceUserResponse(
    appInstanceUser: json['AppInstanceUser'] == null
        ? null
        : AppInstanceUser.fromJson(
            json['AppInstanceUser'] as Map<String, dynamic>),
  );
}

DescribeChannelBanResponse _$DescribeChannelBanResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeChannelBanResponse(
    channelBan: json['ChannelBan'] == null
        ? null
        : ChannelBan.fromJson(json['ChannelBan'] as Map<String, dynamic>),
  );
}

DescribeChannelMembershipForAppInstanceUserResponse
    _$DescribeChannelMembershipForAppInstanceUserResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeChannelMembershipForAppInstanceUserResponse(
    channelMembership: json['ChannelMembership'] == null
        ? null
        : ChannelMembershipForAppInstanceUserSummary.fromJson(
            json['ChannelMembership'] as Map<String, dynamic>),
  );
}

DescribeChannelMembershipResponse _$DescribeChannelMembershipResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeChannelMembershipResponse(
    channelMembership: json['ChannelMembership'] == null
        ? null
        : ChannelMembership.fromJson(
            json['ChannelMembership'] as Map<String, dynamic>),
  );
}

DescribeChannelModeratedByAppInstanceUserResponse
    _$DescribeChannelModeratedByAppInstanceUserResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeChannelModeratedByAppInstanceUserResponse(
    channel: json['Channel'] == null
        ? null
        : ChannelModeratedByAppInstanceUserSummary.fromJson(
            json['Channel'] as Map<String, dynamic>),
  );
}

DescribeChannelModeratorResponse _$DescribeChannelModeratorResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeChannelModeratorResponse(
    channelModerator: json['ChannelModerator'] == null
        ? null
        : ChannelModerator.fromJson(
            json['ChannelModerator'] as Map<String, dynamic>),
  );
}

DescribeChannelResponse _$DescribeChannelResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeChannelResponse(
    channel: json['Channel'] == null
        ? null
        : Channel.fromJson(json['Channel'] as Map<String, dynamic>),
  );
}

DisassociatePhoneNumberFromUserResponse
    _$DisassociatePhoneNumberFromUserResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociatePhoneNumberFromUserResponse();
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

DisassociateSigninDelegateGroupsFromAccountResponse
    _$DisassociateSigninDelegateGroupsFromAccountResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateSigninDelegateGroupsFromAccountResponse();
}

EmergencyCallingConfiguration _$EmergencyCallingConfigurationFromJson(
    Map<String, dynamic> json) {
  return EmergencyCallingConfiguration(
    dnis: (json['DNIS'] as List)
        ?.map((e) => e == null
            ? null
            : DNISEmergencyCallingConfiguration.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EmergencyCallingConfigurationToJson(
    EmergencyCallingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DNIS', instance.dnis?.map((e) => e?.toJson())?.toList());
  return val;
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

GetAppInstanceRetentionSettingsResponse
    _$GetAppInstanceRetentionSettingsResponseFromJson(
        Map<String, dynamic> json) {
  return GetAppInstanceRetentionSettingsResponse(
    appInstanceRetentionSettings: json['AppInstanceRetentionSettings'] == null
        ? null
        : AppInstanceRetentionSettings.fromJson(
            json['AppInstanceRetentionSettings'] as Map<String, dynamic>),
    initiateDeletionTimestamp: const UnixDateTimeConverter()
        .fromJson(json['InitiateDeletionTimestamp']),
  );
}

GetAppInstanceStreamingConfigurationsResponse
    _$GetAppInstanceStreamingConfigurationsResponseFromJson(
        Map<String, dynamic> json) {
  return GetAppInstanceStreamingConfigurationsResponse(
    appInstanceStreamingConfigurations:
        (json['AppInstanceStreamingConfigurations'] as List)
            ?.map((e) => e == null
                ? null
                : AppInstanceStreamingConfiguration.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
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

GetChannelMessageResponse _$GetChannelMessageResponseFromJson(
    Map<String, dynamic> json) {
  return GetChannelMessageResponse(
    channelMessage: json['ChannelMessage'] == null
        ? null
        : ChannelMessage.fromJson(
            json['ChannelMessage'] as Map<String, dynamic>),
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

GetMessagingSessionEndpointResponse
    _$GetMessagingSessionEndpointResponseFromJson(Map<String, dynamic> json) {
  return GetMessagingSessionEndpointResponse(
    endpoint: json['Endpoint'] == null
        ? null
        : MessagingSessionEndpoint.fromJson(
            json['Endpoint'] as Map<String, dynamic>),
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
    callingNameUpdatedTimestamp: const IsoDateTimeConverter()
        .fromJson(json['CallingNameUpdatedTimestamp']),
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

GetRetentionSettingsResponse _$GetRetentionSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return GetRetentionSettingsResponse(
    initiateDeletionTimestamp: const IsoDateTimeConverter()
        .fromJson(json['InitiateDeletionTimestamp']),
    retentionSettings: json['RetentionSettings'] == null
        ? null
        : RetentionSettings.fromJson(
            json['RetentionSettings'] as Map<String, dynamic>),
  );
}

GetRoomResponse _$GetRoomResponseFromJson(Map<String, dynamic> json) {
  return GetRoomResponse(
    room: json['Room'] == null
        ? null
        : Room.fromJson(json['Room'] as Map<String, dynamic>),
  );
}

GetSipMediaApplicationLoggingConfigurationResponse
    _$GetSipMediaApplicationLoggingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return GetSipMediaApplicationLoggingConfigurationResponse(
    sipMediaApplicationLoggingConfiguration:
        json['SipMediaApplicationLoggingConfiguration'] == null
            ? null
            : SipMediaApplicationLoggingConfiguration.fromJson(
                json['SipMediaApplicationLoggingConfiguration']
                    as Map<String, dynamic>),
  );
}

GetSipMediaApplicationResponse _$GetSipMediaApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return GetSipMediaApplicationResponse(
    sipMediaApplication: json['SipMediaApplication'] == null
        ? null
        : SipMediaApplication.fromJson(
            json['SipMediaApplication'] as Map<String, dynamic>),
  );
}

GetSipRuleResponse _$GetSipRuleResponseFromJson(Map<String, dynamic> json) {
  return GetSipRuleResponse(
    sipRule: json['SipRule'] == null
        ? null
        : SipRule.fromJson(json['SipRule'] as Map<String, dynamic>),
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

GetVoiceConnectorEmergencyCallingConfigurationResponse
    _$GetVoiceConnectorEmergencyCallingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return GetVoiceConnectorEmergencyCallingConfigurationResponse(
    emergencyCallingConfiguration: json['EmergencyCallingConfiguration'] == null
        ? null
        : EmergencyCallingConfiguration.fromJson(
            json['EmergencyCallingConfiguration'] as Map<String, dynamic>),
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

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  return Identity(
    arn: json['Arn'] as String,
    name: json['Name'] as String,
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

ListAppInstanceAdminsResponse _$ListAppInstanceAdminsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAppInstanceAdminsResponse(
    appInstanceAdmins: (json['AppInstanceAdmins'] as List)
        ?.map((e) => e == null
            ? null
            : AppInstanceAdminSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    appInstanceArn: json['AppInstanceArn'] as String,
    nextToken: json['NextToken'] as String,
  );
}

ListAppInstanceUsersResponse _$ListAppInstanceUsersResponseFromJson(
    Map<String, dynamic> json) {
  return ListAppInstanceUsersResponse(
    appInstanceArn: json['AppInstanceArn'] as String,
    appInstanceUsers: (json['AppInstanceUsers'] as List)
        ?.map((e) => e == null
            ? null
            : AppInstanceUserSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListAppInstancesResponse _$ListAppInstancesResponseFromJson(
    Map<String, dynamic> json) {
  return ListAppInstancesResponse(
    appInstances: (json['AppInstances'] as List)
        ?.map((e) => e == null
            ? null
            : AppInstanceSummary.fromJson(e as Map<String, dynamic>))
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

ListChannelBansResponse _$ListChannelBansResponseFromJson(
    Map<String, dynamic> json) {
  return ListChannelBansResponse(
    channelArn: json['ChannelArn'] as String,
    channelBans: (json['ChannelBans'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelBanSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListChannelMembershipsForAppInstanceUserResponse
    _$ListChannelMembershipsForAppInstanceUserResponseFromJson(
        Map<String, dynamic> json) {
  return ListChannelMembershipsForAppInstanceUserResponse(
    channelMemberships: (json['ChannelMemberships'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelMembershipForAppInstanceUserSummary.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListChannelMembershipsResponse _$ListChannelMembershipsResponseFromJson(
    Map<String, dynamic> json) {
  return ListChannelMembershipsResponse(
    channelArn: json['ChannelArn'] as String,
    channelMemberships: (json['ChannelMemberships'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelMembershipSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListChannelMessagesResponse _$ListChannelMessagesResponseFromJson(
    Map<String, dynamic> json) {
  return ListChannelMessagesResponse(
    channelArn: json['ChannelArn'] as String,
    channelMessages: (json['ChannelMessages'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelMessageSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListChannelModeratorsResponse _$ListChannelModeratorsResponseFromJson(
    Map<String, dynamic> json) {
  return ListChannelModeratorsResponse(
    channelArn: json['ChannelArn'] as String,
    channelModerators: (json['ChannelModerators'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelModeratorSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListChannelsModeratedByAppInstanceUserResponse
    _$ListChannelsModeratedByAppInstanceUserResponseFromJson(
        Map<String, dynamic> json) {
  return ListChannelsModeratedByAppInstanceUserResponse(
    channels: (json['Channels'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelModeratedByAppInstanceUserSummary.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListChannelsResponse _$ListChannelsResponseFromJson(Map<String, dynamic> json) {
  return ListChannelsResponse(
    channels: (json['Channels'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelSummary.fromJson(e as Map<String, dynamic>))
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

ListSipMediaApplicationsResponse _$ListSipMediaApplicationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSipMediaApplicationsResponse(
    nextToken: json['NextToken'] as String,
    sipMediaApplications: (json['SipMediaApplications'] as List)
        ?.map((e) => e == null
            ? null
            : SipMediaApplication.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSipRulesResponse _$ListSipRulesResponseFromJson(Map<String, dynamic> json) {
  return ListSipRulesResponse(
    nextToken: json['NextToken'] as String,
    sipRules: (json['SipRules'] as List)
        ?.map((e) =>
            e == null ? null : SipRule.fromJson(e as Map<String, dynamic>))
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
  ErrorCode.throttling: 'Throttling',
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

const _$RoomMembershipRoleEnumMap = {
  RoomMembershipRole.administrator: 'Administrator',
  RoomMembershipRole.member: 'Member',
};

MessagingSessionEndpoint _$MessagingSessionEndpointFromJson(
    Map<String, dynamic> json) {
  return MessagingSessionEndpoint(
    url: json['Url'] as String,
  );
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
    createdTimestamp:
        const IsoDateTimeConverter().fromJson(json['CreatedTimestamp']),
    deletionTimestamp:
        const IsoDateTimeConverter().fromJson(json['DeletionTimestamp']),
    e164PhoneNumber: json['E164PhoneNumber'] as String,
    phoneNumberId: json['PhoneNumberId'] as String,
    productType: _$enumDecodeNullable(
        _$PhoneNumberProductTypeEnumMap, json['ProductType']),
    status: _$enumDecodeNullable(_$PhoneNumberStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$PhoneNumberTypeEnumMap, json['Type']),
    updatedTimestamp:
        const IsoDateTimeConverter().fromJson(json['UpdatedTimestamp']),
  );
}

const _$CallingNameStatusEnumMap = {
  CallingNameStatus.unassigned: 'Unassigned',
  CallingNameStatus.updateInProgress: 'UpdateInProgress',
  CallingNameStatus.updateSucceeded: 'UpdateSucceeded',
  CallingNameStatus.updateFailed: 'UpdateFailed',
};

const _$PhoneNumberProductTypeEnumMap = {
  PhoneNumberProductType.businessCalling: 'BusinessCalling',
  PhoneNumberProductType.voiceConnector: 'VoiceConnector',
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
    associatedTimestamp:
        const IsoDateTimeConverter().fromJson(json['AssociatedTimestamp']),
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
  PhoneNumberAssociationName.sipRuleId: 'SipRuleId',
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
    createdTimestamp:
        const IsoDateTimeConverter().fromJson(json['CreatedTimestamp']),
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
    updatedTimestamp:
        const IsoDateTimeConverter().fromJson(json['UpdatedTimestamp']),
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
    capabilities: (json['Capabilities'] as List)
        ?.map((e) => _$enumDecodeNullable(_$CapabilityEnumMap, e))
        ?.toList(),
    createdTimestamp:
        const IsoDateTimeConverter().fromJson(json['CreatedTimestamp']),
    endedTimestamp:
        const IsoDateTimeConverter().fromJson(json['EndedTimestamp']),
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
    updatedTimestamp:
        const IsoDateTimeConverter().fromJson(json['UpdatedTimestamp']),
    voiceConnectorId: json['VoiceConnectorId'] as String,
  );
}

const _$CapabilityEnumMap = {
  Capability.voice: 'Voice',
  Capability.sms: 'SMS',
};

const _$GeoMatchLevelEnumMap = {
  GeoMatchLevel.country: 'Country',
  GeoMatchLevel.areaCode: 'AreaCode',
};

const _$NumberSelectionBehaviorEnumMap = {
  NumberSelectionBehavior.preferSticky: 'PreferSticky',
  NumberSelectionBehavior.avoidSticky: 'AvoidSticky',
};

const _$ProxySessionStatusEnumMap = {
  ProxySessionStatus.open: 'Open',
  ProxySessionStatus.inProgress: 'InProgress',
  ProxySessionStatus.closed: 'Closed',
};

PutAppInstanceRetentionSettingsResponse
    _$PutAppInstanceRetentionSettingsResponseFromJson(
        Map<String, dynamic> json) {
  return PutAppInstanceRetentionSettingsResponse(
    appInstanceRetentionSettings: json['AppInstanceRetentionSettings'] == null
        ? null
        : AppInstanceRetentionSettings.fromJson(
            json['AppInstanceRetentionSettings'] as Map<String, dynamic>),
    initiateDeletionTimestamp: const UnixDateTimeConverter()
        .fromJson(json['InitiateDeletionTimestamp']),
  );
}

PutAppInstanceStreamingConfigurationsResponse
    _$PutAppInstanceStreamingConfigurationsResponseFromJson(
        Map<String, dynamic> json) {
  return PutAppInstanceStreamingConfigurationsResponse(
    appInstanceStreamingConfigurations:
        (json['AppInstanceStreamingConfigurations'] as List)
            ?.map((e) => e == null
                ? null
                : AppInstanceStreamingConfiguration.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
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

PutRetentionSettingsResponse _$PutRetentionSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return PutRetentionSettingsResponse(
    initiateDeletionTimestamp: const IsoDateTimeConverter()
        .fromJson(json['InitiateDeletionTimestamp']),
    retentionSettings: json['RetentionSettings'] == null
        ? null
        : RetentionSettings.fromJson(
            json['RetentionSettings'] as Map<String, dynamic>),
  );
}

PutSipMediaApplicationLoggingConfigurationResponse
    _$PutSipMediaApplicationLoggingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return PutSipMediaApplicationLoggingConfigurationResponse(
    sipMediaApplicationLoggingConfiguration:
        json['SipMediaApplicationLoggingConfiguration'] == null
            ? null
            : SipMediaApplicationLoggingConfiguration.fromJson(
                json['SipMediaApplicationLoggingConfiguration']
                    as Map<String, dynamic>),
  );
}

PutVoiceConnectorEmergencyCallingConfigurationResponse
    _$PutVoiceConnectorEmergencyCallingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return PutVoiceConnectorEmergencyCallingConfigurationResponse(
    emergencyCallingConfiguration: json['EmergencyCallingConfiguration'] == null
        ? null
        : EmergencyCallingConfiguration.fromJson(
            json['EmergencyCallingConfiguration'] as Map<String, dynamic>),
  );
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

PutVoiceConnectorOriginationResponse
    _$PutVoiceConnectorOriginationResponseFromJson(Map<String, dynamic> json) {
  return PutVoiceConnectorOriginationResponse(
    origination: json['Origination'] == null
        ? null
        : Origination.fromJson(json['Origination'] as Map<String, dynamic>),
  );
}

PutVoiceConnectorProxyResponse _$PutVoiceConnectorProxyResponseFromJson(
    Map<String, dynamic> json) {
  return PutVoiceConnectorProxyResponse(
    proxy: json['Proxy'] == null
        ? null
        : Proxy.fromJson(json['Proxy'] as Map<String, dynamic>),
  );
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

PutVoiceConnectorTerminationResponse
    _$PutVoiceConnectorTerminationResponseFromJson(Map<String, dynamic> json) {
  return PutVoiceConnectorTerminationResponse(
    termination: json['Termination'] == null
        ? null
        : Termination.fromJson(json['Termination'] as Map<String, dynamic>),
  );
}

RedactChannelMessageResponse _$RedactChannelMessageResponseFromJson(
    Map<String, dynamic> json) {
  return RedactChannelMessageResponse(
    channelArn: json['ChannelArn'] as String,
    messageId: json['MessageId'] as String,
  );
}

RedactConversationMessageResponse _$RedactConversationMessageResponseFromJson(
    Map<String, dynamic> json) {
  return RedactConversationMessageResponse();
}

RedactRoomMessageResponse _$RedactRoomMessageResponseFromJson(
    Map<String, dynamic> json) {
  return RedactRoomMessageResponse();
}

RegenerateSecurityTokenResponse _$RegenerateSecurityTokenResponseFromJson(
    Map<String, dynamic> json) {
  return RegenerateSecurityTokenResponse(
    bot: json['Bot'] == null
        ? null
        : Bot.fromJson(json['Bot'] as Map<String, dynamic>),
  );
}

ResetPersonalPINResponse _$ResetPersonalPINResponseFromJson(
    Map<String, dynamic> json) {
  return ResetPersonalPINResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
}

RestorePhoneNumberResponse _$RestorePhoneNumberResponseFromJson(
    Map<String, dynamic> json) {
  return RestorePhoneNumberResponse(
    phoneNumber: json['PhoneNumber'] == null
        ? null
        : PhoneNumber.fromJson(json['PhoneNumber'] as Map<String, dynamic>),
  );
}

RetentionSettings _$RetentionSettingsFromJson(Map<String, dynamic> json) {
  return RetentionSettings(
    conversationRetentionSettings: json['ConversationRetentionSettings'] == null
        ? null
        : ConversationRetentionSettings.fromJson(
            json['ConversationRetentionSettings'] as Map<String, dynamic>),
    roomRetentionSettings: json['RoomRetentionSettings'] == null
        ? null
        : RoomRetentionSettings.fromJson(
            json['RoomRetentionSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RetentionSettingsToJson(RetentionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConversationRetentionSettings',
      instance.conversationRetentionSettings?.toJson());
  writeNotNull(
      'RoomRetentionSettings', instance.roomRetentionSettings?.toJson());
  return val;
}

Room _$RoomFromJson(Map<String, dynamic> json) {
  return Room(
    accountId: json['AccountId'] as String,
    createdBy: json['CreatedBy'] as String,
    createdTimestamp:
        const IsoDateTimeConverter().fromJson(json['CreatedTimestamp']),
    name: json['Name'] as String,
    roomId: json['RoomId'] as String,
    updatedTimestamp:
        const IsoDateTimeConverter().fromJson(json['UpdatedTimestamp']),
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
    updatedTimestamp:
        const IsoDateTimeConverter().fromJson(json['UpdatedTimestamp']),
  );
}

RoomRetentionSettings _$RoomRetentionSettingsFromJson(
    Map<String, dynamic> json) {
  return RoomRetentionSettings(
    retentionDays: json['RetentionDays'] as int,
  );
}

Map<String, dynamic> _$RoomRetentionSettingsToJson(
    RoomRetentionSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RetentionDays', instance.retentionDays);
  return val;
}

SearchAvailablePhoneNumbersResponse
    _$SearchAvailablePhoneNumbersResponseFromJson(Map<String, dynamic> json) {
  return SearchAvailablePhoneNumbersResponse(
    e164PhoneNumbers:
        (json['E164PhoneNumbers'] as List)?.map((e) => e as String)?.toList(),
  );
}

SendChannelMessageResponse _$SendChannelMessageResponseFromJson(
    Map<String, dynamic> json) {
  return SendChannelMessageResponse(
    channelArn: json['ChannelArn'] as String,
    messageId: json['MessageId'] as String,
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

SipMediaApplication _$SipMediaApplicationFromJson(Map<String, dynamic> json) {
  return SipMediaApplication(
    awsRegion: json['AwsRegion'] as String,
    createdTimestamp:
        const IsoDateTimeConverter().fromJson(json['CreatedTimestamp']),
    endpoints: (json['Endpoints'] as List)
        ?.map((e) => e == null
            ? null
            : SipMediaApplicationEndpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
    sipMediaApplicationId: json['SipMediaApplicationId'] as String,
    updatedTimestamp:
        const IsoDateTimeConverter().fromJson(json['UpdatedTimestamp']),
  );
}

SipMediaApplicationCall _$SipMediaApplicationCallFromJson(
    Map<String, dynamic> json) {
  return SipMediaApplicationCall(
    transactionId: json['TransactionId'] as String,
  );
}

SipMediaApplicationEndpoint _$SipMediaApplicationEndpointFromJson(
    Map<String, dynamic> json) {
  return SipMediaApplicationEndpoint(
    lambdaArn: json['LambdaArn'] as String,
  );
}

Map<String, dynamic> _$SipMediaApplicationEndpointToJson(
    SipMediaApplicationEndpoint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LambdaArn', instance.lambdaArn);
  return val;
}

SipMediaApplicationLoggingConfiguration
    _$SipMediaApplicationLoggingConfigurationFromJson(
        Map<String, dynamic> json) {
  return SipMediaApplicationLoggingConfiguration(
    enableSipMediaApplicationMessageLogs:
        json['EnableSipMediaApplicationMessageLogs'] as bool,
  );
}

Map<String, dynamic> _$SipMediaApplicationLoggingConfigurationToJson(
    SipMediaApplicationLoggingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EnableSipMediaApplicationMessageLogs',
      instance.enableSipMediaApplicationMessageLogs);
  return val;
}

SipRule _$SipRuleFromJson(Map<String, dynamic> json) {
  return SipRule(
    createdTimestamp:
        const IsoDateTimeConverter().fromJson(json['CreatedTimestamp']),
    disabled: json['Disabled'] as bool,
    name: json['Name'] as String,
    sipRuleId: json['SipRuleId'] as String,
    targetApplications: (json['TargetApplications'] as List)
        ?.map((e) => e == null
            ? null
            : SipRuleTargetApplication.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    triggerType:
        _$enumDecodeNullable(_$SipRuleTriggerTypeEnumMap, json['TriggerType']),
    triggerValue: json['TriggerValue'] as String,
    updatedTimestamp:
        const IsoDateTimeConverter().fromJson(json['UpdatedTimestamp']),
  );
}

const _$SipRuleTriggerTypeEnumMap = {
  SipRuleTriggerType.toPhoneNumber: 'ToPhoneNumber',
  SipRuleTriggerType.requestUriHostname: 'RequestUriHostname',
};

SipRuleTargetApplication _$SipRuleTargetApplicationFromJson(
    Map<String, dynamic> json) {
  return SipRuleTargetApplication(
    awsRegion: json['AwsRegion'] as String,
    priority: json['Priority'] as int,
    sipMediaApplicationId: json['SipMediaApplicationId'] as String,
  );
}

Map<String, dynamic> _$SipRuleTargetApplicationToJson(
    SipRuleTargetApplication instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AwsRegion', instance.awsRegion);
  writeNotNull('Priority', instance.priority);
  writeNotNull('SipMediaApplicationId', instance.sipMediaApplicationId);
  return val;
}

StreamingConfiguration _$StreamingConfigurationFromJson(
    Map<String, dynamic> json) {
  return StreamingConfiguration(
    dataRetentionInHours: json['DataRetentionInHours'] as int,
    disabled: json['Disabled'] as bool,
    streamingNotificationTargets: (json['StreamingNotificationTargets'] as List)
        ?.map((e) => e == null
            ? null
            : StreamingNotificationTarget.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
  writeNotNull('StreamingNotificationTargets',
      instance.streamingNotificationTargets?.map((e) => e?.toJson())?.toList());
  return val;
}

StreamingNotificationTarget _$StreamingNotificationTargetFromJson(
    Map<String, dynamic> json) {
  return StreamingNotificationTarget(
    notificationTarget: _$enumDecodeNullable(
        _$NotificationTargetEnumMap, json['NotificationTarget']),
  );
}

Map<String, dynamic> _$StreamingNotificationTargetToJson(
    StreamingNotificationTarget instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NotificationTarget',
      _$NotificationTargetEnumMap[instance.notificationTarget]);
  return val;
}

const _$NotificationTargetEnumMap = {
  NotificationTarget.eventBridge: 'EventBridge',
  NotificationTarget.sns: 'SNS',
  NotificationTarget.sqs: 'SQS',
};

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
    timestamp: const IsoDateTimeConverter().fromJson(json['Timestamp']),
  );
}

UpdateAccountResponse _$UpdateAccountResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAccountResponse(
    account: json['Account'] == null
        ? null
        : Account.fromJson(json['Account'] as Map<String, dynamic>),
  );
}

UpdateAccountSettingsResponse _$UpdateAccountSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAccountSettingsResponse();
}

UpdateAppInstanceResponse _$UpdateAppInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAppInstanceResponse(
    appInstanceArn: json['AppInstanceArn'] as String,
  );
}

UpdateAppInstanceUserResponse _$UpdateAppInstanceUserResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAppInstanceUserResponse(
    appInstanceUserArn: json['AppInstanceUserArn'] as String,
  );
}

UpdateBotResponse _$UpdateBotResponseFromJson(Map<String, dynamic> json) {
  return UpdateBotResponse(
    bot: json['Bot'] == null
        ? null
        : Bot.fromJson(json['Bot'] as Map<String, dynamic>),
  );
}

UpdateChannelMessageResponse _$UpdateChannelMessageResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateChannelMessageResponse(
    channelArn: json['ChannelArn'] as String,
    messageId: json['MessageId'] as String,
  );
}

UpdateChannelReadMarkerResponse _$UpdateChannelReadMarkerResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateChannelReadMarkerResponse(
    channelArn: json['ChannelArn'] as String,
  );
}

UpdateChannelResponse _$UpdateChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateChannelResponse(
    channelArn: json['ChannelArn'] as String,
  );
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

UpdateProxySessionResponse _$UpdateProxySessionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProxySessionResponse(
    proxySession: json['ProxySession'] == null
        ? null
        : ProxySession.fromJson(json['ProxySession'] as Map<String, dynamic>),
  );
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

UpdateRoomResponse _$UpdateRoomResponseFromJson(Map<String, dynamic> json) {
  return UpdateRoomResponse(
    room: json['Room'] == null
        ? null
        : Room.fromJson(json['Room'] as Map<String, dynamic>),
  );
}

UpdateSipMediaApplicationResponse _$UpdateSipMediaApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSipMediaApplicationResponse(
    sipMediaApplication: json['SipMediaApplication'] == null
        ? null
        : SipMediaApplication.fromJson(
            json['SipMediaApplication'] as Map<String, dynamic>),
  );
}

UpdateSipRuleResponse _$UpdateSipRuleResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSipRuleResponse(
    sipRule: json['SipRule'] == null
        ? null
        : SipRule.fromJson(json['SipRule'] as Map<String, dynamic>),
  );
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

const _$UserTypeEnumMap = {
  UserType.privateUser: 'PrivateUser',
  UserType.sharedDevice: 'SharedDevice',
};

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) {
  return UpdateUserResponse(
    user: json['User'] == null
        ? null
        : User.fromJson(json['User'] as Map<String, dynamic>),
  );
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
    invitedOn: const IsoDateTimeConverter().fromJson(json['InvitedOn']),
    licenseType: _$enumDecodeNullable(_$LicenseEnumMap, json['LicenseType']),
    personalPIN: json['PersonalPIN'] as String,
    primaryEmail: json['PrimaryEmail'] as String,
    primaryProvisionedNumber: json['PrimaryProvisionedNumber'] as String,
    registeredOn: const IsoDateTimeConverter().fromJson(json['RegisteredOn']),
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
    createdTimestamp:
        const IsoDateTimeConverter().fromJson(json['CreatedTimestamp']),
    name: json['Name'] as String,
    outboundHostName: json['OutboundHostName'] as String,
    requireEncryption: json['RequireEncryption'] as bool,
    updatedTimestamp:
        const IsoDateTimeConverter().fromJson(json['UpdatedTimestamp']),
    voiceConnectorId: json['VoiceConnectorId'] as String,
  );
}

const _$VoiceConnectorAwsRegionEnumMap = {
  VoiceConnectorAwsRegion.usEast_1: 'us-east-1',
  VoiceConnectorAwsRegion.usWest_2: 'us-west-2',
};

VoiceConnectorGroup _$VoiceConnectorGroupFromJson(Map<String, dynamic> json) {
  return VoiceConnectorGroup(
    createdTimestamp:
        const IsoDateTimeConverter().fromJson(json['CreatedTimestamp']),
    name: json['Name'] as String,
    updatedTimestamp:
        const IsoDateTimeConverter().fromJson(json['UpdatedTimestamp']),
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
