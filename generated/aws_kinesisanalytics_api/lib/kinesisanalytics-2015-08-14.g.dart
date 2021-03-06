// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kinesisanalytics-2015-08-14.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddApplicationCloudWatchLoggingOptionResponse
    _$AddApplicationCloudWatchLoggingOptionResponseFromJson(
        Map<String, dynamic> json) {
  return AddApplicationCloudWatchLoggingOptionResponse();
}

AddApplicationInputProcessingConfigurationResponse
    _$AddApplicationInputProcessingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return AddApplicationInputProcessingConfigurationResponse();
}

AddApplicationInputResponse _$AddApplicationInputResponseFromJson(
    Map<String, dynamic> json) {
  return AddApplicationInputResponse();
}

AddApplicationOutputResponse _$AddApplicationOutputResponseFromJson(
    Map<String, dynamic> json) {
  return AddApplicationOutputResponse();
}

AddApplicationReferenceDataSourceResponse
    _$AddApplicationReferenceDataSourceResponseFromJson(
        Map<String, dynamic> json) {
  return AddApplicationReferenceDataSourceResponse();
}

ApplicationDetail _$ApplicationDetailFromJson(Map<String, dynamic> json) {
  return ApplicationDetail(
    applicationARN: json['ApplicationARN'] as String,
    applicationName: json['ApplicationName'] as String,
    applicationStatus:
        _$enumDecode(_$ApplicationStatusEnumMap, json['ApplicationStatus']),
    applicationVersionId: json['ApplicationVersionId'] as int,
    applicationCode: json['ApplicationCode'] as String?,
    applicationDescription: json['ApplicationDescription'] as String?,
    cloudWatchLoggingOptionDescriptions:
        (json['CloudWatchLoggingOptionDescriptions'] as List<dynamic>?)
            ?.map((e) => CloudWatchLoggingOptionDescription.fromJson(
                e as Map<String, dynamic>))
            .toList(),
    createTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreateTimestamp']),
    inputDescriptions: (json['InputDescriptions'] as List<dynamic>?)
        ?.map((e) => InputDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
    lastUpdateTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTimestamp']),
    outputDescriptions: (json['OutputDescriptions'] as List<dynamic>?)
        ?.map((e) => OutputDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
    referenceDataSourceDescriptions: (json['ReferenceDataSourceDescriptions']
            as List<dynamic>?)
        ?.map((e) =>
            ReferenceDataSourceDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
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

const _$ApplicationStatusEnumMap = {
  ApplicationStatus.deleting: 'DELETING',
  ApplicationStatus.starting: 'STARTING',
  ApplicationStatus.stopping: 'STOPPING',
  ApplicationStatus.ready: 'READY',
  ApplicationStatus.running: 'RUNNING',
  ApplicationStatus.updating: 'UPDATING',
};

ApplicationSummary _$ApplicationSummaryFromJson(Map<String, dynamic> json) {
  return ApplicationSummary(
    applicationARN: json['ApplicationARN'] as String,
    applicationName: json['ApplicationName'] as String,
    applicationStatus:
        _$enumDecode(_$ApplicationStatusEnumMap, json['ApplicationStatus']),
  );
}

Map<String, dynamic> _$ApplicationUpdateToJson(ApplicationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationCodeUpdate', instance.applicationCodeUpdate);
  writeNotNull('CloudWatchLoggingOptionUpdates',
      instance.cloudWatchLoggingOptionUpdates?.map((e) => e.toJson()).toList());
  writeNotNull(
      'InputUpdates', instance.inputUpdates?.map((e) => e.toJson()).toList());
  writeNotNull(
      'OutputUpdates', instance.outputUpdates?.map((e) => e.toJson()).toList());
  writeNotNull('ReferenceDataSourceUpdates',
      instance.referenceDataSourceUpdates?.map((e) => e.toJson()).toList());
  return val;
}

CSVMappingParameters _$CSVMappingParametersFromJson(Map<String, dynamic> json) {
  return CSVMappingParameters(
    recordColumnDelimiter: json['RecordColumnDelimiter'] as String,
    recordRowDelimiter: json['RecordRowDelimiter'] as String,
  );
}

Map<String, dynamic> _$CSVMappingParametersToJson(
        CSVMappingParameters instance) =>
    <String, dynamic>{
      'RecordColumnDelimiter': instance.recordColumnDelimiter,
      'RecordRowDelimiter': instance.recordRowDelimiter,
    };

Map<String, dynamic> _$CloudWatchLoggingOptionToJson(
        CloudWatchLoggingOption instance) =>
    <String, dynamic>{
      'LogStreamARN': instance.logStreamARN,
      'RoleARN': instance.roleARN,
    };

CloudWatchLoggingOptionDescription _$CloudWatchLoggingOptionDescriptionFromJson(
    Map<String, dynamic> json) {
  return CloudWatchLoggingOptionDescription(
    logStreamARN: json['LogStreamARN'] as String,
    roleARN: json['RoleARN'] as String,
    cloudWatchLoggingOptionId: json['CloudWatchLoggingOptionId'] as String?,
  );
}

Map<String, dynamic> _$CloudWatchLoggingOptionUpdateToJson(
    CloudWatchLoggingOptionUpdate instance) {
  final val = <String, dynamic>{
    'CloudWatchLoggingOptionId': instance.cloudWatchLoggingOptionId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LogStreamARNUpdate', instance.logStreamARNUpdate);
  writeNotNull('RoleARNUpdate', instance.roleARNUpdate);
  return val;
}

CreateApplicationResponse _$CreateApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return CreateApplicationResponse(
    applicationSummary: ApplicationSummary.fromJson(
        json['ApplicationSummary'] as Map<String, dynamic>),
  );
}

DeleteApplicationCloudWatchLoggingOptionResponse
    _$DeleteApplicationCloudWatchLoggingOptionResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteApplicationCloudWatchLoggingOptionResponse();
}

DeleteApplicationInputProcessingConfigurationResponse
    _$DeleteApplicationInputProcessingConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteApplicationInputProcessingConfigurationResponse();
}

DeleteApplicationOutputResponse _$DeleteApplicationOutputResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApplicationOutputResponse();
}

DeleteApplicationReferenceDataSourceResponse
    _$DeleteApplicationReferenceDataSourceResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteApplicationReferenceDataSourceResponse();
}

DeleteApplicationResponse _$DeleteApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteApplicationResponse();
}

DescribeApplicationResponse _$DescribeApplicationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeApplicationResponse(
    applicationDetail: ApplicationDetail.fromJson(
        json['ApplicationDetail'] as Map<String, dynamic>),
  );
}

DestinationSchema _$DestinationSchemaFromJson(Map<String, dynamic> json) {
  return DestinationSchema(
    recordFormatType:
        _$enumDecode(_$RecordFormatTypeEnumMap, json['RecordFormatType']),
  );
}

Map<String, dynamic> _$DestinationSchemaToJson(DestinationSchema instance) =>
    <String, dynamic>{
      'RecordFormatType': _$RecordFormatTypeEnumMap[instance.recordFormatType],
    };

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
    parsedInputRecords: (json['ParsedInputRecords'] as List<dynamic>?)
        ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
        .toList(),
    processedInputRecords: (json['ProcessedInputRecords'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    rawInputRecords: (json['RawInputRecords'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$InputToJson(Input instance) {
  final val = <String, dynamic>{
    'InputSchema': instance.inputSchema.toJson(),
    'NamePrefix': instance.namePrefix,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InputParallelism', instance.inputParallelism?.toJson());
  writeNotNull('InputProcessingConfiguration',
      instance.inputProcessingConfiguration?.toJson());
  writeNotNull('KinesisFirehoseInput', instance.kinesisFirehoseInput?.toJson());
  writeNotNull('KinesisStreamsInput', instance.kinesisStreamsInput?.toJson());
  return val;
}

Map<String, dynamic> _$InputConfigurationToJson(InputConfiguration instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'InputStartingPositionConfiguration':
          instance.inputStartingPositionConfiguration.toJson(),
    };

InputDescription _$InputDescriptionFromJson(Map<String, dynamic> json) {
  return InputDescription(
    inAppStreamNames: (json['InAppStreamNames'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    inputId: json['InputId'] as String?,
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
    namePrefix: json['NamePrefix'] as String?,
  );
}

Map<String, dynamic> _$InputLambdaProcessorToJson(
        InputLambdaProcessor instance) =>
    <String, dynamic>{
      'ResourceARN': instance.resourceARN,
      'RoleARN': instance.roleARN,
    };

InputLambdaProcessorDescription _$InputLambdaProcessorDescriptionFromJson(
    Map<String, dynamic> json) {
  return InputLambdaProcessorDescription(
    resourceARN: json['ResourceARN'] as String?,
    roleARN: json['RoleARN'] as String?,
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
  writeNotNull('RoleARNUpdate', instance.roleARNUpdate);
  return val;
}

InputParallelism _$InputParallelismFromJson(Map<String, dynamic> json) {
  return InputParallelism(
    count: json['Count'] as int?,
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
        InputProcessingConfiguration instance) =>
    <String, dynamic>{
      'InputLambdaProcessor': instance.inputLambdaProcessor.toJson(),
    };

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
        InputProcessingConfigurationUpdate instance) =>
    <String, dynamic>{
      'InputLambdaProcessorUpdate':
          instance.inputLambdaProcessorUpdate.toJson(),
    };

Map<String, dynamic> _$InputSchemaUpdateToJson(InputSchemaUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RecordColumnUpdates',
      instance.recordColumnUpdates?.map((e) => e.toJson()).toList());
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

const _$InputStartingPositionEnumMap = {
  InputStartingPosition.now: 'NOW',
  InputStartingPosition.trimHorizon: 'TRIM_HORIZON',
  InputStartingPosition.lastStoppedPoint: 'LAST_STOPPED_POINT',
};

Map<String, dynamic> _$InputUpdateToJson(InputUpdate instance) {
  final val = <String, dynamic>{
    'InputId': instance.inputId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

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
        JSONMappingParameters instance) =>
    <String, dynamic>{
      'RecordRowPath': instance.recordRowPath,
    };

Map<String, dynamic> _$KinesisFirehoseInputToJson(
        KinesisFirehoseInput instance) =>
    <String, dynamic>{
      'ResourceARN': instance.resourceARN,
      'RoleARN': instance.roleARN,
    };

KinesisFirehoseInputDescription _$KinesisFirehoseInputDescriptionFromJson(
    Map<String, dynamic> json) {
  return KinesisFirehoseInputDescription(
    resourceARN: json['ResourceARN'] as String?,
    roleARN: json['RoleARN'] as String?,
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
  writeNotNull('RoleARNUpdate', instance.roleARNUpdate);
  return val;
}

Map<String, dynamic> _$KinesisFirehoseOutputToJson(
        KinesisFirehoseOutput instance) =>
    <String, dynamic>{
      'ResourceARN': instance.resourceARN,
      'RoleARN': instance.roleARN,
    };

KinesisFirehoseOutputDescription _$KinesisFirehoseOutputDescriptionFromJson(
    Map<String, dynamic> json) {
  return KinesisFirehoseOutputDescription(
    resourceARN: json['ResourceARN'] as String?,
    roleARN: json['RoleARN'] as String?,
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
  writeNotNull('RoleARNUpdate', instance.roleARNUpdate);
  return val;
}

Map<String, dynamic> _$KinesisStreamsInputToJson(
        KinesisStreamsInput instance) =>
    <String, dynamic>{
      'ResourceARN': instance.resourceARN,
      'RoleARN': instance.roleARN,
    };

KinesisStreamsInputDescription _$KinesisStreamsInputDescriptionFromJson(
    Map<String, dynamic> json) {
  return KinesisStreamsInputDescription(
    resourceARN: json['ResourceARN'] as String?,
    roleARN: json['RoleARN'] as String?,
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
  writeNotNull('RoleARNUpdate', instance.roleARNUpdate);
  return val;
}

Map<String, dynamic> _$KinesisStreamsOutputToJson(
        KinesisStreamsOutput instance) =>
    <String, dynamic>{
      'ResourceARN': instance.resourceARN,
      'RoleARN': instance.roleARN,
    };

KinesisStreamsOutputDescription _$KinesisStreamsOutputDescriptionFromJson(
    Map<String, dynamic> json) {
  return KinesisStreamsOutputDescription(
    resourceARN: json['ResourceARN'] as String?,
    roleARN: json['RoleARN'] as String?,
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
  writeNotNull('RoleARNUpdate', instance.roleARNUpdate);
  return val;
}

Map<String, dynamic> _$LambdaOutputToJson(LambdaOutput instance) =>
    <String, dynamic>{
      'ResourceARN': instance.resourceARN,
      'RoleARN': instance.roleARN,
    };

LambdaOutputDescription _$LambdaOutputDescriptionFromJson(
    Map<String, dynamic> json) {
  return LambdaOutputDescription(
    resourceARN: json['ResourceARN'] as String?,
    roleARN: json['RoleARN'] as String?,
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
  writeNotNull('RoleARNUpdate', instance.roleARNUpdate);
  return val;
}

ListApplicationsResponse _$ListApplicationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListApplicationsResponse(
    applicationSummaries: (json['ApplicationSummaries'] as List<dynamic>)
        .map((e) => ApplicationSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    hasMoreApplications: json['HasMoreApplications'] as bool,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
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

Map<String, dynamic> _$OutputToJson(Output instance) {
  final val = <String, dynamic>{
    'DestinationSchema': instance.destinationSchema.toJson(),
    'Name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

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
    name: json['Name'] as String?,
    outputId: json['OutputId'] as String?,
  );
}

Map<String, dynamic> _$OutputUpdateToJson(OutputUpdate instance) {
  final val = <String, dynamic>{
    'OutputId': instance.outputId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

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

RecordColumn _$RecordColumnFromJson(Map<String, dynamic> json) {
  return RecordColumn(
    name: json['Name'] as String,
    sqlType: json['SqlType'] as String,
    mapping: json['Mapping'] as String?,
  );
}

Map<String, dynamic> _$RecordColumnToJson(RecordColumn instance) {
  final val = <String, dynamic>{
    'Name': instance.name,
    'SqlType': instance.sqlType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Mapping', instance.mapping);
  return val;
}

RecordFormat _$RecordFormatFromJson(Map<String, dynamic> json) {
  return RecordFormat(
    recordFormatType:
        _$enumDecode(_$RecordFormatTypeEnumMap, json['RecordFormatType']),
    mappingParameters: json['MappingParameters'] == null
        ? null
        : MappingParameters.fromJson(
            json['MappingParameters'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RecordFormatToJson(RecordFormat instance) {
  final val = <String, dynamic>{
    'RecordFormatType': _$RecordFormatTypeEnumMap[instance.recordFormatType],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MappingParameters', instance.mappingParameters?.toJson());
  return val;
}

Map<String, dynamic> _$ReferenceDataSourceToJson(ReferenceDataSource instance) {
  final val = <String, dynamic>{
    'ReferenceSchema': instance.referenceSchema.toJson(),
    'TableName': instance.tableName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'S3ReferenceDataSource', instance.s3ReferenceDataSource?.toJson());
  return val;
}

ReferenceDataSourceDescription _$ReferenceDataSourceDescriptionFromJson(
    Map<String, dynamic> json) {
  return ReferenceDataSourceDescription(
    referenceId: json['ReferenceId'] as String,
    s3ReferenceDataSourceDescription: S3ReferenceDataSourceDescription.fromJson(
        json['S3ReferenceDataSourceDescription'] as Map<String, dynamic>),
    tableName: json['TableName'] as String,
    referenceSchema: json['ReferenceSchema'] == null
        ? null
        : SourceSchema.fromJson(
            json['ReferenceSchema'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReferenceDataSourceUpdateToJson(
    ReferenceDataSourceUpdate instance) {
  final val = <String, dynamic>{
    'ReferenceId': instance.referenceId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ReferenceSchemaUpdate', instance.referenceSchemaUpdate?.toJson());
  writeNotNull('S3ReferenceDataSourceUpdate',
      instance.s3ReferenceDataSourceUpdate?.toJson());
  writeNotNull('TableNameUpdate', instance.tableNameUpdate);
  return val;
}

Map<String, dynamic> _$S3ConfigurationToJson(S3Configuration instance) =>
    <String, dynamic>{
      'BucketARN': instance.bucketARN,
      'FileKey': instance.fileKey,
      'RoleARN': instance.roleARN,
    };

Map<String, dynamic> _$S3ReferenceDataSourceToJson(
        S3ReferenceDataSource instance) =>
    <String, dynamic>{
      'BucketARN': instance.bucketARN,
      'FileKey': instance.fileKey,
      'ReferenceRoleARN': instance.referenceRoleARN,
    };

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
  writeNotNull('ReferenceRoleARNUpdate', instance.referenceRoleARNUpdate);
  return val;
}

SourceSchema _$SourceSchemaFromJson(Map<String, dynamic> json) {
  return SourceSchema(
    recordColumns: (json['RecordColumns'] as List<dynamic>)
        .map((e) => RecordColumn.fromJson(e as Map<String, dynamic>))
        .toList(),
    recordFormat:
        RecordFormat.fromJson(json['RecordFormat'] as Map<String, dynamic>),
    recordEncoding: json['RecordEncoding'] as String?,
  );
}

Map<String, dynamic> _$SourceSchemaToJson(SourceSchema instance) {
  final val = <String, dynamic>{
    'RecordColumns': instance.recordColumns.map((e) => e.toJson()).toList(),
    'RecordFormat': instance.recordFormat.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RecordEncoding', instance.recordEncoding);
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
    value: json['Value'] as String?,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{
    'Key': instance.key,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

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
  return UpdateApplicationResponse();
}
