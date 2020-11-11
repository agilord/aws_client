// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AWSMigrationHub-2017-05-31.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationState _$ApplicationStateFromJson(Map<String, dynamic> json) {
  return ApplicationState(
    applicationId: json['ApplicationId'] as String,
    applicationStatus: _$enumDecodeNullable(
        _$ApplicationStatusEnumMap, json['ApplicationStatus']),
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
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

const _$ApplicationStatusEnumMap = {
  ApplicationStatus.notStarted: 'NOT_STARTED',
  ApplicationStatus.inProgress: 'IN_PROGRESS',
  ApplicationStatus.completed: 'COMPLETED',
};

Map<String, dynamic> _$AssociateCreatedArtifactRequestToJson(
    AssociateCreatedArtifactRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreatedArtifact', instance.createdArtifact?.toJson());
  writeNotNull('MigrationTaskName', instance.migrationTaskName);
  writeNotNull('ProgressUpdateStream', instance.progressUpdateStream);
  writeNotNull('DryRun', instance.dryRun);
  return val;
}

AssociateCreatedArtifactResult _$AssociateCreatedArtifactResultFromJson(
    Map<String, dynamic> json) {
  return AssociateCreatedArtifactResult();
}

Map<String, dynamic> _$AssociateDiscoveredResourceRequestToJson(
    AssociateDiscoveredResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DiscoveredResource', instance.discoveredResource?.toJson());
  writeNotNull('MigrationTaskName', instance.migrationTaskName);
  writeNotNull('ProgressUpdateStream', instance.progressUpdateStream);
  writeNotNull('DryRun', instance.dryRun);
  return val;
}

AssociateDiscoveredResourceResult _$AssociateDiscoveredResourceResultFromJson(
    Map<String, dynamic> json) {
  return AssociateDiscoveredResourceResult();
}

Map<String, dynamic> _$CreateProgressUpdateStreamRequestToJson(
    CreateProgressUpdateStreamRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProgressUpdateStreamName', instance.progressUpdateStreamName);
  writeNotNull('DryRun', instance.dryRun);
  return val;
}

CreateProgressUpdateStreamResult _$CreateProgressUpdateStreamResultFromJson(
    Map<String, dynamic> json) {
  return CreateProgressUpdateStreamResult();
}

CreatedArtifact _$CreatedArtifactFromJson(Map<String, dynamic> json) {
  return CreatedArtifact(
    name: json['Name'] as String,
    description: json['Description'] as String,
  );
}

Map<String, dynamic> _$CreatedArtifactToJson(CreatedArtifact instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Description', instance.description);
  return val;
}

Map<String, dynamic> _$DeleteProgressUpdateStreamRequestToJson(
    DeleteProgressUpdateStreamRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProgressUpdateStreamName', instance.progressUpdateStreamName);
  writeNotNull('DryRun', instance.dryRun);
  return val;
}

DeleteProgressUpdateStreamResult _$DeleteProgressUpdateStreamResultFromJson(
    Map<String, dynamic> json) {
  return DeleteProgressUpdateStreamResult();
}

Map<String, dynamic> _$DescribeApplicationStateRequestToJson(
    DescribeApplicationStateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationId', instance.applicationId);
  return val;
}

DescribeApplicationStateResult _$DescribeApplicationStateResultFromJson(
    Map<String, dynamic> json) {
  return DescribeApplicationStateResult(
    applicationStatus: _$enumDecodeNullable(
        _$ApplicationStatusEnumMap, json['ApplicationStatus']),
    lastUpdatedTime: unixTimestampFromJson(json['LastUpdatedTime']),
  );
}

Map<String, dynamic> _$DescribeMigrationTaskRequestToJson(
    DescribeMigrationTaskRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MigrationTaskName', instance.migrationTaskName);
  writeNotNull('ProgressUpdateStream', instance.progressUpdateStream);
  return val;
}

DescribeMigrationTaskResult _$DescribeMigrationTaskResultFromJson(
    Map<String, dynamic> json) {
  return DescribeMigrationTaskResult(
    migrationTask: json['MigrationTask'] == null
        ? null
        : MigrationTask.fromJson(json['MigrationTask'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DisassociateCreatedArtifactRequestToJson(
    DisassociateCreatedArtifactRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreatedArtifactName', instance.createdArtifactName);
  writeNotNull('MigrationTaskName', instance.migrationTaskName);
  writeNotNull('ProgressUpdateStream', instance.progressUpdateStream);
  writeNotNull('DryRun', instance.dryRun);
  return val;
}

DisassociateCreatedArtifactResult _$DisassociateCreatedArtifactResultFromJson(
    Map<String, dynamic> json) {
  return DisassociateCreatedArtifactResult();
}

Map<String, dynamic> _$DisassociateDiscoveredResourceRequestToJson(
    DisassociateDiscoveredResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfigurationId', instance.configurationId);
  writeNotNull('MigrationTaskName', instance.migrationTaskName);
  writeNotNull('ProgressUpdateStream', instance.progressUpdateStream);
  writeNotNull('DryRun', instance.dryRun);
  return val;
}

DisassociateDiscoveredResourceResult
    _$DisassociateDiscoveredResourceResultFromJson(Map<String, dynamic> json) {
  return DisassociateDiscoveredResourceResult();
}

DiscoveredResource _$DiscoveredResourceFromJson(Map<String, dynamic> json) {
  return DiscoveredResource(
    configurationId: json['ConfigurationId'] as String,
    description: json['Description'] as String,
  );
}

Map<String, dynamic> _$DiscoveredResourceToJson(DiscoveredResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfigurationId', instance.configurationId);
  writeNotNull('Description', instance.description);
  return val;
}

Map<String, dynamic> _$ImportMigrationTaskRequestToJson(
    ImportMigrationTaskRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MigrationTaskName', instance.migrationTaskName);
  writeNotNull('ProgressUpdateStream', instance.progressUpdateStream);
  writeNotNull('DryRun', instance.dryRun);
  return val;
}

ImportMigrationTaskResult _$ImportMigrationTaskResultFromJson(
    Map<String, dynamic> json) {
  return ImportMigrationTaskResult();
}

Map<String, dynamic> _$ListApplicationStatesRequestToJson(
    ListApplicationStatesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationIds', instance.applicationIds);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListApplicationStatesResult _$ListApplicationStatesResultFromJson(
    Map<String, dynamic> json) {
  return ListApplicationStatesResult(
    applicationStateList: (json['ApplicationStateList'] as List)
        ?.map((e) => e == null
            ? null
            : ApplicationState.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListCreatedArtifactsRequestToJson(
    ListCreatedArtifactsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MigrationTaskName', instance.migrationTaskName);
  writeNotNull('ProgressUpdateStream', instance.progressUpdateStream);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListCreatedArtifactsResult _$ListCreatedArtifactsResultFromJson(
    Map<String, dynamic> json) {
  return ListCreatedArtifactsResult(
    createdArtifactList: (json['CreatedArtifactList'] as List)
        ?.map((e) => e == null
            ? null
            : CreatedArtifact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListDiscoveredResourcesRequestToJson(
    ListDiscoveredResourcesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MigrationTaskName', instance.migrationTaskName);
  writeNotNull('ProgressUpdateStream', instance.progressUpdateStream);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListDiscoveredResourcesResult _$ListDiscoveredResourcesResultFromJson(
    Map<String, dynamic> json) {
  return ListDiscoveredResourcesResult(
    discoveredResourceList: (json['DiscoveredResourceList'] as List)
        ?.map((e) => e == null
            ? null
            : DiscoveredResource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListMigrationTasksRequestToJson(
    ListMigrationTasksRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('ResourceName', instance.resourceName);
  return val;
}

ListMigrationTasksResult _$ListMigrationTasksResultFromJson(
    Map<String, dynamic> json) {
  return ListMigrationTasksResult(
    migrationTaskSummaryList: (json['MigrationTaskSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : MigrationTaskSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListProgressUpdateStreamsRequestToJson(
    ListProgressUpdateStreamsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListProgressUpdateStreamsResult _$ListProgressUpdateStreamsResultFromJson(
    Map<String, dynamic> json) {
  return ListProgressUpdateStreamsResult(
    nextToken: json['NextToken'] as String,
    progressUpdateStreamSummaryList: (json['ProgressUpdateStreamSummaryList']
            as List)
        ?.map((e) => e == null
            ? null
            : ProgressUpdateStreamSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MigrationTask _$MigrationTaskFromJson(Map<String, dynamic> json) {
  return MigrationTask(
    migrationTaskName: json['MigrationTaskName'] as String,
    progressUpdateStream: json['ProgressUpdateStream'] as String,
    resourceAttributeList: (json['ResourceAttributeList'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    task: json['Task'] == null
        ? null
        : Task.fromJson(json['Task'] as Map<String, dynamic>),
    updateDateTime: unixTimestampFromJson(json['UpdateDateTime']),
  );
}

MigrationTaskSummary _$MigrationTaskSummaryFromJson(Map<String, dynamic> json) {
  return MigrationTaskSummary(
    migrationTaskName: json['MigrationTaskName'] as String,
    progressPercent: json['ProgressPercent'] as int,
    progressUpdateStream: json['ProgressUpdateStream'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
    statusDetail: json['StatusDetail'] as String,
    updateDateTime: unixTimestampFromJson(json['UpdateDateTime']),
  );
}

const _$StatusEnumMap = {
  Status.notStarted: 'NOT_STARTED',
  Status.inProgress: 'IN_PROGRESS',
  Status.failed: 'FAILED',
  Status.completed: 'COMPLETED',
};

Map<String, dynamic> _$NotifyApplicationStateRequestToJson(
    NotifyApplicationStateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationId', instance.applicationId);
  writeNotNull('Status', _$ApplicationStatusEnumMap[instance.status]);
  writeNotNull('DryRun', instance.dryRun);
  writeNotNull('UpdateDateTime', unixTimestampToJson(instance.updateDateTime));
  return val;
}

NotifyApplicationStateResult _$NotifyApplicationStateResultFromJson(
    Map<String, dynamic> json) {
  return NotifyApplicationStateResult();
}

Map<String, dynamic> _$NotifyMigrationTaskStateRequestToJson(
    NotifyMigrationTaskStateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MigrationTaskName', instance.migrationTaskName);
  writeNotNull('NextUpdateSeconds', instance.nextUpdateSeconds);
  writeNotNull('ProgressUpdateStream', instance.progressUpdateStream);
  writeNotNull('Task', instance.task?.toJson());
  writeNotNull('UpdateDateTime', unixTimestampToJson(instance.updateDateTime));
  writeNotNull('DryRun', instance.dryRun);
  return val;
}

NotifyMigrationTaskStateResult _$NotifyMigrationTaskStateResultFromJson(
    Map<String, dynamic> json) {
  return NotifyMigrationTaskStateResult();
}

ProgressUpdateStreamSummary _$ProgressUpdateStreamSummaryFromJson(
    Map<String, dynamic> json) {
  return ProgressUpdateStreamSummary(
    progressUpdateStreamName: json['ProgressUpdateStreamName'] as String,
  );
}

Map<String, dynamic> _$PutResourceAttributesRequestToJson(
    PutResourceAttributesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MigrationTaskName', instance.migrationTaskName);
  writeNotNull('ProgressUpdateStream', instance.progressUpdateStream);
  writeNotNull('ResourceAttributeList',
      instance.resourceAttributeList?.map((e) => e?.toJson())?.toList());
  writeNotNull('DryRun', instance.dryRun);
  return val;
}

PutResourceAttributesResult _$PutResourceAttributesResultFromJson(
    Map<String, dynamic> json) {
  return PutResourceAttributesResult();
}

ResourceAttribute _$ResourceAttributeFromJson(Map<String, dynamic> json) {
  return ResourceAttribute(
    type: _$enumDecodeNullable(_$ResourceAttributeTypeEnumMap, json['Type']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$ResourceAttributeToJson(ResourceAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$ResourceAttributeTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$ResourceAttributeTypeEnumMap = {
  ResourceAttributeType.ipv4Address: 'IPV4_ADDRESS',
  ResourceAttributeType.ipv6Address: 'IPV6_ADDRESS',
  ResourceAttributeType.macAddress: 'MAC_ADDRESS',
  ResourceAttributeType.fqdn: 'FQDN',
  ResourceAttributeType.vmManagerId: 'VM_MANAGER_ID',
  ResourceAttributeType.vmManagedObjectReference: 'VM_MANAGED_OBJECT_REFERENCE',
  ResourceAttributeType.vmName: 'VM_NAME',
  ResourceAttributeType.vmPath: 'VM_PATH',
  ResourceAttributeType.biosId: 'BIOS_ID',
  ResourceAttributeType.motherboardSerialNumber: 'MOTHERBOARD_SERIAL_NUMBER',
};

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
    progressPercent: json['ProgressPercent'] as int,
    statusDetail: json['StatusDetail'] as String,
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Status', _$StatusEnumMap[instance.status]);
  writeNotNull('ProgressPercent', instance.progressPercent);
  writeNotNull('StatusDetail', instance.statusDetail);
  return val;
}
