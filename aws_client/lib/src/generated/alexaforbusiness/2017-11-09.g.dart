// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-11-09.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressBook _$AddressBookFromJson(Map<String, dynamic> json) {
  return AddressBook(
    addressBookArn: json['AddressBookArn'] as String,
    description: json['Description'] as String,
    name: json['Name'] as String,
  );
}

AddressBookData _$AddressBookDataFromJson(Map<String, dynamic> json) {
  return AddressBookData(
    addressBookArn: json['AddressBookArn'] as String,
    description: json['Description'] as String,
    name: json['Name'] as String,
  );
}

ApproveSkillResponse _$ApproveSkillResponseFromJson(Map<String, dynamic> json) {
  return ApproveSkillResponse();
}

AssociateContactWithAddressBookResponse
    _$AssociateContactWithAddressBookResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateContactWithAddressBookResponse();
}

AssociateDeviceWithNetworkProfileResponse
    _$AssociateDeviceWithNetworkProfileResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateDeviceWithNetworkProfileResponse();
}

AssociateDeviceWithRoomResponse _$AssociateDeviceWithRoomResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateDeviceWithRoomResponse();
}

AssociateSkillGroupWithRoomResponse
    _$AssociateSkillGroupWithRoomResponseFromJson(Map<String, dynamic> json) {
  return AssociateSkillGroupWithRoomResponse();
}

AssociateSkillWithSkillGroupResponse
    _$AssociateSkillWithSkillGroupResponseFromJson(Map<String, dynamic> json) {
  return AssociateSkillWithSkillGroupResponse();
}

AssociateSkillWithUsersResponse _$AssociateSkillWithUsersResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateSkillWithUsersResponse();
}

Map<String, dynamic> _$AudioToJson(Audio instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Locale', _$LocaleEnumMap[instance.locale]);
  writeNotNull('Location', instance.location);
  return val;
}

const _$LocaleEnumMap = {
  Locale.enUs: 'en-US',
};

BusinessReport _$BusinessReportFromJson(Map<String, dynamic> json) {
  return BusinessReport(
    deliveryTime: const UnixDateTimeConverter().fromJson(json['DeliveryTime']),
    downloadUrl: json['DownloadUrl'] as String,
    failureCode: _$enumDecodeNullable(
        _$BusinessReportFailureCodeEnumMap, json['FailureCode']),
    s3Location: json['S3Location'] == null
        ? null
        : BusinessReportS3Location.fromJson(
            json['S3Location'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$BusinessReportStatusEnumMap, json['Status']),
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

const _$BusinessReportFailureCodeEnumMap = {
  BusinessReportFailureCode.accessDenied: 'ACCESS_DENIED',
  BusinessReportFailureCode.noSuchBucket: 'NO_SUCH_BUCKET',
  BusinessReportFailureCode.internalFailure: 'INTERNAL_FAILURE',
};

const _$BusinessReportStatusEnumMap = {
  BusinessReportStatus.running: 'RUNNING',
  BusinessReportStatus.succeeded: 'SUCCEEDED',
  BusinessReportStatus.failed: 'FAILED',
};

BusinessReportContentRange _$BusinessReportContentRangeFromJson(
    Map<String, dynamic> json) {
  return BusinessReportContentRange(
    interval:
        _$enumDecodeNullable(_$BusinessReportIntervalEnumMap, json['Interval']),
  );
}

Map<String, dynamic> _$BusinessReportContentRangeToJson(
    BusinessReportContentRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Interval', _$BusinessReportIntervalEnumMap[instance.interval]);
  return val;
}

const _$BusinessReportIntervalEnumMap = {
  BusinessReportInterval.oneDay: 'ONE_DAY',
  BusinessReportInterval.oneWeek: 'ONE_WEEK',
  BusinessReportInterval.thirtyDays: 'THIRTY_DAYS',
};

BusinessReportRecurrence _$BusinessReportRecurrenceFromJson(
    Map<String, dynamic> json) {
  return BusinessReportRecurrence(
    startDate: json['StartDate'] as String,
  );
}

Map<String, dynamic> _$BusinessReportRecurrenceToJson(
    BusinessReportRecurrence instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StartDate', instance.startDate);
  return val;
}

BusinessReportS3Location _$BusinessReportS3LocationFromJson(
    Map<String, dynamic> json) {
  return BusinessReportS3Location(
    bucketName: json['BucketName'] as String,
    path: json['Path'] as String,
  );
}

BusinessReportSchedule _$BusinessReportScheduleFromJson(
    Map<String, dynamic> json) {
  return BusinessReportSchedule(
    contentRange: json['ContentRange'] == null
        ? null
        : BusinessReportContentRange.fromJson(
            json['ContentRange'] as Map<String, dynamic>),
    format: _$enumDecodeNullable(_$BusinessReportFormatEnumMap, json['Format']),
    lastBusinessReport: json['LastBusinessReport'] == null
        ? null
        : BusinessReport.fromJson(
            json['LastBusinessReport'] as Map<String, dynamic>),
    recurrence: json['Recurrence'] == null
        ? null
        : BusinessReportRecurrence.fromJson(
            json['Recurrence'] as Map<String, dynamic>),
    s3BucketName: json['S3BucketName'] as String,
    s3KeyPrefix: json['S3KeyPrefix'] as String,
    scheduleArn: json['ScheduleArn'] as String,
    scheduleName: json['ScheduleName'] as String,
  );
}

const _$BusinessReportFormatEnumMap = {
  BusinessReportFormat.csv: 'CSV',
  BusinessReportFormat.csvZip: 'CSV_ZIP',
};

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    categoryId: json['CategoryId'] as int,
    categoryName: json['CategoryName'] as String,
  );
}

ConferencePreference _$ConferencePreferenceFromJson(Map<String, dynamic> json) {
  return ConferencePreference(
    defaultConferenceProviderArn:
        json['DefaultConferenceProviderArn'] as String,
  );
}

Map<String, dynamic> _$ConferencePreferenceToJson(
    ConferencePreference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DefaultConferenceProviderArn', instance.defaultConferenceProviderArn);
  return val;
}

ConferenceProvider _$ConferenceProviderFromJson(Map<String, dynamic> json) {
  return ConferenceProvider(
    arn: json['Arn'] as String,
    iPDialIn: json['IPDialIn'] == null
        ? null
        : IPDialIn.fromJson(json['IPDialIn'] as Map<String, dynamic>),
    meetingSetting: json['MeetingSetting'] == null
        ? null
        : MeetingSetting.fromJson(
            json['MeetingSetting'] as Map<String, dynamic>),
    name: json['Name'] as String,
    pSTNDialIn: json['PSTNDialIn'] == null
        ? null
        : PSTNDialIn.fromJson(json['PSTNDialIn'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$ConferenceProviderTypeEnumMap, json['Type']),
  );
}

const _$ConferenceProviderTypeEnumMap = {
  ConferenceProviderType.chime: 'CHIME',
  ConferenceProviderType.bluejeans: 'BLUEJEANS',
  ConferenceProviderType.fuze: 'FUZE',
  ConferenceProviderType.googleHangouts: 'GOOGLE_HANGOUTS',
  ConferenceProviderType.polycom: 'POLYCOM',
  ConferenceProviderType.ringcentral: 'RINGCENTRAL',
  ConferenceProviderType.skypeForBusiness: 'SKYPE_FOR_BUSINESS',
  ConferenceProviderType.webex: 'WEBEX',
  ConferenceProviderType.zoom: 'ZOOM',
  ConferenceProviderType.custom: 'CUSTOM',
};

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    contactArn: json['ContactArn'] as String,
    displayName: json['DisplayName'] as String,
    firstName: json['FirstName'] as String,
    lastName: json['LastName'] as String,
    phoneNumber: json['PhoneNumber'] as String,
    phoneNumbers: (json['PhoneNumbers'] as List)
        ?.map((e) =>
            e == null ? null : PhoneNumber.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sipAddresses: (json['SipAddresses'] as List)
        ?.map((e) =>
            e == null ? null : SipAddress.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ContactData _$ContactDataFromJson(Map<String, dynamic> json) {
  return ContactData(
    contactArn: json['ContactArn'] as String,
    displayName: json['DisplayName'] as String,
    firstName: json['FirstName'] as String,
    lastName: json['LastName'] as String,
    phoneNumber: json['PhoneNumber'] as String,
    phoneNumbers: (json['PhoneNumbers'] as List)
        ?.map((e) =>
            e == null ? null : PhoneNumber.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sipAddresses: (json['SipAddresses'] as List)
        ?.map((e) =>
            e == null ? null : SipAddress.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ContentToJson(Content instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AudioList', instance.audioList?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'SsmlList', instance.ssmlList?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'TextList', instance.textList?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateAddressBookResponse _$CreateAddressBookResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAddressBookResponse(
    addressBookArn: json['AddressBookArn'] as String,
  );
}

CreateBusinessReportScheduleResponse
    _$CreateBusinessReportScheduleResponseFromJson(Map<String, dynamic> json) {
  return CreateBusinessReportScheduleResponse(
    scheduleArn: json['ScheduleArn'] as String,
  );
}

CreateConferenceProviderResponse _$CreateConferenceProviderResponseFromJson(
    Map<String, dynamic> json) {
  return CreateConferenceProviderResponse(
    conferenceProviderArn: json['ConferenceProviderArn'] as String,
  );
}

CreateContactResponse _$CreateContactResponseFromJson(
    Map<String, dynamic> json) {
  return CreateContactResponse(
    contactArn: json['ContactArn'] as String,
  );
}

Map<String, dynamic> _$CreateEndOfMeetingReminderToJson(
    CreateEndOfMeetingReminder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('ReminderAtMinutes', instance.reminderAtMinutes);
  writeNotNull(
      'ReminderType', _$EndOfMeetingReminderTypeEnumMap[instance.reminderType]);
  return val;
}

const _$EndOfMeetingReminderTypeEnumMap = {
  EndOfMeetingReminderType.announcementTimeCheck: 'ANNOUNCEMENT_TIME_CHECK',
  EndOfMeetingReminderType.announcementVariableTimeLeft:
      'ANNOUNCEMENT_VARIABLE_TIME_LEFT',
  EndOfMeetingReminderType.chime: 'CHIME',
  EndOfMeetingReminderType.knock: 'KNOCK',
};

CreateGatewayGroupResponse _$CreateGatewayGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateGatewayGroupResponse(
    gatewayGroupArn: json['GatewayGroupArn'] as String,
  );
}

Map<String, dynamic> _$CreateInstantBookingToJson(
    CreateInstantBooking instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DurationInMinutes', instance.durationInMinutes);
  writeNotNull('Enabled', instance.enabled);
  return val;
}

Map<String, dynamic> _$CreateMeetingRoomConfigurationToJson(
    CreateMeetingRoomConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndOfMeetingReminder', instance.endOfMeetingReminder?.toJson());
  writeNotNull('InstantBooking', instance.instantBooking?.toJson());
  writeNotNull('RequireCheckIn', instance.requireCheckIn?.toJson());
  writeNotNull(
      'RoomUtilizationMetricsEnabled', instance.roomUtilizationMetricsEnabled);
  return val;
}

CreateNetworkProfileResponse _$CreateNetworkProfileResponseFromJson(
    Map<String, dynamic> json) {
  return CreateNetworkProfileResponse(
    networkProfileArn: json['NetworkProfileArn'] as String,
  );
}

CreateProfileResponse _$CreateProfileResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProfileResponse(
    profileArn: json['ProfileArn'] as String,
  );
}

Map<String, dynamic> _$CreateRequireCheckInToJson(
    CreateRequireCheckIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('ReleaseAfterMinutes', instance.releaseAfterMinutes);
  return val;
}

CreateRoomResponse _$CreateRoomResponseFromJson(Map<String, dynamic> json) {
  return CreateRoomResponse(
    roomArn: json['RoomArn'] as String,
  );
}

CreateSkillGroupResponse _$CreateSkillGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSkillGroupResponse(
    skillGroupArn: json['SkillGroupArn'] as String,
  );
}

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse(
    userArn: json['UserArn'] as String,
  );
}

DeleteAddressBookResponse _$DeleteAddressBookResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAddressBookResponse();
}

DeleteBusinessReportScheduleResponse
    _$DeleteBusinessReportScheduleResponseFromJson(Map<String, dynamic> json) {
  return DeleteBusinessReportScheduleResponse();
}

DeleteConferenceProviderResponse _$DeleteConferenceProviderResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteConferenceProviderResponse();
}

DeleteContactResponse _$DeleteContactResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteContactResponse();
}

DeleteDeviceResponse _$DeleteDeviceResponseFromJson(Map<String, dynamic> json) {
  return DeleteDeviceResponse();
}

DeleteDeviceUsageDataResponse _$DeleteDeviceUsageDataResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDeviceUsageDataResponse();
}

DeleteGatewayGroupResponse _$DeleteGatewayGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteGatewayGroupResponse();
}

DeleteNetworkProfileResponse _$DeleteNetworkProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteNetworkProfileResponse();
}

DeleteProfileResponse _$DeleteProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProfileResponse();
}

DeleteRoomResponse _$DeleteRoomResponseFromJson(Map<String, dynamic> json) {
  return DeleteRoomResponse();
}

DeleteRoomSkillParameterResponse _$DeleteRoomSkillParameterResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRoomSkillParameterResponse();
}

DeleteSkillAuthorizationResponse _$DeleteSkillAuthorizationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSkillAuthorizationResponse();
}

DeleteSkillGroupResponse _$DeleteSkillGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSkillGroupResponse();
}

DeleteUserResponse _$DeleteUserResponseFromJson(Map<String, dynamic> json) {
  return DeleteUserResponse();
}

DeveloperInfo _$DeveloperInfoFromJson(Map<String, dynamic> json) {
  return DeveloperInfo(
    developerName: json['DeveloperName'] as String,
    email: json['Email'] as String,
    privacyPolicy: json['PrivacyPolicy'] as String,
    url: json['Url'] as String,
  );
}

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return Device(
    deviceArn: json['DeviceArn'] as String,
    deviceName: json['DeviceName'] as String,
    deviceSerialNumber: json['DeviceSerialNumber'] as String,
    deviceStatus:
        _$enumDecodeNullable(_$DeviceStatusEnumMap, json['DeviceStatus']),
    deviceStatusInfo: json['DeviceStatusInfo'] == null
        ? null
        : DeviceStatusInfo.fromJson(
            json['DeviceStatusInfo'] as Map<String, dynamic>),
    deviceType: json['DeviceType'] as String,
    macAddress: json['MacAddress'] as String,
    networkProfileInfo: json['NetworkProfileInfo'] == null
        ? null
        : DeviceNetworkProfileInfo.fromJson(
            json['NetworkProfileInfo'] as Map<String, dynamic>),
    roomArn: json['RoomArn'] as String,
    softwareVersion: json['SoftwareVersion'] as String,
  );
}

const _$DeviceStatusEnumMap = {
  DeviceStatus.ready: 'READY',
  DeviceStatus.pending: 'PENDING',
  DeviceStatus.wasOffline: 'WAS_OFFLINE',
  DeviceStatus.deregistered: 'DEREGISTERED',
  DeviceStatus.failed: 'FAILED',
};

DeviceData _$DeviceDataFromJson(Map<String, dynamic> json) {
  return DeviceData(
    createdTime: const UnixDateTimeConverter().fromJson(json['CreatedTime']),
    deviceArn: json['DeviceArn'] as String,
    deviceName: json['DeviceName'] as String,
    deviceSerialNumber: json['DeviceSerialNumber'] as String,
    deviceStatus:
        _$enumDecodeNullable(_$DeviceStatusEnumMap, json['DeviceStatus']),
    deviceStatusInfo: json['DeviceStatusInfo'] == null
        ? null
        : DeviceStatusInfo.fromJson(
            json['DeviceStatusInfo'] as Map<String, dynamic>),
    deviceType: json['DeviceType'] as String,
    macAddress: json['MacAddress'] as String,
    networkProfileArn: json['NetworkProfileArn'] as String,
    networkProfileName: json['NetworkProfileName'] as String,
    roomArn: json['RoomArn'] as String,
    roomName: json['RoomName'] as String,
    softwareVersion: json['SoftwareVersion'] as String,
  );
}

DeviceEvent _$DeviceEventFromJson(Map<String, dynamic> json) {
  return DeviceEvent(
    timestamp: const UnixDateTimeConverter().fromJson(json['Timestamp']),
    type: _$enumDecodeNullable(_$DeviceEventTypeEnumMap, json['Type']),
    value: json['Value'] as String,
  );
}

const _$DeviceEventTypeEnumMap = {
  DeviceEventType.connectionStatus: 'CONNECTION_STATUS',
  DeviceEventType.deviceStatus: 'DEVICE_STATUS',
};

DeviceNetworkProfileInfo _$DeviceNetworkProfileInfoFromJson(
    Map<String, dynamic> json) {
  return DeviceNetworkProfileInfo(
    certificateArn: json['CertificateArn'] as String,
    certificateExpirationTime: const UnixDateTimeConverter()
        .fromJson(json['CertificateExpirationTime']),
    networkProfileArn: json['NetworkProfileArn'] as String,
  );
}

DeviceStatusDetail _$DeviceStatusDetailFromJson(Map<String, dynamic> json) {
  return DeviceStatusDetail(
    code: _$enumDecodeNullable(_$DeviceStatusDetailCodeEnumMap, json['Code']),
    feature: _$enumDecodeNullable(_$FeatureEnumMap, json['Feature']),
  );
}

const _$DeviceStatusDetailCodeEnumMap = {
  DeviceStatusDetailCode.deviceSoftwareUpdateNeeded:
      'DEVICE_SOFTWARE_UPDATE_NEEDED',
  DeviceStatusDetailCode.deviceWasOffline: 'DEVICE_WAS_OFFLINE',
  DeviceStatusDetailCode.credentialsAccessFailure: 'CREDENTIALS_ACCESS_FAILURE',
  DeviceStatusDetailCode.tlsVersionMismatch: 'TLS_VERSION_MISMATCH',
  DeviceStatusDetailCode.associationRejection: 'ASSOCIATION_REJECTION',
  DeviceStatusDetailCode.authenticationFailure: 'AUTHENTICATION_FAILURE',
  DeviceStatusDetailCode.dhcpFailure: 'DHCP_FAILURE',
  DeviceStatusDetailCode.internetUnavailable: 'INTERNET_UNAVAILABLE',
  DeviceStatusDetailCode.dnsFailure: 'DNS_FAILURE',
  DeviceStatusDetailCode.unknownFailure: 'UNKNOWN_FAILURE',
  DeviceStatusDetailCode.certificateIssuingLimitExceeded:
      'CERTIFICATE_ISSUING_LIMIT_EXCEEDED',
  DeviceStatusDetailCode.invalidCertificateAuthority:
      'INVALID_CERTIFICATE_AUTHORITY',
  DeviceStatusDetailCode.networkProfileNotFound: 'NETWORK_PROFILE_NOT_FOUND',
  DeviceStatusDetailCode.invalidPasswordState: 'INVALID_PASSWORD_STATE',
  DeviceStatusDetailCode.passwordNotFound: 'PASSWORD_NOT_FOUND',
  DeviceStatusDetailCode.passwordManagerAccessDenied:
      'PASSWORD_MANAGER_ACCESS_DENIED',
  DeviceStatusDetailCode.certificateAuthorityAccessDenied:
      'CERTIFICATE_AUTHORITY_ACCESS_DENIED',
};

const _$FeatureEnumMap = {
  Feature.bluetooth: 'BLUETOOTH',
  Feature.volume: 'VOLUME',
  Feature.notifications: 'NOTIFICATIONS',
  Feature.lists: 'LISTS',
  Feature.skills: 'SKILLS',
  Feature.networkProfile: 'NETWORK_PROFILE',
  Feature.settings: 'SETTINGS',
  Feature.all: 'ALL',
};

DeviceStatusInfo _$DeviceStatusInfoFromJson(Map<String, dynamic> json) {
  return DeviceStatusInfo(
    connectionStatus: _$enumDecodeNullable(
        _$ConnectionStatusEnumMap, json['ConnectionStatus']),
    connectionStatusUpdatedTime: const UnixDateTimeConverter()
        .fromJson(json['ConnectionStatusUpdatedTime']),
    deviceStatusDetails: (json['DeviceStatusDetails'] as List)
        ?.map((e) => e == null
            ? null
            : DeviceStatusDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$ConnectionStatusEnumMap = {
  ConnectionStatus.online: 'ONLINE',
  ConnectionStatus.offline: 'OFFLINE',
};

DisassociateContactFromAddressBookResponse
    _$DisassociateContactFromAddressBookResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateContactFromAddressBookResponse();
}

DisassociateDeviceFromRoomResponse _$DisassociateDeviceFromRoomResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateDeviceFromRoomResponse();
}

DisassociateSkillFromSkillGroupResponse
    _$DisassociateSkillFromSkillGroupResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateSkillFromSkillGroupResponse();
}

DisassociateSkillFromUsersResponse _$DisassociateSkillFromUsersResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateSkillFromUsersResponse();
}

DisassociateSkillGroupFromRoomResponse
    _$DisassociateSkillGroupFromRoomResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateSkillGroupFromRoomResponse();
}

EndOfMeetingReminder _$EndOfMeetingReminderFromJson(Map<String, dynamic> json) {
  return EndOfMeetingReminder(
    enabled: json['Enabled'] as bool,
    reminderAtMinutes:
        (json['ReminderAtMinutes'] as List)?.map((e) => e as int)?.toList(),
    reminderType: _$enumDecodeNullable(
        _$EndOfMeetingReminderTypeEnumMap, json['ReminderType']),
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Values', instance.values);
  return val;
}

ForgetSmartHomeAppliancesResponse _$ForgetSmartHomeAppliancesResponseFromJson(
    Map<String, dynamic> json) {
  return ForgetSmartHomeAppliancesResponse();
}

Gateway _$GatewayFromJson(Map<String, dynamic> json) {
  return Gateway(
    arn: json['Arn'] as String,
    description: json['Description'] as String,
    gatewayGroupArn: json['GatewayGroupArn'] as String,
    name: json['Name'] as String,
    softwareVersion: json['SoftwareVersion'] as String,
  );
}

GatewayGroup _$GatewayGroupFromJson(Map<String, dynamic> json) {
  return GatewayGroup(
    arn: json['Arn'] as String,
    description: json['Description'] as String,
    name: json['Name'] as String,
  );
}

GatewayGroupSummary _$GatewayGroupSummaryFromJson(Map<String, dynamic> json) {
  return GatewayGroupSummary(
    arn: json['Arn'] as String,
    description: json['Description'] as String,
    name: json['Name'] as String,
  );
}

GatewaySummary _$GatewaySummaryFromJson(Map<String, dynamic> json) {
  return GatewaySummary(
    arn: json['Arn'] as String,
    description: json['Description'] as String,
    gatewayGroupArn: json['GatewayGroupArn'] as String,
    name: json['Name'] as String,
    softwareVersion: json['SoftwareVersion'] as String,
  );
}

GetAddressBookResponse _$GetAddressBookResponseFromJson(
    Map<String, dynamic> json) {
  return GetAddressBookResponse(
    addressBook: json['AddressBook'] == null
        ? null
        : AddressBook.fromJson(json['AddressBook'] as Map<String, dynamic>),
  );
}

GetConferencePreferenceResponse _$GetConferencePreferenceResponseFromJson(
    Map<String, dynamic> json) {
  return GetConferencePreferenceResponse(
    preference: json['Preference'] == null
        ? null
        : ConferencePreference.fromJson(
            json['Preference'] as Map<String, dynamic>),
  );
}

GetConferenceProviderResponse _$GetConferenceProviderResponseFromJson(
    Map<String, dynamic> json) {
  return GetConferenceProviderResponse(
    conferenceProvider: json['ConferenceProvider'] == null
        ? null
        : ConferenceProvider.fromJson(
            json['ConferenceProvider'] as Map<String, dynamic>),
  );
}

GetContactResponse _$GetContactResponseFromJson(Map<String, dynamic> json) {
  return GetContactResponse(
    contact: json['Contact'] == null
        ? null
        : Contact.fromJson(json['Contact'] as Map<String, dynamic>),
  );
}

GetDeviceResponse _$GetDeviceResponseFromJson(Map<String, dynamic> json) {
  return GetDeviceResponse(
    device: json['Device'] == null
        ? null
        : Device.fromJson(json['Device'] as Map<String, dynamic>),
  );
}

GetGatewayGroupResponse _$GetGatewayGroupResponseFromJson(
    Map<String, dynamic> json) {
  return GetGatewayGroupResponse(
    gatewayGroup: json['GatewayGroup'] == null
        ? null
        : GatewayGroup.fromJson(json['GatewayGroup'] as Map<String, dynamic>),
  );
}

GetGatewayResponse _$GetGatewayResponseFromJson(Map<String, dynamic> json) {
  return GetGatewayResponse(
    gateway: json['Gateway'] == null
        ? null
        : Gateway.fromJson(json['Gateway'] as Map<String, dynamic>),
  );
}

GetInvitationConfigurationResponse _$GetInvitationConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return GetInvitationConfigurationResponse(
    contactEmail: json['ContactEmail'] as String,
    organizationName: json['OrganizationName'] as String,
    privateSkillIds:
        (json['PrivateSkillIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

GetNetworkProfileResponse _$GetNetworkProfileResponseFromJson(
    Map<String, dynamic> json) {
  return GetNetworkProfileResponse(
    networkProfile: json['NetworkProfile'] == null
        ? null
        : NetworkProfile.fromJson(
            json['NetworkProfile'] as Map<String, dynamic>),
  );
}

GetProfileResponse _$GetProfileResponseFromJson(Map<String, dynamic> json) {
  return GetProfileResponse(
    profile: json['Profile'] == null
        ? null
        : Profile.fromJson(json['Profile'] as Map<String, dynamic>),
  );
}

GetRoomResponse _$GetRoomResponseFromJson(Map<String, dynamic> json) {
  return GetRoomResponse(
    room: json['Room'] == null
        ? null
        : Room.fromJson(json['Room'] as Map<String, dynamic>),
  );
}

GetRoomSkillParameterResponse _$GetRoomSkillParameterResponseFromJson(
    Map<String, dynamic> json) {
  return GetRoomSkillParameterResponse(
    roomSkillParameter: json['RoomSkillParameter'] == null
        ? null
        : RoomSkillParameter.fromJson(
            json['RoomSkillParameter'] as Map<String, dynamic>),
  );
}

GetSkillGroupResponse _$GetSkillGroupResponseFromJson(
    Map<String, dynamic> json) {
  return GetSkillGroupResponse(
    skillGroup: json['SkillGroup'] == null
        ? null
        : SkillGroup.fromJson(json['SkillGroup'] as Map<String, dynamic>),
  );
}

IPDialIn _$IPDialInFromJson(Map<String, dynamic> json) {
  return IPDialIn(
    commsProtocol:
        _$enumDecodeNullable(_$CommsProtocolEnumMap, json['CommsProtocol']),
    endpoint: json['Endpoint'] as String,
  );
}

Map<String, dynamic> _$IPDialInToJson(IPDialIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CommsProtocol', _$CommsProtocolEnumMap[instance.commsProtocol]);
  writeNotNull('Endpoint', instance.endpoint);
  return val;
}

const _$CommsProtocolEnumMap = {
  CommsProtocol.sip: 'SIP',
  CommsProtocol.sips: 'SIPS',
  CommsProtocol.h323: 'H323',
};

InstantBooking _$InstantBookingFromJson(Map<String, dynamic> json) {
  return InstantBooking(
    durationInMinutes: json['DurationInMinutes'] as int,
    enabled: json['Enabled'] as bool,
  );
}

ListBusinessReportSchedulesResponse
    _$ListBusinessReportSchedulesResponseFromJson(Map<String, dynamic> json) {
  return ListBusinessReportSchedulesResponse(
    businessReportSchedules: (json['BusinessReportSchedules'] as List)
        ?.map((e) => e == null
            ? null
            : BusinessReportSchedule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListConferenceProvidersResponse _$ListConferenceProvidersResponseFromJson(
    Map<String, dynamic> json) {
  return ListConferenceProvidersResponse(
    conferenceProviders: (json['ConferenceProviders'] as List)
        ?.map((e) => e == null
            ? null
            : ConferenceProvider.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDeviceEventsResponse _$ListDeviceEventsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDeviceEventsResponse(
    deviceEvents: (json['DeviceEvents'] as List)
        ?.map((e) =>
            e == null ? null : DeviceEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListGatewayGroupsResponse _$ListGatewayGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListGatewayGroupsResponse(
    gatewayGroups: (json['GatewayGroups'] as List)
        ?.map((e) => e == null
            ? null
            : GatewayGroupSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListGatewaysResponse _$ListGatewaysResponseFromJson(Map<String, dynamic> json) {
  return ListGatewaysResponse(
    gateways: (json['Gateways'] as List)
        ?.map((e) => e == null
            ? null
            : GatewaySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListSkillsResponse _$ListSkillsResponseFromJson(Map<String, dynamic> json) {
  return ListSkillsResponse(
    nextToken: json['NextToken'] as String,
    skillSummaries: (json['SkillSummaries'] as List)
        ?.map((e) =>
            e == null ? null : SkillSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSkillsStoreCategoriesResponse _$ListSkillsStoreCategoriesResponseFromJson(
    Map<String, dynamic> json) {
  return ListSkillsStoreCategoriesResponse(
    categoryList: (json['CategoryList'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListSkillsStoreSkillsByCategoryResponse
    _$ListSkillsStoreSkillsByCategoryResponseFromJson(
        Map<String, dynamic> json) {
  return ListSkillsStoreSkillsByCategoryResponse(
    nextToken: json['NextToken'] as String,
    skillsStoreSkills: (json['SkillsStoreSkills'] as List)
        ?.map((e) => e == null
            ? null
            : SkillsStoreSkill.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSmartHomeAppliancesResponse _$ListSmartHomeAppliancesResponseFromJson(
    Map<String, dynamic> json) {
  return ListSmartHomeAppliancesResponse(
    nextToken: json['NextToken'] as String,
    smartHomeAppliances: (json['SmartHomeAppliances'] as List)
        ?.map((e) => e == null
            ? null
            : SmartHomeAppliance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsResponse _$ListTagsResponseFromJson(Map<String, dynamic> json) {
  return ListTagsResponse(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MeetingRoomConfiguration _$MeetingRoomConfigurationFromJson(
    Map<String, dynamic> json) {
  return MeetingRoomConfiguration(
    endOfMeetingReminder: json['EndOfMeetingReminder'] == null
        ? null
        : EndOfMeetingReminder.fromJson(
            json['EndOfMeetingReminder'] as Map<String, dynamic>),
    instantBooking: json['InstantBooking'] == null
        ? null
        : InstantBooking.fromJson(
            json['InstantBooking'] as Map<String, dynamic>),
    requireCheckIn: json['RequireCheckIn'] == null
        ? null
        : RequireCheckIn.fromJson(
            json['RequireCheckIn'] as Map<String, dynamic>),
    roomUtilizationMetricsEnabled:
        json['RoomUtilizationMetricsEnabled'] as bool,
  );
}

MeetingSetting _$MeetingSettingFromJson(Map<String, dynamic> json) {
  return MeetingSetting(
    requirePin: _$enumDecodeNullable(_$RequirePinEnumMap, json['RequirePin']),
  );
}

Map<String, dynamic> _$MeetingSettingToJson(MeetingSetting instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RequirePin', _$RequirePinEnumMap[instance.requirePin]);
  return val;
}

const _$RequirePinEnumMap = {
  RequirePin.yes: 'YES',
  RequirePin.no: 'NO',
  RequirePin.optional: 'OPTIONAL',
};

NetworkProfile _$NetworkProfileFromJson(Map<String, dynamic> json) {
  return NetworkProfile(
    certificateAuthorityArn: json['CertificateAuthorityArn'] as String,
    currentPassword: json['CurrentPassword'] as String,
    description: json['Description'] as String,
    eapMethod:
        _$enumDecodeNullable(_$NetworkEapMethodEnumMap, json['EapMethod']),
    networkProfileArn: json['NetworkProfileArn'] as String,
    networkProfileName: json['NetworkProfileName'] as String,
    nextPassword: json['NextPassword'] as String,
    securityType: _$enumDecodeNullable(
        _$NetworkSecurityTypeEnumMap, json['SecurityType']),
    ssid: json['Ssid'] as String,
    trustAnchors:
        (json['TrustAnchors'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$NetworkEapMethodEnumMap = {
  NetworkEapMethod.eapTls: 'EAP_TLS',
};

const _$NetworkSecurityTypeEnumMap = {
  NetworkSecurityType.open: 'OPEN',
  NetworkSecurityType.wep: 'WEP',
  NetworkSecurityType.wpaPsk: 'WPA_PSK',
  NetworkSecurityType.wpa2Psk: 'WPA2_PSK',
  NetworkSecurityType.wpa2Enterprise: 'WPA2_ENTERPRISE',
};

NetworkProfileData _$NetworkProfileDataFromJson(Map<String, dynamic> json) {
  return NetworkProfileData(
    certificateAuthorityArn: json['CertificateAuthorityArn'] as String,
    description: json['Description'] as String,
    eapMethod:
        _$enumDecodeNullable(_$NetworkEapMethodEnumMap, json['EapMethod']),
    networkProfileArn: json['NetworkProfileArn'] as String,
    networkProfileName: json['NetworkProfileName'] as String,
    securityType: _$enumDecodeNullable(
        _$NetworkSecurityTypeEnumMap, json['SecurityType']),
    ssid: json['Ssid'] as String,
  );
}

PSTNDialIn _$PSTNDialInFromJson(Map<String, dynamic> json) {
  return PSTNDialIn(
    countryCode: json['CountryCode'] as String,
    oneClickIdDelay: json['OneClickIdDelay'] as String,
    oneClickPinDelay: json['OneClickPinDelay'] as String,
    phoneNumber: json['PhoneNumber'] as String,
  );
}

Map<String, dynamic> _$PSTNDialInToJson(PSTNDialIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CountryCode', instance.countryCode);
  writeNotNull('OneClickIdDelay', instance.oneClickIdDelay);
  writeNotNull('OneClickPinDelay', instance.oneClickPinDelay);
  writeNotNull('PhoneNumber', instance.phoneNumber);
  return val;
}

PhoneNumber _$PhoneNumberFromJson(Map<String, dynamic> json) {
  return PhoneNumber(
    number: json['Number'] as String,
    type: _$enumDecodeNullable(_$PhoneNumberTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$PhoneNumberToJson(PhoneNumber instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Number', instance.number);
  writeNotNull('Type', _$PhoneNumberTypeEnumMap[instance.type]);
  return val;
}

const _$PhoneNumberTypeEnumMap = {
  PhoneNumberType.mobile: 'MOBILE',
  PhoneNumberType.work: 'WORK',
  PhoneNumberType.home: 'HOME',
};

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    address: json['Address'] as String,
    addressBookArn: json['AddressBookArn'] as String,
    distanceUnit:
        _$enumDecodeNullable(_$DistanceUnitEnumMap, json['DistanceUnit']),
    isDefault: json['IsDefault'] as bool,
    locale: json['Locale'] as String,
    maxVolumeLimit: json['MaxVolumeLimit'] as int,
    meetingRoomConfiguration: json['MeetingRoomConfiguration'] == null
        ? null
        : MeetingRoomConfiguration.fromJson(
            json['MeetingRoomConfiguration'] as Map<String, dynamic>),
    pSTNEnabled: json['PSTNEnabled'] as bool,
    profileArn: json['ProfileArn'] as String,
    profileName: json['ProfileName'] as String,
    setupModeDisabled: json['SetupModeDisabled'] as bool,
    temperatureUnit:
        _$enumDecodeNullable(_$TemperatureUnitEnumMap, json['TemperatureUnit']),
    timezone: json['Timezone'] as String,
    wakeWord: _$enumDecodeNullable(_$WakeWordEnumMap, json['WakeWord']),
  );
}

const _$DistanceUnitEnumMap = {
  DistanceUnit.metric: 'METRIC',
  DistanceUnit.imperial: 'IMPERIAL',
};

const _$TemperatureUnitEnumMap = {
  TemperatureUnit.fahrenheit: 'FAHRENHEIT',
  TemperatureUnit.celsius: 'CELSIUS',
};

const _$WakeWordEnumMap = {
  WakeWord.alexa: 'ALEXA',
  WakeWord.amazon: 'AMAZON',
  WakeWord.echo: 'ECHO',
  WakeWord.computer: 'COMPUTER',
};

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return ProfileData(
    address: json['Address'] as String,
    distanceUnit:
        _$enumDecodeNullable(_$DistanceUnitEnumMap, json['DistanceUnit']),
    isDefault: json['IsDefault'] as bool,
    locale: json['Locale'] as String,
    profileArn: json['ProfileArn'] as String,
    profileName: json['ProfileName'] as String,
    temperatureUnit:
        _$enumDecodeNullable(_$TemperatureUnitEnumMap, json['TemperatureUnit']),
    timezone: json['Timezone'] as String,
    wakeWord: _$enumDecodeNullable(_$WakeWordEnumMap, json['WakeWord']),
  );
}

PutConferencePreferenceResponse _$PutConferencePreferenceResponseFromJson(
    Map<String, dynamic> json) {
  return PutConferencePreferenceResponse();
}

PutInvitationConfigurationResponse _$PutInvitationConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return PutInvitationConfigurationResponse();
}

PutRoomSkillParameterResponse _$PutRoomSkillParameterResponseFromJson(
    Map<String, dynamic> json) {
  return PutRoomSkillParameterResponse();
}

PutSkillAuthorizationResponse _$PutSkillAuthorizationResponseFromJson(
    Map<String, dynamic> json) {
  return PutSkillAuthorizationResponse();
}

RegisterAVSDeviceResponse _$RegisterAVSDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterAVSDeviceResponse(
    deviceArn: json['DeviceArn'] as String,
  );
}

RejectSkillResponse _$RejectSkillResponseFromJson(Map<String, dynamic> json) {
  return RejectSkillResponse();
}

RequireCheckIn _$RequireCheckInFromJson(Map<String, dynamic> json) {
  return RequireCheckIn(
    enabled: json['Enabled'] as bool,
    releaseAfterMinutes: json['ReleaseAfterMinutes'] as int,
  );
}

ResolveRoomResponse _$ResolveRoomResponseFromJson(Map<String, dynamic> json) {
  return ResolveRoomResponse(
    roomArn: json['RoomArn'] as String,
    roomName: json['RoomName'] as String,
    roomSkillParameters: (json['RoomSkillParameters'] as List)
        ?.map((e) => e == null
            ? null
            : RoomSkillParameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RevokeInvitationResponse _$RevokeInvitationResponseFromJson(
    Map<String, dynamic> json) {
  return RevokeInvitationResponse();
}

Room _$RoomFromJson(Map<String, dynamic> json) {
  return Room(
    description: json['Description'] as String,
    profileArn: json['ProfileArn'] as String,
    providerCalendarId: json['ProviderCalendarId'] as String,
    roomArn: json['RoomArn'] as String,
    roomName: json['RoomName'] as String,
  );
}

RoomData _$RoomDataFromJson(Map<String, dynamic> json) {
  return RoomData(
    description: json['Description'] as String,
    profileArn: json['ProfileArn'] as String,
    profileName: json['ProfileName'] as String,
    providerCalendarId: json['ProviderCalendarId'] as String,
    roomArn: json['RoomArn'] as String,
    roomName: json['RoomName'] as String,
  );
}

RoomSkillParameter _$RoomSkillParameterFromJson(Map<String, dynamic> json) {
  return RoomSkillParameter(
    parameterKey: json['ParameterKey'] as String,
    parameterValue: json['ParameterValue'] as String,
  );
}

Map<String, dynamic> _$RoomSkillParameterToJson(RoomSkillParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ParameterKey', instance.parameterKey);
  writeNotNull('ParameterValue', instance.parameterValue);
  return val;
}

SearchAddressBooksResponse _$SearchAddressBooksResponseFromJson(
    Map<String, dynamic> json) {
  return SearchAddressBooksResponse(
    addressBooks: (json['AddressBooks'] as List)
        ?.map((e) => e == null
            ? null
            : AddressBookData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    totalCount: json['TotalCount'] as int,
  );
}

SearchContactsResponse _$SearchContactsResponseFromJson(
    Map<String, dynamic> json) {
  return SearchContactsResponse(
    contacts: (json['Contacts'] as List)
        ?.map((e) =>
            e == null ? null : ContactData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    totalCount: json['TotalCount'] as int,
  );
}

SearchDevicesResponse _$SearchDevicesResponseFromJson(
    Map<String, dynamic> json) {
  return SearchDevicesResponse(
    devices: (json['Devices'] as List)
        ?.map((e) =>
            e == null ? null : DeviceData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    totalCount: json['TotalCount'] as int,
  );
}

SearchNetworkProfilesResponse _$SearchNetworkProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return SearchNetworkProfilesResponse(
    networkProfiles: (json['NetworkProfiles'] as List)
        ?.map((e) => e == null
            ? null
            : NetworkProfileData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
    totalCount: json['TotalCount'] as int,
  );
}

SearchProfilesResponse _$SearchProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return SearchProfilesResponse(
    nextToken: json['NextToken'] as String,
    profiles: (json['Profiles'] as List)
        ?.map((e) =>
            e == null ? null : ProfileData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalCount: json['TotalCount'] as int,
  );
}

SearchRoomsResponse _$SearchRoomsResponseFromJson(Map<String, dynamic> json) {
  return SearchRoomsResponse(
    nextToken: json['NextToken'] as String,
    rooms: (json['Rooms'] as List)
        ?.map((e) =>
            e == null ? null : RoomData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalCount: json['TotalCount'] as int,
  );
}

SearchSkillGroupsResponse _$SearchSkillGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return SearchSkillGroupsResponse(
    nextToken: json['NextToken'] as String,
    skillGroups: (json['SkillGroups'] as List)
        ?.map((e) => e == null
            ? null
            : SkillGroupData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalCount: json['TotalCount'] as int,
  );
}

SearchUsersResponse _$SearchUsersResponseFromJson(Map<String, dynamic> json) {
  return SearchUsersResponse(
    nextToken: json['NextToken'] as String,
    totalCount: json['TotalCount'] as int,
    users: (json['Users'] as List)
        ?.map((e) =>
            e == null ? null : UserData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SendAnnouncementResponse _$SendAnnouncementResponseFromJson(
    Map<String, dynamic> json) {
  return SendAnnouncementResponse(
    announcementArn: json['AnnouncementArn'] as String,
  );
}

SendInvitationResponse _$SendInvitationResponseFromJson(
    Map<String, dynamic> json) {
  return SendInvitationResponse();
}

SipAddress _$SipAddressFromJson(Map<String, dynamic> json) {
  return SipAddress(
    type: _$enumDecodeNullable(_$SipTypeEnumMap, json['Type']),
    uri: json['Uri'] as String,
  );
}

Map<String, dynamic> _$SipAddressToJson(SipAddress instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$SipTypeEnumMap[instance.type]);
  writeNotNull('Uri', instance.uri);
  return val;
}

const _$SipTypeEnumMap = {
  SipType.work: 'WORK',
};

SkillDetails _$SkillDetailsFromJson(Map<String, dynamic> json) {
  return SkillDetails(
    bulletPoints:
        (json['BulletPoints'] as List)?.map((e) => e as String)?.toList(),
    developerInfo: json['DeveloperInfo'] == null
        ? null
        : DeveloperInfo.fromJson(json['DeveloperInfo'] as Map<String, dynamic>),
    endUserLicenseAgreement: json['EndUserLicenseAgreement'] as String,
    genericKeywords:
        (json['GenericKeywords'] as List)?.map((e) => e as String)?.toList(),
    invocationPhrase: json['InvocationPhrase'] as String,
    newInThisVersionBulletPoints: (json['NewInThisVersionBulletPoints'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    productDescription: json['ProductDescription'] as String,
    releaseDate: json['ReleaseDate'] as String,
    reviews: (json['Reviews'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    skillTypes: (json['SkillTypes'] as List)?.map((e) => e as String)?.toList(),
  );
}

SkillGroup _$SkillGroupFromJson(Map<String, dynamic> json) {
  return SkillGroup(
    description: json['Description'] as String,
    skillGroupArn: json['SkillGroupArn'] as String,
    skillGroupName: json['SkillGroupName'] as String,
  );
}

SkillGroupData _$SkillGroupDataFromJson(Map<String, dynamic> json) {
  return SkillGroupData(
    description: json['Description'] as String,
    skillGroupArn: json['SkillGroupArn'] as String,
    skillGroupName: json['SkillGroupName'] as String,
  );
}

SkillSummary _$SkillSummaryFromJson(Map<String, dynamic> json) {
  return SkillSummary(
    enablementType:
        _$enumDecodeNullable(_$EnablementTypeEnumMap, json['EnablementType']),
    skillId: json['SkillId'] as String,
    skillName: json['SkillName'] as String,
    skillType: _$enumDecodeNullable(_$SkillTypeEnumMap, json['SkillType']),
    supportsLinking: json['SupportsLinking'] as bool,
  );
}

const _$EnablementTypeEnumMap = {
  EnablementType.enabled: 'ENABLED',
  EnablementType.pending: 'PENDING',
};

const _$SkillTypeEnumMap = {
  SkillType.public: 'PUBLIC',
  SkillType.private: 'PRIVATE',
};

SkillsStoreSkill _$SkillsStoreSkillFromJson(Map<String, dynamic> json) {
  return SkillsStoreSkill(
    iconUrl: json['IconUrl'] as String,
    sampleUtterances:
        (json['SampleUtterances'] as List)?.map((e) => e as String)?.toList(),
    shortDescription: json['ShortDescription'] as String,
    skillDetails: json['SkillDetails'] == null
        ? null
        : SkillDetails.fromJson(json['SkillDetails'] as Map<String, dynamic>),
    skillId: json['SkillId'] as String,
    skillName: json['SkillName'] as String,
    supportsLinking: json['SupportsLinking'] as bool,
  );
}

SmartHomeAppliance _$SmartHomeApplianceFromJson(Map<String, dynamic> json) {
  return SmartHomeAppliance(
    description: json['Description'] as String,
    friendlyName: json['FriendlyName'] as String,
    manufacturerName: json['ManufacturerName'] as String,
  );
}

Map<String, dynamic> _$SortToJson(Sort instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', _$SortValueEnumMap[instance.value]);
  return val;
}

const _$SortValueEnumMap = {
  SortValue.asc: 'ASC',
  SortValue.desc: 'DESC',
};

Map<String, dynamic> _$SsmlToJson(Ssml instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Locale', _$LocaleEnumMap[instance.locale]);
  writeNotNull('Value', instance.value);
  return val;
}

StartDeviceSyncResponse _$StartDeviceSyncResponseFromJson(
    Map<String, dynamic> json) {
  return StartDeviceSyncResponse();
}

StartSmartHomeApplianceDiscoveryResponse
    _$StartSmartHomeApplianceDiscoveryResponseFromJson(
        Map<String, dynamic> json) {
  return StartSmartHomeApplianceDiscoveryResponse();
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Map<String, dynamic> _$TextToJson(Text instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Locale', _$LocaleEnumMap[instance.locale]);
  writeNotNull('Value', instance.value);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateAddressBookResponse _$UpdateAddressBookResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAddressBookResponse();
}

UpdateBusinessReportScheduleResponse
    _$UpdateBusinessReportScheduleResponseFromJson(Map<String, dynamic> json) {
  return UpdateBusinessReportScheduleResponse();
}

UpdateConferenceProviderResponse _$UpdateConferenceProviderResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateConferenceProviderResponse();
}

UpdateContactResponse _$UpdateContactResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateContactResponse();
}

UpdateDeviceResponse _$UpdateDeviceResponseFromJson(Map<String, dynamic> json) {
  return UpdateDeviceResponse();
}

Map<String, dynamic> _$UpdateEndOfMeetingReminderToJson(
    UpdateEndOfMeetingReminder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('ReminderAtMinutes', instance.reminderAtMinutes);
  writeNotNull(
      'ReminderType', _$EndOfMeetingReminderTypeEnumMap[instance.reminderType]);
  return val;
}

UpdateGatewayGroupResponse _$UpdateGatewayGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateGatewayGroupResponse();
}

UpdateGatewayResponse _$UpdateGatewayResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateGatewayResponse();
}

Map<String, dynamic> _$UpdateInstantBookingToJson(
    UpdateInstantBooking instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DurationInMinutes', instance.durationInMinutes);
  writeNotNull('Enabled', instance.enabled);
  return val;
}

Map<String, dynamic> _$UpdateMeetingRoomConfigurationToJson(
    UpdateMeetingRoomConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndOfMeetingReminder', instance.endOfMeetingReminder?.toJson());
  writeNotNull('InstantBooking', instance.instantBooking?.toJson());
  writeNotNull('RequireCheckIn', instance.requireCheckIn?.toJson());
  writeNotNull(
      'RoomUtilizationMetricsEnabled', instance.roomUtilizationMetricsEnabled);
  return val;
}

UpdateNetworkProfileResponse _$UpdateNetworkProfileResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateNetworkProfileResponse();
}

UpdateProfileResponse _$UpdateProfileResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProfileResponse();
}

Map<String, dynamic> _$UpdateRequireCheckInToJson(
    UpdateRequireCheckIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('ReleaseAfterMinutes', instance.releaseAfterMinutes);
  return val;
}

UpdateRoomResponse _$UpdateRoomResponseFromJson(Map<String, dynamic> json) {
  return UpdateRoomResponse();
}

UpdateSkillGroupResponse _$UpdateSkillGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSkillGroupResponse();
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    email: json['Email'] as String,
    enrollmentId: json['EnrollmentId'] as String,
    enrollmentStatus: _$enumDecodeNullable(
        _$EnrollmentStatusEnumMap, json['EnrollmentStatus']),
    firstName: json['FirstName'] as String,
    lastName: json['LastName'] as String,
    userArn: json['UserArn'] as String,
  );
}

const _$EnrollmentStatusEnumMap = {
  EnrollmentStatus.initialized: 'INITIALIZED',
  EnrollmentStatus.pending: 'PENDING',
  EnrollmentStatus.registered: 'REGISTERED',
  EnrollmentStatus.disassociating: 'DISASSOCIATING',
  EnrollmentStatus.deregistering: 'DEREGISTERING',
};
