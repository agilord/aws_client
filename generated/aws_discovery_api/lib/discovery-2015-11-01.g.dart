// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery-2015-11-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentConfigurationStatus _$AgentConfigurationStatusFromJson(
    Map<String, dynamic> json) {
  return AgentConfigurationStatus(
    agentId: json['agentId'] as String,
    description: json['description'] as String,
    operationSucceeded: json['operationSucceeded'] as bool,
  );
}

AgentInfo _$AgentInfoFromJson(Map<String, dynamic> json) {
  return AgentInfo(
    agentId: json['agentId'] as String,
    agentNetworkInfoList: (json['agentNetworkInfoList'] as List)
        ?.map((e) => e == null
            ? null
            : AgentNetworkInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    agentType: json['agentType'] as String,
    collectionStatus: json['collectionStatus'] as String,
    connectorId: json['connectorId'] as String,
    health: _$enumDecodeNullable(_$AgentStatusEnumMap, json['health']),
    hostName: json['hostName'] as String,
    lastHealthPingTime: json['lastHealthPingTime'] as String,
    registeredTime: json['registeredTime'] as String,
    version: json['version'] as String,
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

const _$AgentStatusEnumMap = {
  AgentStatus.healthy: 'HEALTHY',
  AgentStatus.unhealthy: 'UNHEALTHY',
  AgentStatus.running: 'RUNNING',
  AgentStatus.unknown: 'UNKNOWN',
  AgentStatus.blacklisted: 'BLACKLISTED',
  AgentStatus.shutdown: 'SHUTDOWN',
};

AgentNetworkInfo _$AgentNetworkInfoFromJson(Map<String, dynamic> json) {
  return AgentNetworkInfo(
    ipAddress: json['ipAddress'] as String,
    macAddress: json['macAddress'] as String,
  );
}

Map<String, dynamic> _$AssociateConfigurationItemsToApplicationRequestToJson(
    AssociateConfigurationItemsToApplicationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'applicationConfigurationId', instance.applicationConfigurationId);
  writeNotNull('configurationIds', instance.configurationIds);
  return val;
}

AssociateConfigurationItemsToApplicationResponse
    _$AssociateConfigurationItemsToApplicationResponseFromJson(
        Map<String, dynamic> json) {
  return AssociateConfigurationItemsToApplicationResponse();
}

BatchDeleteImportDataError _$BatchDeleteImportDataErrorFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteImportDataError(
    errorCode: _$enumDecodeNullable(
        _$BatchDeleteImportDataErrorCodeEnumMap, json['errorCode']),
    errorDescription: json['errorDescription'] as String,
    importTaskId: json['importTaskId'] as String,
  );
}

const _$BatchDeleteImportDataErrorCodeEnumMap = {
  BatchDeleteImportDataErrorCode.notFound: 'NOT_FOUND',
  BatchDeleteImportDataErrorCode.internalServerError: 'INTERNAL_SERVER_ERROR',
  BatchDeleteImportDataErrorCode.overLimit: 'OVER_LIMIT',
};

Map<String, dynamic> _$BatchDeleteImportDataRequestToJson(
    BatchDeleteImportDataRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('importTaskIds', instance.importTaskIds);
  return val;
}

BatchDeleteImportDataResponse _$BatchDeleteImportDataResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteImportDataResponse(
    errors: (json['errors'] as List)
        ?.map((e) => e == null
            ? null
            : BatchDeleteImportDataError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ConfigurationTag _$ConfigurationTagFromJson(Map<String, dynamic> json) {
  return ConfigurationTag(
    configurationId: json['configurationId'] as String,
    configurationType: _$enumDecodeNullable(
        _$ConfigurationItemTypeEnumMap, json['configurationType']),
    key: json['key'] as String,
    timeOfCreation: unixTimestampFromJson(json['timeOfCreation']),
    value: json['value'] as String,
  );
}

const _$ConfigurationItemTypeEnumMap = {
  ConfigurationItemType.server: 'SERVER',
  ConfigurationItemType.process: 'PROCESS',
  ConfigurationItemType.connection: 'CONNECTION',
  ConfigurationItemType.application: 'APPLICATION',
};

ContinuousExportDescription _$ContinuousExportDescriptionFromJson(
    Map<String, dynamic> json) {
  return ContinuousExportDescription(
    dataSource: _$enumDecodeNullable(_$DataSourceEnumMap, json['dataSource']),
    exportId: json['exportId'] as String,
    s3Bucket: json['s3Bucket'] as String,
    schemaStorageConfig:
        (json['schemaStorageConfig'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    startTime: unixTimestampFromJson(json['startTime']),
    status:
        _$enumDecodeNullable(_$ContinuousExportStatusEnumMap, json['status']),
    statusDetail: json['statusDetail'] as String,
    stopTime: unixTimestampFromJson(json['stopTime']),
  );
}

const _$DataSourceEnumMap = {
  DataSource.agent: 'AGENT',
};

const _$ContinuousExportStatusEnumMap = {
  ContinuousExportStatus.startInProgress: 'START_IN_PROGRESS',
  ContinuousExportStatus.startFailed: 'START_FAILED',
  ContinuousExportStatus.active: 'ACTIVE',
  ContinuousExportStatus.error: 'ERROR',
  ContinuousExportStatus.stopInProgress: 'STOP_IN_PROGRESS',
  ContinuousExportStatus.stopFailed: 'STOP_FAILED',
  ContinuousExportStatus.inactive: 'INACTIVE',
};

Map<String, dynamic> _$CreateApplicationRequestToJson(
    CreateApplicationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  return val;
}

CreateApplicationResponse _$CreateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateApplicationResponse(
    configurationId: json['configurationId'] as String,
  );
}

Map<String, dynamic> _$CreateTagsRequestToJson(CreateTagsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('configurationIds', instance.configurationIds);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateTagsResponse _$CreateTagsResponseFromJson(Map<String, dynamic> json) {
  return CreateTagsResponse();
}

CustomerAgentInfo _$CustomerAgentInfoFromJson(Map<String, dynamic> json) {
  return CustomerAgentInfo(
    activeAgents: json['activeAgents'] as int,
    blackListedAgents: json['blackListedAgents'] as int,
    healthyAgents: json['healthyAgents'] as int,
    shutdownAgents: json['shutdownAgents'] as int,
    totalAgents: json['totalAgents'] as int,
    unhealthyAgents: json['unhealthyAgents'] as int,
    unknownAgents: json['unknownAgents'] as int,
  );
}

CustomerConnectorInfo _$CustomerConnectorInfoFromJson(
    Map<String, dynamic> json) {
  return CustomerConnectorInfo(
    activeConnectors: json['activeConnectors'] as int,
    blackListedConnectors: json['blackListedConnectors'] as int,
    healthyConnectors: json['healthyConnectors'] as int,
    shutdownConnectors: json['shutdownConnectors'] as int,
    totalConnectors: json['totalConnectors'] as int,
    unhealthyConnectors: json['unhealthyConnectors'] as int,
    unknownConnectors: json['unknownConnectors'] as int,
  );
}

Map<String, dynamic> _$DeleteApplicationsRequestToJson(
    DeleteApplicationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('configurationIds', instance.configurationIds);
  return val;
}

DeleteApplicationsResponse _$DeleteApplicationsResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApplicationsResponse();
}

Map<String, dynamic> _$DeleteTagsRequestToJson(DeleteTagsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('configurationIds', instance.configurationIds);
  writeNotNull('tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

DeleteTagsResponse _$DeleteTagsResponseFromJson(Map<String, dynamic> json) {
  return DeleteTagsResponse();
}

Map<String, dynamic> _$DescribeAgentsRequestToJson(
    DescribeAgentsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('agentIds', instance.agentIds);
  writeNotNull('filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeAgentsResponse _$DescribeAgentsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAgentsResponse(
    agentsInfo: (json['agentsInfo'] as List)
        ?.map((e) =>
            e == null ? null : AgentInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeConfigurationsRequestToJson(
    DescribeConfigurationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('configurationIds', instance.configurationIds);
  return val;
}

DescribeConfigurationsResponse _$DescribeConfigurationsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeConfigurationsResponse(
    configurations: (json['configurations'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, e as String),
            ))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeContinuousExportsRequestToJson(
    DescribeContinuousExportsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('exportIds', instance.exportIds);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeContinuousExportsResponse _$DescribeContinuousExportsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeContinuousExportsResponse(
    descriptions: (json['descriptions'] as List)
        ?.map((e) => e == null
            ? null
            : ContinuousExportDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeExportConfigurationsRequestToJson(
    DescribeExportConfigurationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('exportIds', instance.exportIds);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeExportConfigurationsResponse
    _$DescribeExportConfigurationsResponseFromJson(Map<String, dynamic> json) {
  return DescribeExportConfigurationsResponse(
    exportsInfo: (json['exportsInfo'] as List)
        ?.map((e) =>
            e == null ? null : ExportInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeExportTasksRequestToJson(
    DescribeExportTasksRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('exportIds', instance.exportIds);
  writeNotNull('filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeExportTasksResponse _$DescribeExportTasksResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeExportTasksResponse(
    exportsInfo: (json['exportsInfo'] as List)
        ?.map((e) =>
            e == null ? null : ExportInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$DescribeImportTasksRequestToJson(
    DescribeImportTasksRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeImportTasksResponse _$DescribeImportTasksResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeImportTasksResponse(
    nextToken: json['nextToken'] as String,
    tasks: (json['tasks'] as List)
        ?.map((e) =>
            e == null ? null : ImportTask.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeTagsRequestToJson(DescribeTagsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  return val;
}

DescribeTagsResponse _$DescribeTagsResponseFromJson(Map<String, dynamic> json) {
  return DescribeTagsResponse(
    nextToken: json['nextToken'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null
            ? null
            : ConfigurationTag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic>
    _$DisassociateConfigurationItemsFromApplicationRequestToJson(
        DisassociateConfigurationItemsFromApplicationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'applicationConfigurationId', instance.applicationConfigurationId);
  writeNotNull('configurationIds', instance.configurationIds);
  return val;
}

DisassociateConfigurationItemsFromApplicationResponse
    _$DisassociateConfigurationItemsFromApplicationResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateConfigurationItemsFromApplicationResponse();
}

ExportConfigurationsResponse _$ExportConfigurationsResponseFromJson(
    Map<String, dynamic> json) {
  return ExportConfigurationsResponse(
    exportId: json['exportId'] as String,
  );
}

Map<String, dynamic> _$ExportFilterToJson(ExportFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('condition', instance.condition);
  writeNotNull('name', instance.name);
  writeNotNull('values', instance.values);
  return val;
}

ExportInfo _$ExportInfoFromJson(Map<String, dynamic> json) {
  return ExportInfo(
    exportId: json['exportId'] as String,
    exportRequestTime: unixTimestampFromJson(json['exportRequestTime']),
    exportStatus:
        _$enumDecodeNullable(_$ExportStatusEnumMap, json['exportStatus']),
    statusMessage: json['statusMessage'] as String,
    configurationsDownloadUrl: json['configurationsDownloadUrl'] as String,
    isTruncated: json['isTruncated'] as bool,
    requestedEndTime: unixTimestampFromJson(json['requestedEndTime']),
    requestedStartTime: unixTimestampFromJson(json['requestedStartTime']),
  );
}

const _$ExportStatusEnumMap = {
  ExportStatus.failed: 'FAILED',
  ExportStatus.succeeded: 'SUCCEEDED',
  ExportStatus.inProgress: 'IN_PROGRESS',
};

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('condition', instance.condition);
  writeNotNull('name', instance.name);
  writeNotNull('values', instance.values);
  return val;
}

GetDiscoverySummaryResponse _$GetDiscoverySummaryResponseFromJson(
    Map<String, dynamic> json) {
  return GetDiscoverySummaryResponse(
    agentSummary: json['agentSummary'] == null
        ? null
        : CustomerAgentInfo.fromJson(
            json['agentSummary'] as Map<String, dynamic>),
    applications: json['applications'] as int,
    connectorSummary: json['connectorSummary'] == null
        ? null
        : CustomerConnectorInfo.fromJson(
            json['connectorSummary'] as Map<String, dynamic>),
    servers: json['servers'] as int,
    serversMappedToApplications: json['serversMappedToApplications'] as int,
    serversMappedtoTags: json['serversMappedtoTags'] as int,
  );
}

ImportTask _$ImportTaskFromJson(Map<String, dynamic> json) {
  return ImportTask(
    applicationImportFailure: json['applicationImportFailure'] as int,
    applicationImportSuccess: json['applicationImportSuccess'] as int,
    clientRequestToken: json['clientRequestToken'] as String,
    errorsAndFailedEntriesZip: json['errorsAndFailedEntriesZip'] as String,
    importCompletionTime: unixTimestampFromJson(json['importCompletionTime']),
    importDeletedTime: unixTimestampFromJson(json['importDeletedTime']),
    importRequestTime: unixTimestampFromJson(json['importRequestTime']),
    importTaskId: json['importTaskId'] as String,
    importUrl: json['importUrl'] as String,
    name: json['name'] as String,
    serverImportFailure: json['serverImportFailure'] as int,
    serverImportSuccess: json['serverImportSuccess'] as int,
    status: _$enumDecodeNullable(_$ImportStatusEnumMap, json['status']),
  );
}

const _$ImportStatusEnumMap = {
  ImportStatus.importInProgress: 'IMPORT_IN_PROGRESS',
  ImportStatus.importComplete: 'IMPORT_COMPLETE',
  ImportStatus.importCompleteWithErrors: 'IMPORT_COMPLETE_WITH_ERRORS',
  ImportStatus.importFailed: 'IMPORT_FAILED',
  ImportStatus.importFailedServerLimitExceeded:
      'IMPORT_FAILED_SERVER_LIMIT_EXCEEDED',
  ImportStatus.importFailedRecordLimitExceeded:
      'IMPORT_FAILED_RECORD_LIMIT_EXCEEDED',
  ImportStatus.deleteInProgress: 'DELETE_IN_PROGRESS',
  ImportStatus.deleteComplete: 'DELETE_COMPLETE',
  ImportStatus.deleteFailed: 'DELETE_FAILED',
  ImportStatus.deleteFailedLimitExceeded: 'DELETE_FAILED_LIMIT_EXCEEDED',
  ImportStatus.internalError: 'INTERNAL_ERROR',
};

Map<String, dynamic> _$ImportTaskFilterToJson(ImportTaskFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$ImportTaskFilterNameEnumMap[instance.name]);
  writeNotNull('values', instance.values);
  return val;
}

const _$ImportTaskFilterNameEnumMap = {
  ImportTaskFilterName.importTaskId: 'IMPORT_TASK_ID',
  ImportTaskFilterName.status: 'STATUS',
  ImportTaskFilterName.name: 'NAME',
};

Map<String, dynamic> _$ListConfigurationsRequestToJson(
    ListConfigurationsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('configurationType',
      _$ConfigurationItemTypeEnumMap[instance.configurationType]);
  writeNotNull('filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('orderBy', instance.orderBy?.map((e) => e?.toJson())?.toList());
  return val;
}

ListConfigurationsResponse _$ListConfigurationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListConfigurationsResponse(
    configurations: (json['configurations'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(k, e as String),
            ))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$ListServerNeighborsRequestToJson(
    ListServerNeighborsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('configurationId', instance.configurationId);
  writeNotNull('maxResults', instance.maxResults);
  writeNotNull('neighborConfigurationIds', instance.neighborConfigurationIds);
  writeNotNull('nextToken', instance.nextToken);
  writeNotNull('portInformationNeeded', instance.portInformationNeeded);
  return val;
}

ListServerNeighborsResponse _$ListServerNeighborsResponseFromJson(
    Map<String, dynamic> json) {
  return ListServerNeighborsResponse(
    neighbors: (json['neighbors'] as List)
        ?.map((e) => e == null
            ? null
            : NeighborConnectionDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    knownDependencyCount: json['knownDependencyCount'] as int,
    nextToken: json['nextToken'] as String,
  );
}

NeighborConnectionDetail _$NeighborConnectionDetailFromJson(
    Map<String, dynamic> json) {
  return NeighborConnectionDetail(
    connectionsCount: json['connectionsCount'] as int,
    destinationServerId: json['destinationServerId'] as String,
    sourceServerId: json['sourceServerId'] as String,
    destinationPort: json['destinationPort'] as int,
    transportProtocol: json['transportProtocol'] as String,
  );
}

Map<String, dynamic> _$OrderByElementToJson(OrderByElement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fieldName', instance.fieldName);
  writeNotNull('sortOrder', _$OrderStringEnumMap[instance.sortOrder]);
  return val;
}

const _$OrderStringEnumMap = {
  OrderString.asc: 'ASC',
  OrderString.desc: 'DESC',
};

StartContinuousExportResponse _$StartContinuousExportResponseFromJson(
    Map<String, dynamic> json) {
  return StartContinuousExportResponse(
    dataSource: _$enumDecodeNullable(_$DataSourceEnumMap, json['dataSource']),
    exportId: json['exportId'] as String,
    s3Bucket: json['s3Bucket'] as String,
    schemaStorageConfig:
        (json['schemaStorageConfig'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    startTime: unixTimestampFromJson(json['startTime']),
  );
}

Map<String, dynamic> _$StartDataCollectionByAgentIdsRequestToJson(
    StartDataCollectionByAgentIdsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('agentIds', instance.agentIds);
  return val;
}

StartDataCollectionByAgentIdsResponse
    _$StartDataCollectionByAgentIdsResponseFromJson(Map<String, dynamic> json) {
  return StartDataCollectionByAgentIdsResponse(
    agentsConfigurationStatus: (json['agentsConfigurationStatus'] as List)
        ?.map((e) => e == null
            ? null
            : AgentConfigurationStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StartExportTaskRequestToJson(
    StartExportTaskRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('endTime', unixTimestampToJson(instance.endTime));
  writeNotNull('exportDataFormat', instance.exportDataFormat);
  writeNotNull('filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('startTime', unixTimestampToJson(instance.startTime));
  return val;
}

StartExportTaskResponse _$StartExportTaskResponseFromJson(
    Map<String, dynamic> json) {
  return StartExportTaskResponse(
    exportId: json['exportId'] as String,
  );
}

Map<String, dynamic> _$StartImportTaskRequestToJson(
    StartImportTaskRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('importUrl', instance.importUrl);
  writeNotNull('name', instance.name);
  writeNotNull('clientRequestToken', instance.clientRequestToken);
  return val;
}

StartImportTaskResponse _$StartImportTaskResponseFromJson(
    Map<String, dynamic> json) {
  return StartImportTaskResponse(
    task: json['task'] == null
        ? null
        : ImportTask.fromJson(json['task'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StopContinuousExportRequestToJson(
    StopContinuousExportRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('exportId', instance.exportId);
  return val;
}

StopContinuousExportResponse _$StopContinuousExportResponseFromJson(
    Map<String, dynamic> json) {
  return StopContinuousExportResponse(
    startTime: unixTimestampFromJson(json['startTime']),
    stopTime: unixTimestampFromJson(json['stopTime']),
  );
}

Map<String, dynamic> _$StopDataCollectionByAgentIdsRequestToJson(
    StopDataCollectionByAgentIdsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('agentIds', instance.agentIds);
  return val;
}

StopDataCollectionByAgentIdsResponse
    _$StopDataCollectionByAgentIdsResponseFromJson(Map<String, dynamic> json) {
  return StopDataCollectionByAgentIdsResponse(
    agentsConfigurationStatus: (json['agentsConfigurationStatus'] as List)
        ?.map((e) => e == null
            ? null
            : AgentConfigurationStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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

Map<String, dynamic> _$TagFilterToJson(TagFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('values', instance.values);
  return val;
}

Map<String, dynamic> _$UpdateApplicationRequestToJson(
    UpdateApplicationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('configurationId', instance.configurationId);
  writeNotNull('description', instance.description);
  writeNotNull('name', instance.name);
  return val;
}

UpdateApplicationResponse _$UpdateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateApplicationResponse();
}
