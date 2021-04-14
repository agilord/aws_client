// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'textract-2018-06-27.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyzeDocumentResponse _$AnalyzeDocumentResponseFromJson(
    Map<String, dynamic> json) {
  return AnalyzeDocumentResponse(
    analyzeDocumentModelVersion: json['AnalyzeDocumentModelVersion'] as String?,
    blocks: (json['Blocks'] as List<dynamic>?)
        ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
        .toList(),
    documentMetadata: json['DocumentMetadata'] == null
        ? null
        : DocumentMetadata.fromJson(
            json['DocumentMetadata'] as Map<String, dynamic>),
    humanLoopActivationOutput: json['HumanLoopActivationOutput'] == null
        ? null
        : HumanLoopActivationOutput.fromJson(
            json['HumanLoopActivationOutput'] as Map<String, dynamic>),
  );
}

Block _$BlockFromJson(Map<String, dynamic> json) {
  return Block(
    blockType: _$enumDecodeNullable(_$BlockTypeEnumMap, json['BlockType']),
    columnIndex: json['ColumnIndex'] as int?,
    columnSpan: json['ColumnSpan'] as int?,
    confidence: (json['Confidence'] as num?)?.toDouble(),
    entityTypes: (json['EntityTypes'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$EntityTypeEnumMap, e))
        .toList(),
    geometry: json['Geometry'] == null
        ? null
        : Geometry.fromJson(json['Geometry'] as Map<String, dynamic>),
    id: json['Id'] as String?,
    page: json['Page'] as int?,
    relationships: (json['Relationships'] as List<dynamic>?)
        ?.map((e) => Relationship.fromJson(e as Map<String, dynamic>))
        .toList(),
    rowIndex: json['RowIndex'] as int?,
    rowSpan: json['RowSpan'] as int?,
    selectionStatus:
        _$enumDecodeNullable(_$SelectionStatusEnumMap, json['SelectionStatus']),
    text: json['Text'] as String?,
    textType: _$enumDecodeNullable(_$TextTypeEnumMap, json['TextType']),
  );
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$BlockTypeEnumMap = {
  BlockType.keyValueSet: 'KEY_VALUE_SET',
  BlockType.page: 'PAGE',
  BlockType.line: 'LINE',
  BlockType.word: 'WORD',
  BlockType.table: 'TABLE',
  BlockType.cell: 'CELL',
  BlockType.selectionElement: 'SELECTION_ELEMENT',
};

const _$EntityTypeEnumMap = {
  EntityType.key: 'KEY',
  EntityType.value: 'VALUE',
};

const _$SelectionStatusEnumMap = {
  SelectionStatus.selected: 'SELECTED',
  SelectionStatus.notSelected: 'NOT_SELECTED',
};

const _$TextTypeEnumMap = {
  TextType.handwriting: 'HANDWRITING',
  TextType.printed: 'PRINTED',
};

BoundingBox _$BoundingBoxFromJson(Map<String, dynamic> json) {
  return BoundingBox(
    height: (json['Height'] as num?)?.toDouble(),
    left: (json['Left'] as num?)?.toDouble(),
    top: (json['Top'] as num?)?.toDouble(),
    width: (json['Width'] as num?)?.toDouble(),
  );
}

DetectDocumentTextResponse _$DetectDocumentTextResponseFromJson(
    Map<String, dynamic> json) {
  return DetectDocumentTextResponse(
    blocks: (json['Blocks'] as List<dynamic>?)
        ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
        .toList(),
    detectDocumentTextModelVersion:
        json['DetectDocumentTextModelVersion'] as String?,
    documentMetadata: json['DocumentMetadata'] == null
        ? null
        : DocumentMetadata.fromJson(
            json['DocumentMetadata'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DocumentToJson(Document instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Bytes', const Uint8ListNullableConverter().toJson(instance.bytes));
  writeNotNull('S3Object', instance.s3Object?.toJson());
  return val;
}

Map<String, dynamic> _$DocumentLocationToJson(DocumentLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Object', instance.s3Object?.toJson());
  return val;
}

DocumentMetadata _$DocumentMetadataFromJson(Map<String, dynamic> json) {
  return DocumentMetadata(
    pages: json['Pages'] as int?,
  );
}

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return Geometry(
    boundingBox: json['BoundingBox'] == null
        ? null
        : BoundingBox.fromJson(json['BoundingBox'] as Map<String, dynamic>),
    polygon: (json['Polygon'] as List<dynamic>?)
        ?.map((e) => Point.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

GetDocumentAnalysisResponse _$GetDocumentAnalysisResponseFromJson(
    Map<String, dynamic> json) {
  return GetDocumentAnalysisResponse(
    analyzeDocumentModelVersion: json['AnalyzeDocumentModelVersion'] as String?,
    blocks: (json['Blocks'] as List<dynamic>?)
        ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
        .toList(),
    documentMetadata: json['DocumentMetadata'] == null
        ? null
        : DocumentMetadata.fromJson(
            json['DocumentMetadata'] as Map<String, dynamic>),
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    nextToken: json['NextToken'] as String?,
    statusMessage: json['StatusMessage'] as String?,
    warnings: (json['Warnings'] as List<dynamic>?)
        ?.map((e) => Warning.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

const _$JobStatusEnumMap = {
  JobStatus.inProgress: 'IN_PROGRESS',
  JobStatus.succeeded: 'SUCCEEDED',
  JobStatus.failed: 'FAILED',
  JobStatus.partialSuccess: 'PARTIAL_SUCCESS',
};

GetDocumentTextDetectionResponse _$GetDocumentTextDetectionResponseFromJson(
    Map<String, dynamic> json) {
  return GetDocumentTextDetectionResponse(
    blocks: (json['Blocks'] as List<dynamic>?)
        ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
        .toList(),
    detectDocumentTextModelVersion:
        json['DetectDocumentTextModelVersion'] as String?,
    documentMetadata: json['DocumentMetadata'] == null
        ? null
        : DocumentMetadata.fromJson(
            json['DocumentMetadata'] as Map<String, dynamic>),
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['JobStatus']),
    nextToken: json['NextToken'] as String?,
    statusMessage: json['StatusMessage'] as String?,
    warnings: (json['Warnings'] as List<dynamic>?)
        ?.map((e) => Warning.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

HumanLoopActivationOutput _$HumanLoopActivationOutputFromJson(
    Map<String, dynamic> json) {
  return HumanLoopActivationOutput(
    humanLoopActivationConditionsEvaluationResults:
        json['HumanLoopActivationConditionsEvaluationResults'],
    humanLoopActivationReasons:
        (json['HumanLoopActivationReasons'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    humanLoopArn: json['HumanLoopArn'] as String?,
  );
}

Map<String, dynamic> _$HumanLoopConfigToJson(HumanLoopConfig instance) {
  final val = <String, dynamic>{
    'FlowDefinitionArn': instance.flowDefinitionArn,
    'HumanLoopName': instance.humanLoopName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataAttributes', instance.dataAttributes?.toJson());
  return val;
}

Map<String, dynamic> _$HumanLoopDataAttributesToJson(
    HumanLoopDataAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ContentClassifiers',
      instance.contentClassifiers
          ?.map((e) => _$ContentClassifierEnumMap[e])
          .toList());
  return val;
}

const _$ContentClassifierEnumMap = {
  ContentClassifier.freeOfPersonallyIdentifiableInformation:
      'FreeOfPersonallyIdentifiableInformation',
  ContentClassifier.freeOfAdultContent: 'FreeOfAdultContent',
};

Map<String, dynamic> _$NotificationChannelToJson(
        NotificationChannel instance) =>
    <String, dynamic>{
      'RoleArn': instance.roleArn,
      'SNSTopicArn': instance.sNSTopicArn,
    };

Map<String, dynamic> _$OutputConfigToJson(OutputConfig instance) {
  final val = <String, dynamic>{
    'S3Bucket': instance.s3Bucket,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Prefix', instance.s3Prefix);
  return val;
}

Point _$PointFromJson(Map<String, dynamic> json) {
  return Point(
    x: (json['X'] as num?)?.toDouble(),
    y: (json['Y'] as num?)?.toDouble(),
  );
}

Relationship _$RelationshipFromJson(Map<String, dynamic> json) {
  return Relationship(
    ids: (json['Ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
    type: _$enumDecodeNullable(_$RelationshipTypeEnumMap, json['Type']),
  );
}

const _$RelationshipTypeEnumMap = {
  RelationshipType.value: 'VALUE',
  RelationshipType.child: 'CHILD',
  RelationshipType.complexFeatures: 'COMPLEX_FEATURES',
};

Map<String, dynamic> _$S3ObjectToJson(S3Object instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull('Name', instance.name);
  writeNotNull('Version', instance.version);
  return val;
}

StartDocumentAnalysisResponse _$StartDocumentAnalysisResponseFromJson(
    Map<String, dynamic> json) {
  return StartDocumentAnalysisResponse(
    jobId: json['JobId'] as String?,
  );
}

StartDocumentTextDetectionResponse _$StartDocumentTextDetectionResponseFromJson(
    Map<String, dynamic> json) {
  return StartDocumentTextDetectionResponse(
    jobId: json['JobId'] as String?,
  );
}

Warning _$WarningFromJson(Map<String, dynamic> json) {
  return Warning(
    errorCode: json['ErrorCode'] as String?,
    pages: (json['Pages'] as List<dynamic>?)?.map((e) => e as int).toList(),
  );
}
