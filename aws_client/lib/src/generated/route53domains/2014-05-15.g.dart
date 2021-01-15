// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2014-05-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptDomainTransferFromAnotherAwsAccountResponse
    _$AcceptDomainTransferFromAnotherAwsAccountResponseFromJson(
        Map<String, dynamic> json) {
  return AcceptDomainTransferFromAnotherAwsAccountResponse(
    operationId: json['OperationId'] as String,
  );
}

BillingRecord _$BillingRecordFromJson(Map<String, dynamic> json) {
  return BillingRecord(
    billDate: const UnixDateTimeConverter().fromJson(json['BillDate']),
    domainName: json['DomainName'] as String,
    invoiceId: json['InvoiceId'] as String,
    operation: _$enumDecodeNullable(_$OperationTypeEnumMap, json['Operation']),
    price: (json['Price'] as num)?.toDouble(),
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

const _$OperationTypeEnumMap = {
  OperationType.registerDomain: 'REGISTER_DOMAIN',
  OperationType.deleteDomain: 'DELETE_DOMAIN',
  OperationType.transferInDomain: 'TRANSFER_IN_DOMAIN',
  OperationType.updateDomainContact: 'UPDATE_DOMAIN_CONTACT',
  OperationType.updateNameserver: 'UPDATE_NAMESERVER',
  OperationType.changePrivacyProtection: 'CHANGE_PRIVACY_PROTECTION',
  OperationType.domainLock: 'DOMAIN_LOCK',
  OperationType.enableAutorenew: 'ENABLE_AUTORENEW',
  OperationType.disableAutorenew: 'DISABLE_AUTORENEW',
  OperationType.addDnssec: 'ADD_DNSSEC',
  OperationType.removeDnssec: 'REMOVE_DNSSEC',
  OperationType.expireDomain: 'EXPIRE_DOMAIN',
  OperationType.transferOutDomain: 'TRANSFER_OUT_DOMAIN',
  OperationType.changeDomainOwner: 'CHANGE_DOMAIN_OWNER',
  OperationType.renewDomain: 'RENEW_DOMAIN',
  OperationType.pushDomain: 'PUSH_DOMAIN',
  OperationType.internalTransferOutDomain: 'INTERNAL_TRANSFER_OUT_DOMAIN',
  OperationType.internalTransferInDomain: 'INTERNAL_TRANSFER_IN_DOMAIN',
};

CancelDomainTransferToAnotherAwsAccountResponse
    _$CancelDomainTransferToAnotherAwsAccountResponseFromJson(
        Map<String, dynamic> json) {
  return CancelDomainTransferToAnotherAwsAccountResponse(
    operationId: json['OperationId'] as String,
  );
}

CheckDomainAvailabilityResponse _$CheckDomainAvailabilityResponseFromJson(
    Map<String, dynamic> json) {
  return CheckDomainAvailabilityResponse(
    availability:
        _$enumDecodeNullable(_$DomainAvailabilityEnumMap, json['Availability']),
  );
}

const _$DomainAvailabilityEnumMap = {
  DomainAvailability.available: 'AVAILABLE',
  DomainAvailability.availableReserved: 'AVAILABLE_RESERVED',
  DomainAvailability.availablePreorder: 'AVAILABLE_PREORDER',
  DomainAvailability.unavailable: 'UNAVAILABLE',
  DomainAvailability.unavailablePremium: 'UNAVAILABLE_PREMIUM',
  DomainAvailability.unavailableRestricted: 'UNAVAILABLE_RESTRICTED',
  DomainAvailability.reserved: 'RESERVED',
  DomainAvailability.dontKnow: 'DONT_KNOW',
};

CheckDomainTransferabilityResponse _$CheckDomainTransferabilityResponseFromJson(
    Map<String, dynamic> json) {
  return CheckDomainTransferabilityResponse(
    transferability: json['Transferability'] == null
        ? null
        : DomainTransferability.fromJson(
            json['Transferability'] as Map<String, dynamic>),
  );
}

ContactDetail _$ContactDetailFromJson(Map<String, dynamic> json) {
  return ContactDetail(
    addressLine1: json['AddressLine1'] as String,
    addressLine2: json['AddressLine2'] as String,
    city: json['City'] as String,
    contactType:
        _$enumDecodeNullable(_$ContactTypeEnumMap, json['ContactType']),
    countryCode:
        _$enumDecodeNullable(_$CountryCodeEnumMap, json['CountryCode']),
    email: json['Email'] as String,
    extraParams: (json['ExtraParams'] as List)
        ?.map((e) =>
            e == null ? null : ExtraParam.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    fax: json['Fax'] as String,
    firstName: json['FirstName'] as String,
    lastName: json['LastName'] as String,
    organizationName: json['OrganizationName'] as String,
    phoneNumber: json['PhoneNumber'] as String,
    state: json['State'] as String,
    zipCode: json['ZipCode'] as String,
  );
}

Map<String, dynamic> _$ContactDetailToJson(ContactDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AddressLine1', instance.addressLine1);
  writeNotNull('AddressLine2', instance.addressLine2);
  writeNotNull('City', instance.city);
  writeNotNull('ContactType', _$ContactTypeEnumMap[instance.contactType]);
  writeNotNull('CountryCode', _$CountryCodeEnumMap[instance.countryCode]);
  writeNotNull('Email', instance.email);
  writeNotNull(
      'ExtraParams', instance.extraParams?.map((e) => e?.toJson())?.toList());
  writeNotNull('Fax', instance.fax);
  writeNotNull('FirstName', instance.firstName);
  writeNotNull('LastName', instance.lastName);
  writeNotNull('OrganizationName', instance.organizationName);
  writeNotNull('PhoneNumber', instance.phoneNumber);
  writeNotNull('State', instance.state);
  writeNotNull('ZipCode', instance.zipCode);
  return val;
}

const _$ContactTypeEnumMap = {
  ContactType.person: 'PERSON',
  ContactType.company: 'COMPANY',
  ContactType.association: 'ASSOCIATION',
  ContactType.publicBody: 'PUBLIC_BODY',
  ContactType.reseller: 'RESELLER',
};

const _$CountryCodeEnumMap = {
  CountryCode.ad: 'AD',
  CountryCode.ae: 'AE',
  CountryCode.af: 'AF',
  CountryCode.ag: 'AG',
  CountryCode.ai: 'AI',
  CountryCode.al: 'AL',
  CountryCode.am: 'AM',
  CountryCode.an: 'AN',
  CountryCode.ao: 'AO',
  CountryCode.aq: 'AQ',
  CountryCode.ar: 'AR',
  CountryCode.as: 'AS',
  CountryCode.at: 'AT',
  CountryCode.au: 'AU',
  CountryCode.aw: 'AW',
  CountryCode.az: 'AZ',
  CountryCode.ba: 'BA',
  CountryCode.bb: 'BB',
  CountryCode.bd: 'BD',
  CountryCode.be: 'BE',
  CountryCode.bf: 'BF',
  CountryCode.bg: 'BG',
  CountryCode.bh: 'BH',
  CountryCode.bi: 'BI',
  CountryCode.bj: 'BJ',
  CountryCode.bl: 'BL',
  CountryCode.bm: 'BM',
  CountryCode.bn: 'BN',
  CountryCode.bo: 'BO',
  CountryCode.br: 'BR',
  CountryCode.bs: 'BS',
  CountryCode.bt: 'BT',
  CountryCode.bw: 'BW',
  CountryCode.by: 'BY',
  CountryCode.bz: 'BZ',
  CountryCode.ca: 'CA',
  CountryCode.cc: 'CC',
  CountryCode.cd: 'CD',
  CountryCode.cf: 'CF',
  CountryCode.cg: 'CG',
  CountryCode.ch: 'CH',
  CountryCode.ci: 'CI',
  CountryCode.ck: 'CK',
  CountryCode.cl: 'CL',
  CountryCode.cm: 'CM',
  CountryCode.cn: 'CN',
  CountryCode.co: 'CO',
  CountryCode.cr: 'CR',
  CountryCode.cu: 'CU',
  CountryCode.cv: 'CV',
  CountryCode.cx: 'CX',
  CountryCode.cy: 'CY',
  CountryCode.cz: 'CZ',
  CountryCode.de: 'DE',
  CountryCode.dj: 'DJ',
  CountryCode.dk: 'DK',
  CountryCode.dm: 'DM',
  CountryCode.$do: 'DO',
  CountryCode.dz: 'DZ',
  CountryCode.ec: 'EC',
  CountryCode.ee: 'EE',
  CountryCode.eg: 'EG',
  CountryCode.er: 'ER',
  CountryCode.es: 'ES',
  CountryCode.et: 'ET',
  CountryCode.fi: 'FI',
  CountryCode.fj: 'FJ',
  CountryCode.fk: 'FK',
  CountryCode.fm: 'FM',
  CountryCode.fo: 'FO',
  CountryCode.fr: 'FR',
  CountryCode.ga: 'GA',
  CountryCode.gb: 'GB',
  CountryCode.gd: 'GD',
  CountryCode.ge: 'GE',
  CountryCode.gh: 'GH',
  CountryCode.gi: 'GI',
  CountryCode.gl: 'GL',
  CountryCode.gm: 'GM',
  CountryCode.gn: 'GN',
  CountryCode.gq: 'GQ',
  CountryCode.gr: 'GR',
  CountryCode.gt: 'GT',
  CountryCode.gu: 'GU',
  CountryCode.gw: 'GW',
  CountryCode.gy: 'GY',
  CountryCode.hk: 'HK',
  CountryCode.hn: 'HN',
  CountryCode.hr: 'HR',
  CountryCode.ht: 'HT',
  CountryCode.hu: 'HU',
  CountryCode.id: 'ID',
  CountryCode.ie: 'IE',
  CountryCode.il: 'IL',
  CountryCode.im: 'IM',
  CountryCode.$in: 'IN',
  CountryCode.iq: 'IQ',
  CountryCode.ir: 'IR',
  CountryCode.$is: 'IS',
  CountryCode.it: 'IT',
  CountryCode.jm: 'JM',
  CountryCode.jo: 'JO',
  CountryCode.jp: 'JP',
  CountryCode.ke: 'KE',
  CountryCode.kg: 'KG',
  CountryCode.kh: 'KH',
  CountryCode.ki: 'KI',
  CountryCode.km: 'KM',
  CountryCode.kn: 'KN',
  CountryCode.kp: 'KP',
  CountryCode.kr: 'KR',
  CountryCode.kw: 'KW',
  CountryCode.ky: 'KY',
  CountryCode.kz: 'KZ',
  CountryCode.la: 'LA',
  CountryCode.lb: 'LB',
  CountryCode.lc: 'LC',
  CountryCode.li: 'LI',
  CountryCode.lk: 'LK',
  CountryCode.lr: 'LR',
  CountryCode.ls: 'LS',
  CountryCode.lt: 'LT',
  CountryCode.lu: 'LU',
  CountryCode.lv: 'LV',
  CountryCode.ly: 'LY',
  CountryCode.ma: 'MA',
  CountryCode.mc: 'MC',
  CountryCode.md: 'MD',
  CountryCode.me: 'ME',
  CountryCode.mf: 'MF',
  CountryCode.mg: 'MG',
  CountryCode.mh: 'MH',
  CountryCode.mk: 'MK',
  CountryCode.ml: 'ML',
  CountryCode.mm: 'MM',
  CountryCode.mn: 'MN',
  CountryCode.mo: 'MO',
  CountryCode.mp: 'MP',
  CountryCode.mr: 'MR',
  CountryCode.ms: 'MS',
  CountryCode.mt: 'MT',
  CountryCode.mu: 'MU',
  CountryCode.mv: 'MV',
  CountryCode.mw: 'MW',
  CountryCode.mx: 'MX',
  CountryCode.my: 'MY',
  CountryCode.mz: 'MZ',
  CountryCode.na: 'NA',
  CountryCode.nc: 'NC',
  CountryCode.ne: 'NE',
  CountryCode.ng: 'NG',
  CountryCode.ni: 'NI',
  CountryCode.nl: 'NL',
  CountryCode.no: 'NO',
  CountryCode.np: 'NP',
  CountryCode.nr: 'NR',
  CountryCode.nu: 'NU',
  CountryCode.nz: 'NZ',
  CountryCode.om: 'OM',
  CountryCode.pa: 'PA',
  CountryCode.pe: 'PE',
  CountryCode.pf: 'PF',
  CountryCode.pg: 'PG',
  CountryCode.ph: 'PH',
  CountryCode.pk: 'PK',
  CountryCode.pl: 'PL',
  CountryCode.pm: 'PM',
  CountryCode.pn: 'PN',
  CountryCode.pr: 'PR',
  CountryCode.pt: 'PT',
  CountryCode.pw: 'PW',
  CountryCode.py: 'PY',
  CountryCode.qa: 'QA',
  CountryCode.ro: 'RO',
  CountryCode.rs: 'RS',
  CountryCode.ru: 'RU',
  CountryCode.rw: 'RW',
  CountryCode.sa: 'SA',
  CountryCode.sb: 'SB',
  CountryCode.sc: 'SC',
  CountryCode.sd: 'SD',
  CountryCode.se: 'SE',
  CountryCode.sg: 'SG',
  CountryCode.sh: 'SH',
  CountryCode.si: 'SI',
  CountryCode.sk: 'SK',
  CountryCode.sl: 'SL',
  CountryCode.sm: 'SM',
  CountryCode.sn: 'SN',
  CountryCode.so: 'SO',
  CountryCode.sr: 'SR',
  CountryCode.st: 'ST',
  CountryCode.sv: 'SV',
  CountryCode.sy: 'SY',
  CountryCode.sz: 'SZ',
  CountryCode.tc: 'TC',
  CountryCode.td: 'TD',
  CountryCode.tg: 'TG',
  CountryCode.th: 'TH',
  CountryCode.tj: 'TJ',
  CountryCode.tk: 'TK',
  CountryCode.tl: 'TL',
  CountryCode.tm: 'TM',
  CountryCode.tn: 'TN',
  CountryCode.to: 'TO',
  CountryCode.tr: 'TR',
  CountryCode.tt: 'TT',
  CountryCode.tv: 'TV',
  CountryCode.tw: 'TW',
  CountryCode.tz: 'TZ',
  CountryCode.ua: 'UA',
  CountryCode.ug: 'UG',
  CountryCode.us: 'US',
  CountryCode.uy: 'UY',
  CountryCode.uz: 'UZ',
  CountryCode.va: 'VA',
  CountryCode.vc: 'VC',
  CountryCode.ve: 'VE',
  CountryCode.vg: 'VG',
  CountryCode.vi: 'VI',
  CountryCode.vn: 'VN',
  CountryCode.vu: 'VU',
  CountryCode.wf: 'WF',
  CountryCode.ws: 'WS',
  CountryCode.ye: 'YE',
  CountryCode.yt: 'YT',
  CountryCode.za: 'ZA',
  CountryCode.zm: 'ZM',
  CountryCode.zw: 'ZW',
};

DeleteTagsForDomainResponse _$DeleteTagsForDomainResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteTagsForDomainResponse();
}

DisableDomainAutoRenewResponse _$DisableDomainAutoRenewResponseFromJson(
    Map<String, dynamic> json) {
  return DisableDomainAutoRenewResponse();
}

DisableDomainTransferLockResponse _$DisableDomainTransferLockResponseFromJson(
    Map<String, dynamic> json) {
  return DisableDomainTransferLockResponse(
    operationId: json['OperationId'] as String,
  );
}

DomainSuggestion _$DomainSuggestionFromJson(Map<String, dynamic> json) {
  return DomainSuggestion(
    availability: json['Availability'] as String,
    domainName: json['DomainName'] as String,
  );
}

DomainSummary _$DomainSummaryFromJson(Map<String, dynamic> json) {
  return DomainSummary(
    domainName: json['DomainName'] as String,
    autoRenew: json['AutoRenew'] as bool,
    expiry: const UnixDateTimeConverter().fromJson(json['Expiry']),
    transferLock: json['TransferLock'] as bool,
  );
}

DomainTransferability _$DomainTransferabilityFromJson(
    Map<String, dynamic> json) {
  return DomainTransferability(
    transferable:
        _$enumDecodeNullable(_$TransferableEnumMap, json['Transferable']),
  );
}

const _$TransferableEnumMap = {
  Transferable.transferable: 'TRANSFERABLE',
  Transferable.untransferable: 'UNTRANSFERABLE',
  Transferable.dontKnow: 'DONT_KNOW',
};

EnableDomainAutoRenewResponse _$EnableDomainAutoRenewResponseFromJson(
    Map<String, dynamic> json) {
  return EnableDomainAutoRenewResponse();
}

EnableDomainTransferLockResponse _$EnableDomainTransferLockResponseFromJson(
    Map<String, dynamic> json) {
  return EnableDomainTransferLockResponse(
    operationId: json['OperationId'] as String,
  );
}

ExtraParam _$ExtraParamFromJson(Map<String, dynamic> json) {
  return ExtraParam(
    name: _$enumDecodeNullable(_$ExtraParamNameEnumMap, json['Name']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$ExtraParamToJson(ExtraParam instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$ExtraParamNameEnumMap[instance.name]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$ExtraParamNameEnumMap = {
  ExtraParamName.dunsNumber: 'DUNS_NUMBER',
  ExtraParamName.brandNumber: 'BRAND_NUMBER',
  ExtraParamName.birthDepartment: 'BIRTH_DEPARTMENT',
  ExtraParamName.birthDateInYyyyMmDd: 'BIRTH_DATE_IN_YYYY_MM_DD',
  ExtraParamName.birthCountry: 'BIRTH_COUNTRY',
  ExtraParamName.birthCity: 'BIRTH_CITY',
  ExtraParamName.documentNumber: 'DOCUMENT_NUMBER',
  ExtraParamName.auIdNumber: 'AU_ID_NUMBER',
  ExtraParamName.auIdType: 'AU_ID_TYPE',
  ExtraParamName.caLegalType: 'CA_LEGAL_TYPE',
  ExtraParamName.caBusinessEntityType: 'CA_BUSINESS_ENTITY_TYPE',
  ExtraParamName.caLegalRepresentative: 'CA_LEGAL_REPRESENTATIVE',
  ExtraParamName.caLegalRepresentativeCapacity:
      'CA_LEGAL_REPRESENTATIVE_CAPACITY',
  ExtraParamName.esIdentification: 'ES_IDENTIFICATION',
  ExtraParamName.esIdentificationType: 'ES_IDENTIFICATION_TYPE',
  ExtraParamName.esLegalForm: 'ES_LEGAL_FORM',
  ExtraParamName.fiBusinessNumber: 'FI_BUSINESS_NUMBER',
  ExtraParamName.fiIdNumber: 'FI_ID_NUMBER',
  ExtraParamName.fiNationality: 'FI_NATIONALITY',
  ExtraParamName.fiOrganizationType: 'FI_ORGANIZATION_TYPE',
  ExtraParamName.itNationality: 'IT_NATIONALITY',
  ExtraParamName.itPin: 'IT_PIN',
  ExtraParamName.itRegistrantEntityType: 'IT_REGISTRANT_ENTITY_TYPE',
  ExtraParamName.ruPassportData: 'RU_PASSPORT_DATA',
  ExtraParamName.seIdNumber: 'SE_ID_NUMBER',
  ExtraParamName.sgIdNumber: 'SG_ID_NUMBER',
  ExtraParamName.vatNumber: 'VAT_NUMBER',
  ExtraParamName.ukContactType: 'UK_CONTACT_TYPE',
  ExtraParamName.ukCompanyNumber: 'UK_COMPANY_NUMBER',
};

GetContactReachabilityStatusResponse
    _$GetContactReachabilityStatusResponseFromJson(Map<String, dynamic> json) {
  return GetContactReachabilityStatusResponse(
    domainName: json['domainName'] as String,
    status: _$enumDecodeNullable(_$ReachabilityStatusEnumMap, json['status']),
  );
}

const _$ReachabilityStatusEnumMap = {
  ReachabilityStatus.pending: 'PENDING',
  ReachabilityStatus.done: 'DONE',
  ReachabilityStatus.expired: 'EXPIRED',
};

GetDomainDetailResponse _$GetDomainDetailResponseFromJson(
    Map<String, dynamic> json) {
  return GetDomainDetailResponse(
    adminContact: json['AdminContact'] == null
        ? null
        : ContactDetail.fromJson(json['AdminContact'] as Map<String, dynamic>),
    domainName: json['DomainName'] as String,
    nameservers: (json['Nameservers'] as List)
        ?.map((e) =>
            e == null ? null : Nameserver.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    registrantContact: json['RegistrantContact'] == null
        ? null
        : ContactDetail.fromJson(
            json['RegistrantContact'] as Map<String, dynamic>),
    techContact: json['TechContact'] == null
        ? null
        : ContactDetail.fromJson(json['TechContact'] as Map<String, dynamic>),
    abuseContactEmail: json['AbuseContactEmail'] as String,
    abuseContactPhone: json['AbuseContactPhone'] as String,
    adminPrivacy: json['AdminPrivacy'] as bool,
    autoRenew: json['AutoRenew'] as bool,
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    dnsSec: json['DnsSec'] as String,
    expirationDate:
        const UnixDateTimeConverter().fromJson(json['ExpirationDate']),
    registrantPrivacy: json['RegistrantPrivacy'] as bool,
    registrarName: json['RegistrarName'] as String,
    registrarUrl: json['RegistrarUrl'] as String,
    registryDomainId: json['RegistryDomainId'] as String,
    reseller: json['Reseller'] as String,
    statusList: (json['StatusList'] as List)?.map((e) => e as String)?.toList(),
    techPrivacy: json['TechPrivacy'] as bool,
    updatedDate: const UnixDateTimeConverter().fromJson(json['UpdatedDate']),
    whoIsServer: json['WhoIsServer'] as String,
  );
}

GetDomainSuggestionsResponse _$GetDomainSuggestionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetDomainSuggestionsResponse(
    suggestionsList: (json['SuggestionsList'] as List)
        ?.map((e) => e == null
            ? null
            : DomainSuggestion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetOperationDetailResponse _$GetOperationDetailResponseFromJson(
    Map<String, dynamic> json) {
  return GetOperationDetailResponse(
    domainName: json['DomainName'] as String,
    message: json['Message'] as String,
    operationId: json['OperationId'] as String,
    status: _$enumDecodeNullable(_$OperationStatusEnumMap, json['Status']),
    submittedDate:
        const UnixDateTimeConverter().fromJson(json['SubmittedDate']),
    type: _$enumDecodeNullable(_$OperationTypeEnumMap, json['Type']),
  );
}

const _$OperationStatusEnumMap = {
  OperationStatus.submitted: 'SUBMITTED',
  OperationStatus.inProgress: 'IN_PROGRESS',
  OperationStatus.error: 'ERROR',
  OperationStatus.successful: 'SUCCESSFUL',
  OperationStatus.failed: 'FAILED',
};

ListDomainsResponse _$ListDomainsResponseFromJson(Map<String, dynamic> json) {
  return ListDomainsResponse(
    domains: (json['Domains'] as List)
        ?.map((e) => e == null
            ? null
            : DomainSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageMarker: json['NextPageMarker'] as String,
  );
}

ListOperationsResponse _$ListOperationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListOperationsResponse(
    operations: (json['Operations'] as List)
        ?.map((e) => e == null
            ? null
            : OperationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageMarker: json['NextPageMarker'] as String,
  );
}

ListTagsForDomainResponse _$ListTagsForDomainResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForDomainResponse(
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Nameserver _$NameserverFromJson(Map<String, dynamic> json) {
  return Nameserver(
    name: json['Name'] as String,
    glueIps: (json['GlueIps'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$NameserverToJson(Nameserver instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('GlueIps', instance.glueIps);
  return val;
}

OperationSummary _$OperationSummaryFromJson(Map<String, dynamic> json) {
  return OperationSummary(
    operationId: json['OperationId'] as String,
    status: _$enumDecodeNullable(_$OperationStatusEnumMap, json['Status']),
    submittedDate:
        const UnixDateTimeConverter().fromJson(json['SubmittedDate']),
    type: _$enumDecodeNullable(_$OperationTypeEnumMap, json['Type']),
  );
}

RegisterDomainResponse _$RegisterDomainResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterDomainResponse(
    operationId: json['OperationId'] as String,
  );
}

RejectDomainTransferFromAnotherAwsAccountResponse
    _$RejectDomainTransferFromAnotherAwsAccountResponseFromJson(
        Map<String, dynamic> json) {
  return RejectDomainTransferFromAnotherAwsAccountResponse(
    operationId: json['OperationId'] as String,
  );
}

RenewDomainResponse _$RenewDomainResponseFromJson(Map<String, dynamic> json) {
  return RenewDomainResponse(
    operationId: json['OperationId'] as String,
  );
}

ResendContactReachabilityEmailResponse
    _$ResendContactReachabilityEmailResponseFromJson(
        Map<String, dynamic> json) {
  return ResendContactReachabilityEmailResponse(
    domainName: json['domainName'] as String,
    emailAddress: json['emailAddress'] as String,
    isAlreadyVerified: json['isAlreadyVerified'] as bool,
  );
}

RetrieveDomainAuthCodeResponse _$RetrieveDomainAuthCodeResponseFromJson(
    Map<String, dynamic> json) {
  return RetrieveDomainAuthCodeResponse(
    authCode: json['AuthCode'] as String,
  );
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

TransferDomainResponse _$TransferDomainResponseFromJson(
    Map<String, dynamic> json) {
  return TransferDomainResponse(
    operationId: json['OperationId'] as String,
  );
}

TransferDomainToAnotherAwsAccountResponse
    _$TransferDomainToAnotherAwsAccountResponseFromJson(
        Map<String, dynamic> json) {
  return TransferDomainToAnotherAwsAccountResponse(
    operationId: json['OperationId'] as String,
    password: json['Password'] as String,
  );
}

UpdateDomainContactPrivacyResponse _$UpdateDomainContactPrivacyResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDomainContactPrivacyResponse(
    operationId: json['OperationId'] as String,
  );
}

UpdateDomainContactResponse _$UpdateDomainContactResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDomainContactResponse(
    operationId: json['OperationId'] as String,
  );
}

UpdateDomainNameserversResponse _$UpdateDomainNameserversResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDomainNameserversResponse(
    operationId: json['OperationId'] as String,
  );
}

UpdateTagsForDomainResponse _$UpdateTagsForDomainResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTagsForDomainResponse();
}

ViewBillingResponse _$ViewBillingResponseFromJson(Map<String, dynamic> json) {
  return ViewBillingResponse(
    billingRecords: (json['BillingRecords'] as List)
        ?.map((e) => e == null
            ? null
            : BillingRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageMarker: json['NextPageMarker'] as String,
  );
}
