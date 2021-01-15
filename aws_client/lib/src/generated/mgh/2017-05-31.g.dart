// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-05-31.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationState _$ApplicationStateFromJson(Map<String, dynamic> json) {
  return ApplicationState(
    applicationId: json['ApplicationId'] as String,
    applicationStatus: _$enumDecodeNullable(
        _$ApplicationStatusEnumMap, json['ApplicationStatus']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
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

AssociateCreatedArtifactResult _$AssociateCreatedArtifactResultFromJson(
    Map<String, dynamic> json) {
  return AssociateCreatedArtifactResult();
}

AssociateDiscoveredResourceResult _$AssociateDiscoveredResourceResultFromJson(
    Map<String, dynamic> json) {
  return AssociateDiscoveredResourceResult();
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

DeleteProgressUpdateStreamResult _$DeleteProgressUpdateStreamResultFromJson(
    Map<String, dynamic> json) {
  return DeleteProgressUpdateStreamResult();
}

DescribeApplicationStateResult _$DescribeApplicationStateResultFromJson(
    Map<String, dynamic> json) {
  return DescribeApplicationStateResult(
    applicationStatus: _$enumDecodeNullable(
        _$ApplicationStatusEnumMap, json['ApplicationStatus']),
    lastUpdatedTime:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedTime']),
  );
}

DescribeMigrationTaskResult _$DescribeMigrationTaskResultFromJson(
    Map<String, dynamic> json) {
  return DescribeMigrationTaskResult(
    migrationTask: json['MigrationTask'] == null
        ? null
        : MigrationTask.fromJson(json['MigrationTask'] as Map<String, dynamic>),
  );
}

DisassociateCreatedArtifactResult _$DisassociateCreatedArtifactResultFromJson(
    Map<String, dynamic> json) {
  return DisassociateCreatedArtifactResult();
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

ImportMigrationTaskResult _$ImportMigrationTaskResultFromJson(
    Map<String, dynamic> json) {
  return ImportMigrationTaskResult();
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
    updateDateTime:
        const UnixDateTimeConverter().fromJson(json['UpdateDateTime']),
  );
}

MigrationTaskSummary _$MigrationTaskSummaryFromJson(Map<String, dynamic> json) {
  return MigrationTaskSummary(
    migrationTaskName: json['MigrationTaskName'] as String,
    progressPercent: json['ProgressPercent'] as int,
    progressUpdateStream: json['ProgressUpdateStream'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
    statusDetail: json['StatusDetail'] as String,
    updateDateTime:
        const UnixDateTimeConverter().fromJson(json['UpdateDateTime']),
  );
}

const _$StatusEnumMap = {
  Status.notStarted: 'NOT_STARTED',
  Status.inProgress: 'IN_PROGRESS',
  Status.failed: 'FAILED',
  Status.completed: 'COMPLETED',
};

NotifyApplicationStateResult _$NotifyApplicationStateResultFromJson(
    Map<String, dynamic> json) {
  return NotifyApplicationStateResult();
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
