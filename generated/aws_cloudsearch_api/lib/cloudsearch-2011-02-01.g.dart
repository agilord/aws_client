// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloudsearch-2011-02-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$IndexFieldToJson(IndexField instance) {
  final val = <String, dynamic>{
    'IndexFieldName': instance.indexFieldName,
    'IndexFieldType': _$IndexFieldTypeEnumMap[instance.indexFieldType],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LiteralOptions', instance.literalOptions?.toJson());
  writeNotNull('SourceAttributes',
      instance.sourceAttributes?.map((e) => e.toJson()).toList());
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

Map<String, dynamic> _$NamedRankExpressionToJson(
        NamedRankExpression instance) =>
    <String, dynamic>{
      'RankExpression': instance.rankExpression,
      'RankName': instance.rankName,
    };

Map<String, dynamic> _$SourceAttributeToJson(SourceAttribute instance) {
  final val = <String, dynamic>{
    'SourceDataFunction':
        _$SourceDataFunctionEnumMap[instance.sourceDataFunction],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

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
  final val = <String, dynamic>{
    'SourceName': instance.sourceName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  return val;
}

Map<String, dynamic> _$SourceDataMapToJson(SourceDataMap instance) {
  final val = <String, dynamic>{
    'SourceName': instance.sourceName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cases', instance.cases);
  writeNotNull('DefaultValue', instance.defaultValue);
  return val;
}

Map<String, dynamic> _$SourceDataTrimTitleToJson(SourceDataTrimTitle instance) {
  final val = <String, dynamic>{
    'SourceName': instance.sourceName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

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
