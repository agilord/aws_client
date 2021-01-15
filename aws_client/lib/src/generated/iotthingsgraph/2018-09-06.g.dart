// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-09-06.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssociateEntityToThingResponse _$AssociateEntityToThingResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateEntityToThingResponse();
}

CreateFlowTemplateResponse _$CreateFlowTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateFlowTemplateResponse(
    summary: json['summary'] == null
        ? null
        : FlowTemplateSummary.fromJson(json['summary'] as Map<String, dynamic>),
  );
}

CreateSystemInstanceResponse _$CreateSystemInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSystemInstanceResponse(
    summary: json['summary'] == null
        ? null
        : SystemInstanceSummary.fromJson(
            json['summary'] as Map<String, dynamic>),
  );
}

CreateSystemTemplateResponse _$CreateSystemTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSystemTemplateResponse(
    summary: json['summary'] == null
        ? null
        : SystemTemplateSummary.fromJson(
            json['summary'] as Map<String, dynamic>),
  );
}

DefinitionDocument _$DefinitionDocumentFromJson(Map<String, dynamic> json) {
  return DefinitionDocument(
    language:
        _$enumDecodeNullable(_$DefinitionLanguageEnumMap, json['language']),
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$DefinitionDocumentToJson(DefinitionDocument instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language', _$DefinitionLanguageEnumMap[instance.language]);
  writeNotNull('text', instance.text);
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

const _$DefinitionLanguageEnumMap = {
  DefinitionLanguage.graphql: 'GRAPHQL',
};

DeleteFlowTemplateResponse _$DeleteFlowTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteFlowTemplateResponse();
}

DeleteNamespaceResponse _$DeleteNamespaceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteNamespaceResponse(
    namespaceArn: json['namespaceArn'] as String,
    namespaceName: json['namespaceName'] as String,
  );
}

DeleteSystemInstanceResponse _$DeleteSystemInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSystemInstanceResponse();
}

DeleteSystemTemplateResponse _$DeleteSystemTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteSystemTemplateResponse();
}

DependencyRevision _$DependencyRevisionFromJson(Map<String, dynamic> json) {
  return DependencyRevision(
    id: json['id'] as String,
    revisionNumber: json['revisionNumber'] as int,
  );
}

DeploySystemInstanceResponse _$DeploySystemInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return DeploySystemInstanceResponse(
    summary: json['summary'] == null
        ? null
        : SystemInstanceSummary.fromJson(
            json['summary'] as Map<String, dynamic>),
    greengrassDeploymentId: json['greengrassDeploymentId'] as String,
  );
}

DeprecateFlowTemplateResponse _$DeprecateFlowTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeprecateFlowTemplateResponse();
}

DeprecateSystemTemplateResponse _$DeprecateSystemTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return DeprecateSystemTemplateResponse();
}

DescribeNamespaceResponse _$DescribeNamespaceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeNamespaceResponse(
    namespaceArn: json['namespaceArn'] as String,
    namespaceName: json['namespaceName'] as String,
    namespaceVersion: json['namespaceVersion'] as int,
    trackingNamespaceName: json['trackingNamespaceName'] as String,
    trackingNamespaceVersion: json['trackingNamespaceVersion'] as int,
  );
}

DissociateEntityFromThingResponse _$DissociateEntityFromThingResponseFromJson(
    Map<String, dynamic> json) {
  return DissociateEntityFromThingResponse();
}

EntityDescription _$EntityDescriptionFromJson(Map<String, dynamic> json) {
  return EntityDescription(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    definition: json['definition'] == null
        ? null
        : DefinitionDocument.fromJson(
            json['definition'] as Map<String, dynamic>),
    id: json['id'] as String,
    type: _$enumDecodeNullable(_$EntityTypeEnumMap, json['type']),
  );
}

const _$EntityTypeEnumMap = {
  EntityType.device: 'DEVICE',
  EntityType.service: 'SERVICE',
  EntityType.deviceModel: 'DEVICE_MODEL',
  EntityType.capability: 'CAPABILITY',
  EntityType.state: 'STATE',
  EntityType.action: 'ACTION',
  EntityType.event: 'EVENT',
  EntityType.property: 'PROPERTY',
  EntityType.mapping: 'MAPPING',
  EntityType.$enum: 'ENUM',
};

Map<String, dynamic> _$EntityFilterToJson(EntityFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$EntityFilterNameEnumMap[instance.name]);
  writeNotNull('value', instance.value);
  return val;
}

const _$EntityFilterNameEnumMap = {
  EntityFilterName.name: 'NAME',
  EntityFilterName.namespace: 'NAMESPACE',
  EntityFilterName.semanticTypePath: 'SEMANTIC_TYPE_PATH',
  EntityFilterName.referencedEntityId: 'REFERENCED_ENTITY_ID',
};

FlowExecutionMessage _$FlowExecutionMessageFromJson(Map<String, dynamic> json) {
  return FlowExecutionMessage(
    eventType: _$enumDecodeNullable(
        _$FlowExecutionEventTypeEnumMap, json['eventType']),
    messageId: json['messageId'] as String,
    payload: json['payload'] as String,
    timestamp: const UnixDateTimeConverter().fromJson(json['timestamp']),
  );
}

const _$FlowExecutionEventTypeEnumMap = {
  FlowExecutionEventType.executionStarted: 'EXECUTION_STARTED',
  FlowExecutionEventType.executionFailed: 'EXECUTION_FAILED',
  FlowExecutionEventType.executionAborted: 'EXECUTION_ABORTED',
  FlowExecutionEventType.executionSucceeded: 'EXECUTION_SUCCEEDED',
  FlowExecutionEventType.stepStarted: 'STEP_STARTED',
  FlowExecutionEventType.stepFailed: 'STEP_FAILED',
  FlowExecutionEventType.stepSucceeded: 'STEP_SUCCEEDED',
  FlowExecutionEventType.activityScheduled: 'ACTIVITY_SCHEDULED',
  FlowExecutionEventType.activityStarted: 'ACTIVITY_STARTED',
  FlowExecutionEventType.activityFailed: 'ACTIVITY_FAILED',
  FlowExecutionEventType.activitySucceeded: 'ACTIVITY_SUCCEEDED',
  FlowExecutionEventType.startFlowExecutionTask: 'START_FLOW_EXECUTION_TASK',
  FlowExecutionEventType.scheduleNextReadyStepsTask:
      'SCHEDULE_NEXT_READY_STEPS_TASK',
  FlowExecutionEventType.thingActionTask: 'THING_ACTION_TASK',
  FlowExecutionEventType.thingActionTaskFailed: 'THING_ACTION_TASK_FAILED',
  FlowExecutionEventType.thingActionTaskSucceeded:
      'THING_ACTION_TASK_SUCCEEDED',
  FlowExecutionEventType.acknowledgeTaskMessage: 'ACKNOWLEDGE_TASK_MESSAGE',
};

FlowExecutionSummary _$FlowExecutionSummaryFromJson(Map<String, dynamic> json) {
  return FlowExecutionSummary(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    flowExecutionId: json['flowExecutionId'] as String,
    flowTemplateId: json['flowTemplateId'] as String,
    status: _$enumDecodeNullable(_$FlowExecutionStatusEnumMap, json['status']),
    systemInstanceId: json['systemInstanceId'] as String,
    updatedAt: const UnixDateTimeConverter().fromJson(json['updatedAt']),
  );
}

const _$FlowExecutionStatusEnumMap = {
  FlowExecutionStatus.running: 'RUNNING',
  FlowExecutionStatus.aborted: 'ABORTED',
  FlowExecutionStatus.succeeded: 'SUCCEEDED',
  FlowExecutionStatus.failed: 'FAILED',
};

FlowTemplateDescription _$FlowTemplateDescriptionFromJson(
    Map<String, dynamic> json) {
  return FlowTemplateDescription(
    definition: json['definition'] == null
        ? null
        : DefinitionDocument.fromJson(
            json['definition'] as Map<String, dynamic>),
    summary: json['summary'] == null
        ? null
        : FlowTemplateSummary.fromJson(json['summary'] as Map<String, dynamic>),
    validatedNamespaceVersion: json['validatedNamespaceVersion'] as int,
  );
}

Map<String, dynamic> _$FlowTemplateFilterToJson(FlowTemplateFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$FlowTemplateFilterNameEnumMap[instance.name]);
  writeNotNull('value', instance.value);
  return val;
}

const _$FlowTemplateFilterNameEnumMap = {
  FlowTemplateFilterName.deviceModelId: 'DEVICE_MODEL_ID',
};

FlowTemplateSummary _$FlowTemplateSummaryFromJson(Map<String, dynamic> json) {
  return FlowTemplateSummary(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    id: json['id'] as String,
    revisionNumber: json['revisionNumber'] as int,
  );
}

GetEntitiesResponse _$GetEntitiesResponseFromJson(Map<String, dynamic> json) {
  return GetEntitiesResponse(
    descriptions: (json['descriptions'] as List)
        ?.map((e) => e == null
            ? null
            : EntityDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetFlowTemplateResponse _$GetFlowTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return GetFlowTemplateResponse(
    description: json['description'] == null
        ? null
        : FlowTemplateDescription.fromJson(
            json['description'] as Map<String, dynamic>),
  );
}

GetFlowTemplateRevisionsResponse _$GetFlowTemplateRevisionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetFlowTemplateRevisionsResponse(
    nextToken: json['nextToken'] as String,
    summaries: (json['summaries'] as List)
        ?.map((e) => e == null
            ? null
            : FlowTemplateSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetNamespaceDeletionStatusResponse _$GetNamespaceDeletionStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetNamespaceDeletionStatusResponse(
    errorCode: _$enumDecodeNullable(
        _$NamespaceDeletionStatusErrorCodesEnumMap, json['errorCode']),
    errorMessage: json['errorMessage'] as String,
    namespaceArn: json['namespaceArn'] as String,
    namespaceName: json['namespaceName'] as String,
    status:
        _$enumDecodeNullable(_$NamespaceDeletionStatusEnumMap, json['status']),
  );
}

const _$NamespaceDeletionStatusErrorCodesEnumMap = {
  NamespaceDeletionStatusErrorCodes.validationFailed: 'VALIDATION_FAILED',
};

const _$NamespaceDeletionStatusEnumMap = {
  NamespaceDeletionStatus.inProgress: 'IN_PROGRESS',
  NamespaceDeletionStatus.succeeded: 'SUCCEEDED',
  NamespaceDeletionStatus.failed: 'FAILED',
};

GetSystemInstanceResponse _$GetSystemInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return GetSystemInstanceResponse(
    description: json['description'] == null
        ? null
        : SystemInstanceDescription.fromJson(
            json['description'] as Map<String, dynamic>),
  );
}

GetSystemTemplateResponse _$GetSystemTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return GetSystemTemplateResponse(
    description: json['description'] == null
        ? null
        : SystemTemplateDescription.fromJson(
            json['description'] as Map<String, dynamic>),
  );
}

GetSystemTemplateRevisionsResponse _$GetSystemTemplateRevisionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetSystemTemplateRevisionsResponse(
    nextToken: json['nextToken'] as String,
    summaries: (json['summaries'] as List)
        ?.map((e) => e == null
            ? null
            : SystemTemplateSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetUploadStatusResponse _$GetUploadStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetUploadStatusResponse(
    createdDate: const UnixDateTimeConverter().fromJson(json['createdDate']),
    uploadId: json['uploadId'] as String,
    uploadStatus:
        _$enumDecodeNullable(_$UploadStatusEnumMap, json['uploadStatus']),
    failureReason:
        (json['failureReason'] as List)?.map((e) => e as String)?.toList(),
    namespaceArn: json['namespaceArn'] as String,
    namespaceName: json['namespaceName'] as String,
    namespaceVersion: json['namespaceVersion'] as int,
  );
}

const _$UploadStatusEnumMap = {
  UploadStatus.inProgress: 'IN_PROGRESS',
  UploadStatus.succeeded: 'SUCCEEDED',
  UploadStatus.failed: 'FAILED',
};

ListFlowExecutionMessagesResponse _$ListFlowExecutionMessagesResponseFromJson(
    Map<String, dynamic> json) {
  return ListFlowExecutionMessagesResponse(
    messages: (json['messages'] as List)
        ?.map((e) => e == null
            ? null
            : FlowExecutionMessage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    nextToken: json['nextToken'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MetricsConfiguration _$MetricsConfigurationFromJson(Map<String, dynamic> json) {
  return MetricsConfiguration(
    cloudMetricEnabled: json['cloudMetricEnabled'] as bool,
    metricRuleRoleArn: json['metricRuleRoleArn'] as String,
  );
}

Map<String, dynamic> _$MetricsConfigurationToJson(
    MetricsConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cloudMetricEnabled', instance.cloudMetricEnabled);
  writeNotNull('metricRuleRoleArn', instance.metricRuleRoleArn);
  return val;
}

SearchEntitiesResponse _$SearchEntitiesResponseFromJson(
    Map<String, dynamic> json) {
  return SearchEntitiesResponse(
    descriptions: (json['descriptions'] as List)
        ?.map((e) => e == null
            ? null
            : EntityDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

SearchFlowExecutionsResponse _$SearchFlowExecutionsResponseFromJson(
    Map<String, dynamic> json) {
  return SearchFlowExecutionsResponse(
    nextToken: json['nextToken'] as String,
    summaries: (json['summaries'] as List)
        ?.map((e) => e == null
            ? null
            : FlowExecutionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SearchFlowTemplatesResponse _$SearchFlowTemplatesResponseFromJson(
    Map<String, dynamic> json) {
  return SearchFlowTemplatesResponse(
    nextToken: json['nextToken'] as String,
    summaries: (json['summaries'] as List)
        ?.map((e) => e == null
            ? null
            : FlowTemplateSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SearchSystemInstancesResponse _$SearchSystemInstancesResponseFromJson(
    Map<String, dynamic> json) {
  return SearchSystemInstancesResponse(
    nextToken: json['nextToken'] as String,
    summaries: (json['summaries'] as List)
        ?.map((e) => e == null
            ? null
            : SystemInstanceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SearchSystemTemplatesResponse _$SearchSystemTemplatesResponseFromJson(
    Map<String, dynamic> json) {
  return SearchSystemTemplatesResponse(
    nextToken: json['nextToken'] as String,
    summaries: (json['summaries'] as List)
        ?.map((e) => e == null
            ? null
            : SystemTemplateSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SearchThingsResponse _$SearchThingsResponseFromJson(Map<String, dynamic> json) {
  return SearchThingsResponse(
    nextToken: json['nextToken'] as String,
    things: (json['things'] as List)
        ?.map(
            (e) => e == null ? null : Thing.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SystemInstanceDescription _$SystemInstanceDescriptionFromJson(
    Map<String, dynamic> json) {
  return SystemInstanceDescription(
    definition: json['definition'] == null
        ? null
        : DefinitionDocument.fromJson(
            json['definition'] as Map<String, dynamic>),
    flowActionsRoleArn: json['flowActionsRoleArn'] as String,
    metricsConfiguration: json['metricsConfiguration'] == null
        ? null
        : MetricsConfiguration.fromJson(
            json['metricsConfiguration'] as Map<String, dynamic>),
    s3BucketName: json['s3BucketName'] as String,
    summary: json['summary'] == null
        ? null
        : SystemInstanceSummary.fromJson(
            json['summary'] as Map<String, dynamic>),
    validatedDependencyRevisions: (json['validatedDependencyRevisions'] as List)
        ?.map((e) => e == null
            ? null
            : DependencyRevision.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    validatedNamespaceVersion: json['validatedNamespaceVersion'] as int,
  );
}

Map<String, dynamic> _$SystemInstanceFilterToJson(
    SystemInstanceFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$SystemInstanceFilterNameEnumMap[instance.name]);
  writeNotNull('value', instance.value);
  return val;
}

const _$SystemInstanceFilterNameEnumMap = {
  SystemInstanceFilterName.systemTemplateId: 'SYSTEM_TEMPLATE_ID',
  SystemInstanceFilterName.status: 'STATUS',
  SystemInstanceFilterName.greengrassGroupName: 'GREENGRASS_GROUP_NAME',
};

SystemInstanceSummary _$SystemInstanceSummaryFromJson(
    Map<String, dynamic> json) {
  return SystemInstanceSummary(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    greengrassGroupId: json['greengrassGroupId'] as String,
    greengrassGroupName: json['greengrassGroupName'] as String,
    greengrassGroupVersionId: json['greengrassGroupVersionId'] as String,
    id: json['id'] as String,
    status: _$enumDecodeNullable(
        _$SystemInstanceDeploymentStatusEnumMap, json['status']),
    target: _$enumDecodeNullable(_$DeploymentTargetEnumMap, json['target']),
    updatedAt: const UnixDateTimeConverter().fromJson(json['updatedAt']),
  );
}

const _$SystemInstanceDeploymentStatusEnumMap = {
  SystemInstanceDeploymentStatus.notDeployed: 'NOT_DEPLOYED',
  SystemInstanceDeploymentStatus.bootstrap: 'BOOTSTRAP',
  SystemInstanceDeploymentStatus.deployInProgress: 'DEPLOY_IN_PROGRESS',
  SystemInstanceDeploymentStatus.deployedInTarget: 'DEPLOYED_IN_TARGET',
  SystemInstanceDeploymentStatus.undeployInProgress: 'UNDEPLOY_IN_PROGRESS',
  SystemInstanceDeploymentStatus.failed: 'FAILED',
  SystemInstanceDeploymentStatus.pendingDelete: 'PENDING_DELETE',
  SystemInstanceDeploymentStatus.deletedInTarget: 'DELETED_IN_TARGET',
};

const _$DeploymentTargetEnumMap = {
  DeploymentTarget.greengrass: 'GREENGRASS',
  DeploymentTarget.cloud: 'CLOUD',
};

SystemTemplateDescription _$SystemTemplateDescriptionFromJson(
    Map<String, dynamic> json) {
  return SystemTemplateDescription(
    definition: json['definition'] == null
        ? null
        : DefinitionDocument.fromJson(
            json['definition'] as Map<String, dynamic>),
    summary: json['summary'] == null
        ? null
        : SystemTemplateSummary.fromJson(
            json['summary'] as Map<String, dynamic>),
    validatedNamespaceVersion: json['validatedNamespaceVersion'] as int,
  );
}

Map<String, dynamic> _$SystemTemplateFilterToJson(
    SystemTemplateFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$SystemTemplateFilterNameEnumMap[instance.name]);
  writeNotNull('value', instance.value);
  return val;
}

const _$SystemTemplateFilterNameEnumMap = {
  SystemTemplateFilterName.flowTemplateId: 'FLOW_TEMPLATE_ID',
};

SystemTemplateSummary _$SystemTemplateSummaryFromJson(
    Map<String, dynamic> json) {
  return SystemTemplateSummary(
    arn: json['arn'] as String,
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    id: json['id'] as String,
    revisionNumber: json['revisionNumber'] as int,
  );
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

Thing _$ThingFromJson(Map<String, dynamic> json) {
  return Thing(
    thingArn: json['thingArn'] as String,
    thingName: json['thingName'] as String,
  );
}

UndeploySystemInstanceResponse _$UndeploySystemInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return UndeploySystemInstanceResponse(
    summary: json['summary'] == null
        ? null
        : SystemInstanceSummary.fromJson(
            json['summary'] as Map<String, dynamic>),
  );
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateFlowTemplateResponse _$UpdateFlowTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFlowTemplateResponse(
    summary: json['summary'] == null
        ? null
        : FlowTemplateSummary.fromJson(json['summary'] as Map<String, dynamic>),
  );
}

UpdateSystemTemplateResponse _$UpdateSystemTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateSystemTemplateResponse(
    summary: json['summary'] == null
        ? null
        : SystemTemplateSummary.fromJson(
            json['summary'] as Map<String, dynamic>),
  );
}

UploadEntityDefinitionsResponse _$UploadEntityDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return UploadEntityDefinitionsResponse(
    uploadId: json['uploadId'] as String,
  );
}
