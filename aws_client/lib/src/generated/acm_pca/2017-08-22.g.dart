// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-08-22.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ASN1Subject _$ASN1SubjectFromJson(Map<String, dynamic> json) {
  return ASN1Subject(
    commonName: json['CommonName'] as String,
    country: json['Country'] as String,
    distinguishedNameQualifier: json['DistinguishedNameQualifier'] as String,
    generationQualifier: json['GenerationQualifier'] as String,
    givenName: json['GivenName'] as String,
    initials: json['Initials'] as String,
    locality: json['Locality'] as String,
    organization: json['Organization'] as String,
    organizationalUnit: json['OrganizationalUnit'] as String,
    pseudonym: json['Pseudonym'] as String,
    serialNumber: json['SerialNumber'] as String,
    state: json['State'] as String,
    surname: json['Surname'] as String,
    title: json['Title'] as String,
  );
}

Map<String, dynamic> _$ASN1SubjectToJson(ASN1Subject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CommonName', instance.commonName);
  writeNotNull('Country', instance.country);
  writeNotNull(
      'DistinguishedNameQualifier', instance.distinguishedNameQualifier);
  writeNotNull('GenerationQualifier', instance.generationQualifier);
  writeNotNull('GivenName', instance.givenName);
  writeNotNull('Initials', instance.initials);
  writeNotNull('Locality', instance.locality);
  writeNotNull('Organization', instance.organization);
  writeNotNull('OrganizationalUnit', instance.organizationalUnit);
  writeNotNull('Pseudonym', instance.pseudonym);
  writeNotNull('SerialNumber', instance.serialNumber);
  writeNotNull('State', instance.state);
  writeNotNull('Surname', instance.surname);
  writeNotNull('Title', instance.title);
  return val;
}

AccessDescription _$AccessDescriptionFromJson(Map<String, dynamic> json) {
  return AccessDescription(
    accessLocation: json['AccessLocation'] == null
        ? null
        : GeneralName.fromJson(json['AccessLocation'] as Map<String, dynamic>),
    accessMethod: json['AccessMethod'] == null
        ? null
        : AccessMethod.fromJson(json['AccessMethod'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccessDescriptionToJson(AccessDescription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccessLocation', instance.accessLocation?.toJson());
  writeNotNull('AccessMethod', instance.accessMethod?.toJson());
  return val;
}

AccessMethod _$AccessMethodFromJson(Map<String, dynamic> json) {
  return AccessMethod(
    accessMethodType: _$enumDecodeNullable(
        _$AccessMethodTypeEnumMap, json['AccessMethodType']),
    customObjectIdentifier: json['CustomObjectIdentifier'] as String,
  );
}

Map<String, dynamic> _$AccessMethodToJson(AccessMethod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AccessMethodType', _$AccessMethodTypeEnumMap[instance.accessMethodType]);
  writeNotNull('CustomObjectIdentifier', instance.customObjectIdentifier);
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

const _$AccessMethodTypeEnumMap = {
  AccessMethodType.caRepository: 'CA_REPOSITORY',
  AccessMethodType.resourcePkiManifest: 'RESOURCE_PKI_MANIFEST',
  AccessMethodType.resourcePkiNotify: 'RESOURCE_PKI_NOTIFY',
};

CertificateAuthority _$CertificateAuthorityFromJson(Map<String, dynamic> json) {
  return CertificateAuthority(
    arn: json['Arn'] as String,
    certificateAuthorityConfiguration:
        json['CertificateAuthorityConfiguration'] == null
            ? null
            : CertificateAuthorityConfiguration.fromJson(
                json['CertificateAuthorityConfiguration']
                    as Map<String, dynamic>),
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    failureReason:
        _$enumDecodeNullable(_$FailureReasonEnumMap, json['FailureReason']),
    lastStateChangeAt:
        const UnixDateTimeConverter().fromJson(json['LastStateChangeAt']),
    notAfter: const UnixDateTimeConverter().fromJson(json['NotAfter']),
    notBefore: const UnixDateTimeConverter().fromJson(json['NotBefore']),
    ownerAccount: json['OwnerAccount'] as String,
    restorableUntil:
        const UnixDateTimeConverter().fromJson(json['RestorableUntil']),
    revocationConfiguration: json['RevocationConfiguration'] == null
        ? null
        : RevocationConfiguration.fromJson(
            json['RevocationConfiguration'] as Map<String, dynamic>),
    serial: json['Serial'] as String,
    status: _$enumDecodeNullable(
        _$CertificateAuthorityStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$CertificateAuthorityTypeEnumMap, json['Type']),
  );
}

const _$FailureReasonEnumMap = {
  FailureReason.requestTimedOut: 'REQUEST_TIMED_OUT',
  FailureReason.unsupportedAlgorithm: 'UNSUPPORTED_ALGORITHM',
  FailureReason.other: 'OTHER',
};

const _$CertificateAuthorityStatusEnumMap = {
  CertificateAuthorityStatus.creating: 'CREATING',
  CertificateAuthorityStatus.pendingCertificate: 'PENDING_CERTIFICATE',
  CertificateAuthorityStatus.active: 'ACTIVE',
  CertificateAuthorityStatus.deleted: 'DELETED',
  CertificateAuthorityStatus.disabled: 'DISABLED',
  CertificateAuthorityStatus.expired: 'EXPIRED',
  CertificateAuthorityStatus.failed: 'FAILED',
};

const _$CertificateAuthorityTypeEnumMap = {
  CertificateAuthorityType.root: 'ROOT',
  CertificateAuthorityType.subordinate: 'SUBORDINATE',
};

CertificateAuthorityConfiguration _$CertificateAuthorityConfigurationFromJson(
    Map<String, dynamic> json) {
  return CertificateAuthorityConfiguration(
    keyAlgorithm:
        _$enumDecodeNullable(_$KeyAlgorithmEnumMap, json['KeyAlgorithm']),
    signingAlgorithm: _$enumDecodeNullable(
        _$SigningAlgorithmEnumMap, json['SigningAlgorithm']),
    subject: json['Subject'] == null
        ? null
        : ASN1Subject.fromJson(json['Subject'] as Map<String, dynamic>),
    csrExtensions: json['CsrExtensions'] == null
        ? null
        : CsrExtensions.fromJson(json['CsrExtensions'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CertificateAuthorityConfigurationToJson(
    CertificateAuthorityConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyAlgorithm', _$KeyAlgorithmEnumMap[instance.keyAlgorithm]);
  writeNotNull(
      'SigningAlgorithm', _$SigningAlgorithmEnumMap[instance.signingAlgorithm]);
  writeNotNull('Subject', instance.subject?.toJson());
  writeNotNull('CsrExtensions', instance.csrExtensions?.toJson());
  return val;
}

const _$KeyAlgorithmEnumMap = {
  KeyAlgorithm.rsa_2048: 'RSA_2048',
  KeyAlgorithm.rsa_4096: 'RSA_4096',
  KeyAlgorithm.ecPrime256v1: 'EC_prime256v1',
  KeyAlgorithm.ecSecp384r1: 'EC_secp384r1',
};

const _$SigningAlgorithmEnumMap = {
  SigningAlgorithm.sha256withecdsa: 'SHA256WITHECDSA',
  SigningAlgorithm.sha384withecdsa: 'SHA384WITHECDSA',
  SigningAlgorithm.sha512withecdsa: 'SHA512WITHECDSA',
  SigningAlgorithm.sha256withrsa: 'SHA256WITHRSA',
  SigningAlgorithm.sha384withrsa: 'SHA384WITHRSA',
  SigningAlgorithm.sha512withrsa: 'SHA512WITHRSA',
};

CreateCertificateAuthorityAuditReportResponse
    _$CreateCertificateAuthorityAuditReportResponseFromJson(
        Map<String, dynamic> json) {
  return CreateCertificateAuthorityAuditReportResponse(
    auditReportId: json['AuditReportId'] as String,
    s3Key: json['S3Key'] as String,
  );
}

CreateCertificateAuthorityResponse _$CreateCertificateAuthorityResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCertificateAuthorityResponse(
    certificateAuthorityArn: json['CertificateAuthorityArn'] as String,
  );
}

CrlConfiguration _$CrlConfigurationFromJson(Map<String, dynamic> json) {
  return CrlConfiguration(
    enabled: json['Enabled'] as bool,
    customCname: json['CustomCname'] as String,
    expirationInDays: json['ExpirationInDays'] as int,
    s3BucketName: json['S3BucketName'] as String,
  );
}

Map<String, dynamic> _$CrlConfigurationToJson(CrlConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('CustomCname', instance.customCname);
  writeNotNull('ExpirationInDays', instance.expirationInDays);
  writeNotNull('S3BucketName', instance.s3BucketName);
  return val;
}

CsrExtensions _$CsrExtensionsFromJson(Map<String, dynamic> json) {
  return CsrExtensions(
    keyUsage: json['KeyUsage'] == null
        ? null
        : KeyUsage.fromJson(json['KeyUsage'] as Map<String, dynamic>),
    subjectInformationAccess: (json['SubjectInformationAccess'] as List)
        ?.map((e) => e == null
            ? null
            : AccessDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CsrExtensionsToJson(CsrExtensions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyUsage', instance.keyUsage?.toJson());
  writeNotNull('SubjectInformationAccess',
      instance.subjectInformationAccess?.map((e) => e?.toJson())?.toList());
  return val;
}

DescribeCertificateAuthorityAuditReportResponse
    _$DescribeCertificateAuthorityAuditReportResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeCertificateAuthorityAuditReportResponse(
    auditReportStatus: _$enumDecodeNullable(
        _$AuditReportStatusEnumMap, json['AuditReportStatus']),
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    s3BucketName: json['S3BucketName'] as String,
    s3Key: json['S3Key'] as String,
  );
}

const _$AuditReportStatusEnumMap = {
  AuditReportStatus.creating: 'CREATING',
  AuditReportStatus.success: 'SUCCESS',
  AuditReportStatus.failed: 'FAILED',
};

DescribeCertificateAuthorityResponse
    _$DescribeCertificateAuthorityResponseFromJson(Map<String, dynamic> json) {
  return DescribeCertificateAuthorityResponse(
    certificateAuthority: json['CertificateAuthority'] == null
        ? null
        : CertificateAuthority.fromJson(
            json['CertificateAuthority'] as Map<String, dynamic>),
  );
}

EdiPartyName _$EdiPartyNameFromJson(Map<String, dynamic> json) {
  return EdiPartyName(
    partyName: json['PartyName'] as String,
    nameAssigner: json['NameAssigner'] as String,
  );
}

Map<String, dynamic> _$EdiPartyNameToJson(EdiPartyName instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PartyName', instance.partyName);
  writeNotNull('NameAssigner', instance.nameAssigner);
  return val;
}

GeneralName _$GeneralNameFromJson(Map<String, dynamic> json) {
  return GeneralName(
    directoryName: json['DirectoryName'] == null
        ? null
        : ASN1Subject.fromJson(json['DirectoryName'] as Map<String, dynamic>),
    dnsName: json['DnsName'] as String,
    ediPartyName: json['EdiPartyName'] == null
        ? null
        : EdiPartyName.fromJson(json['EdiPartyName'] as Map<String, dynamic>),
    ipAddress: json['IpAddress'] as String,
    otherName: json['OtherName'] == null
        ? null
        : OtherName.fromJson(json['OtherName'] as Map<String, dynamic>),
    registeredId: json['RegisteredId'] as String,
    rfc822Name: json['Rfc822Name'] as String,
    uniformResourceIdentifier: json['UniformResourceIdentifier'] as String,
  );
}

Map<String, dynamic> _$GeneralNameToJson(GeneralName instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryName', instance.directoryName?.toJson());
  writeNotNull('DnsName', instance.dnsName);
  writeNotNull('EdiPartyName', instance.ediPartyName?.toJson());
  writeNotNull('IpAddress', instance.ipAddress);
  writeNotNull('OtherName', instance.otherName?.toJson());
  writeNotNull('RegisteredId', instance.registeredId);
  writeNotNull('Rfc822Name', instance.rfc822Name);
  writeNotNull('UniformResourceIdentifier', instance.uniformResourceIdentifier);
  return val;
}

GetCertificateAuthorityCertificateResponse
    _$GetCertificateAuthorityCertificateResponseFromJson(
        Map<String, dynamic> json) {
  return GetCertificateAuthorityCertificateResponse(
    certificate: json['Certificate'] as String,
    certificateChain: json['CertificateChain'] as String,
  );
}

GetCertificateAuthorityCsrResponse _$GetCertificateAuthorityCsrResponseFromJson(
    Map<String, dynamic> json) {
  return GetCertificateAuthorityCsrResponse(
    csr: json['Csr'] as String,
  );
}

GetCertificateResponse _$GetCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return GetCertificateResponse(
    certificate: json['Certificate'] as String,
    certificateChain: json['CertificateChain'] as String,
  );
}

GetPolicyResponse _$GetPolicyResponseFromJson(Map<String, dynamic> json) {
  return GetPolicyResponse(
    policy: json['Policy'] as String,
  );
}

IssueCertificateResponse _$IssueCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return IssueCertificateResponse(
    certificateArn: json['CertificateArn'] as String,
  );
}

KeyUsage _$KeyUsageFromJson(Map<String, dynamic> json) {
  return KeyUsage(
    cRLSign: json['CRLSign'] as bool,
    dataEncipherment: json['DataEncipherment'] as bool,
    decipherOnly: json['DecipherOnly'] as bool,
    digitalSignature: json['DigitalSignature'] as bool,
    encipherOnly: json['EncipherOnly'] as bool,
    keyAgreement: json['KeyAgreement'] as bool,
    keyCertSign: json['KeyCertSign'] as bool,
    keyEncipherment: json['KeyEncipherment'] as bool,
    nonRepudiation: json['NonRepudiation'] as bool,
  );
}

Map<String, dynamic> _$KeyUsageToJson(KeyUsage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CRLSign', instance.cRLSign);
  writeNotNull('DataEncipherment', instance.dataEncipherment);
  writeNotNull('DecipherOnly', instance.decipherOnly);
  writeNotNull('DigitalSignature', instance.digitalSignature);
  writeNotNull('EncipherOnly', instance.encipherOnly);
  writeNotNull('KeyAgreement', instance.keyAgreement);
  writeNotNull('KeyCertSign', instance.keyCertSign);
  writeNotNull('KeyEncipherment', instance.keyEncipherment);
  writeNotNull('NonRepudiation', instance.nonRepudiation);
  return val;
}

ListCertificateAuthoritiesResponse _$ListCertificateAuthoritiesResponseFromJson(
    Map<String, dynamic> json) {
  return ListCertificateAuthoritiesResponse(
    certificateAuthorities: (json['CertificateAuthorities'] as List)
        ?.map((e) => e == null
            ? null
            : CertificateAuthority.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListPermissionsResponse _$ListPermissionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPermissionsResponse(
    nextToken: json['NextToken'] as String,
    permissions: (json['Permissions'] as List)
        ?.map((e) =>
            e == null ? null : Permission.fromJson(e as Map<String, dynamic>))
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

OtherName _$OtherNameFromJson(Map<String, dynamic> json) {
  return OtherName(
    typeId: json['TypeId'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$OtherNameToJson(OtherName instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TypeId', instance.typeId);
  writeNotNull('Value', instance.value);
  return val;
}

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return Permission(
    actions: (json['Actions'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ActionTypeEnumMap, e))
        ?.toList(),
    certificateAuthorityArn: json['CertificateAuthorityArn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    policy: json['Policy'] as String,
    principal: json['Principal'] as String,
    sourceAccount: json['SourceAccount'] as String,
  );
}

const _$ActionTypeEnumMap = {
  ActionType.issueCertificate: 'IssueCertificate',
  ActionType.getCertificate: 'GetCertificate',
  ActionType.listPermissions: 'ListPermissions',
};

RevocationConfiguration _$RevocationConfigurationFromJson(
    Map<String, dynamic> json) {
  return RevocationConfiguration(
    crlConfiguration: json['CrlConfiguration'] == null
        ? null
        : CrlConfiguration.fromJson(
            json['CrlConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RevocationConfigurationToJson(
    RevocationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CrlConfiguration', instance.crlConfiguration?.toJson());
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

Map<String, dynamic> _$ValidityToJson(Validity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$ValidityPeriodTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$ValidityPeriodTypeEnumMap = {
  ValidityPeriodType.endDate: 'END_DATE',
  ValidityPeriodType.absolute: 'ABSOLUTE',
  ValidityPeriodType.days: 'DAYS',
  ValidityPeriodType.months: 'MONTHS',
  ValidityPeriodType.years: 'YEARS',
};
