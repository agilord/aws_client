// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-08-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProfileKeyResponse _$AddProfileKeyResponseFromJson(
    Map<String, dynamic> json) {
  return AddProfileKeyResponse(
    keyName: json['KeyName'] as String,
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    address1: json['Address1'] as String,
    address2: json['Address2'] as String,
    address3: json['Address3'] as String,
    address4: json['Address4'] as String,
    city: json['City'] as String,
    country: json['Country'] as String,
    county: json['County'] as String,
    postalCode: json['PostalCode'] as String,
    province: json['Province'] as String,
    state: json['State'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address1', instance.address1);
  writeNotNull('Address2', instance.address2);
  writeNotNull('Address3', instance.address3);
  writeNotNull('Address4', instance.address4);
  writeNotNull('City', instance.city);
  writeNotNull('Country', instance.country);
  writeNotNull('County', instance.county);
  writeNotNull('PostalCode', instance.postalCode);
  writeNotNull('Province', instance.province);
  writeNotNull('State', instance.state);
  return val;
}

CreateDomainResponse _$CreateDomainResponseFromJson(Map<String, dynamic> json) {
  return CreateDomainResponse(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    defaultExpirationDays: json['DefaultExpirationDays'] as int,
    domainName: json['DomainName'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    deadLetterQueueUrl: json['DeadLetterQueueUrl'] as String,
    defaultEncryptionKey: json['DefaultEncryptionKey'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CreateProfileResponse _$CreateProfileResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProfileResponse(
    profileId: json['ProfileId'] as String,
  );
}

DeleteDomainResponse _$DeleteDomainResponseFromJson(Map<String, dynamic> json) {
  return DeleteDomainResponse(
    message: json['Message'] as String,
  );
}

DeleteIntegrationResponse _$DeleteIntegrationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteIntegrationResponse(
    message: json['Message'] as String,
  );
}

DeleteProfileKeyResponse _$DeleteProfileKeyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProfileKeyResponse(
    message: json['Message'] as String,
  );
}

DeleteProfileObjectResponse _$DeleteProfileObjectResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProfileObjectResponse(
    message: json['Message'] as String,
  );
}

DeleteProfileObjectTypeResponse _$DeleteProfileObjectTypeResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProfileObjectTypeResponse(
    message: json['Message'] as String,
  );
}

DeleteProfileResponse _$DeleteProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProfileResponse(
    message: json['Message'] as String,
  );
}

DomainStats _$DomainStatsFromJson(Map<String, dynamic> json) {
  return DomainStats(
    meteringProfileCount: json['MeteringProfileCount'] as int,
    objectCount: json['ObjectCount'] as int,
    profileCount: json['ProfileCount'] as int,
    totalSize: json['TotalSize'] as int,
  );
}

GetDomainResponse _$GetDomainResponseFromJson(Map<String, dynamic> json) {
  return GetDomainResponse(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    domainName: json['DomainName'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    deadLetterQueueUrl: json['DeadLetterQueueUrl'] as String,
    defaultEncryptionKey: json['DefaultEncryptionKey'] as String,
    defaultExpirationDays: json['DefaultExpirationDays'] as int,
    stats: json['Stats'] == null
        ? null
        : DomainStats.fromJson(json['Stats'] as Map<String, dynamic>),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetIntegrationResponse _$GetIntegrationResponseFromJson(
    Map<String, dynamic> json) {
  return GetIntegrationResponse(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    domainName: json['DomainName'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    objectTypeName: json['ObjectTypeName'] as String,
    uri: json['Uri'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetProfileObjectTypeResponse _$GetProfileObjectTypeResponseFromJson(
    Map<String, dynamic> json) {
  return GetProfileObjectTypeResponse(
    description: json['Description'] as String,
    objectTypeName: json['ObjectTypeName'] as String,
    allowProfileCreation: json['AllowProfileCreation'] as bool,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    encryptionKey: json['EncryptionKey'] as String,
    expirationDays: json['ExpirationDays'] as int,
    fields: (json['Fields'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ObjectTypeField.fromJson(e as Map<String, dynamic>)),
    ),
    keys: (json['Keys'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : ObjectTypeKey.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    templateId: json['TemplateId'] as String,
  );
}

GetProfileObjectTypeTemplateResponse
    _$GetProfileObjectTypeTemplateResponseFromJson(Map<String, dynamic> json) {
  return GetProfileObjectTypeTemplateResponse(
    allowProfileCreation: json['AllowProfileCreation'] as bool,
    fields: (json['Fields'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ObjectTypeField.fromJson(e as Map<String, dynamic>)),
    ),
    keys: (json['Keys'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : ObjectTypeKey.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
    sourceName: json['SourceName'] as String,
    sourceObject: json['SourceObject'] as String,
    templateId: json['TemplateId'] as String,
  );
}

ListAccountIntegrationsResponse _$ListAccountIntegrationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAccountIntegrationsResponse(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : ListIntegrationItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDomainItem _$ListDomainItemFromJson(Map<String, dynamic> json) {
  return ListDomainItem(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    domainName: json['DomainName'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListDomainsResponse _$ListDomainsResponseFromJson(Map<String, dynamic> json) {
  return ListDomainsResponse(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : ListDomainItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListIntegrationItem _$ListIntegrationItemFromJson(Map<String, dynamic> json) {
  return ListIntegrationItem(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    domainName: json['DomainName'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    objectTypeName: json['ObjectTypeName'] as String,
    uri: json['Uri'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListIntegrationsResponse _$ListIntegrationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListIntegrationsResponse(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : ListIntegrationItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListProfileObjectTypeItem _$ListProfileObjectTypeItemFromJson(
    Map<String, dynamic> json) {
  return ListProfileObjectTypeItem(
    description: json['Description'] as String,
    objectTypeName: json['ObjectTypeName'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListProfileObjectTypeTemplateItem _$ListProfileObjectTypeTemplateItemFromJson(
    Map<String, dynamic> json) {
  return ListProfileObjectTypeTemplateItem(
    sourceName: json['SourceName'] as String,
    sourceObject: json['SourceObject'] as String,
    templateId: json['TemplateId'] as String,
  );
}

ListProfileObjectTypeTemplatesResponse
    _$ListProfileObjectTypeTemplatesResponseFromJson(
        Map<String, dynamic> json) {
  return ListProfileObjectTypeTemplatesResponse(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : ListProfileObjectTypeTemplateItem.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListProfileObjectTypesResponse _$ListProfileObjectTypesResponseFromJson(
    Map<String, dynamic> json) {
  return ListProfileObjectTypesResponse(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : ListProfileObjectTypeItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListProfileObjectsItem _$ListProfileObjectsItemFromJson(
    Map<String, dynamic> json) {
  return ListProfileObjectsItem(
    object: json['Object'] as String,
    objectTypeName: json['ObjectTypeName'] as String,
    profileObjectUniqueKey: json['ProfileObjectUniqueKey'] as String,
  );
}

ListProfileObjectsResponse _$ListProfileObjectsResponseFromJson(
    Map<String, dynamic> json) {
  return ListProfileObjectsResponse(
    items: (json['Items'] as List)
        ?.map((e) => e == null
            ? null
            : ListProfileObjectsItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ObjectTypeField _$ObjectTypeFieldFromJson(Map<String, dynamic> json) {
  return ObjectTypeField(
    contentType:
        _$enumDecodeNullable(_$FieldContentTypeEnumMap, json['ContentType']),
    source: json['Source'] as String,
    target: json['Target'] as String,
  );
}

Map<String, dynamic> _$ObjectTypeFieldToJson(ObjectTypeField instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContentType', _$FieldContentTypeEnumMap[instance.contentType]);
  writeNotNull('Source', instance.source);
  writeNotNull('Target', instance.target);
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

const _$FieldContentTypeEnumMap = {
  FieldContentType.string: 'STRING',
  FieldContentType.number: 'NUMBER',
  FieldContentType.phoneNumber: 'PHONE_NUMBER',
  FieldContentType.emailAddress: 'EMAIL_ADDRESS',
  FieldContentType.name: 'NAME',
};

ObjectTypeKey _$ObjectTypeKeyFromJson(Map<String, dynamic> json) {
  return ObjectTypeKey(
    fieldNames: (json['FieldNames'] as List)?.map((e) => e as String)?.toList(),
    standardIdentifiers: (json['StandardIdentifiers'] as List)
        ?.map((e) => _$enumDecodeNullable(_$StandardIdentifierEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$ObjectTypeKeyToJson(ObjectTypeKey instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldNames', instance.fieldNames);
  writeNotNull(
      'StandardIdentifiers',
      instance.standardIdentifiers
          ?.map((e) => _$StandardIdentifierEnumMap[e])
          ?.toList());
  return val;
}

const _$StandardIdentifierEnumMap = {
  StandardIdentifier.profile: 'PROFILE',
  StandardIdentifier.unique: 'UNIQUE',
  StandardIdentifier.secondary: 'SECONDARY',
  StandardIdentifier.lookupOnly: 'LOOKUP_ONLY',
  StandardIdentifier.newOnly: 'NEW_ONLY',
};

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    accountNumber: json['AccountNumber'] as String,
    additionalInformation: json['AdditionalInformation'] as String,
    address: json['Address'] == null
        ? null
        : Address.fromJson(json['Address'] as Map<String, dynamic>),
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    billingAddress: json['BillingAddress'] == null
        ? null
        : Address.fromJson(json['BillingAddress'] as Map<String, dynamic>),
    birthDate: json['BirthDate'] as String,
    businessEmailAddress: json['BusinessEmailAddress'] as String,
    businessName: json['BusinessName'] as String,
    businessPhoneNumber: json['BusinessPhoneNumber'] as String,
    emailAddress: json['EmailAddress'] as String,
    firstName: json['FirstName'] as String,
    gender: _$enumDecodeNullable(_$GenderEnumMap, json['Gender']),
    homePhoneNumber: json['HomePhoneNumber'] as String,
    lastName: json['LastName'] as String,
    mailingAddress: json['MailingAddress'] == null
        ? null
        : Address.fromJson(json['MailingAddress'] as Map<String, dynamic>),
    middleName: json['MiddleName'] as String,
    mobilePhoneNumber: json['MobilePhoneNumber'] as String,
    partyType: _$enumDecodeNullable(_$PartyTypeEnumMap, json['PartyType']),
    personalEmailAddress: json['PersonalEmailAddress'] as String,
    phoneNumber: json['PhoneNumber'] as String,
    profileId: json['ProfileId'] as String,
    shippingAddress: json['ShippingAddress'] == null
        ? null
        : Address.fromJson(json['ShippingAddress'] as Map<String, dynamic>),
  );
}

const _$GenderEnumMap = {
  Gender.male: 'MALE',
  Gender.female: 'FEMALE',
  Gender.unspecified: 'UNSPECIFIED',
};

const _$PartyTypeEnumMap = {
  PartyType.individual: 'INDIVIDUAL',
  PartyType.business: 'BUSINESS',
  PartyType.other: 'OTHER',
};

PutIntegrationResponse _$PutIntegrationResponseFromJson(
    Map<String, dynamic> json) {
  return PutIntegrationResponse(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    domainName: json['DomainName'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    objectTypeName: json['ObjectTypeName'] as String,
    uri: json['Uri'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

PutProfileObjectResponse _$PutProfileObjectResponseFromJson(
    Map<String, dynamic> json) {
  return PutProfileObjectResponse(
    profileObjectUniqueKey: json['ProfileObjectUniqueKey'] as String,
  );
}

PutProfileObjectTypeResponse _$PutProfileObjectTypeResponseFromJson(
    Map<String, dynamic> json) {
  return PutProfileObjectTypeResponse(
    description: json['Description'] as String,
    objectTypeName: json['ObjectTypeName'] as String,
    allowProfileCreation: json['AllowProfileCreation'] as bool,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    encryptionKey: json['EncryptionKey'] as String,
    expirationDays: json['ExpirationDays'] as int,
    fields: (json['Fields'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ObjectTypeField.fromJson(e as Map<String, dynamic>)),
    ),
    keys: (json['Keys'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : ObjectTypeKey.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    templateId: json['TemplateId'] as String,
  );
}

SearchProfilesResponse _$SearchProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return SearchProfilesResponse(
    items: (json['Items'] as List)
        ?.map((e) =>
            e == null ? null : Profile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

Map<String, dynamic> _$UpdateAddressToJson(UpdateAddress instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address1', instance.address1);
  writeNotNull('Address2', instance.address2);
  writeNotNull('Address3', instance.address3);
  writeNotNull('Address4', instance.address4);
  writeNotNull('City', instance.city);
  writeNotNull('Country', instance.country);
  writeNotNull('County', instance.county);
  writeNotNull('PostalCode', instance.postalCode);
  writeNotNull('Province', instance.province);
  writeNotNull('State', instance.state);
  return val;
}

UpdateDomainResponse _$UpdateDomainResponseFromJson(Map<String, dynamic> json) {
  return UpdateDomainResponse(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    domainName: json['DomainName'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedAt']),
    deadLetterQueueUrl: json['DeadLetterQueueUrl'] as String,
    defaultEncryptionKey: json['DefaultEncryptionKey'] as String,
    defaultExpirationDays: json['DefaultExpirationDays'] as int,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

UpdateProfileResponse _$UpdateProfileResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProfileResponse(
    profileId: json['ProfileId'] as String,
  );
}
