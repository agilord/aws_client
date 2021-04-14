// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datapipeline-2012-10-29.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivatePipelineOutput _$ActivatePipelineOutputFromJson(
    Map<String, dynamic> json) {
  return ActivatePipelineOutput();
}

AddTagsOutput _$AddTagsOutputFromJson(Map<String, dynamic> json) {
  return AddTagsOutput();
}

CreatePipelineOutput _$CreatePipelineOutputFromJson(Map<String, dynamic> json) {
  return CreatePipelineOutput(
    pipelineId: json['pipelineId'] as String,
  );
}

DeactivatePipelineOutput _$DeactivatePipelineOutputFromJson(
    Map<String, dynamic> json) {
  return DeactivatePipelineOutput();
}

DescribeObjectsOutput _$DescribeObjectsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeObjectsOutput(
    pipelineObjects: (json['pipelineObjects'] as List<dynamic>)
        .map((e) => PipelineObject.fromJson(e as Map<String, dynamic>))
        .toList(),
    hasMoreResults: json['hasMoreResults'] as bool?,
    marker: json['marker'] as String?,
  );
}

DescribePipelinesOutput _$DescribePipelinesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribePipelinesOutput(
    pipelineDescriptionList: (json['pipelineDescriptionList'] as List<dynamic>)
        .map((e) => PipelineDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

EvaluateExpressionOutput _$EvaluateExpressionOutputFromJson(
    Map<String, dynamic> json) {
  return EvaluateExpressionOutput(
    evaluatedExpression: json['evaluatedExpression'] as String,
  );
}

Field _$FieldFromJson(Map<String, dynamic> json) {
  return Field(
    key: json['key'] as String,
    refValue: json['refValue'] as String?,
    stringValue: json['stringValue'] as String?,
  );
}

Map<String, dynamic> _$FieldToJson(Field instance) {
  final val = <String, dynamic>{
    'key': instance.key,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('refValue', instance.refValue);
  writeNotNull('stringValue', instance.stringValue);
  return val;
}

GetPipelineDefinitionOutput _$GetPipelineDefinitionOutputFromJson(
    Map<String, dynamic> json) {
  return GetPipelineDefinitionOutput(
    parameterObjects: (json['parameterObjects'] as List<dynamic>?)
        ?.map((e) => ParameterObject.fromJson(e as Map<String, dynamic>))
        .toList(),
    parameterValues: (json['parameterValues'] as List<dynamic>?)
        ?.map((e) => ParameterValue.fromJson(e as Map<String, dynamic>))
        .toList(),
    pipelineObjects: (json['pipelineObjects'] as List<dynamic>?)
        ?.map((e) => PipelineObject.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$InstanceIdentityToJson(InstanceIdentity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('document', instance.document);
  writeNotNull('signature', instance.signature);
  return val;
}

InternalServiceError _$InternalServiceErrorFromJson(Map<String, dynamic> json) {
  return InternalServiceError(
    message: json['message'] as String?,
  );
}

InvalidRequestException _$InvalidRequestExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidRequestException(
    message: json['message'] as String?,
  );
}

ListPipelinesOutput _$ListPipelinesOutputFromJson(Map<String, dynamic> json) {
  return ListPipelinesOutput(
    pipelineIdList: (json['pipelineIdList'] as List<dynamic>)
        .map((e) => PipelineIdName.fromJson(e as Map<String, dynamic>))
        .toList(),
    hasMoreResults: json['hasMoreResults'] as bool?,
    marker: json['marker'] as String?,
  );
}

Map<String, dynamic> _$OperatorToJson(Operator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$OperatorTypeEnumMap[instance.type]);
  writeNotNull('values', instance.values);
  return val;
}

const _$OperatorTypeEnumMap = {
  OperatorType.eq: 'EQ',
  OperatorType.refEq: 'REF_EQ',
  OperatorType.le: 'LE',
  OperatorType.ge: 'GE',
  OperatorType.between: 'BETWEEN',
};

ParameterAttribute _$ParameterAttributeFromJson(Map<String, dynamic> json) {
  return ParameterAttribute(
    key: json['key'] as String,
    stringValue: json['stringValue'] as String,
  );
}

Map<String, dynamic> _$ParameterAttributeToJson(ParameterAttribute instance) =>
    <String, dynamic>{
      'key': instance.key,
      'stringValue': instance.stringValue,
    };

ParameterObject _$ParameterObjectFromJson(Map<String, dynamic> json) {
  return ParameterObject(
    attributes: (json['attributes'] as List<dynamic>)
        .map((e) => ParameterAttribute.fromJson(e as Map<String, dynamic>))
        .toList(),
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ParameterObjectToJson(ParameterObject instance) =>
    <String, dynamic>{
      'attributes': instance.attributes.map((e) => e.toJson()).toList(),
      'id': instance.id,
    };

ParameterValue _$ParameterValueFromJson(Map<String, dynamic> json) {
  return ParameterValue(
    id: json['id'] as String,
    stringValue: json['stringValue'] as String,
  );
}

Map<String, dynamic> _$ParameterValueToJson(ParameterValue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stringValue': instance.stringValue,
    };

PipelineDeletedException _$PipelineDeletedExceptionFromJson(
    Map<String, dynamic> json) {
  return PipelineDeletedException(
    message: json['message'] as String?,
  );
}

PipelineDescription _$PipelineDescriptionFromJson(Map<String, dynamic> json) {
  return PipelineDescription(
    fields: (json['fields'] as List<dynamic>)
        .map((e) => Field.fromJson(e as Map<String, dynamic>))
        .toList(),
    name: json['name'] as String,
    pipelineId: json['pipelineId'] as String,
    description: json['description'] as String?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

PipelineIdName _$PipelineIdNameFromJson(Map<String, dynamic> json) {
  return PipelineIdName(
    id: json['id'] as String?,
    name: json['name'] as String?,
  );
}

PipelineNotFoundException _$PipelineNotFoundExceptionFromJson(
    Map<String, dynamic> json) {
  return PipelineNotFoundException(
    message: json['message'] as String?,
  );
}

PipelineObject _$PipelineObjectFromJson(Map<String, dynamic> json) {
  return PipelineObject(
    fields: (json['fields'] as List<dynamic>)
        .map((e) => Field.fromJson(e as Map<String, dynamic>))
        .toList(),
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$PipelineObjectToJson(PipelineObject instance) =>
    <String, dynamic>{
      'fields': instance.fields.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'name': instance.name,
    };

PollForTaskOutput _$PollForTaskOutputFromJson(Map<String, dynamic> json) {
  return PollForTaskOutput(
    taskObject: json['taskObject'] == null
        ? null
        : TaskObject.fromJson(json['taskObject'] as Map<String, dynamic>),
  );
}

PutPipelineDefinitionOutput _$PutPipelineDefinitionOutputFromJson(
    Map<String, dynamic> json) {
  return PutPipelineDefinitionOutput(
    errored: json['errored'] as bool,
    validationErrors: (json['validationErrors'] as List<dynamic>?)
        ?.map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
        .toList(),
    validationWarnings: (json['validationWarnings'] as List<dynamic>?)
        ?.map((e) => ValidationWarning.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QueryToJson(Query instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'selectors', instance.selectors?.map((e) => e.toJson()).toList());
  return val;
}

QueryObjectsOutput _$QueryObjectsOutputFromJson(Map<String, dynamic> json) {
  return QueryObjectsOutput(
    hasMoreResults: json['hasMoreResults'] as bool?,
    ids: (json['ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
    marker: json['marker'] as String?,
  );
}

RemoveTagsOutput _$RemoveTagsOutputFromJson(Map<String, dynamic> json) {
  return RemoveTagsOutput();
}

ReportTaskProgressOutput _$ReportTaskProgressOutputFromJson(
    Map<String, dynamic> json) {
  return ReportTaskProgressOutput(
    canceled: json['canceled'] as bool,
  );
}

ReportTaskRunnerHeartbeatOutput _$ReportTaskRunnerHeartbeatOutputFromJson(
    Map<String, dynamic> json) {
  return ReportTaskRunnerHeartbeatOutput(
    terminate: json['terminate'] as bool,
  );
}

Map<String, dynamic> _$SelectorToJson(Selector instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fieldName', instance.fieldName);
  writeNotNull('operator', instance.operator?.toJson());
  return val;
}

SetTaskStatusOutput _$SetTaskStatusOutputFromJson(Map<String, dynamic> json) {
  return SetTaskStatusOutput();
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

TaskNotFoundException _$TaskNotFoundExceptionFromJson(
    Map<String, dynamic> json) {
  return TaskNotFoundException(
    message: json['message'] as String?,
  );
}

TaskObject _$TaskObjectFromJson(Map<String, dynamic> json) {
  return TaskObject(
    attemptId: json['attemptId'] as String?,
    objects: (json['objects'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, PipelineObject.fromJson(e as Map<String, dynamic>)),
    ),
    pipelineId: json['pipelineId'] as String?,
    taskId: json['taskId'] as String?,
  );
}

ValidatePipelineDefinitionOutput _$ValidatePipelineDefinitionOutputFromJson(
    Map<String, dynamic> json) {
  return ValidatePipelineDefinitionOutput(
    errored: json['errored'] as bool,
    validationErrors: (json['validationErrors'] as List<dynamic>?)
        ?.map((e) => ValidationError.fromJson(e as Map<String, dynamic>))
        .toList(),
    validationWarnings: (json['validationWarnings'] as List<dynamic>?)
        ?.map((e) => ValidationWarning.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) {
  return ValidationError(
    errors:
        (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    id: json['id'] as String?,
  );
}

ValidationWarning _$ValidationWarningFromJson(Map<String, dynamic> json) {
  return ValidationWarning(
    id: json['id'] as String?,
    warnings:
        (json['warnings'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}
