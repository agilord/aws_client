// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-12-08.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificateDetail _$CertificateDetailFromJson(Map<String, dynamic> json) {
  return CertificateDetail(
    certificateArn: json['CertificateArn'] as String,
    certificateAuthorityArn: json['CertificateAuthorityArn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    domainName: json['DomainName'] as String,
    domainValidationOptions: (json['DomainValidationOptions'] as List)
        ?.map((e) => e == null
            ? null
            : DomainValidation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    extendedKeyUsages: (json['ExtendedKeyUsages'] as List)
        ?.map((e) => e == null
            ? null
            : ExtendedKeyUsage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    failureReason:
        _$enumDecodeNullable(_$FailureReasonEnumMap, json['FailureReason']),
    importedAt: const UnixDateTimeConverter().fromJson(json['ImportedAt']),
    inUseBy: (json['InUseBy'] as List)?.map((e) => e as String)?.toList(),
    issuedAt: const UnixDateTimeConverter().fromJson(json['IssuedAt']),
    issuer: json['Issuer'] as String,
    keyAlgorithm:
        _$enumDecodeNullable(_$KeyAlgorithmEnumMap, json['KeyAlgorithm']),
    keyUsages: (json['KeyUsages'] as List)
        ?.map((e) =>
            e == null ? null : KeyUsage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    notAfter: const UnixDateTimeConverter().fromJson(json['NotAfter']),
    notBefore: const UnixDateTimeConverter().fromJson(json['NotBefore']),
    options: json['Options'] == null
        ? null
        : CertificateOptions.fromJson(json['Options'] as Map<String, dynamic>),
    renewalEligibility: _$enumDecodeNullable(
        _$RenewalEligibilityEnumMap, json['RenewalEligibility']),
    renewalSummary: json['RenewalSummary'] == null
        ? null
        : RenewalSummary.fromJson(
            json['RenewalSummary'] as Map<String, dynamic>),
    revocationReason: _$enumDecodeNullable(
        _$RevocationReasonEnumMap, json['RevocationReason']),
    revokedAt: const UnixDateTimeConverter().fromJson(json['RevokedAt']),
    serial: json['Serial'] as String,
    signatureAlgorithm: json['SignatureAlgorithm'] as String,
    status: _$enumDecodeNullable(_$CertificateStatusEnumMap, json['Status']),
    subject: json['Subject'] as String,
    subjectAlternativeNames: (json['SubjectAlternativeNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    type: _$enumDecodeNullable(_$CertificateTypeEnumMap, json['Type']),
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

const _$FailureReasonEnumMap = {
  FailureReason.noAvailableContacts: 'NO_AVAILABLE_CONTACTS',
  FailureReason.additionalVerificationRequired:
      'ADDITIONAL_VERIFICATION_REQUIRED',
  FailureReason.domainNotAllowed: 'DOMAIN_NOT_ALLOWED',
  FailureReason.invalidPublicDomain: 'INVALID_PUBLIC_DOMAIN',
  FailureReason.domainValidationDenied: 'DOMAIN_VALIDATION_DENIED',
  FailureReason.caaError: 'CAA_ERROR',
  FailureReason.pcaLimitExceeded: 'PCA_LIMIT_EXCEEDED',
  FailureReason.pcaInvalidArn: 'PCA_INVALID_ARN',
  FailureReason.pcaInvalidState: 'PCA_INVALID_STATE',
  FailureReason.pcaRequestFailed: 'PCA_REQUEST_FAILED',
  FailureReason.pcaNameConstraintsValidation: 'PCA_NAME_CONSTRAINTS_VALIDATION',
  FailureReason.pcaResourceNotFound: 'PCA_RESOURCE_NOT_FOUND',
  FailureReason.pcaInvalidArgs: 'PCA_INVALID_ARGS',
  FailureReason.pcaInvalidDuration: 'PCA_INVALID_DURATION',
  FailureReason.pcaAccessDenied: 'PCA_ACCESS_DENIED',
  FailureReason.slrNotFound: 'SLR_NOT_FOUND',
  FailureReason.other: 'OTHER',
};

const _$KeyAlgorithmEnumMap = {
  KeyAlgorithm.rsa_2048: 'RSA_2048',
  KeyAlgorithm.rsa_1024: 'RSA_1024',
  KeyAlgorithm.rsa_4096: 'RSA_4096',
  KeyAlgorithm.ecPrime256v1: 'EC_prime256v1',
  KeyAlgorithm.ecSecp384r1: 'EC_secp384r1',
  KeyAlgorithm.ecSecp521r1: 'EC_secp521r1',
};

const _$RenewalEligibilityEnumMap = {
  RenewalEligibility.eligible: 'ELIGIBLE',
  RenewalEligibility.ineligible: 'INELIGIBLE',
};

const _$RevocationReasonEnumMap = {
  RevocationReason.unspecified: 'UNSPECIFIED',
  RevocationReason.keyCompromise: 'KEY_COMPROMISE',
  RevocationReason.caCompromise: 'CA_COMPROMISE',
  RevocationReason.affiliationChanged: 'AFFILIATION_CHANGED',
  RevocationReason.superceded: 'SUPERCEDED',
  RevocationReason.cessationOfOperation: 'CESSATION_OF_OPERATION',
  RevocationReason.certificateHold: 'CERTIFICATE_HOLD',
  RevocationReason.removeFromCrl: 'REMOVE_FROM_CRL',
  RevocationReason.privilegeWithdrawn: 'PRIVILEGE_WITHDRAWN',
  RevocationReason.aACompromise: 'A_A_COMPROMISE',
};

const _$CertificateStatusEnumMap = {
  CertificateStatus.pendingValidation: 'PENDING_VALIDATION',
  CertificateStatus.issued: 'ISSUED',
  CertificateStatus.inactive: 'INACTIVE',
  CertificateStatus.expired: 'EXPIRED',
  CertificateStatus.validationTimedOut: 'VALIDATION_TIMED_OUT',
  CertificateStatus.revoked: 'REVOKED',
  CertificateStatus.failed: 'FAILED',
};

const _$CertificateTypeEnumMap = {
  CertificateType.imported: 'IMPORTED',
  CertificateType.amazonIssued: 'AMAZON_ISSUED',
  CertificateType.private: 'PRIVATE',
};

CertificateOptions _$CertificateOptionsFromJson(Map<String, dynamic> json) {
  return CertificateOptions(
    certificateTransparencyLoggingPreference: _$enumDecodeNullable(
        _$CertificateTransparencyLoggingPreferenceEnumMap,
        json['CertificateTransparencyLoggingPreference']),
  );
}

Map<String, dynamic> _$CertificateOptionsToJson(CertificateOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CertificateTransparencyLoggingPreference',
      _$CertificateTransparencyLoggingPreferenceEnumMap[
          instance.certificateTransparencyLoggingPreference]);
  return val;
}

const _$CertificateTransparencyLoggingPreferenceEnumMap = {
  CertificateTransparencyLoggingPreference.enabled: 'ENABLED',
  CertificateTransparencyLoggingPreference.disabled: 'DISABLED',
};

CertificateSummary _$CertificateSummaryFromJson(Map<String, dynamic> json) {
  return CertificateSummary(
    certificateArn: json['CertificateArn'] as String,
    domainName: json['DomainName'] as String,
  );
}

DescribeCertificateResponse _$DescribeCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCertificateResponse(
    certificate: json['Certificate'] == null
        ? null
        : CertificateDetail.fromJson(
            json['Certificate'] as Map<String, dynamic>),
  );
}

DomainValidation _$DomainValidationFromJson(Map<String, dynamic> json) {
  return DomainValidation(
    domainName: json['DomainName'] as String,
    resourceRecord: json['ResourceRecord'] == null
        ? null
        : ResourceRecord.fromJson(
            json['ResourceRecord'] as Map<String, dynamic>),
    validationDomain: json['ValidationDomain'] as String,
    validationEmails:
        (json['ValidationEmails'] as List)?.map((e) => e as String)?.toList(),
    validationMethod: _$enumDecodeNullable(
        _$ValidationMethodEnumMap, json['ValidationMethod']),
    validationStatus:
        _$enumDecodeNullable(_$DomainStatusEnumMap, json['ValidationStatus']),
  );
}

const _$ValidationMethodEnumMap = {
  ValidationMethod.email: 'EMAIL',
  ValidationMethod.dns: 'DNS',
};

const _$DomainStatusEnumMap = {
  DomainStatus.pendingValidation: 'PENDING_VALIDATION',
  DomainStatus.success: 'SUCCESS',
  DomainStatus.failed: 'FAILED',
};

Map<String, dynamic> _$DomainValidationOptionToJson(
    DomainValidationOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DomainName', instance.domainName);
  writeNotNull('ValidationDomain', instance.validationDomain);
  return val;
}

ExportCertificateResponse _$ExportCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return ExportCertificateResponse(
    certificate: json['Certificate'] as String,
    certificateChain: json['CertificateChain'] as String,
    privateKey: json['PrivateKey'] as String,
  );
}

ExtendedKeyUsage _$ExtendedKeyUsageFromJson(Map<String, dynamic> json) {
  return ExtendedKeyUsage(
    name: _$enumDecodeNullable(_$ExtendedKeyUsageNameEnumMap, json['Name']),
    oid: json['OID'] as String,
  );
}

const _$ExtendedKeyUsageNameEnumMap = {
  ExtendedKeyUsageName.tlsWebServerAuthentication:
      'TLS_WEB_SERVER_AUTHENTICATION',
  ExtendedKeyUsageName.tlsWebClientAuthentication:
      'TLS_WEB_CLIENT_AUTHENTICATION',
  ExtendedKeyUsageName.codeSigning: 'CODE_SIGNING',
  ExtendedKeyUsageName.emailProtection: 'EMAIL_PROTECTION',
  ExtendedKeyUsageName.timeStamping: 'TIME_STAMPING',
  ExtendedKeyUsageName.ocspSigning: 'OCSP_SIGNING',
  ExtendedKeyUsageName.ipsecEndSystem: 'IPSEC_END_SYSTEM',
  ExtendedKeyUsageName.ipsecTunnel: 'IPSEC_TUNNEL',
  ExtendedKeyUsageName.ipsecUser: 'IPSEC_USER',
  ExtendedKeyUsageName.any: 'ANY',
  ExtendedKeyUsageName.none: 'NONE',
  ExtendedKeyUsageName.custom: 'CUSTOM',
};

Map<String, dynamic> _$FiltersToJson(Filters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'extendedKeyUsage',
      instance.extendedKeyUsage
          ?.map((e) => _$ExtendedKeyUsageNameEnumMap[e])
          ?.toList());
  writeNotNull('keyTypes',
      instance.keyTypes?.map((e) => _$KeyAlgorithmEnumMap[e])?.toList());
  writeNotNull('keyUsage',
      instance.keyUsage?.map((e) => _$KeyUsageNameEnumMap[e])?.toList());
  return val;
}

const _$KeyUsageNameEnumMap = {
  KeyUsageName.digitalSignature: 'DIGITAL_SIGNATURE',
  KeyUsageName.nonRepudiation: 'NON_REPUDIATION',
  KeyUsageName.keyEncipherment: 'KEY_ENCIPHERMENT',
  KeyUsageName.dataEncipherment: 'DATA_ENCIPHERMENT',
  KeyUsageName.keyAgreement: 'KEY_AGREEMENT',
  KeyUsageName.certificateSigning: 'CERTIFICATE_SIGNING',
  KeyUsageName.crlSigning: 'CRL_SIGNING',
  KeyUsageName.encipherOnly: 'ENCIPHER_ONLY',
  KeyUsageName.decipherOnly: 'DECIPHER_ONLY',
  KeyUsageName.any: 'ANY',
  KeyUsageName.custom: 'CUSTOM',
};

GetCertificateResponse _$GetCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return GetCertificateResponse(
    certificate: json['Certificate'] as String,
    certificateChain: json['CertificateChain'] as String,
  );
}

ImportCertificateResponse _$ImportCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return ImportCertificateResponse(
    certificateArn: json['CertificateArn'] as String,
  );
}

KeyUsage _$KeyUsageFromJson(Map<String, dynamic> json) {
  return KeyUsage(
    name: _$enumDecodeNullable(_$KeyUsageNameEnumMap, json['Name']),
  );
}

ListCertificatesResponse _$ListCertificatesResponseFromJson(
    Map<String, dynamic> json) {
  return ListCertificatesResponse(
    certificateSummaryList: (json['CertificateSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : CertificateSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForCertificateResponse _$ListTagsForCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForCertificateResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RenewalSummary _$RenewalSummaryFromJson(Map<String, dynamic> json) {
  return RenewalSummary(
    domainValidationOptions: (json['DomainValidationOptions'] as List)
        ?.map((e) => e == null
            ? null
            : DomainValidation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    renewalStatus:
        _$enumDecodeNullable(_$RenewalStatusEnumMap, json['RenewalStatus']),
    updatedAt: const UnixDateTimeConverter().fromJson(json['UpdatedAt']),
    renewalStatusReason: _$enumDecodeNullable(
        _$FailureReasonEnumMap, json['RenewalStatusReason']),
  );
}

const _$RenewalStatusEnumMap = {
  RenewalStatus.pendingAutoRenewal: 'PENDING_AUTO_RENEWAL',
  RenewalStatus.pendingValidation: 'PENDING_VALIDATION',
  RenewalStatus.success: 'SUCCESS',
  RenewalStatus.failed: 'FAILED',
};

RequestCertificateResponse _$RequestCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return RequestCertificateResponse(
    certificateArn: json['CertificateArn'] as String,
  );
}

ResourceRecord _$ResourceRecordFromJson(Map<String, dynamic> json) {
  return ResourceRecord(
    name: json['Name'] as String,
    type: _$enumDecodeNullable(_$RecordTypeEnumMap, json['Type']),
    value: json['Value'] as String,
  );
}

const _$RecordTypeEnumMap = {
  RecordType.cname: 'CNAME',
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
