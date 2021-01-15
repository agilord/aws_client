// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-11-28.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivatedRule _$ActivatedRuleFromJson(Map<String, dynamic> json) {
  return ActivatedRule(
    priority: json['Priority'] as int,
    ruleId: json['RuleId'] as String,
    action: json['Action'] == null
        ? null
        : WafAction.fromJson(json['Action'] as Map<String, dynamic>),
    excludedRules: (json['ExcludedRules'] as List)
        ?.map((e) =>
            e == null ? null : ExcludedRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    overrideAction: json['OverrideAction'] == null
        ? null
        : WafOverrideAction.fromJson(
            json['OverrideAction'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$WafRuleTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$ActivatedRuleToJson(ActivatedRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Priority', instance.priority);
  writeNotNull('RuleId', instance.ruleId);
  writeNotNull('Action', instance.action?.toJson());
  writeNotNull('ExcludedRules',
      instance.excludedRules?.map((e) => e?.toJson())?.toList());
  writeNotNull('OverrideAction', instance.overrideAction?.toJson());
  writeNotNull('Type', _$WafRuleTypeEnumMap[instance.type]);
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

const _$WafRuleTypeEnumMap = {
  WafRuleType.regular: 'REGULAR',
  WafRuleType.rateBased: 'RATE_BASED',
  WafRuleType.group: 'GROUP',
};

AssociateWebACLResponse _$AssociateWebACLResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateWebACLResponse();
}

ByteMatchSet _$ByteMatchSetFromJson(Map<String, dynamic> json) {
  return ByteMatchSet(
    byteMatchSetId: json['ByteMatchSetId'] as String,
    byteMatchTuples: (json['ByteMatchTuples'] as List)
        ?.map((e) => e == null
            ? null
            : ByteMatchTuple.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
  );
}

ByteMatchSetSummary _$ByteMatchSetSummaryFromJson(Map<String, dynamic> json) {
  return ByteMatchSetSummary(
    byteMatchSetId: json['ByteMatchSetId'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$ByteMatchSetUpdateToJson(ByteMatchSetUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ChangeActionEnumMap[instance.action]);
  writeNotNull('ByteMatchTuple', instance.byteMatchTuple?.toJson());
  return val;
}

const _$ChangeActionEnumMap = {
  ChangeAction.insert: 'INSERT',
  ChangeAction.delete: 'DELETE',
};

ByteMatchTuple _$ByteMatchTupleFromJson(Map<String, dynamic> json) {
  return ByteMatchTuple(
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    positionalConstraint: _$enumDecodeNullable(
        _$PositionalConstraintEnumMap, json['PositionalConstraint']),
    targetString:
        const Uint8ListConverter().fromJson(json['TargetString'] as String),
    textTransformation: _$enumDecodeNullable(
        _$TextTransformationEnumMap, json['TextTransformation']),
  );
}

Map<String, dynamic> _$ByteMatchTupleToJson(ByteMatchTuple instance) {
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
      'TargetString', const Uint8ListConverter().toJson(instance.targetString));
  writeNotNull('TextTransformation',
      _$TextTransformationEnumMap[instance.textTransformation]);
  return val;
}

const _$PositionalConstraintEnumMap = {
  PositionalConstraint.exactly: 'EXACTLY',
  PositionalConstraint.startsWith: 'STARTS_WITH',
  PositionalConstraint.endsWith: 'ENDS_WITH',
  PositionalConstraint.contains: 'CONTAINS',
  PositionalConstraint.containsWord: 'CONTAINS_WORD',
};

const _$TextTransformationEnumMap = {
  TextTransformation.none: 'NONE',
  TextTransformation.compressWhiteSpace: 'COMPRESS_WHITE_SPACE',
  TextTransformation.htmlEntityDecode: 'HTML_ENTITY_DECODE',
  TextTransformation.lowercase: 'LOWERCASE',
  TextTransformation.cmdLine: 'CMD_LINE',
  TextTransformation.urlDecode: 'URL_DECODE',
};

CreateByteMatchSetResponse _$CreateByteMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateByteMatchSetResponse(
    byteMatchSet: json['ByteMatchSet'] == null
        ? null
        : ByteMatchSet.fromJson(json['ByteMatchSet'] as Map<String, dynamic>),
    changeToken: json['ChangeToken'] as String,
  );
}

CreateGeoMatchSetResponse _$CreateGeoMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateGeoMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
    geoMatchSet: json['GeoMatchSet'] == null
        ? null
        : GeoMatchSet.fromJson(json['GeoMatchSet'] as Map<String, dynamic>),
  );
}

CreateIPSetResponse _$CreateIPSetResponseFromJson(Map<String, dynamic> json) {
  return CreateIPSetResponse(
    changeToken: json['ChangeToken'] as String,
    iPSet: json['IPSet'] == null
        ? null
        : IPSet.fromJson(json['IPSet'] as Map<String, dynamic>),
  );
}

CreateRateBasedRuleResponse _$CreateRateBasedRuleResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRateBasedRuleResponse(
    changeToken: json['ChangeToken'] as String,
    rule: json['Rule'] == null
        ? null
        : RateBasedRule.fromJson(json['Rule'] as Map<String, dynamic>),
  );
}

CreateRegexMatchSetResponse _$CreateRegexMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRegexMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
    regexMatchSet: json['RegexMatchSet'] == null
        ? null
        : RegexMatchSet.fromJson(json['RegexMatchSet'] as Map<String, dynamic>),
  );
}

CreateRegexPatternSetResponse _$CreateRegexPatternSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRegexPatternSetResponse(
    changeToken: json['ChangeToken'] as String,
    regexPatternSet: json['RegexPatternSet'] == null
        ? null
        : RegexPatternSet.fromJson(
            json['RegexPatternSet'] as Map<String, dynamic>),
  );
}

CreateRuleGroupResponse _$CreateRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRuleGroupResponse(
    changeToken: json['ChangeToken'] as String,
    ruleGroup: json['RuleGroup'] == null
        ? null
        : RuleGroup.fromJson(json['RuleGroup'] as Map<String, dynamic>),
  );
}

CreateRuleResponse _$CreateRuleResponseFromJson(Map<String, dynamic> json) {
  return CreateRuleResponse(
    changeToken: json['ChangeToken'] as String,
    rule: json['Rule'] == null
        ? null
        : Rule.fromJson(json['Rule'] as Map<String, dynamic>),
  );
}

CreateSizeConstraintSetResponse _$CreateSizeConstraintSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSizeConstraintSetResponse(
    changeToken: json['ChangeToken'] as String,
    sizeConstraintSet: json['SizeConstraintSet'] == null
        ? null
        : SizeConstraintSet.fromJson(
            json['SizeConstraintSet'] as Map<String, dynamic>),
  );
}

CreateSqlInjectionMatchSetResponse _$CreateSqlInjectionMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSqlInjectionMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
    sqlInjectionMatchSet: json['SqlInjectionMatchSet'] == null
        ? null
        : SqlInjectionMatchSet.fromJson(
            json['SqlInjectionMatchSet'] as Map<String, dynamic>),
  );
}

CreateWebACLMigrationStackResponse _$CreateWebACLMigrationStackResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWebACLMigrationStackResponse(
    s3ObjectUrl: json['S3ObjectUrl'] as String,
  );
}

CreateWebACLResponse _$CreateWebACLResponseFromJson(Map<String, dynamic> json) {
  return CreateWebACLResponse(
    changeToken: json['ChangeToken'] as String,
    webACL: json['WebACL'] == null
        ? null
        : WebACL.fromJson(json['WebACL'] as Map<String, dynamic>),
  );
}

CreateXssMatchSetResponse _$CreateXssMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateXssMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
    xssMatchSet: json['XssMatchSet'] == null
        ? null
        : XssMatchSet.fromJson(json['XssMatchSet'] as Map<String, dynamic>),
  );
}

DeleteByteMatchSetResponse _$DeleteByteMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteByteMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

DeleteGeoMatchSetResponse _$DeleteGeoMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteGeoMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

DeleteIPSetResponse _$DeleteIPSetResponseFromJson(Map<String, dynamic> json) {
  return DeleteIPSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

DeleteLoggingConfigurationResponse _$DeleteLoggingConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteLoggingConfigurationResponse();
}

DeletePermissionPolicyResponse _$DeletePermissionPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePermissionPolicyResponse();
}

DeleteRateBasedRuleResponse _$DeleteRateBasedRuleResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRateBasedRuleResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

DeleteRegexMatchSetResponse _$DeleteRegexMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRegexMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

DeleteRegexPatternSetResponse _$DeleteRegexPatternSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRegexPatternSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

DeleteRuleGroupResponse _$DeleteRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRuleGroupResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

DeleteRuleResponse _$DeleteRuleResponseFromJson(Map<String, dynamic> json) {
  return DeleteRuleResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

DeleteSizeConstraintSetResponse _$DeleteSizeConstraintSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSizeConstraintSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

DeleteSqlInjectionMatchSetResponse _$DeleteSqlInjectionMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSqlInjectionMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

DeleteWebACLResponse _$DeleteWebACLResponseFromJson(Map<String, dynamic> json) {
  return DeleteWebACLResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

DeleteXssMatchSetResponse _$DeleteXssMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteXssMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

DisassociateWebACLResponse _$DisassociateWebACLResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateWebACLResponse();
}

ExcludedRule _$ExcludedRuleFromJson(Map<String, dynamic> json) {
  return ExcludedRule(
    ruleId: json['RuleId'] as String,
  );
}

Map<String, dynamic> _$ExcludedRuleToJson(ExcludedRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RuleId', instance.ruleId);
  return val;
}

FieldToMatch _$FieldToMatchFromJson(Map<String, dynamic> json) {
  return FieldToMatch(
    type: _$enumDecodeNullable(_$MatchFieldTypeEnumMap, json['Type']),
    data: json['Data'] as String,
  );
}

Map<String, dynamic> _$FieldToMatchToJson(FieldToMatch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$MatchFieldTypeEnumMap[instance.type]);
  writeNotNull('Data', instance.data);
  return val;
}

const _$MatchFieldTypeEnumMap = {
  MatchFieldType.uri: 'URI',
  MatchFieldType.queryString: 'QUERY_STRING',
  MatchFieldType.header: 'HEADER',
  MatchFieldType.method: 'METHOD',
  MatchFieldType.body: 'BODY',
  MatchFieldType.singleQueryArg: 'SINGLE_QUERY_ARG',
  MatchFieldType.allQueryArgs: 'ALL_QUERY_ARGS',
};

GeoMatchConstraint _$GeoMatchConstraintFromJson(Map<String, dynamic> json) {
  return GeoMatchConstraint(
    type: _$enumDecodeNullable(_$GeoMatchConstraintTypeEnumMap, json['Type']),
    value:
        _$enumDecodeNullable(_$GeoMatchConstraintValueEnumMap, json['Value']),
  );
}

Map<String, dynamic> _$GeoMatchConstraintToJson(GeoMatchConstraint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$GeoMatchConstraintTypeEnumMap[instance.type]);
  writeNotNull('Value', _$GeoMatchConstraintValueEnumMap[instance.value]);
  return val;
}

const _$GeoMatchConstraintTypeEnumMap = {
  GeoMatchConstraintType.country: 'Country',
};

const _$GeoMatchConstraintValueEnumMap = {
  GeoMatchConstraintValue.af: 'AF',
  GeoMatchConstraintValue.ax: 'AX',
  GeoMatchConstraintValue.al: 'AL',
  GeoMatchConstraintValue.dz: 'DZ',
  GeoMatchConstraintValue.as: 'AS',
  GeoMatchConstraintValue.ad: 'AD',
  GeoMatchConstraintValue.ao: 'AO',
  GeoMatchConstraintValue.ai: 'AI',
  GeoMatchConstraintValue.aq: 'AQ',
  GeoMatchConstraintValue.ag: 'AG',
  GeoMatchConstraintValue.ar: 'AR',
  GeoMatchConstraintValue.am: 'AM',
  GeoMatchConstraintValue.aw: 'AW',
  GeoMatchConstraintValue.au: 'AU',
  GeoMatchConstraintValue.at: 'AT',
  GeoMatchConstraintValue.az: 'AZ',
  GeoMatchConstraintValue.bs: 'BS',
  GeoMatchConstraintValue.bh: 'BH',
  GeoMatchConstraintValue.bd: 'BD',
  GeoMatchConstraintValue.bb: 'BB',
  GeoMatchConstraintValue.by: 'BY',
  GeoMatchConstraintValue.be: 'BE',
  GeoMatchConstraintValue.bz: 'BZ',
  GeoMatchConstraintValue.bj: 'BJ',
  GeoMatchConstraintValue.bm: 'BM',
  GeoMatchConstraintValue.bt: 'BT',
  GeoMatchConstraintValue.bo: 'BO',
  GeoMatchConstraintValue.bq: 'BQ',
  GeoMatchConstraintValue.ba: 'BA',
  GeoMatchConstraintValue.bw: 'BW',
  GeoMatchConstraintValue.bv: 'BV',
  GeoMatchConstraintValue.br: 'BR',
  GeoMatchConstraintValue.io: 'IO',
  GeoMatchConstraintValue.bn: 'BN',
  GeoMatchConstraintValue.bg: 'BG',
  GeoMatchConstraintValue.bf: 'BF',
  GeoMatchConstraintValue.bi: 'BI',
  GeoMatchConstraintValue.kh: 'KH',
  GeoMatchConstraintValue.cm: 'CM',
  GeoMatchConstraintValue.ca: 'CA',
  GeoMatchConstraintValue.cv: 'CV',
  GeoMatchConstraintValue.ky: 'KY',
  GeoMatchConstraintValue.cf: 'CF',
  GeoMatchConstraintValue.td: 'TD',
  GeoMatchConstraintValue.cl: 'CL',
  GeoMatchConstraintValue.cn: 'CN',
  GeoMatchConstraintValue.cx: 'CX',
  GeoMatchConstraintValue.cc: 'CC',
  GeoMatchConstraintValue.co: 'CO',
  GeoMatchConstraintValue.km: 'KM',
  GeoMatchConstraintValue.cg: 'CG',
  GeoMatchConstraintValue.cd: 'CD',
  GeoMatchConstraintValue.ck: 'CK',
  GeoMatchConstraintValue.cr: 'CR',
  GeoMatchConstraintValue.ci: 'CI',
  GeoMatchConstraintValue.hr: 'HR',
  GeoMatchConstraintValue.cu: 'CU',
  GeoMatchConstraintValue.cw: 'CW',
  GeoMatchConstraintValue.cy: 'CY',
  GeoMatchConstraintValue.cz: 'CZ',
  GeoMatchConstraintValue.dk: 'DK',
  GeoMatchConstraintValue.dj: 'DJ',
  GeoMatchConstraintValue.dm: 'DM',
  GeoMatchConstraintValue.$do: 'DO',
  GeoMatchConstraintValue.ec: 'EC',
  GeoMatchConstraintValue.eg: 'EG',
  GeoMatchConstraintValue.sv: 'SV',
  GeoMatchConstraintValue.gq: 'GQ',
  GeoMatchConstraintValue.er: 'ER',
  GeoMatchConstraintValue.ee: 'EE',
  GeoMatchConstraintValue.et: 'ET',
  GeoMatchConstraintValue.fk: 'FK',
  GeoMatchConstraintValue.fo: 'FO',
  GeoMatchConstraintValue.fj: 'FJ',
  GeoMatchConstraintValue.fi: 'FI',
  GeoMatchConstraintValue.fr: 'FR',
  GeoMatchConstraintValue.gf: 'GF',
  GeoMatchConstraintValue.pf: 'PF',
  GeoMatchConstraintValue.tf: 'TF',
  GeoMatchConstraintValue.ga: 'GA',
  GeoMatchConstraintValue.gm: 'GM',
  GeoMatchConstraintValue.ge: 'GE',
  GeoMatchConstraintValue.de: 'DE',
  GeoMatchConstraintValue.gh: 'GH',
  GeoMatchConstraintValue.gi: 'GI',
  GeoMatchConstraintValue.gr: 'GR',
  GeoMatchConstraintValue.gl: 'GL',
  GeoMatchConstraintValue.gd: 'GD',
  GeoMatchConstraintValue.gp: 'GP',
  GeoMatchConstraintValue.gu: 'GU',
  GeoMatchConstraintValue.gt: 'GT',
  GeoMatchConstraintValue.gg: 'GG',
  GeoMatchConstraintValue.gn: 'GN',
  GeoMatchConstraintValue.gw: 'GW',
  GeoMatchConstraintValue.gy: 'GY',
  GeoMatchConstraintValue.ht: 'HT',
  GeoMatchConstraintValue.hm: 'HM',
  GeoMatchConstraintValue.va: 'VA',
  GeoMatchConstraintValue.hn: 'HN',
  GeoMatchConstraintValue.hk: 'HK',
  GeoMatchConstraintValue.hu: 'HU',
  GeoMatchConstraintValue.$is: 'IS',
  GeoMatchConstraintValue.$in: 'IN',
  GeoMatchConstraintValue.id: 'ID',
  GeoMatchConstraintValue.ir: 'IR',
  GeoMatchConstraintValue.iq: 'IQ',
  GeoMatchConstraintValue.ie: 'IE',
  GeoMatchConstraintValue.im: 'IM',
  GeoMatchConstraintValue.il: 'IL',
  GeoMatchConstraintValue.it: 'IT',
  GeoMatchConstraintValue.jm: 'JM',
  GeoMatchConstraintValue.jp: 'JP',
  GeoMatchConstraintValue.je: 'JE',
  GeoMatchConstraintValue.jo: 'JO',
  GeoMatchConstraintValue.kz: 'KZ',
  GeoMatchConstraintValue.ke: 'KE',
  GeoMatchConstraintValue.ki: 'KI',
  GeoMatchConstraintValue.kp: 'KP',
  GeoMatchConstraintValue.kr: 'KR',
  GeoMatchConstraintValue.kw: 'KW',
  GeoMatchConstraintValue.kg: 'KG',
  GeoMatchConstraintValue.la: 'LA',
  GeoMatchConstraintValue.lv: 'LV',
  GeoMatchConstraintValue.lb: 'LB',
  GeoMatchConstraintValue.ls: 'LS',
  GeoMatchConstraintValue.lr: 'LR',
  GeoMatchConstraintValue.ly: 'LY',
  GeoMatchConstraintValue.li: 'LI',
  GeoMatchConstraintValue.lt: 'LT',
  GeoMatchConstraintValue.lu: 'LU',
  GeoMatchConstraintValue.mo: 'MO',
  GeoMatchConstraintValue.mk: 'MK',
  GeoMatchConstraintValue.mg: 'MG',
  GeoMatchConstraintValue.mw: 'MW',
  GeoMatchConstraintValue.my: 'MY',
  GeoMatchConstraintValue.mv: 'MV',
  GeoMatchConstraintValue.ml: 'ML',
  GeoMatchConstraintValue.mt: 'MT',
  GeoMatchConstraintValue.mh: 'MH',
  GeoMatchConstraintValue.mq: 'MQ',
  GeoMatchConstraintValue.mr: 'MR',
  GeoMatchConstraintValue.mu: 'MU',
  GeoMatchConstraintValue.yt: 'YT',
  GeoMatchConstraintValue.mx: 'MX',
  GeoMatchConstraintValue.fm: 'FM',
  GeoMatchConstraintValue.md: 'MD',
  GeoMatchConstraintValue.mc: 'MC',
  GeoMatchConstraintValue.mn: 'MN',
  GeoMatchConstraintValue.me: 'ME',
  GeoMatchConstraintValue.ms: 'MS',
  GeoMatchConstraintValue.ma: 'MA',
  GeoMatchConstraintValue.mz: 'MZ',
  GeoMatchConstraintValue.mm: 'MM',
  GeoMatchConstraintValue.na: 'NA',
  GeoMatchConstraintValue.nr: 'NR',
  GeoMatchConstraintValue.np: 'NP',
  GeoMatchConstraintValue.nl: 'NL',
  GeoMatchConstraintValue.nc: 'NC',
  GeoMatchConstraintValue.nz: 'NZ',
  GeoMatchConstraintValue.ni: 'NI',
  GeoMatchConstraintValue.ne: 'NE',
  GeoMatchConstraintValue.ng: 'NG',
  GeoMatchConstraintValue.nu: 'NU',
  GeoMatchConstraintValue.nf: 'NF',
  GeoMatchConstraintValue.mp: 'MP',
  GeoMatchConstraintValue.no: 'NO',
  GeoMatchConstraintValue.om: 'OM',
  GeoMatchConstraintValue.pk: 'PK',
  GeoMatchConstraintValue.pw: 'PW',
  GeoMatchConstraintValue.ps: 'PS',
  GeoMatchConstraintValue.pa: 'PA',
  GeoMatchConstraintValue.pg: 'PG',
  GeoMatchConstraintValue.py: 'PY',
  GeoMatchConstraintValue.pe: 'PE',
  GeoMatchConstraintValue.ph: 'PH',
  GeoMatchConstraintValue.pn: 'PN',
  GeoMatchConstraintValue.pl: 'PL',
  GeoMatchConstraintValue.pt: 'PT',
  GeoMatchConstraintValue.pr: 'PR',
  GeoMatchConstraintValue.qa: 'QA',
  GeoMatchConstraintValue.re: 'RE',
  GeoMatchConstraintValue.ro: 'RO',
  GeoMatchConstraintValue.ru: 'RU',
  GeoMatchConstraintValue.rw: 'RW',
  GeoMatchConstraintValue.bl: 'BL',
  GeoMatchConstraintValue.sh: 'SH',
  GeoMatchConstraintValue.kn: 'KN',
  GeoMatchConstraintValue.lc: 'LC',
  GeoMatchConstraintValue.mf: 'MF',
  GeoMatchConstraintValue.pm: 'PM',
  GeoMatchConstraintValue.vc: 'VC',
  GeoMatchConstraintValue.ws: 'WS',
  GeoMatchConstraintValue.sm: 'SM',
  GeoMatchConstraintValue.st: 'ST',
  GeoMatchConstraintValue.sa: 'SA',
  GeoMatchConstraintValue.sn: 'SN',
  GeoMatchConstraintValue.rs: 'RS',
  GeoMatchConstraintValue.sc: 'SC',
  GeoMatchConstraintValue.sl: 'SL',
  GeoMatchConstraintValue.sg: 'SG',
  GeoMatchConstraintValue.sx: 'SX',
  GeoMatchConstraintValue.sk: 'SK',
  GeoMatchConstraintValue.si: 'SI',
  GeoMatchConstraintValue.sb: 'SB',
  GeoMatchConstraintValue.so: 'SO',
  GeoMatchConstraintValue.za: 'ZA',
  GeoMatchConstraintValue.gs: 'GS',
  GeoMatchConstraintValue.ss: 'SS',
  GeoMatchConstraintValue.es: 'ES',
  GeoMatchConstraintValue.lk: 'LK',
  GeoMatchConstraintValue.sd: 'SD',
  GeoMatchConstraintValue.sr: 'SR',
  GeoMatchConstraintValue.sj: 'SJ',
  GeoMatchConstraintValue.sz: 'SZ',
  GeoMatchConstraintValue.se: 'SE',
  GeoMatchConstraintValue.ch: 'CH',
  GeoMatchConstraintValue.sy: 'SY',
  GeoMatchConstraintValue.tw: 'TW',
  GeoMatchConstraintValue.tj: 'TJ',
  GeoMatchConstraintValue.tz: 'TZ',
  GeoMatchConstraintValue.th: 'TH',
  GeoMatchConstraintValue.tl: 'TL',
  GeoMatchConstraintValue.tg: 'TG',
  GeoMatchConstraintValue.tk: 'TK',
  GeoMatchConstraintValue.to: 'TO',
  GeoMatchConstraintValue.tt: 'TT',
  GeoMatchConstraintValue.tn: 'TN',
  GeoMatchConstraintValue.tr: 'TR',
  GeoMatchConstraintValue.tm: 'TM',
  GeoMatchConstraintValue.tc: 'TC',
  GeoMatchConstraintValue.tv: 'TV',
  GeoMatchConstraintValue.ug: 'UG',
  GeoMatchConstraintValue.ua: 'UA',
  GeoMatchConstraintValue.ae: 'AE',
  GeoMatchConstraintValue.gb: 'GB',
  GeoMatchConstraintValue.us: 'US',
  GeoMatchConstraintValue.um: 'UM',
  GeoMatchConstraintValue.uy: 'UY',
  GeoMatchConstraintValue.uz: 'UZ',
  GeoMatchConstraintValue.vu: 'VU',
  GeoMatchConstraintValue.ve: 'VE',
  GeoMatchConstraintValue.vn: 'VN',
  GeoMatchConstraintValue.vg: 'VG',
  GeoMatchConstraintValue.vi: 'VI',
  GeoMatchConstraintValue.wf: 'WF',
  GeoMatchConstraintValue.eh: 'EH',
  GeoMatchConstraintValue.ye: 'YE',
  GeoMatchConstraintValue.zm: 'ZM',
  GeoMatchConstraintValue.zw: 'ZW',
};

GeoMatchSet _$GeoMatchSetFromJson(Map<String, dynamic> json) {
  return GeoMatchSet(
    geoMatchConstraints: (json['GeoMatchConstraints'] as List)
        ?.map((e) => e == null
            ? null
            : GeoMatchConstraint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    geoMatchSetId: json['GeoMatchSetId'] as String,
    name: json['Name'] as String,
  );
}

GeoMatchSetSummary _$GeoMatchSetSummaryFromJson(Map<String, dynamic> json) {
  return GeoMatchSetSummary(
    geoMatchSetId: json['GeoMatchSetId'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$GeoMatchSetUpdateToJson(GeoMatchSetUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ChangeActionEnumMap[instance.action]);
  writeNotNull('GeoMatchConstraint', instance.geoMatchConstraint?.toJson());
  return val;
}

GetByteMatchSetResponse _$GetByteMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return GetByteMatchSetResponse(
    byteMatchSet: json['ByteMatchSet'] == null
        ? null
        : ByteMatchSet.fromJson(json['ByteMatchSet'] as Map<String, dynamic>),
  );
}

GetChangeTokenResponse _$GetChangeTokenResponseFromJson(
    Map<String, dynamic> json) {
  return GetChangeTokenResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

GetChangeTokenStatusResponse _$GetChangeTokenStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetChangeTokenStatusResponse(
    changeTokenStatus: _$enumDecodeNullable(
        _$ChangeTokenStatusEnumMap, json['ChangeTokenStatus']),
  );
}

const _$ChangeTokenStatusEnumMap = {
  ChangeTokenStatus.provisioned: 'PROVISIONED',
  ChangeTokenStatus.pending: 'PENDING',
  ChangeTokenStatus.insync: 'INSYNC',
};

GetGeoMatchSetResponse _$GetGeoMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return GetGeoMatchSetResponse(
    geoMatchSet: json['GeoMatchSet'] == null
        ? null
        : GeoMatchSet.fromJson(json['GeoMatchSet'] as Map<String, dynamic>),
  );
}

GetIPSetResponse _$GetIPSetResponseFromJson(Map<String, dynamic> json) {
  return GetIPSetResponse(
    iPSet: json['IPSet'] == null
        ? null
        : IPSet.fromJson(json['IPSet'] as Map<String, dynamic>),
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

GetRateBasedRuleManagedKeysResponse
    _$GetRateBasedRuleManagedKeysResponseFromJson(Map<String, dynamic> json) {
  return GetRateBasedRuleManagedKeysResponse(
    managedKeys:
        (json['ManagedKeys'] as List)?.map((e) => e as String)?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

GetRateBasedRuleResponse _$GetRateBasedRuleResponseFromJson(
    Map<String, dynamic> json) {
  return GetRateBasedRuleResponse(
    rule: json['Rule'] == null
        ? null
        : RateBasedRule.fromJson(json['Rule'] as Map<String, dynamic>),
  );
}

GetRegexMatchSetResponse _$GetRegexMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return GetRegexMatchSetResponse(
    regexMatchSet: json['RegexMatchSet'] == null
        ? null
        : RegexMatchSet.fromJson(json['RegexMatchSet'] as Map<String, dynamic>),
  );
}

GetRegexPatternSetResponse _$GetRegexPatternSetResponseFromJson(
    Map<String, dynamic> json) {
  return GetRegexPatternSetResponse(
    regexPatternSet: json['RegexPatternSet'] == null
        ? null
        : RegexPatternSet.fromJson(
            json['RegexPatternSet'] as Map<String, dynamic>),
  );
}

GetRuleGroupResponse _$GetRuleGroupResponseFromJson(Map<String, dynamic> json) {
  return GetRuleGroupResponse(
    ruleGroup: json['RuleGroup'] == null
        ? null
        : RuleGroup.fromJson(json['RuleGroup'] as Map<String, dynamic>),
  );
}

GetRuleResponse _$GetRuleResponseFromJson(Map<String, dynamic> json) {
  return GetRuleResponse(
    rule: json['Rule'] == null
        ? null
        : Rule.fromJson(json['Rule'] as Map<String, dynamic>),
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

GetSizeConstraintSetResponse _$GetSizeConstraintSetResponseFromJson(
    Map<String, dynamic> json) {
  return GetSizeConstraintSetResponse(
    sizeConstraintSet: json['SizeConstraintSet'] == null
        ? null
        : SizeConstraintSet.fromJson(
            json['SizeConstraintSet'] as Map<String, dynamic>),
  );
}

GetSqlInjectionMatchSetResponse _$GetSqlInjectionMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return GetSqlInjectionMatchSetResponse(
    sqlInjectionMatchSet: json['SqlInjectionMatchSet'] == null
        ? null
        : SqlInjectionMatchSet.fromJson(
            json['SqlInjectionMatchSet'] as Map<String, dynamic>),
  );
}

GetWebACLForResourceResponse _$GetWebACLForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return GetWebACLForResourceResponse(
    webACLSummary: json['WebACLSummary'] == null
        ? null
        : WebACLSummary.fromJson(json['WebACLSummary'] as Map<String, dynamic>),
  );
}

GetWebACLResponse _$GetWebACLResponseFromJson(Map<String, dynamic> json) {
  return GetWebACLResponse(
    webACL: json['WebACL'] == null
        ? null
        : WebACL.fromJson(json['WebACL'] as Map<String, dynamic>),
  );
}

GetXssMatchSetResponse _$GetXssMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return GetXssMatchSetResponse(
    xssMatchSet: json['XssMatchSet'] == null
        ? null
        : XssMatchSet.fromJson(json['XssMatchSet'] as Map<String, dynamic>),
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
    iPSetDescriptors: (json['IPSetDescriptors'] as List)
        ?.map((e) => e == null
            ? null
            : IPSetDescriptor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    iPSetId: json['IPSetId'] as String,
    name: json['Name'] as String,
  );
}

IPSetDescriptor _$IPSetDescriptorFromJson(Map<String, dynamic> json) {
  return IPSetDescriptor(
    type: _$enumDecodeNullable(_$IPSetDescriptorTypeEnumMap, json['Type']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$IPSetDescriptorToJson(IPSetDescriptor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$IPSetDescriptorTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$IPSetDescriptorTypeEnumMap = {
  IPSetDescriptorType.ipv4: 'IPV4',
  IPSetDescriptorType.ipv6: 'IPV6',
};

IPSetSummary _$IPSetSummaryFromJson(Map<String, dynamic> json) {
  return IPSetSummary(
    iPSetId: json['IPSetId'] as String,
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$IPSetUpdateToJson(IPSetUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ChangeActionEnumMap[instance.action]);
  writeNotNull('IPSetDescriptor', instance.iPSetDescriptor?.toJson());
  return val;
}

ListActivatedRulesInRuleGroupResponse
    _$ListActivatedRulesInRuleGroupResponseFromJson(Map<String, dynamic> json) {
  return ListActivatedRulesInRuleGroupResponse(
    activatedRules: (json['ActivatedRules'] as List)
        ?.map((e) => e == null
            ? null
            : ActivatedRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListByteMatchSetsResponse _$ListByteMatchSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListByteMatchSetsResponse(
    byteMatchSets: (json['ByteMatchSets'] as List)
        ?.map((e) => e == null
            ? null
            : ByteMatchSetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListGeoMatchSetsResponse _$ListGeoMatchSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListGeoMatchSetsResponse(
    geoMatchSets: (json['GeoMatchSets'] as List)
        ?.map((e) => e == null
            ? null
            : GeoMatchSetSummary.fromJson(e as Map<String, dynamic>))
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

ListRateBasedRulesResponse _$ListRateBasedRulesResponseFromJson(
    Map<String, dynamic> json) {
  return ListRateBasedRulesResponse(
    nextMarker: json['NextMarker'] as String,
    rules: (json['Rules'] as List)
        ?.map((e) =>
            e == null ? null : RuleSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRegexMatchSetsResponse _$ListRegexMatchSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRegexMatchSetsResponse(
    nextMarker: json['NextMarker'] as String,
    regexMatchSets: (json['RegexMatchSets'] as List)
        ?.map((e) => e == null
            ? null
            : RegexMatchSetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

ListRulesResponse _$ListRulesResponseFromJson(Map<String, dynamic> json) {
  return ListRulesResponse(
    nextMarker: json['NextMarker'] as String,
    rules: (json['Rules'] as List)
        ?.map((e) =>
            e == null ? null : RuleSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSizeConstraintSetsResponse _$ListSizeConstraintSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSizeConstraintSetsResponse(
    nextMarker: json['NextMarker'] as String,
    sizeConstraintSets: (json['SizeConstraintSets'] as List)
        ?.map((e) => e == null
            ? null
            : SizeConstraintSetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSqlInjectionMatchSetsResponse _$ListSqlInjectionMatchSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSqlInjectionMatchSetsResponse(
    nextMarker: json['NextMarker'] as String,
    sqlInjectionMatchSets: (json['SqlInjectionMatchSets'] as List)
        ?.map((e) => e == null
            ? null
            : SqlInjectionMatchSetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSubscribedRuleGroupsResponse _$ListSubscribedRuleGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSubscribedRuleGroupsResponse(
    nextMarker: json['NextMarker'] as String,
    ruleGroups: (json['RuleGroups'] as List)
        ?.map((e) => e == null
            ? null
            : SubscribedRuleGroupSummary.fromJson(e as Map<String, dynamic>))
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

ListXssMatchSetsResponse _$ListXssMatchSetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListXssMatchSetsResponse(
    nextMarker: json['NextMarker'] as String,
    xssMatchSets: (json['XssMatchSets'] as List)
        ?.map((e) => e == null
            ? null
            : XssMatchSetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LoggingConfiguration _$LoggingConfigurationFromJson(Map<String, dynamic> json) {
  return LoggingConfiguration(
    logDestinationConfigs: (json['LogDestinationConfigs'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    resourceArn: json['ResourceArn'] as String,
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
  writeNotNull('RedactedFields',
      instance.redactedFields?.map((e) => e?.toJson())?.toList());
  return val;
}

Predicate _$PredicateFromJson(Map<String, dynamic> json) {
  return Predicate(
    dataId: json['DataId'] as String,
    negated: json['Negated'] as bool,
    type: _$enumDecodeNullable(_$PredicateTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$PredicateToJson(Predicate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataId', instance.dataId);
  writeNotNull('Negated', instance.negated);
  writeNotNull('Type', _$PredicateTypeEnumMap[instance.type]);
  return val;
}

const _$PredicateTypeEnumMap = {
  PredicateType.iPMatch: 'IPMatch',
  PredicateType.byteMatch: 'ByteMatch',
  PredicateType.sqlInjectionMatch: 'SqlInjectionMatch',
  PredicateType.geoMatch: 'GeoMatch',
  PredicateType.sizeConstraint: 'SizeConstraint',
  PredicateType.xssMatch: 'XssMatch',
  PredicateType.regexMatch: 'RegexMatch',
};

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

RateBasedRule _$RateBasedRuleFromJson(Map<String, dynamic> json) {
  return RateBasedRule(
    matchPredicates: (json['MatchPredicates'] as List)
        ?.map((e) =>
            e == null ? null : Predicate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rateKey: _$enumDecodeNullable(_$RateKeyEnumMap, json['RateKey']),
    rateLimit: json['RateLimit'] as int,
    ruleId: json['RuleId'] as String,
    metricName: json['MetricName'] as String,
    name: json['Name'] as String,
  );
}

const _$RateKeyEnumMap = {
  RateKey.ip: 'IP',
};

RegexMatchSet _$RegexMatchSetFromJson(Map<String, dynamic> json) {
  return RegexMatchSet(
    name: json['Name'] as String,
    regexMatchSetId: json['RegexMatchSetId'] as String,
    regexMatchTuples: (json['RegexMatchTuples'] as List)
        ?.map((e) => e == null
            ? null
            : RegexMatchTuple.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RegexMatchSetSummary _$RegexMatchSetSummaryFromJson(Map<String, dynamic> json) {
  return RegexMatchSetSummary(
    name: json['Name'] as String,
    regexMatchSetId: json['RegexMatchSetId'] as String,
  );
}

Map<String, dynamic> _$RegexMatchSetUpdateToJson(RegexMatchSetUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ChangeActionEnumMap[instance.action]);
  writeNotNull('RegexMatchTuple', instance.regexMatchTuple?.toJson());
  return val;
}

RegexMatchTuple _$RegexMatchTupleFromJson(Map<String, dynamic> json) {
  return RegexMatchTuple(
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    regexPatternSetId: json['RegexPatternSetId'] as String,
    textTransformation: _$enumDecodeNullable(
        _$TextTransformationEnumMap, json['TextTransformation']),
  );
}

Map<String, dynamic> _$RegexMatchTupleToJson(RegexMatchTuple instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('RegexPatternSetId', instance.regexPatternSetId);
  writeNotNull('TextTransformation',
      _$TextTransformationEnumMap[instance.textTransformation]);
  return val;
}

RegexPatternSet _$RegexPatternSetFromJson(Map<String, dynamic> json) {
  return RegexPatternSet(
    regexPatternSetId: json['RegexPatternSetId'] as String,
    regexPatternStrings: (json['RegexPatternStrings'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    name: json['Name'] as String,
  );
}

RegexPatternSetSummary _$RegexPatternSetSummaryFromJson(
    Map<String, dynamic> json) {
  return RegexPatternSetSummary(
    name: json['Name'] as String,
    regexPatternSetId: json['RegexPatternSetId'] as String,
  );
}

Map<String, dynamic> _$RegexPatternSetUpdateToJson(
    RegexPatternSetUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ChangeActionEnumMap[instance.action]);
  writeNotNull('RegexPatternString', instance.regexPatternString);
  return val;
}

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return Rule(
    predicates: (json['Predicates'] as List)
        ?.map((e) =>
            e == null ? null : Predicate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ruleId: json['RuleId'] as String,
    metricName: json['MetricName'] as String,
    name: json['Name'] as String,
  );
}

RuleGroup _$RuleGroupFromJson(Map<String, dynamic> json) {
  return RuleGroup(
    ruleGroupId: json['RuleGroupId'] as String,
    metricName: json['MetricName'] as String,
    name: json['Name'] as String,
  );
}

RuleGroupSummary _$RuleGroupSummaryFromJson(Map<String, dynamic> json) {
  return RuleGroupSummary(
    name: json['Name'] as String,
    ruleGroupId: json['RuleGroupId'] as String,
  );
}

Map<String, dynamic> _$RuleGroupUpdateToJson(RuleGroupUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ChangeActionEnumMap[instance.action]);
  writeNotNull('ActivatedRule', instance.activatedRule?.toJson());
  return val;
}

RuleSummary _$RuleSummaryFromJson(Map<String, dynamic> json) {
  return RuleSummary(
    name: json['Name'] as String,
    ruleId: json['RuleId'] as String,
  );
}

Map<String, dynamic> _$RuleUpdateToJson(RuleUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ChangeActionEnumMap[instance.action]);
  writeNotNull('Predicate', instance.predicate?.toJson());
  return val;
}

SampledHTTPRequest _$SampledHTTPRequestFromJson(Map<String, dynamic> json) {
  return SampledHTTPRequest(
    request: json['Request'] == null
        ? null
        : HTTPRequest.fromJson(json['Request'] as Map<String, dynamic>),
    weight: json['Weight'] as int,
    action: json['Action'] as String,
    ruleWithinRuleGroup: json['RuleWithinRuleGroup'] as String,
    timestamp: const UnixDateTimeConverter().fromJson(json['Timestamp']),
  );
}

SizeConstraint _$SizeConstraintFromJson(Map<String, dynamic> json) {
  return SizeConstraint(
    comparisonOperator: _$enumDecodeNullable(
        _$ComparisonOperatorEnumMap, json['ComparisonOperator']),
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    size: json['Size'] as int,
    textTransformation: _$enumDecodeNullable(
        _$TextTransformationEnumMap, json['TextTransformation']),
  );
}

Map<String, dynamic> _$SizeConstraintToJson(SizeConstraint instance) {
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
  writeNotNull('TextTransformation',
      _$TextTransformationEnumMap[instance.textTransformation]);
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

SizeConstraintSet _$SizeConstraintSetFromJson(Map<String, dynamic> json) {
  return SizeConstraintSet(
    sizeConstraintSetId: json['SizeConstraintSetId'] as String,
    sizeConstraints: (json['SizeConstraints'] as List)
        ?.map((e) => e == null
            ? null
            : SizeConstraint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
  );
}

SizeConstraintSetSummary _$SizeConstraintSetSummaryFromJson(
    Map<String, dynamic> json) {
  return SizeConstraintSetSummary(
    name: json['Name'] as String,
    sizeConstraintSetId: json['SizeConstraintSetId'] as String,
  );
}

Map<String, dynamic> _$SizeConstraintSetUpdateToJson(
    SizeConstraintSetUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ChangeActionEnumMap[instance.action]);
  writeNotNull('SizeConstraint', instance.sizeConstraint?.toJson());
  return val;
}

SqlInjectionMatchSet _$SqlInjectionMatchSetFromJson(Map<String, dynamic> json) {
  return SqlInjectionMatchSet(
    sqlInjectionMatchSetId: json['SqlInjectionMatchSetId'] as String,
    sqlInjectionMatchTuples: (json['SqlInjectionMatchTuples'] as List)
        ?.map((e) => e == null
            ? null
            : SqlInjectionMatchTuple.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
  );
}

SqlInjectionMatchSetSummary _$SqlInjectionMatchSetSummaryFromJson(
    Map<String, dynamic> json) {
  return SqlInjectionMatchSetSummary(
    name: json['Name'] as String,
    sqlInjectionMatchSetId: json['SqlInjectionMatchSetId'] as String,
  );
}

Map<String, dynamic> _$SqlInjectionMatchSetUpdateToJson(
    SqlInjectionMatchSetUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ChangeActionEnumMap[instance.action]);
  writeNotNull(
      'SqlInjectionMatchTuple', instance.sqlInjectionMatchTuple?.toJson());
  return val;
}

SqlInjectionMatchTuple _$SqlInjectionMatchTupleFromJson(
    Map<String, dynamic> json) {
  return SqlInjectionMatchTuple(
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    textTransformation: _$enumDecodeNullable(
        _$TextTransformationEnumMap, json['TextTransformation']),
  );
}

Map<String, dynamic> _$SqlInjectionMatchTupleToJson(
    SqlInjectionMatchTuple instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('TextTransformation',
      _$TextTransformationEnumMap[instance.textTransformation]);
  return val;
}

SubscribedRuleGroupSummary _$SubscribedRuleGroupSummaryFromJson(
    Map<String, dynamic> json) {
  return SubscribedRuleGroupSummary(
    metricName: json['MetricName'] as String,
    name: json['Name'] as String,
    ruleGroupId: json['RuleGroupId'] as String,
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

UpdateByteMatchSetResponse _$UpdateByteMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateByteMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

UpdateGeoMatchSetResponse _$UpdateGeoMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateGeoMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

UpdateIPSetResponse _$UpdateIPSetResponseFromJson(Map<String, dynamic> json) {
  return UpdateIPSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

UpdateRateBasedRuleResponse _$UpdateRateBasedRuleResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRateBasedRuleResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

UpdateRegexMatchSetResponse _$UpdateRegexMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRegexMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

UpdateRegexPatternSetResponse _$UpdateRegexPatternSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRegexPatternSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

UpdateRuleGroupResponse _$UpdateRuleGroupResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRuleGroupResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

UpdateRuleResponse _$UpdateRuleResponseFromJson(Map<String, dynamic> json) {
  return UpdateRuleResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

UpdateSizeConstraintSetResponse _$UpdateSizeConstraintSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSizeConstraintSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

UpdateSqlInjectionMatchSetResponse _$UpdateSqlInjectionMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSqlInjectionMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

UpdateWebACLResponse _$UpdateWebACLResponseFromJson(Map<String, dynamic> json) {
  return UpdateWebACLResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

UpdateXssMatchSetResponse _$UpdateXssMatchSetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateXssMatchSetResponse(
    changeToken: json['ChangeToken'] as String,
  );
}

WafAction _$WafActionFromJson(Map<String, dynamic> json) {
  return WafAction(
    type: _$enumDecodeNullable(_$WafActionTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$WafActionToJson(WafAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$WafActionTypeEnumMap[instance.type]);
  return val;
}

const _$WafActionTypeEnumMap = {
  WafActionType.block: 'BLOCK',
  WafActionType.allow: 'ALLOW',
  WafActionType.count: 'COUNT',
};

WafOverrideAction _$WafOverrideActionFromJson(Map<String, dynamic> json) {
  return WafOverrideAction(
    type: _$enumDecodeNullable(_$WafOverrideActionTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$WafOverrideActionToJson(WafOverrideAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$WafOverrideActionTypeEnumMap[instance.type]);
  return val;
}

const _$WafOverrideActionTypeEnumMap = {
  WafOverrideActionType.none: 'NONE',
  WafOverrideActionType.count: 'COUNT',
};

WebACL _$WebACLFromJson(Map<String, dynamic> json) {
  return WebACL(
    defaultAction: json['DefaultAction'] == null
        ? null
        : WafAction.fromJson(json['DefaultAction'] as Map<String, dynamic>),
    rules: (json['Rules'] as List)
        ?.map((e) => e == null
            ? null
            : ActivatedRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    webACLId: json['WebACLId'] as String,
    metricName: json['MetricName'] as String,
    name: json['Name'] as String,
    webACLArn: json['WebACLArn'] as String,
  );
}

WebACLSummary _$WebACLSummaryFromJson(Map<String, dynamic> json) {
  return WebACLSummary(
    name: json['Name'] as String,
    webACLId: json['WebACLId'] as String,
  );
}

Map<String, dynamic> _$WebACLUpdateToJson(WebACLUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ChangeActionEnumMap[instance.action]);
  writeNotNull('ActivatedRule', instance.activatedRule?.toJson());
  return val;
}

XssMatchSet _$XssMatchSetFromJson(Map<String, dynamic> json) {
  return XssMatchSet(
    xssMatchSetId: json['XssMatchSetId'] as String,
    xssMatchTuples: (json['XssMatchTuples'] as List)
        ?.map((e) => e == null
            ? null
            : XssMatchTuple.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
  );
}

XssMatchSetSummary _$XssMatchSetSummaryFromJson(Map<String, dynamic> json) {
  return XssMatchSetSummary(
    name: json['Name'] as String,
    xssMatchSetId: json['XssMatchSetId'] as String,
  );
}

Map<String, dynamic> _$XssMatchSetUpdateToJson(XssMatchSetUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', _$ChangeActionEnumMap[instance.action]);
  writeNotNull('XssMatchTuple', instance.xssMatchTuple?.toJson());
  return val;
}

XssMatchTuple _$XssMatchTupleFromJson(Map<String, dynamic> json) {
  return XssMatchTuple(
    fieldToMatch: json['FieldToMatch'] == null
        ? null
        : FieldToMatch.fromJson(json['FieldToMatch'] as Map<String, dynamic>),
    textTransformation: _$enumDecodeNullable(
        _$TextTransformationEnumMap, json['TextTransformation']),
  );
}

Map<String, dynamic> _$XssMatchTupleToJson(XssMatchTuple instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FieldToMatch', instance.fieldToMatch?.toJson());
  writeNotNull('TextTransformation',
      _$TextTransformationEnumMap[instance.textTransformation]);
  return val;
}
