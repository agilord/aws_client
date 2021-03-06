// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sagemaker-2017-07-24.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionSource _$ActionSourceFromJson(Map<String, dynamic> json) {
  return ActionSource(
    sourceUri: json['SourceUri'] as String,
    sourceId: json['SourceId'] as String?,
    sourceType: json['SourceType'] as String?,
  );
}

Map<String, dynamic> _$ActionSourceToJson(ActionSource instance) {
  final val = <String, dynamic>{
    'SourceUri': instance.sourceUri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceId', instance.sourceId);
  writeNotNull('SourceType', instance.sourceType);
  return val;
}

ActionSummary _$ActionSummaryFromJson(Map<String, dynamic> json) {
  return ActionSummary(
    actionArn: json['ActionArn'] as String?,
    actionName: json['ActionName'] as String?,
    actionType: json['ActionType'] as String?,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    source: json['Source'] == null
        ? null
        : ActionSource.fromJson(json['Source'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$ActionStatusEnumMap, json['Status']),
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

const _$ActionStatusEnumMap = {
  ActionStatus.unknown: 'Unknown',
  ActionStatus.inProgress: 'InProgress',
  ActionStatus.completed: 'Completed',
  ActionStatus.failed: 'Failed',
  ActionStatus.stopping: 'Stopping',
  ActionStatus.stopped: 'Stopped',
};

AddAssociationResponse _$AddAssociationResponseFromJson(
    Map<String, dynamic> json) {
  return AddAssociationResponse(
    destinationArn: json['DestinationArn'] as String?,
    sourceArn: json['SourceArn'] as String?,
  );
}

AddTagsOutput _$AddTagsOutputFromJson(Map<String, dynamic> json) {
  return AddTagsOutput(
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

AgentVersion _$AgentVersionFromJson(Map<String, dynamic> json) {
  return AgentVersion(
    agentCount: json['AgentCount'] as int,
    version: json['Version'] as String,
  );
}

Alarm _$AlarmFromJson(Map<String, dynamic> json) {
  return Alarm(
    alarmName: json['AlarmName'] as String?,
  );
}

Map<String, dynamic> _$AlarmToJson(Alarm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlarmName', instance.alarmName);
  return val;
}

AlgorithmSpecification _$AlgorithmSpecificationFromJson(
    Map<String, dynamic> json) {
  return AlgorithmSpecification(
    trainingInputMode:
        _$enumDecode(_$TrainingInputModeEnumMap, json['TrainingInputMode']),
    algorithmName: json['AlgorithmName'] as String?,
    enableSageMakerMetricsTimeSeries:
        json['EnableSageMakerMetricsTimeSeries'] as bool?,
    metricDefinitions: (json['MetricDefinitions'] as List<dynamic>?)
        ?.map((e) => MetricDefinition.fromJson(e as Map<String, dynamic>))
        .toList(),
    trainingImage: json['TrainingImage'] as String?,
  );
}

Map<String, dynamic> _$AlgorithmSpecificationToJson(
    AlgorithmSpecification instance) {
  final val = <String, dynamic>{
    'TrainingInputMode': _$TrainingInputModeEnumMap[instance.trainingInputMode],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlgorithmName', instance.algorithmName);
  writeNotNull('EnableSageMakerMetricsTimeSeries',
      instance.enableSageMakerMetricsTimeSeries);
  writeNotNull('MetricDefinitions',
      instance.metricDefinitions?.map((e) => e.toJson()).toList());
  writeNotNull('TrainingImage', instance.trainingImage);
  return val;
}

const _$TrainingInputModeEnumMap = {
  TrainingInputMode.pipe: 'Pipe',
  TrainingInputMode.file: 'File',
};

AlgorithmStatusDetails _$AlgorithmStatusDetailsFromJson(
    Map<String, dynamic> json) {
  return AlgorithmStatusDetails(
    imageScanStatuses: (json['ImageScanStatuses'] as List<dynamic>?)
        ?.map((e) => AlgorithmStatusItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    validationStatuses: (json['ValidationStatuses'] as List<dynamic>?)
        ?.map((e) => AlgorithmStatusItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

AlgorithmStatusItem _$AlgorithmStatusItemFromJson(Map<String, dynamic> json) {
  return AlgorithmStatusItem(
    name: json['Name'] as String,
    status: _$enumDecode(_$DetailedAlgorithmStatusEnumMap, json['Status']),
    failureReason: json['FailureReason'] as String?,
  );
}

const _$DetailedAlgorithmStatusEnumMap = {
  DetailedAlgorithmStatus.notStarted: 'NotStarted',
  DetailedAlgorithmStatus.inProgress: 'InProgress',
  DetailedAlgorithmStatus.completed: 'Completed',
  DetailedAlgorithmStatus.failed: 'Failed',
};

AlgorithmSummary _$AlgorithmSummaryFromJson(Map<String, dynamic> json) {
  return AlgorithmSummary(
    algorithmArn: json['AlgorithmArn'] as String,
    algorithmName: json['AlgorithmName'] as String,
    algorithmStatus:
        _$enumDecode(_$AlgorithmStatusEnumMap, json['AlgorithmStatus']),
    creationTime: DateTime.parse(json['CreationTime'] as String),
    algorithmDescription: json['AlgorithmDescription'] as String?,
  );
}

const _$AlgorithmStatusEnumMap = {
  AlgorithmStatus.pending: 'Pending',
  AlgorithmStatus.inProgress: 'InProgress',
  AlgorithmStatus.completed: 'Completed',
  AlgorithmStatus.failed: 'Failed',
  AlgorithmStatus.deleting: 'Deleting',
};

AlgorithmValidationProfile _$AlgorithmValidationProfileFromJson(
    Map<String, dynamic> json) {
  return AlgorithmValidationProfile(
    profileName: json['ProfileName'] as String,
    trainingJobDefinition: TrainingJobDefinition.fromJson(
        json['TrainingJobDefinition'] as Map<String, dynamic>),
    transformJobDefinition: json['TransformJobDefinition'] == null
        ? null
        : TransformJobDefinition.fromJson(
            json['TransformJobDefinition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AlgorithmValidationProfileToJson(
    AlgorithmValidationProfile instance) {
  final val = <String, dynamic>{
    'ProfileName': instance.profileName,
    'TrainingJobDefinition': instance.trainingJobDefinition.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'TransformJobDefinition', instance.transformJobDefinition?.toJson());
  return val;
}

AlgorithmValidationSpecification _$AlgorithmValidationSpecificationFromJson(
    Map<String, dynamic> json) {
  return AlgorithmValidationSpecification(
    validationProfiles: (json['ValidationProfiles'] as List<dynamic>)
        .map((e) =>
            AlgorithmValidationProfile.fromJson(e as Map<String, dynamic>))
        .toList(),
    validationRole: json['ValidationRole'] as String,
  );
}

Map<String, dynamic> _$AlgorithmValidationSpecificationToJson(
        AlgorithmValidationSpecification instance) =>
    <String, dynamic>{
      'ValidationProfiles':
          instance.validationProfiles.map((e) => e.toJson()).toList(),
      'ValidationRole': instance.validationRole,
    };

AnnotationConsolidationConfig _$AnnotationConsolidationConfigFromJson(
    Map<String, dynamic> json) {
  return AnnotationConsolidationConfig(
    annotationConsolidationLambdaArn:
        json['AnnotationConsolidationLambdaArn'] as String,
  );
}

Map<String, dynamic> _$AnnotationConsolidationConfigToJson(
        AnnotationConsolidationConfig instance) =>
    <String, dynamic>{
      'AnnotationConsolidationLambdaArn':
          instance.annotationConsolidationLambdaArn,
    };

AppDetails _$AppDetailsFromJson(Map<String, dynamic> json) {
  return AppDetails(
    appName: json['AppName'] as String?,
    appType: _$enumDecodeNullable(_$AppTypeEnumMap, json['AppType']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    domainId: json['DomainId'] as String?,
    status: _$enumDecodeNullable(_$AppStatusEnumMap, json['Status']),
    userProfileName: json['UserProfileName'] as String?,
  );
}

const _$AppTypeEnumMap = {
  AppType.jupyterServer: 'JupyterServer',
  AppType.kernelGateway: 'KernelGateway',
  AppType.tensorBoard: 'TensorBoard',
};

const _$AppStatusEnumMap = {
  AppStatus.deleted: 'Deleted',
  AppStatus.deleting: 'Deleting',
  AppStatus.failed: 'Failed',
  AppStatus.inService: 'InService',
  AppStatus.pending: 'Pending',
};

AppImageConfigDetails _$AppImageConfigDetailsFromJson(
    Map<String, dynamic> json) {
  return AppImageConfigDetails(
    appImageConfigArn: json['AppImageConfigArn'] as String?,
    appImageConfigName: json['AppImageConfigName'] as String?,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    kernelGatewayImageConfig: json['KernelGatewayImageConfig'] == null
        ? null
        : KernelGatewayImageConfig.fromJson(
            json['KernelGatewayImageConfig'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
  );
}

AppSpecification _$AppSpecificationFromJson(Map<String, dynamic> json) {
  return AppSpecification(
    imageUri: json['ImageUri'] as String,
    containerArguments: (json['ContainerArguments'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    containerEntrypoint: (json['ContainerEntrypoint'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$AppSpecificationToJson(AppSpecification instance) {
  final val = <String, dynamic>{
    'ImageUri': instance.imageUri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerArguments', instance.containerArguments);
  writeNotNull('ContainerEntrypoint', instance.containerEntrypoint);
  return val;
}

ArtifactSource _$ArtifactSourceFromJson(Map<String, dynamic> json) {
  return ArtifactSource(
    sourceUri: json['SourceUri'] as String,
    sourceTypes: (json['SourceTypes'] as List<dynamic>?)
        ?.map((e) => ArtifactSourceType.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ArtifactSourceToJson(ArtifactSource instance) {
  final val = <String, dynamic>{
    'SourceUri': instance.sourceUri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'SourceTypes', instance.sourceTypes?.map((e) => e.toJson()).toList());
  return val;
}

ArtifactSourceType _$ArtifactSourceTypeFromJson(Map<String, dynamic> json) {
  return ArtifactSourceType(
    sourceIdType:
        _$enumDecode(_$ArtifactSourceIdTypeEnumMap, json['SourceIdType']),
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$ArtifactSourceTypeToJson(ArtifactSourceType instance) =>
    <String, dynamic>{
      'SourceIdType': _$ArtifactSourceIdTypeEnumMap[instance.sourceIdType],
      'Value': instance.value,
    };

const _$ArtifactSourceIdTypeEnumMap = {
  ArtifactSourceIdType.mD5Hash: 'MD5Hash',
  ArtifactSourceIdType.s3ETag: 'S3ETag',
  ArtifactSourceIdType.s3Version: 'S3Version',
  ArtifactSourceIdType.custom: 'Custom',
};

ArtifactSummary _$ArtifactSummaryFromJson(Map<String, dynamic> json) {
  return ArtifactSummary(
    artifactArn: json['ArtifactArn'] as String?,
    artifactName: json['ArtifactName'] as String?,
    artifactType: json['ArtifactType'] as String?,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    source: json['Source'] == null
        ? null
        : ArtifactSource.fromJson(json['Source'] as Map<String, dynamic>),
  );
}

AssociateTrialComponentResponse _$AssociateTrialComponentResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateTrialComponentResponse(
    trialArn: json['TrialArn'] as String?,
    trialComponentArn: json['TrialComponentArn'] as String?,
  );
}

AssociationSummary _$AssociationSummaryFromJson(Map<String, dynamic> json) {
  return AssociationSummary(
    associationType: _$enumDecodeNullable(
        _$AssociationEdgeTypeEnumMap, json['AssociationType']),
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    destinationArn: json['DestinationArn'] as String?,
    destinationName: json['DestinationName'] as String?,
    destinationType: json['DestinationType'] as String?,
    sourceArn: json['SourceArn'] as String?,
    sourceName: json['SourceName'] as String?,
    sourceType: json['SourceType'] as String?,
  );
}

const _$AssociationEdgeTypeEnumMap = {
  AssociationEdgeType.contributedTo: 'ContributedTo',
  AssociationEdgeType.associatedWith: 'AssociatedWith',
  AssociationEdgeType.derivedFrom: 'DerivedFrom',
  AssociationEdgeType.produced: 'Produced',
};

AthenaDatasetDefinition _$AthenaDatasetDefinitionFromJson(
    Map<String, dynamic> json) {
  return AthenaDatasetDefinition(
    catalog: json['Catalog'] as String,
    database: json['Database'] as String,
    outputFormat:
        _$enumDecode(_$AthenaResultFormatEnumMap, json['OutputFormat']),
    outputS3Uri: json['OutputS3Uri'] as String,
    queryString: json['QueryString'] as String,
    kmsKeyId: json['KmsKeyId'] as String?,
    outputCompression: _$enumDecodeNullable(
        _$AthenaResultCompressionTypeEnumMap, json['OutputCompression']),
    workGroup: json['WorkGroup'] as String?,
  );
}

Map<String, dynamic> _$AthenaDatasetDefinitionToJson(
    AthenaDatasetDefinition instance) {
  final val = <String, dynamic>{
    'Catalog': instance.catalog,
    'Database': instance.database,
    'OutputFormat': _$AthenaResultFormatEnumMap[instance.outputFormat],
    'OutputS3Uri': instance.outputS3Uri,
    'QueryString': instance.queryString,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('OutputCompression',
      _$AthenaResultCompressionTypeEnumMap[instance.outputCompression]);
  writeNotNull('WorkGroup', instance.workGroup);
  return val;
}

const _$AthenaResultFormatEnumMap = {
  AthenaResultFormat.parquet: 'PARQUET',
  AthenaResultFormat.orc: 'ORC',
  AthenaResultFormat.avro: 'AVRO',
  AthenaResultFormat.json: 'JSON',
  AthenaResultFormat.textfile: 'TEXTFILE',
};

const _$AthenaResultCompressionTypeEnumMap = {
  AthenaResultCompressionType.gzip: 'GZIP',
  AthenaResultCompressionType.snappy: 'SNAPPY',
  AthenaResultCompressionType.zlib: 'ZLIB',
};

AutoMLCandidate _$AutoMLCandidateFromJson(Map<String, dynamic> json) {
  return AutoMLCandidate(
    candidateName: json['CandidateName'] as String,
    candidateStatus:
        _$enumDecode(_$CandidateStatusEnumMap, json['CandidateStatus']),
    candidateSteps: (json['CandidateSteps'] as List<dynamic>)
        .map((e) => AutoMLCandidateStep.fromJson(e as Map<String, dynamic>))
        .toList(),
    creationTime: DateTime.parse(json['CreationTime'] as String),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    objectiveStatus:
        _$enumDecode(_$ObjectiveStatusEnumMap, json['ObjectiveStatus']),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    failureReason: json['FailureReason'] as String?,
    finalAutoMLJobObjectiveMetric: json['FinalAutoMLJobObjectiveMetric'] == null
        ? null
        : FinalAutoMLJobObjectiveMetric.fromJson(
            json['FinalAutoMLJobObjectiveMetric'] as Map<String, dynamic>),
    inferenceContainers: (json['InferenceContainers'] as List<dynamic>?)
        ?.map((e) =>
            AutoMLContainerDefinition.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

const _$CandidateStatusEnumMap = {
  CandidateStatus.completed: 'Completed',
  CandidateStatus.inProgress: 'InProgress',
  CandidateStatus.failed: 'Failed',
  CandidateStatus.stopped: 'Stopped',
  CandidateStatus.stopping: 'Stopping',
};

const _$ObjectiveStatusEnumMap = {
  ObjectiveStatus.succeeded: 'Succeeded',
  ObjectiveStatus.pending: 'Pending',
  ObjectiveStatus.failed: 'Failed',
};

AutoMLCandidateStep _$AutoMLCandidateStepFromJson(Map<String, dynamic> json) {
  return AutoMLCandidateStep(
    candidateStepArn: json['CandidateStepArn'] as String,
    candidateStepName: json['CandidateStepName'] as String,
    candidateStepType:
        _$enumDecode(_$CandidateStepTypeEnumMap, json['CandidateStepType']),
  );
}

const _$CandidateStepTypeEnumMap = {
  CandidateStepType.awsSageMakerTrainingJob: 'AWS::SageMaker::TrainingJob',
  CandidateStepType.awsSageMakerTransformJob: 'AWS::SageMaker::TransformJob',
  CandidateStepType.awsSageMakerProcessingJob: 'AWS::SageMaker::ProcessingJob',
};

AutoMLChannel _$AutoMLChannelFromJson(Map<String, dynamic> json) {
  return AutoMLChannel(
    dataSource:
        AutoMLDataSource.fromJson(json['DataSource'] as Map<String, dynamic>),
    targetAttributeName: json['TargetAttributeName'] as String,
    compressionType:
        _$enumDecodeNullable(_$CompressionTypeEnumMap, json['CompressionType']),
  );
}

Map<String, dynamic> _$AutoMLChannelToJson(AutoMLChannel instance) {
  final val = <String, dynamic>{
    'DataSource': instance.dataSource.toJson(),
    'TargetAttributeName': instance.targetAttributeName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CompressionType', _$CompressionTypeEnumMap[instance.compressionType]);
  return val;
}

const _$CompressionTypeEnumMap = {
  CompressionType.none: 'None',
  CompressionType.gzip: 'Gzip',
};

AutoMLContainerDefinition _$AutoMLContainerDefinitionFromJson(
    Map<String, dynamic> json) {
  return AutoMLContainerDefinition(
    image: json['Image'] as String,
    modelDataUrl: json['ModelDataUrl'] as String,
    environment: (json['Environment'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

AutoMLDataSource _$AutoMLDataSourceFromJson(Map<String, dynamic> json) {
  return AutoMLDataSource(
    s3DataSource: AutoMLS3DataSource.fromJson(
        json['S3DataSource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AutoMLDataSourceToJson(AutoMLDataSource instance) =>
    <String, dynamic>{
      'S3DataSource': instance.s3DataSource.toJson(),
    };

AutoMLJobArtifacts _$AutoMLJobArtifactsFromJson(Map<String, dynamic> json) {
  return AutoMLJobArtifacts(
    candidateDefinitionNotebookLocation:
        json['CandidateDefinitionNotebookLocation'] as String?,
    dataExplorationNotebookLocation:
        json['DataExplorationNotebookLocation'] as String?,
  );
}

AutoMLJobCompletionCriteria _$AutoMLJobCompletionCriteriaFromJson(
    Map<String, dynamic> json) {
  return AutoMLJobCompletionCriteria(
    maxAutoMLJobRuntimeInSeconds: json['MaxAutoMLJobRuntimeInSeconds'] as int?,
    maxCandidates: json['MaxCandidates'] as int?,
    maxRuntimePerTrainingJobInSeconds:
        json['MaxRuntimePerTrainingJobInSeconds'] as int?,
  );
}

Map<String, dynamic> _$AutoMLJobCompletionCriteriaToJson(
    AutoMLJobCompletionCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'MaxAutoMLJobRuntimeInSeconds', instance.maxAutoMLJobRuntimeInSeconds);
  writeNotNull('MaxCandidates', instance.maxCandidates);
  writeNotNull('MaxRuntimePerTrainingJobInSeconds',
      instance.maxRuntimePerTrainingJobInSeconds);
  return val;
}

AutoMLJobConfig _$AutoMLJobConfigFromJson(Map<String, dynamic> json) {
  return AutoMLJobConfig(
    completionCriteria: json['CompletionCriteria'] == null
        ? null
        : AutoMLJobCompletionCriteria.fromJson(
            json['CompletionCriteria'] as Map<String, dynamic>),
    securityConfig: json['SecurityConfig'] == null
        ? null
        : AutoMLSecurityConfig.fromJson(
            json['SecurityConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AutoMLJobConfigToJson(AutoMLJobConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CompletionCriteria', instance.completionCriteria?.toJson());
  writeNotNull('SecurityConfig', instance.securityConfig?.toJson());
  return val;
}

AutoMLJobObjective _$AutoMLJobObjectiveFromJson(Map<String, dynamic> json) {
  return AutoMLJobObjective(
    metricName: _$enumDecode(_$AutoMLMetricEnumEnumMap, json['MetricName']),
  );
}

Map<String, dynamic> _$AutoMLJobObjectiveToJson(AutoMLJobObjective instance) =>
    <String, dynamic>{
      'MetricName': _$AutoMLMetricEnumEnumMap[instance.metricName],
    };

const _$AutoMLMetricEnumEnumMap = {
  AutoMLMetricEnum.accuracy: 'Accuracy',
  AutoMLMetricEnum.mse: 'MSE',
  AutoMLMetricEnum.f1: 'F1',
  AutoMLMetricEnum.f1macro: 'F1macro',
  AutoMLMetricEnum.auc: 'AUC',
};

AutoMLJobSummary _$AutoMLJobSummaryFromJson(Map<String, dynamic> json) {
  return AutoMLJobSummary(
    autoMLJobArn: json['AutoMLJobArn'] as String,
    autoMLJobName: json['AutoMLJobName'] as String,
    autoMLJobSecondaryStatus: _$enumDecode(
        _$AutoMLJobSecondaryStatusEnumMap, json['AutoMLJobSecondaryStatus']),
    autoMLJobStatus:
        _$enumDecode(_$AutoMLJobStatusEnumMap, json['AutoMLJobStatus']),
    creationTime: DateTime.parse(json['CreationTime'] as String),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    failureReason: json['FailureReason'] as String?,
  );
}

const _$AutoMLJobSecondaryStatusEnumMap = {
  AutoMLJobSecondaryStatus.starting: 'Starting',
  AutoMLJobSecondaryStatus.analyzingData: 'AnalyzingData',
  AutoMLJobSecondaryStatus.featureEngineering: 'FeatureEngineering',
  AutoMLJobSecondaryStatus.modelTuning: 'ModelTuning',
  AutoMLJobSecondaryStatus.maxCandidatesReached: 'MaxCandidatesReached',
  AutoMLJobSecondaryStatus.failed: 'Failed',
  AutoMLJobSecondaryStatus.stopped: 'Stopped',
  AutoMLJobSecondaryStatus.maxAutoMLJobRuntimeReached:
      'MaxAutoMLJobRuntimeReached',
  AutoMLJobSecondaryStatus.stopping: 'Stopping',
  AutoMLJobSecondaryStatus.candidateDefinitionsGenerated:
      'CandidateDefinitionsGenerated',
};

const _$AutoMLJobStatusEnumMap = {
  AutoMLJobStatus.completed: 'Completed',
  AutoMLJobStatus.inProgress: 'InProgress',
  AutoMLJobStatus.failed: 'Failed',
  AutoMLJobStatus.stopped: 'Stopped',
  AutoMLJobStatus.stopping: 'Stopping',
};

AutoMLOutputDataConfig _$AutoMLOutputDataConfigFromJson(
    Map<String, dynamic> json) {
  return AutoMLOutputDataConfig(
    s3OutputPath: json['S3OutputPath'] as String,
    kmsKeyId: json['KmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$AutoMLOutputDataConfigToJson(
    AutoMLOutputDataConfig instance) {
  final val = <String, dynamic>{
    'S3OutputPath': instance.s3OutputPath,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

AutoMLS3DataSource _$AutoMLS3DataSourceFromJson(Map<String, dynamic> json) {
  return AutoMLS3DataSource(
    s3DataType: _$enumDecode(_$AutoMLS3DataTypeEnumMap, json['S3DataType']),
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$AutoMLS3DataSourceToJson(AutoMLS3DataSource instance) =>
    <String, dynamic>{
      'S3DataType': _$AutoMLS3DataTypeEnumMap[instance.s3DataType],
      'S3Uri': instance.s3Uri,
    };

const _$AutoMLS3DataTypeEnumMap = {
  AutoMLS3DataType.manifestFile: 'ManifestFile',
  AutoMLS3DataType.s3Prefix: 'S3Prefix',
};

AutoMLSecurityConfig _$AutoMLSecurityConfigFromJson(Map<String, dynamic> json) {
  return AutoMLSecurityConfig(
    enableInterContainerTrafficEncryption:
        json['EnableInterContainerTrafficEncryption'] as bool?,
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AutoMLSecurityConfigToJson(
    AutoMLSecurityConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EnableInterContainerTrafficEncryption',
      instance.enableInterContainerTrafficEncryption);
  writeNotNull('VolumeKmsKeyId', instance.volumeKmsKeyId);
  writeNotNull('VpcConfig', instance.vpcConfig?.toJson());
  return val;
}

AutoRollbackConfig _$AutoRollbackConfigFromJson(Map<String, dynamic> json) {
  return AutoRollbackConfig(
    alarms: (json['Alarms'] as List<dynamic>?)
        ?.map((e) => Alarm.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AutoRollbackConfigToJson(AutoRollbackConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Alarms', instance.alarms?.map((e) => e.toJson()).toList());
  return val;
}

Bias _$BiasFromJson(Map<String, dynamic> json) {
  return Bias(
    report: json['Report'] == null
        ? null
        : MetricsSource.fromJson(json['Report'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BiasToJson(Bias instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Report', instance.report?.toJson());
  return val;
}

BlueGreenUpdatePolicy _$BlueGreenUpdatePolicyFromJson(
    Map<String, dynamic> json) {
  return BlueGreenUpdatePolicy(
    trafficRoutingConfiguration: TrafficRoutingConfig.fromJson(
        json['TrafficRoutingConfiguration'] as Map<String, dynamic>),
    maximumExecutionTimeoutInSeconds:
        json['MaximumExecutionTimeoutInSeconds'] as int?,
    terminationWaitInSeconds: json['TerminationWaitInSeconds'] as int?,
  );
}

Map<String, dynamic> _$BlueGreenUpdatePolicyToJson(
    BlueGreenUpdatePolicy instance) {
  final val = <String, dynamic>{
    'TrafficRoutingConfiguration':
        instance.trafficRoutingConfiguration.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaximumExecutionTimeoutInSeconds',
      instance.maximumExecutionTimeoutInSeconds);
  writeNotNull('TerminationWaitInSeconds', instance.terminationWaitInSeconds);
  return val;
}

CacheHitResult _$CacheHitResultFromJson(Map<String, dynamic> json) {
  return CacheHitResult(
    sourcePipelineExecutionArn: json['SourcePipelineExecutionArn'] as String?,
  );
}

CapacitySize _$CapacitySizeFromJson(Map<String, dynamic> json) {
  return CapacitySize(
    type: _$enumDecode(_$CapacitySizeTypeEnumMap, json['Type']),
    value: json['Value'] as int,
  );
}

Map<String, dynamic> _$CapacitySizeToJson(CapacitySize instance) =>
    <String, dynamic>{
      'Type': _$CapacitySizeTypeEnumMap[instance.type],
      'Value': instance.value,
    };

const _$CapacitySizeTypeEnumMap = {
  CapacitySizeType.instanceCount: 'INSTANCE_COUNT',
  CapacitySizeType.capacityPercent: 'CAPACITY_PERCENT',
};

CaptureContentTypeHeader _$CaptureContentTypeHeaderFromJson(
    Map<String, dynamic> json) {
  return CaptureContentTypeHeader(
    csvContentTypes: (json['CsvContentTypes'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    jsonContentTypes: (json['JsonContentTypes'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$CaptureContentTypeHeaderToJson(
    CaptureContentTypeHeader instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CsvContentTypes', instance.csvContentTypes);
  writeNotNull('JsonContentTypes', instance.jsonContentTypes);
  return val;
}

CaptureOption _$CaptureOptionFromJson(Map<String, dynamic> json) {
  return CaptureOption(
    captureMode: _$enumDecode(_$CaptureModeEnumMap, json['CaptureMode']),
  );
}

Map<String, dynamic> _$CaptureOptionToJson(CaptureOption instance) =>
    <String, dynamic>{
      'CaptureMode': _$CaptureModeEnumMap[instance.captureMode],
    };

const _$CaptureModeEnumMap = {
  CaptureMode.input: 'Input',
  CaptureMode.output: 'Output',
};

CategoricalParameterRange _$CategoricalParameterRangeFromJson(
    Map<String, dynamic> json) {
  return CategoricalParameterRange(
    name: json['Name'] as String,
    values: (json['Values'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$CategoricalParameterRangeToJson(
        CategoricalParameterRange instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Values': instance.values,
    };

CategoricalParameterRangeSpecification
    _$CategoricalParameterRangeSpecificationFromJson(
        Map<String, dynamic> json) {
  return CategoricalParameterRangeSpecification(
    values: (json['Values'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$CategoricalParameterRangeSpecificationToJson(
        CategoricalParameterRangeSpecification instance) =>
    <String, dynamic>{
      'Values': instance.values,
    };

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel(
    channelName: json['ChannelName'] as String,
    dataSource: DataSource.fromJson(json['DataSource'] as Map<String, dynamic>),
    compressionType:
        _$enumDecodeNullable(_$CompressionTypeEnumMap, json['CompressionType']),
    contentType: json['ContentType'] as String?,
    inputMode:
        _$enumDecodeNullable(_$TrainingInputModeEnumMap, json['InputMode']),
    recordWrapperType:
        _$enumDecodeNullable(_$RecordWrapperEnumMap, json['RecordWrapperType']),
    shuffleConfig: json['ShuffleConfig'] == null
        ? null
        : ShuffleConfig.fromJson(json['ShuffleConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChannelToJson(Channel instance) {
  final val = <String, dynamic>{
    'ChannelName': instance.channelName,
    'DataSource': instance.dataSource.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CompressionType', _$CompressionTypeEnumMap[instance.compressionType]);
  writeNotNull('ContentType', instance.contentType);
  writeNotNull('InputMode', _$TrainingInputModeEnumMap[instance.inputMode]);
  writeNotNull(
      'RecordWrapperType', _$RecordWrapperEnumMap[instance.recordWrapperType]);
  writeNotNull('ShuffleConfig', instance.shuffleConfig?.toJson());
  return val;
}

const _$RecordWrapperEnumMap = {
  RecordWrapper.none: 'None',
  RecordWrapper.recordIO: 'RecordIO',
};

ChannelSpecification _$ChannelSpecificationFromJson(Map<String, dynamic> json) {
  return ChannelSpecification(
    name: json['Name'] as String,
    supportedContentTypes: (json['SupportedContentTypes'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    supportedInputModes: (json['SupportedInputModes'] as List<dynamic>)
        .map((e) => _$enumDecode(_$TrainingInputModeEnumMap, e))
        .toList(),
    description: json['Description'] as String?,
    isRequired: json['IsRequired'] as bool?,
    supportedCompressionTypes:
        (json['SupportedCompressionTypes'] as List<dynamic>?)
            ?.map((e) => _$enumDecode(_$CompressionTypeEnumMap, e))
            .toList(),
  );
}

Map<String, dynamic> _$ChannelSpecificationToJson(
    ChannelSpecification instance) {
  final val = <String, dynamic>{
    'Name': instance.name,
    'SupportedContentTypes': instance.supportedContentTypes,
    'SupportedInputModes': instance.supportedInputModes
        .map((e) => _$TrainingInputModeEnumMap[e])
        .toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Description', instance.description);
  writeNotNull('IsRequired', instance.isRequired);
  writeNotNull(
      'SupportedCompressionTypes',
      instance.supportedCompressionTypes
          ?.map((e) => _$CompressionTypeEnumMap[e])
          .toList());
  return val;
}

CheckpointConfig _$CheckpointConfigFromJson(Map<String, dynamic> json) {
  return CheckpointConfig(
    s3Uri: json['S3Uri'] as String,
    localPath: json['LocalPath'] as String?,
  );
}

Map<String, dynamic> _$CheckpointConfigToJson(CheckpointConfig instance) {
  final val = <String, dynamic>{
    'S3Uri': instance.s3Uri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LocalPath', instance.localPath);
  return val;
}

CodeRepositorySummary _$CodeRepositorySummaryFromJson(
    Map<String, dynamic> json) {
  return CodeRepositorySummary(
    codeRepositoryArn: json['CodeRepositoryArn'] as String,
    codeRepositoryName: json['CodeRepositoryName'] as String,
    creationTime: DateTime.parse(json['CreationTime'] as String),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    gitConfig: json['GitConfig'] == null
        ? null
        : GitConfig.fromJson(json['GitConfig'] as Map<String, dynamic>),
  );
}

CognitoConfig _$CognitoConfigFromJson(Map<String, dynamic> json) {
  return CognitoConfig(
    clientId: json['ClientId'] as String,
    userPool: json['UserPool'] as String,
  );
}

Map<String, dynamic> _$CognitoConfigToJson(CognitoConfig instance) =>
    <String, dynamic>{
      'ClientId': instance.clientId,
      'UserPool': instance.userPool,
    };

CognitoMemberDefinition _$CognitoMemberDefinitionFromJson(
    Map<String, dynamic> json) {
  return CognitoMemberDefinition(
    clientId: json['ClientId'] as String,
    userGroup: json['UserGroup'] as String,
    userPool: json['UserPool'] as String,
  );
}

Map<String, dynamic> _$CognitoMemberDefinitionToJson(
        CognitoMemberDefinition instance) =>
    <String, dynamic>{
      'ClientId': instance.clientId,
      'UserGroup': instance.userGroup,
      'UserPool': instance.userPool,
    };

CollectionConfiguration _$CollectionConfigurationFromJson(
    Map<String, dynamic> json) {
  return CollectionConfiguration(
    collectionName: json['CollectionName'] as String?,
    collectionParameters:
        (json['CollectionParameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$CollectionConfigurationToJson(
    CollectionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CollectionName', instance.collectionName);
  writeNotNull('CollectionParameters', instance.collectionParameters);
  return val;
}

CompilationJobSummary _$CompilationJobSummaryFromJson(
    Map<String, dynamic> json) {
  return CompilationJobSummary(
    compilationJobArn: json['CompilationJobArn'] as String,
    compilationJobName: json['CompilationJobName'] as String,
    compilationJobStatus: _$enumDecode(
        _$CompilationJobStatusEnumMap, json['CompilationJobStatus']),
    creationTime: DateTime.parse(json['CreationTime'] as String),
    compilationEndTime:
        const UnixDateTimeConverter().fromJson(json['CompilationEndTime']),
    compilationStartTime:
        const UnixDateTimeConverter().fromJson(json['CompilationStartTime']),
    compilationTargetDevice: _$enumDecodeNullable(
        _$TargetDeviceEnumMap, json['CompilationTargetDevice']),
    compilationTargetPlatformAccelerator: _$enumDecodeNullable(
        _$TargetPlatformAcceleratorEnumMap,
        json['CompilationTargetPlatformAccelerator']),
    compilationTargetPlatformArch: _$enumDecodeNullable(
        _$TargetPlatformArchEnumMap, json['CompilationTargetPlatformArch']),
    compilationTargetPlatformOs: _$enumDecodeNullable(
        _$TargetPlatformOsEnumMap, json['CompilationTargetPlatformOs']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
  );
}

const _$CompilationJobStatusEnumMap = {
  CompilationJobStatus.inprogress: 'INPROGRESS',
  CompilationJobStatus.completed: 'COMPLETED',
  CompilationJobStatus.failed: 'FAILED',
  CompilationJobStatus.starting: 'STARTING',
  CompilationJobStatus.stopping: 'STOPPING',
  CompilationJobStatus.stopped: 'STOPPED',
};

const _$TargetDeviceEnumMap = {
  TargetDevice.lambda: 'lambda',
  TargetDevice.mlM4: 'ml_m4',
  TargetDevice.mlM5: 'ml_m5',
  TargetDevice.mlC4: 'ml_c4',
  TargetDevice.mlC5: 'ml_c5',
  TargetDevice.mlP2: 'ml_p2',
  TargetDevice.mlP3: 'ml_p3',
  TargetDevice.mlG4dn: 'ml_g4dn',
  TargetDevice.mlInf1: 'ml_inf1',
  TargetDevice.jetsonTx1: 'jetson_tx1',
  TargetDevice.jetsonTx2: 'jetson_tx2',
  TargetDevice.jetsonNano: 'jetson_nano',
  TargetDevice.jetsonXavier: 'jetson_xavier',
  TargetDevice.rasp3b: 'rasp3b',
  TargetDevice.imx8qm: 'imx8qm',
  TargetDevice.deeplens: 'deeplens',
  TargetDevice.rk3399: 'rk3399',
  TargetDevice.rk3288: 'rk3288',
  TargetDevice.aisage: 'aisage',
  TargetDevice.sbeC: 'sbe_c',
  TargetDevice.qcs605: 'qcs605',
  TargetDevice.qcs603: 'qcs603',
  TargetDevice.sitaraAm57x: 'sitara_am57x',
  TargetDevice.ambaCv22: 'amba_cv22',
  TargetDevice.x86Win32: 'x86_win32',
  TargetDevice.x86Win64: 'x86_win64',
  TargetDevice.coreml: 'coreml',
  TargetDevice.jacintoTda4vm: 'jacinto_tda4vm',
};

const _$TargetPlatformAcceleratorEnumMap = {
  TargetPlatformAccelerator.intelGraphics: 'INTEL_GRAPHICS',
  TargetPlatformAccelerator.mali: 'MALI',
  TargetPlatformAccelerator.nvidia: 'NVIDIA',
};

const _$TargetPlatformArchEnumMap = {
  TargetPlatformArch.x86_64: 'X86_64',
  TargetPlatformArch.x86: 'X86',
  TargetPlatformArch.arm64: 'ARM64',
  TargetPlatformArch.armEabi: 'ARM_EABI',
  TargetPlatformArch.armEabihf: 'ARM_EABIHF',
};

const _$TargetPlatformOsEnumMap = {
  TargetPlatformOs.android: 'ANDROID',
  TargetPlatformOs.linux: 'LINUX',
};

ConditionStepMetadata _$ConditionStepMetadataFromJson(
    Map<String, dynamic> json) {
  return ConditionStepMetadata(
    outcome: _$enumDecodeNullable(_$ConditionOutcomeEnumMap, json['Outcome']),
  );
}

const _$ConditionOutcomeEnumMap = {
  ConditionOutcome.$true: 'True',
  ConditionOutcome.$false: 'False',
};

ContainerDefinition _$ContainerDefinitionFromJson(Map<String, dynamic> json) {
  return ContainerDefinition(
    containerHostname: json['ContainerHostname'] as String?,
    environment: (json['Environment'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    image: json['Image'] as String?,
    imageConfig: json['ImageConfig'] == null
        ? null
        : ImageConfig.fromJson(json['ImageConfig'] as Map<String, dynamic>),
    mode: _$enumDecodeNullable(_$ContainerModeEnumMap, json['Mode']),
    modelDataUrl: json['ModelDataUrl'] as String?,
    modelPackageName: json['ModelPackageName'] as String?,
  );
}

Map<String, dynamic> _$ContainerDefinitionToJson(ContainerDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerHostname', instance.containerHostname);
  writeNotNull('Environment', instance.environment);
  writeNotNull('Image', instance.image);
  writeNotNull('ImageConfig', instance.imageConfig?.toJson());
  writeNotNull('Mode', _$ContainerModeEnumMap[instance.mode]);
  writeNotNull('ModelDataUrl', instance.modelDataUrl);
  writeNotNull('ModelPackageName', instance.modelPackageName);
  return val;
}

const _$ContainerModeEnumMap = {
  ContainerMode.singleModel: 'SingleModel',
  ContainerMode.multiModel: 'MultiModel',
};

ContextSource _$ContextSourceFromJson(Map<String, dynamic> json) {
  return ContextSource(
    sourceUri: json['SourceUri'] as String,
    sourceId: json['SourceId'] as String?,
    sourceType: json['SourceType'] as String?,
  );
}

Map<String, dynamic> _$ContextSourceToJson(ContextSource instance) {
  final val = <String, dynamic>{
    'SourceUri': instance.sourceUri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceId', instance.sourceId);
  writeNotNull('SourceType', instance.sourceType);
  return val;
}

ContextSummary _$ContextSummaryFromJson(Map<String, dynamic> json) {
  return ContextSummary(
    contextArn: json['ContextArn'] as String?,
    contextName: json['ContextName'] as String?,
    contextType: json['ContextType'] as String?,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    source: json['Source'] == null
        ? null
        : ContextSource.fromJson(json['Source'] as Map<String, dynamic>),
  );
}

ContinuousParameterRange _$ContinuousParameterRangeFromJson(
    Map<String, dynamic> json) {
  return ContinuousParameterRange(
    maxValue: json['MaxValue'] as String,
    minValue: json['MinValue'] as String,
    name: json['Name'] as String,
    scalingType: _$enumDecodeNullable(
        _$HyperParameterScalingTypeEnumMap, json['ScalingType']),
  );
}

Map<String, dynamic> _$ContinuousParameterRangeToJson(
    ContinuousParameterRange instance) {
  final val = <String, dynamic>{
    'MaxValue': instance.maxValue,
    'MinValue': instance.minValue,
    'Name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ScalingType', _$HyperParameterScalingTypeEnumMap[instance.scalingType]);
  return val;
}

const _$HyperParameterScalingTypeEnumMap = {
  HyperParameterScalingType.auto: 'Auto',
  HyperParameterScalingType.linear: 'Linear',
  HyperParameterScalingType.logarithmic: 'Logarithmic',
  HyperParameterScalingType.reverseLogarithmic: 'ReverseLogarithmic',
};

ContinuousParameterRangeSpecification
    _$ContinuousParameterRangeSpecificationFromJson(Map<String, dynamic> json) {
  return ContinuousParameterRangeSpecification(
    maxValue: json['MaxValue'] as String,
    minValue: json['MinValue'] as String,
  );
}

Map<String, dynamic> _$ContinuousParameterRangeSpecificationToJson(
        ContinuousParameterRangeSpecification instance) =>
    <String, dynamic>{
      'MaxValue': instance.maxValue,
      'MinValue': instance.minValue,
    };

CreateActionResponse _$CreateActionResponseFromJson(Map<String, dynamic> json) {
  return CreateActionResponse(
    actionArn: json['ActionArn'] as String?,
  );
}

CreateAlgorithmOutput _$CreateAlgorithmOutputFromJson(
    Map<String, dynamic> json) {
  return CreateAlgorithmOutput(
    algorithmArn: json['AlgorithmArn'] as String,
  );
}

CreateAppImageConfigResponse _$CreateAppImageConfigResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAppImageConfigResponse(
    appImageConfigArn: json['AppImageConfigArn'] as String?,
  );
}

CreateAppResponse _$CreateAppResponseFromJson(Map<String, dynamic> json) {
  return CreateAppResponse(
    appArn: json['AppArn'] as String?,
  );
}

CreateArtifactResponse _$CreateArtifactResponseFromJson(
    Map<String, dynamic> json) {
  return CreateArtifactResponse(
    artifactArn: json['ArtifactArn'] as String?,
  );
}

CreateAutoMLJobResponse _$CreateAutoMLJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAutoMLJobResponse(
    autoMLJobArn: json['AutoMLJobArn'] as String,
  );
}

CreateCodeRepositoryOutput _$CreateCodeRepositoryOutputFromJson(
    Map<String, dynamic> json) {
  return CreateCodeRepositoryOutput(
    codeRepositoryArn: json['CodeRepositoryArn'] as String,
  );
}

CreateCompilationJobResponse _$CreateCompilationJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCompilationJobResponse(
    compilationJobArn: json['CompilationJobArn'] as String,
  );
}

CreateContextResponse _$CreateContextResponseFromJson(
    Map<String, dynamic> json) {
  return CreateContextResponse(
    contextArn: json['ContextArn'] as String?,
  );
}

CreateDataQualityJobDefinitionResponse
    _$CreateDataQualityJobDefinitionResponseFromJson(
        Map<String, dynamic> json) {
  return CreateDataQualityJobDefinitionResponse(
    jobDefinitionArn: json['JobDefinitionArn'] as String,
  );
}

CreateDomainResponse _$CreateDomainResponseFromJson(Map<String, dynamic> json) {
  return CreateDomainResponse(
    domainArn: json['DomainArn'] as String?,
    url: json['Url'] as String?,
  );
}

CreateEndpointConfigOutput _$CreateEndpointConfigOutputFromJson(
    Map<String, dynamic> json) {
  return CreateEndpointConfigOutput(
    endpointConfigArn: json['EndpointConfigArn'] as String,
  );
}

CreateEndpointOutput _$CreateEndpointOutputFromJson(Map<String, dynamic> json) {
  return CreateEndpointOutput(
    endpointArn: json['EndpointArn'] as String,
  );
}

CreateExperimentResponse _$CreateExperimentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateExperimentResponse(
    experimentArn: json['ExperimentArn'] as String?,
  );
}

CreateFeatureGroupResponse _$CreateFeatureGroupResponseFromJson(
    Map<String, dynamic> json) {
  return CreateFeatureGroupResponse(
    featureGroupArn: json['FeatureGroupArn'] as String,
  );
}

CreateFlowDefinitionResponse _$CreateFlowDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateFlowDefinitionResponse(
    flowDefinitionArn: json['FlowDefinitionArn'] as String,
  );
}

CreateHumanTaskUiResponse _$CreateHumanTaskUiResponseFromJson(
    Map<String, dynamic> json) {
  return CreateHumanTaskUiResponse(
    humanTaskUiArn: json['HumanTaskUiArn'] as String,
  );
}

CreateHyperParameterTuningJobResponse
    _$CreateHyperParameterTuningJobResponseFromJson(Map<String, dynamic> json) {
  return CreateHyperParameterTuningJobResponse(
    hyperParameterTuningJobArn: json['HyperParameterTuningJobArn'] as String,
  );
}

CreateImageResponse _$CreateImageResponseFromJson(Map<String, dynamic> json) {
  return CreateImageResponse(
    imageArn: json['ImageArn'] as String?,
  );
}

CreateImageVersionResponse _$CreateImageVersionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateImageVersionResponse(
    imageVersionArn: json['ImageVersionArn'] as String?,
  );
}

CreateLabelingJobResponse _$CreateLabelingJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLabelingJobResponse(
    labelingJobArn: json['LabelingJobArn'] as String,
  );
}

CreateModelBiasJobDefinitionResponse
    _$CreateModelBiasJobDefinitionResponseFromJson(Map<String, dynamic> json) {
  return CreateModelBiasJobDefinitionResponse(
    jobDefinitionArn: json['JobDefinitionArn'] as String,
  );
}

CreateModelExplainabilityJobDefinitionResponse
    _$CreateModelExplainabilityJobDefinitionResponseFromJson(
        Map<String, dynamic> json) {
  return CreateModelExplainabilityJobDefinitionResponse(
    jobDefinitionArn: json['JobDefinitionArn'] as String,
  );
}

CreateModelOutput _$CreateModelOutputFromJson(Map<String, dynamic> json) {
  return CreateModelOutput(
    modelArn: json['ModelArn'] as String,
  );
}

CreateModelPackageGroupOutput _$CreateModelPackageGroupOutputFromJson(
    Map<String, dynamic> json) {
  return CreateModelPackageGroupOutput(
    modelPackageGroupArn: json['ModelPackageGroupArn'] as String,
  );
}

CreateModelPackageOutput _$CreateModelPackageOutputFromJson(
    Map<String, dynamic> json) {
  return CreateModelPackageOutput(
    modelPackageArn: json['ModelPackageArn'] as String,
  );
}

CreateModelQualityJobDefinitionResponse
    _$CreateModelQualityJobDefinitionResponseFromJson(
        Map<String, dynamic> json) {
  return CreateModelQualityJobDefinitionResponse(
    jobDefinitionArn: json['JobDefinitionArn'] as String,
  );
}

CreateMonitoringScheduleResponse _$CreateMonitoringScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return CreateMonitoringScheduleResponse(
    monitoringScheduleArn: json['MonitoringScheduleArn'] as String,
  );
}

CreateNotebookInstanceLifecycleConfigOutput
    _$CreateNotebookInstanceLifecycleConfigOutputFromJson(
        Map<String, dynamic> json) {
  return CreateNotebookInstanceLifecycleConfigOutput(
    notebookInstanceLifecycleConfigArn:
        json['NotebookInstanceLifecycleConfigArn'] as String?,
  );
}

CreateNotebookInstanceOutput _$CreateNotebookInstanceOutputFromJson(
    Map<String, dynamic> json) {
  return CreateNotebookInstanceOutput(
    notebookInstanceArn: json['NotebookInstanceArn'] as String?,
  );
}

CreatePipelineResponse _$CreatePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePipelineResponse(
    pipelineArn: json['PipelineArn'] as String?,
  );
}

CreatePresignedDomainUrlResponse _$CreatePresignedDomainUrlResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePresignedDomainUrlResponse(
    authorizedUrl: json['AuthorizedUrl'] as String?,
  );
}

CreatePresignedNotebookInstanceUrlOutput
    _$CreatePresignedNotebookInstanceUrlOutputFromJson(
        Map<String, dynamic> json) {
  return CreatePresignedNotebookInstanceUrlOutput(
    authorizedUrl: json['AuthorizedUrl'] as String?,
  );
}

CreateProcessingJobResponse _$CreateProcessingJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProcessingJobResponse(
    processingJobArn: json['ProcessingJobArn'] as String,
  );
}

CreateProjectOutput _$CreateProjectOutputFromJson(Map<String, dynamic> json) {
  return CreateProjectOutput(
    projectArn: json['ProjectArn'] as String,
    projectId: json['ProjectId'] as String,
  );
}

CreateTrainingJobResponse _$CreateTrainingJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateTrainingJobResponse(
    trainingJobArn: json['TrainingJobArn'] as String,
  );
}

CreateTransformJobResponse _$CreateTransformJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateTransformJobResponse(
    transformJobArn: json['TransformJobArn'] as String,
  );
}

CreateTrialComponentResponse _$CreateTrialComponentResponseFromJson(
    Map<String, dynamic> json) {
  return CreateTrialComponentResponse(
    trialComponentArn: json['TrialComponentArn'] as String?,
  );
}

CreateTrialResponse _$CreateTrialResponseFromJson(Map<String, dynamic> json) {
  return CreateTrialResponse(
    trialArn: json['TrialArn'] as String?,
  );
}

CreateUserProfileResponse _$CreateUserProfileResponseFromJson(
    Map<String, dynamic> json) {
  return CreateUserProfileResponse(
    userProfileArn: json['UserProfileArn'] as String?,
  );
}

CreateWorkforceResponse _$CreateWorkforceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWorkforceResponse(
    workforceArn: json['WorkforceArn'] as String,
  );
}

CreateWorkteamResponse _$CreateWorkteamResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWorkteamResponse(
    workteamArn: json['WorkteamArn'] as String?,
  );
}

CustomImage _$CustomImageFromJson(Map<String, dynamic> json) {
  return CustomImage(
    appImageConfigName: json['AppImageConfigName'] as String,
    imageName: json['ImageName'] as String,
    imageVersionNumber: json['ImageVersionNumber'] as int?,
  );
}

Map<String, dynamic> _$CustomImageToJson(CustomImage instance) {
  final val = <String, dynamic>{
    'AppImageConfigName': instance.appImageConfigName,
    'ImageName': instance.imageName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ImageVersionNumber', instance.imageVersionNumber);
  return val;
}

DataCaptureConfig _$DataCaptureConfigFromJson(Map<String, dynamic> json) {
  return DataCaptureConfig(
    captureOptions: (json['CaptureOptions'] as List<dynamic>)
        .map((e) => CaptureOption.fromJson(e as Map<String, dynamic>))
        .toList(),
    destinationS3Uri: json['DestinationS3Uri'] as String,
    initialSamplingPercentage: json['InitialSamplingPercentage'] as int,
    captureContentTypeHeader: json['CaptureContentTypeHeader'] == null
        ? null
        : CaptureContentTypeHeader.fromJson(
            json['CaptureContentTypeHeader'] as Map<String, dynamic>),
    enableCapture: json['EnableCapture'] as bool?,
    kmsKeyId: json['KmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$DataCaptureConfigToJson(DataCaptureConfig instance) {
  final val = <String, dynamic>{
    'CaptureOptions': instance.captureOptions.map((e) => e.toJson()).toList(),
    'DestinationS3Uri': instance.destinationS3Uri,
    'InitialSamplingPercentage': instance.initialSamplingPercentage,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CaptureContentTypeHeader', instance.captureContentTypeHeader?.toJson());
  writeNotNull('EnableCapture', instance.enableCapture);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

DataCaptureConfigSummary _$DataCaptureConfigSummaryFromJson(
    Map<String, dynamic> json) {
  return DataCaptureConfigSummary(
    captureStatus: _$enumDecode(_$CaptureStatusEnumMap, json['CaptureStatus']),
    currentSamplingPercentage: json['CurrentSamplingPercentage'] as int,
    destinationS3Uri: json['DestinationS3Uri'] as String,
    enableCapture: json['EnableCapture'] as bool,
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

const _$CaptureStatusEnumMap = {
  CaptureStatus.started: 'Started',
  CaptureStatus.stopped: 'Stopped',
};

DataCatalogConfig _$DataCatalogConfigFromJson(Map<String, dynamic> json) {
  return DataCatalogConfig(
    catalog: json['Catalog'] as String,
    database: json['Database'] as String,
    tableName: json['TableName'] as String,
  );
}

Map<String, dynamic> _$DataCatalogConfigToJson(DataCatalogConfig instance) =>
    <String, dynamic>{
      'Catalog': instance.catalog,
      'Database': instance.database,
      'TableName': instance.tableName,
    };

DataProcessing _$DataProcessingFromJson(Map<String, dynamic> json) {
  return DataProcessing(
    inputFilter: json['InputFilter'] as String?,
    joinSource: _$enumDecodeNullable(_$JoinSourceEnumMap, json['JoinSource']),
    outputFilter: json['OutputFilter'] as String?,
  );
}

Map<String, dynamic> _$DataProcessingToJson(DataProcessing instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InputFilter', instance.inputFilter);
  writeNotNull('JoinSource', _$JoinSourceEnumMap[instance.joinSource]);
  writeNotNull('OutputFilter', instance.outputFilter);
  return val;
}

const _$JoinSourceEnumMap = {
  JoinSource.input: 'Input',
  JoinSource.none: 'None',
};

DataQualityAppSpecification _$DataQualityAppSpecificationFromJson(
    Map<String, dynamic> json) {
  return DataQualityAppSpecification(
    imageUri: json['ImageUri'] as String,
    containerArguments: (json['ContainerArguments'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    containerEntrypoint: (json['ContainerEntrypoint'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    environment: (json['Environment'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    postAnalyticsProcessorSourceUri:
        json['PostAnalyticsProcessorSourceUri'] as String?,
    recordPreprocessorSourceUri: json['RecordPreprocessorSourceUri'] as String?,
  );
}

Map<String, dynamic> _$DataQualityAppSpecificationToJson(
    DataQualityAppSpecification instance) {
  final val = <String, dynamic>{
    'ImageUri': instance.imageUri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerArguments', instance.containerArguments);
  writeNotNull('ContainerEntrypoint', instance.containerEntrypoint);
  writeNotNull('Environment', instance.environment);
  writeNotNull('PostAnalyticsProcessorSourceUri',
      instance.postAnalyticsProcessorSourceUri);
  writeNotNull(
      'RecordPreprocessorSourceUri', instance.recordPreprocessorSourceUri);
  return val;
}

DataQualityBaselineConfig _$DataQualityBaselineConfigFromJson(
    Map<String, dynamic> json) {
  return DataQualityBaselineConfig(
    baseliningJobName: json['BaseliningJobName'] as String?,
    constraintsResource: json['ConstraintsResource'] == null
        ? null
        : MonitoringConstraintsResource.fromJson(
            json['ConstraintsResource'] as Map<String, dynamic>),
    statisticsResource: json['StatisticsResource'] == null
        ? null
        : MonitoringStatisticsResource.fromJson(
            json['StatisticsResource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataQualityBaselineConfigToJson(
    DataQualityBaselineConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaseliningJobName', instance.baseliningJobName);
  writeNotNull('ConstraintsResource', instance.constraintsResource?.toJson());
  writeNotNull('StatisticsResource', instance.statisticsResource?.toJson());
  return val;
}

DataQualityJobInput _$DataQualityJobInputFromJson(Map<String, dynamic> json) {
  return DataQualityJobInput(
    endpointInput:
        EndpointInput.fromJson(json['EndpointInput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataQualityJobInputToJson(
        DataQualityJobInput instance) =>
    <String, dynamic>{
      'EndpointInput': instance.endpointInput.toJson(),
    };

DataSource _$DataSourceFromJson(Map<String, dynamic> json) {
  return DataSource(
    fileSystemDataSource: json['FileSystemDataSource'] == null
        ? null
        : FileSystemDataSource.fromJson(
            json['FileSystemDataSource'] as Map<String, dynamic>),
    s3DataSource: json['S3DataSource'] == null
        ? null
        : S3DataSource.fromJson(json['S3DataSource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataSourceToJson(DataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FileSystemDataSource', instance.fileSystemDataSource?.toJson());
  writeNotNull('S3DataSource', instance.s3DataSource?.toJson());
  return val;
}

DatasetDefinition _$DatasetDefinitionFromJson(Map<String, dynamic> json) {
  return DatasetDefinition(
    athenaDatasetDefinition: json['AthenaDatasetDefinition'] == null
        ? null
        : AthenaDatasetDefinition.fromJson(
            json['AthenaDatasetDefinition'] as Map<String, dynamic>),
    dataDistributionType: _$enumDecodeNullable(
        _$DataDistributionTypeEnumMap, json['DataDistributionType']),
    inputMode: _$enumDecodeNullable(_$InputModeEnumMap, json['InputMode']),
    localPath: json['LocalPath'] as String?,
    redshiftDatasetDefinition: json['RedshiftDatasetDefinition'] == null
        ? null
        : RedshiftDatasetDefinition.fromJson(
            json['RedshiftDatasetDefinition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DatasetDefinitionToJson(DatasetDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AthenaDatasetDefinition', instance.athenaDatasetDefinition?.toJson());
  writeNotNull('DataDistributionType',
      _$DataDistributionTypeEnumMap[instance.dataDistributionType]);
  writeNotNull('InputMode', _$InputModeEnumMap[instance.inputMode]);
  writeNotNull('LocalPath', instance.localPath);
  writeNotNull('RedshiftDatasetDefinition',
      instance.redshiftDatasetDefinition?.toJson());
  return val;
}

const _$DataDistributionTypeEnumMap = {
  DataDistributionType.fullyReplicated: 'FullyReplicated',
  DataDistributionType.shardedByS3Key: 'ShardedByS3Key',
};

const _$InputModeEnumMap = {
  InputMode.pipe: 'Pipe',
  InputMode.file: 'File',
};

DebugHookConfig _$DebugHookConfigFromJson(Map<String, dynamic> json) {
  return DebugHookConfig(
    s3OutputPath: json['S3OutputPath'] as String,
    collectionConfigurations: (json['CollectionConfigurations']
            as List<dynamic>?)
        ?.map(
            (e) => CollectionConfiguration.fromJson(e as Map<String, dynamic>))
        .toList(),
    hookParameters: (json['HookParameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    localPath: json['LocalPath'] as String?,
  );
}

Map<String, dynamic> _$DebugHookConfigToJson(DebugHookConfig instance) {
  final val = <String, dynamic>{
    'S3OutputPath': instance.s3OutputPath,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CollectionConfigurations',
      instance.collectionConfigurations?.map((e) => e.toJson()).toList());
  writeNotNull('HookParameters', instance.hookParameters);
  writeNotNull('LocalPath', instance.localPath);
  return val;
}

DebugRuleConfiguration _$DebugRuleConfigurationFromJson(
    Map<String, dynamic> json) {
  return DebugRuleConfiguration(
    ruleConfigurationName: json['RuleConfigurationName'] as String,
    ruleEvaluatorImage: json['RuleEvaluatorImage'] as String,
    instanceType: _$enumDecodeNullable(
        _$ProcessingInstanceTypeEnumMap, json['InstanceType']),
    localPath: json['LocalPath'] as String?,
    ruleParameters: (json['RuleParameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    s3OutputPath: json['S3OutputPath'] as String?,
    volumeSizeInGB: json['VolumeSizeInGB'] as int?,
  );
}

Map<String, dynamic> _$DebugRuleConfigurationToJson(
    DebugRuleConfiguration instance) {
  final val = <String, dynamic>{
    'RuleConfigurationName': instance.ruleConfigurationName,
    'RuleEvaluatorImage': instance.ruleEvaluatorImage,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'InstanceType', _$ProcessingInstanceTypeEnumMap[instance.instanceType]);
  writeNotNull('LocalPath', instance.localPath);
  writeNotNull('RuleParameters', instance.ruleParameters);
  writeNotNull('S3OutputPath', instance.s3OutputPath);
  writeNotNull('VolumeSizeInGB', instance.volumeSizeInGB);
  return val;
}

const _$ProcessingInstanceTypeEnumMap = {
  ProcessingInstanceType.mlT3Medium: 'ml.t3.medium',
  ProcessingInstanceType.mlT3Large: 'ml.t3.large',
  ProcessingInstanceType.mlT3Xlarge: 'ml.t3.xlarge',
  ProcessingInstanceType.mlT3_2xlarge: 'ml.t3.2xlarge',
  ProcessingInstanceType.mlM4Xlarge: 'ml.m4.xlarge',
  ProcessingInstanceType.mlM4_2xlarge: 'ml.m4.2xlarge',
  ProcessingInstanceType.mlM4_4xlarge: 'ml.m4.4xlarge',
  ProcessingInstanceType.mlM4_10xlarge: 'ml.m4.10xlarge',
  ProcessingInstanceType.mlM4_16xlarge: 'ml.m4.16xlarge',
  ProcessingInstanceType.mlC4Xlarge: 'ml.c4.xlarge',
  ProcessingInstanceType.mlC4_2xlarge: 'ml.c4.2xlarge',
  ProcessingInstanceType.mlC4_4xlarge: 'ml.c4.4xlarge',
  ProcessingInstanceType.mlC4_8xlarge: 'ml.c4.8xlarge',
  ProcessingInstanceType.mlP2Xlarge: 'ml.p2.xlarge',
  ProcessingInstanceType.mlP2_8xlarge: 'ml.p2.8xlarge',
  ProcessingInstanceType.mlP2_16xlarge: 'ml.p2.16xlarge',
  ProcessingInstanceType.mlP3_2xlarge: 'ml.p3.2xlarge',
  ProcessingInstanceType.mlP3_8xlarge: 'ml.p3.8xlarge',
  ProcessingInstanceType.mlP3_16xlarge: 'ml.p3.16xlarge',
  ProcessingInstanceType.mlC5Xlarge: 'ml.c5.xlarge',
  ProcessingInstanceType.mlC5_2xlarge: 'ml.c5.2xlarge',
  ProcessingInstanceType.mlC5_4xlarge: 'ml.c5.4xlarge',
  ProcessingInstanceType.mlC5_9xlarge: 'ml.c5.9xlarge',
  ProcessingInstanceType.mlC5_18xlarge: 'ml.c5.18xlarge',
  ProcessingInstanceType.mlM5Large: 'ml.m5.large',
  ProcessingInstanceType.mlM5Xlarge: 'ml.m5.xlarge',
  ProcessingInstanceType.mlM5_2xlarge: 'ml.m5.2xlarge',
  ProcessingInstanceType.mlM5_4xlarge: 'ml.m5.4xlarge',
  ProcessingInstanceType.mlM5_12xlarge: 'ml.m5.12xlarge',
  ProcessingInstanceType.mlM5_24xlarge: 'ml.m5.24xlarge',
  ProcessingInstanceType.mlR5Large: 'ml.r5.large',
  ProcessingInstanceType.mlR5Xlarge: 'ml.r5.xlarge',
  ProcessingInstanceType.mlR5_2xlarge: 'ml.r5.2xlarge',
  ProcessingInstanceType.mlR5_4xlarge: 'ml.r5.4xlarge',
  ProcessingInstanceType.mlR5_8xlarge: 'ml.r5.8xlarge',
  ProcessingInstanceType.mlR5_12xlarge: 'ml.r5.12xlarge',
  ProcessingInstanceType.mlR5_16xlarge: 'ml.r5.16xlarge',
  ProcessingInstanceType.mlR5_24xlarge: 'ml.r5.24xlarge',
};

DebugRuleEvaluationStatus _$DebugRuleEvaluationStatusFromJson(
    Map<String, dynamic> json) {
  return DebugRuleEvaluationStatus(
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    ruleConfigurationName: json['RuleConfigurationName'] as String?,
    ruleEvaluationJobArn: json['RuleEvaluationJobArn'] as String?,
    ruleEvaluationStatus: _$enumDecodeNullable(
        _$RuleEvaluationStatusEnumMap, json['RuleEvaluationStatus']),
    statusDetails: json['StatusDetails'] as String?,
  );
}

const _$RuleEvaluationStatusEnumMap = {
  RuleEvaluationStatus.inProgress: 'InProgress',
  RuleEvaluationStatus.noIssuesFound: 'NoIssuesFound',
  RuleEvaluationStatus.issuesFound: 'IssuesFound',
  RuleEvaluationStatus.error: 'Error',
  RuleEvaluationStatus.stopping: 'Stopping',
  RuleEvaluationStatus.stopped: 'Stopped',
};

DeleteActionResponse _$DeleteActionResponseFromJson(Map<String, dynamic> json) {
  return DeleteActionResponse(
    actionArn: json['ActionArn'] as String?,
  );
}

DeleteArtifactResponse _$DeleteArtifactResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteArtifactResponse(
    artifactArn: json['ArtifactArn'] as String?,
  );
}

DeleteAssociationResponse _$DeleteAssociationResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteAssociationResponse(
    destinationArn: json['DestinationArn'] as String?,
    sourceArn: json['SourceArn'] as String?,
  );
}

DeleteContextResponse _$DeleteContextResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteContextResponse(
    contextArn: json['ContextArn'] as String?,
  );
}

DeleteExperimentResponse _$DeleteExperimentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteExperimentResponse(
    experimentArn: json['ExperimentArn'] as String?,
  );
}

DeleteFlowDefinitionResponse _$DeleteFlowDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteFlowDefinitionResponse();
}

DeleteHumanTaskUiResponse _$DeleteHumanTaskUiResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteHumanTaskUiResponse();
}

DeleteImageResponse _$DeleteImageResponseFromJson(Map<String, dynamic> json) {
  return DeleteImageResponse();
}

DeleteImageVersionResponse _$DeleteImageVersionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteImageVersionResponse();
}

DeletePipelineResponse _$DeletePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePipelineResponse(
    pipelineArn: json['PipelineArn'] as String?,
  );
}

DeleteTagsOutput _$DeleteTagsOutputFromJson(Map<String, dynamic> json) {
  return DeleteTagsOutput();
}

DeleteTrialComponentResponse _$DeleteTrialComponentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteTrialComponentResponse(
    trialComponentArn: json['TrialComponentArn'] as String?,
  );
}

DeleteTrialResponse _$DeleteTrialResponseFromJson(Map<String, dynamic> json) {
  return DeleteTrialResponse(
    trialArn: json['TrialArn'] as String?,
  );
}

DeleteWorkforceResponse _$DeleteWorkforceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteWorkforceResponse();
}

DeleteWorkteamResponse _$DeleteWorkteamResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteWorkteamResponse(
    success: json['Success'] as bool,
  );
}

DeployedImage _$DeployedImageFromJson(Map<String, dynamic> json) {
  return DeployedImage(
    resolutionTime:
        const UnixDateTimeConverter().fromJson(json['ResolutionTime']),
    resolvedImage: json['ResolvedImage'] as String?,
    specifiedImage: json['SpecifiedImage'] as String?,
  );
}

DeploymentConfig _$DeploymentConfigFromJson(Map<String, dynamic> json) {
  return DeploymentConfig(
    blueGreenUpdatePolicy: BlueGreenUpdatePolicy.fromJson(
        json['BlueGreenUpdatePolicy'] as Map<String, dynamic>),
    autoRollbackConfiguration: json['AutoRollbackConfiguration'] == null
        ? null
        : AutoRollbackConfig.fromJson(
            json['AutoRollbackConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeploymentConfigToJson(DeploymentConfig instance) {
  final val = <String, dynamic>{
    'BlueGreenUpdatePolicy': instance.blueGreenUpdatePolicy.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AutoRollbackConfiguration',
      instance.autoRollbackConfiguration?.toJson());
  return val;
}

DescribeActionResponse _$DescribeActionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeActionResponse(
    actionArn: json['ActionArn'] as String?,
    actionName: json['ActionName'] as String?,
    actionType: json['ActionType'] as String?,
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String?,
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    metadataProperties: json['MetadataProperties'] == null
        ? null
        : MetadataProperties.fromJson(
            json['MetadataProperties'] as Map<String, dynamic>),
    properties: (json['Properties'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    source: json['Source'] == null
        ? null
        : ActionSource.fromJson(json['Source'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$ActionStatusEnumMap, json['Status']),
  );
}

DescribeAlgorithmOutput _$DescribeAlgorithmOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeAlgorithmOutput(
    algorithmArn: json['AlgorithmArn'] as String,
    algorithmName: json['AlgorithmName'] as String,
    algorithmStatus:
        _$enumDecode(_$AlgorithmStatusEnumMap, json['AlgorithmStatus']),
    algorithmStatusDetails: AlgorithmStatusDetails.fromJson(
        json['AlgorithmStatusDetails'] as Map<String, dynamic>),
    creationTime: DateTime.parse(json['CreationTime'] as String),
    trainingSpecification: TrainingSpecification.fromJson(
        json['TrainingSpecification'] as Map<String, dynamic>),
    algorithmDescription: json['AlgorithmDescription'] as String?,
    certifyForMarketplace: json['CertifyForMarketplace'] as bool?,
    inferenceSpecification: json['InferenceSpecification'] == null
        ? null
        : InferenceSpecification.fromJson(
            json['InferenceSpecification'] as Map<String, dynamic>),
    productId: json['ProductId'] as String?,
    validationSpecification: json['ValidationSpecification'] == null
        ? null
        : AlgorithmValidationSpecification.fromJson(
            json['ValidationSpecification'] as Map<String, dynamic>),
  );
}

DescribeAppImageConfigResponse _$DescribeAppImageConfigResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAppImageConfigResponse(
    appImageConfigArn: json['AppImageConfigArn'] as String?,
    appImageConfigName: json['AppImageConfigName'] as String?,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    kernelGatewayImageConfig: json['KernelGatewayImageConfig'] == null
        ? null
        : KernelGatewayImageConfig.fromJson(
            json['KernelGatewayImageConfig'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
  );
}

DescribeAppResponse _$DescribeAppResponseFromJson(Map<String, dynamic> json) {
  return DescribeAppResponse(
    appArn: json['AppArn'] as String?,
    appName: json['AppName'] as String?,
    appType: _$enumDecodeNullable(_$AppTypeEnumMap, json['AppType']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    domainId: json['DomainId'] as String?,
    failureReason: json['FailureReason'] as String?,
    lastHealthCheckTimestamp: const UnixDateTimeConverter()
        .fromJson(json['LastHealthCheckTimestamp']),
    lastUserActivityTimestamp: const UnixDateTimeConverter()
        .fromJson(json['LastUserActivityTimestamp']),
    resourceSpec: json['ResourceSpec'] == null
        ? null
        : ResourceSpec.fromJson(json['ResourceSpec'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$AppStatusEnumMap, json['Status']),
    userProfileName: json['UserProfileName'] as String?,
  );
}

DescribeArtifactResponse _$DescribeArtifactResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeArtifactResponse(
    artifactArn: json['ArtifactArn'] as String?,
    artifactName: json['ArtifactName'] as String?,
    artifactType: json['ArtifactType'] as String?,
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    metadataProperties: json['MetadataProperties'] == null
        ? null
        : MetadataProperties.fromJson(
            json['MetadataProperties'] as Map<String, dynamic>),
    properties: (json['Properties'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    source: json['Source'] == null
        ? null
        : ArtifactSource.fromJson(json['Source'] as Map<String, dynamic>),
  );
}

DescribeAutoMLJobResponse _$DescribeAutoMLJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAutoMLJobResponse(
    autoMLJobArn: json['AutoMLJobArn'] as String,
    autoMLJobName: json['AutoMLJobName'] as String,
    autoMLJobSecondaryStatus: _$enumDecode(
        _$AutoMLJobSecondaryStatusEnumMap, json['AutoMLJobSecondaryStatus']),
    autoMLJobStatus:
        _$enumDecode(_$AutoMLJobStatusEnumMap, json['AutoMLJobStatus']),
    creationTime: DateTime.parse(json['CreationTime'] as String),
    inputDataConfig: (json['InputDataConfig'] as List<dynamic>)
        .map((e) => AutoMLChannel.fromJson(e as Map<String, dynamic>))
        .toList(),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    outputDataConfig: AutoMLOutputDataConfig.fromJson(
        json['OutputDataConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    autoMLJobArtifacts: json['AutoMLJobArtifacts'] == null
        ? null
        : AutoMLJobArtifacts.fromJson(
            json['AutoMLJobArtifacts'] as Map<String, dynamic>),
    autoMLJobConfig: json['AutoMLJobConfig'] == null
        ? null
        : AutoMLJobConfig.fromJson(
            json['AutoMLJobConfig'] as Map<String, dynamic>),
    autoMLJobObjective: json['AutoMLJobObjective'] == null
        ? null
        : AutoMLJobObjective.fromJson(
            json['AutoMLJobObjective'] as Map<String, dynamic>),
    bestCandidate: json['BestCandidate'] == null
        ? null
        : AutoMLCandidate.fromJson(
            json['BestCandidate'] as Map<String, dynamic>),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    failureReason: json['FailureReason'] as String?,
    generateCandidateDefinitionsOnly:
        json['GenerateCandidateDefinitionsOnly'] as bool?,
    problemType:
        _$enumDecodeNullable(_$ProblemTypeEnumMap, json['ProblemType']),
    resolvedAttributes: json['ResolvedAttributes'] == null
        ? null
        : ResolvedAttributes.fromJson(
            json['ResolvedAttributes'] as Map<String, dynamic>),
  );
}

const _$ProblemTypeEnumMap = {
  ProblemType.binaryClassification: 'BinaryClassification',
  ProblemType.multiclassClassification: 'MulticlassClassification',
  ProblemType.regression: 'Regression',
};

DescribeCodeRepositoryOutput _$DescribeCodeRepositoryOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeCodeRepositoryOutput(
    codeRepositoryArn: json['CodeRepositoryArn'] as String,
    codeRepositoryName: json['CodeRepositoryName'] as String,
    creationTime: DateTime.parse(json['CreationTime'] as String),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    gitConfig: json['GitConfig'] == null
        ? null
        : GitConfig.fromJson(json['GitConfig'] as Map<String, dynamic>),
  );
}

DescribeCompilationJobResponse _$DescribeCompilationJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCompilationJobResponse(
    compilationJobArn: json['CompilationJobArn'] as String,
    compilationJobName: json['CompilationJobName'] as String,
    compilationJobStatus: _$enumDecode(
        _$CompilationJobStatusEnumMap, json['CompilationJobStatus']),
    creationTime: DateTime.parse(json['CreationTime'] as String),
    failureReason: json['FailureReason'] as String,
    inputConfig:
        InputConfig.fromJson(json['InputConfig'] as Map<String, dynamic>),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    modelArtifacts:
        ModelArtifacts.fromJson(json['ModelArtifacts'] as Map<String, dynamic>),
    outputConfig:
        OutputConfig.fromJson(json['OutputConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    stoppingCondition: StoppingCondition.fromJson(
        json['StoppingCondition'] as Map<String, dynamic>),
    compilationEndTime:
        const UnixDateTimeConverter().fromJson(json['CompilationEndTime']),
    compilationStartTime:
        const UnixDateTimeConverter().fromJson(json['CompilationStartTime']),
    modelDigests: json['ModelDigests'] == null
        ? null
        : ModelDigests.fromJson(json['ModelDigests'] as Map<String, dynamic>),
  );
}

DescribeContextResponse _$DescribeContextResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeContextResponse(
    contextArn: json['ContextArn'] as String?,
    contextName: json['ContextName'] as String?,
    contextType: json['ContextType'] as String?,
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String?,
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    properties: (json['Properties'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    source: json['Source'] == null
        ? null
        : ContextSource.fromJson(json['Source'] as Map<String, dynamic>),
  );
}

DescribeDataQualityJobDefinitionResponse
    _$DescribeDataQualityJobDefinitionResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeDataQualityJobDefinitionResponse(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    dataQualityAppSpecification: DataQualityAppSpecification.fromJson(
        json['DataQualityAppSpecification'] as Map<String, dynamic>),
    dataQualityJobInput: DataQualityJobInput.fromJson(
        json['DataQualityJobInput'] as Map<String, dynamic>),
    dataQualityJobOutputConfig: MonitoringOutputConfig.fromJson(
        json['DataQualityJobOutputConfig'] as Map<String, dynamic>),
    jobDefinitionArn: json['JobDefinitionArn'] as String,
    jobDefinitionName: json['JobDefinitionName'] as String,
    jobResources: MonitoringResources.fromJson(
        json['JobResources'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    dataQualityBaselineConfig: json['DataQualityBaselineConfig'] == null
        ? null
        : DataQualityBaselineConfig.fromJson(
            json['DataQualityBaselineConfig'] as Map<String, dynamic>),
    networkConfig: json['NetworkConfig'] == null
        ? null
        : MonitoringNetworkConfig.fromJson(
            json['NetworkConfig'] as Map<String, dynamic>),
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : MonitoringStoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
  );
}

DescribeDeviceFleetResponse _$DescribeDeviceFleetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDeviceFleetResponse(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    deviceFleetArn: json['DeviceFleetArn'] as String,
    deviceFleetName: json['DeviceFleetName'] as String,
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    outputConfig:
        EdgeOutputConfig.fromJson(json['OutputConfig'] as Map<String, dynamic>),
    description: json['Description'] as String?,
    iotRoleAlias: json['IotRoleAlias'] as String?,
    roleArn: json['RoleArn'] as String?,
  );
}

DescribeDeviceResponse _$DescribeDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDeviceResponse(
    deviceFleetName: json['DeviceFleetName'] as String,
    deviceName: json['DeviceName'] as String,
    registrationTime: DateTime.parse(json['RegistrationTime'] as String),
    description: json['Description'] as String?,
    deviceArn: json['DeviceArn'] as String?,
    iotThingName: json['IotThingName'] as String?,
    latestHeartbeat:
        const UnixDateTimeConverter().fromJson(json['LatestHeartbeat']),
    maxModels: json['MaxModels'] as int?,
    models: (json['Models'] as List<dynamic>?)
        ?.map((e) => EdgeModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

DescribeDomainResponse _$DescribeDomainResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDomainResponse(
    appNetworkAccessType: _$enumDecodeNullable(
        _$AppNetworkAccessTypeEnumMap, json['AppNetworkAccessType']),
    authMode: _$enumDecodeNullable(_$AuthModeEnumMap, json['AuthMode']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    defaultUserSettings: json['DefaultUserSettings'] == null
        ? null
        : UserSettings.fromJson(
            json['DefaultUserSettings'] as Map<String, dynamic>),
    domainArn: json['DomainArn'] as String?,
    domainId: json['DomainId'] as String?,
    domainName: json['DomainName'] as String?,
    failureReason: json['FailureReason'] as String?,
    homeEfsFileSystemId: json['HomeEfsFileSystemId'] as String?,
    homeEfsFileSystemKmsKeyId: json['HomeEfsFileSystemKmsKeyId'] as String?,
    kmsKeyId: json['KmsKeyId'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    singleSignOnManagedApplicationInstanceId:
        json['SingleSignOnManagedApplicationInstanceId'] as String?,
    status: _$enumDecodeNullable(_$DomainStatusEnumMap, json['Status']),
    subnetIds:
        (json['SubnetIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
    url: json['Url'] as String?,
    vpcId: json['VpcId'] as String?,
  );
}

const _$AppNetworkAccessTypeEnumMap = {
  AppNetworkAccessType.publicInternetOnly: 'PublicInternetOnly',
  AppNetworkAccessType.vpcOnly: 'VpcOnly',
};

const _$AuthModeEnumMap = {
  AuthMode.sso: 'SSO',
  AuthMode.iam: 'IAM',
};

const _$DomainStatusEnumMap = {
  DomainStatus.deleting: 'Deleting',
  DomainStatus.failed: 'Failed',
  DomainStatus.inService: 'InService',
  DomainStatus.pending: 'Pending',
  DomainStatus.updating: 'Updating',
  DomainStatus.updateFailed: 'Update_Failed',
  DomainStatus.deleteFailed: 'Delete_Failed',
};

DescribeEdgePackagingJobResponse _$DescribeEdgePackagingJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEdgePackagingJobResponse(
    edgePackagingJobArn: json['EdgePackagingJobArn'] as String,
    edgePackagingJobName: json['EdgePackagingJobName'] as String,
    edgePackagingJobStatus: _$enumDecode(
        _$EdgePackagingJobStatusEnumMap, json['EdgePackagingJobStatus']),
    compilationJobName: json['CompilationJobName'] as String?,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    edgePackagingJobStatusMessage:
        json['EdgePackagingJobStatusMessage'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    modelArtifact: json['ModelArtifact'] as String?,
    modelName: json['ModelName'] as String?,
    modelSignature: json['ModelSignature'] as String?,
    modelVersion: json['ModelVersion'] as String?,
    outputConfig: json['OutputConfig'] == null
        ? null
        : EdgeOutputConfig.fromJson(
            json['OutputConfig'] as Map<String, dynamic>),
    resourceKey: json['ResourceKey'] as String?,
    roleArn: json['RoleArn'] as String?,
  );
}

const _$EdgePackagingJobStatusEnumMap = {
  EdgePackagingJobStatus.starting: 'STARTING',
  EdgePackagingJobStatus.inprogress: 'INPROGRESS',
  EdgePackagingJobStatus.completed: 'COMPLETED',
  EdgePackagingJobStatus.failed: 'FAILED',
  EdgePackagingJobStatus.stopping: 'STOPPING',
  EdgePackagingJobStatus.stopped: 'STOPPED',
};

DescribeEndpointConfigOutput _$DescribeEndpointConfigOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointConfigOutput(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    endpointConfigArn: json['EndpointConfigArn'] as String,
    endpointConfigName: json['EndpointConfigName'] as String,
    productionVariants: (json['ProductionVariants'] as List<dynamic>)
        .map((e) => ProductionVariant.fromJson(e as Map<String, dynamic>))
        .toList(),
    dataCaptureConfig: json['DataCaptureConfig'] == null
        ? null
        : DataCaptureConfig.fromJson(
            json['DataCaptureConfig'] as Map<String, dynamic>),
    kmsKeyId: json['KmsKeyId'] as String?,
  );
}

DescribeEndpointOutput _$DescribeEndpointOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointOutput(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    endpointArn: json['EndpointArn'] as String,
    endpointConfigName: json['EndpointConfigName'] as String,
    endpointName: json['EndpointName'] as String,
    endpointStatus:
        _$enumDecode(_$EndpointStatusEnumMap, json['EndpointStatus']),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    dataCaptureConfig: json['DataCaptureConfig'] == null
        ? null
        : DataCaptureConfigSummary.fromJson(
            json['DataCaptureConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String?,
    lastDeploymentConfig: json['LastDeploymentConfig'] == null
        ? null
        : DeploymentConfig.fromJson(
            json['LastDeploymentConfig'] as Map<String, dynamic>),
    productionVariants: (json['ProductionVariants'] as List<dynamic>?)
        ?.map(
            (e) => ProductionVariantSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

const _$EndpointStatusEnumMap = {
  EndpointStatus.outOfService: 'OutOfService',
  EndpointStatus.creating: 'Creating',
  EndpointStatus.updating: 'Updating',
  EndpointStatus.systemUpdating: 'SystemUpdating',
  EndpointStatus.rollingBack: 'RollingBack',
  EndpointStatus.inService: 'InService',
  EndpointStatus.deleting: 'Deleting',
  EndpointStatus.failed: 'Failed',
};

DescribeExperimentResponse _$DescribeExperimentResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeExperimentResponse(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String?,
    displayName: json['DisplayName'] as String?,
    experimentArn: json['ExperimentArn'] as String?,
    experimentName: json['ExperimentName'] as String?,
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    source: json['Source'] == null
        ? null
        : ExperimentSource.fromJson(json['Source'] as Map<String, dynamic>),
  );
}

DescribeFeatureGroupResponse _$DescribeFeatureGroupResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFeatureGroupResponse(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    eventTimeFeatureName: json['EventTimeFeatureName'] as String,
    featureDefinitions: (json['FeatureDefinitions'] as List<dynamic>)
        .map((e) => FeatureDefinition.fromJson(e as Map<String, dynamic>))
        .toList(),
    featureGroupArn: json['FeatureGroupArn'] as String,
    featureGroupName: json['FeatureGroupName'] as String,
    nextToken: json['NextToken'] as String,
    recordIdentifierFeatureName: json['RecordIdentifierFeatureName'] as String,
    description: json['Description'] as String?,
    failureReason: json['FailureReason'] as String?,
    featureGroupStatus: _$enumDecodeNullable(
        _$FeatureGroupStatusEnumMap, json['FeatureGroupStatus']),
    offlineStoreConfig: json['OfflineStoreConfig'] == null
        ? null
        : OfflineStoreConfig.fromJson(
            json['OfflineStoreConfig'] as Map<String, dynamic>),
    offlineStoreStatus: json['OfflineStoreStatus'] == null
        ? null
        : OfflineStoreStatus.fromJson(
            json['OfflineStoreStatus'] as Map<String, dynamic>),
    onlineStoreConfig: json['OnlineStoreConfig'] == null
        ? null
        : OnlineStoreConfig.fromJson(
            json['OnlineStoreConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String?,
  );
}

const _$FeatureGroupStatusEnumMap = {
  FeatureGroupStatus.creating: 'Creating',
  FeatureGroupStatus.created: 'Created',
  FeatureGroupStatus.createFailed: 'CreateFailed',
  FeatureGroupStatus.deleting: 'Deleting',
  FeatureGroupStatus.deleteFailed: 'DeleteFailed',
};

DescribeFlowDefinitionResponse _$DescribeFlowDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFlowDefinitionResponse(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    flowDefinitionArn: json['FlowDefinitionArn'] as String,
    flowDefinitionName: json['FlowDefinitionName'] as String,
    flowDefinitionStatus: _$enumDecode(
        _$FlowDefinitionStatusEnumMap, json['FlowDefinitionStatus']),
    humanLoopConfig: HumanLoopConfig.fromJson(
        json['HumanLoopConfig'] as Map<String, dynamic>),
    outputConfig: FlowDefinitionOutputConfig.fromJson(
        json['OutputConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    failureReason: json['FailureReason'] as String?,
    humanLoopActivationConfig: json['HumanLoopActivationConfig'] == null
        ? null
        : HumanLoopActivationConfig.fromJson(
            json['HumanLoopActivationConfig'] as Map<String, dynamic>),
    humanLoopRequestSource: json['HumanLoopRequestSource'] == null
        ? null
        : HumanLoopRequestSource.fromJson(
            json['HumanLoopRequestSource'] as Map<String, dynamic>),
  );
}

const _$FlowDefinitionStatusEnumMap = {
  FlowDefinitionStatus.initializing: 'Initializing',
  FlowDefinitionStatus.active: 'Active',
  FlowDefinitionStatus.failed: 'Failed',
  FlowDefinitionStatus.deleting: 'Deleting',
};

DescribeHumanTaskUiResponse _$DescribeHumanTaskUiResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeHumanTaskUiResponse(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    humanTaskUiArn: json['HumanTaskUiArn'] as String,
    humanTaskUiName: json['HumanTaskUiName'] as String,
    uiTemplate:
        UiTemplateInfo.fromJson(json['UiTemplate'] as Map<String, dynamic>),
    humanTaskUiStatus: _$enumDecodeNullable(
        _$HumanTaskUiStatusEnumMap, json['HumanTaskUiStatus']),
  );
}

const _$HumanTaskUiStatusEnumMap = {
  HumanTaskUiStatus.active: 'Active',
  HumanTaskUiStatus.deleting: 'Deleting',
};

DescribeHyperParameterTuningJobResponse
    _$DescribeHyperParameterTuningJobResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeHyperParameterTuningJobResponse(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    hyperParameterTuningJobArn: json['HyperParameterTuningJobArn'] as String,
    hyperParameterTuningJobConfig: HyperParameterTuningJobConfig.fromJson(
        json['HyperParameterTuningJobConfig'] as Map<String, dynamic>),
    hyperParameterTuningJobName: json['HyperParameterTuningJobName'] as String,
    hyperParameterTuningJobStatus: _$enumDecode(
        _$HyperParameterTuningJobStatusEnumMap,
        json['HyperParameterTuningJobStatus']),
    objectiveStatusCounters: ObjectiveStatusCounters.fromJson(
        json['ObjectiveStatusCounters'] as Map<String, dynamic>),
    trainingJobStatusCounters: TrainingJobStatusCounters.fromJson(
        json['TrainingJobStatusCounters'] as Map<String, dynamic>),
    bestTrainingJob: json['BestTrainingJob'] == null
        ? null
        : HyperParameterTrainingJobSummary.fromJson(
            json['BestTrainingJob'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String?,
    hyperParameterTuningEndTime: const UnixDateTimeConverter()
        .fromJson(json['HyperParameterTuningEndTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    overallBestTrainingJob: json['OverallBestTrainingJob'] == null
        ? null
        : HyperParameterTrainingJobSummary.fromJson(
            json['OverallBestTrainingJob'] as Map<String, dynamic>),
    trainingJobDefinition: json['TrainingJobDefinition'] == null
        ? null
        : HyperParameterTrainingJobDefinition.fromJson(
            json['TrainingJobDefinition'] as Map<String, dynamic>),
    trainingJobDefinitions: (json['TrainingJobDefinitions'] as List<dynamic>?)
        ?.map((e) => HyperParameterTrainingJobDefinition.fromJson(
            e as Map<String, dynamic>))
        .toList(),
    warmStartConfig: json['WarmStartConfig'] == null
        ? null
        : HyperParameterTuningJobWarmStartConfig.fromJson(
            json['WarmStartConfig'] as Map<String, dynamic>),
  );
}

const _$HyperParameterTuningJobStatusEnumMap = {
  HyperParameterTuningJobStatus.completed: 'Completed',
  HyperParameterTuningJobStatus.inProgress: 'InProgress',
  HyperParameterTuningJobStatus.failed: 'Failed',
  HyperParameterTuningJobStatus.stopped: 'Stopped',
  HyperParameterTuningJobStatus.stopping: 'Stopping',
};

DescribeImageResponse _$DescribeImageResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeImageResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String?,
    displayName: json['DisplayName'] as String?,
    failureReason: json['FailureReason'] as String?,
    imageArn: json['ImageArn'] as String?,
    imageName: json['ImageName'] as String?,
    imageStatus:
        _$enumDecodeNullable(_$ImageStatusEnumMap, json['ImageStatus']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    roleArn: json['RoleArn'] as String?,
  );
}

const _$ImageStatusEnumMap = {
  ImageStatus.creating: 'CREATING',
  ImageStatus.created: 'CREATED',
  ImageStatus.createFailed: 'CREATE_FAILED',
  ImageStatus.updating: 'UPDATING',
  ImageStatus.updateFailed: 'UPDATE_FAILED',
  ImageStatus.deleting: 'DELETING',
  ImageStatus.deleteFailed: 'DELETE_FAILED',
};

DescribeImageVersionResponse _$DescribeImageVersionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeImageVersionResponse(
    baseImage: json['BaseImage'] as String?,
    containerImage: json['ContainerImage'] as String?,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    failureReason: json['FailureReason'] as String?,
    imageArn: json['ImageArn'] as String?,
    imageVersionArn: json['ImageVersionArn'] as String?,
    imageVersionStatus: _$enumDecodeNullable(
        _$ImageVersionStatusEnumMap, json['ImageVersionStatus']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    version: json['Version'] as int?,
  );
}

const _$ImageVersionStatusEnumMap = {
  ImageVersionStatus.creating: 'CREATING',
  ImageVersionStatus.created: 'CREATED',
  ImageVersionStatus.createFailed: 'CREATE_FAILED',
  ImageVersionStatus.deleting: 'DELETING',
  ImageVersionStatus.deleteFailed: 'DELETE_FAILED',
};

DescribeLabelingJobResponse _$DescribeLabelingJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLabelingJobResponse(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    humanTaskConfig: HumanTaskConfig.fromJson(
        json['HumanTaskConfig'] as Map<String, dynamic>),
    inputConfig: LabelingJobInputConfig.fromJson(
        json['InputConfig'] as Map<String, dynamic>),
    jobReferenceCode: json['JobReferenceCode'] as String,
    labelCounters:
        LabelCounters.fromJson(json['LabelCounters'] as Map<String, dynamic>),
    labelingJobArn: json['LabelingJobArn'] as String,
    labelingJobName: json['LabelingJobName'] as String,
    labelingJobStatus:
        _$enumDecode(_$LabelingJobStatusEnumMap, json['LabelingJobStatus']),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    outputConfig: LabelingJobOutputConfig.fromJson(
        json['OutputConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    failureReason: json['FailureReason'] as String?,
    labelAttributeName: json['LabelAttributeName'] as String?,
    labelCategoryConfigS3Uri: json['LabelCategoryConfigS3Uri'] as String?,
    labelingJobAlgorithmsConfig: json['LabelingJobAlgorithmsConfig'] == null
        ? null
        : LabelingJobAlgorithmsConfig.fromJson(
            json['LabelingJobAlgorithmsConfig'] as Map<String, dynamic>),
    labelingJobOutput: json['LabelingJobOutput'] == null
        ? null
        : LabelingJobOutput.fromJson(
            json['LabelingJobOutput'] as Map<String, dynamic>),
    stoppingConditions: json['StoppingConditions'] == null
        ? null
        : LabelingJobStoppingConditions.fromJson(
            json['StoppingConditions'] as Map<String, dynamic>),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

const _$LabelingJobStatusEnumMap = {
  LabelingJobStatus.initializing: 'Initializing',
  LabelingJobStatus.inProgress: 'InProgress',
  LabelingJobStatus.completed: 'Completed',
  LabelingJobStatus.failed: 'Failed',
  LabelingJobStatus.stopping: 'Stopping',
  LabelingJobStatus.stopped: 'Stopped',
};

DescribeModelBiasJobDefinitionResponse
    _$DescribeModelBiasJobDefinitionResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeModelBiasJobDefinitionResponse(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    jobDefinitionArn: json['JobDefinitionArn'] as String,
    jobDefinitionName: json['JobDefinitionName'] as String,
    jobResources: MonitoringResources.fromJson(
        json['JobResources'] as Map<String, dynamic>),
    modelBiasAppSpecification: ModelBiasAppSpecification.fromJson(
        json['ModelBiasAppSpecification'] as Map<String, dynamic>),
    modelBiasJobInput: ModelBiasJobInput.fromJson(
        json['ModelBiasJobInput'] as Map<String, dynamic>),
    modelBiasJobOutputConfig: MonitoringOutputConfig.fromJson(
        json['ModelBiasJobOutputConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    modelBiasBaselineConfig: json['ModelBiasBaselineConfig'] == null
        ? null
        : ModelBiasBaselineConfig.fromJson(
            json['ModelBiasBaselineConfig'] as Map<String, dynamic>),
    networkConfig: json['NetworkConfig'] == null
        ? null
        : MonitoringNetworkConfig.fromJson(
            json['NetworkConfig'] as Map<String, dynamic>),
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : MonitoringStoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
  );
}

DescribeModelExplainabilityJobDefinitionResponse
    _$DescribeModelExplainabilityJobDefinitionResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeModelExplainabilityJobDefinitionResponse(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    jobDefinitionArn: json['JobDefinitionArn'] as String,
    jobDefinitionName: json['JobDefinitionName'] as String,
    jobResources: MonitoringResources.fromJson(
        json['JobResources'] as Map<String, dynamic>),
    modelExplainabilityAppSpecification:
        ModelExplainabilityAppSpecification.fromJson(
            json['ModelExplainabilityAppSpecification']
                as Map<String, dynamic>),
    modelExplainabilityJobInput: ModelExplainabilityJobInput.fromJson(
        json['ModelExplainabilityJobInput'] as Map<String, dynamic>),
    modelExplainabilityJobOutputConfig: MonitoringOutputConfig.fromJson(
        json['ModelExplainabilityJobOutputConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    modelExplainabilityBaselineConfig:
        json['ModelExplainabilityBaselineConfig'] == null
            ? null
            : ModelExplainabilityBaselineConfig.fromJson(
                json['ModelExplainabilityBaselineConfig']
                    as Map<String, dynamic>),
    networkConfig: json['NetworkConfig'] == null
        ? null
        : MonitoringNetworkConfig.fromJson(
            json['NetworkConfig'] as Map<String, dynamic>),
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : MonitoringStoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
  );
}

DescribeModelOutput _$DescribeModelOutputFromJson(Map<String, dynamic> json) {
  return DescribeModelOutput(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    executionRoleArn: json['ExecutionRoleArn'] as String,
    modelArn: json['ModelArn'] as String,
    modelName: json['ModelName'] as String,
    containers: (json['Containers'] as List<dynamic>?)
        ?.map((e) => ContainerDefinition.fromJson(e as Map<String, dynamic>))
        .toList(),
    enableNetworkIsolation: json['EnableNetworkIsolation'] as bool?,
    primaryContainer: json['PrimaryContainer'] == null
        ? null
        : ContainerDefinition.fromJson(
            json['PrimaryContainer'] as Map<String, dynamic>),
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

DescribeModelPackageGroupOutput _$DescribeModelPackageGroupOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeModelPackageGroupOutput(
    createdBy: UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: DateTime.parse(json['CreationTime'] as String),
    modelPackageGroupArn: json['ModelPackageGroupArn'] as String,
    modelPackageGroupName: json['ModelPackageGroupName'] as String,
    modelPackageGroupStatus: _$enumDecode(
        _$ModelPackageGroupStatusEnumMap, json['ModelPackageGroupStatus']),
    modelPackageGroupDescription:
        json['ModelPackageGroupDescription'] as String?,
  );
}

const _$ModelPackageGroupStatusEnumMap = {
  ModelPackageGroupStatus.pending: 'Pending',
  ModelPackageGroupStatus.inProgress: 'InProgress',
  ModelPackageGroupStatus.completed: 'Completed',
  ModelPackageGroupStatus.failed: 'Failed',
  ModelPackageGroupStatus.deleting: 'Deleting',
  ModelPackageGroupStatus.deleteFailed: 'DeleteFailed',
};

DescribeModelPackageOutput _$DescribeModelPackageOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeModelPackageOutput(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    modelPackageArn: json['ModelPackageArn'] as String,
    modelPackageName: json['ModelPackageName'] as String,
    modelPackageStatus:
        _$enumDecode(_$ModelPackageStatusEnumMap, json['ModelPackageStatus']),
    modelPackageStatusDetails: ModelPackageStatusDetails.fromJson(
        json['ModelPackageStatusDetails'] as Map<String, dynamic>),
    approvalDescription: json['ApprovalDescription'] as String?,
    certifyForMarketplace: json['CertifyForMarketplace'] as bool?,
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    inferenceSpecification: json['InferenceSpecification'] == null
        ? null
        : InferenceSpecification.fromJson(
            json['InferenceSpecification'] as Map<String, dynamic>),
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    metadataProperties: json['MetadataProperties'] == null
        ? null
        : MetadataProperties.fromJson(
            json['MetadataProperties'] as Map<String, dynamic>),
    modelApprovalStatus: _$enumDecodeNullable(
        _$ModelApprovalStatusEnumMap, json['ModelApprovalStatus']),
    modelMetrics: json['ModelMetrics'] == null
        ? null
        : ModelMetrics.fromJson(json['ModelMetrics'] as Map<String, dynamic>),
    modelPackageDescription: json['ModelPackageDescription'] as String?,
    modelPackageGroupName: json['ModelPackageGroupName'] as String?,
    modelPackageVersion: json['ModelPackageVersion'] as int?,
    sourceAlgorithmSpecification: json['SourceAlgorithmSpecification'] == null
        ? null
        : SourceAlgorithmSpecification.fromJson(
            json['SourceAlgorithmSpecification'] as Map<String, dynamic>),
    validationSpecification: json['ValidationSpecification'] == null
        ? null
        : ModelPackageValidationSpecification.fromJson(
            json['ValidationSpecification'] as Map<String, dynamic>),
  );
}

const _$ModelPackageStatusEnumMap = {
  ModelPackageStatus.pending: 'Pending',
  ModelPackageStatus.inProgress: 'InProgress',
  ModelPackageStatus.completed: 'Completed',
  ModelPackageStatus.failed: 'Failed',
  ModelPackageStatus.deleting: 'Deleting',
};

const _$ModelApprovalStatusEnumMap = {
  ModelApprovalStatus.approved: 'Approved',
  ModelApprovalStatus.rejected: 'Rejected',
  ModelApprovalStatus.pendingManualApproval: 'PendingManualApproval',
};

DescribeModelQualityJobDefinitionResponse
    _$DescribeModelQualityJobDefinitionResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeModelQualityJobDefinitionResponse(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    jobDefinitionArn: json['JobDefinitionArn'] as String,
    jobDefinitionName: json['JobDefinitionName'] as String,
    jobResources: MonitoringResources.fromJson(
        json['JobResources'] as Map<String, dynamic>),
    modelQualityAppSpecification: ModelQualityAppSpecification.fromJson(
        json['ModelQualityAppSpecification'] as Map<String, dynamic>),
    modelQualityJobInput: ModelQualityJobInput.fromJson(
        json['ModelQualityJobInput'] as Map<String, dynamic>),
    modelQualityJobOutputConfig: MonitoringOutputConfig.fromJson(
        json['ModelQualityJobOutputConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    modelQualityBaselineConfig: json['ModelQualityBaselineConfig'] == null
        ? null
        : ModelQualityBaselineConfig.fromJson(
            json['ModelQualityBaselineConfig'] as Map<String, dynamic>),
    networkConfig: json['NetworkConfig'] == null
        ? null
        : MonitoringNetworkConfig.fromJson(
            json['NetworkConfig'] as Map<String, dynamic>),
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : MonitoringStoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
  );
}

DescribeMonitoringScheduleResponse _$DescribeMonitoringScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeMonitoringScheduleResponse(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    monitoringScheduleArn: json['MonitoringScheduleArn'] as String,
    monitoringScheduleConfig: MonitoringScheduleConfig.fromJson(
        json['MonitoringScheduleConfig'] as Map<String, dynamic>),
    monitoringScheduleName: json['MonitoringScheduleName'] as String,
    monitoringScheduleStatus:
        _$enumDecode(_$ScheduleStatusEnumMap, json['MonitoringScheduleStatus']),
    endpointName: json['EndpointName'] as String?,
    failureReason: json['FailureReason'] as String?,
    lastMonitoringExecutionSummary:
        json['LastMonitoringExecutionSummary'] == null
            ? null
            : MonitoringExecutionSummary.fromJson(
                json['LastMonitoringExecutionSummary'] as Map<String, dynamic>),
    monitoringType:
        _$enumDecodeNullable(_$MonitoringTypeEnumMap, json['MonitoringType']),
  );
}

const _$ScheduleStatusEnumMap = {
  ScheduleStatus.pending: 'Pending',
  ScheduleStatus.failed: 'Failed',
  ScheduleStatus.scheduled: 'Scheduled',
  ScheduleStatus.stopped: 'Stopped',
};

const _$MonitoringTypeEnumMap = {
  MonitoringType.dataQuality: 'DataQuality',
  MonitoringType.modelQuality: 'ModelQuality',
  MonitoringType.modelBias: 'ModelBias',
  MonitoringType.modelExplainability: 'ModelExplainability',
};

DescribeNotebookInstanceLifecycleConfigOutput
    _$DescribeNotebookInstanceLifecycleConfigOutputFromJson(
        Map<String, dynamic> json) {
  return DescribeNotebookInstanceLifecycleConfigOutput(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    notebookInstanceLifecycleConfigArn:
        json['NotebookInstanceLifecycleConfigArn'] as String?,
    notebookInstanceLifecycleConfigName:
        json['NotebookInstanceLifecycleConfigName'] as String?,
    onCreate: (json['OnCreate'] as List<dynamic>?)
        ?.map((e) =>
            NotebookInstanceLifecycleHook.fromJson(e as Map<String, dynamic>))
        .toList(),
    onStart: (json['OnStart'] as List<dynamic>?)
        ?.map((e) =>
            NotebookInstanceLifecycleHook.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

DescribeNotebookInstanceOutput _$DescribeNotebookInstanceOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeNotebookInstanceOutput(
    acceleratorTypes: (json['AcceleratorTypes'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$NotebookInstanceAcceleratorTypeEnumMap, e))
        .toList(),
    additionalCodeRepositories:
        (json['AdditionalCodeRepositories'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    defaultCodeRepository: json['DefaultCodeRepository'] as String?,
    directInternetAccess: _$enumDecodeNullable(
        _$DirectInternetAccessEnumMap, json['DirectInternetAccess']),
    failureReason: json['FailureReason'] as String?,
    instanceType:
        _$enumDecodeNullable(_$InstanceTypeEnumMap, json['InstanceType']),
    kmsKeyId: json['KmsKeyId'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    networkInterfaceId: json['NetworkInterfaceId'] as String?,
    notebookInstanceArn: json['NotebookInstanceArn'] as String?,
    notebookInstanceLifecycleConfigName:
        json['NotebookInstanceLifecycleConfigName'] as String?,
    notebookInstanceName: json['NotebookInstanceName'] as String?,
    notebookInstanceStatus: _$enumDecodeNullable(
        _$NotebookInstanceStatusEnumMap, json['NotebookInstanceStatus']),
    roleArn: json['RoleArn'] as String?,
    rootAccess: _$enumDecodeNullable(_$RootAccessEnumMap, json['RootAccess']),
    securityGroups: (json['SecurityGroups'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    subnetId: json['SubnetId'] as String?,
    url: json['Url'] as String?,
    volumeSizeInGB: json['VolumeSizeInGB'] as int?,
  );
}

const _$NotebookInstanceAcceleratorTypeEnumMap = {
  NotebookInstanceAcceleratorType.mlEia1Medium: 'ml.eia1.medium',
  NotebookInstanceAcceleratorType.mlEia1Large: 'ml.eia1.large',
  NotebookInstanceAcceleratorType.mlEia1Xlarge: 'ml.eia1.xlarge',
  NotebookInstanceAcceleratorType.mlEia2Medium: 'ml.eia2.medium',
  NotebookInstanceAcceleratorType.mlEia2Large: 'ml.eia2.large',
  NotebookInstanceAcceleratorType.mlEia2Xlarge: 'ml.eia2.xlarge',
};

const _$DirectInternetAccessEnumMap = {
  DirectInternetAccess.enabled: 'Enabled',
  DirectInternetAccess.disabled: 'Disabled',
};

const _$InstanceTypeEnumMap = {
  InstanceType.mlT2Medium: 'ml.t2.medium',
  InstanceType.mlT2Large: 'ml.t2.large',
  InstanceType.mlT2Xlarge: 'ml.t2.xlarge',
  InstanceType.mlT2_2xlarge: 'ml.t2.2xlarge',
  InstanceType.mlT3Medium: 'ml.t3.medium',
  InstanceType.mlT3Large: 'ml.t3.large',
  InstanceType.mlT3Xlarge: 'ml.t3.xlarge',
  InstanceType.mlT3_2xlarge: 'ml.t3.2xlarge',
  InstanceType.mlM4Xlarge: 'ml.m4.xlarge',
  InstanceType.mlM4_2xlarge: 'ml.m4.2xlarge',
  InstanceType.mlM4_4xlarge: 'ml.m4.4xlarge',
  InstanceType.mlM4_10xlarge: 'ml.m4.10xlarge',
  InstanceType.mlM4_16xlarge: 'ml.m4.16xlarge',
  InstanceType.mlM5Xlarge: 'ml.m5.xlarge',
  InstanceType.mlM5_2xlarge: 'ml.m5.2xlarge',
  InstanceType.mlM5_4xlarge: 'ml.m5.4xlarge',
  InstanceType.mlM5_12xlarge: 'ml.m5.12xlarge',
  InstanceType.mlM5_24xlarge: 'ml.m5.24xlarge',
  InstanceType.mlC4Xlarge: 'ml.c4.xlarge',
  InstanceType.mlC4_2xlarge: 'ml.c4.2xlarge',
  InstanceType.mlC4_4xlarge: 'ml.c4.4xlarge',
  InstanceType.mlC4_8xlarge: 'ml.c4.8xlarge',
  InstanceType.mlC5Xlarge: 'ml.c5.xlarge',
  InstanceType.mlC5_2xlarge: 'ml.c5.2xlarge',
  InstanceType.mlC5_4xlarge: 'ml.c5.4xlarge',
  InstanceType.mlC5_9xlarge: 'ml.c5.9xlarge',
  InstanceType.mlC5_18xlarge: 'ml.c5.18xlarge',
  InstanceType.mlC5dXlarge: 'ml.c5d.xlarge',
  InstanceType.mlC5d_2xlarge: 'ml.c5d.2xlarge',
  InstanceType.mlC5d_4xlarge: 'ml.c5d.4xlarge',
  InstanceType.mlC5d_9xlarge: 'ml.c5d.9xlarge',
  InstanceType.mlC5d_18xlarge: 'ml.c5d.18xlarge',
  InstanceType.mlP2Xlarge: 'ml.p2.xlarge',
  InstanceType.mlP2_8xlarge: 'ml.p2.8xlarge',
  InstanceType.mlP2_16xlarge: 'ml.p2.16xlarge',
  InstanceType.mlP3_2xlarge: 'ml.p3.2xlarge',
  InstanceType.mlP3_8xlarge: 'ml.p3.8xlarge',
  InstanceType.mlP3_16xlarge: 'ml.p3.16xlarge',
};

const _$NotebookInstanceStatusEnumMap = {
  NotebookInstanceStatus.pending: 'Pending',
  NotebookInstanceStatus.inService: 'InService',
  NotebookInstanceStatus.stopping: 'Stopping',
  NotebookInstanceStatus.stopped: 'Stopped',
  NotebookInstanceStatus.failed: 'Failed',
  NotebookInstanceStatus.deleting: 'Deleting',
  NotebookInstanceStatus.updating: 'Updating',
};

const _$RootAccessEnumMap = {
  RootAccess.enabled: 'Enabled',
  RootAccess.disabled: 'Disabled',
};

DescribePipelineDefinitionForExecutionResponse
    _$DescribePipelineDefinitionForExecutionResponseFromJson(
        Map<String, dynamic> json) {
  return DescribePipelineDefinitionForExecutionResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    pipelineDefinition: json['PipelineDefinition'] as String?,
  );
}

DescribePipelineExecutionResponse _$DescribePipelineExecutionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePipelineExecutionResponse(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    pipelineArn: json['PipelineArn'] as String?,
    pipelineExecutionArn: json['PipelineExecutionArn'] as String?,
    pipelineExecutionDescription:
        json['PipelineExecutionDescription'] as String?,
    pipelineExecutionDisplayName:
        json['PipelineExecutionDisplayName'] as String?,
    pipelineExecutionStatus: _$enumDecodeNullable(
        _$PipelineExecutionStatusEnumMap, json['PipelineExecutionStatus']),
  );
}

const _$PipelineExecutionStatusEnumMap = {
  PipelineExecutionStatus.executing: 'Executing',
  PipelineExecutionStatus.stopping: 'Stopping',
  PipelineExecutionStatus.stopped: 'Stopped',
  PipelineExecutionStatus.failed: 'Failed',
  PipelineExecutionStatus.succeeded: 'Succeeded',
};

DescribePipelineResponse _$DescribePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return DescribePipelineResponse(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    lastRunTime: const UnixDateTimeConverter().fromJson(json['LastRunTime']),
    pipelineArn: json['PipelineArn'] as String?,
    pipelineDefinition: json['PipelineDefinition'] as String?,
    pipelineDescription: json['PipelineDescription'] as String?,
    pipelineDisplayName: json['PipelineDisplayName'] as String?,
    pipelineName: json['PipelineName'] as String?,
    pipelineStatus:
        _$enumDecodeNullable(_$PipelineStatusEnumMap, json['PipelineStatus']),
    roleArn: json['RoleArn'] as String?,
  );
}

const _$PipelineStatusEnumMap = {
  PipelineStatus.active: 'Active',
};

DescribeProcessingJobResponse _$DescribeProcessingJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProcessingJobResponse(
    appSpecification: AppSpecification.fromJson(
        json['AppSpecification'] as Map<String, dynamic>),
    creationTime: DateTime.parse(json['CreationTime'] as String),
    processingJobArn: json['ProcessingJobArn'] as String,
    processingJobName: json['ProcessingJobName'] as String,
    processingJobStatus:
        _$enumDecode(_$ProcessingJobStatusEnumMap, json['ProcessingJobStatus']),
    processingResources: ProcessingResources.fromJson(
        json['ProcessingResources'] as Map<String, dynamic>),
    autoMLJobArn: json['AutoMLJobArn'] as String?,
    environment: (json['Environment'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    exitMessage: json['ExitMessage'] as String?,
    experimentConfig: json['ExperimentConfig'] == null
        ? null
        : ExperimentConfig.fromJson(
            json['ExperimentConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    monitoringScheduleArn: json['MonitoringScheduleArn'] as String?,
    networkConfig: json['NetworkConfig'] == null
        ? null
        : NetworkConfig.fromJson(json['NetworkConfig'] as Map<String, dynamic>),
    processingEndTime:
        const UnixDateTimeConverter().fromJson(json['ProcessingEndTime']),
    processingInputs: (json['ProcessingInputs'] as List<dynamic>?)
        ?.map((e) => ProcessingInput.fromJson(e as Map<String, dynamic>))
        .toList(),
    processingOutputConfig: json['ProcessingOutputConfig'] == null
        ? null
        : ProcessingOutputConfig.fromJson(
            json['ProcessingOutputConfig'] as Map<String, dynamic>),
    processingStartTime:
        const UnixDateTimeConverter().fromJson(json['ProcessingStartTime']),
    roleArn: json['RoleArn'] as String?,
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : ProcessingStoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
    trainingJobArn: json['TrainingJobArn'] as String?,
  );
}

const _$ProcessingJobStatusEnumMap = {
  ProcessingJobStatus.inProgress: 'InProgress',
  ProcessingJobStatus.completed: 'Completed',
  ProcessingJobStatus.failed: 'Failed',
  ProcessingJobStatus.stopping: 'Stopping',
  ProcessingJobStatus.stopped: 'Stopped',
};

DescribeProjectOutput _$DescribeProjectOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeProjectOutput(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    projectArn: json['ProjectArn'] as String,
    projectId: json['ProjectId'] as String,
    projectName: json['ProjectName'] as String,
    projectStatus: _$enumDecode(_$ProjectStatusEnumMap, json['ProjectStatus']),
    serviceCatalogProvisioningDetails:
        ServiceCatalogProvisioningDetails.fromJson(
            json['ServiceCatalogProvisioningDetails'] as Map<String, dynamic>),
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    projectDescription: json['ProjectDescription'] as String?,
    serviceCatalogProvisionedProductDetails:
        json['ServiceCatalogProvisionedProductDetails'] == null
            ? null
            : ServiceCatalogProvisionedProductDetails.fromJson(
                json['ServiceCatalogProvisionedProductDetails']
                    as Map<String, dynamic>),
  );
}

const _$ProjectStatusEnumMap = {
  ProjectStatus.pending: 'Pending',
  ProjectStatus.createInProgress: 'CreateInProgress',
  ProjectStatus.createCompleted: 'CreateCompleted',
  ProjectStatus.createFailed: 'CreateFailed',
  ProjectStatus.deleteInProgress: 'DeleteInProgress',
  ProjectStatus.deleteFailed: 'DeleteFailed',
  ProjectStatus.deleteCompleted: 'DeleteCompleted',
};

DescribeSubscribedWorkteamResponse _$DescribeSubscribedWorkteamResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSubscribedWorkteamResponse(
    subscribedWorkteam: SubscribedWorkteam.fromJson(
        json['SubscribedWorkteam'] as Map<String, dynamic>),
  );
}

DescribeTrainingJobResponse _$DescribeTrainingJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTrainingJobResponse(
    algorithmSpecification: AlgorithmSpecification.fromJson(
        json['AlgorithmSpecification'] as Map<String, dynamic>),
    creationTime: DateTime.parse(json['CreationTime'] as String),
    modelArtifacts:
        ModelArtifacts.fromJson(json['ModelArtifacts'] as Map<String, dynamic>),
    resourceConfig:
        ResourceConfig.fromJson(json['ResourceConfig'] as Map<String, dynamic>),
    secondaryStatus:
        _$enumDecode(_$SecondaryStatusEnumMap, json['SecondaryStatus']),
    stoppingCondition: StoppingCondition.fromJson(
        json['StoppingCondition'] as Map<String, dynamic>),
    trainingJobArn: json['TrainingJobArn'] as String,
    trainingJobName: json['TrainingJobName'] as String,
    trainingJobStatus:
        _$enumDecode(_$TrainingJobStatusEnumMap, json['TrainingJobStatus']),
    autoMLJobArn: json['AutoMLJobArn'] as String?,
    billableTimeInSeconds: json['BillableTimeInSeconds'] as int?,
    checkpointConfig: json['CheckpointConfig'] == null
        ? null
        : CheckpointConfig.fromJson(
            json['CheckpointConfig'] as Map<String, dynamic>),
    debugHookConfig: json['DebugHookConfig'] == null
        ? null
        : DebugHookConfig.fromJson(
            json['DebugHookConfig'] as Map<String, dynamic>),
    debugRuleConfigurations: (json['DebugRuleConfigurations'] as List<dynamic>?)
        ?.map((e) => DebugRuleConfiguration.fromJson(e as Map<String, dynamic>))
        .toList(),
    debugRuleEvaluationStatuses:
        (json['DebugRuleEvaluationStatuses'] as List<dynamic>?)
            ?.map((e) =>
                DebugRuleEvaluationStatus.fromJson(e as Map<String, dynamic>))
            .toList(),
    enableInterContainerTrafficEncryption:
        json['EnableInterContainerTrafficEncryption'] as bool?,
    enableManagedSpotTraining: json['EnableManagedSpotTraining'] as bool?,
    enableNetworkIsolation: json['EnableNetworkIsolation'] as bool?,
    experimentConfig: json['ExperimentConfig'] == null
        ? null
        : ExperimentConfig.fromJson(
            json['ExperimentConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String?,
    finalMetricDataList: (json['FinalMetricDataList'] as List<dynamic>?)
        ?.map((e) => MetricData.fromJson(e as Map<String, dynamic>))
        .toList(),
    hyperParameters: (json['HyperParameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    inputDataConfig: (json['InputDataConfig'] as List<dynamic>?)
        ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
        .toList(),
    labelingJobArn: json['LabelingJobArn'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    profilerConfig: json['ProfilerConfig'] == null
        ? null
        : ProfilerConfig.fromJson(
            json['ProfilerConfig'] as Map<String, dynamic>),
    profilerRuleConfigurations:
        (json['ProfilerRuleConfigurations'] as List<dynamic>?)
            ?.map((e) =>
                ProfilerRuleConfiguration.fromJson(e as Map<String, dynamic>))
            .toList(),
    profilerRuleEvaluationStatuses: (json['ProfilerRuleEvaluationStatuses']
            as List<dynamic>?)
        ?.map((e) =>
            ProfilerRuleEvaluationStatus.fromJson(e as Map<String, dynamic>))
        .toList(),
    profilingStatus:
        _$enumDecodeNullable(_$ProfilingStatusEnumMap, json['ProfilingStatus']),
    roleArn: json['RoleArn'] as String?,
    secondaryStatusTransitions:
        (json['SecondaryStatusTransitions'] as List<dynamic>?)
            ?.map((e) =>
                SecondaryStatusTransition.fromJson(e as Map<String, dynamic>))
            .toList(),
    tensorBoardOutputConfig: json['TensorBoardOutputConfig'] == null
        ? null
        : TensorBoardOutputConfig.fromJson(
            json['TensorBoardOutputConfig'] as Map<String, dynamic>),
    trainingEndTime:
        const UnixDateTimeConverter().fromJson(json['TrainingEndTime']),
    trainingStartTime:
        const UnixDateTimeConverter().fromJson(json['TrainingStartTime']),
    trainingTimeInSeconds: json['TrainingTimeInSeconds'] as int?,
    tuningJobArn: json['TuningJobArn'] as String?,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

const _$SecondaryStatusEnumMap = {
  SecondaryStatus.starting: 'Starting',
  SecondaryStatus.launchingMLInstances: 'LaunchingMLInstances',
  SecondaryStatus.preparingTrainingStack: 'PreparingTrainingStack',
  SecondaryStatus.downloading: 'Downloading',
  SecondaryStatus.downloadingTrainingImage: 'DownloadingTrainingImage',
  SecondaryStatus.training: 'Training',
  SecondaryStatus.uploading: 'Uploading',
  SecondaryStatus.stopping: 'Stopping',
  SecondaryStatus.stopped: 'Stopped',
  SecondaryStatus.maxRuntimeExceeded: 'MaxRuntimeExceeded',
  SecondaryStatus.completed: 'Completed',
  SecondaryStatus.failed: 'Failed',
  SecondaryStatus.interrupted: 'Interrupted',
  SecondaryStatus.maxWaitTimeExceeded: 'MaxWaitTimeExceeded',
  SecondaryStatus.updating: 'Updating',
};

const _$TrainingJobStatusEnumMap = {
  TrainingJobStatus.inProgress: 'InProgress',
  TrainingJobStatus.completed: 'Completed',
  TrainingJobStatus.failed: 'Failed',
  TrainingJobStatus.stopping: 'Stopping',
  TrainingJobStatus.stopped: 'Stopped',
};

const _$ProfilingStatusEnumMap = {
  ProfilingStatus.enabled: 'Enabled',
  ProfilingStatus.disabled: 'Disabled',
};

DescribeTransformJobResponse _$DescribeTransformJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTransformJobResponse(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    modelName: json['ModelName'] as String,
    transformInput:
        TransformInput.fromJson(json['TransformInput'] as Map<String, dynamic>),
    transformJobArn: json['TransformJobArn'] as String,
    transformJobName: json['TransformJobName'] as String,
    transformJobStatus:
        _$enumDecode(_$TransformJobStatusEnumMap, json['TransformJobStatus']),
    transformResources: TransformResources.fromJson(
        json['TransformResources'] as Map<String, dynamic>),
    autoMLJobArn: json['AutoMLJobArn'] as String?,
    batchStrategy:
        _$enumDecodeNullable(_$BatchStrategyEnumMap, json['BatchStrategy']),
    dataProcessing: json['DataProcessing'] == null
        ? null
        : DataProcessing.fromJson(
            json['DataProcessing'] as Map<String, dynamic>),
    environment: (json['Environment'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    experimentConfig: json['ExperimentConfig'] == null
        ? null
        : ExperimentConfig.fromJson(
            json['ExperimentConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String?,
    labelingJobArn: json['LabelingJobArn'] as String?,
    maxConcurrentTransforms: json['MaxConcurrentTransforms'] as int?,
    maxPayloadInMB: json['MaxPayloadInMB'] as int?,
    modelClientConfig: json['ModelClientConfig'] == null
        ? null
        : ModelClientConfig.fromJson(
            json['ModelClientConfig'] as Map<String, dynamic>),
    transformEndTime:
        const UnixDateTimeConverter().fromJson(json['TransformEndTime']),
    transformOutput: json['TransformOutput'] == null
        ? null
        : TransformOutput.fromJson(
            json['TransformOutput'] as Map<String, dynamic>),
    transformStartTime:
        const UnixDateTimeConverter().fromJson(json['TransformStartTime']),
  );
}

const _$TransformJobStatusEnumMap = {
  TransformJobStatus.inProgress: 'InProgress',
  TransformJobStatus.completed: 'Completed',
  TransformJobStatus.failed: 'Failed',
  TransformJobStatus.stopping: 'Stopping',
  TransformJobStatus.stopped: 'Stopped',
};

const _$BatchStrategyEnumMap = {
  BatchStrategy.multiRecord: 'MultiRecord',
  BatchStrategy.singleRecord: 'SingleRecord',
};

DescribeTrialComponentResponse _$DescribeTrialComponentResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTrialComponentResponse(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    displayName: json['DisplayName'] as String?,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    inputArtifacts: (json['InputArtifacts'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k, TrialComponentArtifact.fromJson(e as Map<String, dynamic>)),
    ),
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    metadataProperties: json['MetadataProperties'] == null
        ? null
        : MetadataProperties.fromJson(
            json['MetadataProperties'] as Map<String, dynamic>),
    metrics: (json['Metrics'] as List<dynamic>?)
        ?.map((e) =>
            TrialComponentMetricSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    outputArtifacts: (json['OutputArtifacts'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k, TrialComponentArtifact.fromJson(e as Map<String, dynamic>)),
    ),
    parameters: (json['Parameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k, TrialComponentParameterValue.fromJson(e as Map<String, dynamic>)),
    ),
    source: json['Source'] == null
        ? null
        : TrialComponentSource.fromJson(json['Source'] as Map<String, dynamic>),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: json['Status'] == null
        ? null
        : TrialComponentStatus.fromJson(json['Status'] as Map<String, dynamic>),
    trialComponentArn: json['TrialComponentArn'] as String?,
    trialComponentName: json['TrialComponentName'] as String?,
  );
}

DescribeTrialResponse _$DescribeTrialResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTrialResponse(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    displayName: json['DisplayName'] as String?,
    experimentName: json['ExperimentName'] as String?,
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    metadataProperties: json['MetadataProperties'] == null
        ? null
        : MetadataProperties.fromJson(
            json['MetadataProperties'] as Map<String, dynamic>),
    source: json['Source'] == null
        ? null
        : TrialSource.fromJson(json['Source'] as Map<String, dynamic>),
    trialArn: json['TrialArn'] as String?,
    trialName: json['TrialName'] as String?,
  );
}

DescribeUserProfileResponse _$DescribeUserProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeUserProfileResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    domainId: json['DomainId'] as String?,
    failureReason: json['FailureReason'] as String?,
    homeEfsFileSystemUid: json['HomeEfsFileSystemUid'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    singleSignOnUserIdentifier: json['SingleSignOnUserIdentifier'] as String?,
    singleSignOnUserValue: json['SingleSignOnUserValue'] as String?,
    status: _$enumDecodeNullable(_$UserProfileStatusEnumMap, json['Status']),
    userProfileArn: json['UserProfileArn'] as String?,
    userProfileName: json['UserProfileName'] as String?,
    userSettings: json['UserSettings'] == null
        ? null
        : UserSettings.fromJson(json['UserSettings'] as Map<String, dynamic>),
  );
}

const _$UserProfileStatusEnumMap = {
  UserProfileStatus.deleting: 'Deleting',
  UserProfileStatus.failed: 'Failed',
  UserProfileStatus.inService: 'InService',
  UserProfileStatus.pending: 'Pending',
  UserProfileStatus.updating: 'Updating',
  UserProfileStatus.updateFailed: 'Update_Failed',
  UserProfileStatus.deleteFailed: 'Delete_Failed',
};

DescribeWorkforceResponse _$DescribeWorkforceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeWorkforceResponse(
    workforce: Workforce.fromJson(json['Workforce'] as Map<String, dynamic>),
  );
}

DescribeWorkteamResponse _$DescribeWorkteamResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeWorkteamResponse(
    workteam: Workteam.fromJson(json['Workteam'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DesiredWeightAndCapacityToJson(
    DesiredWeightAndCapacity instance) {
  final val = <String, dynamic>{
    'VariantName': instance.variantName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DesiredInstanceCount', instance.desiredInstanceCount);
  writeNotNull('DesiredWeight', instance.desiredWeight);
  return val;
}

Map<String, dynamic> _$DeviceToJson(Device instance) {
  final val = <String, dynamic>{
    'DeviceName': instance.deviceName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Description', instance.description);
  writeNotNull('IotThingName', instance.iotThingName);
  return val;
}

DeviceFleetSummary _$DeviceFleetSummaryFromJson(Map<String, dynamic> json) {
  return DeviceFleetSummary(
    deviceFleetArn: json['DeviceFleetArn'] as String,
    deviceFleetName: json['DeviceFleetName'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
  );
}

DeviceStats _$DeviceStatsFromJson(Map<String, dynamic> json) {
  return DeviceStats(
    connectedDeviceCount: json['ConnectedDeviceCount'] as int,
    registeredDeviceCount: json['RegisteredDeviceCount'] as int,
  );
}

DeviceSummary _$DeviceSummaryFromJson(Map<String, dynamic> json) {
  return DeviceSummary(
    deviceArn: json['DeviceArn'] as String,
    deviceName: json['DeviceName'] as String,
    description: json['Description'] as String?,
    deviceFleetName: json['DeviceFleetName'] as String?,
    iotThingName: json['IotThingName'] as String?,
    latestHeartbeat:
        const UnixDateTimeConverter().fromJson(json['LatestHeartbeat']),
    models: (json['Models'] as List<dynamic>?)
        ?.map((e) => EdgeModelSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    registrationTime:
        const UnixDateTimeConverter().fromJson(json['RegistrationTime']),
  );
}

DisableSagemakerServicecatalogPortfolioOutput
    _$DisableSagemakerServicecatalogPortfolioOutputFromJson(
        Map<String, dynamic> json) {
  return DisableSagemakerServicecatalogPortfolioOutput();
}

DisassociateTrialComponentResponse _$DisassociateTrialComponentResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateTrialComponentResponse(
    trialArn: json['TrialArn'] as String?,
    trialComponentArn: json['TrialComponentArn'] as String?,
  );
}

DomainDetails _$DomainDetailsFromJson(Map<String, dynamic> json) {
  return DomainDetails(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    domainArn: json['DomainArn'] as String?,
    domainId: json['DomainId'] as String?,
    domainName: json['DomainName'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    status: _$enumDecodeNullable(_$DomainStatusEnumMap, json['Status']),
    url: json['Url'] as String?,
  );
}

EdgeModel _$EdgeModelFromJson(Map<String, dynamic> json) {
  return EdgeModel(
    modelName: json['ModelName'] as String,
    modelVersion: json['ModelVersion'] as String,
    latestInference:
        const UnixDateTimeConverter().fromJson(json['LatestInference']),
    latestSampleTime:
        const UnixDateTimeConverter().fromJson(json['LatestSampleTime']),
  );
}

EdgeModelStat _$EdgeModelStatFromJson(Map<String, dynamic> json) {
  return EdgeModelStat(
    activeDeviceCount: json['ActiveDeviceCount'] as int,
    connectedDeviceCount: json['ConnectedDeviceCount'] as int,
    modelName: json['ModelName'] as String,
    modelVersion: json['ModelVersion'] as String,
    offlineDeviceCount: json['OfflineDeviceCount'] as int,
    samplingDeviceCount: json['SamplingDeviceCount'] as int,
  );
}

EdgeModelSummary _$EdgeModelSummaryFromJson(Map<String, dynamic> json) {
  return EdgeModelSummary(
    modelName: json['ModelName'] as String,
    modelVersion: json['ModelVersion'] as String,
  );
}

EdgeOutputConfig _$EdgeOutputConfigFromJson(Map<String, dynamic> json) {
  return EdgeOutputConfig(
    s3OutputLocation: json['S3OutputLocation'] as String,
    kmsKeyId: json['KmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$EdgeOutputConfigToJson(EdgeOutputConfig instance) {
  final val = <String, dynamic>{
    'S3OutputLocation': instance.s3OutputLocation,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

EdgePackagingJobSummary _$EdgePackagingJobSummaryFromJson(
    Map<String, dynamic> json) {
  return EdgePackagingJobSummary(
    edgePackagingJobArn: json['EdgePackagingJobArn'] as String,
    edgePackagingJobName: json['EdgePackagingJobName'] as String,
    edgePackagingJobStatus: _$enumDecode(
        _$EdgePackagingJobStatusEnumMap, json['EdgePackagingJobStatus']),
    compilationJobName: json['CompilationJobName'] as String?,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    modelName: json['ModelName'] as String?,
    modelVersion: json['ModelVersion'] as String?,
  );
}

EnableSagemakerServicecatalogPortfolioOutput
    _$EnableSagemakerServicecatalogPortfolioOutputFromJson(
        Map<String, dynamic> json) {
  return EnableSagemakerServicecatalogPortfolioOutput();
}

Endpoint _$EndpointFromJson(Map<String, dynamic> json) {
  return Endpoint(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    endpointArn: json['EndpointArn'] as String,
    endpointConfigName: json['EndpointConfigName'] as String,
    endpointName: json['EndpointName'] as String,
    endpointStatus:
        _$enumDecode(_$EndpointStatusEnumMap, json['EndpointStatus']),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    dataCaptureConfig: json['DataCaptureConfig'] == null
        ? null
        : DataCaptureConfigSummary.fromJson(
            json['DataCaptureConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String?,
    monitoringSchedules: (json['MonitoringSchedules'] as List<dynamic>?)
        ?.map((e) => MonitoringSchedule.fromJson(e as Map<String, dynamic>))
        .toList(),
    productionVariants: (json['ProductionVariants'] as List<dynamic>?)
        ?.map(
            (e) => ProductionVariantSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

EndpointConfigSummary _$EndpointConfigSummaryFromJson(
    Map<String, dynamic> json) {
  return EndpointConfigSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    endpointConfigArn: json['EndpointConfigArn'] as String,
    endpointConfigName: json['EndpointConfigName'] as String,
  );
}

EndpointInput _$EndpointInputFromJson(Map<String, dynamic> json) {
  return EndpointInput(
    endpointName: json['EndpointName'] as String,
    localPath: json['LocalPath'] as String,
    endTimeOffset: json['EndTimeOffset'] as String?,
    featuresAttribute: json['FeaturesAttribute'] as String?,
    inferenceAttribute: json['InferenceAttribute'] as String?,
    probabilityAttribute: json['ProbabilityAttribute'] as String?,
    probabilityThresholdAttribute:
        (json['ProbabilityThresholdAttribute'] as num?)?.toDouble(),
    s3DataDistributionType: _$enumDecodeNullable(
        _$ProcessingS3DataDistributionTypeEnumMap,
        json['S3DataDistributionType']),
    s3InputMode: _$enumDecodeNullable(
        _$ProcessingS3InputModeEnumMap, json['S3InputMode']),
    startTimeOffset: json['StartTimeOffset'] as String?,
  );
}

Map<String, dynamic> _$EndpointInputToJson(EndpointInput instance) {
  final val = <String, dynamic>{
    'EndpointName': instance.endpointName,
    'LocalPath': instance.localPath,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndTimeOffset', instance.endTimeOffset);
  writeNotNull('FeaturesAttribute', instance.featuresAttribute);
  writeNotNull('InferenceAttribute', instance.inferenceAttribute);
  writeNotNull('ProbabilityAttribute', instance.probabilityAttribute);
  writeNotNull(
      'ProbabilityThresholdAttribute', instance.probabilityThresholdAttribute);
  writeNotNull(
      'S3DataDistributionType',
      _$ProcessingS3DataDistributionTypeEnumMap[
          instance.s3DataDistributionType]);
  writeNotNull(
      'S3InputMode', _$ProcessingS3InputModeEnumMap[instance.s3InputMode]);
  writeNotNull('StartTimeOffset', instance.startTimeOffset);
  return val;
}

const _$ProcessingS3DataDistributionTypeEnumMap = {
  ProcessingS3DataDistributionType.fullyReplicated: 'FullyReplicated',
  ProcessingS3DataDistributionType.shardedByS3Key: 'ShardedByS3Key',
};

const _$ProcessingS3InputModeEnumMap = {
  ProcessingS3InputMode.pipe: 'Pipe',
  ProcessingS3InputMode.file: 'File',
};

EndpointSummary _$EndpointSummaryFromJson(Map<String, dynamic> json) {
  return EndpointSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    endpointArn: json['EndpointArn'] as String,
    endpointName: json['EndpointName'] as String,
    endpointStatus:
        _$enumDecode(_$EndpointStatusEnumMap, json['EndpointStatus']),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
  );
}

Experiment _$ExperimentFromJson(Map<String, dynamic> json) {
  return Experiment(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String?,
    displayName: json['DisplayName'] as String?,
    experimentArn: json['ExperimentArn'] as String?,
    experimentName: json['ExperimentName'] as String?,
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    source: json['Source'] == null
        ? null
        : ExperimentSource.fromJson(json['Source'] as Map<String, dynamic>),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ExperimentConfig _$ExperimentConfigFromJson(Map<String, dynamic> json) {
  return ExperimentConfig(
    experimentName: json['ExperimentName'] as String?,
    trialComponentDisplayName: json['TrialComponentDisplayName'] as String?,
    trialName: json['TrialName'] as String?,
  );
}

Map<String, dynamic> _$ExperimentConfigToJson(ExperimentConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExperimentName', instance.experimentName);
  writeNotNull('TrialComponentDisplayName', instance.trialComponentDisplayName);
  writeNotNull('TrialName', instance.trialName);
  return val;
}

ExperimentSource _$ExperimentSourceFromJson(Map<String, dynamic> json) {
  return ExperimentSource(
    sourceArn: json['SourceArn'] as String,
    sourceType: json['SourceType'] as String?,
  );
}

ExperimentSummary _$ExperimentSummaryFromJson(Map<String, dynamic> json) {
  return ExperimentSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    displayName: json['DisplayName'] as String?,
    experimentArn: json['ExperimentArn'] as String?,
    experimentName: json['ExperimentName'] as String?,
    experimentSource: json['ExperimentSource'] == null
        ? null
        : ExperimentSource.fromJson(
            json['ExperimentSource'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
  );
}

Explainability _$ExplainabilityFromJson(Map<String, dynamic> json) {
  return Explainability(
    report: json['Report'] == null
        ? null
        : MetricsSource.fromJson(json['Report'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ExplainabilityToJson(Explainability instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Report', instance.report?.toJson());
  return val;
}

FeatureDefinition _$FeatureDefinitionFromJson(Map<String, dynamic> json) {
  return FeatureDefinition(
    featureName: json['FeatureName'] as String?,
    featureType:
        _$enumDecodeNullable(_$FeatureTypeEnumMap, json['FeatureType']),
  );
}

Map<String, dynamic> _$FeatureDefinitionToJson(FeatureDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FeatureName', instance.featureName);
  writeNotNull('FeatureType', _$FeatureTypeEnumMap[instance.featureType]);
  return val;
}

const _$FeatureTypeEnumMap = {
  FeatureType.integral: 'Integral',
  FeatureType.fractional: 'Fractional',
  FeatureType.string: 'String',
};

FeatureGroup _$FeatureGroupFromJson(Map<String, dynamic> json) {
  return FeatureGroup(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String?,
    eventTimeFeatureName: json['EventTimeFeatureName'] as String?,
    failureReason: json['FailureReason'] as String?,
    featureDefinitions: (json['FeatureDefinitions'] as List<dynamic>?)
        ?.map((e) => FeatureDefinition.fromJson(e as Map<String, dynamic>))
        .toList(),
    featureGroupArn: json['FeatureGroupArn'] as String?,
    featureGroupName: json['FeatureGroupName'] as String?,
    featureGroupStatus: _$enumDecodeNullable(
        _$FeatureGroupStatusEnumMap, json['FeatureGroupStatus']),
    offlineStoreConfig: json['OfflineStoreConfig'] == null
        ? null
        : OfflineStoreConfig.fromJson(
            json['OfflineStoreConfig'] as Map<String, dynamic>),
    offlineStoreStatus: json['OfflineStoreStatus'] == null
        ? null
        : OfflineStoreStatus.fromJson(
            json['OfflineStoreStatus'] as Map<String, dynamic>),
    onlineStoreConfig: json['OnlineStoreConfig'] == null
        ? null
        : OnlineStoreConfig.fromJson(
            json['OnlineStoreConfig'] as Map<String, dynamic>),
    recordIdentifierFeatureName: json['RecordIdentifierFeatureName'] as String?,
    roleArn: json['RoleArn'] as String?,
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

FeatureGroupSummary _$FeatureGroupSummaryFromJson(Map<String, dynamic> json) {
  return FeatureGroupSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    featureGroupArn: json['FeatureGroupArn'] as String,
    featureGroupName: json['FeatureGroupName'] as String,
    featureGroupStatus: _$enumDecodeNullable(
        _$FeatureGroupStatusEnumMap, json['FeatureGroupStatus']),
    offlineStoreStatus: json['OfflineStoreStatus'] == null
        ? null
        : OfflineStoreStatus.fromJson(
            json['OfflineStoreStatus'] as Map<String, dynamic>),
  );
}

FileSystemConfig _$FileSystemConfigFromJson(Map<String, dynamic> json) {
  return FileSystemConfig(
    defaultGid: json['DefaultGid'] as int?,
    defaultUid: json['DefaultUid'] as int?,
    mountPath: json['MountPath'] as String?,
  );
}

Map<String, dynamic> _$FileSystemConfigToJson(FileSystemConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultGid', instance.defaultGid);
  writeNotNull('DefaultUid', instance.defaultUid);
  writeNotNull('MountPath', instance.mountPath);
  return val;
}

FileSystemDataSource _$FileSystemDataSourceFromJson(Map<String, dynamic> json) {
  return FileSystemDataSource(
    directoryPath: json['DirectoryPath'] as String,
    fileSystemAccessMode: _$enumDecode(
        _$FileSystemAccessModeEnumMap, json['FileSystemAccessMode']),
    fileSystemId: json['FileSystemId'] as String,
    fileSystemType:
        _$enumDecode(_$FileSystemTypeEnumMap, json['FileSystemType']),
  );
}

Map<String, dynamic> _$FileSystemDataSourceToJson(
        FileSystemDataSource instance) =>
    <String, dynamic>{
      'DirectoryPath': instance.directoryPath,
      'FileSystemAccessMode':
          _$FileSystemAccessModeEnumMap[instance.fileSystemAccessMode],
      'FileSystemId': instance.fileSystemId,
      'FileSystemType': _$FileSystemTypeEnumMap[instance.fileSystemType],
    };

const _$FileSystemAccessModeEnumMap = {
  FileSystemAccessMode.rw: 'rw',
  FileSystemAccessMode.ro: 'ro',
};

const _$FileSystemTypeEnumMap = {
  FileSystemType.efs: 'EFS',
  FileSystemType.fSxLustre: 'FSxLustre',
};

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{
    'Name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Operator', _$OperatorEnumMap[instance.operator]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$OperatorEnumMap = {
  Operator.equals: 'Equals',
  Operator.notEquals: 'NotEquals',
  Operator.greaterThan: 'GreaterThan',
  Operator.greaterThanOrEqualTo: 'GreaterThanOrEqualTo',
  Operator.lessThan: 'LessThan',
  Operator.lessThanOrEqualTo: 'LessThanOrEqualTo',
  Operator.contains: 'Contains',
  Operator.exists: 'Exists',
  Operator.notExists: 'NotExists',
  Operator.$in: 'In',
};

FinalAutoMLJobObjectiveMetric _$FinalAutoMLJobObjectiveMetricFromJson(
    Map<String, dynamic> json) {
  return FinalAutoMLJobObjectiveMetric(
    metricName: _$enumDecode(_$AutoMLMetricEnumEnumMap, json['MetricName']),
    value: (json['Value'] as num).toDouble(),
    type: _$enumDecodeNullable(_$AutoMLJobObjectiveTypeEnumMap, json['Type']),
  );
}

const _$AutoMLJobObjectiveTypeEnumMap = {
  AutoMLJobObjectiveType.maximize: 'Maximize',
  AutoMLJobObjectiveType.minimize: 'Minimize',
};

FinalHyperParameterTuningJobObjectiveMetric
    _$FinalHyperParameterTuningJobObjectiveMetricFromJson(
        Map<String, dynamic> json) {
  return FinalHyperParameterTuningJobObjectiveMetric(
    metricName: json['MetricName'] as String,
    value: (json['Value'] as num).toDouble(),
    type: _$enumDecodeNullable(
        _$HyperParameterTuningJobObjectiveTypeEnumMap, json['Type']),
  );
}

const _$HyperParameterTuningJobObjectiveTypeEnumMap = {
  HyperParameterTuningJobObjectiveType.maximize: 'Maximize',
  HyperParameterTuningJobObjectiveType.minimize: 'Minimize',
};

FlowDefinitionOutputConfig _$FlowDefinitionOutputConfigFromJson(
    Map<String, dynamic> json) {
  return FlowDefinitionOutputConfig(
    s3OutputPath: json['S3OutputPath'] as String,
    kmsKeyId: json['KmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$FlowDefinitionOutputConfigToJson(
    FlowDefinitionOutputConfig instance) {
  final val = <String, dynamic>{
    'S3OutputPath': instance.s3OutputPath,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

FlowDefinitionSummary _$FlowDefinitionSummaryFromJson(
    Map<String, dynamic> json) {
  return FlowDefinitionSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    flowDefinitionArn: json['FlowDefinitionArn'] as String,
    flowDefinitionName: json['FlowDefinitionName'] as String,
    flowDefinitionStatus: _$enumDecode(
        _$FlowDefinitionStatusEnumMap, json['FlowDefinitionStatus']),
    failureReason: json['FailureReason'] as String?,
  );
}

GetDeviceFleetReportResponse _$GetDeviceFleetReportResponseFromJson(
    Map<String, dynamic> json) {
  return GetDeviceFleetReportResponse(
    deviceFleetArn: json['DeviceFleetArn'] as String,
    deviceFleetName: json['DeviceFleetName'] as String,
    agentVersions: (json['AgentVersions'] as List<dynamic>?)
        ?.map((e) => AgentVersion.fromJson(e as Map<String, dynamic>))
        .toList(),
    description: json['Description'] as String?,
    deviceStats: json['DeviceStats'] == null
        ? null
        : DeviceStats.fromJson(json['DeviceStats'] as Map<String, dynamic>),
    modelStats: (json['ModelStats'] as List<dynamic>?)
        ?.map((e) => EdgeModelStat.fromJson(e as Map<String, dynamic>))
        .toList(),
    outputConfig: json['OutputConfig'] == null
        ? null
        : EdgeOutputConfig.fromJson(
            json['OutputConfig'] as Map<String, dynamic>),
    reportGenerated:
        const UnixDateTimeConverter().fromJson(json['ReportGenerated']),
  );
}

GetModelPackageGroupPolicyOutput _$GetModelPackageGroupPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return GetModelPackageGroupPolicyOutput(
    resourcePolicy: json['ResourcePolicy'] as String,
  );
}

GetSagemakerServicecatalogPortfolioStatusOutput
    _$GetSagemakerServicecatalogPortfolioStatusOutputFromJson(
        Map<String, dynamic> json) {
  return GetSagemakerServicecatalogPortfolioStatusOutput(
    status: _$enumDecodeNullable(
        _$SagemakerServicecatalogStatusEnumMap, json['Status']),
  );
}

const _$SagemakerServicecatalogStatusEnumMap = {
  SagemakerServicecatalogStatus.enabled: 'Enabled',
  SagemakerServicecatalogStatus.disabled: 'Disabled',
};

GetSearchSuggestionsResponse _$GetSearchSuggestionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetSearchSuggestionsResponse(
    propertyNameSuggestions: (json['PropertyNameSuggestions'] as List<dynamic>?)
        ?.map((e) => PropertyNameSuggestion.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

GitConfig _$GitConfigFromJson(Map<String, dynamic> json) {
  return GitConfig(
    repositoryUrl: json['RepositoryUrl'] as String,
    branch: json['Branch'] as String?,
    secretArn: json['SecretArn'] as String?,
  );
}

Map<String, dynamic> _$GitConfigToJson(GitConfig instance) {
  final val = <String, dynamic>{
    'RepositoryUrl': instance.repositoryUrl,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Branch', instance.branch);
  writeNotNull('SecretArn', instance.secretArn);
  return val;
}

Map<String, dynamic> _$GitConfigForUpdateToJson(GitConfigForUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecretArn', instance.secretArn);
  return val;
}

HumanLoopActivationConditionsConfig
    _$HumanLoopActivationConditionsConfigFromJson(Map<String, dynamic> json) {
  return HumanLoopActivationConditionsConfig(
    humanLoopActivationConditions:
        json['HumanLoopActivationConditions'] as Object,
  );
}

Map<String, dynamic> _$HumanLoopActivationConditionsConfigToJson(
        HumanLoopActivationConditionsConfig instance) =>
    <String, dynamic>{
      'HumanLoopActivationConditions': instance.humanLoopActivationConditions,
    };

HumanLoopActivationConfig _$HumanLoopActivationConfigFromJson(
    Map<String, dynamic> json) {
  return HumanLoopActivationConfig(
    humanLoopActivationConditionsConfig:
        HumanLoopActivationConditionsConfig.fromJson(
            json['HumanLoopActivationConditionsConfig']
                as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HumanLoopActivationConfigToJson(
        HumanLoopActivationConfig instance) =>
    <String, dynamic>{
      'HumanLoopActivationConditionsConfig':
          instance.humanLoopActivationConditionsConfig.toJson(),
    };

HumanLoopConfig _$HumanLoopConfigFromJson(Map<String, dynamic> json) {
  return HumanLoopConfig(
    humanTaskUiArn: json['HumanTaskUiArn'] as String,
    taskCount: json['TaskCount'] as int,
    taskDescription: json['TaskDescription'] as String,
    taskTitle: json['TaskTitle'] as String,
    workteamArn: json['WorkteamArn'] as String,
    publicWorkforceTaskPrice: json['PublicWorkforceTaskPrice'] == null
        ? null
        : PublicWorkforceTaskPrice.fromJson(
            json['PublicWorkforceTaskPrice'] as Map<String, dynamic>),
    taskAvailabilityLifetimeInSeconds:
        json['TaskAvailabilityLifetimeInSeconds'] as int?,
    taskKeywords: (json['TaskKeywords'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    taskTimeLimitInSeconds: json['TaskTimeLimitInSeconds'] as int?,
  );
}

Map<String, dynamic> _$HumanLoopConfigToJson(HumanLoopConfig instance) {
  final val = <String, dynamic>{
    'HumanTaskUiArn': instance.humanTaskUiArn,
    'TaskCount': instance.taskCount,
    'TaskDescription': instance.taskDescription,
    'TaskTitle': instance.taskTitle,
    'WorkteamArn': instance.workteamArn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'PublicWorkforceTaskPrice', instance.publicWorkforceTaskPrice?.toJson());
  writeNotNull('TaskAvailabilityLifetimeInSeconds',
      instance.taskAvailabilityLifetimeInSeconds);
  writeNotNull('TaskKeywords', instance.taskKeywords);
  writeNotNull('TaskTimeLimitInSeconds', instance.taskTimeLimitInSeconds);
  return val;
}

HumanLoopRequestSource _$HumanLoopRequestSourceFromJson(
    Map<String, dynamic> json) {
  return HumanLoopRequestSource(
    awsManagedHumanLoopRequestSource: _$enumDecode(
        _$AwsManagedHumanLoopRequestSourceEnumMap,
        json['AwsManagedHumanLoopRequestSource']),
  );
}

Map<String, dynamic> _$HumanLoopRequestSourceToJson(
        HumanLoopRequestSource instance) =>
    <String, dynamic>{
      'AwsManagedHumanLoopRequestSource':
          _$AwsManagedHumanLoopRequestSourceEnumMap[
              instance.awsManagedHumanLoopRequestSource],
    };

const _$AwsManagedHumanLoopRequestSourceEnumMap = {
  AwsManagedHumanLoopRequestSource.awsRekognitionDetectModerationLabelsImageV3:
      'AWS/Rekognition/DetectModerationLabels/Image/V3',
  AwsManagedHumanLoopRequestSource.awsTextractAnalyzeDocumentFormsV1:
      'AWS/Textract/AnalyzeDocument/Forms/V1',
};

HumanTaskConfig _$HumanTaskConfigFromJson(Map<String, dynamic> json) {
  return HumanTaskConfig(
    annotationConsolidationConfig: AnnotationConsolidationConfig.fromJson(
        json['AnnotationConsolidationConfig'] as Map<String, dynamic>),
    numberOfHumanWorkersPerDataObject:
        json['NumberOfHumanWorkersPerDataObject'] as int,
    preHumanTaskLambdaArn: json['PreHumanTaskLambdaArn'] as String,
    taskDescription: json['TaskDescription'] as String,
    taskTimeLimitInSeconds: json['TaskTimeLimitInSeconds'] as int,
    taskTitle: json['TaskTitle'] as String,
    uiConfig: UiConfig.fromJson(json['UiConfig'] as Map<String, dynamic>),
    workteamArn: json['WorkteamArn'] as String,
    maxConcurrentTaskCount: json['MaxConcurrentTaskCount'] as int?,
    publicWorkforceTaskPrice: json['PublicWorkforceTaskPrice'] == null
        ? null
        : PublicWorkforceTaskPrice.fromJson(
            json['PublicWorkforceTaskPrice'] as Map<String, dynamic>),
    taskAvailabilityLifetimeInSeconds:
        json['TaskAvailabilityLifetimeInSeconds'] as int?,
    taskKeywords: (json['TaskKeywords'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$HumanTaskConfigToJson(HumanTaskConfig instance) {
  final val = <String, dynamic>{
    'AnnotationConsolidationConfig':
        instance.annotationConsolidationConfig.toJson(),
    'NumberOfHumanWorkersPerDataObject':
        instance.numberOfHumanWorkersPerDataObject,
    'PreHumanTaskLambdaArn': instance.preHumanTaskLambdaArn,
    'TaskDescription': instance.taskDescription,
    'TaskTimeLimitInSeconds': instance.taskTimeLimitInSeconds,
    'TaskTitle': instance.taskTitle,
    'UiConfig': instance.uiConfig.toJson(),
    'WorkteamArn': instance.workteamArn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxConcurrentTaskCount', instance.maxConcurrentTaskCount);
  writeNotNull(
      'PublicWorkforceTaskPrice', instance.publicWorkforceTaskPrice?.toJson());
  writeNotNull('TaskAvailabilityLifetimeInSeconds',
      instance.taskAvailabilityLifetimeInSeconds);
  writeNotNull('TaskKeywords', instance.taskKeywords);
  return val;
}

HumanTaskUiSummary _$HumanTaskUiSummaryFromJson(Map<String, dynamic> json) {
  return HumanTaskUiSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    humanTaskUiArn: json['HumanTaskUiArn'] as String,
    humanTaskUiName: json['HumanTaskUiName'] as String,
  );
}

HyperParameterAlgorithmSpecification
    _$HyperParameterAlgorithmSpecificationFromJson(Map<String, dynamic> json) {
  return HyperParameterAlgorithmSpecification(
    trainingInputMode:
        _$enumDecode(_$TrainingInputModeEnumMap, json['TrainingInputMode']),
    algorithmName: json['AlgorithmName'] as String?,
    metricDefinitions: (json['MetricDefinitions'] as List<dynamic>?)
        ?.map((e) => MetricDefinition.fromJson(e as Map<String, dynamic>))
        .toList(),
    trainingImage: json['TrainingImage'] as String?,
  );
}

Map<String, dynamic> _$HyperParameterAlgorithmSpecificationToJson(
    HyperParameterAlgorithmSpecification instance) {
  final val = <String, dynamic>{
    'TrainingInputMode': _$TrainingInputModeEnumMap[instance.trainingInputMode],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlgorithmName', instance.algorithmName);
  writeNotNull('MetricDefinitions',
      instance.metricDefinitions?.map((e) => e.toJson()).toList());
  writeNotNull('TrainingImage', instance.trainingImage);
  return val;
}

HyperParameterSpecification _$HyperParameterSpecificationFromJson(
    Map<String, dynamic> json) {
  return HyperParameterSpecification(
    name: json['Name'] as String,
    type: _$enumDecode(_$ParameterTypeEnumMap, json['Type']),
    defaultValue: json['DefaultValue'] as String?,
    description: json['Description'] as String?,
    isRequired: json['IsRequired'] as bool?,
    isTunable: json['IsTunable'] as bool?,
    range: json['Range'] == null
        ? null
        : ParameterRange.fromJson(json['Range'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HyperParameterSpecificationToJson(
    HyperParameterSpecification instance) {
  final val = <String, dynamic>{
    'Name': instance.name,
    'Type': _$ParameterTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultValue', instance.defaultValue);
  writeNotNull('Description', instance.description);
  writeNotNull('IsRequired', instance.isRequired);
  writeNotNull('IsTunable', instance.isTunable);
  writeNotNull('Range', instance.range?.toJson());
  return val;
}

const _$ParameterTypeEnumMap = {
  ParameterType.integer: 'Integer',
  ParameterType.continuous: 'Continuous',
  ParameterType.categorical: 'Categorical',
  ParameterType.freeText: 'FreeText',
};

HyperParameterTrainingJobDefinition
    _$HyperParameterTrainingJobDefinitionFromJson(Map<String, dynamic> json) {
  return HyperParameterTrainingJobDefinition(
    algorithmSpecification: HyperParameterAlgorithmSpecification.fromJson(
        json['AlgorithmSpecification'] as Map<String, dynamic>),
    outputDataConfig: OutputDataConfig.fromJson(
        json['OutputDataConfig'] as Map<String, dynamic>),
    resourceConfig:
        ResourceConfig.fromJson(json['ResourceConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    stoppingCondition: StoppingCondition.fromJson(
        json['StoppingCondition'] as Map<String, dynamic>),
    checkpointConfig: json['CheckpointConfig'] == null
        ? null
        : CheckpointConfig.fromJson(
            json['CheckpointConfig'] as Map<String, dynamic>),
    definitionName: json['DefinitionName'] as String?,
    enableInterContainerTrafficEncryption:
        json['EnableInterContainerTrafficEncryption'] as bool?,
    enableManagedSpotTraining: json['EnableManagedSpotTraining'] as bool?,
    enableNetworkIsolation: json['EnableNetworkIsolation'] as bool?,
    hyperParameterRanges: json['HyperParameterRanges'] == null
        ? null
        : ParameterRanges.fromJson(
            json['HyperParameterRanges'] as Map<String, dynamic>),
    inputDataConfig: (json['InputDataConfig'] as List<dynamic>?)
        ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
        .toList(),
    staticHyperParameters:
        (json['StaticHyperParameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    tuningObjective: json['TuningObjective'] == null
        ? null
        : HyperParameterTuningJobObjective.fromJson(
            json['TuningObjective'] as Map<String, dynamic>),
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HyperParameterTrainingJobDefinitionToJson(
    HyperParameterTrainingJobDefinition instance) {
  final val = <String, dynamic>{
    'AlgorithmSpecification': instance.algorithmSpecification.toJson(),
    'OutputDataConfig': instance.outputDataConfig.toJson(),
    'ResourceConfig': instance.resourceConfig.toJson(),
    'RoleArn': instance.roleArn,
    'StoppingCondition': instance.stoppingCondition.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CheckpointConfig', instance.checkpointConfig?.toJson());
  writeNotNull('DefinitionName', instance.definitionName);
  writeNotNull('EnableInterContainerTrafficEncryption',
      instance.enableInterContainerTrafficEncryption);
  writeNotNull('EnableManagedSpotTraining', instance.enableManagedSpotTraining);
  writeNotNull('EnableNetworkIsolation', instance.enableNetworkIsolation);
  writeNotNull('HyperParameterRanges', instance.hyperParameterRanges?.toJson());
  writeNotNull('InputDataConfig',
      instance.inputDataConfig?.map((e) => e.toJson()).toList());
  writeNotNull('StaticHyperParameters', instance.staticHyperParameters);
  writeNotNull('TuningObjective', instance.tuningObjective?.toJson());
  writeNotNull('VpcConfig', instance.vpcConfig?.toJson());
  return val;
}

HyperParameterTrainingJobSummary _$HyperParameterTrainingJobSummaryFromJson(
    Map<String, dynamic> json) {
  return HyperParameterTrainingJobSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    trainingJobArn: json['TrainingJobArn'] as String,
    trainingJobName: json['TrainingJobName'] as String,
    trainingJobStatus:
        _$enumDecode(_$TrainingJobStatusEnumMap, json['TrainingJobStatus']),
    tunedHyperParameters:
        Map<String, String>.from(json['TunedHyperParameters'] as Map),
    failureReason: json['FailureReason'] as String?,
    finalHyperParameterTuningJobObjectiveMetric:
        json['FinalHyperParameterTuningJobObjectiveMetric'] == null
            ? null
            : FinalHyperParameterTuningJobObjectiveMetric.fromJson(
                json['FinalHyperParameterTuningJobObjectiveMetric']
                    as Map<String, dynamic>),
    objectiveStatus:
        _$enumDecodeNullable(_$ObjectiveStatusEnumMap, json['ObjectiveStatus']),
    trainingEndTime:
        const UnixDateTimeConverter().fromJson(json['TrainingEndTime']),
    trainingJobDefinitionName: json['TrainingJobDefinitionName'] as String?,
    trainingStartTime:
        const UnixDateTimeConverter().fromJson(json['TrainingStartTime']),
    tuningJobName: json['TuningJobName'] as String?,
  );
}

HyperParameterTuningJobConfig _$HyperParameterTuningJobConfigFromJson(
    Map<String, dynamic> json) {
  return HyperParameterTuningJobConfig(
    resourceLimits:
        ResourceLimits.fromJson(json['ResourceLimits'] as Map<String, dynamic>),
    strategy: _$enumDecode(
        _$HyperParameterTuningJobStrategyTypeEnumMap, json['Strategy']),
    hyperParameterTuningJobObjective:
        json['HyperParameterTuningJobObjective'] == null
            ? null
            : HyperParameterTuningJobObjective.fromJson(
                json['HyperParameterTuningJobObjective']
                    as Map<String, dynamic>),
    parameterRanges: json['ParameterRanges'] == null
        ? null
        : ParameterRanges.fromJson(
            json['ParameterRanges'] as Map<String, dynamic>),
    trainingJobEarlyStoppingType: _$enumDecodeNullable(
        _$TrainingJobEarlyStoppingTypeEnumMap,
        json['TrainingJobEarlyStoppingType']),
    tuningJobCompletionCriteria: json['TuningJobCompletionCriteria'] == null
        ? null
        : TuningJobCompletionCriteria.fromJson(
            json['TuningJobCompletionCriteria'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HyperParameterTuningJobConfigToJson(
    HyperParameterTuningJobConfig instance) {
  final val = <String, dynamic>{
    'ResourceLimits': instance.resourceLimits.toJson(),
    'Strategy': _$HyperParameterTuningJobStrategyTypeEnumMap[instance.strategy],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HyperParameterTuningJobObjective',
      instance.hyperParameterTuningJobObjective?.toJson());
  writeNotNull('ParameterRanges', instance.parameterRanges?.toJson());
  writeNotNull(
      'TrainingJobEarlyStoppingType',
      _$TrainingJobEarlyStoppingTypeEnumMap[
          instance.trainingJobEarlyStoppingType]);
  writeNotNull('TuningJobCompletionCriteria',
      instance.tuningJobCompletionCriteria?.toJson());
  return val;
}

const _$HyperParameterTuningJobStrategyTypeEnumMap = {
  HyperParameterTuningJobStrategyType.bayesian: 'Bayesian',
  HyperParameterTuningJobStrategyType.random: 'Random',
};

const _$TrainingJobEarlyStoppingTypeEnumMap = {
  TrainingJobEarlyStoppingType.off: 'Off',
  TrainingJobEarlyStoppingType.auto: 'Auto',
};

HyperParameterTuningJobObjective _$HyperParameterTuningJobObjectiveFromJson(
    Map<String, dynamic> json) {
  return HyperParameterTuningJobObjective(
    metricName: json['MetricName'] as String,
    type: _$enumDecode(
        _$HyperParameterTuningJobObjectiveTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$HyperParameterTuningJobObjectiveToJson(
        HyperParameterTuningJobObjective instance) =>
    <String, dynamic>{
      'MetricName': instance.metricName,
      'Type': _$HyperParameterTuningJobObjectiveTypeEnumMap[instance.type],
    };

HyperParameterTuningJobSummary _$HyperParameterTuningJobSummaryFromJson(
    Map<String, dynamic> json) {
  return HyperParameterTuningJobSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    hyperParameterTuningJobArn: json['HyperParameterTuningJobArn'] as String,
    hyperParameterTuningJobName: json['HyperParameterTuningJobName'] as String,
    hyperParameterTuningJobStatus: _$enumDecode(
        _$HyperParameterTuningJobStatusEnumMap,
        json['HyperParameterTuningJobStatus']),
    objectiveStatusCounters: ObjectiveStatusCounters.fromJson(
        json['ObjectiveStatusCounters'] as Map<String, dynamic>),
    strategy: _$enumDecode(
        _$HyperParameterTuningJobStrategyTypeEnumMap, json['Strategy']),
    trainingJobStatusCounters: TrainingJobStatusCounters.fromJson(
        json['TrainingJobStatusCounters'] as Map<String, dynamic>),
    hyperParameterTuningEndTime: const UnixDateTimeConverter()
        .fromJson(json['HyperParameterTuningEndTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    resourceLimits: json['ResourceLimits'] == null
        ? null
        : ResourceLimits.fromJson(
            json['ResourceLimits'] as Map<String, dynamic>),
  );
}

HyperParameterTuningJobWarmStartConfig
    _$HyperParameterTuningJobWarmStartConfigFromJson(
        Map<String, dynamic> json) {
  return HyperParameterTuningJobWarmStartConfig(
    parentHyperParameterTuningJobs: (json['ParentHyperParameterTuningJobs']
            as List<dynamic>)
        .map((e) =>
            ParentHyperParameterTuningJob.fromJson(e as Map<String, dynamic>))
        .toList(),
    warmStartType: _$enumDecode(
        _$HyperParameterTuningJobWarmStartTypeEnumMap, json['WarmStartType']),
  );
}

Map<String, dynamic> _$HyperParameterTuningJobWarmStartConfigToJson(
        HyperParameterTuningJobWarmStartConfig instance) =>
    <String, dynamic>{
      'ParentHyperParameterTuningJobs': instance.parentHyperParameterTuningJobs
          .map((e) => e.toJson())
          .toList(),
      'WarmStartType':
          _$HyperParameterTuningJobWarmStartTypeEnumMap[instance.warmStartType],
    };

const _$HyperParameterTuningJobWarmStartTypeEnumMap = {
  HyperParameterTuningJobWarmStartType.identicalDataAndAlgorithm:
      'IdenticalDataAndAlgorithm',
  HyperParameterTuningJobWarmStartType.transferLearning: 'TransferLearning',
};

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    imageArn: json['ImageArn'] as String,
    imageName: json['ImageName'] as String,
    imageStatus: _$enumDecode(_$ImageStatusEnumMap, json['ImageStatus']),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    description: json['Description'] as String?,
    displayName: json['DisplayName'] as String?,
    failureReason: json['FailureReason'] as String?,
  );
}

ImageConfig _$ImageConfigFromJson(Map<String, dynamic> json) {
  return ImageConfig(
    repositoryAccessMode: _$enumDecode(
        _$RepositoryAccessModeEnumMap, json['RepositoryAccessMode']),
  );
}

Map<String, dynamic> _$ImageConfigToJson(ImageConfig instance) =>
    <String, dynamic>{
      'RepositoryAccessMode':
          _$RepositoryAccessModeEnumMap[instance.repositoryAccessMode],
    };

const _$RepositoryAccessModeEnumMap = {
  RepositoryAccessMode.platform: 'Platform',
  RepositoryAccessMode.vpc: 'Vpc',
};

ImageVersion _$ImageVersionFromJson(Map<String, dynamic> json) {
  return ImageVersion(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    imageArn: json['ImageArn'] as String,
    imageVersionArn: json['ImageVersionArn'] as String,
    imageVersionStatus:
        _$enumDecode(_$ImageVersionStatusEnumMap, json['ImageVersionStatus']),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    version: json['Version'] as int,
    failureReason: json['FailureReason'] as String?,
  );
}

InferenceSpecification _$InferenceSpecificationFromJson(
    Map<String, dynamic> json) {
  return InferenceSpecification(
    containers: (json['Containers'] as List<dynamic>)
        .map((e) =>
            ModelPackageContainerDefinition.fromJson(e as Map<String, dynamic>))
        .toList(),
    supportedContentTypes: (json['SupportedContentTypes'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    supportedResponseMIMETypes:
        (json['SupportedResponseMIMETypes'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
    supportedRealtimeInferenceInstanceTypes:
        (json['SupportedRealtimeInferenceInstanceTypes'] as List<dynamic>?)
            ?.map(
                (e) => _$enumDecode(_$ProductionVariantInstanceTypeEnumMap, e))
            .toList(),
    supportedTransformInstanceTypes:
        (json['SupportedTransformInstanceTypes'] as List<dynamic>?)
            ?.map((e) => _$enumDecode(_$TransformInstanceTypeEnumMap, e))
            .toList(),
  );
}

Map<String, dynamic> _$InferenceSpecificationToJson(
    InferenceSpecification instance) {
  final val = <String, dynamic>{
    'Containers': instance.containers.map((e) => e.toJson()).toList(),
    'SupportedContentTypes': instance.supportedContentTypes,
    'SupportedResponseMIMETypes': instance.supportedResponseMIMETypes,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'SupportedRealtimeInferenceInstanceTypes',
      instance.supportedRealtimeInferenceInstanceTypes
          ?.map((e) => _$ProductionVariantInstanceTypeEnumMap[e])
          .toList());
  writeNotNull(
      'SupportedTransformInstanceTypes',
      instance.supportedTransformInstanceTypes
          ?.map((e) => _$TransformInstanceTypeEnumMap[e])
          .toList());
  return val;
}

const _$ProductionVariantInstanceTypeEnumMap = {
  ProductionVariantInstanceType.mlT2Medium: 'ml.t2.medium',
  ProductionVariantInstanceType.mlT2Large: 'ml.t2.large',
  ProductionVariantInstanceType.mlT2Xlarge: 'ml.t2.xlarge',
  ProductionVariantInstanceType.mlT2_2xlarge: 'ml.t2.2xlarge',
  ProductionVariantInstanceType.mlM4Xlarge: 'ml.m4.xlarge',
  ProductionVariantInstanceType.mlM4_2xlarge: 'ml.m4.2xlarge',
  ProductionVariantInstanceType.mlM4_4xlarge: 'ml.m4.4xlarge',
  ProductionVariantInstanceType.mlM4_10xlarge: 'ml.m4.10xlarge',
  ProductionVariantInstanceType.mlM4_16xlarge: 'ml.m4.16xlarge',
  ProductionVariantInstanceType.mlM5Large: 'ml.m5.large',
  ProductionVariantInstanceType.mlM5Xlarge: 'ml.m5.xlarge',
  ProductionVariantInstanceType.mlM5_2xlarge: 'ml.m5.2xlarge',
  ProductionVariantInstanceType.mlM5_4xlarge: 'ml.m5.4xlarge',
  ProductionVariantInstanceType.mlM5_12xlarge: 'ml.m5.12xlarge',
  ProductionVariantInstanceType.mlM5_24xlarge: 'ml.m5.24xlarge',
  ProductionVariantInstanceType.mlM5dLarge: 'ml.m5d.large',
  ProductionVariantInstanceType.mlM5dXlarge: 'ml.m5d.xlarge',
  ProductionVariantInstanceType.mlM5d_2xlarge: 'ml.m5d.2xlarge',
  ProductionVariantInstanceType.mlM5d_4xlarge: 'ml.m5d.4xlarge',
  ProductionVariantInstanceType.mlM5d_12xlarge: 'ml.m5d.12xlarge',
  ProductionVariantInstanceType.mlM5d_24xlarge: 'ml.m5d.24xlarge',
  ProductionVariantInstanceType.mlC4Large: 'ml.c4.large',
  ProductionVariantInstanceType.mlC4Xlarge: 'ml.c4.xlarge',
  ProductionVariantInstanceType.mlC4_2xlarge: 'ml.c4.2xlarge',
  ProductionVariantInstanceType.mlC4_4xlarge: 'ml.c4.4xlarge',
  ProductionVariantInstanceType.mlC4_8xlarge: 'ml.c4.8xlarge',
  ProductionVariantInstanceType.mlP2Xlarge: 'ml.p2.xlarge',
  ProductionVariantInstanceType.mlP2_8xlarge: 'ml.p2.8xlarge',
  ProductionVariantInstanceType.mlP2_16xlarge: 'ml.p2.16xlarge',
  ProductionVariantInstanceType.mlP3_2xlarge: 'ml.p3.2xlarge',
  ProductionVariantInstanceType.mlP3_8xlarge: 'ml.p3.8xlarge',
  ProductionVariantInstanceType.mlP3_16xlarge: 'ml.p3.16xlarge',
  ProductionVariantInstanceType.mlC5Large: 'ml.c5.large',
  ProductionVariantInstanceType.mlC5Xlarge: 'ml.c5.xlarge',
  ProductionVariantInstanceType.mlC5_2xlarge: 'ml.c5.2xlarge',
  ProductionVariantInstanceType.mlC5_4xlarge: 'ml.c5.4xlarge',
  ProductionVariantInstanceType.mlC5_9xlarge: 'ml.c5.9xlarge',
  ProductionVariantInstanceType.mlC5_18xlarge: 'ml.c5.18xlarge',
  ProductionVariantInstanceType.mlC5dLarge: 'ml.c5d.large',
  ProductionVariantInstanceType.mlC5dXlarge: 'ml.c5d.xlarge',
  ProductionVariantInstanceType.mlC5d_2xlarge: 'ml.c5d.2xlarge',
  ProductionVariantInstanceType.mlC5d_4xlarge: 'ml.c5d.4xlarge',
  ProductionVariantInstanceType.mlC5d_9xlarge: 'ml.c5d.9xlarge',
  ProductionVariantInstanceType.mlC5d_18xlarge: 'ml.c5d.18xlarge',
  ProductionVariantInstanceType.mlG4dnXlarge: 'ml.g4dn.xlarge',
  ProductionVariantInstanceType.mlG4dn_2xlarge: 'ml.g4dn.2xlarge',
  ProductionVariantInstanceType.mlG4dn_4xlarge: 'ml.g4dn.4xlarge',
  ProductionVariantInstanceType.mlG4dn_8xlarge: 'ml.g4dn.8xlarge',
  ProductionVariantInstanceType.mlG4dn_12xlarge: 'ml.g4dn.12xlarge',
  ProductionVariantInstanceType.mlG4dn_16xlarge: 'ml.g4dn.16xlarge',
  ProductionVariantInstanceType.mlR5Large: 'ml.r5.large',
  ProductionVariantInstanceType.mlR5Xlarge: 'ml.r5.xlarge',
  ProductionVariantInstanceType.mlR5_2xlarge: 'ml.r5.2xlarge',
  ProductionVariantInstanceType.mlR5_4xlarge: 'ml.r5.4xlarge',
  ProductionVariantInstanceType.mlR5_12xlarge: 'ml.r5.12xlarge',
  ProductionVariantInstanceType.mlR5_24xlarge: 'ml.r5.24xlarge',
  ProductionVariantInstanceType.mlR5dLarge: 'ml.r5d.large',
  ProductionVariantInstanceType.mlR5dXlarge: 'ml.r5d.xlarge',
  ProductionVariantInstanceType.mlR5d_2xlarge: 'ml.r5d.2xlarge',
  ProductionVariantInstanceType.mlR5d_4xlarge: 'ml.r5d.4xlarge',
  ProductionVariantInstanceType.mlR5d_12xlarge: 'ml.r5d.12xlarge',
  ProductionVariantInstanceType.mlR5d_24xlarge: 'ml.r5d.24xlarge',
  ProductionVariantInstanceType.mlInf1Xlarge: 'ml.inf1.xlarge',
  ProductionVariantInstanceType.mlInf1_2xlarge: 'ml.inf1.2xlarge',
  ProductionVariantInstanceType.mlInf1_6xlarge: 'ml.inf1.6xlarge',
  ProductionVariantInstanceType.mlInf1_24xlarge: 'ml.inf1.24xlarge',
};

const _$TransformInstanceTypeEnumMap = {
  TransformInstanceType.mlM4Xlarge: 'ml.m4.xlarge',
  TransformInstanceType.mlM4_2xlarge: 'ml.m4.2xlarge',
  TransformInstanceType.mlM4_4xlarge: 'ml.m4.4xlarge',
  TransformInstanceType.mlM4_10xlarge: 'ml.m4.10xlarge',
  TransformInstanceType.mlM4_16xlarge: 'ml.m4.16xlarge',
  TransformInstanceType.mlC4Xlarge: 'ml.c4.xlarge',
  TransformInstanceType.mlC4_2xlarge: 'ml.c4.2xlarge',
  TransformInstanceType.mlC4_4xlarge: 'ml.c4.4xlarge',
  TransformInstanceType.mlC4_8xlarge: 'ml.c4.8xlarge',
  TransformInstanceType.mlP2Xlarge: 'ml.p2.xlarge',
  TransformInstanceType.mlP2_8xlarge: 'ml.p2.8xlarge',
  TransformInstanceType.mlP2_16xlarge: 'ml.p2.16xlarge',
  TransformInstanceType.mlP3_2xlarge: 'ml.p3.2xlarge',
  TransformInstanceType.mlP3_8xlarge: 'ml.p3.8xlarge',
  TransformInstanceType.mlP3_16xlarge: 'ml.p3.16xlarge',
  TransformInstanceType.mlC5Xlarge: 'ml.c5.xlarge',
  TransformInstanceType.mlC5_2xlarge: 'ml.c5.2xlarge',
  TransformInstanceType.mlC5_4xlarge: 'ml.c5.4xlarge',
  TransformInstanceType.mlC5_9xlarge: 'ml.c5.9xlarge',
  TransformInstanceType.mlC5_18xlarge: 'ml.c5.18xlarge',
  TransformInstanceType.mlM5Large: 'ml.m5.large',
  TransformInstanceType.mlM5Xlarge: 'ml.m5.xlarge',
  TransformInstanceType.mlM5_2xlarge: 'ml.m5.2xlarge',
  TransformInstanceType.mlM5_4xlarge: 'ml.m5.4xlarge',
  TransformInstanceType.mlM5_12xlarge: 'ml.m5.12xlarge',
  TransformInstanceType.mlM5_24xlarge: 'ml.m5.24xlarge',
};

InputConfig _$InputConfigFromJson(Map<String, dynamic> json) {
  return InputConfig(
    dataInputConfig: json['DataInputConfig'] as String,
    framework: _$enumDecode(_$FrameworkEnumMap, json['Framework']),
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$InputConfigToJson(InputConfig instance) =>
    <String, dynamic>{
      'DataInputConfig': instance.dataInputConfig,
      'Framework': _$FrameworkEnumMap[instance.framework],
      'S3Uri': instance.s3Uri,
    };

const _$FrameworkEnumMap = {
  Framework.tensorflow: 'TENSORFLOW',
  Framework.keras: 'KERAS',
  Framework.mxnet: 'MXNET',
  Framework.onnx: 'ONNX',
  Framework.pytorch: 'PYTORCH',
  Framework.xgboost: 'XGBOOST',
  Framework.tflite: 'TFLITE',
  Framework.darknet: 'DARKNET',
  Framework.sklearn: 'SKLEARN',
};

IntegerParameterRange _$IntegerParameterRangeFromJson(
    Map<String, dynamic> json) {
  return IntegerParameterRange(
    maxValue: json['MaxValue'] as String,
    minValue: json['MinValue'] as String,
    name: json['Name'] as String,
    scalingType: _$enumDecodeNullable(
        _$HyperParameterScalingTypeEnumMap, json['ScalingType']),
  );
}

Map<String, dynamic> _$IntegerParameterRangeToJson(
    IntegerParameterRange instance) {
  final val = <String, dynamic>{
    'MaxValue': instance.maxValue,
    'MinValue': instance.minValue,
    'Name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ScalingType', _$HyperParameterScalingTypeEnumMap[instance.scalingType]);
  return val;
}

IntegerParameterRangeSpecification _$IntegerParameterRangeSpecificationFromJson(
    Map<String, dynamic> json) {
  return IntegerParameterRangeSpecification(
    maxValue: json['MaxValue'] as String,
    minValue: json['MinValue'] as String,
  );
}

Map<String, dynamic> _$IntegerParameterRangeSpecificationToJson(
        IntegerParameterRangeSpecification instance) =>
    <String, dynamic>{
      'MaxValue': instance.maxValue,
      'MinValue': instance.minValue,
    };

JupyterServerAppSettings _$JupyterServerAppSettingsFromJson(
    Map<String, dynamic> json) {
  return JupyterServerAppSettings(
    defaultResourceSpec: json['DefaultResourceSpec'] == null
        ? null
        : ResourceSpec.fromJson(
            json['DefaultResourceSpec'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JupyterServerAppSettingsToJson(
    JupyterServerAppSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultResourceSpec', instance.defaultResourceSpec?.toJson());
  return val;
}

KernelGatewayAppSettings _$KernelGatewayAppSettingsFromJson(
    Map<String, dynamic> json) {
  return KernelGatewayAppSettings(
    customImages: (json['CustomImages'] as List<dynamic>?)
        ?.map((e) => CustomImage.fromJson(e as Map<String, dynamic>))
        .toList(),
    defaultResourceSpec: json['DefaultResourceSpec'] == null
        ? null
        : ResourceSpec.fromJson(
            json['DefaultResourceSpec'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KernelGatewayAppSettingsToJson(
    KernelGatewayAppSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CustomImages', instance.customImages?.map((e) => e.toJson()).toList());
  writeNotNull('DefaultResourceSpec', instance.defaultResourceSpec?.toJson());
  return val;
}

KernelGatewayImageConfig _$KernelGatewayImageConfigFromJson(
    Map<String, dynamic> json) {
  return KernelGatewayImageConfig(
    kernelSpecs: (json['KernelSpecs'] as List<dynamic>)
        .map((e) => KernelSpec.fromJson(e as Map<String, dynamic>))
        .toList(),
    fileSystemConfig: json['FileSystemConfig'] == null
        ? null
        : FileSystemConfig.fromJson(
            json['FileSystemConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KernelGatewayImageConfigToJson(
    KernelGatewayImageConfig instance) {
  final val = <String, dynamic>{
    'KernelSpecs': instance.kernelSpecs.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FileSystemConfig', instance.fileSystemConfig?.toJson());
  return val;
}

KernelSpec _$KernelSpecFromJson(Map<String, dynamic> json) {
  return KernelSpec(
    name: json['Name'] as String,
    displayName: json['DisplayName'] as String?,
  );
}

Map<String, dynamic> _$KernelSpecToJson(KernelSpec instance) {
  final val = <String, dynamic>{
    'Name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DisplayName', instance.displayName);
  return val;
}

LabelCounters _$LabelCountersFromJson(Map<String, dynamic> json) {
  return LabelCounters(
    failedNonRetryableError: json['FailedNonRetryableError'] as int?,
    humanLabeled: json['HumanLabeled'] as int?,
    machineLabeled: json['MachineLabeled'] as int?,
    totalLabeled: json['TotalLabeled'] as int?,
    unlabeled: json['Unlabeled'] as int?,
  );
}

LabelCountersForWorkteam _$LabelCountersForWorkteamFromJson(
    Map<String, dynamic> json) {
  return LabelCountersForWorkteam(
    humanLabeled: json['HumanLabeled'] as int?,
    pendingHuman: json['PendingHuman'] as int?,
    total: json['Total'] as int?,
  );
}

LabelingJobAlgorithmsConfig _$LabelingJobAlgorithmsConfigFromJson(
    Map<String, dynamic> json) {
  return LabelingJobAlgorithmsConfig(
    labelingJobAlgorithmSpecificationArn:
        json['LabelingJobAlgorithmSpecificationArn'] as String,
    initialActiveLearningModelArn:
        json['InitialActiveLearningModelArn'] as String?,
    labelingJobResourceConfig: json['LabelingJobResourceConfig'] == null
        ? null
        : LabelingJobResourceConfig.fromJson(
            json['LabelingJobResourceConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LabelingJobAlgorithmsConfigToJson(
    LabelingJobAlgorithmsConfig instance) {
  final val = <String, dynamic>{
    'LabelingJobAlgorithmSpecificationArn':
        instance.labelingJobAlgorithmSpecificationArn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'InitialActiveLearningModelArn', instance.initialActiveLearningModelArn);
  writeNotNull('LabelingJobResourceConfig',
      instance.labelingJobResourceConfig?.toJson());
  return val;
}

LabelingJobDataAttributes _$LabelingJobDataAttributesFromJson(
    Map<String, dynamic> json) {
  return LabelingJobDataAttributes(
    contentClassifiers: (json['ContentClassifiers'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$ContentClassifierEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$LabelingJobDataAttributesToJson(
    LabelingJobDataAttributes instance) {
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

LabelingJobDataSource _$LabelingJobDataSourceFromJson(
    Map<String, dynamic> json) {
  return LabelingJobDataSource(
    s3DataSource: json['S3DataSource'] == null
        ? null
        : LabelingJobS3DataSource.fromJson(
            json['S3DataSource'] as Map<String, dynamic>),
    snsDataSource: json['SnsDataSource'] == null
        ? null
        : LabelingJobSnsDataSource.fromJson(
            json['SnsDataSource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LabelingJobDataSourceToJson(
    LabelingJobDataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3DataSource', instance.s3DataSource?.toJson());
  writeNotNull('SnsDataSource', instance.snsDataSource?.toJson());
  return val;
}

LabelingJobForWorkteamSummary _$LabelingJobForWorkteamSummaryFromJson(
    Map<String, dynamic> json) {
  return LabelingJobForWorkteamSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    jobReferenceCode: json['JobReferenceCode'] as String,
    workRequesterAccountId: json['WorkRequesterAccountId'] as String,
    labelCounters: json['LabelCounters'] == null
        ? null
        : LabelCountersForWorkteam.fromJson(
            json['LabelCounters'] as Map<String, dynamic>),
    labelingJobName: json['LabelingJobName'] as String?,
    numberOfHumanWorkersPerDataObject:
        json['NumberOfHumanWorkersPerDataObject'] as int?,
  );
}

LabelingJobInputConfig _$LabelingJobInputConfigFromJson(
    Map<String, dynamic> json) {
  return LabelingJobInputConfig(
    dataSource: LabelingJobDataSource.fromJson(
        json['DataSource'] as Map<String, dynamic>),
    dataAttributes: json['DataAttributes'] == null
        ? null
        : LabelingJobDataAttributes.fromJson(
            json['DataAttributes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LabelingJobInputConfigToJson(
    LabelingJobInputConfig instance) {
  final val = <String, dynamic>{
    'DataSource': instance.dataSource.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataAttributes', instance.dataAttributes?.toJson());
  return val;
}

LabelingJobOutput _$LabelingJobOutputFromJson(Map<String, dynamic> json) {
  return LabelingJobOutput(
    outputDatasetS3Uri: json['OutputDatasetS3Uri'] as String,
    finalActiveLearningModelArn: json['FinalActiveLearningModelArn'] as String?,
  );
}

LabelingJobOutputConfig _$LabelingJobOutputConfigFromJson(
    Map<String, dynamic> json) {
  return LabelingJobOutputConfig(
    s3OutputPath: json['S3OutputPath'] as String,
    kmsKeyId: json['KmsKeyId'] as String?,
    snsTopicArn: json['SnsTopicArn'] as String?,
  );
}

Map<String, dynamic> _$LabelingJobOutputConfigToJson(
    LabelingJobOutputConfig instance) {
  final val = <String, dynamic>{
    'S3OutputPath': instance.s3OutputPath,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('SnsTopicArn', instance.snsTopicArn);
  return val;
}

LabelingJobResourceConfig _$LabelingJobResourceConfigFromJson(
    Map<String, dynamic> json) {
  return LabelingJobResourceConfig(
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$LabelingJobResourceConfigToJson(
    LabelingJobResourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumeKmsKeyId', instance.volumeKmsKeyId);
  return val;
}

LabelingJobS3DataSource _$LabelingJobS3DataSourceFromJson(
    Map<String, dynamic> json) {
  return LabelingJobS3DataSource(
    manifestS3Uri: json['ManifestS3Uri'] as String,
  );
}

Map<String, dynamic> _$LabelingJobS3DataSourceToJson(
        LabelingJobS3DataSource instance) =>
    <String, dynamic>{
      'ManifestS3Uri': instance.manifestS3Uri,
    };

LabelingJobSnsDataSource _$LabelingJobSnsDataSourceFromJson(
    Map<String, dynamic> json) {
  return LabelingJobSnsDataSource(
    snsTopicArn: json['SnsTopicArn'] as String,
  );
}

Map<String, dynamic> _$LabelingJobSnsDataSourceToJson(
        LabelingJobSnsDataSource instance) =>
    <String, dynamic>{
      'SnsTopicArn': instance.snsTopicArn,
    };

LabelingJobStoppingConditions _$LabelingJobStoppingConditionsFromJson(
    Map<String, dynamic> json) {
  return LabelingJobStoppingConditions(
    maxHumanLabeledObjectCount: json['MaxHumanLabeledObjectCount'] as int?,
    maxPercentageOfInputDatasetLabeled:
        json['MaxPercentageOfInputDatasetLabeled'] as int?,
  );
}

Map<String, dynamic> _$LabelingJobStoppingConditionsToJson(
    LabelingJobStoppingConditions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'MaxHumanLabeledObjectCount', instance.maxHumanLabeledObjectCount);
  writeNotNull('MaxPercentageOfInputDatasetLabeled',
      instance.maxPercentageOfInputDatasetLabeled);
  return val;
}

LabelingJobSummary _$LabelingJobSummaryFromJson(Map<String, dynamic> json) {
  return LabelingJobSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    labelCounters:
        LabelCounters.fromJson(json['LabelCounters'] as Map<String, dynamic>),
    labelingJobArn: json['LabelingJobArn'] as String,
    labelingJobName: json['LabelingJobName'] as String,
    labelingJobStatus:
        _$enumDecode(_$LabelingJobStatusEnumMap, json['LabelingJobStatus']),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    preHumanTaskLambdaArn: json['PreHumanTaskLambdaArn'] as String,
    workteamArn: json['WorkteamArn'] as String,
    annotationConsolidationLambdaArn:
        json['AnnotationConsolidationLambdaArn'] as String?,
    failureReason: json['FailureReason'] as String?,
    inputConfig: json['InputConfig'] == null
        ? null
        : LabelingJobInputConfig.fromJson(
            json['InputConfig'] as Map<String, dynamic>),
    labelingJobOutput: json['LabelingJobOutput'] == null
        ? null
        : LabelingJobOutput.fromJson(
            json['LabelingJobOutput'] as Map<String, dynamic>),
  );
}

ListActionsResponse _$ListActionsResponseFromJson(Map<String, dynamic> json) {
  return ListActionsResponse(
    actionSummaries: (json['ActionSummaries'] as List<dynamic>?)
        ?.map((e) => ActionSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListAlgorithmsOutput _$ListAlgorithmsOutputFromJson(Map<String, dynamic> json) {
  return ListAlgorithmsOutput(
    algorithmSummaryList: (json['AlgorithmSummaryList'] as List<dynamic>)
        .map((e) => AlgorithmSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListAppImageConfigsResponse _$ListAppImageConfigsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAppImageConfigsResponse(
    appImageConfigs: (json['AppImageConfigs'] as List<dynamic>?)
        ?.map((e) => AppImageConfigDetails.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListAppsResponse _$ListAppsResponseFromJson(Map<String, dynamic> json) {
  return ListAppsResponse(
    apps: (json['Apps'] as List<dynamic>?)
        ?.map((e) => AppDetails.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListArtifactsResponse _$ListArtifactsResponseFromJson(
    Map<String, dynamic> json) {
  return ListArtifactsResponse(
    artifactSummaries: (json['ArtifactSummaries'] as List<dynamic>?)
        ?.map((e) => ArtifactSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListAssociationsResponse _$ListAssociationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAssociationsResponse(
    associationSummaries: (json['AssociationSummaries'] as List<dynamic>?)
        ?.map((e) => AssociationSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListAutoMLJobsResponse _$ListAutoMLJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAutoMLJobsResponse(
    autoMLJobSummaries: (json['AutoMLJobSummaries'] as List<dynamic>)
        .map((e) => AutoMLJobSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListCandidatesForAutoMLJobResponse _$ListCandidatesForAutoMLJobResponseFromJson(
    Map<String, dynamic> json) {
  return ListCandidatesForAutoMLJobResponse(
    candidates: (json['Candidates'] as List<dynamic>)
        .map((e) => AutoMLCandidate.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListCodeRepositoriesOutput _$ListCodeRepositoriesOutputFromJson(
    Map<String, dynamic> json) {
  return ListCodeRepositoriesOutput(
    codeRepositorySummaryList: (json['CodeRepositorySummaryList']
            as List<dynamic>)
        .map((e) => CodeRepositorySummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListCompilationJobsResponse _$ListCompilationJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListCompilationJobsResponse(
    compilationJobSummaries: (json['CompilationJobSummaries'] as List<dynamic>)
        .map((e) => CompilationJobSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListContextsResponse _$ListContextsResponseFromJson(Map<String, dynamic> json) {
  return ListContextsResponse(
    contextSummaries: (json['ContextSummaries'] as List<dynamic>?)
        ?.map((e) => ContextSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListDataQualityJobDefinitionsResponse
    _$ListDataQualityJobDefinitionsResponseFromJson(Map<String, dynamic> json) {
  return ListDataQualityJobDefinitionsResponse(
    jobDefinitionSummaries: (json['JobDefinitionSummaries'] as List<dynamic>)
        .map((e) =>
            MonitoringJobDefinitionSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListDeviceFleetsResponse _$ListDeviceFleetsResponseFromJson(
    Map<String, dynamic> json) {
  return ListDeviceFleetsResponse(
    deviceFleetSummaries: (json['DeviceFleetSummaries'] as List<dynamic>)
        .map((e) => DeviceFleetSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListDevicesResponse _$ListDevicesResponseFromJson(Map<String, dynamic> json) {
  return ListDevicesResponse(
    deviceSummaries: (json['DeviceSummaries'] as List<dynamic>)
        .map((e) => DeviceSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListDomainsResponse _$ListDomainsResponseFromJson(Map<String, dynamic> json) {
  return ListDomainsResponse(
    domains: (json['Domains'] as List<dynamic>?)
        ?.map((e) => DomainDetails.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListEdgePackagingJobsResponse _$ListEdgePackagingJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListEdgePackagingJobsResponse(
    edgePackagingJobSummaries: (json['EdgePackagingJobSummaries']
            as List<dynamic>)
        .map((e) => EdgePackagingJobSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListEndpointConfigsOutput _$ListEndpointConfigsOutputFromJson(
    Map<String, dynamic> json) {
  return ListEndpointConfigsOutput(
    endpointConfigs: (json['EndpointConfigs'] as List<dynamic>)
        .map((e) => EndpointConfigSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListEndpointsOutput _$ListEndpointsOutputFromJson(Map<String, dynamic> json) {
  return ListEndpointsOutput(
    endpoints: (json['Endpoints'] as List<dynamic>)
        .map((e) => EndpointSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListExperimentsResponse _$ListExperimentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListExperimentsResponse(
    experimentSummaries: (json['ExperimentSummaries'] as List<dynamic>?)
        ?.map((e) => ExperimentSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListFeatureGroupsResponse _$ListFeatureGroupsResponseFromJson(
    Map<String, dynamic> json) {
  return ListFeatureGroupsResponse(
    featureGroupSummaries: (json['FeatureGroupSummaries'] as List<dynamic>)
        .map((e) => FeatureGroupSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListFlowDefinitionsResponse _$ListFlowDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListFlowDefinitionsResponse(
    flowDefinitionSummaries: (json['FlowDefinitionSummaries'] as List<dynamic>)
        .map((e) => FlowDefinitionSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListHumanTaskUisResponse _$ListHumanTaskUisResponseFromJson(
    Map<String, dynamic> json) {
  return ListHumanTaskUisResponse(
    humanTaskUiSummaries: (json['HumanTaskUiSummaries'] as List<dynamic>)
        .map((e) => HumanTaskUiSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListHyperParameterTuningJobsResponse
    _$ListHyperParameterTuningJobsResponseFromJson(Map<String, dynamic> json) {
  return ListHyperParameterTuningJobsResponse(
    hyperParameterTuningJobSummaries: (json['HyperParameterTuningJobSummaries']
            as List<dynamic>)
        .map((e) =>
            HyperParameterTuningJobSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListImageVersionsResponse _$ListImageVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListImageVersionsResponse(
    imageVersions: (json['ImageVersions'] as List<dynamic>?)
        ?.map((e) => ImageVersion.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListImagesResponse _$ListImagesResponseFromJson(Map<String, dynamic> json) {
  return ListImagesResponse(
    images: (json['Images'] as List<dynamic>?)
        ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListLabelingJobsForWorkteamResponse
    _$ListLabelingJobsForWorkteamResponseFromJson(Map<String, dynamic> json) {
  return ListLabelingJobsForWorkteamResponse(
    labelingJobSummaryList: (json['LabelingJobSummaryList'] as List<dynamic>)
        .map((e) =>
            LabelingJobForWorkteamSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListLabelingJobsResponse _$ListLabelingJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLabelingJobsResponse(
    labelingJobSummaryList: (json['LabelingJobSummaryList'] as List<dynamic>?)
        ?.map((e) => LabelingJobSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListModelBiasJobDefinitionsResponse
    _$ListModelBiasJobDefinitionsResponseFromJson(Map<String, dynamic> json) {
  return ListModelBiasJobDefinitionsResponse(
    jobDefinitionSummaries: (json['JobDefinitionSummaries'] as List<dynamic>)
        .map((e) =>
            MonitoringJobDefinitionSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListModelExplainabilityJobDefinitionsResponse
    _$ListModelExplainabilityJobDefinitionsResponseFromJson(
        Map<String, dynamic> json) {
  return ListModelExplainabilityJobDefinitionsResponse(
    jobDefinitionSummaries: (json['JobDefinitionSummaries'] as List<dynamic>)
        .map((e) =>
            MonitoringJobDefinitionSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListModelPackageGroupsOutput _$ListModelPackageGroupsOutputFromJson(
    Map<String, dynamic> json) {
  return ListModelPackageGroupsOutput(
    modelPackageGroupSummaryList: (json['ModelPackageGroupSummaryList']
            as List<dynamic>)
        .map(
            (e) => ModelPackageGroupSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListModelPackagesOutput _$ListModelPackagesOutputFromJson(
    Map<String, dynamic> json) {
  return ListModelPackagesOutput(
    modelPackageSummaryList: (json['ModelPackageSummaryList'] as List<dynamic>)
        .map((e) => ModelPackageSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListModelQualityJobDefinitionsResponse
    _$ListModelQualityJobDefinitionsResponseFromJson(
        Map<String, dynamic> json) {
  return ListModelQualityJobDefinitionsResponse(
    jobDefinitionSummaries: (json['JobDefinitionSummaries'] as List<dynamic>)
        .map((e) =>
            MonitoringJobDefinitionSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListModelsOutput _$ListModelsOutputFromJson(Map<String, dynamic> json) {
  return ListModelsOutput(
    models: (json['Models'] as List<dynamic>)
        .map((e) => ModelSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListMonitoringExecutionsResponse _$ListMonitoringExecutionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListMonitoringExecutionsResponse(
    monitoringExecutionSummaries:
        (json['MonitoringExecutionSummaries'] as List<dynamic>)
            .map((e) =>
                MonitoringExecutionSummary.fromJson(e as Map<String, dynamic>))
            .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListMonitoringSchedulesResponse _$ListMonitoringSchedulesResponseFromJson(
    Map<String, dynamic> json) {
  return ListMonitoringSchedulesResponse(
    monitoringScheduleSummaries:
        (json['MonitoringScheduleSummaries'] as List<dynamic>)
            .map((e) =>
                MonitoringScheduleSummary.fromJson(e as Map<String, dynamic>))
            .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListNotebookInstanceLifecycleConfigsOutput
    _$ListNotebookInstanceLifecycleConfigsOutputFromJson(
        Map<String, dynamic> json) {
  return ListNotebookInstanceLifecycleConfigsOutput(
    nextToken: json['NextToken'] as String?,
    notebookInstanceLifecycleConfigs:
        (json['NotebookInstanceLifecycleConfigs'] as List<dynamic>?)
            ?.map((e) => NotebookInstanceLifecycleConfigSummary.fromJson(
                e as Map<String, dynamic>))
            .toList(),
  );
}

ListNotebookInstancesOutput _$ListNotebookInstancesOutputFromJson(
    Map<String, dynamic> json) {
  return ListNotebookInstancesOutput(
    nextToken: json['NextToken'] as String?,
    notebookInstances: (json['NotebookInstances'] as List<dynamic>?)
        ?.map(
            (e) => NotebookInstanceSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListPipelineExecutionStepsResponse _$ListPipelineExecutionStepsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPipelineExecutionStepsResponse(
    nextToken: json['NextToken'] as String?,
    pipelineExecutionSteps: (json['PipelineExecutionSteps'] as List<dynamic>?)
        ?.map((e) => PipelineExecutionStep.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListPipelineExecutionsResponse _$ListPipelineExecutionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPipelineExecutionsResponse(
    nextToken: json['NextToken'] as String?,
    pipelineExecutionSummaries: (json['PipelineExecutionSummaries']
            as List<dynamic>?)
        ?.map(
            (e) => PipelineExecutionSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListPipelineParametersForExecutionResponse
    _$ListPipelineParametersForExecutionResponseFromJson(
        Map<String, dynamic> json) {
  return ListPipelineParametersForExecutionResponse(
    nextToken: json['NextToken'] as String?,
    pipelineParameters: (json['PipelineParameters'] as List<dynamic>?)
        ?.map((e) => Parameter.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListPipelinesResponse _$ListPipelinesResponseFromJson(
    Map<String, dynamic> json) {
  return ListPipelinesResponse(
    nextToken: json['NextToken'] as String?,
    pipelineSummaries: (json['PipelineSummaries'] as List<dynamic>?)
        ?.map((e) => PipelineSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListProcessingJobsResponse _$ListProcessingJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListProcessingJobsResponse(
    processingJobSummaries: (json['ProcessingJobSummaries'] as List<dynamic>)
        .map((e) => ProcessingJobSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListProjectsOutput _$ListProjectsOutputFromJson(Map<String, dynamic> json) {
  return ListProjectsOutput(
    projectSummaryList: (json['ProjectSummaryList'] as List<dynamic>)
        .map((e) => ProjectSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListSubscribedWorkteamsResponse _$ListSubscribedWorkteamsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSubscribedWorkteamsResponse(
    subscribedWorkteams: (json['SubscribedWorkteams'] as List<dynamic>)
        .map((e) => SubscribedWorkteam.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListTagsOutput _$ListTagsOutputFromJson(Map<String, dynamic> json) {
  return ListTagsOutput(
    nextToken: json['NextToken'] as String?,
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListTrainingJobsForHyperParameterTuningJobResponse
    _$ListTrainingJobsForHyperParameterTuningJobResponseFromJson(
        Map<String, dynamic> json) {
  return ListTrainingJobsForHyperParameterTuningJobResponse(
    trainingJobSummaries: (json['TrainingJobSummaries'] as List<dynamic>)
        .map((e) => HyperParameterTrainingJobSummary.fromJson(
            e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListTrainingJobsResponse _$ListTrainingJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTrainingJobsResponse(
    trainingJobSummaries: (json['TrainingJobSummaries'] as List<dynamic>)
        .map((e) => TrainingJobSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListTransformJobsResponse _$ListTransformJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTransformJobsResponse(
    transformJobSummaries: (json['TransformJobSummaries'] as List<dynamic>)
        .map((e) => TransformJobSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListTrialComponentsResponse _$ListTrialComponentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTrialComponentsResponse(
    nextToken: json['NextToken'] as String?,
    trialComponentSummaries: (json['TrialComponentSummaries'] as List<dynamic>?)
        ?.map((e) => TrialComponentSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListTrialsResponse _$ListTrialsResponseFromJson(Map<String, dynamic> json) {
  return ListTrialsResponse(
    nextToken: json['NextToken'] as String?,
    trialSummaries: (json['TrialSummaries'] as List<dynamic>?)
        ?.map((e) => TrialSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListUserProfilesResponse _$ListUserProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return ListUserProfilesResponse(
    nextToken: json['NextToken'] as String?,
    userProfiles: (json['UserProfiles'] as List<dynamic>?)
        ?.map((e) => UserProfileDetails.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListWorkforcesResponse _$ListWorkforcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListWorkforcesResponse(
    workforces: (json['Workforces'] as List<dynamic>)
        .map((e) => Workforce.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListWorkteamsResponse _$ListWorkteamsResponseFromJson(
    Map<String, dynamic> json) {
  return ListWorkteamsResponse(
    workteams: (json['Workteams'] as List<dynamic>)
        .map((e) => Workteam.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

MemberDefinition _$MemberDefinitionFromJson(Map<String, dynamic> json) {
  return MemberDefinition(
    cognitoMemberDefinition: json['CognitoMemberDefinition'] == null
        ? null
        : CognitoMemberDefinition.fromJson(
            json['CognitoMemberDefinition'] as Map<String, dynamic>),
    oidcMemberDefinition: json['OidcMemberDefinition'] == null
        ? null
        : OidcMemberDefinition.fromJson(
            json['OidcMemberDefinition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MemberDefinitionToJson(MemberDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CognitoMemberDefinition', instance.cognitoMemberDefinition?.toJson());
  writeNotNull('OidcMemberDefinition', instance.oidcMemberDefinition?.toJson());
  return val;
}

MetadataProperties _$MetadataPropertiesFromJson(Map<String, dynamic> json) {
  return MetadataProperties(
    commitId: json['CommitId'] as String?,
    generatedBy: json['GeneratedBy'] as String?,
    projectId: json['ProjectId'] as String?,
    repository: json['Repository'] as String?,
  );
}

Map<String, dynamic> _$MetadataPropertiesToJson(MetadataProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CommitId', instance.commitId);
  writeNotNull('GeneratedBy', instance.generatedBy);
  writeNotNull('ProjectId', instance.projectId);
  writeNotNull('Repository', instance.repository);
  return val;
}

MetricData _$MetricDataFromJson(Map<String, dynamic> json) {
  return MetricData(
    metricName: json['MetricName'] as String?,
    timestamp: const UnixDateTimeConverter().fromJson(json['Timestamp']),
    value: (json['Value'] as num?)?.toDouble(),
  );
}

MetricDefinition _$MetricDefinitionFromJson(Map<String, dynamic> json) {
  return MetricDefinition(
    name: json['Name'] as String,
    regex: json['Regex'] as String,
  );
}

Map<String, dynamic> _$MetricDefinitionToJson(MetricDefinition instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Regex': instance.regex,
    };

MetricsSource _$MetricsSourceFromJson(Map<String, dynamic> json) {
  return MetricsSource(
    contentType: json['ContentType'] as String,
    s3Uri: json['S3Uri'] as String,
    contentDigest: json['ContentDigest'] as String?,
  );
}

Map<String, dynamic> _$MetricsSourceToJson(MetricsSource instance) {
  final val = <String, dynamic>{
    'ContentType': instance.contentType,
    'S3Uri': instance.s3Uri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContentDigest', instance.contentDigest);
  return val;
}

ModelArtifacts _$ModelArtifactsFromJson(Map<String, dynamic> json) {
  return ModelArtifacts(
    s3ModelArtifacts: json['S3ModelArtifacts'] as String,
  );
}

ModelBiasAppSpecification _$ModelBiasAppSpecificationFromJson(
    Map<String, dynamic> json) {
  return ModelBiasAppSpecification(
    configUri: json['ConfigUri'] as String,
    imageUri: json['ImageUri'] as String,
    environment: (json['Environment'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ModelBiasAppSpecificationToJson(
    ModelBiasAppSpecification instance) {
  final val = <String, dynamic>{
    'ConfigUri': instance.configUri,
    'ImageUri': instance.imageUri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Environment', instance.environment);
  return val;
}

ModelBiasBaselineConfig _$ModelBiasBaselineConfigFromJson(
    Map<String, dynamic> json) {
  return ModelBiasBaselineConfig(
    baseliningJobName: json['BaseliningJobName'] as String?,
    constraintsResource: json['ConstraintsResource'] == null
        ? null
        : MonitoringConstraintsResource.fromJson(
            json['ConstraintsResource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelBiasBaselineConfigToJson(
    ModelBiasBaselineConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaseliningJobName', instance.baseliningJobName);
  writeNotNull('ConstraintsResource', instance.constraintsResource?.toJson());
  return val;
}

ModelBiasJobInput _$ModelBiasJobInputFromJson(Map<String, dynamic> json) {
  return ModelBiasJobInput(
    endpointInput:
        EndpointInput.fromJson(json['EndpointInput'] as Map<String, dynamic>),
    groundTruthS3Input: MonitoringGroundTruthS3Input.fromJson(
        json['GroundTruthS3Input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelBiasJobInputToJson(ModelBiasJobInput instance) =>
    <String, dynamic>{
      'EndpointInput': instance.endpointInput.toJson(),
      'GroundTruthS3Input': instance.groundTruthS3Input.toJson(),
    };

ModelClientConfig _$ModelClientConfigFromJson(Map<String, dynamic> json) {
  return ModelClientConfig(
    invocationsMaxRetries: json['InvocationsMaxRetries'] as int?,
    invocationsTimeoutInSeconds: json['InvocationsTimeoutInSeconds'] as int?,
  );
}

Map<String, dynamic> _$ModelClientConfigToJson(ModelClientConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InvocationsMaxRetries', instance.invocationsMaxRetries);
  writeNotNull(
      'InvocationsTimeoutInSeconds', instance.invocationsTimeoutInSeconds);
  return val;
}

ModelDataQuality _$ModelDataQualityFromJson(Map<String, dynamic> json) {
  return ModelDataQuality(
    constraints: json['Constraints'] == null
        ? null
        : MetricsSource.fromJson(json['Constraints'] as Map<String, dynamic>),
    statistics: json['Statistics'] == null
        ? null
        : MetricsSource.fromJson(json['Statistics'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelDataQualityToJson(ModelDataQuality instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Constraints', instance.constraints?.toJson());
  writeNotNull('Statistics', instance.statistics?.toJson());
  return val;
}

ModelDigests _$ModelDigestsFromJson(Map<String, dynamic> json) {
  return ModelDigests(
    artifactDigest: json['ArtifactDigest'] as String?,
  );
}

ModelExplainabilityAppSpecification
    _$ModelExplainabilityAppSpecificationFromJson(Map<String, dynamic> json) {
  return ModelExplainabilityAppSpecification(
    configUri: json['ConfigUri'] as String,
    imageUri: json['ImageUri'] as String,
    environment: (json['Environment'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ModelExplainabilityAppSpecificationToJson(
    ModelExplainabilityAppSpecification instance) {
  final val = <String, dynamic>{
    'ConfigUri': instance.configUri,
    'ImageUri': instance.imageUri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Environment', instance.environment);
  return val;
}

ModelExplainabilityBaselineConfig _$ModelExplainabilityBaselineConfigFromJson(
    Map<String, dynamic> json) {
  return ModelExplainabilityBaselineConfig(
    baseliningJobName: json['BaseliningJobName'] as String?,
    constraintsResource: json['ConstraintsResource'] == null
        ? null
        : MonitoringConstraintsResource.fromJson(
            json['ConstraintsResource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelExplainabilityBaselineConfigToJson(
    ModelExplainabilityBaselineConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaseliningJobName', instance.baseliningJobName);
  writeNotNull('ConstraintsResource', instance.constraintsResource?.toJson());
  return val;
}

ModelExplainabilityJobInput _$ModelExplainabilityJobInputFromJson(
    Map<String, dynamic> json) {
  return ModelExplainabilityJobInput(
    endpointInput:
        EndpointInput.fromJson(json['EndpointInput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelExplainabilityJobInputToJson(
        ModelExplainabilityJobInput instance) =>
    <String, dynamic>{
      'EndpointInput': instance.endpointInput.toJson(),
    };

ModelMetrics _$ModelMetricsFromJson(Map<String, dynamic> json) {
  return ModelMetrics(
    bias: json['Bias'] == null
        ? null
        : Bias.fromJson(json['Bias'] as Map<String, dynamic>),
    explainability: json['Explainability'] == null
        ? null
        : Explainability.fromJson(
            json['Explainability'] as Map<String, dynamic>),
    modelDataQuality: json['ModelDataQuality'] == null
        ? null
        : ModelDataQuality.fromJson(
            json['ModelDataQuality'] as Map<String, dynamic>),
    modelQuality: json['ModelQuality'] == null
        ? null
        : ModelQuality.fromJson(json['ModelQuality'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelMetricsToJson(ModelMetrics instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bias', instance.bias?.toJson());
  writeNotNull('Explainability', instance.explainability?.toJson());
  writeNotNull('ModelDataQuality', instance.modelDataQuality?.toJson());
  writeNotNull('ModelQuality', instance.modelQuality?.toJson());
  return val;
}

ModelPackage _$ModelPackageFromJson(Map<String, dynamic> json) {
  return ModelPackage(
    approvalDescription: json['ApprovalDescription'] as String?,
    certifyForMarketplace: json['CertifyForMarketplace'] as bool?,
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    inferenceSpecification: json['InferenceSpecification'] == null
        ? null
        : InferenceSpecification.fromJson(
            json['InferenceSpecification'] as Map<String, dynamic>),
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    metadataProperties: json['MetadataProperties'] == null
        ? null
        : MetadataProperties.fromJson(
            json['MetadataProperties'] as Map<String, dynamic>),
    modelApprovalStatus: _$enumDecodeNullable(
        _$ModelApprovalStatusEnumMap, json['ModelApprovalStatus']),
    modelMetrics: json['ModelMetrics'] == null
        ? null
        : ModelMetrics.fromJson(json['ModelMetrics'] as Map<String, dynamic>),
    modelPackageArn: json['ModelPackageArn'] as String?,
    modelPackageDescription: json['ModelPackageDescription'] as String?,
    modelPackageGroupName: json['ModelPackageGroupName'] as String?,
    modelPackageName: json['ModelPackageName'] as String?,
    modelPackageStatus: _$enumDecodeNullable(
        _$ModelPackageStatusEnumMap, json['ModelPackageStatus']),
    modelPackageStatusDetails: json['ModelPackageStatusDetails'] == null
        ? null
        : ModelPackageStatusDetails.fromJson(
            json['ModelPackageStatusDetails'] as Map<String, dynamic>),
    modelPackageVersion: json['ModelPackageVersion'] as int?,
    sourceAlgorithmSpecification: json['SourceAlgorithmSpecification'] == null
        ? null
        : SourceAlgorithmSpecification.fromJson(
            json['SourceAlgorithmSpecification'] as Map<String, dynamic>),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    validationSpecification: json['ValidationSpecification'] == null
        ? null
        : ModelPackageValidationSpecification.fromJson(
            json['ValidationSpecification'] as Map<String, dynamic>),
  );
}

ModelPackageContainerDefinition _$ModelPackageContainerDefinitionFromJson(
    Map<String, dynamic> json) {
  return ModelPackageContainerDefinition(
    image: json['Image'] as String,
    containerHostname: json['ContainerHostname'] as String?,
    imageDigest: json['ImageDigest'] as String?,
    modelDataUrl: json['ModelDataUrl'] as String?,
    productId: json['ProductId'] as String?,
  );
}

Map<String, dynamic> _$ModelPackageContainerDefinitionToJson(
    ModelPackageContainerDefinition instance) {
  final val = <String, dynamic>{
    'Image': instance.image,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerHostname', instance.containerHostname);
  writeNotNull('ImageDigest', instance.imageDigest);
  writeNotNull('ModelDataUrl', instance.modelDataUrl);
  writeNotNull('ProductId', instance.productId);
  return val;
}

ModelPackageGroup _$ModelPackageGroupFromJson(Map<String, dynamic> json) {
  return ModelPackageGroup(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    modelPackageGroupArn: json['ModelPackageGroupArn'] as String?,
    modelPackageGroupDescription:
        json['ModelPackageGroupDescription'] as String?,
    modelPackageGroupName: json['ModelPackageGroupName'] as String?,
    modelPackageGroupStatus: _$enumDecodeNullable(
        _$ModelPackageGroupStatusEnumMap, json['ModelPackageGroupStatus']),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ModelPackageGroupSummary _$ModelPackageGroupSummaryFromJson(
    Map<String, dynamic> json) {
  return ModelPackageGroupSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    modelPackageGroupArn: json['ModelPackageGroupArn'] as String,
    modelPackageGroupName: json['ModelPackageGroupName'] as String,
    modelPackageGroupStatus: _$enumDecode(
        _$ModelPackageGroupStatusEnumMap, json['ModelPackageGroupStatus']),
    modelPackageGroupDescription:
        json['ModelPackageGroupDescription'] as String?,
  );
}

ModelPackageStatusDetails _$ModelPackageStatusDetailsFromJson(
    Map<String, dynamic> json) {
  return ModelPackageStatusDetails(
    validationStatuses: (json['ValidationStatuses'] as List<dynamic>)
        .map((e) => ModelPackageStatusItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    imageScanStatuses: (json['ImageScanStatuses'] as List<dynamic>?)
        ?.map((e) => ModelPackageStatusItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ModelPackageStatusItem _$ModelPackageStatusItemFromJson(
    Map<String, dynamic> json) {
  return ModelPackageStatusItem(
    name: json['Name'] as String,
    status: _$enumDecode(_$DetailedModelPackageStatusEnumMap, json['Status']),
    failureReason: json['FailureReason'] as String?,
  );
}

const _$DetailedModelPackageStatusEnumMap = {
  DetailedModelPackageStatus.notStarted: 'NotStarted',
  DetailedModelPackageStatus.inProgress: 'InProgress',
  DetailedModelPackageStatus.completed: 'Completed',
  DetailedModelPackageStatus.failed: 'Failed',
};

ModelPackageSummary _$ModelPackageSummaryFromJson(Map<String, dynamic> json) {
  return ModelPackageSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    modelPackageArn: json['ModelPackageArn'] as String,
    modelPackageName: json['ModelPackageName'] as String,
    modelPackageStatus:
        _$enumDecode(_$ModelPackageStatusEnumMap, json['ModelPackageStatus']),
    modelApprovalStatus: _$enumDecodeNullable(
        _$ModelApprovalStatusEnumMap, json['ModelApprovalStatus']),
    modelPackageDescription: json['ModelPackageDescription'] as String?,
    modelPackageGroupName: json['ModelPackageGroupName'] as String?,
    modelPackageVersion: json['ModelPackageVersion'] as int?,
  );
}

ModelPackageValidationProfile _$ModelPackageValidationProfileFromJson(
    Map<String, dynamic> json) {
  return ModelPackageValidationProfile(
    profileName: json['ProfileName'] as String,
    transformJobDefinition: TransformJobDefinition.fromJson(
        json['TransformJobDefinition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelPackageValidationProfileToJson(
        ModelPackageValidationProfile instance) =>
    <String, dynamic>{
      'ProfileName': instance.profileName,
      'TransformJobDefinition': instance.transformJobDefinition.toJson(),
    };

ModelPackageValidationSpecification
    _$ModelPackageValidationSpecificationFromJson(Map<String, dynamic> json) {
  return ModelPackageValidationSpecification(
    validationProfiles: (json['ValidationProfiles'] as List<dynamic>)
        .map((e) =>
            ModelPackageValidationProfile.fromJson(e as Map<String, dynamic>))
        .toList(),
    validationRole: json['ValidationRole'] as String,
  );
}

Map<String, dynamic> _$ModelPackageValidationSpecificationToJson(
        ModelPackageValidationSpecification instance) =>
    <String, dynamic>{
      'ValidationProfiles':
          instance.validationProfiles.map((e) => e.toJson()).toList(),
      'ValidationRole': instance.validationRole,
    };

ModelQuality _$ModelQualityFromJson(Map<String, dynamic> json) {
  return ModelQuality(
    constraints: json['Constraints'] == null
        ? null
        : MetricsSource.fromJson(json['Constraints'] as Map<String, dynamic>),
    statistics: json['Statistics'] == null
        ? null
        : MetricsSource.fromJson(json['Statistics'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelQualityToJson(ModelQuality instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Constraints', instance.constraints?.toJson());
  writeNotNull('Statistics', instance.statistics?.toJson());
  return val;
}

ModelQualityAppSpecification _$ModelQualityAppSpecificationFromJson(
    Map<String, dynamic> json) {
  return ModelQualityAppSpecification(
    imageUri: json['ImageUri'] as String,
    containerArguments: (json['ContainerArguments'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    containerEntrypoint: (json['ContainerEntrypoint'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    environment: (json['Environment'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    postAnalyticsProcessorSourceUri:
        json['PostAnalyticsProcessorSourceUri'] as String?,
    problemType: _$enumDecodeNullable(
        _$MonitoringProblemTypeEnumMap, json['ProblemType']),
    recordPreprocessorSourceUri: json['RecordPreprocessorSourceUri'] as String?,
  );
}

Map<String, dynamic> _$ModelQualityAppSpecificationToJson(
    ModelQualityAppSpecification instance) {
  final val = <String, dynamic>{
    'ImageUri': instance.imageUri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerArguments', instance.containerArguments);
  writeNotNull('ContainerEntrypoint', instance.containerEntrypoint);
  writeNotNull('Environment', instance.environment);
  writeNotNull('PostAnalyticsProcessorSourceUri',
      instance.postAnalyticsProcessorSourceUri);
  writeNotNull(
      'ProblemType', _$MonitoringProblemTypeEnumMap[instance.problemType]);
  writeNotNull(
      'RecordPreprocessorSourceUri', instance.recordPreprocessorSourceUri);
  return val;
}

const _$MonitoringProblemTypeEnumMap = {
  MonitoringProblemType.binaryClassification: 'BinaryClassification',
  MonitoringProblemType.multiclassClassification: 'MulticlassClassification',
  MonitoringProblemType.regression: 'Regression',
};

ModelQualityBaselineConfig _$ModelQualityBaselineConfigFromJson(
    Map<String, dynamic> json) {
  return ModelQualityBaselineConfig(
    baseliningJobName: json['BaseliningJobName'] as String?,
    constraintsResource: json['ConstraintsResource'] == null
        ? null
        : MonitoringConstraintsResource.fromJson(
            json['ConstraintsResource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelQualityBaselineConfigToJson(
    ModelQualityBaselineConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaseliningJobName', instance.baseliningJobName);
  writeNotNull('ConstraintsResource', instance.constraintsResource?.toJson());
  return val;
}

ModelQualityJobInput _$ModelQualityJobInputFromJson(Map<String, dynamic> json) {
  return ModelQualityJobInput(
    endpointInput:
        EndpointInput.fromJson(json['EndpointInput'] as Map<String, dynamic>),
    groundTruthS3Input: MonitoringGroundTruthS3Input.fromJson(
        json['GroundTruthS3Input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelQualityJobInputToJson(
        ModelQualityJobInput instance) =>
    <String, dynamic>{
      'EndpointInput': instance.endpointInput.toJson(),
      'GroundTruthS3Input': instance.groundTruthS3Input.toJson(),
    };

ModelStepMetadata _$ModelStepMetadataFromJson(Map<String, dynamic> json) {
  return ModelStepMetadata(
    arn: json['Arn'] as String?,
  );
}

ModelSummary _$ModelSummaryFromJson(Map<String, dynamic> json) {
  return ModelSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    modelArn: json['ModelArn'] as String,
    modelName: json['ModelName'] as String,
  );
}

MonitoringAppSpecification _$MonitoringAppSpecificationFromJson(
    Map<String, dynamic> json) {
  return MonitoringAppSpecification(
    imageUri: json['ImageUri'] as String,
    containerArguments: (json['ContainerArguments'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    containerEntrypoint: (json['ContainerEntrypoint'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    postAnalyticsProcessorSourceUri:
        json['PostAnalyticsProcessorSourceUri'] as String?,
    recordPreprocessorSourceUri: json['RecordPreprocessorSourceUri'] as String?,
  );
}

Map<String, dynamic> _$MonitoringAppSpecificationToJson(
    MonitoringAppSpecification instance) {
  final val = <String, dynamic>{
    'ImageUri': instance.imageUri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ContainerArguments', instance.containerArguments);
  writeNotNull('ContainerEntrypoint', instance.containerEntrypoint);
  writeNotNull('PostAnalyticsProcessorSourceUri',
      instance.postAnalyticsProcessorSourceUri);
  writeNotNull(
      'RecordPreprocessorSourceUri', instance.recordPreprocessorSourceUri);
  return val;
}

MonitoringBaselineConfig _$MonitoringBaselineConfigFromJson(
    Map<String, dynamic> json) {
  return MonitoringBaselineConfig(
    baseliningJobName: json['BaseliningJobName'] as String?,
    constraintsResource: json['ConstraintsResource'] == null
        ? null
        : MonitoringConstraintsResource.fromJson(
            json['ConstraintsResource'] as Map<String, dynamic>),
    statisticsResource: json['StatisticsResource'] == null
        ? null
        : MonitoringStatisticsResource.fromJson(
            json['StatisticsResource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MonitoringBaselineConfigToJson(
    MonitoringBaselineConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaseliningJobName', instance.baseliningJobName);
  writeNotNull('ConstraintsResource', instance.constraintsResource?.toJson());
  writeNotNull('StatisticsResource', instance.statisticsResource?.toJson());
  return val;
}

MonitoringClusterConfig _$MonitoringClusterConfigFromJson(
    Map<String, dynamic> json) {
  return MonitoringClusterConfig(
    instanceCount: json['InstanceCount'] as int,
    instanceType:
        _$enumDecode(_$ProcessingInstanceTypeEnumMap, json['InstanceType']),
    volumeSizeInGB: json['VolumeSizeInGB'] as int,
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$MonitoringClusterConfigToJson(
    MonitoringClusterConfig instance) {
  final val = <String, dynamic>{
    'InstanceCount': instance.instanceCount,
    'InstanceType': _$ProcessingInstanceTypeEnumMap[instance.instanceType],
    'VolumeSizeInGB': instance.volumeSizeInGB,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumeKmsKeyId', instance.volumeKmsKeyId);
  return val;
}

MonitoringConstraintsResource _$MonitoringConstraintsResourceFromJson(
    Map<String, dynamic> json) {
  return MonitoringConstraintsResource(
    s3Uri: json['S3Uri'] as String?,
  );
}

Map<String, dynamic> _$MonitoringConstraintsResourceToJson(
    MonitoringConstraintsResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

MonitoringExecutionSummary _$MonitoringExecutionSummaryFromJson(
    Map<String, dynamic> json) {
  return MonitoringExecutionSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    monitoringExecutionStatus: _$enumDecode(
        _$ExecutionStatusEnumMap, json['MonitoringExecutionStatus']),
    monitoringScheduleName: json['MonitoringScheduleName'] as String,
    scheduledTime: DateTime.parse(json['ScheduledTime'] as String),
    endpointName: json['EndpointName'] as String?,
    failureReason: json['FailureReason'] as String?,
    monitoringJobDefinitionName: json['MonitoringJobDefinitionName'] as String?,
    monitoringType:
        _$enumDecodeNullable(_$MonitoringTypeEnumMap, json['MonitoringType']),
    processingJobArn: json['ProcessingJobArn'] as String?,
  );
}

const _$ExecutionStatusEnumMap = {
  ExecutionStatus.pending: 'Pending',
  ExecutionStatus.completed: 'Completed',
  ExecutionStatus.completedWithViolations: 'CompletedWithViolations',
  ExecutionStatus.inProgress: 'InProgress',
  ExecutionStatus.failed: 'Failed',
  ExecutionStatus.stopping: 'Stopping',
  ExecutionStatus.stopped: 'Stopped',
};

MonitoringGroundTruthS3Input _$MonitoringGroundTruthS3InputFromJson(
    Map<String, dynamic> json) {
  return MonitoringGroundTruthS3Input(
    s3Uri: json['S3Uri'] as String?,
  );
}

Map<String, dynamic> _$MonitoringGroundTruthS3InputToJson(
    MonitoringGroundTruthS3Input instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

MonitoringInput _$MonitoringInputFromJson(Map<String, dynamic> json) {
  return MonitoringInput(
    endpointInput:
        EndpointInput.fromJson(json['EndpointInput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MonitoringInputToJson(MonitoringInput instance) =>
    <String, dynamic>{
      'EndpointInput': instance.endpointInput.toJson(),
    };

MonitoringJobDefinition _$MonitoringJobDefinitionFromJson(
    Map<String, dynamic> json) {
  return MonitoringJobDefinition(
    monitoringAppSpecification: MonitoringAppSpecification.fromJson(
        json['MonitoringAppSpecification'] as Map<String, dynamic>),
    monitoringInputs: (json['MonitoringInputs'] as List<dynamic>)
        .map((e) => MonitoringInput.fromJson(e as Map<String, dynamic>))
        .toList(),
    monitoringOutputConfig: MonitoringOutputConfig.fromJson(
        json['MonitoringOutputConfig'] as Map<String, dynamic>),
    monitoringResources: MonitoringResources.fromJson(
        json['MonitoringResources'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    baselineConfig: json['BaselineConfig'] == null
        ? null
        : MonitoringBaselineConfig.fromJson(
            json['BaselineConfig'] as Map<String, dynamic>),
    environment: (json['Environment'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    networkConfig: json['NetworkConfig'] == null
        ? null
        : NetworkConfig.fromJson(json['NetworkConfig'] as Map<String, dynamic>),
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : MonitoringStoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MonitoringJobDefinitionToJson(
    MonitoringJobDefinition instance) {
  final val = <String, dynamic>{
    'MonitoringAppSpecification': instance.monitoringAppSpecification.toJson(),
    'MonitoringInputs':
        instance.monitoringInputs.map((e) => e.toJson()).toList(),
    'MonitoringOutputConfig': instance.monitoringOutputConfig.toJson(),
    'MonitoringResources': instance.monitoringResources.toJson(),
    'RoleArn': instance.roleArn,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaselineConfig', instance.baselineConfig?.toJson());
  writeNotNull('Environment', instance.environment);
  writeNotNull('NetworkConfig', instance.networkConfig?.toJson());
  writeNotNull('StoppingCondition', instance.stoppingCondition?.toJson());
  return val;
}

MonitoringJobDefinitionSummary _$MonitoringJobDefinitionSummaryFromJson(
    Map<String, dynamic> json) {
  return MonitoringJobDefinitionSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    endpointName: json['EndpointName'] as String,
    monitoringJobDefinitionArn: json['MonitoringJobDefinitionArn'] as String,
    monitoringJobDefinitionName: json['MonitoringJobDefinitionName'] as String,
  );
}

MonitoringNetworkConfig _$MonitoringNetworkConfigFromJson(
    Map<String, dynamic> json) {
  return MonitoringNetworkConfig(
    enableInterContainerTrafficEncryption:
        json['EnableInterContainerTrafficEncryption'] as bool?,
    enableNetworkIsolation: json['EnableNetworkIsolation'] as bool?,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MonitoringNetworkConfigToJson(
    MonitoringNetworkConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EnableInterContainerTrafficEncryption',
      instance.enableInterContainerTrafficEncryption);
  writeNotNull('EnableNetworkIsolation', instance.enableNetworkIsolation);
  writeNotNull('VpcConfig', instance.vpcConfig?.toJson());
  return val;
}

MonitoringOutput _$MonitoringOutputFromJson(Map<String, dynamic> json) {
  return MonitoringOutput(
    s3Output:
        MonitoringS3Output.fromJson(json['S3Output'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MonitoringOutputToJson(MonitoringOutput instance) =>
    <String, dynamic>{
      'S3Output': instance.s3Output.toJson(),
    };

MonitoringOutputConfig _$MonitoringOutputConfigFromJson(
    Map<String, dynamic> json) {
  return MonitoringOutputConfig(
    monitoringOutputs: (json['MonitoringOutputs'] as List<dynamic>)
        .map((e) => MonitoringOutput.fromJson(e as Map<String, dynamic>))
        .toList(),
    kmsKeyId: json['KmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$MonitoringOutputConfigToJson(
    MonitoringOutputConfig instance) {
  final val = <String, dynamic>{
    'MonitoringOutputs':
        instance.monitoringOutputs.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

MonitoringResources _$MonitoringResourcesFromJson(Map<String, dynamic> json) {
  return MonitoringResources(
    clusterConfig: MonitoringClusterConfig.fromJson(
        json['ClusterConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MonitoringResourcesToJson(
        MonitoringResources instance) =>
    <String, dynamic>{
      'ClusterConfig': instance.clusterConfig.toJson(),
    };

MonitoringS3Output _$MonitoringS3OutputFromJson(Map<String, dynamic> json) {
  return MonitoringS3Output(
    localPath: json['LocalPath'] as String,
    s3Uri: json['S3Uri'] as String,
    s3UploadMode: _$enumDecodeNullable(
        _$ProcessingS3UploadModeEnumMap, json['S3UploadMode']),
  );
}

Map<String, dynamic> _$MonitoringS3OutputToJson(MonitoringS3Output instance) {
  final val = <String, dynamic>{
    'LocalPath': instance.localPath,
    'S3Uri': instance.s3Uri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'S3UploadMode', _$ProcessingS3UploadModeEnumMap[instance.s3UploadMode]);
  return val;
}

const _$ProcessingS3UploadModeEnumMap = {
  ProcessingS3UploadMode.continuous: 'Continuous',
  ProcessingS3UploadMode.endOfJob: 'EndOfJob',
};

MonitoringSchedule _$MonitoringScheduleFromJson(Map<String, dynamic> json) {
  return MonitoringSchedule(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    endpointName: json['EndpointName'] as String?,
    failureReason: json['FailureReason'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    lastMonitoringExecutionSummary:
        json['LastMonitoringExecutionSummary'] == null
            ? null
            : MonitoringExecutionSummary.fromJson(
                json['LastMonitoringExecutionSummary'] as Map<String, dynamic>),
    monitoringScheduleArn: json['MonitoringScheduleArn'] as String?,
    monitoringScheduleConfig: json['MonitoringScheduleConfig'] == null
        ? null
        : MonitoringScheduleConfig.fromJson(
            json['MonitoringScheduleConfig'] as Map<String, dynamic>),
    monitoringScheduleName: json['MonitoringScheduleName'] as String?,
    monitoringScheduleStatus: _$enumDecodeNullable(
        _$ScheduleStatusEnumMap, json['MonitoringScheduleStatus']),
    monitoringType:
        _$enumDecodeNullable(_$MonitoringTypeEnumMap, json['MonitoringType']),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

MonitoringScheduleConfig _$MonitoringScheduleConfigFromJson(
    Map<String, dynamic> json) {
  return MonitoringScheduleConfig(
    monitoringJobDefinition: json['MonitoringJobDefinition'] == null
        ? null
        : MonitoringJobDefinition.fromJson(
            json['MonitoringJobDefinition'] as Map<String, dynamic>),
    monitoringJobDefinitionName: json['MonitoringJobDefinitionName'] as String?,
    monitoringType:
        _$enumDecodeNullable(_$MonitoringTypeEnumMap, json['MonitoringType']),
    scheduleConfig: json['ScheduleConfig'] == null
        ? null
        : ScheduleConfig.fromJson(
            json['ScheduleConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MonitoringScheduleConfigToJson(
    MonitoringScheduleConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'MonitoringJobDefinition', instance.monitoringJobDefinition?.toJson());
  writeNotNull(
      'MonitoringJobDefinitionName', instance.monitoringJobDefinitionName);
  writeNotNull(
      'MonitoringType', _$MonitoringTypeEnumMap[instance.monitoringType]);
  writeNotNull('ScheduleConfig', instance.scheduleConfig?.toJson());
  return val;
}

MonitoringScheduleSummary _$MonitoringScheduleSummaryFromJson(
    Map<String, dynamic> json) {
  return MonitoringScheduleSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    lastModifiedTime: DateTime.parse(json['LastModifiedTime'] as String),
    monitoringScheduleArn: json['MonitoringScheduleArn'] as String,
    monitoringScheduleName: json['MonitoringScheduleName'] as String,
    monitoringScheduleStatus:
        _$enumDecode(_$ScheduleStatusEnumMap, json['MonitoringScheduleStatus']),
    endpointName: json['EndpointName'] as String?,
    monitoringJobDefinitionName: json['MonitoringJobDefinitionName'] as String?,
    monitoringType:
        _$enumDecodeNullable(_$MonitoringTypeEnumMap, json['MonitoringType']),
  );
}

MonitoringStatisticsResource _$MonitoringStatisticsResourceFromJson(
    Map<String, dynamic> json) {
  return MonitoringStatisticsResource(
    s3Uri: json['S3Uri'] as String?,
  );
}

Map<String, dynamic> _$MonitoringStatisticsResourceToJson(
    MonitoringStatisticsResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

MonitoringStoppingCondition _$MonitoringStoppingConditionFromJson(
    Map<String, dynamic> json) {
  return MonitoringStoppingCondition(
    maxRuntimeInSeconds: json['MaxRuntimeInSeconds'] as int,
  );
}

Map<String, dynamic> _$MonitoringStoppingConditionToJson(
        MonitoringStoppingCondition instance) =>
    <String, dynamic>{
      'MaxRuntimeInSeconds': instance.maxRuntimeInSeconds,
    };

Map<String, dynamic> _$NestedFiltersToJson(NestedFilters instance) =>
    <String, dynamic>{
      'Filters': instance.filters.map((e) => e.toJson()).toList(),
      'NestedPropertyName': instance.nestedPropertyName,
    };

NetworkConfig _$NetworkConfigFromJson(Map<String, dynamic> json) {
  return NetworkConfig(
    enableInterContainerTrafficEncryption:
        json['EnableInterContainerTrafficEncryption'] as bool?,
    enableNetworkIsolation: json['EnableNetworkIsolation'] as bool?,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NetworkConfigToJson(NetworkConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EnableInterContainerTrafficEncryption',
      instance.enableInterContainerTrafficEncryption);
  writeNotNull('EnableNetworkIsolation', instance.enableNetworkIsolation);
  writeNotNull('VpcConfig', instance.vpcConfig?.toJson());
  return val;
}

NotebookInstanceLifecycleConfigSummary
    _$NotebookInstanceLifecycleConfigSummaryFromJson(
        Map<String, dynamic> json) {
  return NotebookInstanceLifecycleConfigSummary(
    notebookInstanceLifecycleConfigArn:
        json['NotebookInstanceLifecycleConfigArn'] as String,
    notebookInstanceLifecycleConfigName:
        json['NotebookInstanceLifecycleConfigName'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
  );
}

NotebookInstanceLifecycleHook _$NotebookInstanceLifecycleHookFromJson(
    Map<String, dynamic> json) {
  return NotebookInstanceLifecycleHook(
    content: json['Content'] as String?,
  );
}

Map<String, dynamic> _$NotebookInstanceLifecycleHookToJson(
    NotebookInstanceLifecycleHook instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Content', instance.content);
  return val;
}

NotebookInstanceSummary _$NotebookInstanceSummaryFromJson(
    Map<String, dynamic> json) {
  return NotebookInstanceSummary(
    notebookInstanceArn: json['NotebookInstanceArn'] as String,
    notebookInstanceName: json['NotebookInstanceName'] as String,
    additionalCodeRepositories:
        (json['AdditionalCodeRepositories'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    defaultCodeRepository: json['DefaultCodeRepository'] as String?,
    instanceType:
        _$enumDecodeNullable(_$InstanceTypeEnumMap, json['InstanceType']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    notebookInstanceLifecycleConfigName:
        json['NotebookInstanceLifecycleConfigName'] as String?,
    notebookInstanceStatus: _$enumDecodeNullable(
        _$NotebookInstanceStatusEnumMap, json['NotebookInstanceStatus']),
    url: json['Url'] as String?,
  );
}

NotificationConfiguration _$NotificationConfigurationFromJson(
    Map<String, dynamic> json) {
  return NotificationConfiguration(
    notificationTopicArn: json['NotificationTopicArn'] as String?,
  );
}

Map<String, dynamic> _$NotificationConfigurationToJson(
    NotificationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NotificationTopicArn', instance.notificationTopicArn);
  return val;
}

ObjectiveStatusCounters _$ObjectiveStatusCountersFromJson(
    Map<String, dynamic> json) {
  return ObjectiveStatusCounters(
    failed: json['Failed'] as int?,
    pending: json['Pending'] as int?,
    succeeded: json['Succeeded'] as int?,
  );
}

OfflineStoreConfig _$OfflineStoreConfigFromJson(Map<String, dynamic> json) {
  return OfflineStoreConfig(
    s3StorageConfig: S3StorageConfig.fromJson(
        json['S3StorageConfig'] as Map<String, dynamic>),
    dataCatalogConfig: json['DataCatalogConfig'] == null
        ? null
        : DataCatalogConfig.fromJson(
            json['DataCatalogConfig'] as Map<String, dynamic>),
    disableGlueTableCreation: json['DisableGlueTableCreation'] as bool?,
  );
}

Map<String, dynamic> _$OfflineStoreConfigToJson(OfflineStoreConfig instance) {
  final val = <String, dynamic>{
    'S3StorageConfig': instance.s3StorageConfig.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataCatalogConfig', instance.dataCatalogConfig?.toJson());
  writeNotNull('DisableGlueTableCreation', instance.disableGlueTableCreation);
  return val;
}

OfflineStoreStatus _$OfflineStoreStatusFromJson(Map<String, dynamic> json) {
  return OfflineStoreStatus(
    status: _$enumDecode(_$OfflineStoreStatusValueEnumMap, json['Status']),
    blockedReason: json['BlockedReason'] as String?,
  );
}

const _$OfflineStoreStatusValueEnumMap = {
  OfflineStoreStatusValue.active: 'Active',
  OfflineStoreStatusValue.blocked: 'Blocked',
  OfflineStoreStatusValue.disabled: 'Disabled',
};

Map<String, dynamic> _$OidcConfigToJson(OidcConfig instance) =>
    <String, dynamic>{
      'AuthorizationEndpoint': instance.authorizationEndpoint,
      'ClientId': instance.clientId,
      'ClientSecret': instance.clientSecret,
      'Issuer': instance.issuer,
      'JwksUri': instance.jwksUri,
      'LogoutEndpoint': instance.logoutEndpoint,
      'TokenEndpoint': instance.tokenEndpoint,
      'UserInfoEndpoint': instance.userInfoEndpoint,
    };

OidcConfigForResponse _$OidcConfigForResponseFromJson(
    Map<String, dynamic> json) {
  return OidcConfigForResponse(
    authorizationEndpoint: json['AuthorizationEndpoint'] as String?,
    clientId: json['ClientId'] as String?,
    issuer: json['Issuer'] as String?,
    jwksUri: json['JwksUri'] as String?,
    logoutEndpoint: json['LogoutEndpoint'] as String?,
    tokenEndpoint: json['TokenEndpoint'] as String?,
    userInfoEndpoint: json['UserInfoEndpoint'] as String?,
  );
}

OidcMemberDefinition _$OidcMemberDefinitionFromJson(Map<String, dynamic> json) {
  return OidcMemberDefinition(
    groups: (json['Groups'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$OidcMemberDefinitionToJson(
        OidcMemberDefinition instance) =>
    <String, dynamic>{
      'Groups': instance.groups,
    };

OnlineStoreConfig _$OnlineStoreConfigFromJson(Map<String, dynamic> json) {
  return OnlineStoreConfig(
    enableOnlineStore: json['EnableOnlineStore'] as bool?,
    securityConfig: json['SecurityConfig'] == null
        ? null
        : OnlineStoreSecurityConfig.fromJson(
            json['SecurityConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OnlineStoreConfigToJson(OnlineStoreConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EnableOnlineStore', instance.enableOnlineStore);
  writeNotNull('SecurityConfig', instance.securityConfig?.toJson());
  return val;
}

OnlineStoreSecurityConfig _$OnlineStoreSecurityConfigFromJson(
    Map<String, dynamic> json) {
  return OnlineStoreSecurityConfig(
    kmsKeyId: json['KmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$OnlineStoreSecurityConfigToJson(
    OnlineStoreSecurityConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

OutputConfig _$OutputConfigFromJson(Map<String, dynamic> json) {
  return OutputConfig(
    s3OutputLocation: json['S3OutputLocation'] as String,
    compilerOptions: json['CompilerOptions'] as String?,
    kmsKeyId: json['KmsKeyId'] as String?,
    targetDevice:
        _$enumDecodeNullable(_$TargetDeviceEnumMap, json['TargetDevice']),
    targetPlatform: json['TargetPlatform'] == null
        ? null
        : TargetPlatform.fromJson(
            json['TargetPlatform'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OutputConfigToJson(OutputConfig instance) {
  final val = <String, dynamic>{
    'S3OutputLocation': instance.s3OutputLocation,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CompilerOptions', instance.compilerOptions);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('TargetDevice', _$TargetDeviceEnumMap[instance.targetDevice]);
  writeNotNull('TargetPlatform', instance.targetPlatform?.toJson());
  return val;
}

OutputDataConfig _$OutputDataConfigFromJson(Map<String, dynamic> json) {
  return OutputDataConfig(
    s3OutputPath: json['S3OutputPath'] as String,
    kmsKeyId: json['KmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$OutputDataConfigToJson(OutputDataConfig instance) {
  final val = <String, dynamic>{
    'S3OutputPath': instance.s3OutputPath,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

Parameter _$ParameterFromJson(Map<String, dynamic> json) {
  return Parameter(
    name: json['Name'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$ParameterToJson(Parameter instance) => <String, dynamic>{
      'Name': instance.name,
      'Value': instance.value,
    };

ParameterRange _$ParameterRangeFromJson(Map<String, dynamic> json) {
  return ParameterRange(
    categoricalParameterRangeSpecification:
        json['CategoricalParameterRangeSpecification'] == null
            ? null
            : CategoricalParameterRangeSpecification.fromJson(
                json['CategoricalParameterRangeSpecification']
                    as Map<String, dynamic>),
    continuousParameterRangeSpecification:
        json['ContinuousParameterRangeSpecification'] == null
            ? null
            : ContinuousParameterRangeSpecification.fromJson(
                json['ContinuousParameterRangeSpecification']
                    as Map<String, dynamic>),
    integerParameterRangeSpecification:
        json['IntegerParameterRangeSpecification'] == null
            ? null
            : IntegerParameterRangeSpecification.fromJson(
                json['IntegerParameterRangeSpecification']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ParameterRangeToJson(ParameterRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CategoricalParameterRangeSpecification',
      instance.categoricalParameterRangeSpecification?.toJson());
  writeNotNull('ContinuousParameterRangeSpecification',
      instance.continuousParameterRangeSpecification?.toJson());
  writeNotNull('IntegerParameterRangeSpecification',
      instance.integerParameterRangeSpecification?.toJson());
  return val;
}

ParameterRanges _$ParameterRangesFromJson(Map<String, dynamic> json) {
  return ParameterRanges(
    categoricalParameterRanges:
        (json['CategoricalParameterRanges'] as List<dynamic>?)
            ?.map((e) =>
                CategoricalParameterRange.fromJson(e as Map<String, dynamic>))
            .toList(),
    continuousParameterRanges: (json['ContinuousParameterRanges']
            as List<dynamic>?)
        ?.map(
            (e) => ContinuousParameterRange.fromJson(e as Map<String, dynamic>))
        .toList(),
    integerParameterRanges: (json['IntegerParameterRanges'] as List<dynamic>?)
        ?.map((e) => IntegerParameterRange.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ParameterRangesToJson(ParameterRanges instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CategoricalParameterRanges',
      instance.categoricalParameterRanges?.map((e) => e.toJson()).toList());
  writeNotNull('ContinuousParameterRanges',
      instance.continuousParameterRanges?.map((e) => e.toJson()).toList());
  writeNotNull('IntegerParameterRanges',
      instance.integerParameterRanges?.map((e) => e.toJson()).toList());
  return val;
}

Parent _$ParentFromJson(Map<String, dynamic> json) {
  return Parent(
    experimentName: json['ExperimentName'] as String?,
    trialName: json['TrialName'] as String?,
  );
}

ParentHyperParameterTuningJob _$ParentHyperParameterTuningJobFromJson(
    Map<String, dynamic> json) {
  return ParentHyperParameterTuningJob(
    hyperParameterTuningJobName: json['HyperParameterTuningJobName'] as String?,
  );
}

Map<String, dynamic> _$ParentHyperParameterTuningJobToJson(
    ParentHyperParameterTuningJob instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'HyperParameterTuningJobName', instance.hyperParameterTuningJobName);
  return val;
}

Pipeline _$PipelineFromJson(Map<String, dynamic> json) {
  return Pipeline(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    lastRunTime: const UnixDateTimeConverter().fromJson(json['LastRunTime']),
    pipelineArn: json['PipelineArn'] as String?,
    pipelineDescription: json['PipelineDescription'] as String?,
    pipelineDisplayName: json['PipelineDisplayName'] as String?,
    pipelineName: json['PipelineName'] as String?,
    pipelineStatus:
        _$enumDecodeNullable(_$PipelineStatusEnumMap, json['PipelineStatus']),
    roleArn: json['RoleArn'] as String?,
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

PipelineExecution _$PipelineExecutionFromJson(Map<String, dynamic> json) {
  return PipelineExecution(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    pipelineArn: json['PipelineArn'] as String?,
    pipelineExecutionArn: json['PipelineExecutionArn'] as String?,
    pipelineExecutionDescription:
        json['PipelineExecutionDescription'] as String?,
    pipelineExecutionDisplayName:
        json['PipelineExecutionDisplayName'] as String?,
    pipelineExecutionStatus: _$enumDecodeNullable(
        _$PipelineExecutionStatusEnumMap, json['PipelineExecutionStatus']),
    pipelineParameters: (json['PipelineParameters'] as List<dynamic>?)
        ?.map((e) => Parameter.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

PipelineExecutionStep _$PipelineExecutionStepFromJson(
    Map<String, dynamic> json) {
  return PipelineExecutionStep(
    cacheHitResult: json['CacheHitResult'] == null
        ? null
        : CacheHitResult.fromJson(
            json['CacheHitResult'] as Map<String, dynamic>),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    failureReason: json['FailureReason'] as String?,
    metadata: json['Metadata'] == null
        ? null
        : PipelineExecutionStepMetadata.fromJson(
            json['Metadata'] as Map<String, dynamic>),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    stepName: json['StepName'] as String?,
    stepStatus: _$enumDecodeNullable(_$StepStatusEnumMap, json['StepStatus']),
  );
}

const _$StepStatusEnumMap = {
  StepStatus.starting: 'Starting',
  StepStatus.executing: 'Executing',
  StepStatus.stopping: 'Stopping',
  StepStatus.stopped: 'Stopped',
  StepStatus.failed: 'Failed',
  StepStatus.succeeded: 'Succeeded',
};

PipelineExecutionStepMetadata _$PipelineExecutionStepMetadataFromJson(
    Map<String, dynamic> json) {
  return PipelineExecutionStepMetadata(
    condition: json['Condition'] == null
        ? null
        : ConditionStepMetadata.fromJson(
            json['Condition'] as Map<String, dynamic>),
    model: json['Model'] == null
        ? null
        : ModelStepMetadata.fromJson(json['Model'] as Map<String, dynamic>),
    processingJob: json['ProcessingJob'] == null
        ? null
        : ProcessingJobStepMetadata.fromJson(
            json['ProcessingJob'] as Map<String, dynamic>),
    registerModel: json['RegisterModel'] == null
        ? null
        : RegisterModelStepMetadata.fromJson(
            json['RegisterModel'] as Map<String, dynamic>),
    trainingJob: json['TrainingJob'] == null
        ? null
        : TrainingJobStepMetadata.fromJson(
            json['TrainingJob'] as Map<String, dynamic>),
    transformJob: json['TransformJob'] == null
        ? null
        : TransformJobStepMetadata.fromJson(
            json['TransformJob'] as Map<String, dynamic>),
  );
}

PipelineExecutionSummary _$PipelineExecutionSummaryFromJson(
    Map<String, dynamic> json) {
  return PipelineExecutionSummary(
    pipelineExecutionArn: json['PipelineExecutionArn'] as String?,
    pipelineExecutionDescription:
        json['PipelineExecutionDescription'] as String?,
    pipelineExecutionDisplayName:
        json['PipelineExecutionDisplayName'] as String?,
    pipelineExecutionStatus: _$enumDecodeNullable(
        _$PipelineExecutionStatusEnumMap, json['PipelineExecutionStatus']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
  );
}

PipelineSummary _$PipelineSummaryFromJson(Map<String, dynamic> json) {
  return PipelineSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastExecutionTime:
        const UnixDateTimeConverter().fromJson(json['LastExecutionTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    pipelineArn: json['PipelineArn'] as String?,
    pipelineDescription: json['PipelineDescription'] as String?,
    pipelineDisplayName: json['PipelineDisplayName'] as String?,
    pipelineName: json['PipelineName'] as String?,
    roleArn: json['RoleArn'] as String?,
  );
}

ProcessingClusterConfig _$ProcessingClusterConfigFromJson(
    Map<String, dynamic> json) {
  return ProcessingClusterConfig(
    instanceCount: json['InstanceCount'] as int,
    instanceType:
        _$enumDecode(_$ProcessingInstanceTypeEnumMap, json['InstanceType']),
    volumeSizeInGB: json['VolumeSizeInGB'] as int,
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$ProcessingClusterConfigToJson(
    ProcessingClusterConfig instance) {
  final val = <String, dynamic>{
    'InstanceCount': instance.instanceCount,
    'InstanceType': _$ProcessingInstanceTypeEnumMap[instance.instanceType],
    'VolumeSizeInGB': instance.volumeSizeInGB,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumeKmsKeyId', instance.volumeKmsKeyId);
  return val;
}

ProcessingFeatureStoreOutput _$ProcessingFeatureStoreOutputFromJson(
    Map<String, dynamic> json) {
  return ProcessingFeatureStoreOutput(
    featureGroupName: json['FeatureGroupName'] as String,
  );
}

Map<String, dynamic> _$ProcessingFeatureStoreOutputToJson(
        ProcessingFeatureStoreOutput instance) =>
    <String, dynamic>{
      'FeatureGroupName': instance.featureGroupName,
    };

ProcessingInput _$ProcessingInputFromJson(Map<String, dynamic> json) {
  return ProcessingInput(
    inputName: json['InputName'] as String,
    appManaged: json['AppManaged'] as bool?,
    datasetDefinition: json['DatasetDefinition'] == null
        ? null
        : DatasetDefinition.fromJson(
            json['DatasetDefinition'] as Map<String, dynamic>),
    s3Input: json['S3Input'] == null
        ? null
        : ProcessingS3Input.fromJson(json['S3Input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProcessingInputToJson(ProcessingInput instance) {
  final val = <String, dynamic>{
    'InputName': instance.inputName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AppManaged', instance.appManaged);
  writeNotNull('DatasetDefinition', instance.datasetDefinition?.toJson());
  writeNotNull('S3Input', instance.s3Input?.toJson());
  return val;
}

ProcessingJob _$ProcessingJobFromJson(Map<String, dynamic> json) {
  return ProcessingJob(
    appSpecification: json['AppSpecification'] == null
        ? null
        : AppSpecification.fromJson(
            json['AppSpecification'] as Map<String, dynamic>),
    autoMLJobArn: json['AutoMLJobArn'] as String?,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    environment: (json['Environment'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    exitMessage: json['ExitMessage'] as String?,
    experimentConfig: json['ExperimentConfig'] == null
        ? null
        : ExperimentConfig.fromJson(
            json['ExperimentConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    monitoringScheduleArn: json['MonitoringScheduleArn'] as String?,
    networkConfig: json['NetworkConfig'] == null
        ? null
        : NetworkConfig.fromJson(json['NetworkConfig'] as Map<String, dynamic>),
    processingEndTime:
        const UnixDateTimeConverter().fromJson(json['ProcessingEndTime']),
    processingInputs: (json['ProcessingInputs'] as List<dynamic>?)
        ?.map((e) => ProcessingInput.fromJson(e as Map<String, dynamic>))
        .toList(),
    processingJobArn: json['ProcessingJobArn'] as String?,
    processingJobName: json['ProcessingJobName'] as String?,
    processingJobStatus: _$enumDecodeNullable(
        _$ProcessingJobStatusEnumMap, json['ProcessingJobStatus']),
    processingOutputConfig: json['ProcessingOutputConfig'] == null
        ? null
        : ProcessingOutputConfig.fromJson(
            json['ProcessingOutputConfig'] as Map<String, dynamic>),
    processingResources: json['ProcessingResources'] == null
        ? null
        : ProcessingResources.fromJson(
            json['ProcessingResources'] as Map<String, dynamic>),
    processingStartTime:
        const UnixDateTimeConverter().fromJson(json['ProcessingStartTime']),
    roleArn: json['RoleArn'] as String?,
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : ProcessingStoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    trainingJobArn: json['TrainingJobArn'] as String?,
  );
}

ProcessingJobStepMetadata _$ProcessingJobStepMetadataFromJson(
    Map<String, dynamic> json) {
  return ProcessingJobStepMetadata(
    arn: json['Arn'] as String?,
  );
}

ProcessingJobSummary _$ProcessingJobSummaryFromJson(Map<String, dynamic> json) {
  return ProcessingJobSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    processingJobArn: json['ProcessingJobArn'] as String,
    processingJobName: json['ProcessingJobName'] as String,
    processingJobStatus:
        _$enumDecode(_$ProcessingJobStatusEnumMap, json['ProcessingJobStatus']),
    exitMessage: json['ExitMessage'] as String?,
    failureReason: json['FailureReason'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    processingEndTime:
        const UnixDateTimeConverter().fromJson(json['ProcessingEndTime']),
  );
}

ProcessingOutput _$ProcessingOutputFromJson(Map<String, dynamic> json) {
  return ProcessingOutput(
    outputName: json['OutputName'] as String,
    appManaged: json['AppManaged'] as bool?,
    featureStoreOutput: json['FeatureStoreOutput'] == null
        ? null
        : ProcessingFeatureStoreOutput.fromJson(
            json['FeatureStoreOutput'] as Map<String, dynamic>),
    s3Output: json['S3Output'] == null
        ? null
        : ProcessingS3Output.fromJson(json['S3Output'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProcessingOutputToJson(ProcessingOutput instance) {
  final val = <String, dynamic>{
    'OutputName': instance.outputName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AppManaged', instance.appManaged);
  writeNotNull('FeatureStoreOutput', instance.featureStoreOutput?.toJson());
  writeNotNull('S3Output', instance.s3Output?.toJson());
  return val;
}

ProcessingOutputConfig _$ProcessingOutputConfigFromJson(
    Map<String, dynamic> json) {
  return ProcessingOutputConfig(
    outputs: (json['Outputs'] as List<dynamic>)
        .map((e) => ProcessingOutput.fromJson(e as Map<String, dynamic>))
        .toList(),
    kmsKeyId: json['KmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$ProcessingOutputConfigToJson(
    ProcessingOutputConfig instance) {
  final val = <String, dynamic>{
    'Outputs': instance.outputs.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

ProcessingResources _$ProcessingResourcesFromJson(Map<String, dynamic> json) {
  return ProcessingResources(
    clusterConfig: ProcessingClusterConfig.fromJson(
        json['ClusterConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProcessingResourcesToJson(
        ProcessingResources instance) =>
    <String, dynamic>{
      'ClusterConfig': instance.clusterConfig.toJson(),
    };

ProcessingS3Input _$ProcessingS3InputFromJson(Map<String, dynamic> json) {
  return ProcessingS3Input(
    s3DataType: _$enumDecode(_$ProcessingS3DataTypeEnumMap, json['S3DataType']),
    s3Uri: json['S3Uri'] as String,
    localPath: json['LocalPath'] as String?,
    s3CompressionType: _$enumDecodeNullable(
        _$ProcessingS3CompressionTypeEnumMap, json['S3CompressionType']),
    s3DataDistributionType: _$enumDecodeNullable(
        _$ProcessingS3DataDistributionTypeEnumMap,
        json['S3DataDistributionType']),
    s3InputMode: _$enumDecodeNullable(
        _$ProcessingS3InputModeEnumMap, json['S3InputMode']),
  );
}

Map<String, dynamic> _$ProcessingS3InputToJson(ProcessingS3Input instance) {
  final val = <String, dynamic>{
    'S3DataType': _$ProcessingS3DataTypeEnumMap[instance.s3DataType],
    'S3Uri': instance.s3Uri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LocalPath', instance.localPath);
  writeNotNull('S3CompressionType',
      _$ProcessingS3CompressionTypeEnumMap[instance.s3CompressionType]);
  writeNotNull(
      'S3DataDistributionType',
      _$ProcessingS3DataDistributionTypeEnumMap[
          instance.s3DataDistributionType]);
  writeNotNull(
      'S3InputMode', _$ProcessingS3InputModeEnumMap[instance.s3InputMode]);
  return val;
}

const _$ProcessingS3DataTypeEnumMap = {
  ProcessingS3DataType.manifestFile: 'ManifestFile',
  ProcessingS3DataType.s3Prefix: 'S3Prefix',
};

const _$ProcessingS3CompressionTypeEnumMap = {
  ProcessingS3CompressionType.none: 'None',
  ProcessingS3CompressionType.gzip: 'Gzip',
};

ProcessingS3Output _$ProcessingS3OutputFromJson(Map<String, dynamic> json) {
  return ProcessingS3Output(
    localPath: json['LocalPath'] as String,
    s3UploadMode:
        _$enumDecode(_$ProcessingS3UploadModeEnumMap, json['S3UploadMode']),
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$ProcessingS3OutputToJson(ProcessingS3Output instance) =>
    <String, dynamic>{
      'LocalPath': instance.localPath,
      'S3UploadMode': _$ProcessingS3UploadModeEnumMap[instance.s3UploadMode],
      'S3Uri': instance.s3Uri,
    };

ProcessingStoppingCondition _$ProcessingStoppingConditionFromJson(
    Map<String, dynamic> json) {
  return ProcessingStoppingCondition(
    maxRuntimeInSeconds: json['MaxRuntimeInSeconds'] as int,
  );
}

Map<String, dynamic> _$ProcessingStoppingConditionToJson(
        ProcessingStoppingCondition instance) =>
    <String, dynamic>{
      'MaxRuntimeInSeconds': instance.maxRuntimeInSeconds,
    };

ProductionVariant _$ProductionVariantFromJson(Map<String, dynamic> json) {
  return ProductionVariant(
    initialInstanceCount: json['InitialInstanceCount'] as int,
    instanceType: _$enumDecode(
        _$ProductionVariantInstanceTypeEnumMap, json['InstanceType']),
    modelName: json['ModelName'] as String,
    variantName: json['VariantName'] as String,
    acceleratorType: _$enumDecodeNullable(
        _$ProductionVariantAcceleratorTypeEnumMap, json['AcceleratorType']),
    initialVariantWeight: (json['InitialVariantWeight'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ProductionVariantToJson(ProductionVariant instance) {
  final val = <String, dynamic>{
    'InitialInstanceCount': instance.initialInstanceCount,
    'InstanceType':
        _$ProductionVariantInstanceTypeEnumMap[instance.instanceType],
    'ModelName': instance.modelName,
    'VariantName': instance.variantName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceleratorType',
      _$ProductionVariantAcceleratorTypeEnumMap[instance.acceleratorType]);
  writeNotNull('InitialVariantWeight', instance.initialVariantWeight);
  return val;
}

const _$ProductionVariantAcceleratorTypeEnumMap = {
  ProductionVariantAcceleratorType.mlEia1Medium: 'ml.eia1.medium',
  ProductionVariantAcceleratorType.mlEia1Large: 'ml.eia1.large',
  ProductionVariantAcceleratorType.mlEia1Xlarge: 'ml.eia1.xlarge',
  ProductionVariantAcceleratorType.mlEia2Medium: 'ml.eia2.medium',
  ProductionVariantAcceleratorType.mlEia2Large: 'ml.eia2.large',
  ProductionVariantAcceleratorType.mlEia2Xlarge: 'ml.eia2.xlarge',
};

ProductionVariantSummary _$ProductionVariantSummaryFromJson(
    Map<String, dynamic> json) {
  return ProductionVariantSummary(
    variantName: json['VariantName'] as String,
    currentInstanceCount: json['CurrentInstanceCount'] as int?,
    currentWeight: (json['CurrentWeight'] as num?)?.toDouble(),
    deployedImages: (json['DeployedImages'] as List<dynamic>?)
        ?.map((e) => DeployedImage.fromJson(e as Map<String, dynamic>))
        .toList(),
    desiredInstanceCount: json['DesiredInstanceCount'] as int?,
    desiredWeight: (json['DesiredWeight'] as num?)?.toDouble(),
  );
}

ProfilerConfig _$ProfilerConfigFromJson(Map<String, dynamic> json) {
  return ProfilerConfig(
    s3OutputPath: json['S3OutputPath'] as String,
    profilingIntervalInMilliseconds:
        json['ProfilingIntervalInMilliseconds'] as int?,
    profilingParameters:
        (json['ProfilingParameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$ProfilerConfigToJson(ProfilerConfig instance) {
  final val = <String, dynamic>{
    'S3OutputPath': instance.s3OutputPath,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProfilingIntervalInMilliseconds',
      instance.profilingIntervalInMilliseconds);
  writeNotNull('ProfilingParameters', instance.profilingParameters);
  return val;
}

Map<String, dynamic> _$ProfilerConfigForUpdateToJson(
    ProfilerConfigForUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DisableProfiler', instance.disableProfiler);
  writeNotNull('ProfilingIntervalInMilliseconds',
      instance.profilingIntervalInMilliseconds);
  writeNotNull('ProfilingParameters', instance.profilingParameters);
  writeNotNull('S3OutputPath', instance.s3OutputPath);
  return val;
}

ProfilerRuleConfiguration _$ProfilerRuleConfigurationFromJson(
    Map<String, dynamic> json) {
  return ProfilerRuleConfiguration(
    ruleConfigurationName: json['RuleConfigurationName'] as String,
    ruleEvaluatorImage: json['RuleEvaluatorImage'] as String,
    instanceType: _$enumDecodeNullable(
        _$ProcessingInstanceTypeEnumMap, json['InstanceType']),
    localPath: json['LocalPath'] as String?,
    ruleParameters: (json['RuleParameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    s3OutputPath: json['S3OutputPath'] as String?,
    volumeSizeInGB: json['VolumeSizeInGB'] as int?,
  );
}

Map<String, dynamic> _$ProfilerRuleConfigurationToJson(
    ProfilerRuleConfiguration instance) {
  final val = <String, dynamic>{
    'RuleConfigurationName': instance.ruleConfigurationName,
    'RuleEvaluatorImage': instance.ruleEvaluatorImage,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'InstanceType', _$ProcessingInstanceTypeEnumMap[instance.instanceType]);
  writeNotNull('LocalPath', instance.localPath);
  writeNotNull('RuleParameters', instance.ruleParameters);
  writeNotNull('S3OutputPath', instance.s3OutputPath);
  writeNotNull('VolumeSizeInGB', instance.volumeSizeInGB);
  return val;
}

ProfilerRuleEvaluationStatus _$ProfilerRuleEvaluationStatusFromJson(
    Map<String, dynamic> json) {
  return ProfilerRuleEvaluationStatus(
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    ruleConfigurationName: json['RuleConfigurationName'] as String?,
    ruleEvaluationJobArn: json['RuleEvaluationJobArn'] as String?,
    ruleEvaluationStatus: _$enumDecodeNullable(
        _$RuleEvaluationStatusEnumMap, json['RuleEvaluationStatus']),
    statusDetails: json['StatusDetails'] as String?,
  );
}

ProjectSummary _$ProjectSummaryFromJson(Map<String, dynamic> json) {
  return ProjectSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    projectArn: json['ProjectArn'] as String,
    projectId: json['ProjectId'] as String,
    projectName: json['ProjectName'] as String,
    projectStatus: _$enumDecode(_$ProjectStatusEnumMap, json['ProjectStatus']),
    projectDescription: json['ProjectDescription'] as String?,
  );
}

Map<String, dynamic> _$PropertyNameQueryToJson(PropertyNameQuery instance) =>
    <String, dynamic>{
      'PropertyNameHint': instance.propertyNameHint,
    };

PropertyNameSuggestion _$PropertyNameSuggestionFromJson(
    Map<String, dynamic> json) {
  return PropertyNameSuggestion(
    propertyName: json['PropertyName'] as String?,
  );
}

ProvisioningParameter _$ProvisioningParameterFromJson(
    Map<String, dynamic> json) {
  return ProvisioningParameter(
    key: json['Key'] as String?,
    value: json['Value'] as String?,
  );
}

Map<String, dynamic> _$ProvisioningParameterToJson(
    ProvisioningParameter instance) {
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

PublicWorkforceTaskPrice _$PublicWorkforceTaskPriceFromJson(
    Map<String, dynamic> json) {
  return PublicWorkforceTaskPrice(
    amountInUsd: json['AmountInUsd'] == null
        ? null
        : USD.fromJson(json['AmountInUsd'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PublicWorkforceTaskPriceToJson(
    PublicWorkforceTaskPrice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AmountInUsd', instance.amountInUsd?.toJson());
  return val;
}

PutModelPackageGroupPolicyOutput _$PutModelPackageGroupPolicyOutputFromJson(
    Map<String, dynamic> json) {
  return PutModelPackageGroupPolicyOutput(
    modelPackageGroupArn: json['ModelPackageGroupArn'] as String,
  );
}

RedshiftDatasetDefinition _$RedshiftDatasetDefinitionFromJson(
    Map<String, dynamic> json) {
  return RedshiftDatasetDefinition(
    clusterId: json['ClusterId'] as String,
    clusterRoleArn: json['ClusterRoleArn'] as String,
    database: json['Database'] as String,
    dbUser: json['DbUser'] as String,
    outputFormat:
        _$enumDecode(_$RedshiftResultFormatEnumMap, json['OutputFormat']),
    outputS3Uri: json['OutputS3Uri'] as String,
    queryString: json['QueryString'] as String,
    kmsKeyId: json['KmsKeyId'] as String?,
    outputCompression: _$enumDecodeNullable(
        _$RedshiftResultCompressionTypeEnumMap, json['OutputCompression']),
  );
}

Map<String, dynamic> _$RedshiftDatasetDefinitionToJson(
    RedshiftDatasetDefinition instance) {
  final val = <String, dynamic>{
    'ClusterId': instance.clusterId,
    'ClusterRoleArn': instance.clusterRoleArn,
    'Database': instance.database,
    'DbUser': instance.dbUser,
    'OutputFormat': _$RedshiftResultFormatEnumMap[instance.outputFormat],
    'OutputS3Uri': instance.outputS3Uri,
    'QueryString': instance.queryString,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('OutputCompression',
      _$RedshiftResultCompressionTypeEnumMap[instance.outputCompression]);
  return val;
}

const _$RedshiftResultFormatEnumMap = {
  RedshiftResultFormat.parquet: 'PARQUET',
  RedshiftResultFormat.csv: 'CSV',
};

const _$RedshiftResultCompressionTypeEnumMap = {
  RedshiftResultCompressionType.none: 'None',
  RedshiftResultCompressionType.gzip: 'GZIP',
  RedshiftResultCompressionType.bzip2: 'BZIP2',
  RedshiftResultCompressionType.zstd: 'ZSTD',
  RedshiftResultCompressionType.snappy: 'SNAPPY',
};

RegisterModelStepMetadata _$RegisterModelStepMetadataFromJson(
    Map<String, dynamic> json) {
  return RegisterModelStepMetadata(
    arn: json['Arn'] as String?,
  );
}

RenderUiTemplateResponse _$RenderUiTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return RenderUiTemplateResponse(
    errors: (json['Errors'] as List<dynamic>)
        .map((e) => RenderingError.fromJson(e as Map<String, dynamic>))
        .toList(),
    renderedContent: json['RenderedContent'] as String,
  );
}

Map<String, dynamic> _$RenderableTaskToJson(RenderableTask instance) =>
    <String, dynamic>{
      'Input': instance.input,
    };

RenderingError _$RenderingErrorFromJson(Map<String, dynamic> json) {
  return RenderingError(
    code: json['Code'] as String,
    message: json['Message'] as String,
  );
}

ResolvedAttributes _$ResolvedAttributesFromJson(Map<String, dynamic> json) {
  return ResolvedAttributes(
    autoMLJobObjective: json['AutoMLJobObjective'] == null
        ? null
        : AutoMLJobObjective.fromJson(
            json['AutoMLJobObjective'] as Map<String, dynamic>),
    completionCriteria: json['CompletionCriteria'] == null
        ? null
        : AutoMLJobCompletionCriteria.fromJson(
            json['CompletionCriteria'] as Map<String, dynamic>),
    problemType:
        _$enumDecodeNullable(_$ProblemTypeEnumMap, json['ProblemType']),
  );
}

ResourceConfig _$ResourceConfigFromJson(Map<String, dynamic> json) {
  return ResourceConfig(
    instanceCount: json['InstanceCount'] as int,
    instanceType:
        _$enumDecode(_$TrainingInstanceTypeEnumMap, json['InstanceType']),
    volumeSizeInGB: json['VolumeSizeInGB'] as int,
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$ResourceConfigToJson(ResourceConfig instance) {
  final val = <String, dynamic>{
    'InstanceCount': instance.instanceCount,
    'InstanceType': _$TrainingInstanceTypeEnumMap[instance.instanceType],
    'VolumeSizeInGB': instance.volumeSizeInGB,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumeKmsKeyId', instance.volumeKmsKeyId);
  return val;
}

const _$TrainingInstanceTypeEnumMap = {
  TrainingInstanceType.mlM4Xlarge: 'ml.m4.xlarge',
  TrainingInstanceType.mlM4_2xlarge: 'ml.m4.2xlarge',
  TrainingInstanceType.mlM4_4xlarge: 'ml.m4.4xlarge',
  TrainingInstanceType.mlM4_10xlarge: 'ml.m4.10xlarge',
  TrainingInstanceType.mlM4_16xlarge: 'ml.m4.16xlarge',
  TrainingInstanceType.mlG4dnXlarge: 'ml.g4dn.xlarge',
  TrainingInstanceType.mlG4dn_2xlarge: 'ml.g4dn.2xlarge',
  TrainingInstanceType.mlG4dn_4xlarge: 'ml.g4dn.4xlarge',
  TrainingInstanceType.mlG4dn_8xlarge: 'ml.g4dn.8xlarge',
  TrainingInstanceType.mlG4dn_12xlarge: 'ml.g4dn.12xlarge',
  TrainingInstanceType.mlG4dn_16xlarge: 'ml.g4dn.16xlarge',
  TrainingInstanceType.mlM5Large: 'ml.m5.large',
  TrainingInstanceType.mlM5Xlarge: 'ml.m5.xlarge',
  TrainingInstanceType.mlM5_2xlarge: 'ml.m5.2xlarge',
  TrainingInstanceType.mlM5_4xlarge: 'ml.m5.4xlarge',
  TrainingInstanceType.mlM5_12xlarge: 'ml.m5.12xlarge',
  TrainingInstanceType.mlM5_24xlarge: 'ml.m5.24xlarge',
  TrainingInstanceType.mlC4Xlarge: 'ml.c4.xlarge',
  TrainingInstanceType.mlC4_2xlarge: 'ml.c4.2xlarge',
  TrainingInstanceType.mlC4_4xlarge: 'ml.c4.4xlarge',
  TrainingInstanceType.mlC4_8xlarge: 'ml.c4.8xlarge',
  TrainingInstanceType.mlP2Xlarge: 'ml.p2.xlarge',
  TrainingInstanceType.mlP2_8xlarge: 'ml.p2.8xlarge',
  TrainingInstanceType.mlP2_16xlarge: 'ml.p2.16xlarge',
  TrainingInstanceType.mlP3_2xlarge: 'ml.p3.2xlarge',
  TrainingInstanceType.mlP3_8xlarge: 'ml.p3.8xlarge',
  TrainingInstanceType.mlP3_16xlarge: 'ml.p3.16xlarge',
  TrainingInstanceType.mlP3dn_24xlarge: 'ml.p3dn.24xlarge',
  TrainingInstanceType.mlP4d_24xlarge: 'ml.p4d.24xlarge',
  TrainingInstanceType.mlC5Xlarge: 'ml.c5.xlarge',
  TrainingInstanceType.mlC5_2xlarge: 'ml.c5.2xlarge',
  TrainingInstanceType.mlC5_4xlarge: 'ml.c5.4xlarge',
  TrainingInstanceType.mlC5_9xlarge: 'ml.c5.9xlarge',
  TrainingInstanceType.mlC5_18xlarge: 'ml.c5.18xlarge',
  TrainingInstanceType.mlC5nXlarge: 'ml.c5n.xlarge',
  TrainingInstanceType.mlC5n_2xlarge: 'ml.c5n.2xlarge',
  TrainingInstanceType.mlC5n_4xlarge: 'ml.c5n.4xlarge',
  TrainingInstanceType.mlC5n_9xlarge: 'ml.c5n.9xlarge',
  TrainingInstanceType.mlC5n_18xlarge: 'ml.c5n.18xlarge',
};

ResourceLimits _$ResourceLimitsFromJson(Map<String, dynamic> json) {
  return ResourceLimits(
    maxNumberOfTrainingJobs: json['MaxNumberOfTrainingJobs'] as int,
    maxParallelTrainingJobs: json['MaxParallelTrainingJobs'] as int,
  );
}

Map<String, dynamic> _$ResourceLimitsToJson(ResourceLimits instance) =>
    <String, dynamic>{
      'MaxNumberOfTrainingJobs': instance.maxNumberOfTrainingJobs,
      'MaxParallelTrainingJobs': instance.maxParallelTrainingJobs,
    };

ResourceSpec _$ResourceSpecFromJson(Map<String, dynamic> json) {
  return ResourceSpec(
    instanceType:
        _$enumDecodeNullable(_$AppInstanceTypeEnumMap, json['InstanceType']),
    sageMakerImageArn: json['SageMakerImageArn'] as String?,
    sageMakerImageVersionArn: json['SageMakerImageVersionArn'] as String?,
  );
}

Map<String, dynamic> _$ResourceSpecToJson(ResourceSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceType', _$AppInstanceTypeEnumMap[instance.instanceType]);
  writeNotNull('SageMakerImageArn', instance.sageMakerImageArn);
  writeNotNull('SageMakerImageVersionArn', instance.sageMakerImageVersionArn);
  return val;
}

const _$AppInstanceTypeEnumMap = {
  AppInstanceType.system: 'system',
  AppInstanceType.mlT3Micro: 'ml.t3.micro',
  AppInstanceType.mlT3Small: 'ml.t3.small',
  AppInstanceType.mlT3Medium: 'ml.t3.medium',
  AppInstanceType.mlT3Large: 'ml.t3.large',
  AppInstanceType.mlT3Xlarge: 'ml.t3.xlarge',
  AppInstanceType.mlT3_2xlarge: 'ml.t3.2xlarge',
  AppInstanceType.mlM5Large: 'ml.m5.large',
  AppInstanceType.mlM5Xlarge: 'ml.m5.xlarge',
  AppInstanceType.mlM5_2xlarge: 'ml.m5.2xlarge',
  AppInstanceType.mlM5_4xlarge: 'ml.m5.4xlarge',
  AppInstanceType.mlM5_8xlarge: 'ml.m5.8xlarge',
  AppInstanceType.mlM5_12xlarge: 'ml.m5.12xlarge',
  AppInstanceType.mlM5_16xlarge: 'ml.m5.16xlarge',
  AppInstanceType.mlM5_24xlarge: 'ml.m5.24xlarge',
  AppInstanceType.mlC5Large: 'ml.c5.large',
  AppInstanceType.mlC5Xlarge: 'ml.c5.xlarge',
  AppInstanceType.mlC5_2xlarge: 'ml.c5.2xlarge',
  AppInstanceType.mlC5_4xlarge: 'ml.c5.4xlarge',
  AppInstanceType.mlC5_9xlarge: 'ml.c5.9xlarge',
  AppInstanceType.mlC5_12xlarge: 'ml.c5.12xlarge',
  AppInstanceType.mlC5_18xlarge: 'ml.c5.18xlarge',
  AppInstanceType.mlC5_24xlarge: 'ml.c5.24xlarge',
  AppInstanceType.mlP3_2xlarge: 'ml.p3.2xlarge',
  AppInstanceType.mlP3_8xlarge: 'ml.p3.8xlarge',
  AppInstanceType.mlP3_16xlarge: 'ml.p3.16xlarge',
  AppInstanceType.mlG4dnXlarge: 'ml.g4dn.xlarge',
  AppInstanceType.mlG4dn_2xlarge: 'ml.g4dn.2xlarge',
  AppInstanceType.mlG4dn_4xlarge: 'ml.g4dn.4xlarge',
  AppInstanceType.mlG4dn_8xlarge: 'ml.g4dn.8xlarge',
  AppInstanceType.mlG4dn_12xlarge: 'ml.g4dn.12xlarge',
  AppInstanceType.mlG4dn_16xlarge: 'ml.g4dn.16xlarge',
};

Map<String, dynamic> _$RetentionPolicyToJson(RetentionPolicy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'HomeEfsFileSystem', _$RetentionTypeEnumMap[instance.homeEfsFileSystem]);
  return val;
}

const _$RetentionTypeEnumMap = {
  RetentionType.retain: 'Retain',
  RetentionType.delete: 'Delete',
};

S3DataSource _$S3DataSourceFromJson(Map<String, dynamic> json) {
  return S3DataSource(
    s3DataType: _$enumDecode(_$S3DataTypeEnumMap, json['S3DataType']),
    s3Uri: json['S3Uri'] as String,
    attributeNames: (json['AttributeNames'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    s3DataDistributionType: _$enumDecodeNullable(
        _$S3DataDistributionEnumMap, json['S3DataDistributionType']),
  );
}

Map<String, dynamic> _$S3DataSourceToJson(S3DataSource instance) {
  final val = <String, dynamic>{
    'S3DataType': _$S3DataTypeEnumMap[instance.s3DataType],
    'S3Uri': instance.s3Uri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeNames', instance.attributeNames);
  writeNotNull('S3DataDistributionType',
      _$S3DataDistributionEnumMap[instance.s3DataDistributionType]);
  return val;
}

const _$S3DataTypeEnumMap = {
  S3DataType.manifestFile: 'ManifestFile',
  S3DataType.s3Prefix: 'S3Prefix',
  S3DataType.augmentedManifestFile: 'AugmentedManifestFile',
};

const _$S3DataDistributionEnumMap = {
  S3DataDistribution.fullyReplicated: 'FullyReplicated',
  S3DataDistribution.shardedByS3Key: 'ShardedByS3Key',
};

S3StorageConfig _$S3StorageConfigFromJson(Map<String, dynamic> json) {
  return S3StorageConfig(
    s3Uri: json['S3Uri'] as String,
    kmsKeyId: json['KmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$S3StorageConfigToJson(S3StorageConfig instance) {
  final val = <String, dynamic>{
    'S3Uri': instance.s3Uri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

ScheduleConfig _$ScheduleConfigFromJson(Map<String, dynamic> json) {
  return ScheduleConfig(
    scheduleExpression: json['ScheduleExpression'] as String,
  );
}

Map<String, dynamic> _$ScheduleConfigToJson(ScheduleConfig instance) =>
    <String, dynamic>{
      'ScheduleExpression': instance.scheduleExpression,
    };

Map<String, dynamic> _$SearchExpressionToJson(SearchExpression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.map((e) => e.toJson()).toList());
  writeNotNull(
      'NestedFilters', instance.nestedFilters?.map((e) => e.toJson()).toList());
  writeNotNull('Operator', _$BooleanOperatorEnumMap[instance.operator]);
  writeNotNull('SubExpressions',
      instance.subExpressions?.map((e) => e.toJson()).toList());
  return val;
}

const _$BooleanOperatorEnumMap = {
  BooleanOperator.and: 'And',
  BooleanOperator.or: 'Or',
};

SearchRecord _$SearchRecordFromJson(Map<String, dynamic> json) {
  return SearchRecord(
    endpoint: json['Endpoint'] == null
        ? null
        : Endpoint.fromJson(json['Endpoint'] as Map<String, dynamic>),
    experiment: json['Experiment'] == null
        ? null
        : Experiment.fromJson(json['Experiment'] as Map<String, dynamic>),
    featureGroup: json['FeatureGroup'] == null
        ? null
        : FeatureGroup.fromJson(json['FeatureGroup'] as Map<String, dynamic>),
    modelPackage: json['ModelPackage'] == null
        ? null
        : ModelPackage.fromJson(json['ModelPackage'] as Map<String, dynamic>),
    modelPackageGroup: json['ModelPackageGroup'] == null
        ? null
        : ModelPackageGroup.fromJson(
            json['ModelPackageGroup'] as Map<String, dynamic>),
    pipeline: json['Pipeline'] == null
        ? null
        : Pipeline.fromJson(json['Pipeline'] as Map<String, dynamic>),
    pipelineExecution: json['PipelineExecution'] == null
        ? null
        : PipelineExecution.fromJson(
            json['PipelineExecution'] as Map<String, dynamic>),
    trainingJob: json['TrainingJob'] == null
        ? null
        : TrainingJob.fromJson(json['TrainingJob'] as Map<String, dynamic>),
    trial: json['Trial'] == null
        ? null
        : Trial.fromJson(json['Trial'] as Map<String, dynamic>),
    trialComponent: json['TrialComponent'] == null
        ? null
        : TrialComponent.fromJson(
            json['TrialComponent'] as Map<String, dynamic>),
  );
}

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) {
  return SearchResponse(
    nextToken: json['NextToken'] as String?,
    results: (json['Results'] as List<dynamic>?)
        ?.map((e) => SearchRecord.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

SecondaryStatusTransition _$SecondaryStatusTransitionFromJson(
    Map<String, dynamic> json) {
  return SecondaryStatusTransition(
    startTime: DateTime.parse(json['StartTime'] as String),
    status: _$enumDecode(_$SecondaryStatusEnumMap, json['Status']),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    statusMessage: json['StatusMessage'] as String?,
  );
}

ServiceCatalogProvisionedProductDetails
    _$ServiceCatalogProvisionedProductDetailsFromJson(
        Map<String, dynamic> json) {
  return ServiceCatalogProvisionedProductDetails(
    provisionedProductId: json['ProvisionedProductId'] as String?,
    provisionedProductStatusMessage:
        json['ProvisionedProductStatusMessage'] as String?,
  );
}

ServiceCatalogProvisioningDetails _$ServiceCatalogProvisioningDetailsFromJson(
    Map<String, dynamic> json) {
  return ServiceCatalogProvisioningDetails(
    productId: json['ProductId'] as String,
    provisioningArtifactId: json['ProvisioningArtifactId'] as String,
    pathId: json['PathId'] as String?,
    provisioningParameters: (json['ProvisioningParameters'] as List<dynamic>?)
        ?.map((e) => ProvisioningParameter.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ServiceCatalogProvisioningDetailsToJson(
    ServiceCatalogProvisioningDetails instance) {
  final val = <String, dynamic>{
    'ProductId': instance.productId,
    'ProvisioningArtifactId': instance.provisioningArtifactId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PathId', instance.pathId);
  writeNotNull('ProvisioningParameters',
      instance.provisioningParameters?.map((e) => e.toJson()).toList());
  return val;
}

SharingSettings _$SharingSettingsFromJson(Map<String, dynamic> json) {
  return SharingSettings(
    notebookOutputOption: _$enumDecodeNullable(
        _$NotebookOutputOptionEnumMap, json['NotebookOutputOption']),
    s3KmsKeyId: json['S3KmsKeyId'] as String?,
    s3OutputPath: json['S3OutputPath'] as String?,
  );
}

Map<String, dynamic> _$SharingSettingsToJson(SharingSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NotebookOutputOption',
      _$NotebookOutputOptionEnumMap[instance.notebookOutputOption]);
  writeNotNull('S3KmsKeyId', instance.s3KmsKeyId);
  writeNotNull('S3OutputPath', instance.s3OutputPath);
  return val;
}

const _$NotebookOutputOptionEnumMap = {
  NotebookOutputOption.allowed: 'Allowed',
  NotebookOutputOption.disabled: 'Disabled',
};

ShuffleConfig _$ShuffleConfigFromJson(Map<String, dynamic> json) {
  return ShuffleConfig(
    seed: json['Seed'] as int,
  );
}

Map<String, dynamic> _$ShuffleConfigToJson(ShuffleConfig instance) =>
    <String, dynamic>{
      'Seed': instance.seed,
    };

SourceAlgorithm _$SourceAlgorithmFromJson(Map<String, dynamic> json) {
  return SourceAlgorithm(
    algorithmName: json['AlgorithmName'] as String,
    modelDataUrl: json['ModelDataUrl'] as String?,
  );
}

Map<String, dynamic> _$SourceAlgorithmToJson(SourceAlgorithm instance) {
  final val = <String, dynamic>{
    'AlgorithmName': instance.algorithmName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ModelDataUrl', instance.modelDataUrl);
  return val;
}

SourceAlgorithmSpecification _$SourceAlgorithmSpecificationFromJson(
    Map<String, dynamic> json) {
  return SourceAlgorithmSpecification(
    sourceAlgorithms: (json['SourceAlgorithms'] as List<dynamic>)
        .map((e) => SourceAlgorithm.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SourceAlgorithmSpecificationToJson(
        SourceAlgorithmSpecification instance) =>
    <String, dynamic>{
      'SourceAlgorithms':
          instance.sourceAlgorithms.map((e) => e.toJson()).toList(),
    };

SourceIpConfig _$SourceIpConfigFromJson(Map<String, dynamic> json) {
  return SourceIpConfig(
    cidrs: (json['Cidrs'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$SourceIpConfigToJson(SourceIpConfig instance) =>
    <String, dynamic>{
      'Cidrs': instance.cidrs,
    };

StartPipelineExecutionResponse _$StartPipelineExecutionResponseFromJson(
    Map<String, dynamic> json) {
  return StartPipelineExecutionResponse(
    pipelineExecutionArn: json['PipelineExecutionArn'] as String?,
  );
}

StopPipelineExecutionResponse _$StopPipelineExecutionResponseFromJson(
    Map<String, dynamic> json) {
  return StopPipelineExecutionResponse(
    pipelineExecutionArn: json['PipelineExecutionArn'] as String?,
  );
}

StoppingCondition _$StoppingConditionFromJson(Map<String, dynamic> json) {
  return StoppingCondition(
    maxRuntimeInSeconds: json['MaxRuntimeInSeconds'] as int?,
    maxWaitTimeInSeconds: json['MaxWaitTimeInSeconds'] as int?,
  );
}

Map<String, dynamic> _$StoppingConditionToJson(StoppingCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxRuntimeInSeconds', instance.maxRuntimeInSeconds);
  writeNotNull('MaxWaitTimeInSeconds', instance.maxWaitTimeInSeconds);
  return val;
}

SubscribedWorkteam _$SubscribedWorkteamFromJson(Map<String, dynamic> json) {
  return SubscribedWorkteam(
    workteamArn: json['WorkteamArn'] as String,
    listingId: json['ListingId'] as String?,
    marketplaceDescription: json['MarketplaceDescription'] as String?,
    marketplaceTitle: json['MarketplaceTitle'] as String?,
    sellerName: json['SellerName'] as String?,
  );
}

Map<String, dynamic> _$SuggestionQueryToJson(SuggestionQuery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PropertyNameQuery', instance.propertyNameQuery?.toJson());
  return val;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'Key': instance.key,
      'Value': instance.value,
    };

TargetPlatform _$TargetPlatformFromJson(Map<String, dynamic> json) {
  return TargetPlatform(
    arch: _$enumDecode(_$TargetPlatformArchEnumMap, json['Arch']),
    os: _$enumDecode(_$TargetPlatformOsEnumMap, json['Os']),
    accelerator: _$enumDecodeNullable(
        _$TargetPlatformAcceleratorEnumMap, json['Accelerator']),
  );
}

Map<String, dynamic> _$TargetPlatformToJson(TargetPlatform instance) {
  final val = <String, dynamic>{
    'Arch': _$TargetPlatformArchEnumMap[instance.arch],
    'Os': _$TargetPlatformOsEnumMap[instance.os],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Accelerator', _$TargetPlatformAcceleratorEnumMap[instance.accelerator]);
  return val;
}

TensorBoardAppSettings _$TensorBoardAppSettingsFromJson(
    Map<String, dynamic> json) {
  return TensorBoardAppSettings(
    defaultResourceSpec: json['DefaultResourceSpec'] == null
        ? null
        : ResourceSpec.fromJson(
            json['DefaultResourceSpec'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TensorBoardAppSettingsToJson(
    TensorBoardAppSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultResourceSpec', instance.defaultResourceSpec?.toJson());
  return val;
}

TensorBoardOutputConfig _$TensorBoardOutputConfigFromJson(
    Map<String, dynamic> json) {
  return TensorBoardOutputConfig(
    s3OutputPath: json['S3OutputPath'] as String,
    localPath: json['LocalPath'] as String?,
  );
}

Map<String, dynamic> _$TensorBoardOutputConfigToJson(
    TensorBoardOutputConfig instance) {
  final val = <String, dynamic>{
    'S3OutputPath': instance.s3OutputPath,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LocalPath', instance.localPath);
  return val;
}

TrafficRoutingConfig _$TrafficRoutingConfigFromJson(Map<String, dynamic> json) {
  return TrafficRoutingConfig(
    type: _$enumDecode(_$TrafficRoutingConfigTypeEnumMap, json['Type']),
    waitIntervalInSeconds: json['WaitIntervalInSeconds'] as int,
    canarySize: json['CanarySize'] == null
        ? null
        : CapacitySize.fromJson(json['CanarySize'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TrafficRoutingConfigToJson(
    TrafficRoutingConfig instance) {
  final val = <String, dynamic>{
    'Type': _$TrafficRoutingConfigTypeEnumMap[instance.type],
    'WaitIntervalInSeconds': instance.waitIntervalInSeconds,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CanarySize', instance.canarySize?.toJson());
  return val;
}

const _$TrafficRoutingConfigTypeEnumMap = {
  TrafficRoutingConfigType.allAtOnce: 'ALL_AT_ONCE',
  TrafficRoutingConfigType.canary: 'CANARY',
};

TrainingJob _$TrainingJobFromJson(Map<String, dynamic> json) {
  return TrainingJob(
    algorithmSpecification: json['AlgorithmSpecification'] == null
        ? null
        : AlgorithmSpecification.fromJson(
            json['AlgorithmSpecification'] as Map<String, dynamic>),
    autoMLJobArn: json['AutoMLJobArn'] as String?,
    billableTimeInSeconds: json['BillableTimeInSeconds'] as int?,
    checkpointConfig: json['CheckpointConfig'] == null
        ? null
        : CheckpointConfig.fromJson(
            json['CheckpointConfig'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    debugHookConfig: json['DebugHookConfig'] == null
        ? null
        : DebugHookConfig.fromJson(
            json['DebugHookConfig'] as Map<String, dynamic>),
    debugRuleConfigurations: (json['DebugRuleConfigurations'] as List<dynamic>?)
        ?.map((e) => DebugRuleConfiguration.fromJson(e as Map<String, dynamic>))
        .toList(),
    debugRuleEvaluationStatuses:
        (json['DebugRuleEvaluationStatuses'] as List<dynamic>?)
            ?.map((e) =>
                DebugRuleEvaluationStatus.fromJson(e as Map<String, dynamic>))
            .toList(),
    enableInterContainerTrafficEncryption:
        json['EnableInterContainerTrafficEncryption'] as bool?,
    enableManagedSpotTraining: json['EnableManagedSpotTraining'] as bool?,
    enableNetworkIsolation: json['EnableNetworkIsolation'] as bool?,
    experimentConfig: json['ExperimentConfig'] == null
        ? null
        : ExperimentConfig.fromJson(
            json['ExperimentConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String?,
    finalMetricDataList: (json['FinalMetricDataList'] as List<dynamic>?)
        ?.map((e) => MetricData.fromJson(e as Map<String, dynamic>))
        .toList(),
    hyperParameters: (json['HyperParameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    inputDataConfig: (json['InputDataConfig'] as List<dynamic>?)
        ?.map((e) => Channel.fromJson(e as Map<String, dynamic>))
        .toList(),
    labelingJobArn: json['LabelingJobArn'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    modelArtifacts: json['ModelArtifacts'] == null
        ? null
        : ModelArtifacts.fromJson(
            json['ModelArtifacts'] as Map<String, dynamic>),
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    resourceConfig: json['ResourceConfig'] == null
        ? null
        : ResourceConfig.fromJson(
            json['ResourceConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String?,
    secondaryStatus:
        _$enumDecodeNullable(_$SecondaryStatusEnumMap, json['SecondaryStatus']),
    secondaryStatusTransitions:
        (json['SecondaryStatusTransitions'] as List<dynamic>?)
            ?.map((e) =>
                SecondaryStatusTransition.fromJson(e as Map<String, dynamic>))
            .toList(),
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : StoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    tensorBoardOutputConfig: json['TensorBoardOutputConfig'] == null
        ? null
        : TensorBoardOutputConfig.fromJson(
            json['TensorBoardOutputConfig'] as Map<String, dynamic>),
    trainingEndTime:
        const UnixDateTimeConverter().fromJson(json['TrainingEndTime']),
    trainingJobArn: json['TrainingJobArn'] as String?,
    trainingJobName: json['TrainingJobName'] as String?,
    trainingJobStatus: _$enumDecodeNullable(
        _$TrainingJobStatusEnumMap, json['TrainingJobStatus']),
    trainingStartTime:
        const UnixDateTimeConverter().fromJson(json['TrainingStartTime']),
    trainingTimeInSeconds: json['TrainingTimeInSeconds'] as int?,
    tuningJobArn: json['TuningJobArn'] as String?,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

TrainingJobDefinition _$TrainingJobDefinitionFromJson(
    Map<String, dynamic> json) {
  return TrainingJobDefinition(
    inputDataConfig: (json['InputDataConfig'] as List<dynamic>)
        .map((e) => Channel.fromJson(e as Map<String, dynamic>))
        .toList(),
    outputDataConfig: OutputDataConfig.fromJson(
        json['OutputDataConfig'] as Map<String, dynamic>),
    resourceConfig:
        ResourceConfig.fromJson(json['ResourceConfig'] as Map<String, dynamic>),
    stoppingCondition: StoppingCondition.fromJson(
        json['StoppingCondition'] as Map<String, dynamic>),
    trainingInputMode:
        _$enumDecode(_$TrainingInputModeEnumMap, json['TrainingInputMode']),
    hyperParameters: (json['HyperParameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$TrainingJobDefinitionToJson(
    TrainingJobDefinition instance) {
  final val = <String, dynamic>{
    'InputDataConfig': instance.inputDataConfig.map((e) => e.toJson()).toList(),
    'OutputDataConfig': instance.outputDataConfig.toJson(),
    'ResourceConfig': instance.resourceConfig.toJson(),
    'StoppingCondition': instance.stoppingCondition.toJson(),
    'TrainingInputMode': _$TrainingInputModeEnumMap[instance.trainingInputMode],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HyperParameters', instance.hyperParameters);
  return val;
}

TrainingJobStatusCounters _$TrainingJobStatusCountersFromJson(
    Map<String, dynamic> json) {
  return TrainingJobStatusCounters(
    completed: json['Completed'] as int?,
    inProgress: json['InProgress'] as int?,
    nonRetryableError: json['NonRetryableError'] as int?,
    retryableError: json['RetryableError'] as int?,
    stopped: json['Stopped'] as int?,
  );
}

TrainingJobStepMetadata _$TrainingJobStepMetadataFromJson(
    Map<String, dynamic> json) {
  return TrainingJobStepMetadata(
    arn: json['Arn'] as String?,
  );
}

TrainingJobSummary _$TrainingJobSummaryFromJson(Map<String, dynamic> json) {
  return TrainingJobSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    trainingJobArn: json['TrainingJobArn'] as String,
    trainingJobName: json['TrainingJobName'] as String,
    trainingJobStatus:
        _$enumDecode(_$TrainingJobStatusEnumMap, json['TrainingJobStatus']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    trainingEndTime:
        const UnixDateTimeConverter().fromJson(json['TrainingEndTime']),
  );
}

TrainingSpecification _$TrainingSpecificationFromJson(
    Map<String, dynamic> json) {
  return TrainingSpecification(
    supportedTrainingInstanceTypes:
        (json['SupportedTrainingInstanceTypes'] as List<dynamic>)
            .map((e) => _$enumDecode(_$TrainingInstanceTypeEnumMap, e))
            .toList(),
    trainingChannels: (json['TrainingChannels'] as List<dynamic>)
        .map((e) => ChannelSpecification.fromJson(e as Map<String, dynamic>))
        .toList(),
    trainingImage: json['TrainingImage'] as String,
    metricDefinitions: (json['MetricDefinitions'] as List<dynamic>?)
        ?.map((e) => MetricDefinition.fromJson(e as Map<String, dynamic>))
        .toList(),
    supportedHyperParameters:
        (json['SupportedHyperParameters'] as List<dynamic>?)
            ?.map((e) =>
                HyperParameterSpecification.fromJson(e as Map<String, dynamic>))
            .toList(),
    supportedTuningJobObjectiveMetrics:
        (json['SupportedTuningJobObjectiveMetrics'] as List<dynamic>?)
            ?.map((e) => HyperParameterTuningJobObjective.fromJson(
                e as Map<String, dynamic>))
            .toList(),
    supportsDistributedTraining: json['SupportsDistributedTraining'] as bool?,
    trainingImageDigest: json['TrainingImageDigest'] as String?,
  );
}

Map<String, dynamic> _$TrainingSpecificationToJson(
    TrainingSpecification instance) {
  final val = <String, dynamic>{
    'SupportedTrainingInstanceTypes': instance.supportedTrainingInstanceTypes
        .map((e) => _$TrainingInstanceTypeEnumMap[e])
        .toList(),
    'TrainingChannels':
        instance.trainingChannels.map((e) => e.toJson()).toList(),
    'TrainingImage': instance.trainingImage,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MetricDefinitions',
      instance.metricDefinitions?.map((e) => e.toJson()).toList());
  writeNotNull('SupportedHyperParameters',
      instance.supportedHyperParameters?.map((e) => e.toJson()).toList());
  writeNotNull(
      'SupportedTuningJobObjectiveMetrics',
      instance.supportedTuningJobObjectiveMetrics
          ?.map((e) => e.toJson())
          .toList());
  writeNotNull(
      'SupportsDistributedTraining', instance.supportsDistributedTraining);
  writeNotNull('TrainingImageDigest', instance.trainingImageDigest);
  return val;
}

TransformDataSource _$TransformDataSourceFromJson(Map<String, dynamic> json) {
  return TransformDataSource(
    s3DataSource: TransformS3DataSource.fromJson(
        json['S3DataSource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransformDataSourceToJson(
        TransformDataSource instance) =>
    <String, dynamic>{
      'S3DataSource': instance.s3DataSource.toJson(),
    };

TransformInput _$TransformInputFromJson(Map<String, dynamic> json) {
  return TransformInput(
    dataSource: TransformDataSource.fromJson(
        json['DataSource'] as Map<String, dynamic>),
    compressionType:
        _$enumDecodeNullable(_$CompressionTypeEnumMap, json['CompressionType']),
    contentType: json['ContentType'] as String?,
    splitType: _$enumDecodeNullable(_$SplitTypeEnumMap, json['SplitType']),
  );
}

Map<String, dynamic> _$TransformInputToJson(TransformInput instance) {
  final val = <String, dynamic>{
    'DataSource': instance.dataSource.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CompressionType', _$CompressionTypeEnumMap[instance.compressionType]);
  writeNotNull('ContentType', instance.contentType);
  writeNotNull('SplitType', _$SplitTypeEnumMap[instance.splitType]);
  return val;
}

const _$SplitTypeEnumMap = {
  SplitType.none: 'None',
  SplitType.line: 'Line',
  SplitType.recordIO: 'RecordIO',
  SplitType.tFRecord: 'TFRecord',
};

TransformJob _$TransformJobFromJson(Map<String, dynamic> json) {
  return TransformJob(
    autoMLJobArn: json['AutoMLJobArn'] as String?,
    batchStrategy:
        _$enumDecodeNullable(_$BatchStrategyEnumMap, json['BatchStrategy']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    dataProcessing: json['DataProcessing'] == null
        ? null
        : DataProcessing.fromJson(
            json['DataProcessing'] as Map<String, dynamic>),
    environment: (json['Environment'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    experimentConfig: json['ExperimentConfig'] == null
        ? null
        : ExperimentConfig.fromJson(
            json['ExperimentConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String?,
    labelingJobArn: json['LabelingJobArn'] as String?,
    maxConcurrentTransforms: json['MaxConcurrentTransforms'] as int?,
    maxPayloadInMB: json['MaxPayloadInMB'] as int?,
    modelClientConfig: json['ModelClientConfig'] == null
        ? null
        : ModelClientConfig.fromJson(
            json['ModelClientConfig'] as Map<String, dynamic>),
    modelName: json['ModelName'] as String?,
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    transformEndTime:
        const UnixDateTimeConverter().fromJson(json['TransformEndTime']),
    transformInput: json['TransformInput'] == null
        ? null
        : TransformInput.fromJson(
            json['TransformInput'] as Map<String, dynamic>),
    transformJobArn: json['TransformJobArn'] as String?,
    transformJobName: json['TransformJobName'] as String?,
    transformJobStatus: _$enumDecodeNullable(
        _$TransformJobStatusEnumMap, json['TransformJobStatus']),
    transformOutput: json['TransformOutput'] == null
        ? null
        : TransformOutput.fromJson(
            json['TransformOutput'] as Map<String, dynamic>),
    transformResources: json['TransformResources'] == null
        ? null
        : TransformResources.fromJson(
            json['TransformResources'] as Map<String, dynamic>),
    transformStartTime:
        const UnixDateTimeConverter().fromJson(json['TransformStartTime']),
  );
}

TransformJobDefinition _$TransformJobDefinitionFromJson(
    Map<String, dynamic> json) {
  return TransformJobDefinition(
    transformInput:
        TransformInput.fromJson(json['TransformInput'] as Map<String, dynamic>),
    transformOutput: TransformOutput.fromJson(
        json['TransformOutput'] as Map<String, dynamic>),
    transformResources: TransformResources.fromJson(
        json['TransformResources'] as Map<String, dynamic>),
    batchStrategy:
        _$enumDecodeNullable(_$BatchStrategyEnumMap, json['BatchStrategy']),
    environment: (json['Environment'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    maxConcurrentTransforms: json['MaxConcurrentTransforms'] as int?,
    maxPayloadInMB: json['MaxPayloadInMB'] as int?,
  );
}

Map<String, dynamic> _$TransformJobDefinitionToJson(
    TransformJobDefinition instance) {
  final val = <String, dynamic>{
    'TransformInput': instance.transformInput.toJson(),
    'TransformOutput': instance.transformOutput.toJson(),
    'TransformResources': instance.transformResources.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BatchStrategy', _$BatchStrategyEnumMap[instance.batchStrategy]);
  writeNotNull('Environment', instance.environment);
  writeNotNull('MaxConcurrentTransforms', instance.maxConcurrentTransforms);
  writeNotNull('MaxPayloadInMB', instance.maxPayloadInMB);
  return val;
}

TransformJobStepMetadata _$TransformJobStepMetadataFromJson(
    Map<String, dynamic> json) {
  return TransformJobStepMetadata(
    arn: json['Arn'] as String?,
  );
}

TransformJobSummary _$TransformJobSummaryFromJson(Map<String, dynamic> json) {
  return TransformJobSummary(
    creationTime: DateTime.parse(json['CreationTime'] as String),
    transformJobArn: json['TransformJobArn'] as String,
    transformJobName: json['TransformJobName'] as String,
    transformJobStatus:
        _$enumDecode(_$TransformJobStatusEnumMap, json['TransformJobStatus']),
    failureReason: json['FailureReason'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    transformEndTime:
        const UnixDateTimeConverter().fromJson(json['TransformEndTime']),
  );
}

TransformOutput _$TransformOutputFromJson(Map<String, dynamic> json) {
  return TransformOutput(
    s3OutputPath: json['S3OutputPath'] as String,
    accept: json['Accept'] as String?,
    assembleWith:
        _$enumDecodeNullable(_$AssemblyTypeEnumMap, json['AssembleWith']),
    kmsKeyId: json['KmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$TransformOutputToJson(TransformOutput instance) {
  final val = <String, dynamic>{
    'S3OutputPath': instance.s3OutputPath,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Accept', instance.accept);
  writeNotNull('AssembleWith', _$AssemblyTypeEnumMap[instance.assembleWith]);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

const _$AssemblyTypeEnumMap = {
  AssemblyType.none: 'None',
  AssemblyType.line: 'Line',
};

TransformResources _$TransformResourcesFromJson(Map<String, dynamic> json) {
  return TransformResources(
    instanceCount: json['InstanceCount'] as int,
    instanceType:
        _$enumDecode(_$TransformInstanceTypeEnumMap, json['InstanceType']),
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String?,
  );
}

Map<String, dynamic> _$TransformResourcesToJson(TransformResources instance) {
  final val = <String, dynamic>{
    'InstanceCount': instance.instanceCount,
    'InstanceType': _$TransformInstanceTypeEnumMap[instance.instanceType],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VolumeKmsKeyId', instance.volumeKmsKeyId);
  return val;
}

TransformS3DataSource _$TransformS3DataSourceFromJson(
    Map<String, dynamic> json) {
  return TransformS3DataSource(
    s3DataType: _$enumDecode(_$S3DataTypeEnumMap, json['S3DataType']),
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$TransformS3DataSourceToJson(
        TransformS3DataSource instance) =>
    <String, dynamic>{
      'S3DataType': _$S3DataTypeEnumMap[instance.s3DataType],
      'S3Uri': instance.s3Uri,
    };

Trial _$TrialFromJson(Map<String, dynamic> json) {
  return Trial(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    displayName: json['DisplayName'] as String?,
    experimentName: json['ExperimentName'] as String?,
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    metadataProperties: json['MetadataProperties'] == null
        ? null
        : MetadataProperties.fromJson(
            json['MetadataProperties'] as Map<String, dynamic>),
    source: json['Source'] == null
        ? null
        : TrialSource.fromJson(json['Source'] as Map<String, dynamic>),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    trialArn: json['TrialArn'] as String?,
    trialComponentSummaries: (json['TrialComponentSummaries'] as List<dynamic>?)
        ?.map((e) =>
            TrialComponentSimpleSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    trialName: json['TrialName'] as String?,
  );
}

TrialComponent _$TrialComponentFromJson(Map<String, dynamic> json) {
  return TrialComponent(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    displayName: json['DisplayName'] as String?,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    inputArtifacts: (json['InputArtifacts'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k, TrialComponentArtifact.fromJson(e as Map<String, dynamic>)),
    ),
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    metadataProperties: json['MetadataProperties'] == null
        ? null
        : MetadataProperties.fromJson(
            json['MetadataProperties'] as Map<String, dynamic>),
    metrics: (json['Metrics'] as List<dynamic>?)
        ?.map((e) =>
            TrialComponentMetricSummary.fromJson(e as Map<String, dynamic>))
        .toList(),
    outputArtifacts: (json['OutputArtifacts'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k, TrialComponentArtifact.fromJson(e as Map<String, dynamic>)),
    ),
    parameters: (json['Parameters'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(
          k, TrialComponentParameterValue.fromJson(e as Map<String, dynamic>)),
    ),
    parents: (json['Parents'] as List<dynamic>?)
        ?.map((e) => Parent.fromJson(e as Map<String, dynamic>))
        .toList(),
    source: json['Source'] == null
        ? null
        : TrialComponentSource.fromJson(json['Source'] as Map<String, dynamic>),
    sourceDetail: json['SourceDetail'] == null
        ? null
        : TrialComponentSourceDetail.fromJson(
            json['SourceDetail'] as Map<String, dynamic>),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: json['Status'] == null
        ? null
        : TrialComponentStatus.fromJson(json['Status'] as Map<String, dynamic>),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    trialComponentArn: json['TrialComponentArn'] as String?,
    trialComponentName: json['TrialComponentName'] as String?,
  );
}

TrialComponentArtifact _$TrialComponentArtifactFromJson(
    Map<String, dynamic> json) {
  return TrialComponentArtifact(
    value: json['Value'] as String,
    mediaType: json['MediaType'] as String?,
  );
}

Map<String, dynamic> _$TrialComponentArtifactToJson(
    TrialComponentArtifact instance) {
  final val = <String, dynamic>{
    'Value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MediaType', instance.mediaType);
  return val;
}

TrialComponentMetricSummary _$TrialComponentMetricSummaryFromJson(
    Map<String, dynamic> json) {
  return TrialComponentMetricSummary(
    avg: (json['Avg'] as num?)?.toDouble(),
    count: json['Count'] as int?,
    last: (json['Last'] as num?)?.toDouble(),
    max: (json['Max'] as num?)?.toDouble(),
    metricName: json['MetricName'] as String?,
    min: (json['Min'] as num?)?.toDouble(),
    sourceArn: json['SourceArn'] as String?,
    stdDev: (json['StdDev'] as num?)?.toDouble(),
    timeStamp: const UnixDateTimeConverter().fromJson(json['TimeStamp']),
  );
}

TrialComponentParameterValue _$TrialComponentParameterValueFromJson(
    Map<String, dynamic> json) {
  return TrialComponentParameterValue(
    numberValue: (json['NumberValue'] as num?)?.toDouble(),
    stringValue: json['StringValue'] as String?,
  );
}

Map<String, dynamic> _$TrialComponentParameterValueToJson(
    TrialComponentParameterValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NumberValue', instance.numberValue);
  writeNotNull('StringValue', instance.stringValue);
  return val;
}

TrialComponentSimpleSummary _$TrialComponentSimpleSummaryFromJson(
    Map<String, dynamic> json) {
  return TrialComponentSimpleSummary(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    trialComponentArn: json['TrialComponentArn'] as String?,
    trialComponentName: json['TrialComponentName'] as String?,
    trialComponentSource: json['TrialComponentSource'] == null
        ? null
        : TrialComponentSource.fromJson(
            json['TrialComponentSource'] as Map<String, dynamic>),
  );
}

TrialComponentSource _$TrialComponentSourceFromJson(Map<String, dynamic> json) {
  return TrialComponentSource(
    sourceArn: json['SourceArn'] as String,
    sourceType: json['SourceType'] as String?,
  );
}

TrialComponentSourceDetail _$TrialComponentSourceDetailFromJson(
    Map<String, dynamic> json) {
  return TrialComponentSourceDetail(
    processingJob: json['ProcessingJob'] == null
        ? null
        : ProcessingJob.fromJson(json['ProcessingJob'] as Map<String, dynamic>),
    sourceArn: json['SourceArn'] as String?,
    trainingJob: json['TrainingJob'] == null
        ? null
        : TrainingJob.fromJson(json['TrainingJob'] as Map<String, dynamic>),
    transformJob: json['TransformJob'] == null
        ? null
        : TransformJob.fromJson(json['TransformJob'] as Map<String, dynamic>),
  );
}

TrialComponentStatus _$TrialComponentStatusFromJson(Map<String, dynamic> json) {
  return TrialComponentStatus(
    message: json['Message'] as String?,
    primaryStatus: _$enumDecodeNullable(
        _$TrialComponentPrimaryStatusEnumMap, json['PrimaryStatus']),
  );
}

Map<String, dynamic> _$TrialComponentStatusToJson(
    TrialComponentStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Message', instance.message);
  writeNotNull('PrimaryStatus',
      _$TrialComponentPrimaryStatusEnumMap[instance.primaryStatus]);
  return val;
}

const _$TrialComponentPrimaryStatusEnumMap = {
  TrialComponentPrimaryStatus.inProgress: 'InProgress',
  TrialComponentPrimaryStatus.completed: 'Completed',
  TrialComponentPrimaryStatus.failed: 'Failed',
  TrialComponentPrimaryStatus.stopping: 'Stopping',
  TrialComponentPrimaryStatus.stopped: 'Stopped',
};

TrialComponentSummary _$TrialComponentSummaryFromJson(
    Map<String, dynamic> json) {
  return TrialComponentSummary(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    displayName: json['DisplayName'] as String?,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: json['Status'] == null
        ? null
        : TrialComponentStatus.fromJson(json['Status'] as Map<String, dynamic>),
    trialComponentArn: json['TrialComponentArn'] as String?,
    trialComponentName: json['TrialComponentName'] as String?,
    trialComponentSource: json['TrialComponentSource'] == null
        ? null
        : TrialComponentSource.fromJson(
            json['TrialComponentSource'] as Map<String, dynamic>),
  );
}

TrialSource _$TrialSourceFromJson(Map<String, dynamic> json) {
  return TrialSource(
    sourceArn: json['SourceArn'] as String,
    sourceType: json['SourceType'] as String?,
  );
}

TrialSummary _$TrialSummaryFromJson(Map<String, dynamic> json) {
  return TrialSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    displayName: json['DisplayName'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    trialArn: json['TrialArn'] as String?,
    trialName: json['TrialName'] as String?,
    trialSource: json['TrialSource'] == null
        ? null
        : TrialSource.fromJson(json['TrialSource'] as Map<String, dynamic>),
  );
}

TuningJobCompletionCriteria _$TuningJobCompletionCriteriaFromJson(
    Map<String, dynamic> json) {
  return TuningJobCompletionCriteria(
    targetObjectiveMetricValue:
        (json['TargetObjectiveMetricValue'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TuningJobCompletionCriteriaToJson(
        TuningJobCompletionCriteria instance) =>
    <String, dynamic>{
      'TargetObjectiveMetricValue': instance.targetObjectiveMetricValue,
    };

USD _$USDFromJson(Map<String, dynamic> json) {
  return USD(
    cents: json['Cents'] as int?,
    dollars: json['Dollars'] as int?,
    tenthFractionsOfACent: json['TenthFractionsOfACent'] as int?,
  );
}

Map<String, dynamic> _$USDToJson(USD instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cents', instance.cents);
  writeNotNull('Dollars', instance.dollars);
  writeNotNull('TenthFractionsOfACent', instance.tenthFractionsOfACent);
  return val;
}

UiConfig _$UiConfigFromJson(Map<String, dynamic> json) {
  return UiConfig(
    humanTaskUiArn: json['HumanTaskUiArn'] as String?,
    uiTemplateS3Uri: json['UiTemplateS3Uri'] as String?,
  );
}

Map<String, dynamic> _$UiConfigToJson(UiConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HumanTaskUiArn', instance.humanTaskUiArn);
  writeNotNull('UiTemplateS3Uri', instance.uiTemplateS3Uri);
  return val;
}

Map<String, dynamic> _$UiTemplateToJson(UiTemplate instance) =>
    <String, dynamic>{
      'Content': instance.content,
    };

UiTemplateInfo _$UiTemplateInfoFromJson(Map<String, dynamic> json) {
  return UiTemplateInfo(
    contentSha256: json['ContentSha256'] as String?,
    url: json['Url'] as String?,
  );
}

UpdateActionResponse _$UpdateActionResponseFromJson(Map<String, dynamic> json) {
  return UpdateActionResponse(
    actionArn: json['ActionArn'] as String?,
  );
}

UpdateAppImageConfigResponse _$UpdateAppImageConfigResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAppImageConfigResponse(
    appImageConfigArn: json['AppImageConfigArn'] as String?,
  );
}

UpdateArtifactResponse _$UpdateArtifactResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateArtifactResponse(
    artifactArn: json['ArtifactArn'] as String?,
  );
}

UpdateCodeRepositoryOutput _$UpdateCodeRepositoryOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateCodeRepositoryOutput(
    codeRepositoryArn: json['CodeRepositoryArn'] as String,
  );
}

UpdateContextResponse _$UpdateContextResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateContextResponse(
    contextArn: json['ContextArn'] as String?,
  );
}

UpdateDomainResponse _$UpdateDomainResponseFromJson(Map<String, dynamic> json) {
  return UpdateDomainResponse(
    domainArn: json['DomainArn'] as String?,
  );
}

UpdateEndpointOutput _$UpdateEndpointOutputFromJson(Map<String, dynamic> json) {
  return UpdateEndpointOutput(
    endpointArn: json['EndpointArn'] as String,
  );
}

UpdateEndpointWeightsAndCapacitiesOutput
    _$UpdateEndpointWeightsAndCapacitiesOutputFromJson(
        Map<String, dynamic> json) {
  return UpdateEndpointWeightsAndCapacitiesOutput(
    endpointArn: json['EndpointArn'] as String,
  );
}

UpdateExperimentResponse _$UpdateExperimentResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateExperimentResponse(
    experimentArn: json['ExperimentArn'] as String?,
  );
}

UpdateImageResponse _$UpdateImageResponseFromJson(Map<String, dynamic> json) {
  return UpdateImageResponse(
    imageArn: json['ImageArn'] as String?,
  );
}

UpdateModelPackageOutput _$UpdateModelPackageOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateModelPackageOutput(
    modelPackageArn: json['ModelPackageArn'] as String,
  );
}

UpdateMonitoringScheduleResponse _$UpdateMonitoringScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateMonitoringScheduleResponse(
    monitoringScheduleArn: json['MonitoringScheduleArn'] as String,
  );
}

UpdateNotebookInstanceLifecycleConfigOutput
    _$UpdateNotebookInstanceLifecycleConfigOutputFromJson(
        Map<String, dynamic> json) {
  return UpdateNotebookInstanceLifecycleConfigOutput();
}

UpdateNotebookInstanceOutput _$UpdateNotebookInstanceOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateNotebookInstanceOutput();
}

UpdatePipelineExecutionResponse _$UpdatePipelineExecutionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePipelineExecutionResponse(
    pipelineExecutionArn: json['PipelineExecutionArn'] as String?,
  );
}

UpdatePipelineResponse _$UpdatePipelineResponseFromJson(
    Map<String, dynamic> json) {
  return UpdatePipelineResponse(
    pipelineArn: json['PipelineArn'] as String?,
  );
}

UpdateTrainingJobResponse _$UpdateTrainingJobResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTrainingJobResponse(
    trainingJobArn: json['TrainingJobArn'] as String,
  );
}

UpdateTrialComponentResponse _$UpdateTrialComponentResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTrialComponentResponse(
    trialComponentArn: json['TrialComponentArn'] as String?,
  );
}

UpdateTrialResponse _$UpdateTrialResponseFromJson(Map<String, dynamic> json) {
  return UpdateTrialResponse(
    trialArn: json['TrialArn'] as String?,
  );
}

UpdateUserProfileResponse _$UpdateUserProfileResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateUserProfileResponse(
    userProfileArn: json['UserProfileArn'] as String?,
  );
}

UpdateWorkforceResponse _$UpdateWorkforceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateWorkforceResponse(
    workforce: Workforce.fromJson(json['Workforce'] as Map<String, dynamic>),
  );
}

UpdateWorkteamResponse _$UpdateWorkteamResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateWorkteamResponse(
    workteam: Workteam.fromJson(json['Workteam'] as Map<String, dynamic>),
  );
}

UserContext _$UserContextFromJson(Map<String, dynamic> json) {
  return UserContext(
    domainId: json['DomainId'] as String?,
    userProfileArn: json['UserProfileArn'] as String?,
    userProfileName: json['UserProfileName'] as String?,
  );
}

UserProfileDetails _$UserProfileDetailsFromJson(Map<String, dynamic> json) {
  return UserProfileDetails(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    domainId: json['DomainId'] as String?,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    status: _$enumDecodeNullable(_$UserProfileStatusEnumMap, json['Status']),
    userProfileName: json['UserProfileName'] as String?,
  );
}

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return UserSettings(
    executionRole: json['ExecutionRole'] as String?,
    jupyterServerAppSettings: json['JupyterServerAppSettings'] == null
        ? null
        : JupyterServerAppSettings.fromJson(
            json['JupyterServerAppSettings'] as Map<String, dynamic>),
    kernelGatewayAppSettings: json['KernelGatewayAppSettings'] == null
        ? null
        : KernelGatewayAppSettings.fromJson(
            json['KernelGatewayAppSettings'] as Map<String, dynamic>),
    securityGroups: (json['SecurityGroups'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    sharingSettings: json['SharingSettings'] == null
        ? null
        : SharingSettings.fromJson(
            json['SharingSettings'] as Map<String, dynamic>),
    tensorBoardAppSettings: json['TensorBoardAppSettings'] == null
        ? null
        : TensorBoardAppSettings.fromJson(
            json['TensorBoardAppSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExecutionRole', instance.executionRole);
  writeNotNull(
      'JupyterServerAppSettings', instance.jupyterServerAppSettings?.toJson());
  writeNotNull(
      'KernelGatewayAppSettings', instance.kernelGatewayAppSettings?.toJson());
  writeNotNull('SecurityGroups', instance.securityGroups);
  writeNotNull('SharingSettings', instance.sharingSettings?.toJson());
  writeNotNull(
      'TensorBoardAppSettings', instance.tensorBoardAppSettings?.toJson());
  return val;
}

Map<String, dynamic> _$VariantPropertyToJson(VariantProperty instance) =>
    <String, dynamic>{
      'VariantPropertyType':
          _$VariantPropertyTypeEnumMap[instance.variantPropertyType],
    };

const _$VariantPropertyTypeEnumMap = {
  VariantPropertyType.desiredInstanceCount: 'DesiredInstanceCount',
  VariantPropertyType.desiredWeight: 'DesiredWeight',
  VariantPropertyType.dataCaptureConfig: 'DataCaptureConfig',
};

VpcConfig _$VpcConfigFromJson(Map<String, dynamic> json) {
  return VpcConfig(
    securityGroupIds: (json['SecurityGroupIds'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    subnets:
        (json['Subnets'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$VpcConfigToJson(VpcConfig instance) => <String, dynamic>{
      'SecurityGroupIds': instance.securityGroupIds,
      'Subnets': instance.subnets,
    };

Workforce _$WorkforceFromJson(Map<String, dynamic> json) {
  return Workforce(
    workforceArn: json['WorkforceArn'] as String,
    workforceName: json['WorkforceName'] as String,
    cognitoConfig: json['CognitoConfig'] == null
        ? null
        : CognitoConfig.fromJson(json['CognitoConfig'] as Map<String, dynamic>),
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedDate']),
    oidcConfig: json['OidcConfig'] == null
        ? null
        : OidcConfigForResponse.fromJson(
            json['OidcConfig'] as Map<String, dynamic>),
    sourceIpConfig: json['SourceIpConfig'] == null
        ? null
        : SourceIpConfig.fromJson(
            json['SourceIpConfig'] as Map<String, dynamic>),
    subDomain: json['SubDomain'] as String?,
  );
}

Workteam _$WorkteamFromJson(Map<String, dynamic> json) {
  return Workteam(
    description: json['Description'] as String,
    memberDefinitions: (json['MemberDefinitions'] as List<dynamic>)
        .map((e) => MemberDefinition.fromJson(e as Map<String, dynamic>))
        .toList(),
    workteamArn: json['WorkteamArn'] as String,
    workteamName: json['WorkteamName'] as String,
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedDate']),
    notificationConfiguration: json['NotificationConfiguration'] == null
        ? null
        : NotificationConfiguration.fromJson(
            json['NotificationConfiguration'] as Map<String, dynamic>),
    productListingIds: (json['ProductListingIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    subDomain: json['SubDomain'] as String?,
    workforceArn: json['WorkforceArn'] as String?,
  );
}
