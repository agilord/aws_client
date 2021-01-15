// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-12-02.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessPolicySummary _$AccessPolicySummaryFromJson(Map<String, dynamic> json) {
  return AccessPolicySummary(
    id: json['id'] as String,
    identity: json['identity'] == null
        ? null
        : Identity.fromJson(json['identity'] as Map<String, dynamic>),
    permission: _$enumDecodeNullable(_$PermissionEnumMap, json['permission']),
    resource: json['resource'] == null
        ? null
        : Resource.fromJson(json['resource'] as Map<String, dynamic>),
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    lastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdateDate']),
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

const _$PermissionEnumMap = {
  Permission.administrator: 'ADMINISTRATOR',
  Permission.viewer: 'VIEWER',
};

AggregatedValue _$AggregatedValueFromJson(Map<String, dynamic> json) {
  return AggregatedValue(
    timestamp: const UnixDateTimeConverter().fromJson(json['timestamp']),
    value: json['value'] == null
        ? null
        : Aggregates.fromJson(json['value'] as Map<String, dynamic>),
    quality: _$enumDecodeNullable(_$QualityEnumMap, json['quality']),
  );
}

const _$QualityEnumMap = {
  Quality.good: 'GOOD',
  Quality.bad: 'BAD',
  Quality.uncertain: 'UNCERTAIN',
};

Aggregates _$AggregatesFromJson(Map<String, dynamic> json) {
  return Aggregates(
    average: (json['average'] as num)?.toDouble(),
    count: (json['count'] as num)?.toDouble(),
    maximum: (json['maximum'] as num)?.toDouble(),
    minimum: (json['minimum'] as num)?.toDouble(),
    standardDeviation: (json['standardDeviation'] as num)?.toDouble(),
    sum: (json['sum'] as num)?.toDouble(),
  );
}

AssetCompositeModel _$AssetCompositeModelFromJson(Map<String, dynamic> json) {
  return AssetCompositeModel(
    name: json['name'] as String,
    properties: (json['properties'] as List)
        ?.map((e) => e == null
            ? null
            : AssetProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    type: json['type'] as String,
    description: json['description'] as String,
  );
}

AssetErrorDetails _$AssetErrorDetailsFromJson(Map<String, dynamic> json) {
  return AssetErrorDetails(
    assetId: json['assetId'] as String,
    code: _$enumDecodeNullable(_$AssetErrorCodeEnumMap, json['code']),
    message: json['message'] as String,
  );
}

const _$AssetErrorCodeEnumMap = {
  AssetErrorCode.internalFailure: 'INTERNAL_FAILURE',
};

AssetHierarchy _$AssetHierarchyFromJson(Map<String, dynamic> json) {
  return AssetHierarchy(
    name: json['name'] as String,
    id: json['id'] as String,
  );
}

AssetHierarchyInfo _$AssetHierarchyInfoFromJson(Map<String, dynamic> json) {
  return AssetHierarchyInfo(
    childAssetId: json['childAssetId'] as String,
    parentAssetId: json['parentAssetId'] as String,
  );
}

AssetModelCompositeModel _$AssetModelCompositeModelFromJson(
    Map<String, dynamic> json) {
  return AssetModelCompositeModel(
    name: json['name'] as String,
    type: json['type'] as String,
    description: json['description'] as String,
    properties: (json['properties'] as List)
        ?.map((e) => e == null
            ? null
            : AssetModelProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AssetModelCompositeModelToJson(
    AssetModelCompositeModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('description', instance.description);
  writeNotNull(
      'properties', instance.properties?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$AssetModelCompositeModelDefinitionToJson(
    AssetModelCompositeModelDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('description', instance.description);
  writeNotNull(
      'properties', instance.properties?.map((e) => e?.toJson())?.toList());
  return val;
}

AssetModelHierarchy _$AssetModelHierarchyFromJson(Map<String, dynamic> json) {
  return AssetModelHierarchy(
    childAssetModelId: json['childAssetModelId'] as String,
    name: json['name'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$AssetModelHierarchyToJson(AssetModelHierarchy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('childAssetModelId', instance.childAssetModelId);
  writeNotNull('name', instance.name);
  writeNotNull('id', instance.id);
  return val;
}

Map<String, dynamic> _$AssetModelHierarchyDefinitionToJson(
    AssetModelHierarchyDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('childAssetModelId', instance.childAssetModelId);
  writeNotNull('name', instance.name);
  return val;
}

AssetModelProperty _$AssetModelPropertyFromJson(Map<String, dynamic> json) {
  return AssetModelProperty(
    dataType: _$enumDecodeNullable(_$PropertyDataTypeEnumMap, json['dataType']),
    name: json['name'] as String,
    type: json['type'] == null
        ? null
        : PropertyType.fromJson(json['type'] as Map<String, dynamic>),
    dataTypeSpec: json['dataTypeSpec'] as String,
    id: json['id'] as String,
    unit: json['unit'] as String,
  );
}

Map<String, dynamic> _$AssetModelPropertyToJson(AssetModelProperty instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataType', _$PropertyDataTypeEnumMap[instance.dataType]);
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type?.toJson());
  writeNotNull('dataTypeSpec', instance.dataTypeSpec);
  writeNotNull('id', instance.id);
  writeNotNull('unit', instance.unit);
  return val;
}

const _$PropertyDataTypeEnumMap = {
  PropertyDataType.string: 'STRING',
  PropertyDataType.integer: 'INTEGER',
  PropertyDataType.double: 'DOUBLE',
  PropertyDataType.boolean: 'BOOLEAN',
  PropertyDataType.struct: 'STRUCT',
};

Map<String, dynamic> _$AssetModelPropertyDefinitionToJson(
    AssetModelPropertyDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dataType', _$PropertyDataTypeEnumMap[instance.dataType]);
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type?.toJson());
  writeNotNull('dataTypeSpec', instance.dataTypeSpec);
  writeNotNull('unit', instance.unit);
  return val;
}

AssetModelStatus _$AssetModelStatusFromJson(Map<String, dynamic> json) {
  return AssetModelStatus(
    state: _$enumDecodeNullable(_$AssetModelStateEnumMap, json['state']),
    error: json['error'] == null
        ? null
        : ErrorDetails.fromJson(json['error'] as Map<String, dynamic>),
  );
}

const _$AssetModelStateEnumMap = {
  AssetModelState.creating: 'CREATING',
  AssetModelState.active: 'ACTIVE',
  AssetModelState.updating: 'UPDATING',
  AssetModelState.propagating: 'PROPAGATING',
  AssetModelState.deleting: 'DELETING',
  AssetModelState.failed: 'FAILED',
};

AssetModelSummary _$AssetModelSummaryFromJson(Map<String, dynamic> json) {
  return AssetModelSummary(
    arn: json['arn'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    description: json['description'] as String,
    id: json['id'] as String,
    lastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdateDate']),
    name: json['name'] as String,
    status: json['status'] == null
        ? null
        : AssetModelStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

AssetProperty _$AssetPropertyFromJson(Map<String, dynamic> json) {
  return AssetProperty(
    dataType: _$enumDecodeNullable(_$PropertyDataTypeEnumMap, json['dataType']),
    id: json['id'] as String,
    name: json['name'] as String,
    alias: json['alias'] as String,
    dataTypeSpec: json['dataTypeSpec'] as String,
    notification: json['notification'] == null
        ? null
        : PropertyNotification.fromJson(
            json['notification'] as Map<String, dynamic>),
    unit: json['unit'] as String,
  );
}

AssetPropertyValue _$AssetPropertyValueFromJson(Map<String, dynamic> json) {
  return AssetPropertyValue(
    timestamp: json['timestamp'] == null
        ? null
        : TimeInNanos.fromJson(json['timestamp'] as Map<String, dynamic>),
    value: json['value'] == null
        ? null
        : Variant.fromJson(json['value'] as Map<String, dynamic>),
    quality: _$enumDecodeNullable(_$QualityEnumMap, json['quality']),
  );
}

Map<String, dynamic> _$AssetPropertyValueToJson(AssetPropertyValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timestamp', instance.timestamp?.toJson());
  writeNotNull('value', instance.value?.toJson());
  writeNotNull('quality', _$QualityEnumMap[instance.quality]);
  return val;
}

AssetRelationshipSummary _$AssetRelationshipSummaryFromJson(
    Map<String, dynamic> json) {
  return AssetRelationshipSummary(
    relationshipType: _$enumDecodeNullable(
        _$AssetRelationshipTypeEnumMap, json['relationshipType']),
    hierarchyInfo: json['hierarchyInfo'] == null
        ? null
        : AssetHierarchyInfo.fromJson(
            json['hierarchyInfo'] as Map<String, dynamic>),
  );
}

const _$AssetRelationshipTypeEnumMap = {
  AssetRelationshipType.hierarchy: 'HIERARCHY',
};

AssetStatus _$AssetStatusFromJson(Map<String, dynamic> json) {
  return AssetStatus(
    state: _$enumDecodeNullable(_$AssetStateEnumMap, json['state']),
    error: json['error'] == null
        ? null
        : ErrorDetails.fromJson(json['error'] as Map<String, dynamic>),
  );
}

const _$AssetStateEnumMap = {
  AssetState.creating: 'CREATING',
  AssetState.active: 'ACTIVE',
  AssetState.updating: 'UPDATING',
  AssetState.deleting: 'DELETING',
  AssetState.failed: 'FAILED',
};

AssetSummary _$AssetSummaryFromJson(Map<String, dynamic> json) {
  return AssetSummary(
    arn: json['arn'] as String,
    assetModelId: json['assetModelId'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    hierarchies: (json['hierarchies'] as List)
        ?.map((e) => e == null
            ? null
            : AssetHierarchy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    lastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdateDate']),
    name: json['name'] as String,
    status: json['status'] == null
        ? null
        : AssetStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

AssociatedAssetsSummary _$AssociatedAssetsSummaryFromJson(
    Map<String, dynamic> json) {
  return AssociatedAssetsSummary(
    arn: json['arn'] as String,
    assetModelId: json['assetModelId'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    hierarchies: (json['hierarchies'] as List)
        ?.map((e) => e == null
            ? null
            : AssetHierarchy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    lastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdateDate']),
    name: json['name'] as String,
    status: json['status'] == null
        ? null
        : AssetStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    defaultValue: json['defaultValue'] as String,
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('defaultValue', instance.defaultValue);
  return val;
}

BatchAssociateProjectAssetsResponse
    _$BatchAssociateProjectAssetsResponseFromJson(Map<String, dynamic> json) {
  return BatchAssociateProjectAssetsResponse(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : AssetErrorDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchDisassociateProjectAssetsResponse
    _$BatchDisassociateProjectAssetsResponseFromJson(
        Map<String, dynamic> json) {
  return BatchDisassociateProjectAssetsResponse(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : AssetErrorDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchPutAssetPropertyError _$BatchPutAssetPropertyErrorFromJson(
    Map<String, dynamic> json) {
  return BatchPutAssetPropertyError(
    errorCode: _$enumDecodeNullable(
        _$BatchPutAssetPropertyValueErrorCodeEnumMap, json['errorCode']),
    errorMessage: json['errorMessage'] as String,
    timestamps: (json['timestamps'] as List)
        ?.map((e) =>
            e == null ? null : TimeInNanos.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$BatchPutAssetPropertyValueErrorCodeEnumMap = {
  BatchPutAssetPropertyValueErrorCode.resourceNotFoundException:
      'ResourceNotFoundException',
  BatchPutAssetPropertyValueErrorCode.invalidRequestException:
      'InvalidRequestException',
  BatchPutAssetPropertyValueErrorCode.internalFailureException:
      'InternalFailureException',
  BatchPutAssetPropertyValueErrorCode.serviceUnavailableException:
      'ServiceUnavailableException',
  BatchPutAssetPropertyValueErrorCode.throttlingException:
      'ThrottlingException',
  BatchPutAssetPropertyValueErrorCode.limitExceededException:
      'LimitExceededException',
  BatchPutAssetPropertyValueErrorCode.conflictingOperationException:
      'ConflictingOperationException',
  BatchPutAssetPropertyValueErrorCode.timestampOutOfRangeException:
      'TimestampOutOfRangeException',
  BatchPutAssetPropertyValueErrorCode.accessDeniedException:
      'AccessDeniedException',
};

BatchPutAssetPropertyErrorEntry _$BatchPutAssetPropertyErrorEntryFromJson(
    Map<String, dynamic> json) {
  return BatchPutAssetPropertyErrorEntry(
    entryId: json['entryId'] as String,
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchPutAssetPropertyError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchPutAssetPropertyValueResponse _$BatchPutAssetPropertyValueResponseFromJson(
    Map<String, dynamic> json) {
  return BatchPutAssetPropertyValueResponse(
    errorEntries: (json['errorEntries'] as List)
        ?.map((e) => e == null
            ? null
            : BatchPutAssetPropertyErrorEntry.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

CompositeModelProperty _$CompositeModelPropertyFromJson(
    Map<String, dynamic> json) {
  return CompositeModelProperty(
    assetProperty: json['assetProperty'] == null
        ? null
        : Property.fromJson(json['assetProperty'] as Map<String, dynamic>),
    name: json['name'] as String,
    type: json['type'] as String,
  );
}

ConfigurationErrorDetails _$ConfigurationErrorDetailsFromJson(
    Map<String, dynamic> json) {
  return ConfigurationErrorDetails(
    code: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['code']),
    message: json['message'] as String,
  );
}

const _$ErrorCodeEnumMap = {
  ErrorCode.validationError: 'VALIDATION_ERROR',
  ErrorCode.internalFailure: 'INTERNAL_FAILURE',
};

ConfigurationStatus _$ConfigurationStatusFromJson(Map<String, dynamic> json) {
  return ConfigurationStatus(
    state: _$enumDecodeNullable(_$ConfigurationStateEnumMap, json['state']),
    error: json['error'] == null
        ? null
        : ConfigurationErrorDetails.fromJson(
            json['error'] as Map<String, dynamic>),
  );
}

const _$ConfigurationStateEnumMap = {
  ConfigurationState.active: 'ACTIVE',
  ConfigurationState.updateInProgress: 'UPDATE_IN_PROGRESS',
  ConfigurationState.updateFailed: 'UPDATE_FAILED',
};

CreateAccessPolicyResponse _$CreateAccessPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAccessPolicyResponse(
    accessPolicyArn: json['accessPolicyArn'] as String,
    accessPolicyId: json['accessPolicyId'] as String,
  );
}

CreateAssetModelResponse _$CreateAssetModelResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAssetModelResponse(
    assetModelArn: json['assetModelArn'] as String,
    assetModelId: json['assetModelId'] as String,
    assetModelStatus: json['assetModelStatus'] == null
        ? null
        : AssetModelStatus.fromJson(
            json['assetModelStatus'] as Map<String, dynamic>),
  );
}

CreateAssetResponse _$CreateAssetResponseFromJson(Map<String, dynamic> json) {
  return CreateAssetResponse(
    assetArn: json['assetArn'] as String,
    assetId: json['assetId'] as String,
    assetStatus: json['assetStatus'] == null
        ? null
        : AssetStatus.fromJson(json['assetStatus'] as Map<String, dynamic>),
  );
}

CreateDashboardResponse _$CreateDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDashboardResponse(
    dashboardArn: json['dashboardArn'] as String,
    dashboardId: json['dashboardId'] as String,
  );
}

CreateGatewayResponse _$CreateGatewayResponseFromJson(
    Map<String, dynamic> json) {
  return CreateGatewayResponse(
    gatewayArn: json['gatewayArn'] as String,
    gatewayId: json['gatewayId'] as String,
  );
}

CreatePortalResponse _$CreatePortalResponseFromJson(Map<String, dynamic> json) {
  return CreatePortalResponse(
    portalArn: json['portalArn'] as String,
    portalId: json['portalId'] as String,
    portalStartUrl: json['portalStartUrl'] as String,
    portalStatus: json['portalStatus'] == null
        ? null
        : PortalStatus.fromJson(json['portalStatus'] as Map<String, dynamic>),
    ssoApplicationId: json['ssoApplicationId'] as String,
  );
}

CreateProjectResponse _$CreateProjectResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProjectResponse(
    projectArn: json['projectArn'] as String,
    projectId: json['projectId'] as String,
  );
}

DashboardSummary _$DashboardSummaryFromJson(Map<String, dynamic> json) {
  return DashboardSummary(
    id: json['id'] as String,
    name: json['name'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    description: json['description'] as String,
    lastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdateDate']),
  );
}

DeleteAccessPolicyResponse _$DeleteAccessPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAccessPolicyResponse();
}

DeleteAssetModelResponse _$DeleteAssetModelResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAssetModelResponse(
    assetModelStatus: json['assetModelStatus'] == null
        ? null
        : AssetModelStatus.fromJson(
            json['assetModelStatus'] as Map<String, dynamic>),
  );
}

DeleteAssetResponse _$DeleteAssetResponseFromJson(Map<String, dynamic> json) {
  return DeleteAssetResponse(
    assetStatus: json['assetStatus'] == null
        ? null
        : AssetStatus.fromJson(json['assetStatus'] as Map<String, dynamic>),
  );
}

DeleteDashboardResponse _$DeleteDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDashboardResponse();
}

DeletePortalResponse _$DeletePortalResponseFromJson(Map<String, dynamic> json) {
  return DeletePortalResponse(
    portalStatus: json['portalStatus'] == null
        ? null
        : PortalStatus.fromJson(json['portalStatus'] as Map<String, dynamic>),
  );
}

DeleteProjectResponse _$DeleteProjectResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProjectResponse();
}

DescribeAccessPolicyResponse _$DescribeAccessPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAccessPolicyResponse(
    accessPolicyArn: json['accessPolicyArn'] as String,
    accessPolicyCreationDate: const UnixDateTimeConverter()
        .fromJson(json['accessPolicyCreationDate']),
    accessPolicyId: json['accessPolicyId'] as String,
    accessPolicyIdentity: json['accessPolicyIdentity'] == null
        ? null
        : Identity.fromJson(
            json['accessPolicyIdentity'] as Map<String, dynamic>),
    accessPolicyLastUpdateDate: const UnixDateTimeConverter()
        .fromJson(json['accessPolicyLastUpdateDate']),
    accessPolicyPermission: _$enumDecodeNullable(
        _$PermissionEnumMap, json['accessPolicyPermission']),
    accessPolicyResource: json['accessPolicyResource'] == null
        ? null
        : Resource.fromJson(
            json['accessPolicyResource'] as Map<String, dynamic>),
  );
}

DescribeAssetModelResponse _$DescribeAssetModelResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAssetModelResponse(
    assetModelArn: json['assetModelArn'] as String,
    assetModelCreationDate:
        const UnixDateTimeConverter().fromJson(json['assetModelCreationDate']),
    assetModelDescription: json['assetModelDescription'] as String,
    assetModelHierarchies: (json['assetModelHierarchies'] as List)
        ?.map((e) => e == null
            ? null
            : AssetModelHierarchy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    assetModelId: json['assetModelId'] as String,
    assetModelLastUpdateDate: const UnixDateTimeConverter()
        .fromJson(json['assetModelLastUpdateDate']),
    assetModelName: json['assetModelName'] as String,
    assetModelProperties: (json['assetModelProperties'] as List)
        ?.map((e) => e == null
            ? null
            : AssetModelProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    assetModelStatus: json['assetModelStatus'] == null
        ? null
        : AssetModelStatus.fromJson(
            json['assetModelStatus'] as Map<String, dynamic>),
    assetModelCompositeModels: (json['assetModelCompositeModels'] as List)
        ?.map((e) => e == null
            ? null
            : AssetModelCompositeModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeAssetPropertyResponse _$DescribeAssetPropertyResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAssetPropertyResponse(
    assetId: json['assetId'] as String,
    assetModelId: json['assetModelId'] as String,
    assetName: json['assetName'] as String,
    assetProperty: json['assetProperty'] == null
        ? null
        : Property.fromJson(json['assetProperty'] as Map<String, dynamic>),
    compositeModel: json['compositeModel'] == null
        ? null
        : CompositeModelProperty.fromJson(
            json['compositeModel'] as Map<String, dynamic>),
  );
}

DescribeAssetResponse _$DescribeAssetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAssetResponse(
    assetArn: json['assetArn'] as String,
    assetCreationDate:
        const UnixDateTimeConverter().fromJson(json['assetCreationDate']),
    assetHierarchies: (json['assetHierarchies'] as List)
        ?.map((e) => e == null
            ? null
            : AssetHierarchy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    assetId: json['assetId'] as String,
    assetLastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['assetLastUpdateDate']),
    assetModelId: json['assetModelId'] as String,
    assetName: json['assetName'] as String,
    assetProperties: (json['assetProperties'] as List)
        ?.map((e) => e == null
            ? null
            : AssetProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    assetStatus: json['assetStatus'] == null
        ? null
        : AssetStatus.fromJson(json['assetStatus'] as Map<String, dynamic>),
    assetCompositeModels: (json['assetCompositeModels'] as List)
        ?.map((e) => e == null
            ? null
            : AssetCompositeModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeDashboardResponse _$DescribeDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDashboardResponse(
    dashboardArn: json['dashboardArn'] as String,
    dashboardCreationDate:
        const UnixDateTimeConverter().fromJson(json['dashboardCreationDate']),
    dashboardDefinition: json['dashboardDefinition'] as String,
    dashboardId: json['dashboardId'] as String,
    dashboardLastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['dashboardLastUpdateDate']),
    dashboardName: json['dashboardName'] as String,
    projectId: json['projectId'] as String,
    dashboardDescription: json['dashboardDescription'] as String,
  );
}

DescribeDefaultEncryptionConfigurationResponse
    _$DescribeDefaultEncryptionConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeDefaultEncryptionConfigurationResponse(
    configurationStatus: json['configurationStatus'] == null
        ? null
        : ConfigurationStatus.fromJson(
            json['configurationStatus'] as Map<String, dynamic>),
    encryptionType:
        _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['encryptionType']),
    kmsKeyArn: json['kmsKeyArn'] as String,
  );
}

const _$EncryptionTypeEnumMap = {
  EncryptionType.sitewiseDefaultEncryption: 'SITEWISE_DEFAULT_ENCRYPTION',
  EncryptionType.kmsBasedEncryption: 'KMS_BASED_ENCRYPTION',
};

DescribeGatewayCapabilityConfigurationResponse
    _$DescribeGatewayCapabilityConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeGatewayCapabilityConfigurationResponse(
    capabilityConfiguration: json['capabilityConfiguration'] as String,
    capabilityNamespace: json['capabilityNamespace'] as String,
    capabilitySyncStatus: _$enumDecodeNullable(
        _$CapabilitySyncStatusEnumMap, json['capabilitySyncStatus']),
    gatewayId: json['gatewayId'] as String,
  );
}

const _$CapabilitySyncStatusEnumMap = {
  CapabilitySyncStatus.inSync: 'IN_SYNC',
  CapabilitySyncStatus.outOfSync: 'OUT_OF_SYNC',
  CapabilitySyncStatus.syncFailed: 'SYNC_FAILED',
};

DescribeGatewayResponse _$DescribeGatewayResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeGatewayResponse(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    gatewayArn: json['gatewayArn'] as String,
    gatewayCapabilitySummaries: (json['gatewayCapabilitySummaries'] as List)
        ?.map((e) => e == null
            ? null
            : GatewayCapabilitySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gatewayId: json['gatewayId'] as String,
    gatewayName: json['gatewayName'] as String,
    lastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdateDate']),
    gatewayPlatform: json['gatewayPlatform'] == null
        ? null
        : GatewayPlatform.fromJson(
            json['gatewayPlatform'] as Map<String, dynamic>),
  );
}

DescribeLoggingOptionsResponse _$DescribeLoggingOptionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLoggingOptionsResponse(
    loggingOptions: json['loggingOptions'] == null
        ? null
        : LoggingOptions.fromJson(
            json['loggingOptions'] as Map<String, dynamic>),
  );
}

DescribePortalResponse _$DescribePortalResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePortalResponse(
    portalArn: json['portalArn'] as String,
    portalClientId: json['portalClientId'] as String,
    portalContactEmail: json['portalContactEmail'] as String,
    portalCreationDate:
        const UnixDateTimeConverter().fromJson(json['portalCreationDate']),
    portalId: json['portalId'] as String,
    portalLastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['portalLastUpdateDate']),
    portalName: json['portalName'] as String,
    portalStartUrl: json['portalStartUrl'] as String,
    portalStatus: json['portalStatus'] == null
        ? null
        : PortalStatus.fromJson(json['portalStatus'] as Map<String, dynamic>),
    portalAuthMode:
        _$enumDecodeNullable(_$AuthModeEnumMap, json['portalAuthMode']),
    portalDescription: json['portalDescription'] as String,
    portalLogoImageLocation: json['portalLogoImageLocation'] == null
        ? null
        : ImageLocation.fromJson(
            json['portalLogoImageLocation'] as Map<String, dynamic>),
    roleArn: json['roleArn'] as String,
  );
}

const _$AuthModeEnumMap = {
  AuthMode.iam: 'IAM',
  AuthMode.sso: 'SSO',
};

DescribeProjectResponse _$DescribeProjectResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProjectResponse(
    portalId: json['portalId'] as String,
    projectArn: json['projectArn'] as String,
    projectCreationDate:
        const UnixDateTimeConverter().fromJson(json['projectCreationDate']),
    projectId: json['projectId'] as String,
    projectLastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['projectLastUpdateDate']),
    projectName: json['projectName'] as String,
    projectDescription: json['projectDescription'] as String,
  );
}

ErrorDetails _$ErrorDetailsFromJson(Map<String, dynamic> json) {
  return ErrorDetails(
    code: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['code']),
    message: json['message'] as String,
  );
}

ExpressionVariable _$ExpressionVariableFromJson(Map<String, dynamic> json) {
  return ExpressionVariable(
    name: json['name'] as String,
    value: json['value'] == null
        ? null
        : VariableValue.fromJson(json['value'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ExpressionVariableToJson(ExpressionVariable instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value?.toJson());
  return val;
}

GatewayCapabilitySummary _$GatewayCapabilitySummaryFromJson(
    Map<String, dynamic> json) {
  return GatewayCapabilitySummary(
    capabilityNamespace: json['capabilityNamespace'] as String,
    capabilitySyncStatus: _$enumDecodeNullable(
        _$CapabilitySyncStatusEnumMap, json['capabilitySyncStatus']),
  );
}

GatewayPlatform _$GatewayPlatformFromJson(Map<String, dynamic> json) {
  return GatewayPlatform(
    greengrass: json['greengrass'] == null
        ? null
        : Greengrass.fromJson(json['greengrass'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GatewayPlatformToJson(GatewayPlatform instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('greengrass', instance.greengrass?.toJson());
  return val;
}

GatewaySummary _$GatewaySummaryFromJson(Map<String, dynamic> json) {
  return GatewaySummary(
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    gatewayId: json['gatewayId'] as String,
    gatewayName: json['gatewayName'] as String,
    lastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdateDate']),
    gatewayCapabilitySummaries: (json['gatewayCapabilitySummaries'] as List)
        ?.map((e) => e == null
            ? null
            : GatewayCapabilitySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetAssetPropertyAggregatesResponse _$GetAssetPropertyAggregatesResponseFromJson(
    Map<String, dynamic> json) {
  return GetAssetPropertyAggregatesResponse(
    aggregatedValues: (json['aggregatedValues'] as List)
        ?.map((e) => e == null
            ? null
            : AggregatedValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetAssetPropertyValueHistoryResponse
    _$GetAssetPropertyValueHistoryResponseFromJson(Map<String, dynamic> json) {
  return GetAssetPropertyValueHistoryResponse(
    assetPropertyValueHistory: (json['assetPropertyValueHistory'] as List)
        ?.map((e) => e == null
            ? null
            : AssetPropertyValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

GetAssetPropertyValueResponse _$GetAssetPropertyValueResponseFromJson(
    Map<String, dynamic> json) {
  return GetAssetPropertyValueResponse(
    propertyValue: json['propertyValue'] == null
        ? null
        : AssetPropertyValue.fromJson(
            json['propertyValue'] as Map<String, dynamic>),
  );
}

Greengrass _$GreengrassFromJson(Map<String, dynamic> json) {
  return Greengrass(
    groupArn: json['groupArn'] as String,
  );
}

Map<String, dynamic> _$GreengrassToJson(Greengrass instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('groupArn', instance.groupArn);
  return val;
}

GroupIdentity _$GroupIdentityFromJson(Map<String, dynamic> json) {
  return GroupIdentity(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$GroupIdentityToJson(GroupIdentity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

IAMUserIdentity _$IAMUserIdentityFromJson(Map<String, dynamic> json) {
  return IAMUserIdentity(
    arn: json['arn'] as String,
  );
}

Map<String, dynamic> _$IAMUserIdentityToJson(IAMUserIdentity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('arn', instance.arn);
  return val;
}

Identity _$IdentityFromJson(Map<String, dynamic> json) {
  return Identity(
    group: json['group'] == null
        ? null
        : GroupIdentity.fromJson(json['group'] as Map<String, dynamic>),
    iamUser: json['iamUser'] == null
        ? null
        : IAMUserIdentity.fromJson(json['iamUser'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : UserIdentity.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IdentityToJson(Identity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('group', instance.group?.toJson());
  writeNotNull('iamUser', instance.iamUser?.toJson());
  writeNotNull('user', instance.user?.toJson());
  return val;
}

Map<String, dynamic> _$ImageToJson(Image instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('file', instance.file?.toJson());
  writeNotNull('id', instance.id);
  return val;
}

Map<String, dynamic> _$ImageFileToJson(ImageFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', const Uint8ListConverter().toJson(instance.data));
  writeNotNull('type', _$ImageFileTypeEnumMap[instance.type]);
  return val;
}

const _$ImageFileTypeEnumMap = {
  ImageFileType.png: 'PNG',
};

ImageLocation _$ImageLocationFromJson(Map<String, dynamic> json) {
  return ImageLocation(
    id: json['id'] as String,
    url: json['url'] as String,
  );
}

ListAccessPoliciesResponse _$ListAccessPoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return ListAccessPoliciesResponse(
    accessPolicySummaries: (json['accessPolicySummaries'] as List)
        ?.map((e) => e == null
            ? null
            : AccessPolicySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAssetModelsResponse _$ListAssetModelsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssetModelsResponse(
    assetModelSummaries: (json['assetModelSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : AssetModelSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAssetRelationshipsResponse _$ListAssetRelationshipsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssetRelationshipsResponse(
    assetRelationshipSummaries: (json['assetRelationshipSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : AssetRelationshipSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAssetsResponse _$ListAssetsResponseFromJson(Map<String, dynamic> json) {
  return ListAssetsResponse(
    assetSummaries: (json['assetSummaries'] as List)
        ?.map((e) =>
            e == null ? null : AssetSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAssociatedAssetsResponse _$ListAssociatedAssetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssociatedAssetsResponse(
    assetSummaries: (json['assetSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : AssociatedAssetsSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListDashboardsResponse _$ListDashboardsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDashboardsResponse(
    dashboardSummaries: (json['dashboardSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : DashboardSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListGatewaysResponse _$ListGatewaysResponseFromJson(Map<String, dynamic> json) {
  return ListGatewaysResponse(
    gatewaySummaries: (json['gatewaySummaries'] as List)
        ?.map((e) => e == null
            ? null
            : GatewaySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListPortalsResponse _$ListPortalsResponseFromJson(Map<String, dynamic> json) {
  return ListPortalsResponse(
    nextToken: json['nextToken'] as String,
    portalSummaries: (json['portalSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : PortalSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListProjectAssetsResponse _$ListProjectAssetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListProjectAssetsResponse(
    assetIds: (json['assetIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListProjectsResponse _$ListProjectsResponseFromJson(Map<String, dynamic> json) {
  return ListProjectsResponse(
    projectSummaries: (json['projectSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

LoggingOptions _$LoggingOptionsFromJson(Map<String, dynamic> json) {
  return LoggingOptions(
    level: _$enumDecodeNullable(_$LoggingLevelEnumMap, json['level']),
  );
}

Map<String, dynamic> _$LoggingOptionsToJson(LoggingOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('level', _$LoggingLevelEnumMap[instance.level]);
  return val;
}

const _$LoggingLevelEnumMap = {
  LoggingLevel.error: 'ERROR',
  LoggingLevel.info: 'INFO',
  LoggingLevel.off: 'OFF',
};

Measurement _$MeasurementFromJson(Map<String, dynamic> json) {
  return Measurement();
}

Map<String, dynamic> _$MeasurementToJson(Measurement instance) =>
    <String, dynamic>{};

Metric _$MetricFromJson(Map<String, dynamic> json) {
  return Metric(
    expression: json['expression'] as String,
    variables: (json['variables'] as List)
        ?.map((e) => e == null
            ? null
            : ExpressionVariable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    window: json['window'] == null
        ? null
        : MetricWindow.fromJson(json['window'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MetricToJson(Metric instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expression', instance.expression);
  writeNotNull(
      'variables', instance.variables?.map((e) => e?.toJson())?.toList());
  writeNotNull('window', instance.window?.toJson());
  return val;
}

MetricWindow _$MetricWindowFromJson(Map<String, dynamic> json) {
  return MetricWindow(
    tumbling: json['tumbling'] == null
        ? null
        : TumblingWindow.fromJson(json['tumbling'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MetricWindowToJson(MetricWindow instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tumbling', instance.tumbling?.toJson());
  return val;
}

MonitorErrorDetails _$MonitorErrorDetailsFromJson(Map<String, dynamic> json) {
  return MonitorErrorDetails(
    code: _$enumDecodeNullable(_$MonitorErrorCodeEnumMap, json['code']),
    message: json['message'] as String,
  );
}

const _$MonitorErrorCodeEnumMap = {
  MonitorErrorCode.internalFailure: 'INTERNAL_FAILURE',
  MonitorErrorCode.validationError: 'VALIDATION_ERROR',
  MonitorErrorCode.limitExceeded: 'LIMIT_EXCEEDED',
};

PortalResource _$PortalResourceFromJson(Map<String, dynamic> json) {
  return PortalResource(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$PortalResourceToJson(PortalResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

PortalStatus _$PortalStatusFromJson(Map<String, dynamic> json) {
  return PortalStatus(
    state: _$enumDecodeNullable(_$PortalStateEnumMap, json['state']),
    error: json['error'] == null
        ? null
        : MonitorErrorDetails.fromJson(json['error'] as Map<String, dynamic>),
  );
}

const _$PortalStateEnumMap = {
  PortalState.creating: 'CREATING',
  PortalState.updating: 'UPDATING',
  PortalState.deleting: 'DELETING',
  PortalState.active: 'ACTIVE',
  PortalState.failed: 'FAILED',
};

PortalSummary _$PortalSummaryFromJson(Map<String, dynamic> json) {
  return PortalSummary(
    id: json['id'] as String,
    name: json['name'] as String,
    startUrl: json['startUrl'] as String,
    status: json['status'] == null
        ? null
        : PortalStatus.fromJson(json['status'] as Map<String, dynamic>),
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    description: json['description'] as String,
    lastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdateDate']),
    roleArn: json['roleArn'] as String,
  );
}

ProjectResource _$ProjectResourceFromJson(Map<String, dynamic> json) {
  return ProjectResource(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ProjectResourceToJson(ProjectResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

ProjectSummary _$ProjectSummaryFromJson(Map<String, dynamic> json) {
  return ProjectSummary(
    id: json['id'] as String,
    name: json['name'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['creationDate']),
    description: json['description'] as String,
    lastUpdateDate:
        const UnixDateTimeConverter().fromJson(json['lastUpdateDate']),
  );
}

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return Property(
    dataType: _$enumDecodeNullable(_$PropertyDataTypeEnumMap, json['dataType']),
    id: json['id'] as String,
    name: json['name'] as String,
    alias: json['alias'] as String,
    notification: json['notification'] == null
        ? null
        : PropertyNotification.fromJson(
            json['notification'] as Map<String, dynamic>),
    type: json['type'] == null
        ? null
        : PropertyType.fromJson(json['type'] as Map<String, dynamic>),
    unit: json['unit'] as String,
  );
}

PropertyNotification _$PropertyNotificationFromJson(Map<String, dynamic> json) {
  return PropertyNotification(
    state:
        _$enumDecodeNullable(_$PropertyNotificationStateEnumMap, json['state']),
    topic: json['topic'] as String,
  );
}

const _$PropertyNotificationStateEnumMap = {
  PropertyNotificationState.enabled: 'ENABLED',
  PropertyNotificationState.disabled: 'DISABLED',
};

PropertyType _$PropertyTypeFromJson(Map<String, dynamic> json) {
  return PropertyType(
    attribute: json['attribute'] == null
        ? null
        : Attribute.fromJson(json['attribute'] as Map<String, dynamic>),
    measurement: json['measurement'] == null
        ? null
        : Measurement.fromJson(json['measurement'] as Map<String, dynamic>),
    metric: json['metric'] == null
        ? null
        : Metric.fromJson(json['metric'] as Map<String, dynamic>),
    transform: json['transform'] == null
        ? null
        : Transform.fromJson(json['transform'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PropertyTypeToJson(PropertyType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attribute', instance.attribute?.toJson());
  writeNotNull('measurement', instance.measurement?.toJson());
  writeNotNull('metric', instance.metric?.toJson());
  writeNotNull('transform', instance.transform?.toJson());
  return val;
}

Map<String, dynamic> _$PutAssetPropertyValueEntryToJson(
    PutAssetPropertyValueEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('entryId', instance.entryId);
  writeNotNull('propertyValues',
      instance.propertyValues?.map((e) => e?.toJson())?.toList());
  writeNotNull('assetId', instance.assetId);
  writeNotNull('propertyAlias', instance.propertyAlias);
  writeNotNull('propertyId', instance.propertyId);
  return val;
}

PutDefaultEncryptionConfigurationResponse
    _$PutDefaultEncryptionConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return PutDefaultEncryptionConfigurationResponse(
    configurationStatus: json['configurationStatus'] == null
        ? null
        : ConfigurationStatus.fromJson(
            json['configurationStatus'] as Map<String, dynamic>),
    encryptionType:
        _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['encryptionType']),
    kmsKeyArn: json['kmsKeyArn'] as String,
  );
}

PutLoggingOptionsResponse _$PutLoggingOptionsResponseFromJson(
    Map<String, dynamic> json) {
  return PutLoggingOptionsResponse();
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    portal: json['portal'] == null
        ? null
        : PortalResource.fromJson(json['portal'] as Map<String, dynamic>),
    project: json['project'] == null
        ? null
        : ProjectResource.fromJson(json['project'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResourceToJson(Resource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('portal', instance.portal?.toJson());
  writeNotNull('project', instance.project?.toJson());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TimeInNanos _$TimeInNanosFromJson(Map<String, dynamic> json) {
  return TimeInNanos(
    timeInSeconds: json['timeInSeconds'] as int,
    offsetInNanos: json['offsetInNanos'] as int,
  );
}

Map<String, dynamic> _$TimeInNanosToJson(TimeInNanos instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timeInSeconds', instance.timeInSeconds);
  writeNotNull('offsetInNanos', instance.offsetInNanos);
  return val;
}

Transform _$TransformFromJson(Map<String, dynamic> json) {
  return Transform(
    expression: json['expression'] as String,
    variables: (json['variables'] as List)
        ?.map((e) => e == null
            ? null
            : ExpressionVariable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TransformToJson(Transform instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expression', instance.expression);
  writeNotNull(
      'variables', instance.variables?.map((e) => e?.toJson())?.toList());
  return val;
}

TumblingWindow _$TumblingWindowFromJson(Map<String, dynamic> json) {
  return TumblingWindow(
    interval: json['interval'] as String,
  );
}

Map<String, dynamic> _$TumblingWindowToJson(TumblingWindow instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('interval', instance.interval);
  return val;
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateAccessPolicyResponse _$UpdateAccessPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAccessPolicyResponse();
}

UpdateAssetModelResponse _$UpdateAssetModelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAssetModelResponse(
    assetModelStatus: json['assetModelStatus'] == null
        ? null
        : AssetModelStatus.fromJson(
            json['assetModelStatus'] as Map<String, dynamic>),
  );
}

UpdateAssetResponse _$UpdateAssetResponseFromJson(Map<String, dynamic> json) {
  return UpdateAssetResponse(
    assetStatus: json['assetStatus'] == null
        ? null
        : AssetStatus.fromJson(json['assetStatus'] as Map<String, dynamic>),
  );
}

UpdateDashboardResponse _$UpdateDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDashboardResponse();
}

UpdateGatewayCapabilityConfigurationResponse
    _$UpdateGatewayCapabilityConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateGatewayCapabilityConfigurationResponse(
    capabilityNamespace: json['capabilityNamespace'] as String,
    capabilitySyncStatus: _$enumDecodeNullable(
        _$CapabilitySyncStatusEnumMap, json['capabilitySyncStatus']),
  );
}

UpdatePortalResponse _$UpdatePortalResponseFromJson(Map<String, dynamic> json) {
  return UpdatePortalResponse(
    portalStatus: json['portalStatus'] == null
        ? null
        : PortalStatus.fromJson(json['portalStatus'] as Map<String, dynamic>),
  );
}

UpdateProjectResponse _$UpdateProjectResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProjectResponse();
}

UserIdentity _$UserIdentityFromJson(Map<String, dynamic> json) {
  return UserIdentity(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$UserIdentityToJson(UserIdentity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

VariableValue _$VariableValueFromJson(Map<String, dynamic> json) {
  return VariableValue(
    propertyId: json['propertyId'] as String,
    hierarchyId: json['hierarchyId'] as String,
  );
}

Map<String, dynamic> _$VariableValueToJson(VariableValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('propertyId', instance.propertyId);
  writeNotNull('hierarchyId', instance.hierarchyId);
  return val;
}

Variant _$VariantFromJson(Map<String, dynamic> json) {
  return Variant(
    booleanValue: json['booleanValue'] as bool,
    doubleValue: (json['doubleValue'] as num)?.toDouble(),
    integerValue: json['integerValue'] as int,
    stringValue: json['stringValue'] as String,
  );
}

Map<String, dynamic> _$VariantToJson(Variant instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('booleanValue', instance.booleanValue);
  writeNotNull('doubleValue', instance.doubleValue);
  writeNotNull('integerValue', instance.integerValue);
  writeNotNull('stringValue', instance.stringValue);
  return val;
}
