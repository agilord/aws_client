// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2013-01-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AnalysisOptionsToJson(AnalysisOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlgorithmicStemming',
      _$AlgorithmicStemmingEnumMap[instance.algorithmicStemming]);
  writeNotNull('JapaneseTokenizationDictionary',
      instance.japaneseTokenizationDictionary);
  writeNotNull('StemmingDictionary', instance.stemmingDictionary);
  writeNotNull('Stopwords', instance.stopwords);
  writeNotNull('Synonyms', instance.synonyms);
  return val;
}

const _$AlgorithmicStemmingEnumMap = {
  AlgorithmicStemming.none: 'none',
  AlgorithmicStemming.minimal: 'minimal',
  AlgorithmicStemming.light: 'light',
  AlgorithmicStemming.full: 'full',
};

Map<String, dynamic> _$AnalysisSchemeToJson(AnalysisScheme instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AnalysisSchemeLanguage',
      _$AnalysisSchemeLanguageEnumMap[instance.analysisSchemeLanguage]);
  writeNotNull('AnalysisSchemeName', instance.analysisSchemeName);
  writeNotNull('AnalysisOptions', instance.analysisOptions?.toJson());
  return val;
}

const _$AnalysisSchemeLanguageEnumMap = {
  AnalysisSchemeLanguage.ar: 'ar',
  AnalysisSchemeLanguage.bg: 'bg',
  AnalysisSchemeLanguage.ca: 'ca',
  AnalysisSchemeLanguage.cs: 'cs',
  AnalysisSchemeLanguage.da: 'da',
  AnalysisSchemeLanguage.de: 'de',
  AnalysisSchemeLanguage.el: 'el',
  AnalysisSchemeLanguage.en: 'en',
  AnalysisSchemeLanguage.es: 'es',
  AnalysisSchemeLanguage.eu: 'eu',
  AnalysisSchemeLanguage.fa: 'fa',
  AnalysisSchemeLanguage.fi: 'fi',
  AnalysisSchemeLanguage.fr: 'fr',
  AnalysisSchemeLanguage.ga: 'ga',
  AnalysisSchemeLanguage.gl: 'gl',
  AnalysisSchemeLanguage.he: 'he',
  AnalysisSchemeLanguage.hi: 'hi',
  AnalysisSchemeLanguage.hu: 'hu',
  AnalysisSchemeLanguage.hy: 'hy',
  AnalysisSchemeLanguage.id: 'id',
  AnalysisSchemeLanguage.it: 'it',
  AnalysisSchemeLanguage.ja: 'ja',
  AnalysisSchemeLanguage.ko: 'ko',
  AnalysisSchemeLanguage.lv: 'lv',
  AnalysisSchemeLanguage.mul: 'mul',
  AnalysisSchemeLanguage.nl: 'nl',
  AnalysisSchemeLanguage.no: 'no',
  AnalysisSchemeLanguage.pt: 'pt',
  AnalysisSchemeLanguage.ro: 'ro',
  AnalysisSchemeLanguage.ru: 'ru',
  AnalysisSchemeLanguage.sv: 'sv',
  AnalysisSchemeLanguage.th: 'th',
  AnalysisSchemeLanguage.tr: 'tr',
  AnalysisSchemeLanguage.zhHans: 'zh-Hans',
  AnalysisSchemeLanguage.zhHant: 'zh-Hant',
};

Map<String, dynamic> _$DateArrayOptionsToJson(DateArrayOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('FacetEnabled', instance.facetEnabled);
  writeNotNull('ReturnEnabled', instance.returnEnabled);
  writeNotNull('SearchEnabled', instance.searchEnabled);
  writeNotNull('SourceFields', instance.sourceFields);
  return val;
}

Map<String, dynamic> _$DateOptionsToJson(DateOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('FacetEnabled', instance.facetEnabled);
  writeNotNull('ReturnEnabled', instance.returnEnabled);
  writeNotNull('SearchEnabled', instance.searchEnabled);
  writeNotNull('SortEnabled', instance.sortEnabled);
  writeNotNull('SourceField', instance.sourceField);
  return val;
}

Map<String, dynamic> _$DocumentSuggesterOptionsToJson(
    DocumentSuggesterOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceField', instance.sourceField);
  writeNotNull(
      'FuzzyMatching', _$SuggesterFuzzyMatchingEnumMap[instance.fuzzyMatching]);
  writeNotNull('SortExpression', instance.sortExpression);
  return val;
}

const _$SuggesterFuzzyMatchingEnumMap = {
  SuggesterFuzzyMatching.none: 'none',
  SuggesterFuzzyMatching.low: 'low',
  SuggesterFuzzyMatching.high: 'high',
};

Map<String, dynamic> _$DomainEndpointOptionsToJson(
    DomainEndpointOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EnforceHTTPS', instance.enforceHTTPS);
  writeNotNull('TLSSecurityPolicy',
      _$TLSSecurityPolicyEnumMap[instance.tLSSecurityPolicy]);
  return val;
}

const _$TLSSecurityPolicyEnumMap = {
  TLSSecurityPolicy.policyMinTls_1_0_2019_07: 'Policy-Min-TLS-1-0-2019-07',
  TLSSecurityPolicy.policyMinTls_1_2_2019_07: 'Policy-Min-TLS-1-2-2019-07',
};

Map<String, dynamic> _$DoubleArrayOptionsToJson(DoubleArrayOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('FacetEnabled', instance.facetEnabled);
  writeNotNull('ReturnEnabled', instance.returnEnabled);
  writeNotNull('SearchEnabled', instance.searchEnabled);
  writeNotNull('SourceFields', instance.sourceFields);
  return val;
}

Map<String, dynamic> _$DoubleOptionsToJson(DoubleOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('FacetEnabled', instance.facetEnabled);
  writeNotNull('ReturnEnabled', instance.returnEnabled);
  writeNotNull('SearchEnabled', instance.searchEnabled);
  writeNotNull('SortEnabled', instance.sortEnabled);
  writeNotNull('SourceField', instance.sourceField);
  return val;
}

Map<String, dynamic> _$ExpressionToJson(Expression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExpressionName', instance.expressionName);
  writeNotNull('ExpressionValue', instance.expressionValue);
  return val;
}

Map<String, dynamic> _$IndexFieldToJson(IndexField instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexFieldName', instance.indexFieldName);
  writeNotNull(
      'IndexFieldType', _$IndexFieldTypeEnumMap[instance.indexFieldType]);
  writeNotNull('DateArrayOptions', instance.dateArrayOptions?.toJson());
  writeNotNull('DateOptions', instance.dateOptions?.toJson());
  writeNotNull('DoubleArrayOptions', instance.doubleArrayOptions?.toJson());
  writeNotNull('DoubleOptions', instance.doubleOptions?.toJson());
  writeNotNull('IntArrayOptions', instance.intArrayOptions?.toJson());
  writeNotNull('IntOptions', instance.intOptions?.toJson());
  writeNotNull('LatLonOptions', instance.latLonOptions?.toJson());
  writeNotNull('LiteralArrayOptions', instance.literalArrayOptions?.toJson());
  writeNotNull('LiteralOptions', instance.literalOptions?.toJson());
  writeNotNull('TextArrayOptions', instance.textArrayOptions?.toJson());
  writeNotNull('TextOptions', instance.textOptions?.toJson());
  return val;
}

const _$IndexFieldTypeEnumMap = {
  IndexFieldType.int: 'int',
  IndexFieldType.double: 'double',
  IndexFieldType.literal: 'literal',
  IndexFieldType.text: 'text',
  IndexFieldType.date: 'date',
  IndexFieldType.latlon: 'latlon',
  IndexFieldType.intArray: 'int-array',
  IndexFieldType.doubleArray: 'double-array',
  IndexFieldType.literalArray: 'literal-array',
  IndexFieldType.textArray: 'text-array',
  IndexFieldType.dateArray: 'date-array',
};

Map<String, dynamic> _$IntArrayOptionsToJson(IntArrayOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('FacetEnabled', instance.facetEnabled);
  writeNotNull('ReturnEnabled', instance.returnEnabled);
  writeNotNull('SearchEnabled', instance.searchEnabled);
  writeNotNull('SourceFields', instance.sourceFields);
  return val;
}

Map<String, dynamic> _$IntOptionsToJson(IntOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('FacetEnabled', instance.facetEnabled);
  writeNotNull('ReturnEnabled', instance.returnEnabled);
  writeNotNull('SearchEnabled', instance.searchEnabled);
  writeNotNull('SortEnabled', instance.sortEnabled);
  writeNotNull('SourceField', instance.sourceField);
  return val;
}

Map<String, dynamic> _$LatLonOptionsToJson(LatLonOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('FacetEnabled', instance.facetEnabled);
  writeNotNull('ReturnEnabled', instance.returnEnabled);
  writeNotNull('SearchEnabled', instance.searchEnabled);
  writeNotNull('SortEnabled', instance.sortEnabled);
  writeNotNull('SourceField', instance.sourceField);
  return val;
}

Map<String, dynamic> _$LiteralArrayOptionsToJson(LiteralArrayOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('FacetEnabled', instance.facetEnabled);
  writeNotNull('ReturnEnabled', instance.returnEnabled);
  writeNotNull('SearchEnabled', instance.searchEnabled);
  writeNotNull('SourceFields', instance.sourceFields);
  return val;
}

Map<String, dynamic> _$LiteralOptionsToJson(LiteralOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('FacetEnabled', instance.facetEnabled);
  writeNotNull('ReturnEnabled', instance.returnEnabled);
  writeNotNull('SearchEnabled', instance.searchEnabled);
  writeNotNull('SortEnabled', instance.sortEnabled);
  writeNotNull('SourceField', instance.sourceField);
  return val;
}

Map<String, dynamic> _$ScalingParametersToJson(ScalingParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DesiredInstanceType',
      _$PartitionInstanceTypeEnumMap[instance.desiredInstanceType]);
  writeNotNull('DesiredPartitionCount', instance.desiredPartitionCount);
  writeNotNull('DesiredReplicationCount', instance.desiredReplicationCount);
  return val;
}

const _$PartitionInstanceTypeEnumMap = {
  PartitionInstanceType.searchM1Small: 'search.m1.small',
  PartitionInstanceType.searchM1Large: 'search.m1.large',
  PartitionInstanceType.searchM2Xlarge: 'search.m2.xlarge',
  PartitionInstanceType.searchM2_2xlarge: 'search.m2.2xlarge',
  PartitionInstanceType.searchM3Medium: 'search.m3.medium',
  PartitionInstanceType.searchM3Large: 'search.m3.large',
  PartitionInstanceType.searchM3Xlarge: 'search.m3.xlarge',
  PartitionInstanceType.searchM3_2xlarge: 'search.m3.2xlarge',
  PartitionInstanceType.searchSmall: 'search.small',
  PartitionInstanceType.searchMedium: 'search.medium',
  PartitionInstanceType.searchLarge: 'search.large',
  PartitionInstanceType.searchXlarge: 'search.xlarge',
  PartitionInstanceType.search_2xlarge: 'search.2xlarge',
};

Map<String, dynamic> _$SuggesterToJson(Suggester instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'DocumentSuggesterOptions', instance.documentSuggesterOptions?.toJson());
  writeNotNull('SuggesterName', instance.suggesterName);
  return val;
}

Map<String, dynamic> _$TextArrayOptionsToJson(TextArrayOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AnalysisScheme', instance.analysisScheme);
  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('HighlightEnabled', instance.highlightEnabled);
  writeNotNull('ReturnEnabled', instance.returnEnabled);
  writeNotNull('SourceFields', instance.sourceFields);
  return val;
}

Map<String, dynamic> _$TextOptionsToJson(TextOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AnalysisScheme', instance.analysisScheme);
  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('HighlightEnabled', instance.highlightEnabled);
  writeNotNull('ReturnEnabled', instance.returnEnabled);
  writeNotNull('SortEnabled', instance.sortEnabled);
  writeNotNull('SourceField', instance.sourceField);
  return val;
}
