// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-05-23.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddApplicationCloudWatchLoggingOptionResponse
    _$AddApplicationCloudWatchLoggingOptionResponseFromJson(
        Map<String, dynamic> json) {
  return AddApplicationCloudWatchLoggingOptionResponse(
    applicationARN: json['ApplicationARN'] as String,
    applicationVersionId: json['ApplicationVersionId'] as int,
    cloudWatchLoggingOptionDescriptions:
        (json['CloudWatchLoggingOptionDescriptions'] as List)
            ?.map((e) => e == null
                ? null
                : CloudWatchLoggingOptionDescription.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

AddApplicationInputProcessingConfigurationResponse
    _$AddApplicationInputProcessingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return AddApplicationInputProcessingConfigurationResponse(
    applicationARN: json['ApplicationARN'] as String,
    applicationVersionId: json['ApplicationVersionId'] as int,
    inputId: json['InputId'] as String,
    inputProcessingConfigurationDescription:
        json['InputProcessingConfigurationDescription'] == null
            ? null
            : InputProcessingConfigurationDescription.fromJson(
                json['InputProcessingConfigurationDescription']
                    as Map<String, dynamic>),
  );
}

AddApplicationInputResponse _$AddApplicationInputResponseFromJson(
    Map<String, dynamic> json) {
  return AddApplicationInputResponse(
    applicationARN: json['ApplicationARN'] as String,
    applicationVersionId: json['ApplicationVersionId'] as int,
    inputDescriptions: (json['InputDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : InputDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AddApplicationOutputResponse _$AddApplicationOutputResponseFromJson(
    Map<String, dynamic> json) {
  return AddApplicationOutputResponse(
    applicationARN: json['ApplicationARN'] as String,
    applicationVersionId: json['ApplicationVersionId'] as int,
    outputDescriptions: (json['OutputDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : OutputDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AddApplicationReferenceDataSourceResponse
    _$AddApplicationReferenceDataSourceResponseFromJson(
        Map<String, dynamic> json) {
  return AddApplicationReferenceDataSourceResponse(
    applicationARN: json['ApplicationARN'] as String,
    applicationVersionId: json['ApplicationVersionId'] as int,
    referenceDataSourceDescriptions:
        (json['ReferenceDataSourceDescriptions'] as List)
            ?.map((e) => e == null
                ? null
                : ReferenceDataSourceDescription.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

AddApplicationVpcConfigurationResponse
    _$AddApplicationVpcConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return AddApplicationVpcConfigurationResponse(
    applicationARN: json['ApplicationARN'] as String,
    applicationVersionId: json['ApplicationVersionId'] as int,
    vpcConfigurationDescription: json['VpcConfigurationDescription'] == null
        ? null
        : VpcConfigurationDescription.fromJson(
            json['VpcConfigurationDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ApplicationCodeConfigurationToJson(
    ApplicationCodeConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CodeContentType', _$CodeContentTypeEnumMap[instance.codeContentType]);
  writeNotNull('CodeContent', instance.codeContent?.toJson());
  return val;
}

const _$CodeContentTypeEnumMap = {
  CodeContentType.plaintext: 'PLAINTEXT',
  CodeContentType.zipfile: 'ZIPFILE',
};

ApplicationCodeConfigurationDescription
    _$ApplicationCodeConfigurationDescriptionFromJson(
        Map<String, dynamic> json) {
  return ApplicationCodeConfigurationDescription(
    codeContentType:
        _$enumDecodeNullable(_$CodeContentTypeEnumMap, json['CodeContentType']),
    codeContentDescription: json['CodeContentDescription'] == null
        ? null
        : CodeContentDescription.fromJson(
            json['CodeContentDescription'] as Map<String, dynamic>),
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

Map<String, dynamic> _$ApplicationCodeConfigurationUpdateToJson(
    ApplicationCodeConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CodeContentTypeUpdate',
      _$CodeContentTypeEnumMap[instance.codeContentTypeUpdate]);
  writeNotNull('CodeContentUpdate', instance.codeContentUpdate?.toJson());
  return val;
}

Map<String, dynamic> _$ApplicationConfigurationToJson(
    ApplicationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationCodeConfiguration',
      instance.applicationCodeConfiguration?.toJson());
  writeNotNull('ApplicationSnapshotConfiguration',
      instance.applicationSnapshotConfiguration?.toJson());
  writeNotNull(
      'EnvironmentProperties', instance.environmentProperties?.toJson());
  writeNotNull('FlinkApplicationConfiguration',
      instance.flinkApplicationConfiguration?.toJson());
  writeNotNull('SqlApplicationConfiguration',
      instance.sqlApplicationConfiguration?.toJson());
  writeNotNull('VpcConfigurations',
      instance.vpcConfigurations?.map((e) => e?.toJson())?.toList());
  return val;
}

ApplicationConfigurationDescription
    _$ApplicationConfigurationDescriptionFromJson(Map<String, dynamic> json) {
  return ApplicationConfigurationDescription(
    applicationCodeConfigurationDescription:
        json['ApplicationCodeConfigurationDescription'] == null
            ? null
            : ApplicationCodeConfigurationDescription.fromJson(
                json['ApplicationCodeConfigurationDescription']
                    as Map<String, dynamic>),
    applicationSnapshotConfigurationDescription:
        json['ApplicationSnapshotConfigurationDescription'] == null
            ? null
            : ApplicationSnapshotConfigurationDescription.fromJson(
                json['ApplicationSnapshotConfigurationDescription']
                    as Map<String, dynamic>),
    environmentPropertyDescriptions: json['EnvironmentPropertyDescriptions'] ==
            null
        ? null
        : EnvironmentPropertyDescriptions.fromJson(
            json['EnvironmentPropertyDescriptions'] as Map<String, dynamic>),
    flinkApplicationConfigurationDescription:
        json['FlinkApplicationConfigurationDescription'] == null
            ? null
            : FlinkApplicationConfigurationDescription.fromJson(
                json['FlinkApplicationConfigurationDescription']
                    as Map<String, dynamic>),
    runConfigurationDescription: json['RunConfigurationDescription'] == null
        ? null
        : RunConfigurationDescription.fromJson(
            json['RunConfigurationDescription'] as Map<String, dynamic>),
    sqlApplicationConfigurationDescription:
        json['SqlApplicationConfigurationDescription'] == null
            ? null
            : SqlApplicationConfigurationDescription.fromJson(
                json['SqlApplicationConfigurationDescription']
                    as Map<String, dynamic>),
    vpcConfigurationDescriptions: (json['VpcConfigurationDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : VpcConfigurationDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ApplicationConfigurationUpdateToJson(
    ApplicationConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationCodeConfigurationUpdate',
      instance.applicationCodeConfigurationUpdate?.toJson());
  writeNotNull('ApplicationSnapshotConfigurationUpdate',
      instance.applicationSnapshotConfigurationUpdate?.toJson());
  writeNotNull('EnvironmentPropertyUpdates',
      instance.environmentPropertyUpdates?.toJson());
  writeNotNull('FlinkApplicationConfigurationUpdate',
      instance.flinkApplicationConfigurationUpdate?.toJson());
  writeNotNull('SqlApplicationConfigurationUpdate',
      instance.sqlApplicationConfigurationUpdate?.toJson());
  writeNotNull('VpcConfigurationUpdates',
      instance.vpcConfigurationUpdates?.map((e) => e?.toJson())?.toList());
  return val;
}

ApplicationDetail _$ApplicationDetailFromJson(Map<String, dynamic> json) {
  return ApplicationDetail(
    applicationARN: json['ApplicationARN'] as String,
    applicationName: json['ApplicationName'] as String,
    applicationStatus: _$enumDecodeNullable(
        _$ApplicationStatusEnumMap, json['ApplicationStatus']),
    applicationVersionId: json['ApplicationVersionId'] as int,
    runtimeEnvironment: _$enumDecodeNullable(
        _$RuntimeEnvironmentEnumMap, json['RuntimeEnvironment']),
    applicationConfigurationDescription:
        json['ApplicationConfigurationDescription'] == null
            ? null
            : ApplicationConfigurationDescription.fromJson(
                json['ApplicationConfigurationDescription']
                    as Map<String, dynamic>),
    applicationDescription: json['ApplicationDescription'] as String,
    cloudWatchLoggingOptionDescriptions:
        (json['CloudWatchLoggingOptionDescriptions'] as List)
            ?.map((e) => e == null
                ? null
                : CloudWatchLoggingOptionDescription.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    createTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreateTimestamp']),
    lastUpdateTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTimestamp']),
    serviceExecutionRole: json['ServiceExecutionRole'] as String,
  );
}

const _$ApplicationStatusEnumMap = {
  ApplicationStatus.deleting: 'DELETING',
  ApplicationStatus.starting: 'STARTING',
  ApplicationStatus.stopping: 'STOPPING',
  ApplicationStatus.ready: 'READY',
  ApplicationStatus.running: 'RUNNING',
  ApplicationStatus.updating: 'UPDATING',
  ApplicationStatus.autoscaling: 'AUTOSCALING',
  ApplicationStatus.forceStopping: 'FORCE_STOPPING',
};

const _$RuntimeEnvironmentEnumMap = {
  RuntimeEnvironment.sql_1_0: 'SQL-1_0',
  RuntimeEnvironment.flink_1_6: 'FLINK-1_6',
  RuntimeEnvironment.flink_1_8: 'FLINK-1_8',
  RuntimeEnvironment.flink_1_11: 'FLINK-1_11',
};

ApplicationRestoreConfiguration _$ApplicationRestoreConfigurationFromJson(
    Map<String, dynamic> json) {
  return ApplicationRestoreConfiguration(
    applicationRestoreType: _$enumDecodeNullable(
        _$ApplicationRestoreTypeEnumMap, json['ApplicationRestoreType']),
    snapshotName: json['SnapshotName'] as String,
  );
}

Map<String, dynamic> _$ApplicationRestoreConfigurationToJson(
    ApplicationRestoreConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationRestoreType',
      _$ApplicationRestoreTypeEnumMap[instance.applicationRestoreType]);
  writeNotNull('SnapshotName', instance.snapshotName);
  return val;
}

const _$ApplicationRestoreTypeEnumMap = {
  ApplicationRestoreType.skipRestoreFromSnapshot: 'SKIP_RESTORE_FROM_SNAPSHOT',
  ApplicationRestoreType.restoreFromLatestSnapshot:
      'RESTORE_FROM_LATEST_SNAPSHOT',
  ApplicationRestoreType.restoreFromCustomSnapshot:
      'RESTORE_FROM_CUSTOM_SNAPSHOT',
};

Map<String, dynamic> _$ApplicationSnapshotConfigurationToJson(
    ApplicationSnapshotConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SnapshotsEnabled', instance.snapshotsEnabled);
  return val;
}

ApplicationSnapshotConfigurationDescription
    _$ApplicationSnapshotConfigurationDescriptionFromJson(
        Map<String, dynamic> json) {
  return ApplicationSnapshotConfigurationDescription(
    snapshotsEnabled: json['SnapshotsEnabled'] as bool,
  );
}

Map<String, dynamic> _$ApplicationSnapshotConfigurationUpdateToJson(
    ApplicationSnapshotConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SnapshotsEnabledUpdate', instance.snapshotsEnabledUpdate);
  return val;
}

ApplicationSummary _$ApplicationSummaryFromJson(Map<String, dynamic> json) {
  return ApplicationSummary(
    applicationARN: json['ApplicationARN'] as String,
    applicationName: json['ApplicationName'] as String,
    applicationStatus: _$enumDecodeNullable(
        _$ApplicationStatusEnumMap, json['ApplicationStatus']),
    applicationVersionId: json['ApplicationVersionId'] as int,
    runtimeEnvironment: _$enumDecodeNullable(
        _$RuntimeEnvironmentEnumMap, json['RuntimeEnvironment']),
  );
}

CSVMappingParameters _$CSVMappingParametersFromJson(Map<String, dynamic> json) {
  return CSVMappingParameters(
    recordColumnDelimiter: json['RecordColumnDelimiter'] as String,
    recordRowDelimiter: json['RecordRowDelimiter'] as String,
  );
}

Map<String, dynamic> _$CSVMappingParametersToJson(
    CSVMappingParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RecordColumnDelimiter', instance.recordColumnDelimiter);
  writeNotNull('RecordRowDelimiter', instance.recordRowDelimiter);
  return val;
}

Map<String, dynamic> _$CheckpointConfigurationToJson(
    CheckpointConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfigurationType',
      _$ConfigurationTypeEnumMap[instance.configurationType]);
  writeNotNull('CheckpointInterval', instance.checkpointInterval);
  writeNotNull('CheckpointingEnabled', instance.checkpointingEnabled);
  writeNotNull(
      'MinPauseBetweenCheckpoints', instance.minPauseBetweenCheckpoints);
  return val;
}

const _$ConfigurationTypeEnumMap = {
  ConfigurationType.$default: 'DEFAULT',
  ConfigurationType.custom: 'CUSTOM',
};

CheckpointConfigurationDescription _$CheckpointConfigurationDescriptionFromJson(
    Map<String, dynamic> json) {
  return CheckpointConfigurationDescription(
    checkpointInterval: json['CheckpointInterval'] as int,
    checkpointingEnabled: json['CheckpointingEnabled'] as bool,
    configurationType: _$enumDecodeNullable(
        _$ConfigurationTypeEnumMap, json['ConfigurationType']),
    minPauseBetweenCheckpoints: json['MinPauseBetweenCheckpoints'] as int,
  );
}

Map<String, dynamic> _$CheckpointConfigurationUpdateToJson(
    CheckpointConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CheckpointIntervalUpdate', instance.checkpointIntervalUpdate);
  writeNotNull(
      'CheckpointingEnabledUpdate', instance.checkpointingEnabledUpdate);
  writeNotNull('ConfigurationTypeUpdate',
      _$ConfigurationTypeEnumMap[instance.configurationTypeUpdate]);
  writeNotNull('MinPauseBetweenCheckpointsUpdate',
      instance.minPauseBetweenCheckpointsUpdate);
  return val;
}

Map<String, dynamic> _$CloudWatchLoggingOptionToJson(
    CloudWatchLoggingOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LogStreamARN', instance.logStreamARN);
  return val;
}

CloudWatchLoggingOptionDescription _$CloudWatchLoggingOptionDescriptionFromJson(
    Map<String, dynamic> json) {
  return CloudWatchLoggingOptionDescription(
    logStreamARN: json['LogStreamARN'] as String,
    cloudWatchLoggingOptionId: json['CloudWatchLoggingOptionId'] as String,
    roleARN: json['RoleARN'] as String,
  );
}

Map<String, dynamic> _$CloudWatchLoggingOptionUpdateToJson(
    CloudWatchLoggingOptionUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CloudWatchLoggingOptionId', instance.cloudWatchLoggingOptionId);
  writeNotNull('LogStreamARNUpdate', instance.logStreamARNUpdate);
  return val;
}

Map<String, dynamic> _$CodeContentToJson(CodeContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3ContentLocation', instance.s3ContentLocation?.toJson());
  writeNotNull('TextContent', instance.textContent);
  writeNotNull('ZipFileContent',
      const Uint8ListConverter().toJson(instance.zipFileContent));
  return val;
}

CodeContentDescription _$CodeContentDescriptionFromJson(
    Map<String, dynamic> json) {
  return CodeContentDescription(
    codeMD5: json['CodeMD5'] as String,
    codeSize: json['CodeSize'] as int,
    s3ApplicationCodeLocationDescription:
        json['S3ApplicationCodeLocationDescription'] == null
            ? null
            : S3ApplicationCodeLocationDescription.fromJson(
                json['S3ApplicationCodeLocationDescription']
                    as Map<String, dynamic>),
    textContent: json['TextContent'] as String,
  );
}

Map<String, dynamic> _$CodeContentUpdateToJson(CodeContentUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'S3ContentLocationUpdate', instance.s3ContentLocationUpdate?.toJson());
  writeNotNull('TextContentUpdate', instance.textContentUpdate);
  writeNotNull('ZipFileContentUpdate',
      const Uint8ListConverter().toJson(instance.zipFileContentUpdate));
  return val;
}

CreateApplicationPresignedUrlResponse
    _$CreateApplicationPresignedUrlResponseFromJson(Map<String, dynamic> json) {
  return CreateApplicationPresignedUrlResponse(
    authorizedUrl: json['AuthorizedUrl'] as String,
  );
}

CreateApplicationResponse _$CreateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateApplicationResponse(
    applicationDetail: json['ApplicationDetail'] == null
        ? null
        : ApplicationDetail.fromJson(
            json['ApplicationDetail'] as Map<String, dynamic>),
  );
}

CreateApplicationSnapshotResponse _$CreateApplicationSnapshotResponseFromJson(
    Map<String, dynamic> json) {
  return CreateApplicationSnapshotResponse();
}

DeleteApplicationCloudWatchLoggingOptionResponse
    _$DeleteApplicationCloudWatchLoggingOptionResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteApplicationCloudWatchLoggingOptionResponse(
    applicationARN: json['ApplicationARN'] as String,
    applicationVersionId: json['ApplicationVersionId'] as int,
    cloudWatchLoggingOptionDescriptions:
        (json['CloudWatchLoggingOptionDescriptions'] as List)
            ?.map((e) => e == null
                ? null
                : CloudWatchLoggingOptionDescription.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

DeleteApplicationInputProcessingConfigurationResponse
    _$DeleteApplicationInputProcessingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteApplicationInputProcessingConfigurationResponse(
    applicationARN: json['ApplicationARN'] as String,
    applicationVersionId: json['ApplicationVersionId'] as int,
  );
}

DeleteApplicationOutputResponse _$DeleteApplicationOutputResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApplicationOutputResponse(
    applicationARN: json['ApplicationARN'] as String,
    applicationVersionId: json['ApplicationVersionId'] as int,
  );
}

DeleteApplicationReferenceDataSourceResponse
    _$DeleteApplicationReferenceDataSourceResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteApplicationReferenceDataSourceResponse(
    applicationARN: json['ApplicationARN'] as String,
    applicationVersionId: json['ApplicationVersionId'] as int,
  );
}

DeleteApplicationResponse _$DeleteApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApplicationResponse();
}

DeleteApplicationSnapshotResponse _$DeleteApplicationSnapshotResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApplicationSnapshotResponse();
}

DeleteApplicationVpcConfigurationResponse
    _$DeleteApplicationVpcConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteApplicationVpcConfigurationResponse(
    applicationARN: json['ApplicationARN'] as String,
    applicationVersionId: json['ApplicationVersionId'] as int,
  );
}

DescribeApplicationResponse _$DescribeApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeApplicationResponse(
    applicationDetail: json['ApplicationDetail'] == null
        ? null
        : ApplicationDetail.fromJson(
            json['ApplicationDetail'] as Map<String, dynamic>),
  );
}

DescribeApplicationSnapshotResponse
    _$DescribeApplicationSnapshotResponseFromJson(Map<String, dynamic> json) {
  return DescribeApplicationSnapshotResponse(
    snapshotDetails: json['SnapshotDetails'] == null
        ? null
        : SnapshotDetails.fromJson(
            json['SnapshotDetails'] as Map<String, dynamic>),
  );
}

DestinationSchema _$DestinationSchemaFromJson(Map<String, dynamic> json) {
  return DestinationSchema(
    recordFormatType: _$enumDecodeNullable(
        _$RecordFormatTypeEnumMap, json['RecordFormatType']),
  );
}

Map<String, dynamic> _$DestinationSchemaToJson(DestinationSchema instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'RecordFormatType', _$RecordFormatTypeEnumMap[instance.recordFormatType]);
  return val;
}

const _$RecordFormatTypeEnumMap = {
  RecordFormatType.json: 'JSON',
  RecordFormatType.csv: 'CSV',
};

DiscoverInputSchemaResponse _$DiscoverInputSchemaResponseFromJson(
    Map<String, dynamic> json) {
  return DiscoverInputSchemaResponse(
    inputSchema: json['InputSchema'] == null
        ? null
        : SourceSchema.fromJson(json['InputSchema'] as Map<String, dynamic>),
    parsedInputRecords: (json['ParsedInputRecords'] as List)
        ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
        ?.toList(),
    processedInputRecords: (json['ProcessedInputRecords'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    rawInputRecords:
        (json['RawInputRecords'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$EnvironmentPropertiesToJson(
    EnvironmentProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PropertyGroups',
      instance.propertyGroups?.map((e) => e?.toJson())?.toList());
  return val;
}

EnvironmentPropertyDescriptions _$EnvironmentPropertyDescriptionsFromJson(
    Map<String, dynamic> json) {
  return EnvironmentPropertyDescriptions(
    propertyGroupDescriptions: (json['PropertyGroupDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : PropertyGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EnvironmentPropertyUpdatesToJson(
    EnvironmentPropertyUpdates instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PropertyGroups',
      instance.propertyGroups?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$FlinkApplicationConfigurationToJson(
    FlinkApplicationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CheckpointConfiguration', instance.checkpointConfiguration?.toJson());
  writeNotNull(
      'MonitoringConfiguration', instance.monitoringConfiguration?.toJson());
  writeNotNull(
      'ParallelismConfiguration', instance.parallelismConfiguration?.toJson());
  return val;
}

FlinkApplicationConfigurationDescription
    _$FlinkApplicationConfigurationDescriptionFromJson(
        Map<String, dynamic> json) {
  return FlinkApplicationConfigurationDescription(
    checkpointConfigurationDescription:
        json['CheckpointConfigurationDescription'] == null
            ? null
            : CheckpointConfigurationDescription.fromJson(
                json['CheckpointConfigurationDescription']
                    as Map<String, dynamic>),
    jobPlanDescription: json['JobPlanDescription'] as String,
    monitoringConfigurationDescription:
        json['MonitoringConfigurationDescription'] == null
            ? null
            : MonitoringConfigurationDescription.fromJson(
                json['MonitoringConfigurationDescription']
                    as Map<String, dynamic>),
    parallelismConfigurationDescription:
        json['ParallelismConfigurationDescription'] == null
            ? null
            : ParallelismConfigurationDescription.fromJson(
                json['ParallelismConfigurationDescription']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FlinkApplicationConfigurationUpdateToJson(
    FlinkApplicationConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CheckpointConfigurationUpdate',
      instance.checkpointConfigurationUpdate?.toJson());
  writeNotNull('MonitoringConfigurationUpdate',
      instance.monitoringConfigurationUpdate?.toJson());
  writeNotNull('ParallelismConfigurationUpdate',
      instance.parallelismConfigurationUpdate?.toJson());
  return val;
}

FlinkRunConfiguration _$FlinkRunConfigurationFromJson(
    Map<String, dynamic> json) {
  return FlinkRunConfiguration(
    allowNonRestoredState: json['AllowNonRestoredState'] as bool,
  );
}

Map<String, dynamic> _$FlinkRunConfigurationToJson(
    FlinkRunConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowNonRestoredState', instance.allowNonRestoredState);
  return val;
}

Map<String, dynamic> _$InputToJson(Input instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InputSchema', instance.inputSchema?.toJson());
  writeNotNull('NamePrefix', instance.namePrefix);
  writeNotNull('InputParallelism', instance.inputParallelism?.toJson());
  writeNotNull('InputProcessingConfiguration',
      instance.inputProcessingConfiguration?.toJson());
  writeNotNull('KinesisFirehoseInput', instance.kinesisFirehoseInput?.toJson());
  writeNotNull('KinesisStreamsInput', instance.kinesisStreamsInput?.toJson());
  return val;
}

InputDescription _$InputDescriptionFromJson(Map<String, dynamic> json) {
  return InputDescription(
    inAppStreamNames:
        (json['InAppStreamNames'] as List)?.map((e) => e as String)?.toList(),
    inputId: json['InputId'] as String,
    inputParallelism: json['InputParallelism'] == null
        ? null
        : InputParallelism.fromJson(
            json['InputParallelism'] as Map<String, dynamic>),
    inputProcessingConfigurationDescription:
        json['InputProcessingConfigurationDescription'] == null
            ? null
            : InputProcessingConfigurationDescription.fromJson(
                json['InputProcessingConfigurationDescription']
                    as Map<String, dynamic>),
    inputSchema: json['InputSchema'] == null
        ? null
        : SourceSchema.fromJson(json['InputSchema'] as Map<String, dynamic>),
    inputStartingPositionConfiguration:
        json['InputStartingPositionConfiguration'] == null
            ? null
            : InputStartingPositionConfiguration.fromJson(
                json['InputStartingPositionConfiguration']
                    as Map<String, dynamic>),
    kinesisFirehoseInputDescription: json['KinesisFirehoseInputDescription'] ==
            null
        ? null
        : KinesisFirehoseInputDescription.fromJson(
            json['KinesisFirehoseInputDescription'] as Map<String, dynamic>),
    kinesisStreamsInputDescription:
        json['KinesisStreamsInputDescription'] == null
            ? null
            : KinesisStreamsInputDescription.fromJson(
                json['KinesisStreamsInputDescription'] as Map<String, dynamic>),
    namePrefix: json['NamePrefix'] as String,
  );
}

Map<String, dynamic> _$InputLambdaProcessorToJson(
    InputLambdaProcessor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  return val;
}

InputLambdaProcessorDescription _$InputLambdaProcessorDescriptionFromJson(
    Map<String, dynamic> json) {
  return InputLambdaProcessorDescription(
    resourceARN: json['ResourceARN'] as String,
    roleARN: json['RoleARN'] as String,
  );
}

Map<String, dynamic> _$InputLambdaProcessorUpdateToJson(
    InputLambdaProcessorUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARNUpdate', instance.resourceARNUpdate);
  return val;
}

InputParallelism _$InputParallelismFromJson(Map<String, dynamic> json) {
  return InputParallelism(
    count: json['Count'] as int,
  );
}

Map<String, dynamic> _$InputParallelismToJson(InputParallelism instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Count', instance.count);
  return val;
}

Map<String, dynamic> _$InputParallelismUpdateToJson(
    InputParallelismUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CountUpdate', instance.countUpdate);
  return val;
}

Map<String, dynamic> _$InputProcessingConfigurationToJson(
    InputProcessingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InputLambdaProcessor', instance.inputLambdaProcessor?.toJson());
  return val;
}

InputProcessingConfigurationDescription
    _$InputProcessingConfigurationDescriptionFromJson(
        Map<String, dynamic> json) {
  return InputProcessingConfigurationDescription(
    inputLambdaProcessorDescription: json['InputLambdaProcessorDescription'] ==
            null
        ? null
        : InputLambdaProcessorDescription.fromJson(
            json['InputLambdaProcessorDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InputProcessingConfigurationUpdateToJson(
    InputProcessingConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InputLambdaProcessorUpdate',
      instance.inputLambdaProcessorUpdate?.toJson());
  return val;
}

Map<String, dynamic> _$InputSchemaUpdateToJson(InputSchemaUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RecordColumnUpdates',
      instance.recordColumnUpdates?.map((e) => e?.toJson())?.toList());
  writeNotNull('RecordEncodingUpdate', instance.recordEncodingUpdate);
  writeNotNull('RecordFormatUpdate', instance.recordFormatUpdate?.toJson());
  return val;
}

InputStartingPositionConfiguration _$InputStartingPositionConfigurationFromJson(
    Map<String, dynamic> json) {
  return InputStartingPositionConfiguration(
    inputStartingPosition: _$enumDecodeNullable(
        _$InputStartingPositionEnumMap, json['InputStartingPosition']),
  );
}

Map<String, dynamic> _$InputStartingPositionConfigurationToJson(
    InputStartingPositionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InputStartingPosition',
      _$InputStartingPositionEnumMap[instance.inputStartingPosition]);
  return val;
}

const _$InputStartingPositionEnumMap = {
  InputStartingPosition.now: 'NOW',
  InputStartingPosition.trimHorizon: 'TRIM_HORIZON',
  InputStartingPosition.lastStoppedPoint: 'LAST_STOPPED_POINT',
};

Map<String, dynamic> _$InputUpdateToJson(InputUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InputId', instance.inputId);
  writeNotNull(
      'InputParallelismUpdate', instance.inputParallelismUpdate?.toJson());
  writeNotNull('InputProcessingConfigurationUpdate',
      instance.inputProcessingConfigurationUpdate?.toJson());
  writeNotNull('InputSchemaUpdate', instance.inputSchemaUpdate?.toJson());
  writeNotNull('KinesisFirehoseInputUpdate',
      instance.kinesisFirehoseInputUpdate?.toJson());
  writeNotNull('KinesisStreamsInputUpdate',
      instance.kinesisStreamsInputUpdate?.toJson());
  writeNotNull('NamePrefixUpdate', instance.namePrefixUpdate);
  return val;
}

JSONMappingParameters _$JSONMappingParametersFromJson(
    Map<String, dynamic> json) {
  return JSONMappingParameters(
    recordRowPath: json['RecordRowPath'] as String,
  );
}

Map<String, dynamic> _$JSONMappingParametersToJson(
    JSONMappingParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RecordRowPath', instance.recordRowPath);
  return val;
}

Map<String, dynamic> _$KinesisFirehoseInputToJson(
    KinesisFirehoseInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  return val;
}

KinesisFirehoseInputDescription _$KinesisFirehoseInputDescriptionFromJson(
    Map<String, dynamic> json) {
  return KinesisFirehoseInputDescription(
    resourceARN: json['ResourceARN'] as String,
    roleARN: json['RoleARN'] as String,
  );
}

Map<String, dynamic> _$KinesisFirehoseInputUpdateToJson(
    KinesisFirehoseInputUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARNUpdate', instance.resourceARNUpdate);
  return val;
}

Map<String, dynamic> _$KinesisFirehoseOutputToJson(
    KinesisFirehoseOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  return val;
}

KinesisFirehoseOutputDescription _$KinesisFirehoseOutputDescriptionFromJson(
    Map<String, dynamic> json) {
  return KinesisFirehoseOutputDescription(
    resourceARN: json['ResourceARN'] as String,
    roleARN: json['RoleARN'] as String,
  );
}

Map<String, dynamic> _$KinesisFirehoseOutputUpdateToJson(
    KinesisFirehoseOutputUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARNUpdate', instance.resourceARNUpdate);
  return val;
}

Map<String, dynamic> _$KinesisStreamsInputToJson(KinesisStreamsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  return val;
}

KinesisStreamsInputDescription _$KinesisStreamsInputDescriptionFromJson(
    Map<String, dynamic> json) {
  return KinesisStreamsInputDescription(
    resourceARN: json['ResourceARN'] as String,
    roleARN: json['RoleARN'] as String,
  );
}

Map<String, dynamic> _$KinesisStreamsInputUpdateToJson(
    KinesisStreamsInputUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARNUpdate', instance.resourceARNUpdate);
  return val;
}

Map<String, dynamic> _$KinesisStreamsOutputToJson(
    KinesisStreamsOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  return val;
}

KinesisStreamsOutputDescription _$KinesisStreamsOutputDescriptionFromJson(
    Map<String, dynamic> json) {
  return KinesisStreamsOutputDescription(
    resourceARN: json['ResourceARN'] as String,
    roleARN: json['RoleARN'] as String,
  );
}

Map<String, dynamic> _$KinesisStreamsOutputUpdateToJson(
    KinesisStreamsOutputUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARNUpdate', instance.resourceARNUpdate);
  return val;
}

Map<String, dynamic> _$LambdaOutputToJson(LambdaOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  return val;
}

LambdaOutputDescription _$LambdaOutputDescriptionFromJson(
    Map<String, dynamic> json) {
  return LambdaOutputDescription(
    resourceARN: json['ResourceARN'] as String,
    roleARN: json['RoleARN'] as String,
  );
}

Map<String, dynamic> _$LambdaOutputUpdateToJson(LambdaOutputUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARNUpdate', instance.resourceARNUpdate);
  return val;
}

ListApplicationSnapshotsResponse _$ListApplicationSnapshotsResponseFromJson(
    Map<String, dynamic> json) {
  return ListApplicationSnapshotsResponse(
    nextToken: json['NextToken'] as String,
    snapshotSummaries: (json['SnapshotSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : SnapshotDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListApplicationsResponse _$ListApplicationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListApplicationsResponse(
    applicationSummaries: (json['ApplicationSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ApplicationSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MappingParameters _$MappingParametersFromJson(Map<String, dynamic> json) {
  return MappingParameters(
    cSVMappingParameters: json['CSVMappingParameters'] == null
        ? null
        : CSVMappingParameters.fromJson(
            json['CSVMappingParameters'] as Map<String, dynamic>),
    jSONMappingParameters: json['JSONMappingParameters'] == null
        ? null
        : JSONMappingParameters.fromJson(
            json['JSONMappingParameters'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MappingParametersToJson(MappingParameters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CSVMappingParameters', instance.cSVMappingParameters?.toJson());
  writeNotNull(
      'JSONMappingParameters', instance.jSONMappingParameters?.toJson());
  return val;
}

Map<String, dynamic> _$MonitoringConfigurationToJson(
    MonitoringConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfigurationType',
      _$ConfigurationTypeEnumMap[instance.configurationType]);
  writeNotNull('LogLevel', _$LogLevelEnumMap[instance.logLevel]);
  writeNotNull('MetricsLevel', _$MetricsLevelEnumMap[instance.metricsLevel]);
  return val;
}

const _$LogLevelEnumMap = {
  LogLevel.info: 'INFO',
  LogLevel.warn: 'WARN',
  LogLevel.error: 'ERROR',
  LogLevel.debug: 'DEBUG',
};

const _$MetricsLevelEnumMap = {
  MetricsLevel.application: 'APPLICATION',
  MetricsLevel.task: 'TASK',
  MetricsLevel.operator: 'OPERATOR',
  MetricsLevel.parallelism: 'PARALLELISM',
};

MonitoringConfigurationDescription _$MonitoringConfigurationDescriptionFromJson(
    Map<String, dynamic> json) {
  return MonitoringConfigurationDescription(
    configurationType: _$enumDecodeNullable(
        _$ConfigurationTypeEnumMap, json['ConfigurationType']),
    logLevel: _$enumDecodeNullable(_$LogLevelEnumMap, json['LogLevel']),
    metricsLevel:
        _$enumDecodeNullable(_$MetricsLevelEnumMap, json['MetricsLevel']),
  );
}

Map<String, dynamic> _$MonitoringConfigurationUpdateToJson(
    MonitoringConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfigurationTypeUpdate',
      _$ConfigurationTypeEnumMap[instance.configurationTypeUpdate]);
  writeNotNull('LogLevelUpdate', _$LogLevelEnumMap[instance.logLevelUpdate]);
  writeNotNull(
      'MetricsLevelUpdate', _$MetricsLevelEnumMap[instance.metricsLevelUpdate]);
  return val;
}

Map<String, dynamic> _$OutputToJson(Output instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DestinationSchema', instance.destinationSchema?.toJson());
  writeNotNull('Name', instance.name);
  writeNotNull(
      'KinesisFirehoseOutput', instance.kinesisFirehoseOutput?.toJson());
  writeNotNull('KinesisStreamsOutput', instance.kinesisStreamsOutput?.toJson());
  writeNotNull('LambdaOutput', instance.lambdaOutput?.toJson());
  return val;
}

OutputDescription _$OutputDescriptionFromJson(Map<String, dynamic> json) {
  return OutputDescription(
    destinationSchema: json['DestinationSchema'] == null
        ? null
        : DestinationSchema.fromJson(
            json['DestinationSchema'] as Map<String, dynamic>),
    kinesisFirehoseOutputDescription:
        json['KinesisFirehoseOutputDescription'] == null
            ? null
            : KinesisFirehoseOutputDescription.fromJson(
                json['KinesisFirehoseOutputDescription']
                    as Map<String, dynamic>),
    kinesisStreamsOutputDescription: json['KinesisStreamsOutputDescription'] ==
            null
        ? null
        : KinesisStreamsOutputDescription.fromJson(
            json['KinesisStreamsOutputDescription'] as Map<String, dynamic>),
    lambdaOutputDescription: json['LambdaOutputDescription'] == null
        ? null
        : LambdaOutputDescription.fromJson(
            json['LambdaOutputDescription'] as Map<String, dynamic>),
    name: json['Name'] as String,
    outputId: json['OutputId'] as String,
  );
}

Map<String, dynamic> _$OutputUpdateToJson(OutputUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OutputId', instance.outputId);
  writeNotNull(
      'DestinationSchemaUpdate', instance.destinationSchemaUpdate?.toJson());
  writeNotNull('KinesisFirehoseOutputUpdate',
      instance.kinesisFirehoseOutputUpdate?.toJson());
  writeNotNull('KinesisStreamsOutputUpdate',
      instance.kinesisStreamsOutputUpdate?.toJson());
  writeNotNull('LambdaOutputUpdate', instance.lambdaOutputUpdate?.toJson());
  writeNotNull('NameUpdate', instance.nameUpdate);
  return val;
}

Map<String, dynamic> _$ParallelismConfigurationToJson(
    ParallelismConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfigurationType',
      _$ConfigurationTypeEnumMap[instance.configurationType]);
  writeNotNull('AutoScalingEnabled', instance.autoScalingEnabled);
  writeNotNull('Parallelism', instance.parallelism);
  writeNotNull('ParallelismPerKPU', instance.parallelismPerKPU);
  return val;
}

ParallelismConfigurationDescription
    _$ParallelismConfigurationDescriptionFromJson(Map<String, dynamic> json) {
  return ParallelismConfigurationDescription(
    autoScalingEnabled: json['AutoScalingEnabled'] as bool,
    configurationType: _$enumDecodeNullable(
        _$ConfigurationTypeEnumMap, json['ConfigurationType']),
    currentParallelism: json['CurrentParallelism'] as int,
    parallelism: json['Parallelism'] as int,
    parallelismPerKPU: json['ParallelismPerKPU'] as int,
  );
}

Map<String, dynamic> _$ParallelismConfigurationUpdateToJson(
    ParallelismConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AutoScalingEnabledUpdate', instance.autoScalingEnabledUpdate);
  writeNotNull('ConfigurationTypeUpdate',
      _$ConfigurationTypeEnumMap[instance.configurationTypeUpdate]);
  writeNotNull('ParallelismPerKPUUpdate', instance.parallelismPerKPUUpdate);
  writeNotNull('ParallelismUpdate', instance.parallelismUpdate);
  return val;
}

PropertyGroup _$PropertyGroupFromJson(Map<String, dynamic> json) {
  return PropertyGroup(
    propertyGroupId: json['PropertyGroupId'] as String,
    propertyMap: (json['PropertyMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$PropertyGroupToJson(PropertyGroup instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PropertyGroupId', instance.propertyGroupId);
  writeNotNull('PropertyMap', instance.propertyMap);
  return val;
}

RecordColumn _$RecordColumnFromJson(Map<String, dynamic> json) {
  return RecordColumn(
    name: json['Name'] as String,
    sqlType: json['SqlType'] as String,
    mapping: json['Mapping'] as String,
  );
}

Map<String, dynamic> _$RecordColumnToJson(RecordColumn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('SqlType', instance.sqlType);
  writeNotNull('Mapping', instance.mapping);
  return val;
}

RecordFormat _$RecordFormatFromJson(Map<String, dynamic> json) {
  return RecordFormat(
    recordFormatType: _$enumDecodeNullable(
        _$RecordFormatTypeEnumMap, json['RecordFormatType']),
    mappingParameters: json['MappingParameters'] == null
        ? null
        : MappingParameters.fromJson(
            json['MappingParameters'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RecordFormatToJson(RecordFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'RecordFormatType', _$RecordFormatTypeEnumMap[instance.recordFormatType]);
  writeNotNull('MappingParameters', instance.mappingParameters?.toJson());
  return val;
}

Map<String, dynamic> _$ReferenceDataSourceToJson(ReferenceDataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReferenceSchema', instance.referenceSchema?.toJson());
  writeNotNull('TableName', instance.tableName);
  writeNotNull(
      'S3ReferenceDataSource', instance.s3ReferenceDataSource?.toJson());
  return val;
}

ReferenceDataSourceDescription _$ReferenceDataSourceDescriptionFromJson(
    Map<String, dynamic> json) {
  return ReferenceDataSourceDescription(
    referenceId: json['ReferenceId'] as String,
    s3ReferenceDataSourceDescription:
        json['S3ReferenceDataSourceDescription'] == null
            ? null
            : S3ReferenceDataSourceDescription.fromJson(
                json['S3ReferenceDataSourceDescription']
                    as Map<String, dynamic>),
    tableName: json['TableName'] as String,
    referenceSchema: json['ReferenceSchema'] == null
        ? null
        : SourceSchema.fromJson(
            json['ReferenceSchema'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReferenceDataSourceUpdateToJson(
    ReferenceDataSourceUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReferenceId', instance.referenceId);
  writeNotNull(
      'ReferenceSchemaUpdate', instance.referenceSchemaUpdate?.toJson());
  writeNotNull('S3ReferenceDataSourceUpdate',
      instance.s3ReferenceDataSourceUpdate?.toJson());
  writeNotNull('TableNameUpdate', instance.tableNameUpdate);
  return val;
}

Map<String, dynamic> _$RunConfigurationToJson(RunConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationRestoreConfiguration',
      instance.applicationRestoreConfiguration?.toJson());
  writeNotNull(
      'FlinkRunConfiguration', instance.flinkRunConfiguration?.toJson());
  writeNotNull('SqlRunConfigurations',
      instance.sqlRunConfigurations?.map((e) => e?.toJson())?.toList());
  return val;
}

RunConfigurationDescription _$RunConfigurationDescriptionFromJson(
    Map<String, dynamic> json) {
  return RunConfigurationDescription(
    applicationRestoreConfigurationDescription:
        json['ApplicationRestoreConfigurationDescription'] == null
            ? null
            : ApplicationRestoreConfiguration.fromJson(
                json['ApplicationRestoreConfigurationDescription']
                    as Map<String, dynamic>),
    flinkRunConfigurationDescription:
        json['FlinkRunConfigurationDescription'] == null
            ? null
            : FlinkRunConfiguration.fromJson(
                json['FlinkRunConfigurationDescription']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RunConfigurationUpdateToJson(
    RunConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationRestoreConfiguration',
      instance.applicationRestoreConfiguration?.toJson());
  writeNotNull(
      'FlinkRunConfiguration', instance.flinkRunConfiguration?.toJson());
  return val;
}

S3ApplicationCodeLocationDescription
    _$S3ApplicationCodeLocationDescriptionFromJson(Map<String, dynamic> json) {
  return S3ApplicationCodeLocationDescription(
    bucketARN: json['BucketARN'] as String,
    fileKey: json['FileKey'] as String,
    objectVersion: json['ObjectVersion'] as String,
  );
}

Map<String, dynamic> _$S3ConfigurationToJson(S3Configuration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketARN', instance.bucketARN);
  writeNotNull('FileKey', instance.fileKey);
  return val;
}

Map<String, dynamic> _$S3ContentLocationToJson(S3ContentLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketARN', instance.bucketARN);
  writeNotNull('FileKey', instance.fileKey);
  writeNotNull('ObjectVersion', instance.objectVersion);
  return val;
}

Map<String, dynamic> _$S3ContentLocationUpdateToJson(
    S3ContentLocationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketARNUpdate', instance.bucketARNUpdate);
  writeNotNull('FileKeyUpdate', instance.fileKeyUpdate);
  writeNotNull('ObjectVersionUpdate', instance.objectVersionUpdate);
  return val;
}

Map<String, dynamic> _$S3ReferenceDataSourceToJson(
    S3ReferenceDataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketARN', instance.bucketARN);
  writeNotNull('FileKey', instance.fileKey);
  return val;
}

S3ReferenceDataSourceDescription _$S3ReferenceDataSourceDescriptionFromJson(
    Map<String, dynamic> json) {
  return S3ReferenceDataSourceDescription(
    bucketARN: json['BucketARN'] as String,
    fileKey: json['FileKey'] as String,
    referenceRoleARN: json['ReferenceRoleARN'] as String,
  );
}

Map<String, dynamic> _$S3ReferenceDataSourceUpdateToJson(
    S3ReferenceDataSourceUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketARNUpdate', instance.bucketARNUpdate);
  writeNotNull('FileKeyUpdate', instance.fileKeyUpdate);
  return val;
}

SnapshotDetails _$SnapshotDetailsFromJson(Map<String, dynamic> json) {
  return SnapshotDetails(
    applicationVersionId: json['ApplicationVersionId'] as int,
    snapshotName: json['SnapshotName'] as String,
    snapshotStatus:
        _$enumDecodeNullable(_$SnapshotStatusEnumMap, json['SnapshotStatus']),
    snapshotCreationTimestamp: const UnixDateTimeConverter()
        .fromJson(json['SnapshotCreationTimestamp']),
  );
}

const _$SnapshotStatusEnumMap = {
  SnapshotStatus.creating: 'CREATING',
  SnapshotStatus.ready: 'READY',
  SnapshotStatus.deleting: 'DELETING',
  SnapshotStatus.failed: 'FAILED',
};

SourceSchema _$SourceSchemaFromJson(Map<String, dynamic> json) {
  return SourceSchema(
    recordColumns: (json['RecordColumns'] as List)
        ?.map((e) =>
            e == null ? null : RecordColumn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recordFormat: json['RecordFormat'] == null
        ? null
        : RecordFormat.fromJson(json['RecordFormat'] as Map<String, dynamic>),
    recordEncoding: json['RecordEncoding'] as String,
  );
}

Map<String, dynamic> _$SourceSchemaToJson(SourceSchema instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RecordColumns',
      instance.recordColumns?.map((e) => e?.toJson())?.toList());
  writeNotNull('RecordFormat', instance.recordFormat?.toJson());
  writeNotNull('RecordEncoding', instance.recordEncoding);
  return val;
}

Map<String, dynamic> _$SqlApplicationConfigurationToJson(
    SqlApplicationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Inputs', instance.inputs?.map((e) => e?.toJson())?.toList());
  writeNotNull('Outputs', instance.outputs?.map((e) => e?.toJson())?.toList());
  writeNotNull('ReferenceDataSources',
      instance.referenceDataSources?.map((e) => e?.toJson())?.toList());
  return val;
}

SqlApplicationConfigurationDescription
    _$SqlApplicationConfigurationDescriptionFromJson(
        Map<String, dynamic> json) {
  return SqlApplicationConfigurationDescription(
    inputDescriptions: (json['InputDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : InputDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outputDescriptions: (json['OutputDescriptions'] as List)
        ?.map((e) => e == null
            ? null
            : OutputDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    referenceDataSourceDescriptions:
        (json['ReferenceDataSourceDescriptions'] as List)
            ?.map((e) => e == null
                ? null
                : ReferenceDataSourceDescription.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

Map<String, dynamic> _$SqlApplicationConfigurationUpdateToJson(
    SqlApplicationConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'InputUpdates', instance.inputUpdates?.map((e) => e?.toJson())?.toList());
  writeNotNull('OutputUpdates',
      instance.outputUpdates?.map((e) => e?.toJson())?.toList());
  writeNotNull('ReferenceDataSourceUpdates',
      instance.referenceDataSourceUpdates?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$SqlRunConfigurationToJson(SqlRunConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InputId', instance.inputId);
  writeNotNull('InputStartingPositionConfiguration',
      instance.inputStartingPositionConfiguration?.toJson());
  return val;
}

StartApplicationResponse _$StartApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return StartApplicationResponse();
}

StopApplicationResponse _$StopApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return StopApplicationResponse();
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateApplicationResponse _$UpdateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateApplicationResponse(
    applicationDetail: json['ApplicationDetail'] == null
        ? null
        : ApplicationDetail.fromJson(
            json['ApplicationDetail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VpcConfigurationToJson(VpcConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  return val;
}

VpcConfigurationDescription _$VpcConfigurationDescriptionFromJson(
    Map<String, dynamic> json) {
  return VpcConfigurationDescription(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcConfigurationId: json['VpcConfigurationId'] as String,
    vpcId: json['VpcId'] as String,
  );
}

Map<String, dynamic> _$VpcConfigurationUpdateToJson(
    VpcConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VpcConfigurationId', instance.vpcConfigurationId);
  writeNotNull('SecurityGroupIdUpdates', instance.securityGroupIdUpdates);
  writeNotNull('SubnetIdUpdates', instance.subnetIdUpdates);
  return val;
}
