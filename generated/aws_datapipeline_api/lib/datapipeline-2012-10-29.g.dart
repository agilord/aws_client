// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datapipeline-2012-10-29.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ActivatePipelineInputToJson(
    ActivatePipelineInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pipelineId', instance.pipelineId);
  writeNotNull('parameterValues',
      instance.parameterValues?.map((e) => e?.toJson())?.toList());
  writeNotNull('startTimestamp', unixTimestampToJson(instance.startTimestamp));
  return val;
}

ActivatePipelineOutput _$ActivatePipelineOutputFromJson(
    Map<String, dynamic> json) {
  return ActivatePipelineOutput();
}

Map<String, dynamic> _$AddTagsInputToJson(AddTagsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pipelineId', instance.pipelineId);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

AddTagsOutput _$AddTagsOutputFromJson(Map<String, dynamic> json) {
  return AddTagsOutput();
}

Map<String, dynamic> _$CreatePipelineInputToJson(CreatePipelineInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('uniqueId', instance.uniqueId);
  writeNotNull('description', instance.description);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreatePipelineOutput _$CreatePipelineOutputFromJson(Map<String, dynamic> json) {
  return CreatePipelineOutput(
    pipelineId: json['pipelineId'] as String,
  );
}

Map<String, dynamic> _$DeactivatePipelineInputToJson(
    DeactivatePipelineInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pipelineId', instance.pipelineId);
  writeNotNull('cancelActive', instance.cancelActive);
  return val;
}

DeactivatePipelineOutput _$DeactivatePipelineOutputFromJson(
    Map<String, dynamic> json) {
  return DeactivatePipelineOutput();
}

Map<String, dynamic> _$DeletePipelineInputToJson(DeletePipelineInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pipelineId', instance.pipelineId);
  return val;
}

Map<String, dynamic> _$DescribeObjectsInputToJson(
    DescribeObjectsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objectIds', instance.objectIds);
  writeNotNull('pipelineId', instance.pipelineId);
  writeNotNull('evaluateExpressions', instance.evaluateExpressions);
  writeNotNull('marker', instance.marker);
  return val;
}

DescribeObjectsOutput _$DescribeObjectsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeObjectsOutput(
    pipelineObjects: (json['pipelineObjects'] as List)
        ?.map((e) => e == null
            ? null
            : PipelineObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hasMoreResults: json['hasMoreResults'] as bool,
    marker: json['marker'] as String,
  );
}

Map<String, dynamic> _$DescribePipelinesInputToJson(
    DescribePipelinesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pipelineIds', instance.pipelineIds);
  return val;
}

DescribePipelinesOutput _$DescribePipelinesOutputFromJson(
    Map<String, dynamic> json) {
  return DescribePipelinesOutput(
    pipelineDescriptionList: (json['pipelineDescriptionList'] as List)
        ?.map((e) => e == null
            ? null
            : PipelineDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EvaluateExpressionInputToJson(
    EvaluateExpressionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expression', instance.expression);
  writeNotNull('objectId', instance.objectId);
  writeNotNull('pipelineId', instance.pipelineId);
  return val;
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
    refValue: json['refValue'] as String,
    stringValue: json['stringValue'] as String,
  );
}

Map<String, dynamic> _$FieldToJson(Field instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('refValue', instance.refValue);
  writeNotNull('stringValue', instance.stringValue);
  return val;
}

Map<String, dynamic> _$GetPipelineDefinitionInputToJson(
    GetPipelineDefinitionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pipelineId', instance.pipelineId);
  writeNotNull('version', instance.version);
  return val;
}

GetPipelineDefinitionOutput _$GetPipelineDefinitionOutputFromJson(
    Map<String, dynamic> json) {
  return GetPipelineDefinitionOutput(
    parameterObjects: (json['parameterObjects'] as List)
        ?.map((e) => e == null
            ? null
            : ParameterObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    parameterValues: (json['parameterValues'] as List)
        ?.map((e) => e == null
            ? null
            : ParameterValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pipelineObjects: (json['pipelineObjects'] as List)
        ?.map((e) => e == null
            ? null
            : PipelineObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
    message: json['message'] as String,
  );
}

InvalidRequestException _$InvalidRequestExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidRequestException(
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ListPipelinesInputToJson(ListPipelinesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('marker', instance.marker);
  return val;
}

ListPipelinesOutput _$ListPipelinesOutputFromJson(Map<String, dynamic> json) {
  return ListPipelinesOutput(
    pipelineIdList: (json['pipelineIdList'] as List)
        ?.map((e) => e == null
            ? null
            : PipelineIdName.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hasMoreResults: json['hasMoreResults'] as bool,
    marker: json['marker'] as String,
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

Map<String, dynamic> _$ParameterAttributeToJson(ParameterAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('stringValue', instance.stringValue);
  return val;
}

ParameterObject _$ParameterObjectFromJson(Map<String, dynamic> json) {
  return ParameterObject(
    attributes: (json['attributes'] as List)
        ?.map((e) => e == null
            ? null
            : ParameterAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ParameterObjectToJson(ParameterObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'attributes', instance.attributes?.map((e) => e?.toJson())?.toList());
  writeNotNull('id', instance.id);
  return val;
}

ParameterValue _$ParameterValueFromJson(Map<String, dynamic> json) {
  return ParameterValue(
    id: json['id'] as String,
    stringValue: json['stringValue'] as String,
  );
}

Map<String, dynamic> _$ParameterValueToJson(ParameterValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('stringValue', instance.stringValue);
  return val;
}

PipelineDeletedException _$PipelineDeletedExceptionFromJson(
    Map<String, dynamic> json) {
  return PipelineDeletedException(
    message: json['message'] as String,
  );
}

PipelineDescription _$PipelineDescriptionFromJson(Map<String, dynamic> json) {
  return PipelineDescription(
    fields: (json['fields'] as List)
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    pipelineId: json['pipelineId'] as String,
    description: json['description'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PipelineIdName _$PipelineIdNameFromJson(Map<String, dynamic> json) {
  return PipelineIdName(
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

PipelineNotFoundException _$PipelineNotFoundExceptionFromJson(
    Map<String, dynamic> json) {
  return PipelineNotFoundException(
    message: json['message'] as String,
  );
}

PipelineObject _$PipelineObjectFromJson(Map<String, dynamic> json) {
  return PipelineObject(
    fields: (json['fields'] as List)
        ?.map(
            (e) => e == null ? null : Field.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$PipelineObjectToJson(PipelineObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fields', instance.fields?.map((e) => e?.toJson())?.toList());
  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  return val;
}

Map<String, dynamic> _$PollForTaskInputToJson(PollForTaskInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('workerGroup', instance.workerGroup);
  writeNotNull('hostname', instance.hostname);
  writeNotNull('instanceIdentity', instance.instanceIdentity?.toJson());
  return val;
}

PollForTaskOutput _$PollForTaskOutputFromJson(Map<String, dynamic> json) {
  return PollForTaskOutput(
    taskObject: json['taskObject'] == null
        ? null
        : TaskObject.fromJson(json['taskObject'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutPipelineDefinitionInputToJson(
    PutPipelineDefinitionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pipelineId', instance.pipelineId);
  writeNotNull('pipelineObjects',
      instance.pipelineObjects?.map((e) => e?.toJson())?.toList());
  writeNotNull('parameterObjects',
      instance.parameterObjects?.map((e) => e?.toJson())?.toList());
  writeNotNull('parameterValues',
      instance.parameterValues?.map((e) => e?.toJson())?.toList());
  return val;
}

PutPipelineDefinitionOutput _$PutPipelineDefinitionOutputFromJson(
    Map<String, dynamic> json) {
  return PutPipelineDefinitionOutput(
    errored: json['errored'] as bool,
    validationErrors: (json['validationErrors'] as List)
        ?.map((e) => e == null
            ? null
            : ValidationError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    validationWarnings: (json['validationWarnings'] as List)
        ?.map((e) => e == null
            ? null
            : ValidationWarning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
      'selectors', instance.selectors?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$QueryObjectsInputToJson(QueryObjectsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pipelineId', instance.pipelineId);
  writeNotNull('sphere', instance.sphere);
  writeNotNull('limit', instance.limit);
  writeNotNull('marker', instance.marker);
  writeNotNull('query', instance.query?.toJson());
  return val;
}

QueryObjectsOutput _$QueryObjectsOutputFromJson(Map<String, dynamic> json) {
  return QueryObjectsOutput(
    hasMoreResults: json['hasMoreResults'] as bool,
    ids: (json['ids'] as List)?.map((e) => e as String)?.toList(),
    marker: json['marker'] as String,
  );
}

Map<String, dynamic> _$RemoveTagsInputToJson(RemoveTagsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pipelineId', instance.pipelineId);
  writeNotNull('tagKeys', instance.tagKeys);
  return val;
}

RemoveTagsOutput _$RemoveTagsOutputFromJson(Map<String, dynamic> json) {
  return RemoveTagsOutput();
}

Map<String, dynamic> _$ReportTaskProgressInputToJson(
    ReportTaskProgressInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('taskId', instance.taskId);
  writeNotNull('fields', instance.fields?.map((e) => e?.toJson())?.toList());
  return val;
}

ReportTaskProgressOutput _$ReportTaskProgressOutputFromJson(
    Map<String, dynamic> json) {
  return ReportTaskProgressOutput(
    canceled: json['canceled'] as bool,
  );
}

Map<String, dynamic> _$ReportTaskRunnerHeartbeatInputToJson(
    ReportTaskRunnerHeartbeatInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('taskrunnerId', instance.taskrunnerId);
  writeNotNull('hostname', instance.hostname);
  writeNotNull('workerGroup', instance.workerGroup);
  return val;
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

Map<String, dynamic> _$SetStatusInputToJson(SetStatusInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objectIds', instance.objectIds);
  writeNotNull('pipelineId', instance.pipelineId);
  writeNotNull('status', instance.status);
  return val;
}

Map<String, dynamic> _$SetTaskStatusInputToJson(SetTaskStatusInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('taskId', instance.taskId);
  writeNotNull('taskStatus', _$TaskStatusEnumMap[instance.taskStatus]);
  writeNotNull('errorId', instance.errorId);
  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('errorStackTrace', instance.errorStackTrace);
  return val;
}

const _$TaskStatusEnumMap = {
  TaskStatus.finished: 'FINISHED',
  TaskStatus.failed: 'FAILED',
  TaskStatus.$false: 'FALSE',
};

SetTaskStatusOutput _$SetTaskStatusOutputFromJson(Map<String, dynamic> json) {
  return SetTaskStatusOutput();
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

TaskNotFoundException _$TaskNotFoundExceptionFromJson(
    Map<String, dynamic> json) {
  return TaskNotFoundException(
    message: json['message'] as String,
  );
}

TaskObject _$TaskObjectFromJson(Map<String, dynamic> json) {
  return TaskObject(
    attemptId: json['attemptId'] as String,
    objects: (json['objects'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : PipelineObject.fromJson(e as Map<String, dynamic>)),
    ),
    pipelineId: json['pipelineId'] as String,
    taskId: json['taskId'] as String,
  );
}

Map<String, dynamic> _$ValidatePipelineDefinitionInputToJson(
    ValidatePipelineDefinitionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pipelineId', instance.pipelineId);
  writeNotNull('pipelineObjects',
      instance.pipelineObjects?.map((e) => e?.toJson())?.toList());
  writeNotNull('parameterObjects',
      instance.parameterObjects?.map((e) => e?.toJson())?.toList());
  writeNotNull('parameterValues',
      instance.parameterValues?.map((e) => e?.toJson())?.toList());
  return val;
}

ValidatePipelineDefinitionOutput _$ValidatePipelineDefinitionOutputFromJson(
    Map<String, dynamic> json) {
  return ValidatePipelineDefinitionOutput(
    errored: json['errored'] as bool,
    validationErrors: (json['validationErrors'] as List)
        ?.map((e) => e == null
            ? null
            : ValidationError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    validationWarnings: (json['validationWarnings'] as List)
        ?.map((e) => e == null
            ? null
            : ValidationWarning.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) {
  return ValidationError(
    errors: (json['errors'] as List)?.map((e) => e as String)?.toList(),
    id: json['id'] as String,
  );
}

ValidationWarning _$ValidationWarningFromJson(Map<String, dynamic> json) {
  return ValidationWarning(
    id: json['id'] as String,
    warnings: (json['warnings'] as List)?.map((e) => e as String)?.toList(),
  );
}
