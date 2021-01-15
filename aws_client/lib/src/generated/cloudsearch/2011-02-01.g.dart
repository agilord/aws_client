// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2011-02-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
  writeNotNull('LiteralOptions', instance.literalOptions?.toJson());
  writeNotNull('SourceAttributes',
      instance.sourceAttributes?.map((e) => e?.toJson())?.toList());
  writeNotNull('TextOptions', instance.textOptions?.toJson());
  writeNotNull('UIntOptions', instance.uIntOptions?.toJson());
  return val;
}

const _$IndexFieldTypeEnumMap = {
  IndexFieldType.uint: 'uint',
  IndexFieldType.literal: 'literal',
  IndexFieldType.text: 'text',
};

Map<String, dynamic> _$LiteralOptionsToJson(LiteralOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('FacetEnabled', instance.facetEnabled);
  writeNotNull('ResultEnabled', instance.resultEnabled);
  writeNotNull('SearchEnabled', instance.searchEnabled);
  return val;
}

Map<String, dynamic> _$NamedRankExpressionToJson(NamedRankExpression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RankExpression', instance.rankExpression);
  writeNotNull('RankName', instance.rankName);
  return val;
}

Map<String, dynamic> _$SourceAttributeToJson(SourceAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceDataFunction',
      _$SourceDataFunctionEnumMap[instance.sourceDataFunction]);
  writeNotNull('SourceDataCopy', instance.sourceDataCopy?.toJson());
  writeNotNull('SourceDataMap', instance.sourceDataMap?.toJson());
  writeNotNull('SourceDataTrimTitle', instance.sourceDataTrimTitle?.toJson());
  return val;
}

const _$SourceDataFunctionEnumMap = {
  SourceDataFunction.copy: 'Copy',
  SourceDataFunction.trimTitle: 'TrimTitle',
  SourceDataFunction.map: 'Map',
};

Map<String, dynamic> _$SourceDataToJson(SourceData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceName', instance.sourceName);
  writeNotNull('DefaultValue', instance.defaultValue);
  return val;
}

Map<String, dynamic> _$SourceDataMapToJson(SourceDataMap instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceName', instance.sourceName);
  writeNotNull('Cases', instance.cases);
  writeNotNull('DefaultValue', instance.defaultValue);
  return val;
}

Map<String, dynamic> _$SourceDataTrimTitleToJson(SourceDataTrimTitle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceName', instance.sourceName);
  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('Language', instance.language);
  writeNotNull('Separator', instance.separator);
  return val;
}

Map<String, dynamic> _$TextOptionsToJson(TextOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('FacetEnabled', instance.facetEnabled);
  writeNotNull('ResultEnabled', instance.resultEnabled);
  writeNotNull('TextProcessor', instance.textProcessor);
  return val;
}

Map<String, dynamic> _$UIntOptionsToJson(UIntOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  return val;
}
