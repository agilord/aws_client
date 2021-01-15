// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-07-29.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllQueryArguments _$AllQueryArgumentsFromJson(Map<String, dynamic> json) {
  return AllQueryArguments();
}

Map<String, dynamic> _$AllQueryArgumentsToJson(AllQueryArguments instance) =>
    <String, dynamic>{};

AllowAction _$AllowActionFromJson(Map<String, dynamic> json) {
  return AllowAction();
}

Map<String, dynamic> _$AllowActionToJson(AllowAction instance) =>
    <String, dynamic>{};

AndStatement _$AndStatementFromJson(Map<String, dynamic> json) {
  return AndStatement(
    statements: (json['Statements'] as List)
        ?.map((e) =>
            e == null ? null : Statement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AndStatementToJson(AndStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Statements', instance.statements?.map((e) => e?.toJson())?.toList());
  return val;
}

AssociateWebACLResponse _$AssociateWebACLResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateWebACLResponse();
}

BlockAction _$BlockActionFromJson(Map<String, dynamic> json) {
  return BlockAction();
}

Map<String, dynamic> _$BlockActionToJson(BlockAction instance) =>
    <String, dynamic>{};

Body _$BodyFromJson(Map<String, dynamic> json) {
  return Body();
}

Map<String, dynamic> _$BodyToJson(Body instance) => <String, dynamic>{};

ByteMatchStatement _$ByteMatchStatementFromJson(Map<String, dynamic> json) {
  return ByteMatchStatement(
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    positionalConstraint: _$enumDecodeNullable(
        _$PositionalConstraintEnumMap, json['PositionalConstraint']),
    searchString:
        const Uint8ListConverter().fromJson(json['SearchString'] as String),
    textTransformations: (json['TextTransformations'] as List)
        ?.map((e) => e == null
            ? null
            : TextTransformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ByteMatchStatementToJson(ByteMatchStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('PositionalConstraint',
      _$PositionalConstraintEnumMap[instance.positionalConstraint]);
  writeNotNull(
      'SearchString', const Uint8ListConverter().toJson(instance.searchString));
  writeNotNull('TextTransformations',
      instance.textTransformations?.map((e) => e?.toJson())?.toList());
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

const _$PositionalConstraintEnumMap = {
  PositionalConstraint.exactly: 'EXACTLY',
  PositionalConstraint.startsWith: 'STARTS_WITH',
  PositionalConstraint.endsWith: 'ENDS_WITH',
  PositionalConstraint.contains: 'CONTAINS',
  PositionalConstraint.containsWord: 'CONTAINS_WORD',
};

CheckCapacityResponse _$CheckCapacityResponseFromJson(
    Map<String, dynamic> json) {
  return CheckCapacityResponse(
    capacity: json['Capacity'] as int,
  );
}

CountAction _$CountActionFromJson(Map<String, dynamic> json) {
  return CountAction();
}

Map<String, dynamic> _$CountActionToJson(CountAction instance) =>
    <String, dynamic>{};

CreateIPSetResponse _$CreateIPSetResponseFromJson(Map<String, dynamic> json) {
  return CreateIPSetResponse(
    summary: json['Summary'] == null
        ? null
        : IPSetSummary.fromJson(json['Summary'] as Map<String, dynamic>),
  );
}

CreateRegexPatternSetResponse _$CreateRegexPatternSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRegexPatternSetResponse(
    summary: json['Summary'] == null
        ? null
        : RegexPatternSetSummary.fromJson(
            json['Summary'] as Map<String, dynamic>),
  );
}

CreateRuleGroupResponse _$CreateRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRuleGroupResponse(
    summary: json['Summary'] == null
        ? null
        : RuleGroupSummary.fromJson(json['Summary'] as Map<String, dynamic>),
  );
}

CreateWebACLResponse _$CreateWebACLResponseFromJson(Map<String, dynamic> json) {
  return CreateWebACLResponse(
    summary: json['Summary'] == null
        ? null
        : WebACLSummary.fromJson(json['Summary'] as Map<String, dynamic>),
  );
}

DefaultAction _$DefaultActionFromJson(Map<String, dynamic> json) {
  return DefaultAction(
    allow: json['Allow'] == null
        ? null
        : AllowAction.fromJson(json['Allow'] as Map<String, dynamic>),
    block: json['Block'] == null
        ? null
        : BlockAction.fromJson(json['Block'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DefaultActionToJson(DefaultAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Allow', instance.allow?.toJson());
  writeNotNull('Block', instance.block?.toJson());
  return val;
}

DeleteFirewallManagerRuleGroupsResponse
    _$DeleteFirewallManagerRuleGroupsResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteFirewallManagerRuleGroupsResponse(
    nextWebACLLockToken: json['NextWebACLLockToken'] as String,
  );
}

DeleteIPSetResponse _$DeleteIPSetResponseFromJson(Map<String, dynamic> json) {
  return DeleteIPSetResponse();
}

DeleteLoggingConfigurationResponse _$DeleteLoggingConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLoggingConfigurationResponse();
}

DeletePermissionPolicyResponse _$DeletePermissionPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePermissionPolicyResponse();
}

DeleteRegexPatternSetResponse _$DeleteRegexPatternSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRegexPatternSetResponse();
}

DeleteRuleGroupResponse _$DeleteRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRuleGroupResponse();
}

DeleteWebACLResponse _$DeleteWebACLResponseFromJson(Map<String, dynamic> json) {
  return DeleteWebACLResponse();
}

DescribeManagedRuleGroupResponse _$DescribeManagedRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeManagedRuleGroupResponse(
    capacity: json['Capacity'] as int,
    rules: (json['Rules'] as List)
        ?.map((e) =>
            e == null ? null : RuleSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DisassociateWebACLResponse _$DisassociateWebACLResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateWebACLResponse();
}

ExcludedRule _$ExcludedRuleFromJson(Map<String, dynamic> json) {
  return ExcludedRule(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$ExcludedRuleToJson(ExcludedRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

FieldToMatch _$FieldToMatchFromJson(Map<String, dynamic> json) {
  return FieldToMatch(
    allQueryArguments: json['AllQueryArguments'] == null
        ? null
        : AllQueryArguments.fromJson(
            json['AllQueryArguments'] as Map<String, dynamic>),
    body: json['Body'] == null
        ? null
        : Body.fromJson(json['Body'] as Map<String, dynamic>),
    method: json['Method'] == null
        ? null
        : Method.fromJson(json['Method'] as Map<String, dynamic>),
    queryString: json['QueryString'] == null
        ? null
        : QueryString.fromJson(json['QueryString'] as Map<String, dynamic>),
    singleHeader: json['SingleHeader'] == null
        ? null
        : SingleHeader.fromJson(json['SingleHeader'] as Map<String, dynamic>),
    singleQueryArgument: json['SingleQueryArgument'] == null
        ? null
        : SingleQueryArgument.fromJson(
            json['SingleQueryArgument'] as Map<String, dynamic>),
    uriPath: json['UriPath'] == null
        ? null
        : UriPath.fromJson(json['UriPath'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FieldToMatchToJson(FieldToMatch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllQueryArguments', instance.allQueryArguments?.toJson());
  writeNotNull('Body', instance.body?.toJson());
  writeNotNull('Method', instance.method?.toJson());
  writeNotNull('QueryString', instance.queryString?.toJson());
  writeNotNull('SingleHeader', instance.singleHeader?.toJson());
  writeNotNull('SingleQueryArgument', instance.singleQueryArgument?.toJson());
  writeNotNull('UriPath', instance.uriPath?.toJson());
  return val;
}

FirewallManagerRuleGroup _$FirewallManagerRuleGroupFromJson(
    Map<String, dynamic> json) {
  return FirewallManagerRuleGroup(
    firewallManagerStatement: json['FirewallManagerStatement'] == null
        ? null
        : FirewallManagerStatement.fromJson(
            json['FirewallManagerStatement'] as Map<String, dynamic>),
    name: json['Name'] as String,
    overrideAction: json['OverrideAction'] == null
        ? null
        : OverrideAction.fromJson(
            json['OverrideAction'] as Map<String, dynamic>),
    priority: json['Priority'] as int,
    visibilityConfig: json['VisibilityConfig'] == null
        ? null
        : VisibilityConfig.fromJson(
            json['VisibilityConfig'] as Map<String, dynamic>),
  );
}

FirewallManagerStatement _$FirewallManagerStatementFromJson(
    Map<String, dynamic> json) {
  return FirewallManagerStatement(
    managedRuleGroupStatement: json['ManagedRuleGroupStatement'] == null
        ? null
        : ManagedRuleGroupStatement.fromJson(
            json['ManagedRuleGroupStatement'] as Map<String, dynamic>),
    ruleGroupReferenceStatement: json['RuleGroupReferenceStatement'] == null
        ? null
        : RuleGroupReferenceStatement.fromJson(
            json['RuleGroupReferenceStatement'] as Map<String, dynamic>),
  );
}

ForwardedIPConfig _$ForwardedIPConfigFromJson(Map<String, dynamic> json) {
  return ForwardedIPConfig(
    fallbackBehavior: _$enumDecodeNullable(
        _$FallbackBehaviorEnumMap, json['FallbackBehavior']),
    headerName: json['HeaderName'] as String,
  );
}

Map<String, dynamic> _$ForwardedIPConfigToJson(ForwardedIPConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'FallbackBehavior', _$FallbackBehaviorEnumMap[instance.fallbackBehavior]);
  writeNotNull('HeaderName', instance.headerName);
  return val;
}

const _$FallbackBehaviorEnumMap = {
  FallbackBehavior.match: 'MATCH',
  FallbackBehavior.noMatch: 'NO_MATCH',
};

GeoMatchStatement _$GeoMatchStatementFromJson(Map<String, dynamic> json) {
  return GeoMatchStatement(
    countryCodes: (json['CountryCodes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$CountryCodeEnumMap, e))
        ?.toList(),
    forwardedIPConfig: json['ForwardedIPConfig'] == null
        ? null
        : ForwardedIPConfig.fromJson(
            json['ForwardedIPConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GeoMatchStatementToJson(GeoMatchStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CountryCodes',
      instance.countryCodes?.map((e) => _$CountryCodeEnumMap[e])?.toList());
  writeNotNull('ForwardedIPConfig', instance.forwardedIPConfig?.toJson());
  return val;
}

const _$CountryCodeEnumMap = {
  CountryCode.af: 'AF',
  CountryCode.ax: 'AX',
  CountryCode.al: 'AL',
  CountryCode.dz: 'DZ',
  CountryCode.as: 'AS',
  CountryCode.ad: 'AD',
  CountryCode.ao: 'AO',
  CountryCode.ai: 'AI',
  CountryCode.aq: 'AQ',
  CountryCode.ag: 'AG',
  CountryCode.ar: 'AR',
  CountryCode.am: 'AM',
  CountryCode.aw: 'AW',
  CountryCode.au: 'AU',
  CountryCode.at: 'AT',
  CountryCode.az: 'AZ',
  CountryCode.bs: 'BS',
  CountryCode.bh: 'BH',
  CountryCode.bd: 'BD',
  CountryCode.bb: 'BB',
  CountryCode.by: 'BY',
  CountryCode.be: 'BE',
  CountryCode.bz: 'BZ',
  CountryCode.bj: 'BJ',
  CountryCode.bm: 'BM',
  CountryCode.bt: 'BT',
  CountryCode.bo: 'BO',
  CountryCode.bq: 'BQ',
  CountryCode.ba: 'BA',
  CountryCode.bw: 'BW',
  CountryCode.bv: 'BV',
  CountryCode.br: 'BR',
  CountryCode.io: 'IO',
  CountryCode.bn: 'BN',
  CountryCode.bg: 'BG',
  CountryCode.bf: 'BF',
  CountryCode.bi: 'BI',
  CountryCode.kh: 'KH',
  CountryCode.cm: 'CM',
  CountryCode.ca: 'CA',
  CountryCode.cv: 'CV',
  CountryCode.ky: 'KY',
  CountryCode.cf: 'CF',
  CountryCode.td: 'TD',
  CountryCode.cl: 'CL',
  CountryCode.cn: 'CN',
  CountryCode.cx: 'CX',
  CountryCode.cc: 'CC',
  CountryCode.co: 'CO',
  CountryCode.km: 'KM',
  CountryCode.cg: 'CG',
  CountryCode.cd: 'CD',
  CountryCode.ck: 'CK',
  CountryCode.cr: 'CR',
  CountryCode.ci: 'CI',
  CountryCode.hr: 'HR',
  CountryCode.cu: 'CU',
  CountryCode.cw: 'CW',
  CountryCode.cy: 'CY',
  CountryCode.cz: 'CZ',
  CountryCode.dk: 'DK',
  CountryCode.dj: 'DJ',
  CountryCode.dm: 'DM',
  CountryCode.$do: 'DO',
  CountryCode.ec: 'EC',
  CountryCode.eg: 'EG',
  CountryCode.sv: 'SV',
  CountryCode.gq: 'GQ',
  CountryCode.er: 'ER',
  CountryCode.ee: 'EE',
  CountryCode.et: 'ET',
  CountryCode.fk: 'FK',
  CountryCode.fo: 'FO',
  CountryCode.fj: 'FJ',
  CountryCode.fi: 'FI',
  CountryCode.fr: 'FR',
  CountryCode.gf: 'GF',
  CountryCode.pf: 'PF',
  CountryCode.tf: 'TF',
  CountryCode.ga: 'GA',
  CountryCode.gm: 'GM',
  CountryCode.ge: 'GE',
  CountryCode.de: 'DE',
  CountryCode.gh: 'GH',
  CountryCode.gi: 'GI',
  CountryCode.gr: 'GR',
  CountryCode.gl: 'GL',
  CountryCode.gd: 'GD',
  CountryCode.gp: 'GP',
  CountryCode.gu: 'GU',
  CountryCode.gt: 'GT',
  CountryCode.gg: 'GG',
  CountryCode.gn: 'GN',
  CountryCode.gw: 'GW',
  CountryCode.gy: 'GY',
  CountryCode.ht: 'HT',
  CountryCode.hm: 'HM',
  CountryCode.va: 'VA',
  CountryCode.hn: 'HN',
  CountryCode.hk: 'HK',
  CountryCode.hu: 'HU',
  CountryCode.$is: 'IS',
  CountryCode.$in: 'IN',
  CountryCode.id: 'ID',
  CountryCode.ir: 'IR',
  CountryCode.iq: 'IQ',
  CountryCode.ie: 'IE',
  CountryCode.im: 'IM',
  CountryCode.il: 'IL',
  CountryCode.it: 'IT',
  CountryCode.jm: 'JM',
  CountryCode.jp: 'JP',
  CountryCode.je: 'JE',
  CountryCode.jo: 'JO',
  CountryCode.kz: 'KZ',
  CountryCode.ke: 'KE',
  CountryCode.ki: 'KI',
  CountryCode.kp: 'KP',
  CountryCode.kr: 'KR',
  CountryCode.kw: 'KW',
  CountryCode.kg: 'KG',
  CountryCode.la: 'LA',
  CountryCode.lv: 'LV',
  CountryCode.lb: 'LB',
  CountryCode.ls: 'LS',
  CountryCode.lr: 'LR',
  CountryCode.ly: 'LY',
  CountryCode.li: 'LI',
  CountryCode.lt: 'LT',
  CountryCode.lu: 'LU',
  CountryCode.mo: 'MO',
  CountryCode.mk: 'MK',
  CountryCode.mg: 'MG',
  CountryCode.mw: 'MW',
  CountryCode.my: 'MY',
  CountryCode.mv: 'MV',
  CountryCode.ml: 'ML',
  CountryCode.mt: 'MT',
  CountryCode.mh: 'MH',
  CountryCode.mq: 'MQ',
  CountryCode.mr: 'MR',
  CountryCode.mu: 'MU',
  CountryCode.yt: 'YT',
  CountryCode.mx: 'MX',
  CountryCode.fm: 'FM',
  CountryCode.md: 'MD',
  CountryCode.mc: 'MC',
  CountryCode.mn: 'MN',
  CountryCode.me: 'ME',
  CountryCode.ms: 'MS',
  CountryCode.ma: 'MA',
  CountryCode.mz: 'MZ',
  CountryCode.mm: 'MM',
  CountryCode.na: 'NA',
  CountryCode.nr: 'NR',
  CountryCode.np: 'NP',
  CountryCode.nl: 'NL',
  CountryCode.nc: 'NC',
  CountryCode.nz: 'NZ',
  CountryCode.ni: 'NI',
  CountryCode.ne: 'NE',
  CountryCode.ng: 'NG',
  CountryCode.nu: 'NU',
  CountryCode.nf: 'NF',
  CountryCode.mp: 'MP',
  CountryCode.no: 'NO',
  CountryCode.om: 'OM',
  CountryCode.pk: 'PK',
  CountryCode.pw: 'PW',
  CountryCode.ps: 'PS',
  CountryCode.pa: 'PA',
  CountryCode.pg: 'PG',
  CountryCode.py: 'PY',
  CountryCode.pe: 'PE',
  CountryCode.ph: 'PH',
  CountryCode.pn: 'PN',
  CountryCode.pl: 'PL',
  CountryCode.pt: 'PT',
  CountryCode.pr: 'PR',
  CountryCode.qa: 'QA',
  CountryCode.re: 'RE',
  CountryCode.ro: 'RO',
  CountryCode.ru: 'RU',
  CountryCode.rw: 'RW',
  CountryCode.bl: 'BL',
  CountryCode.sh: 'SH',
  CountryCode.kn: 'KN',
  CountryCode.lc: 'LC',
  CountryCode.mf: 'MF',
  CountryCode.pm: 'PM',
  CountryCode.vc: 'VC',
  CountryCode.ws: 'WS',
  CountryCode.sm: 'SM',
  CountryCode.st: 'ST',
  CountryCode.sa: 'SA',
  CountryCode.sn: 'SN',
  CountryCode.rs: 'RS',
  CountryCode.sc: 'SC',
  CountryCode.sl: 'SL',
  CountryCode.sg: 'SG',
  CountryCode.sx: 'SX',
  CountryCode.sk: 'SK',
  CountryCode.si: 'SI',
  CountryCode.sb: 'SB',
  CountryCode.so: 'SO',
  CountryCode.za: 'ZA',
  CountryCode.gs: 'GS',
  CountryCode.ss: 'SS',
  CountryCode.es: 'ES',
  CountryCode.lk: 'LK',
  CountryCode.sd: 'SD',
  CountryCode.sr: 'SR',
  CountryCode.sj: 'SJ',
  CountryCode.sz: 'SZ',
  CountryCode.se: 'SE',
  CountryCode.ch: 'CH',
  CountryCode.sy: 'SY',
  CountryCode.tw: 'TW',
  CountryCode.tj: 'TJ',
  CountryCode.tz: 'TZ',
  CountryCode.th: 'TH',
  CountryCode.tl: 'TL',
  CountryCode.tg: 'TG',
  CountryCode.tk: 'TK',
  CountryCode.to: 'TO',
  CountryCode.tt: 'TT',
  CountryCode.tn: 'TN',
  CountryCode.tr: 'TR',
  CountryCode.tm: 'TM',
  CountryCode.tc: 'TC',
  CountryCode.tv: 'TV',
  CountryCode.ug: 'UG',
  CountryCode.ua: 'UA',
  CountryCode.ae: 'AE',
  CountryCode.gb: 'GB',
  CountryCode.us: 'US',
  CountryCode.um: 'UM',
  CountryCode.uy: 'UY',
  CountryCode.uz: 'UZ',
  CountryCode.vu: 'VU',
  CountryCode.ve: 'VE',
  CountryCode.vn: 'VN',
  CountryCode.vg: 'VG',
  CountryCode.vi: 'VI',
  CountryCode.wf: 'WF',
  CountryCode.eh: 'EH',
  CountryCode.ye: 'YE',
  CountryCode.zm: 'ZM',
  CountryCode.zw: 'ZW',
};

GetIPSetResponse _$GetIPSetResponseFromJson(Map<String, dynamic> json) {
  return GetIPSetResponse(
    iPSet: json['IPSet'] == null
        ? null
        : IPSet.fromJson(json['IPSet'] as Map<String, dynamic>),
    lockToken: json['LockToken'] as String,
  );
}

GetLoggingConfigurationResponse _$GetLoggingConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return GetLoggingConfigurationResponse(
    loggingConfiguration: json['LoggingConfiguration'] == null
        ? null
        : LoggingConfiguration.fromJson(
            json['LoggingConfiguration'] as Map<String, dynamic>),
  );
}

GetPermissionPolicyResponse _$GetPermissionPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return GetPermissionPolicyResponse(
    policy: json['Policy'] as String,
  );
}

GetRateBasedStatementManagedKeysResponse
    _$GetRateBasedStatementManagedKeysResponseFromJson(
        Map<String, dynamic> json) {
  return GetRateBasedStatementManagedKeysResponse(
    managedKeysIPV4: json['ManagedKeysIPV4'] == null
        ? null
        : RateBasedStatementManagedKeysIPSet.fromJson(
            json['ManagedKeysIPV4'] as Map<String, dynamic>),
    managedKeysIPV6: json['ManagedKeysIPV6'] == null
        ? null
        : RateBasedStatementManagedKeysIPSet.fromJson(
            json['ManagedKeysIPV6'] as Map<String, dynamic>),
  );
}

GetRegexPatternSetResponse _$GetRegexPatternSetResponseFromJson(
    Map<String, dynamic> json) {
  return GetRegexPatternSetResponse(
    lockToken: json['LockToken'] as String,
    regexPatternSet: json['RegexPatternSet'] == null
        ? null
        : RegexPatternSet.fromJson(
            json['RegexPatternSet'] as Map<String, dynamic>),
  );
}

GetRuleGroupResponse _$GetRuleGroupResponseFromJson(Map<String, dynamic> json) {
  return GetRuleGroupResponse(
    lockToken: json['LockToken'] as String,
    ruleGroup: json['RuleGroup'] == null
        ? null
        : RuleGroup.fromJson(json['RuleGroup'] as Map<String, dynamic>),
  );
}

GetSampledRequestsResponse _$GetSampledRequestsResponseFromJson(
    Map<String, dynamic> json) {
  return GetSampledRequestsResponse(
    populationSize: json['PopulationSize'] as int,
    sampledRequests: (json['SampledRequests'] as List)
        ?.map((e) => e == null
            ? null
            : SampledHTTPRequest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timeWindow: json['TimeWindow'] == null
        ? null
        : TimeWindow.fromJson(json['TimeWindow'] as Map<String, dynamic>),
  );
}

GetWebACLForResourceResponse _$GetWebACLForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return GetWebACLForResourceResponse(
    webACL: json['WebACL'] == null
        ? null
        : WebACL.fromJson(json['WebACL'] as Map<String, dynamic>),
  );
}

GetWebACLResponse _$GetWebACLResponseFromJson(Map<String, dynamic> json) {
  return GetWebACLResponse(
    lockToken: json['LockToken'] as String,
    webACL: json['WebACL'] == null
        ? null
        : WebACL.fromJson(json['WebACL'] as Map<String, dynamic>),
  );
}

HTTPHeader _$HTTPHeaderFromJson(Map<String, dynamic> json) {
  return HTTPHeader(
    name: json['Name'] as String,
    value: json['Value'] as String,
  );
}

HTTPRequest _$HTTPRequestFromJson(Map<String, dynamic> json) {
  return HTTPRequest(
    clientIP: json['ClientIP'] as String,
    country: json['Country'] as String,
    hTTPVersion: json['HTTPVersion'] as String,
    headers: (json['Headers'] as List)
        ?.map((e) =>
            e == null ? null : HTTPHeader.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    method: json['Method'] as String,
    uri: json['URI'] as String,
  );
}

IPSet _$IPSetFromJson(Map<String, dynamic> json) {
  return IPSet(
    arn: json['ARN'] as String,
    addresses: (json['Addresses'] as List)?.map((e) => e as String)?.toList(),
    iPAddressVersion: _$enumDecodeNullable(
        _$IPAddressVersionEnumMap, json['IPAddressVersion']),
    id: json['Id'] as String,
    name: json['Name'] as String,
    description: json['Description'] as String,
  );
}

const _$IPAddressVersionEnumMap = {
  IPAddressVersion.ipv4: 'IPV4',
  IPAddressVersion.ipv6: 'IPV6',
};

IPSetForwardedIPConfig _$IPSetForwardedIPConfigFromJson(
    Map<String, dynamic> json) {
  return IPSetForwardedIPConfig(
    fallbackBehavior: _$enumDecodeNullable(
        _$FallbackBehaviorEnumMap, json['FallbackBehavior']),
    headerName: json['HeaderName'] as String,
    position:
        _$enumDecodeNullable(_$ForwardedIPPositionEnumMap, json['Position']),
  );
}

Map<String, dynamic> _$IPSetForwardedIPConfigToJson(
    IPSetForwardedIPConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'FallbackBehavior', _$FallbackBehaviorEnumMap[instance.fallbackBehavior]);
  writeNotNull('HeaderName', instance.headerName);
  writeNotNull('Position', _$ForwardedIPPositionEnumMap[instance.position]);
  return val;
}

const _$ForwardedIPPositionEnumMap = {
  ForwardedIPPosition.first: 'FIRST',
  ForwardedIPPosition.last: 'LAST',
  ForwardedIPPosition.any: 'ANY',
};

IPSetReferenceStatement _$IPSetReferenceStatementFromJson(
    Map<String, dynamic> json) {
  return IPSetReferenceStatement(
    arn: json['ARN'] as String,
    iPSetForwardedIPConfig: json['IPSetForwardedIPConfig'] == null
        ? null
        : IPSetForwardedIPConfig.fromJson(
            json['IPSetForwardedIPConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IPSetReferenceStatementToJson(
    IPSetReferenceStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ARN', instance.arn);
  writeNotNull(
      'IPSetForwardedIPConfig', instance.iPSetForwardedIPConfig?.toJson());
  return val;
}

IPSetSummary _$IPSetSummaryFromJson(Map<String, dynamic> json) {
  return IPSetSummary(
    arn: json['ARN'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    lockToken: json['LockToken'] as String,
    name: json['Name'] as String,
  );
}

ListAvailableManagedRuleGroupsResponse
    _$ListAvailableManagedRuleGroupsResponseFromJson(
        Map<String, dynamic> json) {
  return ListAvailableManagedRuleGroupsResponse(
    managedRuleGroups: (json['ManagedRuleGroups'] as List)
        ?.map((e) => e == null
            ? null
            : ManagedRuleGroupSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListIPSetsResponse _$ListIPSetsResponseFromJson(Map<String, dynamic> json) {
  return ListIPSetsResponse(
    iPSets: (json['IPSets'] as List)
        ?.map((e) =>
            e == null ? null : IPSetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListLoggingConfigurationsResponse _$ListLoggingConfigurationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLoggingConfigurationsResponse(
    loggingConfigurations: (json['LoggingConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : LoggingConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListRegexPatternSetsResponse _$ListRegexPatternSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRegexPatternSetsResponse(
    nextMarker: json['NextMarker'] as String,
    regexPatternSets: (json['RegexPatternSets'] as List)
        ?.map((e) => e == null
            ? null
            : RegexPatternSetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListResourcesForWebACLResponse _$ListResourcesForWebACLResponseFromJson(
    Map<String, dynamic> json) {
  return ListResourcesForWebACLResponse(
    resourceArns:
        (json['ResourceArns'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListRuleGroupsResponse _$ListRuleGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRuleGroupsResponse(
    nextMarker: json['NextMarker'] as String,
    ruleGroups: (json['RuleGroups'] as List)
        ?.map((e) => e == null
            ? null
            : RuleGroupSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    nextMarker: json['NextMarker'] as String,
    tagInfoForResource: json['TagInfoForResource'] == null
        ? null
        : TagInfoForResource.fromJson(
            json['TagInfoForResource'] as Map<String, dynamic>),
  );
}

ListWebACLsResponse _$ListWebACLsResponseFromJson(Map<String, dynamic> json) {
  return ListWebACLsResponse(
    nextMarker: json['NextMarker'] as String,
    webACLs: (json['WebACLs'] as List)
        ?.map((e) => e == null
            ? null
            : WebACLSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LoggingConfiguration _$LoggingConfigurationFromJson(Map<String, dynamic> json) {
  return LoggingConfiguration(
    logDestinationConfigs: (json['LogDestinationConfigs'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    resourceArn: json['ResourceArn'] as String,
    managedByFirewallManager: json['ManagedByFirewallManager'] as bool,
    redactedFields: (json['RedactedFields'] as List)
        ?.map((e) =>
            e == null ? null : FieldToMatch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

  writeNotNull('LogDestinationConfigs', instance.logDestinationConfigs);
  writeNotNull('ResourceArn', instance.resourceArn);
  writeNotNull('ManagedByFirewallManager', instance.managedByFirewallManager);
  writeNotNull('RedactedFields',
      instance.redactedFields?.map((e) => e?.toJson())?.toList());
  return val;
}

ManagedRuleGroupStatement _$ManagedRuleGroupStatementFromJson(
    Map<String, dynamic> json) {
  return ManagedRuleGroupStatement(
    name: json['Name'] as String,
    vendorName: json['VendorName'] as String,
    excludedRules: (json['ExcludedRules'] as List)
        ?.map((e) =>
            e == null ? null : ExcludedRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ManagedRuleGroupStatementToJson(
    ManagedRuleGroupStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('VendorName', instance.vendorName);
  writeNotNull('ExcludedRules',
      instance.excludedRules?.map((e) => e?.toJson())?.toList());
  return val;
}

ManagedRuleGroupSummary _$ManagedRuleGroupSummaryFromJson(
    Map<String, dynamic> json) {
  return ManagedRuleGroupSummary(
    description: json['Description'] as String,
    name: json['Name'] as String,
    vendorName: json['VendorName'] as String,
  );
}

Method _$MethodFromJson(Map<String, dynamic> json) {
  return Method();
}

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{};

NoneAction _$NoneActionFromJson(Map<String, dynamic> json) {
  return NoneAction();
}

Map<String, dynamic> _$NoneActionToJson(NoneAction instance) =>
    <String, dynamic>{};

NotStatement _$NotStatementFromJson(Map<String, dynamic> json) {
  return NotStatement(
    statement: json['Statement'] == null
        ? null
        : Statement.fromJson(json['Statement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NotStatementToJson(NotStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Statement', instance.statement?.toJson());
  return val;
}

OrStatement _$OrStatementFromJson(Map<String, dynamic> json) {
  return OrStatement(
    statements: (json['Statements'] as List)
        ?.map((e) =>
            e == null ? null : Statement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrStatementToJson(OrStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Statements', instance.statements?.map((e) => e?.toJson())?.toList());
  return val;
}

OverrideAction _$OverrideActionFromJson(Map<String, dynamic> json) {
  return OverrideAction(
    count: json['Count'] == null
        ? null
        : CountAction.fromJson(json['Count'] as Map<String, dynamic>),
    none: json['None'] == null
        ? null
        : NoneAction.fromJson(json['None'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OverrideActionToJson(OverrideAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Count', instance.count?.toJson());
  writeNotNull('None', instance.none?.toJson());
  return val;
}

PutLoggingConfigurationResponse _$PutLoggingConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return PutLoggingConfigurationResponse(
    loggingConfiguration: json['LoggingConfiguration'] == null
        ? null
        : LoggingConfiguration.fromJson(
            json['LoggingConfiguration'] as Map<String, dynamic>),
  );
}

PutPermissionPolicyResponse _$PutPermissionPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return PutPermissionPolicyResponse();
}

QueryString _$QueryStringFromJson(Map<String, dynamic> json) {
  return QueryString();
}

Map<String, dynamic> _$QueryStringToJson(QueryString instance) =>
    <String, dynamic>{};

RateBasedStatement _$RateBasedStatementFromJson(Map<String, dynamic> json) {
  return RateBasedStatement(
    aggregateKeyType: _$enumDecodeNullable(
        _$RateBasedStatementAggregateKeyTypeEnumMap, json['AggregateKeyType']),
    limit: json['Limit'] as int,
    forwardedIPConfig: json['ForwardedIPConfig'] == null
        ? null
        : ForwardedIPConfig.fromJson(
            json['ForwardedIPConfig'] as Map<String, dynamic>),
    scopeDownStatement: json['ScopeDownStatement'] == null
        ? null
        : Statement.fromJson(
            json['ScopeDownStatement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RateBasedStatementToJson(RateBasedStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AggregateKeyType',
      _$RateBasedStatementAggregateKeyTypeEnumMap[instance.aggregateKeyType]);
  writeNotNull('Limit', instance.limit);
  writeNotNull('ForwardedIPConfig', instance.forwardedIPConfig?.toJson());
  writeNotNull('ScopeDownStatement', instance.scopeDownStatement?.toJson());
  return val;
}

const _$RateBasedStatementAggregateKeyTypeEnumMap = {
  RateBasedStatementAggregateKeyType.ip: 'IP',
  RateBasedStatementAggregateKeyType.forwardedIp: 'FORWARDED_IP',
};

RateBasedStatementManagedKeysIPSet _$RateBasedStatementManagedKeysIPSetFromJson(
    Map<String, dynamic> json) {
  return RateBasedStatementManagedKeysIPSet(
    addresses: (json['Addresses'] as List)?.map((e) => e as String)?.toList(),
    iPAddressVersion: _$enumDecodeNullable(
        _$IPAddressVersionEnumMap, json['IPAddressVersion']),
  );
}

Regex _$RegexFromJson(Map<String, dynamic> json) {
  return Regex(
    regexString: json['RegexString'] as String,
  );
}

Map<String, dynamic> _$RegexToJson(Regex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegexString', instance.regexString);
  return val;
}

RegexPatternSet _$RegexPatternSetFromJson(Map<String, dynamic> json) {
  return RegexPatternSet(
    arn: json['ARN'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    name: json['Name'] as String,
    regularExpressionList: (json['RegularExpressionList'] as List)
        ?.map(
            (e) => e == null ? null : Regex.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RegexPatternSetReferenceStatement _$RegexPatternSetReferenceStatementFromJson(
    Map<String, dynamic> json) {
  return RegexPatternSetReferenceStatement(
    arn: json['ARN'] as String,
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    textTransformations: (json['TextTransformations'] as List)
        ?.map((e) => e == null
            ? null
            : TextTransformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RegexPatternSetReferenceStatementToJson(
    RegexPatternSetReferenceStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ARN', instance.arn);
  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('TextTransformations',
      instance.textTransformations?.map((e) => e?.toJson())?.toList());
  return val;
}

RegexPatternSetSummary _$RegexPatternSetSummaryFromJson(
    Map<String, dynamic> json) {
  return RegexPatternSetSummary(
    arn: json['ARN'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    lockToken: json['LockToken'] as String,
    name: json['Name'] as String,
  );
}

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return Rule(
    name: json['Name'] as String,
    priority: json['Priority'] as int,
    statement: json['Statement'] == null
        ? null
        : Statement.fromJson(json['Statement'] as Map<String, dynamic>),
    visibilityConfig: json['VisibilityConfig'] == null
        ? null
        : VisibilityConfig.fromJson(
            json['VisibilityConfig'] as Map<String, dynamic>),
    action: json['Action'] == null
        ? null
        : RuleAction.fromJson(json['Action'] as Map<String, dynamic>),
    overrideAction: json['OverrideAction'] == null
        ? null
        : OverrideAction.fromJson(
            json['OverrideAction'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RuleToJson(Rule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Priority', instance.priority);
  writeNotNull('Statement', instance.statement?.toJson());
  writeNotNull('VisibilityConfig', instance.visibilityConfig?.toJson());
  writeNotNull('Action', instance.action?.toJson());
  writeNotNull('OverrideAction', instance.overrideAction?.toJson());
  return val;
}

RuleAction _$RuleActionFromJson(Map<String, dynamic> json) {
  return RuleAction(
    allow: json['Allow'] == null
        ? null
        : AllowAction.fromJson(json['Allow'] as Map<String, dynamic>),
    block: json['Block'] == null
        ? null
        : BlockAction.fromJson(json['Block'] as Map<String, dynamic>),
    count: json['Count'] == null
        ? null
        : CountAction.fromJson(json['Count'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RuleActionToJson(RuleAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Allow', instance.allow?.toJson());
  writeNotNull('Block', instance.block?.toJson());
  writeNotNull('Count', instance.count?.toJson());
  return val;
}

RuleGroup _$RuleGroupFromJson(Map<String, dynamic> json) {
  return RuleGroup(
    arn: json['ARN'] as String,
    capacity: json['Capacity'] as int,
    id: json['Id'] as String,
    name: json['Name'] as String,
    visibilityConfig: json['VisibilityConfig'] == null
        ? null
        : VisibilityConfig.fromJson(
            json['VisibilityConfig'] as Map<String, dynamic>),
    description: json['Description'] as String,
    rules: (json['Rules'] as List)
        ?.map(
            (e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RuleGroupReferenceStatement _$RuleGroupReferenceStatementFromJson(
    Map<String, dynamic> json) {
  return RuleGroupReferenceStatement(
    arn: json['ARN'] as String,
    excludedRules: (json['ExcludedRules'] as List)
        ?.map((e) =>
            e == null ? null : ExcludedRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RuleGroupReferenceStatementToJson(
    RuleGroupReferenceStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ARN', instance.arn);
  writeNotNull('ExcludedRules',
      instance.excludedRules?.map((e) => e?.toJson())?.toList());
  return val;
}

RuleGroupSummary _$RuleGroupSummaryFromJson(Map<String, dynamic> json) {
  return RuleGroupSummary(
    arn: json['ARN'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    lockToken: json['LockToken'] as String,
    name: json['Name'] as String,
  );
}

RuleSummary _$RuleSummaryFromJson(Map<String, dynamic> json) {
  return RuleSummary(
    action: json['Action'] == null
        ? null
        : RuleAction.fromJson(json['Action'] as Map<String, dynamic>),
    name: json['Name'] as String,
  );
}

SampledHTTPRequest _$SampledHTTPRequestFromJson(Map<String, dynamic> json) {
  return SampledHTTPRequest(
    request: json['Request'] == null
        ? null
        : HTTPRequest.fromJson(json['Request'] as Map<String, dynamic>),
    weight: json['Weight'] as int,
    action: json['Action'] as String,
    ruleNameWithinRuleGroup: json['RuleNameWithinRuleGroup'] as String,
    timestamp: const UnixDateTimeConverter().fromJson(json['Timestamp']),
  );
}

SingleHeader _$SingleHeaderFromJson(Map<String, dynamic> json) {
  return SingleHeader(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$SingleHeaderToJson(SingleHeader instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

SingleQueryArgument _$SingleQueryArgumentFromJson(Map<String, dynamic> json) {
  return SingleQueryArgument(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$SingleQueryArgumentToJson(SingleQueryArgument instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  return val;
}

SizeConstraintStatement _$SizeConstraintStatementFromJson(
    Map<String, dynamic> json) {
  return SizeConstraintStatement(
    comparisonOperator: _$enumDecodeNullable(
        _$ComparisonOperatorEnumMap, json['ComparisonOperator']),
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    size: json['Size'] as int,
    textTransformations: (json['TextTransformations'] as List)
        ?.map((e) => e == null
            ? null
            : TextTransformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SizeConstraintStatementToJson(
    SizeConstraintStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComparisonOperator',
      _$ComparisonOperatorEnumMap[instance.comparisonOperator]);
  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('Size', instance.size);
  writeNotNull('TextTransformations',
      instance.textTransformations?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$ComparisonOperatorEnumMap = {
  ComparisonOperator.eq: 'EQ',
  ComparisonOperator.ne: 'NE',
  ComparisonOperator.le: 'LE',
  ComparisonOperator.lt: 'LT',
  ComparisonOperator.ge: 'GE',
  ComparisonOperator.gt: 'GT',
};

SqliMatchStatement _$SqliMatchStatementFromJson(Map<String, dynamic> json) {
  return SqliMatchStatement(
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    textTransformations: (json['TextTransformations'] as List)
        ?.map((e) => e == null
            ? null
            : TextTransformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SqliMatchStatementToJson(SqliMatchStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('TextTransformations',
      instance.textTransformations?.map((e) => e?.toJson())?.toList());
  return val;
}

Statement _$StatementFromJson(Map<String, dynamic> json) {
  return Statement(
    andStatement: json['AndStatement'] == null
        ? null
        : AndStatement.fromJson(json['AndStatement'] as Map<String, dynamic>),
    byteMatchStatement: json['ByteMatchStatement'] == null
        ? null
        : ByteMatchStatement.fromJson(
            json['ByteMatchStatement'] as Map<String, dynamic>),
    geoMatchStatement: json['GeoMatchStatement'] == null
        ? null
        : GeoMatchStatement.fromJson(
            json['GeoMatchStatement'] as Map<String, dynamic>),
    iPSetReferenceStatement: json['IPSetReferenceStatement'] == null
        ? null
        : IPSetReferenceStatement.fromJson(
            json['IPSetReferenceStatement'] as Map<String, dynamic>),
    managedRuleGroupStatement: json['ManagedRuleGroupStatement'] == null
        ? null
        : ManagedRuleGroupStatement.fromJson(
            json['ManagedRuleGroupStatement'] as Map<String, dynamic>),
    notStatement: json['NotStatement'] == null
        ? null
        : NotStatement.fromJson(json['NotStatement'] as Map<String, dynamic>),
    orStatement: json['OrStatement'] == null
        ? null
        : OrStatement.fromJson(json['OrStatement'] as Map<String, dynamic>),
    rateBasedStatement: json['RateBasedStatement'] == null
        ? null
        : RateBasedStatement.fromJson(
            json['RateBasedStatement'] as Map<String, dynamic>),
    regexPatternSetReferenceStatement:
        json['RegexPatternSetReferenceStatement'] == null
            ? null
            : RegexPatternSetReferenceStatement.fromJson(
                json['RegexPatternSetReferenceStatement']
                    as Map<String, dynamic>),
    ruleGroupReferenceStatement: json['RuleGroupReferenceStatement'] == null
        ? null
        : RuleGroupReferenceStatement.fromJson(
            json['RuleGroupReferenceStatement'] as Map<String, dynamic>),
    sizeConstraintStatement: json['SizeConstraintStatement'] == null
        ? null
        : SizeConstraintStatement.fromJson(
            json['SizeConstraintStatement'] as Map<String, dynamic>),
    sqliMatchStatement: json['SqliMatchStatement'] == null
        ? null
        : SqliMatchStatement.fromJson(
            json['SqliMatchStatement'] as Map<String, dynamic>),
    xssMatchStatement: json['XssMatchStatement'] == null
        ? null
        : XssMatchStatement.fromJson(
            json['XssMatchStatement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StatementToJson(Statement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AndStatement', instance.andStatement?.toJson());
  writeNotNull('ByteMatchStatement', instance.byteMatchStatement?.toJson());
  writeNotNull('GeoMatchStatement', instance.geoMatchStatement?.toJson());
  writeNotNull(
      'IPSetReferenceStatement', instance.iPSetReferenceStatement?.toJson());
  writeNotNull('ManagedRuleGroupStatement',
      instance.managedRuleGroupStatement?.toJson());
  writeNotNull('NotStatement', instance.notStatement?.toJson());
  writeNotNull('OrStatement', instance.orStatement?.toJson());
  writeNotNull('RateBasedStatement', instance.rateBasedStatement?.toJson());
  writeNotNull('RegexPatternSetReferenceStatement',
      instance.regexPatternSetReferenceStatement?.toJson());
  writeNotNull('RuleGroupReferenceStatement',
      instance.ruleGroupReferenceStatement?.toJson());
  writeNotNull(
      'SizeConstraintStatement', instance.sizeConstraintStatement?.toJson());
  writeNotNull('SqliMatchStatement', instance.sqliMatchStatement?.toJson());
  writeNotNull('XssMatchStatement', instance.xssMatchStatement?.toJson());
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

TagInfoForResource _$TagInfoForResourceFromJson(Map<String, dynamic> json) {
  return TagInfoForResource(
    resourceARN: json['ResourceARN'] as String,
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TextTransformation _$TextTransformationFromJson(Map<String, dynamic> json) {
  return TextTransformation(
    priority: json['Priority'] as int,
    type: _$enumDecodeNullable(_$TextTransformationTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$TextTransformationToJson(TextTransformation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Priority', instance.priority);
  writeNotNull('Type', _$TextTransformationTypeEnumMap[instance.type]);
  return val;
}

const _$TextTransformationTypeEnumMap = {
  TextTransformationType.none: 'NONE',
  TextTransformationType.compressWhiteSpace: 'COMPRESS_WHITE_SPACE',
  TextTransformationType.htmlEntityDecode: 'HTML_ENTITY_DECODE',
  TextTransformationType.lowercase: 'LOWERCASE',
  TextTransformationType.cmdLine: 'CMD_LINE',
  TextTransformationType.urlDecode: 'URL_DECODE',
};

TimeWindow _$TimeWindowFromJson(Map<String, dynamic> json) {
  return TimeWindow(
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
  );
}

Map<String, dynamic> _$TimeWindowToJson(TimeWindow instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EndTime', const UnixDateTimeConverter().toJson(instance.endTime));
  writeNotNull(
      'StartTime', const UnixDateTimeConverter().toJson(instance.startTime));
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateIPSetResponse _$UpdateIPSetResponseFromJson(Map<String, dynamic> json) {
  return UpdateIPSetResponse(
    nextLockToken: json['NextLockToken'] as String,
  );
}

UpdateRegexPatternSetResponse _$UpdateRegexPatternSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRegexPatternSetResponse(
    nextLockToken: json['NextLockToken'] as String,
  );
}

UpdateRuleGroupResponse _$UpdateRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRuleGroupResponse(
    nextLockToken: json['NextLockToken'] as String,
  );
}

UpdateWebACLResponse _$UpdateWebACLResponseFromJson(Map<String, dynamic> json) {
  return UpdateWebACLResponse(
    nextLockToken: json['NextLockToken'] as String,
  );
}

UriPath _$UriPathFromJson(Map<String, dynamic> json) {
  return UriPath();
}

Map<String, dynamic> _$UriPathToJson(UriPath instance) => <String, dynamic>{};

VisibilityConfig _$VisibilityConfigFromJson(Map<String, dynamic> json) {
  return VisibilityConfig(
    cloudWatchMetricsEnabled: json['CloudWatchMetricsEnabled'] as bool,
    metricName: json['MetricName'] as String,
    sampledRequestsEnabled: json['SampledRequestsEnabled'] as bool,
  );
}

Map<String, dynamic> _$VisibilityConfigToJson(VisibilityConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudWatchMetricsEnabled', instance.cloudWatchMetricsEnabled);
  writeNotNull('MetricName', instance.metricName);
  writeNotNull('SampledRequestsEnabled', instance.sampledRequestsEnabled);
  return val;
}

WebACL _$WebACLFromJson(Map<String, dynamic> json) {
  return WebACL(
    arn: json['ARN'] as String,
    defaultAction: json['DefaultAction'] == null
        ? null
        : DefaultAction.fromJson(json['DefaultAction'] as Map<String, dynamic>),
    id: json['Id'] as String,
    name: json['Name'] as String,
    visibilityConfig: json['VisibilityConfig'] == null
        ? null
        : VisibilityConfig.fromJson(
            json['VisibilityConfig'] as Map<String, dynamic>),
    capacity: json['Capacity'] as int,
    description: json['Description'] as String,
    managedByFirewallManager: json['ManagedByFirewallManager'] as bool,
    postProcessFirewallManagerRuleGroups:
        (json['PostProcessFirewallManagerRuleGroups'] as List)
            ?.map((e) => e == null
                ? null
                : FirewallManagerRuleGroup.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    preProcessFirewallManagerRuleGroups:
        (json['PreProcessFirewallManagerRuleGroups'] as List)
            ?.map((e) => e == null
                ? null
                : FirewallManagerRuleGroup.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    rules: (json['Rules'] as List)
        ?.map(
            (e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

WebACLSummary _$WebACLSummaryFromJson(Map<String, dynamic> json) {
  return WebACLSummary(
    arn: json['ARN'] as String,
    description: json['Description'] as String,
    id: json['Id'] as String,
    lockToken: json['LockToken'] as String,
    name: json['Name'] as String,
  );
}

XssMatchStatement _$XssMatchStatementFromJson(Map<String, dynamic> json) {
  return XssMatchStatement(
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    textTransformations: (json['TextTransformations'] as List)
        ?.map((e) => e == null
            ? null
            : TextTransformation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$XssMatchStatementToJson(XssMatchStatement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('TextTransformations',
      instance.textTransformations?.map((e) => e?.toJson())?.toList());
  return val;
}
