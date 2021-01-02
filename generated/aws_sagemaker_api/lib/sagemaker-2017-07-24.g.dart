// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sagemaker-2017-07-24.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTagsOutput _$AddTagsOutputFromJson(Map<String, dynamic> json) {
  return AddTagsOutput(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AlgorithmSpecification _$AlgorithmSpecificationFromJson(
    Map<String, dynamic> json) {
  return AlgorithmSpecification(
    trainingInputMode: _$enumDecodeNullable(
        _$TrainingInputModeEnumMap, json['TrainingInputMode']),
    algorithmName: json['AlgorithmName'] as String,
    enableSageMakerMetricsTimeSeries:
        json['EnableSageMakerMetricsTimeSeries'] as bool,
    metricDefinitions: (json['MetricDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : MetricDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trainingImage: json['TrainingImage'] as String,
  );
}

Map<String, dynamic> _$AlgorithmSpecificationToJson(
    AlgorithmSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TrainingInputMode',
      _$TrainingInputModeEnumMap[instance.trainingInputMode]);
  writeNotNull('AlgorithmName', instance.algorithmName);
  writeNotNull('EnableSageMakerMetricsTimeSeries',
      instance.enableSageMakerMetricsTimeSeries);
  writeNotNull('MetricDefinitions',
      instance.metricDefinitions?.map((e) => e?.toJson())?.toList());
  writeNotNull('TrainingImage', instance.trainingImage);
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

const _$TrainingInputModeEnumMap = {
  TrainingInputMode.pipe: 'Pipe',
  TrainingInputMode.file: 'File',
};

AlgorithmStatusDetails _$AlgorithmStatusDetailsFromJson(
    Map<String, dynamic> json) {
  return AlgorithmStatusDetails(
    imageScanStatuses: (json['ImageScanStatuses'] as List)
        ?.map((e) => e == null
            ? null
            : AlgorithmStatusItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    validationStatuses: (json['ValidationStatuses'] as List)
        ?.map((e) => e == null
            ? null
            : AlgorithmStatusItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AlgorithmStatusItem _$AlgorithmStatusItemFromJson(Map<String, dynamic> json) {
  return AlgorithmStatusItem(
    name: json['Name'] as String,
    status:
        _$enumDecodeNullable(_$DetailedAlgorithmStatusEnumMap, json['Status']),
    failureReason: json['FailureReason'] as String,
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
        _$enumDecodeNullable(_$AlgorithmStatusEnumMap, json['AlgorithmStatus']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    algorithmDescription: json['AlgorithmDescription'] as String,
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
    trainingJobDefinition: json['TrainingJobDefinition'] == null
        ? null
        : TrainingJobDefinition.fromJson(
            json['TrainingJobDefinition'] as Map<String, dynamic>),
    transformJobDefinition: json['TransformJobDefinition'] == null
        ? null
        : TransformJobDefinition.fromJson(
            json['TransformJobDefinition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AlgorithmValidationProfileToJson(
    AlgorithmValidationProfile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProfileName', instance.profileName);
  writeNotNull(
      'TrainingJobDefinition', instance.trainingJobDefinition?.toJson());
  writeNotNull(
      'TransformJobDefinition', instance.transformJobDefinition?.toJson());
  return val;
}

AlgorithmValidationSpecification _$AlgorithmValidationSpecificationFromJson(
    Map<String, dynamic> json) {
  return AlgorithmValidationSpecification(
    validationProfiles: (json['ValidationProfiles'] as List)
        ?.map((e) => e == null
            ? null
            : AlgorithmValidationProfile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    validationRole: json['ValidationRole'] as String,
  );
}

Map<String, dynamic> _$AlgorithmValidationSpecificationToJson(
    AlgorithmValidationSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ValidationProfiles',
      instance.validationProfiles?.map((e) => e?.toJson())?.toList());
  writeNotNull('ValidationRole', instance.validationRole);
  return val;
}

AnnotationConsolidationConfig _$AnnotationConsolidationConfigFromJson(
    Map<String, dynamic> json) {
  return AnnotationConsolidationConfig(
    annotationConsolidationLambdaArn:
        json['AnnotationConsolidationLambdaArn'] as String,
  );
}

Map<String, dynamic> _$AnnotationConsolidationConfigToJson(
    AnnotationConsolidationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AnnotationConsolidationLambdaArn',
      instance.annotationConsolidationLambdaArn);
  return val;
}

AppDetails _$AppDetailsFromJson(Map<String, dynamic> json) {
  return AppDetails(
    appName: json['AppName'] as String,
    appType: _$enumDecodeNullable(_$AppTypeEnumMap, json['AppType']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    domainId: json['DomainId'] as String,
    status: _$enumDecodeNullable(_$AppStatusEnumMap, json['Status']),
    userProfileName: json['UserProfileName'] as String,
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

AppSpecification _$AppSpecificationFromJson(Map<String, dynamic> json) {
  return AppSpecification(
    imageUri: json['ImageUri'] as String,
    containerArguments:
        (json['ContainerArguments'] as List)?.map((e) => e as String)?.toList(),
    containerEntrypoint: (json['ContainerEntrypoint'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$AppSpecificationToJson(AppSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ImageUri', instance.imageUri);
  writeNotNull('ContainerArguments', instance.containerArguments);
  writeNotNull('ContainerEntrypoint', instance.containerEntrypoint);
  return val;
}

AssociateTrialComponentResponse _$AssociateTrialComponentResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateTrialComponentResponse(
    trialArn: json['TrialArn'] as String,
    trialComponentArn: json['TrialComponentArn'] as String,
  );
}

AutoMLCandidate _$AutoMLCandidateFromJson(Map<String, dynamic> json) {
  return AutoMLCandidate(
    candidateName: json['CandidateName'] as String,
    candidateStatus:
        _$enumDecodeNullable(_$CandidateStatusEnumMap, json['CandidateStatus']),
    candidateSteps: (json['CandidateSteps'] as List)
        ?.map((e) => e == null
            ? null
            : AutoMLCandidateStep.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    objectiveStatus:
        _$enumDecodeNullable(_$ObjectiveStatusEnumMap, json['ObjectiveStatus']),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    failureReason: json['FailureReason'] as String,
    finalAutoMLJobObjectiveMetric: json['FinalAutoMLJobObjectiveMetric'] == null
        ? null
        : FinalAutoMLJobObjectiveMetric.fromJson(
            json['FinalAutoMLJobObjectiveMetric'] as Map<String, dynamic>),
    inferenceContainers: (json['InferenceContainers'] as List)
        ?.map((e) => e == null
            ? null
            : AutoMLContainerDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
    candidateStepType: _$enumDecodeNullable(
        _$CandidateStepTypeEnumMap, json['CandidateStepType']),
  );
}

const _$CandidateStepTypeEnumMap = {
  CandidateStepType.awsSageMakerTrainingJob: 'AWS::SageMaker::TrainingJob',
  CandidateStepType.awsSageMakerTransformJob: 'AWS::SageMaker::TransformJob',
  CandidateStepType.awsSageMakerProcessingJob: 'AWS::SageMaker::ProcessingJob',
};

AutoMLChannel _$AutoMLChannelFromJson(Map<String, dynamic> json) {
  return AutoMLChannel(
    dataSource: json['DataSource'] == null
        ? null
        : AutoMLDataSource.fromJson(json['DataSource'] as Map<String, dynamic>),
    targetAttributeName: json['TargetAttributeName'] as String,
    compressionType:
        _$enumDecodeNullable(_$CompressionTypeEnumMap, json['CompressionType']),
  );
}

Map<String, dynamic> _$AutoMLChannelToJson(AutoMLChannel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSource', instance.dataSource?.toJson());
  writeNotNull('TargetAttributeName', instance.targetAttributeName);
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
    environment: (json['Environment'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

AutoMLDataSource _$AutoMLDataSourceFromJson(Map<String, dynamic> json) {
  return AutoMLDataSource(
    s3DataSource: json['S3DataSource'] == null
        ? null
        : AutoMLS3DataSource.fromJson(
            json['S3DataSource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AutoMLDataSourceToJson(AutoMLDataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3DataSource', instance.s3DataSource?.toJson());
  return val;
}

AutoMLJobArtifacts _$AutoMLJobArtifactsFromJson(Map<String, dynamic> json) {
  return AutoMLJobArtifacts(
    candidateDefinitionNotebookLocation:
        json['CandidateDefinitionNotebookLocation'] as String,
    dataExplorationNotebookLocation:
        json['DataExplorationNotebookLocation'] as String,
  );
}

AutoMLJobCompletionCriteria _$AutoMLJobCompletionCriteriaFromJson(
    Map<String, dynamic> json) {
  return AutoMLJobCompletionCriteria(
    maxAutoMLJobRuntimeInSeconds: json['MaxAutoMLJobRuntimeInSeconds'] as int,
    maxCandidates: json['MaxCandidates'] as int,
    maxRuntimePerTrainingJobInSeconds:
        json['MaxRuntimePerTrainingJobInSeconds'] as int,
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
    metricName:
        _$enumDecodeNullable(_$AutoMLMetricEnumEnumMap, json['MetricName']),
  );
}

Map<String, dynamic> _$AutoMLJobObjectiveToJson(AutoMLJobObjective instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MetricName', _$AutoMLMetricEnumEnumMap[instance.metricName]);
  return val;
}

const _$AutoMLMetricEnumEnumMap = {
  AutoMLMetricEnum.accuracy: 'Accuracy',
  AutoMLMetricEnum.mse: 'MSE',
  AutoMLMetricEnum.f1: 'F1',
  AutoMLMetricEnum.f1macro: 'F1macro',
};

AutoMLJobSummary _$AutoMLJobSummaryFromJson(Map<String, dynamic> json) {
  return AutoMLJobSummary(
    autoMLJobArn: json['AutoMLJobArn'] as String,
    autoMLJobName: json['AutoMLJobName'] as String,
    autoMLJobSecondaryStatus: _$enumDecodeNullable(
        _$AutoMLJobSecondaryStatusEnumMap, json['AutoMLJobSecondaryStatus']),
    autoMLJobStatus:
        _$enumDecodeNullable(_$AutoMLJobStatusEnumMap, json['AutoMLJobStatus']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    failureReason: json['FailureReason'] as String,
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
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$AutoMLOutputDataConfigToJson(
    AutoMLOutputDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3OutputPath', instance.s3OutputPath);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

AutoMLS3DataSource _$AutoMLS3DataSourceFromJson(Map<String, dynamic> json) {
  return AutoMLS3DataSource(
    s3DataType:
        _$enumDecodeNullable(_$AutoMLS3DataTypeEnumMap, json['S3DataType']),
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$AutoMLS3DataSourceToJson(AutoMLS3DataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3DataType', _$AutoMLS3DataTypeEnumMap[instance.s3DataType]);
  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

const _$AutoMLS3DataTypeEnumMap = {
  AutoMLS3DataType.manifestFile: 'ManifestFile',
  AutoMLS3DataType.s3Prefix: 'S3Prefix',
};

AutoMLSecurityConfig _$AutoMLSecurityConfigFromJson(Map<String, dynamic> json) {
  return AutoMLSecurityConfig(
    enableInterContainerTrafficEncryption:
        json['EnableInterContainerTrafficEncryption'] as bool,
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
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

CaptureContentTypeHeader _$CaptureContentTypeHeaderFromJson(
    Map<String, dynamic> json) {
  return CaptureContentTypeHeader(
    csvContentTypes:
        (json['CsvContentTypes'] as List)?.map((e) => e as String)?.toList(),
    jsonContentTypes:
        (json['JsonContentTypes'] as List)?.map((e) => e as String)?.toList(),
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
    captureMode:
        _$enumDecodeNullable(_$CaptureModeEnumMap, json['CaptureMode']),
  );
}

Map<String, dynamic> _$CaptureOptionToJson(CaptureOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CaptureMode', _$CaptureModeEnumMap[instance.captureMode]);
  return val;
}

const _$CaptureModeEnumMap = {
  CaptureMode.input: 'Input',
  CaptureMode.output: 'Output',
};

CategoricalParameterRange _$CategoricalParameterRangeFromJson(
    Map<String, dynamic> json) {
  return CategoricalParameterRange(
    name: json['Name'] as String,
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CategoricalParameterRangeToJson(
    CategoricalParameterRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Values', instance.values);
  return val;
}

CategoricalParameterRangeSpecification
    _$CategoricalParameterRangeSpecificationFromJson(
        Map<String, dynamic> json) {
  return CategoricalParameterRangeSpecification(
    values: (json['Values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CategoricalParameterRangeSpecificationToJson(
    CategoricalParameterRangeSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Values', instance.values);
  return val;
}

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel(
    channelName: json['ChannelName'] as String,
    dataSource: json['DataSource'] == null
        ? null
        : DataSource.fromJson(json['DataSource'] as Map<String, dynamic>),
    compressionType:
        _$enumDecodeNullable(_$CompressionTypeEnumMap, json['CompressionType']),
    contentType: json['ContentType'] as String,
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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChannelName', instance.channelName);
  writeNotNull('DataSource', instance.dataSource?.toJson());
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
    supportedContentTypes: (json['SupportedContentTypes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    supportedInputModes: (json['SupportedInputModes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TrainingInputModeEnumMap, e))
        ?.toList(),
    description: json['Description'] as String,
    isRequired: json['IsRequired'] as bool,
    supportedCompressionTypes: (json['SupportedCompressionTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$CompressionTypeEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$ChannelSpecificationToJson(
    ChannelSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('SupportedContentTypes', instance.supportedContentTypes);
  writeNotNull(
      'SupportedInputModes',
      instance.supportedInputModes
          ?.map((e) => _$TrainingInputModeEnumMap[e])
          ?.toList());
  writeNotNull('Description', instance.description);
  writeNotNull('IsRequired', instance.isRequired);
  writeNotNull(
      'SupportedCompressionTypes',
      instance.supportedCompressionTypes
          ?.map((e) => _$CompressionTypeEnumMap[e])
          ?.toList());
  return val;
}

CheckpointConfig _$CheckpointConfigFromJson(Map<String, dynamic> json) {
  return CheckpointConfig(
    s3Uri: json['S3Uri'] as String,
    localPath: json['LocalPath'] as String,
  );
}

Map<String, dynamic> _$CheckpointConfigToJson(CheckpointConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Uri', instance.s3Uri);
  writeNotNull('LocalPath', instance.localPath);
  return val;
}

CodeRepositorySummary _$CodeRepositorySummaryFromJson(
    Map<String, dynamic> json) {
  return CodeRepositorySummary(
    codeRepositoryArn: json['CodeRepositoryArn'] as String,
    codeRepositoryName: json['CodeRepositoryName'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    gitConfig: json['GitConfig'] == null
        ? null
        : GitConfig.fromJson(json['GitConfig'] as Map<String, dynamic>),
  );
}

CognitoMemberDefinition _$CognitoMemberDefinitionFromJson(
    Map<String, dynamic> json) {
  return CognitoMemberDefinition(
    clientId: json['ClientId'] as String,
    userGroup: json['UserGroup'] as String,
    userPool: json['UserPool'] as String,
  );
}

Map<String, dynamic> _$CognitoMemberDefinitionToJson(
    CognitoMemberDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClientId', instance.clientId);
  writeNotNull('UserGroup', instance.userGroup);
  writeNotNull('UserPool', instance.userPool);
  return val;
}

CollectionConfiguration _$CollectionConfigurationFromJson(
    Map<String, dynamic> json) {
  return CollectionConfiguration(
    collectionName: json['CollectionName'] as String,
    collectionParameters:
        (json['CollectionParameters'] as Map<String, dynamic>)?.map(
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
    compilationJobStatus: _$enumDecodeNullable(
        _$CompilationJobStatusEnumMap, json['CompilationJobStatus']),
    compilationTargetDevice: _$enumDecodeNullable(
        _$TargetDeviceEnumMap, json['CompilationTargetDevice']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    compilationEndTime:
        const UnixDateTimeConverter().fromJson(json['CompilationEndTime']),
    compilationStartTime:
        const UnixDateTimeConverter().fromJson(json['CompilationStartTime']),
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
};

ContainerDefinition _$ContainerDefinitionFromJson(Map<String, dynamic> json) {
  return ContainerDefinition(
    containerHostname: json['ContainerHostname'] as String,
    environment: (json['Environment'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    image: json['Image'] as String,
    mode: _$enumDecodeNullable(_$ContainerModeEnumMap, json['Mode']),
    modelDataUrl: json['ModelDataUrl'] as String,
    modelPackageName: json['ModelPackageName'] as String,
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
  writeNotNull('Mode', _$ContainerModeEnumMap[instance.mode]);
  writeNotNull('ModelDataUrl', instance.modelDataUrl);
  writeNotNull('ModelPackageName', instance.modelPackageName);
  return val;
}

const _$ContainerModeEnumMap = {
  ContainerMode.singleModel: 'SingleModel',
  ContainerMode.multiModel: 'MultiModel',
};

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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxValue', instance.maxValue);
  writeNotNull('MinValue', instance.minValue);
  writeNotNull('Name', instance.name);
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
    ContinuousParameterRangeSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxValue', instance.maxValue);
  writeNotNull('MinValue', instance.minValue);
  return val;
}

CreateAlgorithmOutput _$CreateAlgorithmOutputFromJson(
    Map<String, dynamic> json) {
  return CreateAlgorithmOutput(
    algorithmArn: json['AlgorithmArn'] as String,
  );
}

CreateAppResponse _$CreateAppResponseFromJson(Map<String, dynamic> json) {
  return CreateAppResponse(
    appArn: json['AppArn'] as String,
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

CreateDomainResponse _$CreateDomainResponseFromJson(Map<String, dynamic> json) {
  return CreateDomainResponse(
    domainArn: json['DomainArn'] as String,
    url: json['Url'] as String,
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
    experimentArn: json['ExperimentArn'] as String,
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

CreateLabelingJobResponse _$CreateLabelingJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateLabelingJobResponse(
    labelingJobArn: json['LabelingJobArn'] as String,
  );
}

CreateModelOutput _$CreateModelOutputFromJson(Map<String, dynamic> json) {
  return CreateModelOutput(
    modelArn: json['ModelArn'] as String,
  );
}

CreateModelPackageOutput _$CreateModelPackageOutputFromJson(
    Map<String, dynamic> json) {
  return CreateModelPackageOutput(
    modelPackageArn: json['ModelPackageArn'] as String,
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
        json['NotebookInstanceLifecycleConfigArn'] as String,
  );
}

CreateNotebookInstanceOutput _$CreateNotebookInstanceOutputFromJson(
    Map<String, dynamic> json) {
  return CreateNotebookInstanceOutput(
    notebookInstanceArn: json['NotebookInstanceArn'] as String,
  );
}

CreatePresignedDomainUrlResponse _$CreatePresignedDomainUrlResponseFromJson(
    Map<String, dynamic> json) {
  return CreatePresignedDomainUrlResponse(
    authorizedUrl: json['AuthorizedUrl'] as String,
  );
}

CreatePresignedNotebookInstanceUrlOutput
    _$CreatePresignedNotebookInstanceUrlOutputFromJson(
        Map<String, dynamic> json) {
  return CreatePresignedNotebookInstanceUrlOutput(
    authorizedUrl: json['AuthorizedUrl'] as String,
  );
}

CreateProcessingJobResponse _$CreateProcessingJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProcessingJobResponse(
    processingJobArn: json['ProcessingJobArn'] as String,
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
    trialComponentArn: json['TrialComponentArn'] as String,
  );
}

CreateTrialResponse _$CreateTrialResponseFromJson(Map<String, dynamic> json) {
  return CreateTrialResponse(
    trialArn: json['TrialArn'] as String,
  );
}

CreateUserProfileResponse _$CreateUserProfileResponseFromJson(
    Map<String, dynamic> json) {
  return CreateUserProfileResponse(
    userProfileArn: json['UserProfileArn'] as String,
  );
}

CreateWorkteamResponse _$CreateWorkteamResponseFromJson(
    Map<String, dynamic> json) {
  return CreateWorkteamResponse(
    workteamArn: json['WorkteamArn'] as String,
  );
}

DataCaptureConfig _$DataCaptureConfigFromJson(Map<String, dynamic> json) {
  return DataCaptureConfig(
    captureOptions: (json['CaptureOptions'] as List)
        ?.map((e) => e == null
            ? null
            : CaptureOption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    destinationS3Uri: json['DestinationS3Uri'] as String,
    initialSamplingPercentage: json['InitialSamplingPercentage'] as int,
    captureContentTypeHeader: json['CaptureContentTypeHeader'] == null
        ? null
        : CaptureContentTypeHeader.fromJson(
            json['CaptureContentTypeHeader'] as Map<String, dynamic>),
    enableCapture: json['EnableCapture'] as bool,
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$DataCaptureConfigToJson(DataCaptureConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CaptureOptions',
      instance.captureOptions?.map((e) => e?.toJson())?.toList());
  writeNotNull('DestinationS3Uri', instance.destinationS3Uri);
  writeNotNull('InitialSamplingPercentage', instance.initialSamplingPercentage);
  writeNotNull(
      'CaptureContentTypeHeader', instance.captureContentTypeHeader?.toJson());
  writeNotNull('EnableCapture', instance.enableCapture);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

DataCaptureConfigSummary _$DataCaptureConfigSummaryFromJson(
    Map<String, dynamic> json) {
  return DataCaptureConfigSummary(
    captureStatus:
        _$enumDecodeNullable(_$CaptureStatusEnumMap, json['CaptureStatus']),
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

DataProcessing _$DataProcessingFromJson(Map<String, dynamic> json) {
  return DataProcessing(
    inputFilter: json['InputFilter'] as String,
    joinSource: _$enumDecodeNullable(_$JoinSourceEnumMap, json['JoinSource']),
    outputFilter: json['OutputFilter'] as String,
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

DebugHookConfig _$DebugHookConfigFromJson(Map<String, dynamic> json) {
  return DebugHookConfig(
    s3OutputPath: json['S3OutputPath'] as String,
    collectionConfigurations: (json['CollectionConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : CollectionConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hookParameters: (json['HookParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    localPath: json['LocalPath'] as String,
  );
}

Map<String, dynamic> _$DebugHookConfigToJson(DebugHookConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3OutputPath', instance.s3OutputPath);
  writeNotNull('CollectionConfigurations',
      instance.collectionConfigurations?.map((e) => e?.toJson())?.toList());
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
    localPath: json['LocalPath'] as String,
    ruleParameters: (json['RuleParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    s3OutputPath: json['S3OutputPath'] as String,
    volumeSizeInGB: json['VolumeSizeInGB'] as int,
  );
}

Map<String, dynamic> _$DebugRuleConfigurationToJson(
    DebugRuleConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RuleConfigurationName', instance.ruleConfigurationName);
  writeNotNull('RuleEvaluatorImage', instance.ruleEvaluatorImage);
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
    ruleConfigurationName: json['RuleConfigurationName'] as String,
    ruleEvaluationJobArn: json['RuleEvaluationJobArn'] as String,
    ruleEvaluationStatus: _$enumDecodeNullable(
        _$RuleEvaluationStatusEnumMap, json['RuleEvaluationStatus']),
    statusDetails: json['StatusDetails'] as String,
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

DeleteExperimentResponse _$DeleteExperimentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteExperimentResponse(
    experimentArn: json['ExperimentArn'] as String,
  );
}

DeleteFlowDefinitionResponse _$DeleteFlowDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteFlowDefinitionResponse();
}

DeleteTagsOutput _$DeleteTagsOutputFromJson(Map<String, dynamic> json) {
  return DeleteTagsOutput();
}

DeleteTrialComponentResponse _$DeleteTrialComponentResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteTrialComponentResponse(
    trialComponentArn: json['TrialComponentArn'] as String,
  );
}

DeleteTrialResponse _$DeleteTrialResponseFromJson(Map<String, dynamic> json) {
  return DeleteTrialResponse(
    trialArn: json['TrialArn'] as String,
  );
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
    resolvedImage: json['ResolvedImage'] as String,
    specifiedImage: json['SpecifiedImage'] as String,
  );
}

DescribeAlgorithmOutput _$DescribeAlgorithmOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeAlgorithmOutput(
    algorithmArn: json['AlgorithmArn'] as String,
    algorithmName: json['AlgorithmName'] as String,
    algorithmStatus:
        _$enumDecodeNullable(_$AlgorithmStatusEnumMap, json['AlgorithmStatus']),
    algorithmStatusDetails: json['AlgorithmStatusDetails'] == null
        ? null
        : AlgorithmStatusDetails.fromJson(
            json['AlgorithmStatusDetails'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    trainingSpecification: json['TrainingSpecification'] == null
        ? null
        : TrainingSpecification.fromJson(
            json['TrainingSpecification'] as Map<String, dynamic>),
    algorithmDescription: json['AlgorithmDescription'] as String,
    certifyForMarketplace: json['CertifyForMarketplace'] as bool,
    inferenceSpecification: json['InferenceSpecification'] == null
        ? null
        : InferenceSpecification.fromJson(
            json['InferenceSpecification'] as Map<String, dynamic>),
    productId: json['ProductId'] as String,
    validationSpecification: json['ValidationSpecification'] == null
        ? null
        : AlgorithmValidationSpecification.fromJson(
            json['ValidationSpecification'] as Map<String, dynamic>),
  );
}

DescribeAppResponse _$DescribeAppResponseFromJson(Map<String, dynamic> json) {
  return DescribeAppResponse(
    appArn: json['AppArn'] as String,
    appName: json['AppName'] as String,
    appType: _$enumDecodeNullable(_$AppTypeEnumMap, json['AppType']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    domainId: json['DomainId'] as String,
    failureReason: json['FailureReason'] as String,
    lastHealthCheckTimestamp: const UnixDateTimeConverter()
        .fromJson(json['LastHealthCheckTimestamp']),
    lastUserActivityTimestamp: const UnixDateTimeConverter()
        .fromJson(json['LastUserActivityTimestamp']),
    resourceSpec: json['ResourceSpec'] == null
        ? null
        : ResourceSpec.fromJson(json['ResourceSpec'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$AppStatusEnumMap, json['Status']),
    userProfileName: json['UserProfileName'] as String,
  );
}

DescribeAutoMLJobResponse _$DescribeAutoMLJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAutoMLJobResponse(
    autoMLJobArn: json['AutoMLJobArn'] as String,
    autoMLJobName: json['AutoMLJobName'] as String,
    autoMLJobSecondaryStatus: _$enumDecodeNullable(
        _$AutoMLJobSecondaryStatusEnumMap, json['AutoMLJobSecondaryStatus']),
    autoMLJobStatus:
        _$enumDecodeNullable(_$AutoMLJobStatusEnumMap, json['AutoMLJobStatus']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    inputDataConfig: (json['InputDataConfig'] as List)
        ?.map((e) => e == null
            ? null
            : AutoMLChannel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : AutoMLOutputDataConfig.fromJson(
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
    failureReason: json['FailureReason'] as String,
    generateCandidateDefinitionsOnly:
        json['GenerateCandidateDefinitionsOnly'] as bool,
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
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
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
    compilationJobStatus: _$enumDecodeNullable(
        _$CompilationJobStatusEnumMap, json['CompilationJobStatus']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    failureReason: json['FailureReason'] as String,
    inputConfig: json['InputConfig'] == null
        ? null
        : InputConfig.fromJson(json['InputConfig'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    modelArtifacts: json['ModelArtifacts'] == null
        ? null
        : ModelArtifacts.fromJson(
            json['ModelArtifacts'] as Map<String, dynamic>),
    outputConfig: json['OutputConfig'] == null
        ? null
        : OutputConfig.fromJson(json['OutputConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : StoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
    compilationEndTime:
        const UnixDateTimeConverter().fromJson(json['CompilationEndTime']),
    compilationStartTime:
        const UnixDateTimeConverter().fromJson(json['CompilationStartTime']),
  );
}

DescribeDomainResponse _$DescribeDomainResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDomainResponse(
    authMode: _$enumDecodeNullable(_$AuthModeEnumMap, json['AuthMode']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    defaultUserSettings: json['DefaultUserSettings'] == null
        ? null
        : UserSettings.fromJson(
            json['DefaultUserSettings'] as Map<String, dynamic>),
    domainArn: json['DomainArn'] as String,
    domainId: json['DomainId'] as String,
    domainName: json['DomainName'] as String,
    failureReason: json['FailureReason'] as String,
    homeEfsFileSystemId: json['HomeEfsFileSystemId'] as String,
    homeEfsFileSystemKmsKeyId: json['HomeEfsFileSystemKmsKeyId'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    singleSignOnManagedApplicationInstanceId:
        json['SingleSignOnManagedApplicationInstanceId'] as String,
    status: _$enumDecodeNullable(_$DomainStatusEnumMap, json['Status']),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    url: json['Url'] as String,
    vpcId: json['VpcId'] as String,
  );
}

const _$AuthModeEnumMap = {
  AuthMode.sso: 'SSO',
  AuthMode.iam: 'IAM',
};

const _$DomainStatusEnumMap = {
  DomainStatus.deleting: 'Deleting',
  DomainStatus.failed: 'Failed',
  DomainStatus.inService: 'InService',
  DomainStatus.pending: 'Pending',
};

DescribeEndpointConfigOutput _$DescribeEndpointConfigOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointConfigOutput(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    endpointConfigArn: json['EndpointConfigArn'] as String,
    endpointConfigName: json['EndpointConfigName'] as String,
    productionVariants: (json['ProductionVariants'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionVariant.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dataCaptureConfig: json['DataCaptureConfig'] == null
        ? null
        : DataCaptureConfig.fromJson(
            json['DataCaptureConfig'] as Map<String, dynamic>),
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

DescribeEndpointOutput _$DescribeEndpointOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointOutput(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    endpointArn: json['EndpointArn'] as String,
    endpointConfigName: json['EndpointConfigName'] as String,
    endpointName: json['EndpointName'] as String,
    endpointStatus:
        _$enumDecodeNullable(_$EndpointStatusEnumMap, json['EndpointStatus']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    dataCaptureConfig: json['DataCaptureConfig'] == null
        ? null
        : DataCaptureConfigSummary.fromJson(
            json['DataCaptureConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String,
    productionVariants: (json['ProductionVariants'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionVariantSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
    description: json['Description'] as String,
    displayName: json['DisplayName'] as String,
    experimentArn: json['ExperimentArn'] as String,
    experimentName: json['ExperimentName'] as String,
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

DescribeFlowDefinitionResponse _$DescribeFlowDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeFlowDefinitionResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    flowDefinitionArn: json['FlowDefinitionArn'] as String,
    flowDefinitionName: json['FlowDefinitionName'] as String,
    flowDefinitionStatus: _$enumDecodeNullable(
        _$FlowDefinitionStatusEnumMap, json['FlowDefinitionStatus']),
    humanLoopConfig: json['HumanLoopConfig'] == null
        ? null
        : HumanLoopConfig.fromJson(
            json['HumanLoopConfig'] as Map<String, dynamic>),
    outputConfig: json['OutputConfig'] == null
        ? null
        : FlowDefinitionOutputConfig.fromJson(
            json['OutputConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    failureReason: json['FailureReason'] as String,
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
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    humanTaskUiArn: json['HumanTaskUiArn'] as String,
    humanTaskUiName: json['HumanTaskUiName'] as String,
    uiTemplate: json['UiTemplate'] == null
        ? null
        : UiTemplateInfo.fromJson(json['UiTemplate'] as Map<String, dynamic>),
  );
}

DescribeHyperParameterTuningJobResponse
    _$DescribeHyperParameterTuningJobResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeHyperParameterTuningJobResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    hyperParameterTuningJobArn: json['HyperParameterTuningJobArn'] as String,
    hyperParameterTuningJobConfig: json['HyperParameterTuningJobConfig'] == null
        ? null
        : HyperParameterTuningJobConfig.fromJson(
            json['HyperParameterTuningJobConfig'] as Map<String, dynamic>),
    hyperParameterTuningJobName: json['HyperParameterTuningJobName'] as String,
    hyperParameterTuningJobStatus: _$enumDecodeNullable(
        _$HyperParameterTuningJobStatusEnumMap,
        json['HyperParameterTuningJobStatus']),
    objectiveStatusCounters: json['ObjectiveStatusCounters'] == null
        ? null
        : ObjectiveStatusCounters.fromJson(
            json['ObjectiveStatusCounters'] as Map<String, dynamic>),
    trainingJobStatusCounters: json['TrainingJobStatusCounters'] == null
        ? null
        : TrainingJobStatusCounters.fromJson(
            json['TrainingJobStatusCounters'] as Map<String, dynamic>),
    bestTrainingJob: json['BestTrainingJob'] == null
        ? null
        : HyperParameterTrainingJobSummary.fromJson(
            json['BestTrainingJob'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String,
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
    trainingJobDefinitions: (json['TrainingJobDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : HyperParameterTrainingJobDefinition.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
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

DescribeLabelingJobResponse _$DescribeLabelingJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeLabelingJobResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    humanTaskConfig: json['HumanTaskConfig'] == null
        ? null
        : HumanTaskConfig.fromJson(
            json['HumanTaskConfig'] as Map<String, dynamic>),
    inputConfig: json['InputConfig'] == null
        ? null
        : LabelingJobInputConfig.fromJson(
            json['InputConfig'] as Map<String, dynamic>),
    jobReferenceCode: json['JobReferenceCode'] as String,
    labelCounters: json['LabelCounters'] == null
        ? null
        : LabelCounters.fromJson(json['LabelCounters'] as Map<String, dynamic>),
    labelingJobArn: json['LabelingJobArn'] as String,
    labelingJobName: json['LabelingJobName'] as String,
    labelingJobStatus: _$enumDecodeNullable(
        _$LabelingJobStatusEnumMap, json['LabelingJobStatus']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    outputConfig: json['OutputConfig'] == null
        ? null
        : LabelingJobOutputConfig.fromJson(
            json['OutputConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    failureReason: json['FailureReason'] as String,
    labelAttributeName: json['LabelAttributeName'] as String,
    labelCategoryConfigS3Uri: json['LabelCategoryConfigS3Uri'] as String,
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
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$LabelingJobStatusEnumMap = {
  LabelingJobStatus.inProgress: 'InProgress',
  LabelingJobStatus.completed: 'Completed',
  LabelingJobStatus.failed: 'Failed',
  LabelingJobStatus.stopping: 'Stopping',
  LabelingJobStatus.stopped: 'Stopped',
};

DescribeModelOutput _$DescribeModelOutputFromJson(Map<String, dynamic> json) {
  return DescribeModelOutput(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    executionRoleArn: json['ExecutionRoleArn'] as String,
    modelArn: json['ModelArn'] as String,
    modelName: json['ModelName'] as String,
    containers: (json['Containers'] as List)
        ?.map((e) => e == null
            ? null
            : ContainerDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    enableNetworkIsolation: json['EnableNetworkIsolation'] as bool,
    primaryContainer: json['PrimaryContainer'] == null
        ? null
        : ContainerDefinition.fromJson(
            json['PrimaryContainer'] as Map<String, dynamic>),
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

DescribeModelPackageOutput _$DescribeModelPackageOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeModelPackageOutput(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    modelPackageArn: json['ModelPackageArn'] as String,
    modelPackageName: json['ModelPackageName'] as String,
    modelPackageStatus: _$enumDecodeNullable(
        _$ModelPackageStatusEnumMap, json['ModelPackageStatus']),
    modelPackageStatusDetails: json['ModelPackageStatusDetails'] == null
        ? null
        : ModelPackageStatusDetails.fromJson(
            json['ModelPackageStatusDetails'] as Map<String, dynamic>),
    certifyForMarketplace: json['CertifyForMarketplace'] as bool,
    inferenceSpecification: json['InferenceSpecification'] == null
        ? null
        : InferenceSpecification.fromJson(
            json['InferenceSpecification'] as Map<String, dynamic>),
    modelPackageDescription: json['ModelPackageDescription'] as String,
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

DescribeMonitoringScheduleResponse _$DescribeMonitoringScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeMonitoringScheduleResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    monitoringScheduleArn: json['MonitoringScheduleArn'] as String,
    monitoringScheduleConfig: json['MonitoringScheduleConfig'] == null
        ? null
        : MonitoringScheduleConfig.fromJson(
            json['MonitoringScheduleConfig'] as Map<String, dynamic>),
    monitoringScheduleName: json['MonitoringScheduleName'] as String,
    monitoringScheduleStatus: _$enumDecodeNullable(
        _$ScheduleStatusEnumMap, json['MonitoringScheduleStatus']),
    endpointName: json['EndpointName'] as String,
    failureReason: json['FailureReason'] as String,
    lastMonitoringExecutionSummary:
        json['LastMonitoringExecutionSummary'] == null
            ? null
            : MonitoringExecutionSummary.fromJson(
                json['LastMonitoringExecutionSummary'] as Map<String, dynamic>),
  );
}

const _$ScheduleStatusEnumMap = {
  ScheduleStatus.pending: 'Pending',
  ScheduleStatus.failed: 'Failed',
  ScheduleStatus.scheduled: 'Scheduled',
  ScheduleStatus.stopped: 'Stopped',
};

DescribeNotebookInstanceLifecycleConfigOutput
    _$DescribeNotebookInstanceLifecycleConfigOutputFromJson(
        Map<String, dynamic> json) {
  return DescribeNotebookInstanceLifecycleConfigOutput(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    notebookInstanceLifecycleConfigArn:
        json['NotebookInstanceLifecycleConfigArn'] as String,
    notebookInstanceLifecycleConfigName:
        json['NotebookInstanceLifecycleConfigName'] as String,
    onCreate: (json['OnCreate'] as List)
        ?.map((e) => e == null
            ? null
            : NotebookInstanceLifecycleHook.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    onStart: (json['OnStart'] as List)
        ?.map((e) => e == null
            ? null
            : NotebookInstanceLifecycleHook.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeNotebookInstanceOutput _$DescribeNotebookInstanceOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeNotebookInstanceOutput(
    acceleratorTypes: (json['AcceleratorTypes'] as List)
        ?.map((e) =>
            _$enumDecodeNullable(_$NotebookInstanceAcceleratorTypeEnumMap, e))
        ?.toList(),
    additionalCodeRepositories: (json['AdditionalCodeRepositories'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    defaultCodeRepository: json['DefaultCodeRepository'] as String,
    directInternetAccess: _$enumDecodeNullable(
        _$DirectInternetAccessEnumMap, json['DirectInternetAccess']),
    failureReason: json['FailureReason'] as String,
    instanceType:
        _$enumDecodeNullable(_$InstanceTypeEnumMap, json['InstanceType']),
    kmsKeyId: json['KmsKeyId'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    networkInterfaceId: json['NetworkInterfaceId'] as String,
    notebookInstanceArn: json['NotebookInstanceArn'] as String,
    notebookInstanceLifecycleConfigName:
        json['NotebookInstanceLifecycleConfigName'] as String,
    notebookInstanceName: json['NotebookInstanceName'] as String,
    notebookInstanceStatus: _$enumDecodeNullable(
        _$NotebookInstanceStatusEnumMap, json['NotebookInstanceStatus']),
    roleArn: json['RoleArn'] as String,
    rootAccess: _$enumDecodeNullable(_$RootAccessEnumMap, json['RootAccess']),
    securityGroups:
        (json['SecurityGroups'] as List)?.map((e) => e as String)?.toList(),
    subnetId: json['SubnetId'] as String,
    url: json['Url'] as String,
    volumeSizeInGB: json['VolumeSizeInGB'] as int,
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

DescribeProcessingJobResponse _$DescribeProcessingJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProcessingJobResponse(
    appSpecification: json['AppSpecification'] == null
        ? null
        : AppSpecification.fromJson(
            json['AppSpecification'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    processingJobArn: json['ProcessingJobArn'] as String,
    processingJobName: json['ProcessingJobName'] as String,
    processingJobStatus: _$enumDecodeNullable(
        _$ProcessingJobStatusEnumMap, json['ProcessingJobStatus']),
    processingResources: json['ProcessingResources'] == null
        ? null
        : ProcessingResources.fromJson(
            json['ProcessingResources'] as Map<String, dynamic>),
    autoMLJobArn: json['AutoMLJobArn'] as String,
    environment: (json['Environment'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    exitMessage: json['ExitMessage'] as String,
    experimentConfig: json['ExperimentConfig'] == null
        ? null
        : ExperimentConfig.fromJson(
            json['ExperimentConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    monitoringScheduleArn: json['MonitoringScheduleArn'] as String,
    networkConfig: json['NetworkConfig'] == null
        ? null
        : NetworkConfig.fromJson(json['NetworkConfig'] as Map<String, dynamic>),
    processingEndTime:
        const UnixDateTimeConverter().fromJson(json['ProcessingEndTime']),
    processingInputs: (json['ProcessingInputs'] as List)
        ?.map((e) => e == null
            ? null
            : ProcessingInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processingOutputConfig: json['ProcessingOutputConfig'] == null
        ? null
        : ProcessingOutputConfig.fromJson(
            json['ProcessingOutputConfig'] as Map<String, dynamic>),
    processingStartTime:
        const UnixDateTimeConverter().fromJson(json['ProcessingStartTime']),
    roleArn: json['RoleArn'] as String,
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : ProcessingStoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
    trainingJobArn: json['TrainingJobArn'] as String,
  );
}

const _$ProcessingJobStatusEnumMap = {
  ProcessingJobStatus.inProgress: 'InProgress',
  ProcessingJobStatus.completed: 'Completed',
  ProcessingJobStatus.failed: 'Failed',
  ProcessingJobStatus.stopping: 'Stopping',
  ProcessingJobStatus.stopped: 'Stopped',
};

DescribeSubscribedWorkteamResponse _$DescribeSubscribedWorkteamResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSubscribedWorkteamResponse(
    subscribedWorkteam: json['SubscribedWorkteam'] == null
        ? null
        : SubscribedWorkteam.fromJson(
            json['SubscribedWorkteam'] as Map<String, dynamic>),
  );
}

DescribeTrainingJobResponse _$DescribeTrainingJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTrainingJobResponse(
    algorithmSpecification: json['AlgorithmSpecification'] == null
        ? null
        : AlgorithmSpecification.fromJson(
            json['AlgorithmSpecification'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    modelArtifacts: json['ModelArtifacts'] == null
        ? null
        : ModelArtifacts.fromJson(
            json['ModelArtifacts'] as Map<String, dynamic>),
    resourceConfig: json['ResourceConfig'] == null
        ? null
        : ResourceConfig.fromJson(
            json['ResourceConfig'] as Map<String, dynamic>),
    secondaryStatus:
        _$enumDecodeNullable(_$SecondaryStatusEnumMap, json['SecondaryStatus']),
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : StoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
    trainingJobArn: json['TrainingJobArn'] as String,
    trainingJobName: json['TrainingJobName'] as String,
    trainingJobStatus: _$enumDecodeNullable(
        _$TrainingJobStatusEnumMap, json['TrainingJobStatus']),
    autoMLJobArn: json['AutoMLJobArn'] as String,
    billableTimeInSeconds: json['BillableTimeInSeconds'] as int,
    checkpointConfig: json['CheckpointConfig'] == null
        ? null
        : CheckpointConfig.fromJson(
            json['CheckpointConfig'] as Map<String, dynamic>),
    debugHookConfig: json['DebugHookConfig'] == null
        ? null
        : DebugHookConfig.fromJson(
            json['DebugHookConfig'] as Map<String, dynamic>),
    debugRuleConfigurations: (json['DebugRuleConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : DebugRuleConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    debugRuleEvaluationStatuses: (json['DebugRuleEvaluationStatuses'] as List)
        ?.map((e) => e == null
            ? null
            : DebugRuleEvaluationStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    enableInterContainerTrafficEncryption:
        json['EnableInterContainerTrafficEncryption'] as bool,
    enableManagedSpotTraining: json['EnableManagedSpotTraining'] as bool,
    enableNetworkIsolation: json['EnableNetworkIsolation'] as bool,
    experimentConfig: json['ExperimentConfig'] == null
        ? null
        : ExperimentConfig.fromJson(
            json['ExperimentConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String,
    finalMetricDataList: (json['FinalMetricDataList'] as List)
        ?.map((e) =>
            e == null ? null : MetricData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hyperParameters: (json['HyperParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    inputDataConfig: (json['InputDataConfig'] as List)
        ?.map((e) =>
            e == null ? null : Channel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    labelingJobArn: json['LabelingJobArn'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    secondaryStatusTransitions: (json['SecondaryStatusTransitions'] as List)
        ?.map((e) => e == null
            ? null
            : SecondaryStatusTransition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tensorBoardOutputConfig: json['TensorBoardOutputConfig'] == null
        ? null
        : TensorBoardOutputConfig.fromJson(
            json['TensorBoardOutputConfig'] as Map<String, dynamic>),
    trainingEndTime:
        const UnixDateTimeConverter().fromJson(json['TrainingEndTime']),
    trainingStartTime:
        const UnixDateTimeConverter().fromJson(json['TrainingStartTime']),
    trainingTimeInSeconds: json['TrainingTimeInSeconds'] as int,
    tuningJobArn: json['TuningJobArn'] as String,
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
};

const _$TrainingJobStatusEnumMap = {
  TrainingJobStatus.inProgress: 'InProgress',
  TrainingJobStatus.completed: 'Completed',
  TrainingJobStatus.failed: 'Failed',
  TrainingJobStatus.stopping: 'Stopping',
  TrainingJobStatus.stopped: 'Stopped',
};

DescribeTransformJobResponse _$DescribeTransformJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTransformJobResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    modelName: json['ModelName'] as String,
    transformInput: json['TransformInput'] == null
        ? null
        : TransformInput.fromJson(
            json['TransformInput'] as Map<String, dynamic>),
    transformJobArn: json['TransformJobArn'] as String,
    transformJobName: json['TransformJobName'] as String,
    transformJobStatus: _$enumDecodeNullable(
        _$TransformJobStatusEnumMap, json['TransformJobStatus']),
    transformResources: json['TransformResources'] == null
        ? null
        : TransformResources.fromJson(
            json['TransformResources'] as Map<String, dynamic>),
    autoMLJobArn: json['AutoMLJobArn'] as String,
    batchStrategy:
        _$enumDecodeNullable(_$BatchStrategyEnumMap, json['BatchStrategy']),
    dataProcessing: json['DataProcessing'] == null
        ? null
        : DataProcessing.fromJson(
            json['DataProcessing'] as Map<String, dynamic>),
    environment: (json['Environment'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    experimentConfig: json['ExperimentConfig'] == null
        ? null
        : ExperimentConfig.fromJson(
            json['ExperimentConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String,
    labelingJobArn: json['LabelingJobArn'] as String,
    maxConcurrentTransforms: json['MaxConcurrentTransforms'] as int,
    maxPayloadInMB: json['MaxPayloadInMB'] as int,
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
    displayName: json['DisplayName'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    inputArtifacts: (json['InputArtifacts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : TrialComponentArtifact.fromJson(e as Map<String, dynamic>)),
    ),
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    metrics: (json['Metrics'] as List)
        ?.map((e) => e == null
            ? null
            : TrialComponentMetricSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outputArtifacts: (json['OutputArtifacts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : TrialComponentArtifact.fromJson(e as Map<String, dynamic>)),
    ),
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : TrialComponentParameterValue.fromJson(
                  e as Map<String, dynamic>)),
    ),
    source: json['Source'] == null
        ? null
        : TrialComponentSource.fromJson(json['Source'] as Map<String, dynamic>),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: json['Status'] == null
        ? null
        : TrialComponentStatus.fromJson(json['Status'] as Map<String, dynamic>),
    trialComponentArn: json['TrialComponentArn'] as String,
    trialComponentName: json['TrialComponentName'] as String,
  );
}

DescribeTrialResponse _$DescribeTrialResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTrialResponse(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    displayName: json['DisplayName'] as String,
    experimentName: json['ExperimentName'] as String,
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    source: json['Source'] == null
        ? null
        : TrialSource.fromJson(json['Source'] as Map<String, dynamic>),
    trialArn: json['TrialArn'] as String,
    trialName: json['TrialName'] as String,
  );
}

DescribeUserProfileResponse _$DescribeUserProfileResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeUserProfileResponse(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    domainId: json['DomainId'] as String,
    failureReason: json['FailureReason'] as String,
    homeEfsFileSystemUid: json['HomeEfsFileSystemUid'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    singleSignOnUserIdentifier: json['SingleSignOnUserIdentifier'] as String,
    singleSignOnUserValue: json['SingleSignOnUserValue'] as String,
    status: _$enumDecodeNullable(_$UserProfileStatusEnumMap, json['Status']),
    userProfileArn: json['UserProfileArn'] as String,
    userProfileName: json['UserProfileName'] as String,
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
};

DescribeWorkforceResponse _$DescribeWorkforceResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeWorkforceResponse(
    workforce: json['Workforce'] == null
        ? null
        : Workforce.fromJson(json['Workforce'] as Map<String, dynamic>),
  );
}

DescribeWorkteamResponse _$DescribeWorkteamResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeWorkteamResponse(
    workteam: json['Workteam'] == null
        ? null
        : Workteam.fromJson(json['Workteam'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DesiredWeightAndCapacityToJson(
    DesiredWeightAndCapacity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VariantName', instance.variantName);
  writeNotNull('DesiredInstanceCount', instance.desiredInstanceCount);
  writeNotNull('DesiredWeight', instance.desiredWeight);
  return val;
}

DisassociateTrialComponentResponse _$DisassociateTrialComponentResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateTrialComponentResponse(
    trialArn: json['TrialArn'] as String,
    trialComponentArn: json['TrialComponentArn'] as String,
  );
}

DomainDetails _$DomainDetailsFromJson(Map<String, dynamic> json) {
  return DomainDetails(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    domainArn: json['DomainArn'] as String,
    domainId: json['DomainId'] as String,
    domainName: json['DomainName'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    status: _$enumDecodeNullable(_$DomainStatusEnumMap, json['Status']),
    url: json['Url'] as String,
  );
}

EndpointConfigSummary _$EndpointConfigSummaryFromJson(
    Map<String, dynamic> json) {
  return EndpointConfigSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    endpointConfigArn: json['EndpointConfigArn'] as String,
    endpointConfigName: json['EndpointConfigName'] as String,
  );
}

EndpointInput _$EndpointInputFromJson(Map<String, dynamic> json) {
  return EndpointInput(
    endpointName: json['EndpointName'] as String,
    localPath: json['LocalPath'] as String,
    s3DataDistributionType: _$enumDecodeNullable(
        _$ProcessingS3DataDistributionTypeEnumMap,
        json['S3DataDistributionType']),
    s3InputMode: _$enumDecodeNullable(
        _$ProcessingS3InputModeEnumMap, json['S3InputMode']),
  );
}

Map<String, dynamic> _$EndpointInputToJson(EndpointInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndpointName', instance.endpointName);
  writeNotNull('LocalPath', instance.localPath);
  writeNotNull(
      'S3DataDistributionType',
      _$ProcessingS3DataDistributionTypeEnumMap[
          instance.s3DataDistributionType]);
  writeNotNull(
      'S3InputMode', _$ProcessingS3InputModeEnumMap[instance.s3InputMode]);
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
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    endpointArn: json['EndpointArn'] as String,
    endpointName: json['EndpointName'] as String,
    endpointStatus:
        _$enumDecodeNullable(_$EndpointStatusEnumMap, json['EndpointStatus']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
  );
}

Experiment _$ExperimentFromJson(Map<String, dynamic> json) {
  return Experiment(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    description: json['Description'] as String,
    displayName: json['DisplayName'] as String,
    experimentArn: json['ExperimentArn'] as String,
    experimentName: json['ExperimentName'] as String,
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    source: json['Source'] == null
        ? null
        : ExperimentSource.fromJson(json['Source'] as Map<String, dynamic>),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ExperimentConfig _$ExperimentConfigFromJson(Map<String, dynamic> json) {
  return ExperimentConfig(
    experimentName: json['ExperimentName'] as String,
    trialComponentDisplayName: json['TrialComponentDisplayName'] as String,
    trialName: json['TrialName'] as String,
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
    sourceType: json['SourceType'] as String,
  );
}

ExperimentSummary _$ExperimentSummaryFromJson(Map<String, dynamic> json) {
  return ExperimentSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    displayName: json['DisplayName'] as String,
    experimentArn: json['ExperimentArn'] as String,
    experimentName: json['ExperimentName'] as String,
    experimentSource: json['ExperimentSource'] == null
        ? null
        : ExperimentSource.fromJson(
            json['ExperimentSource'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
  );
}

FileSystemDataSource _$FileSystemDataSourceFromJson(Map<String, dynamic> json) {
  return FileSystemDataSource(
    directoryPath: json['DirectoryPath'] as String,
    fileSystemAccessMode: _$enumDecodeNullable(
        _$FileSystemAccessModeEnumMap, json['FileSystemAccessMode']),
    fileSystemId: json['FileSystemId'] as String,
    fileSystemType:
        _$enumDecodeNullable(_$FileSystemTypeEnumMap, json['FileSystemType']),
  );
}

Map<String, dynamic> _$FileSystemDataSourceToJson(
    FileSystemDataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DirectoryPath', instance.directoryPath);
  writeNotNull('FileSystemAccessMode',
      _$FileSystemAccessModeEnumMap[instance.fileSystemAccessMode]);
  writeNotNull('FileSystemId', instance.fileSystemId);
  writeNotNull(
      'FileSystemType', _$FileSystemTypeEnumMap[instance.fileSystemType]);
  return val;
}

const _$FileSystemAccessModeEnumMap = {
  FileSystemAccessMode.rw: 'rw',
  FileSystemAccessMode.ro: 'ro',
};

const _$FileSystemTypeEnumMap = {
  FileSystemType.efs: 'EFS',
  FileSystemType.fSxLustre: 'FSxLustre',
};

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
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
    metricName:
        _$enumDecodeNullable(_$AutoMLMetricEnumEnumMap, json['MetricName']),
    value: (json['Value'] as num)?.toDouble(),
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
    value: (json['Value'] as num)?.toDouble(),
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
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$FlowDefinitionOutputConfigToJson(
    FlowDefinitionOutputConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3OutputPath', instance.s3OutputPath);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

FlowDefinitionSummary _$FlowDefinitionSummaryFromJson(
    Map<String, dynamic> json) {
  return FlowDefinitionSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    flowDefinitionArn: json['FlowDefinitionArn'] as String,
    flowDefinitionName: json['FlowDefinitionName'] as String,
    flowDefinitionStatus: _$enumDecodeNullable(
        _$FlowDefinitionStatusEnumMap, json['FlowDefinitionStatus']),
    failureReason: json['FailureReason'] as String,
  );
}

GetSearchSuggestionsResponse _$GetSearchSuggestionsResponseFromJson(
    Map<String, dynamic> json) {
  return GetSearchSuggestionsResponse(
    propertyNameSuggestions: (json['PropertyNameSuggestions'] as List)
        ?.map((e) => e == null
            ? null
            : PropertyNameSuggestion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GitConfig _$GitConfigFromJson(Map<String, dynamic> json) {
  return GitConfig(
    repositoryUrl: json['RepositoryUrl'] as String,
    branch: json['Branch'] as String,
    secretArn: json['SecretArn'] as String,
  );
}

Map<String, dynamic> _$GitConfigToJson(GitConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RepositoryUrl', instance.repositoryUrl);
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
    humanLoopActivationConditions: json['HumanLoopActivationConditions'],
  );
}

Map<String, dynamic> _$HumanLoopActivationConditionsConfigToJson(
    HumanLoopActivationConditionsConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'HumanLoopActivationConditions', instance.humanLoopActivationConditions);
  return val;
}

HumanLoopActivationConfig _$HumanLoopActivationConfigFromJson(
    Map<String, dynamic> json) {
  return HumanLoopActivationConfig(
    humanLoopActivationConditionsConfig:
        json['HumanLoopActivationConditionsConfig'] == null
            ? null
            : HumanLoopActivationConditionsConfig.fromJson(
                json['HumanLoopActivationConditionsConfig']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HumanLoopActivationConfigToJson(
    HumanLoopActivationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HumanLoopActivationConditionsConfig',
      instance.humanLoopActivationConditionsConfig?.toJson());
  return val;
}

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
        json['TaskAvailabilityLifetimeInSeconds'] as int,
    taskKeywords:
        (json['TaskKeywords'] as List)?.map((e) => e as String)?.toList(),
    taskTimeLimitInSeconds: json['TaskTimeLimitInSeconds'] as int,
  );
}

Map<String, dynamic> _$HumanLoopConfigToJson(HumanLoopConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HumanTaskUiArn', instance.humanTaskUiArn);
  writeNotNull('TaskCount', instance.taskCount);
  writeNotNull('TaskDescription', instance.taskDescription);
  writeNotNull('TaskTitle', instance.taskTitle);
  writeNotNull('WorkteamArn', instance.workteamArn);
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
    awsManagedHumanLoopRequestSource: _$enumDecodeNullable(
        _$AwsManagedHumanLoopRequestSourceEnumMap,
        json['AwsManagedHumanLoopRequestSource']),
  );
}

Map<String, dynamic> _$HumanLoopRequestSourceToJson(
    HumanLoopRequestSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AwsManagedHumanLoopRequestSource',
      _$AwsManagedHumanLoopRequestSourceEnumMap[
          instance.awsManagedHumanLoopRequestSource]);
  return val;
}

const _$AwsManagedHumanLoopRequestSourceEnumMap = {
  AwsManagedHumanLoopRequestSource.awsRekognitionDetectModerationLabelsImageV3:
      'AWS/Rekognition/DetectModerationLabels/Image/V3',
  AwsManagedHumanLoopRequestSource.awsTextractAnalyzeDocumentFormsV1:
      'AWS/Textract/AnalyzeDocument/Forms/V1',
};

HumanTaskConfig _$HumanTaskConfigFromJson(Map<String, dynamic> json) {
  return HumanTaskConfig(
    annotationConsolidationConfig: json['AnnotationConsolidationConfig'] == null
        ? null
        : AnnotationConsolidationConfig.fromJson(
            json['AnnotationConsolidationConfig'] as Map<String, dynamic>),
    numberOfHumanWorkersPerDataObject:
        json['NumberOfHumanWorkersPerDataObject'] as int,
    preHumanTaskLambdaArn: json['PreHumanTaskLambdaArn'] as String,
    taskDescription: json['TaskDescription'] as String,
    taskTimeLimitInSeconds: json['TaskTimeLimitInSeconds'] as int,
    taskTitle: json['TaskTitle'] as String,
    uiConfig: json['UiConfig'] == null
        ? null
        : UiConfig.fromJson(json['UiConfig'] as Map<String, dynamic>),
    workteamArn: json['WorkteamArn'] as String,
    maxConcurrentTaskCount: json['MaxConcurrentTaskCount'] as int,
    publicWorkforceTaskPrice: json['PublicWorkforceTaskPrice'] == null
        ? null
        : PublicWorkforceTaskPrice.fromJson(
            json['PublicWorkforceTaskPrice'] as Map<String, dynamic>),
    taskAvailabilityLifetimeInSeconds:
        json['TaskAvailabilityLifetimeInSeconds'] as int,
    taskKeywords:
        (json['TaskKeywords'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$HumanTaskConfigToJson(HumanTaskConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AnnotationConsolidationConfig',
      instance.annotationConsolidationConfig?.toJson());
  writeNotNull('NumberOfHumanWorkersPerDataObject',
      instance.numberOfHumanWorkersPerDataObject);
  writeNotNull('PreHumanTaskLambdaArn', instance.preHumanTaskLambdaArn);
  writeNotNull('TaskDescription', instance.taskDescription);
  writeNotNull('TaskTimeLimitInSeconds', instance.taskTimeLimitInSeconds);
  writeNotNull('TaskTitle', instance.taskTitle);
  writeNotNull('UiConfig', instance.uiConfig?.toJson());
  writeNotNull('WorkteamArn', instance.workteamArn);
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
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    humanTaskUiArn: json['HumanTaskUiArn'] as String,
    humanTaskUiName: json['HumanTaskUiName'] as String,
  );
}

HyperParameterAlgorithmSpecification
    _$HyperParameterAlgorithmSpecificationFromJson(Map<String, dynamic> json) {
  return HyperParameterAlgorithmSpecification(
    trainingInputMode: _$enumDecodeNullable(
        _$TrainingInputModeEnumMap, json['TrainingInputMode']),
    algorithmName: json['AlgorithmName'] as String,
    metricDefinitions: (json['MetricDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : MetricDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trainingImage: json['TrainingImage'] as String,
  );
}

Map<String, dynamic> _$HyperParameterAlgorithmSpecificationToJson(
    HyperParameterAlgorithmSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TrainingInputMode',
      _$TrainingInputModeEnumMap[instance.trainingInputMode]);
  writeNotNull('AlgorithmName', instance.algorithmName);
  writeNotNull('MetricDefinitions',
      instance.metricDefinitions?.map((e) => e?.toJson())?.toList());
  writeNotNull('TrainingImage', instance.trainingImage);
  return val;
}

HyperParameterSpecification _$HyperParameterSpecificationFromJson(
    Map<String, dynamic> json) {
  return HyperParameterSpecification(
    name: json['Name'] as String,
    type: _$enumDecodeNullable(_$ParameterTypeEnumMap, json['Type']),
    defaultValue: json['DefaultValue'] as String,
    description: json['Description'] as String,
    isRequired: json['IsRequired'] as bool,
    isTunable: json['IsTunable'] as bool,
    range: json['Range'] == null
        ? null
        : ParameterRange.fromJson(json['Range'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HyperParameterSpecificationToJson(
    HyperParameterSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Type', _$ParameterTypeEnumMap[instance.type]);
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
    algorithmSpecification: json['AlgorithmSpecification'] == null
        ? null
        : HyperParameterAlgorithmSpecification.fromJson(
            json['AlgorithmSpecification'] as Map<String, dynamic>),
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    resourceConfig: json['ResourceConfig'] == null
        ? null
        : ResourceConfig.fromJson(
            json['ResourceConfig'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : StoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
    checkpointConfig: json['CheckpointConfig'] == null
        ? null
        : CheckpointConfig.fromJson(
            json['CheckpointConfig'] as Map<String, dynamic>),
    definitionName: json['DefinitionName'] as String,
    enableInterContainerTrafficEncryption:
        json['EnableInterContainerTrafficEncryption'] as bool,
    enableManagedSpotTraining: json['EnableManagedSpotTraining'] as bool,
    enableNetworkIsolation: json['EnableNetworkIsolation'] as bool,
    hyperParameterRanges: json['HyperParameterRanges'] == null
        ? null
        : ParameterRanges.fromJson(
            json['HyperParameterRanges'] as Map<String, dynamic>),
    inputDataConfig: (json['InputDataConfig'] as List)
        ?.map((e) =>
            e == null ? null : Channel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    staticHyperParameters:
        (json['StaticHyperParameters'] as Map<String, dynamic>)?.map(
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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AlgorithmSpecification', instance.algorithmSpecification?.toJson());
  writeNotNull('OutputDataConfig', instance.outputDataConfig?.toJson());
  writeNotNull('ResourceConfig', instance.resourceConfig?.toJson());
  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('StoppingCondition', instance.stoppingCondition?.toJson());
  writeNotNull('CheckpointConfig', instance.checkpointConfig?.toJson());
  writeNotNull('DefinitionName', instance.definitionName);
  writeNotNull('EnableInterContainerTrafficEncryption',
      instance.enableInterContainerTrafficEncryption);
  writeNotNull('EnableManagedSpotTraining', instance.enableManagedSpotTraining);
  writeNotNull('EnableNetworkIsolation', instance.enableNetworkIsolation);
  writeNotNull('HyperParameterRanges', instance.hyperParameterRanges?.toJson());
  writeNotNull('InputDataConfig',
      instance.inputDataConfig?.map((e) => e?.toJson())?.toList());
  writeNotNull('StaticHyperParameters', instance.staticHyperParameters);
  writeNotNull('TuningObjective', instance.tuningObjective?.toJson());
  writeNotNull('VpcConfig', instance.vpcConfig?.toJson());
  return val;
}

HyperParameterTrainingJobSummary _$HyperParameterTrainingJobSummaryFromJson(
    Map<String, dynamic> json) {
  return HyperParameterTrainingJobSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    trainingJobArn: json['TrainingJobArn'] as String,
    trainingJobName: json['TrainingJobName'] as String,
    trainingJobStatus: _$enumDecodeNullable(
        _$TrainingJobStatusEnumMap, json['TrainingJobStatus']),
    tunedHyperParameters:
        (json['TunedHyperParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    failureReason: json['FailureReason'] as String,
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
    trainingJobDefinitionName: json['TrainingJobDefinitionName'] as String,
    trainingStartTime:
        const UnixDateTimeConverter().fromJson(json['TrainingStartTime']),
    tuningJobName: json['TuningJobName'] as String,
  );
}

HyperParameterTuningJobConfig _$HyperParameterTuningJobConfigFromJson(
    Map<String, dynamic> json) {
  return HyperParameterTuningJobConfig(
    resourceLimits: json['ResourceLimits'] == null
        ? null
        : ResourceLimits.fromJson(
            json['ResourceLimits'] as Map<String, dynamic>),
    strategy: _$enumDecodeNullable(
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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceLimits', instance.resourceLimits?.toJson());
  writeNotNull('Strategy',
      _$HyperParameterTuningJobStrategyTypeEnumMap[instance.strategy]);
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
    type: _$enumDecodeNullable(
        _$HyperParameterTuningJobObjectiveTypeEnumMap, json['Type']),
  );
}

Map<String, dynamic> _$HyperParameterTuningJobObjectiveToJson(
    HyperParameterTuningJobObjective instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MetricName', instance.metricName);
  writeNotNull(
      'Type', _$HyperParameterTuningJobObjectiveTypeEnumMap[instance.type]);
  return val;
}

HyperParameterTuningJobSummary _$HyperParameterTuningJobSummaryFromJson(
    Map<String, dynamic> json) {
  return HyperParameterTuningJobSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    hyperParameterTuningJobArn: json['HyperParameterTuningJobArn'] as String,
    hyperParameterTuningJobName: json['HyperParameterTuningJobName'] as String,
    hyperParameterTuningJobStatus: _$enumDecodeNullable(
        _$HyperParameterTuningJobStatusEnumMap,
        json['HyperParameterTuningJobStatus']),
    objectiveStatusCounters: json['ObjectiveStatusCounters'] == null
        ? null
        : ObjectiveStatusCounters.fromJson(
            json['ObjectiveStatusCounters'] as Map<String, dynamic>),
    strategy: _$enumDecodeNullable(
        _$HyperParameterTuningJobStrategyTypeEnumMap, json['Strategy']),
    trainingJobStatusCounters: json['TrainingJobStatusCounters'] == null
        ? null
        : TrainingJobStatusCounters.fromJson(
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
            as List)
        ?.map((e) => e == null
            ? null
            : ParentHyperParameterTuningJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    warmStartType: _$enumDecodeNullable(
        _$HyperParameterTuningJobWarmStartTypeEnumMap, json['WarmStartType']),
  );
}

Map<String, dynamic> _$HyperParameterTuningJobWarmStartConfigToJson(
    HyperParameterTuningJobWarmStartConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ParentHyperParameterTuningJobs',
      instance.parentHyperParameterTuningJobs
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('WarmStartType',
      _$HyperParameterTuningJobWarmStartTypeEnumMap[instance.warmStartType]);
  return val;
}

const _$HyperParameterTuningJobWarmStartTypeEnumMap = {
  HyperParameterTuningJobWarmStartType.identicalDataAndAlgorithm:
      'IdenticalDataAndAlgorithm',
  HyperParameterTuningJobWarmStartType.transferLearning: 'TransferLearning',
};

InferenceSpecification _$InferenceSpecificationFromJson(
    Map<String, dynamic> json) {
  return InferenceSpecification(
    containers: (json['Containers'] as List)
        ?.map((e) => e == null
            ? null
            : ModelPackageContainerDefinition.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    supportedContentTypes: (json['SupportedContentTypes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    supportedRealtimeInferenceInstanceTypes:
        (json['SupportedRealtimeInferenceInstanceTypes'] as List)
            ?.map((e) =>
                _$enumDecodeNullable(_$ProductionVariantInstanceTypeEnumMap, e))
            ?.toList(),
    supportedResponseMIMETypes: (json['SupportedResponseMIMETypes'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    supportedTransformInstanceTypes: (json['SupportedTransformInstanceTypes']
            as List)
        ?.map((e) => _$enumDecodeNullable(_$TransformInstanceTypeEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$InferenceSpecificationToJson(
    InferenceSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Containers', instance.containers?.map((e) => e?.toJson())?.toList());
  writeNotNull('SupportedContentTypes', instance.supportedContentTypes);
  writeNotNull(
      'SupportedRealtimeInferenceInstanceTypes',
      instance.supportedRealtimeInferenceInstanceTypes
          ?.map((e) => _$ProductionVariantInstanceTypeEnumMap[e])
          ?.toList());
  writeNotNull(
      'SupportedResponseMIMETypes', instance.supportedResponseMIMETypes);
  writeNotNull(
      'SupportedTransformInstanceTypes',
      instance.supportedTransformInstanceTypes
          ?.map((e) => _$TransformInstanceTypeEnumMap[e])
          ?.toList());
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
    framework: _$enumDecodeNullable(_$FrameworkEnumMap, json['Framework']),
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$InputConfigToJson(InputConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataInputConfig', instance.dataInputConfig);
  writeNotNull('Framework', _$FrameworkEnumMap[instance.framework]);
  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

const _$FrameworkEnumMap = {
  Framework.tensorflow: 'TENSORFLOW',
  Framework.keras: 'KERAS',
  Framework.mxnet: 'MXNET',
  Framework.onnx: 'ONNX',
  Framework.pytorch: 'PYTORCH',
  Framework.xgboost: 'XGBOOST',
  Framework.tflite: 'TFLITE',
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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxValue', instance.maxValue);
  writeNotNull('MinValue', instance.minValue);
  writeNotNull('Name', instance.name);
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
    IntegerParameterRangeSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxValue', instance.maxValue);
  writeNotNull('MinValue', instance.minValue);
  return val;
}

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

  writeNotNull('DefaultResourceSpec', instance.defaultResourceSpec?.toJson());
  return val;
}

LabelCounters _$LabelCountersFromJson(Map<String, dynamic> json) {
  return LabelCounters(
    failedNonRetryableError: json['FailedNonRetryableError'] as int,
    humanLabeled: json['HumanLabeled'] as int,
    machineLabeled: json['MachineLabeled'] as int,
    totalLabeled: json['TotalLabeled'] as int,
    unlabeled: json['Unlabeled'] as int,
  );
}

LabelCountersForWorkteam _$LabelCountersForWorkteamFromJson(
    Map<String, dynamic> json) {
  return LabelCountersForWorkteam(
    humanLabeled: json['HumanLabeled'] as int,
    pendingHuman: json['PendingHuman'] as int,
    total: json['Total'] as int,
  );
}

LabelingJobAlgorithmsConfig _$LabelingJobAlgorithmsConfigFromJson(
    Map<String, dynamic> json) {
  return LabelingJobAlgorithmsConfig(
    labelingJobAlgorithmSpecificationArn:
        json['LabelingJobAlgorithmSpecificationArn'] as String,
    initialActiveLearningModelArn:
        json['InitialActiveLearningModelArn'] as String,
    labelingJobResourceConfig: json['LabelingJobResourceConfig'] == null
        ? null
        : LabelingJobResourceConfig.fromJson(
            json['LabelingJobResourceConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LabelingJobAlgorithmsConfigToJson(
    LabelingJobAlgorithmsConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LabelingJobAlgorithmSpecificationArn',
      instance.labelingJobAlgorithmSpecificationArn);
  writeNotNull(
      'InitialActiveLearningModelArn', instance.initialActiveLearningModelArn);
  writeNotNull('LabelingJobResourceConfig',
      instance.labelingJobResourceConfig?.toJson());
  return val;
}

LabelingJobDataAttributes _$LabelingJobDataAttributesFromJson(
    Map<String, dynamic> json) {
  return LabelingJobDataAttributes(
    contentClassifiers: (json['ContentClassifiers'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ContentClassifierEnumMap, e))
        ?.toList(),
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
          ?.toList());
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
  return val;
}

LabelingJobForWorkteamSummary _$LabelingJobForWorkteamSummaryFromJson(
    Map<String, dynamic> json) {
  return LabelingJobForWorkteamSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    jobReferenceCode: json['JobReferenceCode'] as String,
    workRequesterAccountId: json['WorkRequesterAccountId'] as String,
    labelCounters: json['LabelCounters'] == null
        ? null
        : LabelCountersForWorkteam.fromJson(
            json['LabelCounters'] as Map<String, dynamic>),
    labelingJobName: json['LabelingJobName'] as String,
    numberOfHumanWorkersPerDataObject:
        json['NumberOfHumanWorkersPerDataObject'] as int,
  );
}

LabelingJobInputConfig _$LabelingJobInputConfigFromJson(
    Map<String, dynamic> json) {
  return LabelingJobInputConfig(
    dataSource: json['DataSource'] == null
        ? null
        : LabelingJobDataSource.fromJson(
            json['DataSource'] as Map<String, dynamic>),
    dataAttributes: json['DataAttributes'] == null
        ? null
        : LabelingJobDataAttributes.fromJson(
            json['DataAttributes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LabelingJobInputConfigToJson(
    LabelingJobInputConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSource', instance.dataSource?.toJson());
  writeNotNull('DataAttributes', instance.dataAttributes?.toJson());
  return val;
}

LabelingJobOutput _$LabelingJobOutputFromJson(Map<String, dynamic> json) {
  return LabelingJobOutput(
    outputDatasetS3Uri: json['OutputDatasetS3Uri'] as String,
    finalActiveLearningModelArn: json['FinalActiveLearningModelArn'] as String,
  );
}

LabelingJobOutputConfig _$LabelingJobOutputConfigFromJson(
    Map<String, dynamic> json) {
  return LabelingJobOutputConfig(
    s3OutputPath: json['S3OutputPath'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$LabelingJobOutputConfigToJson(
    LabelingJobOutputConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3OutputPath', instance.s3OutputPath);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

LabelingJobResourceConfig _$LabelingJobResourceConfigFromJson(
    Map<String, dynamic> json) {
  return LabelingJobResourceConfig(
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
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
    LabelingJobS3DataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ManifestS3Uri', instance.manifestS3Uri);
  return val;
}

LabelingJobStoppingConditions _$LabelingJobStoppingConditionsFromJson(
    Map<String, dynamic> json) {
  return LabelingJobStoppingConditions(
    maxHumanLabeledObjectCount: json['MaxHumanLabeledObjectCount'] as int,
    maxPercentageOfInputDatasetLabeled:
        json['MaxPercentageOfInputDatasetLabeled'] as int,
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
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    labelCounters: json['LabelCounters'] == null
        ? null
        : LabelCounters.fromJson(json['LabelCounters'] as Map<String, dynamic>),
    labelingJobArn: json['LabelingJobArn'] as String,
    labelingJobName: json['LabelingJobName'] as String,
    labelingJobStatus: _$enumDecodeNullable(
        _$LabelingJobStatusEnumMap, json['LabelingJobStatus']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    preHumanTaskLambdaArn: json['PreHumanTaskLambdaArn'] as String,
    workteamArn: json['WorkteamArn'] as String,
    annotationConsolidationLambdaArn:
        json['AnnotationConsolidationLambdaArn'] as String,
    failureReason: json['FailureReason'] as String,
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

ListAlgorithmsOutput _$ListAlgorithmsOutputFromJson(Map<String, dynamic> json) {
  return ListAlgorithmsOutput(
    algorithmSummaryList: (json['AlgorithmSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : AlgorithmSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListAppsResponse _$ListAppsResponseFromJson(Map<String, dynamic> json) {
  return ListAppsResponse(
    apps: (json['Apps'] as List)
        ?.map((e) =>
            e == null ? null : AppDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListAutoMLJobsResponse _$ListAutoMLJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListAutoMLJobsResponse(
    autoMLJobSummaries: (json['AutoMLJobSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : AutoMLJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListCandidatesForAutoMLJobResponse _$ListCandidatesForAutoMLJobResponseFromJson(
    Map<String, dynamic> json) {
  return ListCandidatesForAutoMLJobResponse(
    candidates: (json['Candidates'] as List)
        ?.map((e) => e == null
            ? null
            : AutoMLCandidate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListCodeRepositoriesOutput _$ListCodeRepositoriesOutputFromJson(
    Map<String, dynamic> json) {
  return ListCodeRepositoriesOutput(
    codeRepositorySummaryList: (json['CodeRepositorySummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : CodeRepositorySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListCompilationJobsResponse _$ListCompilationJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListCompilationJobsResponse(
    compilationJobSummaries: (json['CompilationJobSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : CompilationJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListDomainsResponse _$ListDomainsResponseFromJson(Map<String, dynamic> json) {
  return ListDomainsResponse(
    domains: (json['Domains'] as List)
        ?.map((e) => e == null
            ? null
            : DomainDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListEndpointConfigsOutput _$ListEndpointConfigsOutputFromJson(
    Map<String, dynamic> json) {
  return ListEndpointConfigsOutput(
    endpointConfigs: (json['EndpointConfigs'] as List)
        ?.map((e) => e == null
            ? null
            : EndpointConfigSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListEndpointsOutput _$ListEndpointsOutputFromJson(Map<String, dynamic> json) {
  return ListEndpointsOutput(
    endpoints: (json['Endpoints'] as List)
        ?.map((e) => e == null
            ? null
            : EndpointSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListExperimentsResponse _$ListExperimentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListExperimentsResponse(
    experimentSummaries: (json['ExperimentSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ExperimentSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListFlowDefinitionsResponse _$ListFlowDefinitionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListFlowDefinitionsResponse(
    flowDefinitionSummaries: (json['FlowDefinitionSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : FlowDefinitionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListHumanTaskUisResponse _$ListHumanTaskUisResponseFromJson(
    Map<String, dynamic> json) {
  return ListHumanTaskUisResponse(
    humanTaskUiSummaries: (json['HumanTaskUiSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : HumanTaskUiSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListHyperParameterTuningJobsResponse
    _$ListHyperParameterTuningJobsResponseFromJson(Map<String, dynamic> json) {
  return ListHyperParameterTuningJobsResponse(
    hyperParameterTuningJobSummaries:
        (json['HyperParameterTuningJobSummaries'] as List)
            ?.map((e) => e == null
                ? null
                : HyperParameterTuningJobSummary.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListLabelingJobsForWorkteamResponse
    _$ListLabelingJobsForWorkteamResponseFromJson(Map<String, dynamic> json) {
  return ListLabelingJobsForWorkteamResponse(
    labelingJobSummaryList: (json['LabelingJobSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : LabelingJobForWorkteamSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListLabelingJobsResponse _$ListLabelingJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListLabelingJobsResponse(
    labelingJobSummaryList: (json['LabelingJobSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : LabelingJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListModelPackagesOutput _$ListModelPackagesOutputFromJson(
    Map<String, dynamic> json) {
  return ListModelPackagesOutput(
    modelPackageSummaryList: (json['ModelPackageSummaryList'] as List)
        ?.map((e) => e == null
            ? null
            : ModelPackageSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListModelsOutput _$ListModelsOutputFromJson(Map<String, dynamic> json) {
  return ListModelsOutput(
    models: (json['Models'] as List)
        ?.map((e) =>
            e == null ? null : ModelSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMonitoringExecutionsResponse _$ListMonitoringExecutionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListMonitoringExecutionsResponse(
    monitoringExecutionSummaries: (json['MonitoringExecutionSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : MonitoringExecutionSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListMonitoringSchedulesResponse _$ListMonitoringSchedulesResponseFromJson(
    Map<String, dynamic> json) {
  return ListMonitoringSchedulesResponse(
    monitoringScheduleSummaries: (json['MonitoringScheduleSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : MonitoringScheduleSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListNotebookInstanceLifecycleConfigsOutput
    _$ListNotebookInstanceLifecycleConfigsOutputFromJson(
        Map<String, dynamic> json) {
  return ListNotebookInstanceLifecycleConfigsOutput(
    nextToken: json['NextToken'] as String,
    notebookInstanceLifecycleConfigs:
        (json['NotebookInstanceLifecycleConfigs'] as List)
            ?.map((e) => e == null
                ? null
                : NotebookInstanceLifecycleConfigSummary.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

ListNotebookInstancesOutput _$ListNotebookInstancesOutputFromJson(
    Map<String, dynamic> json) {
  return ListNotebookInstancesOutput(
    nextToken: json['NextToken'] as String,
    notebookInstances: (json['NotebookInstances'] as List)
        ?.map((e) => e == null
            ? null
            : NotebookInstanceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListProcessingJobsResponse _$ListProcessingJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListProcessingJobsResponse(
    processingJobSummaries: (json['ProcessingJobSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ProcessingJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListSubscribedWorkteamsResponse _$ListSubscribedWorkteamsResponseFromJson(
    Map<String, dynamic> json) {
  return ListSubscribedWorkteamsResponse(
    subscribedWorkteams: (json['SubscribedWorkteams'] as List)
        ?.map((e) => e == null
            ? null
            : SubscribedWorkteam.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsOutput _$ListTagsOutputFromJson(Map<String, dynamic> json) {
  return ListTagsOutput(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTrainingJobsForHyperParameterTuningJobResponse
    _$ListTrainingJobsForHyperParameterTuningJobResponseFromJson(
        Map<String, dynamic> json) {
  return ListTrainingJobsForHyperParameterTuningJobResponse(
    trainingJobSummaries: (json['TrainingJobSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : HyperParameterTrainingJobSummary.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTrainingJobsResponse _$ListTrainingJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTrainingJobsResponse(
    trainingJobSummaries: (json['TrainingJobSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : TrainingJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTransformJobsResponse _$ListTransformJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTransformJobsResponse(
    transformJobSummaries: (json['TransformJobSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : TransformJobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTrialComponentsResponse _$ListTrialComponentsResponseFromJson(
    Map<String, dynamic> json) {
  return ListTrialComponentsResponse(
    nextToken: json['NextToken'] as String,
    trialComponentSummaries: (json['TrialComponentSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : TrialComponentSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTrialsResponse _$ListTrialsResponseFromJson(Map<String, dynamic> json) {
  return ListTrialsResponse(
    nextToken: json['NextToken'] as String,
    trialSummaries: (json['TrialSummaries'] as List)
        ?.map((e) =>
            e == null ? null : TrialSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListUserProfilesResponse _$ListUserProfilesResponseFromJson(
    Map<String, dynamic> json) {
  return ListUserProfilesResponse(
    nextToken: json['NextToken'] as String,
    userProfiles: (json['UserProfiles'] as List)
        ?.map((e) => e == null
            ? null
            : UserProfileDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListWorkteamsResponse _$ListWorkteamsResponseFromJson(
    Map<String, dynamic> json) {
  return ListWorkteamsResponse(
    workteams: (json['Workteams'] as List)
        ?.map((e) =>
            e == null ? null : Workteam.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

MemberDefinition _$MemberDefinitionFromJson(Map<String, dynamic> json) {
  return MemberDefinition(
    cognitoMemberDefinition: json['CognitoMemberDefinition'] == null
        ? null
        : CognitoMemberDefinition.fromJson(
            json['CognitoMemberDefinition'] as Map<String, dynamic>),
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
  return val;
}

MetricData _$MetricDataFromJson(Map<String, dynamic> json) {
  return MetricData(
    metricName: json['MetricName'] as String,
    timestamp: const UnixDateTimeConverter().fromJson(json['Timestamp']),
    value: (json['Value'] as num)?.toDouble(),
  );
}

MetricDefinition _$MetricDefinitionFromJson(Map<String, dynamic> json) {
  return MetricDefinition(
    name: json['Name'] as String,
    regex: json['Regex'] as String,
  );
}

Map<String, dynamic> _$MetricDefinitionToJson(MetricDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Regex', instance.regex);
  return val;
}

ModelArtifacts _$ModelArtifactsFromJson(Map<String, dynamic> json) {
  return ModelArtifacts(
    s3ModelArtifacts: json['S3ModelArtifacts'] as String,
  );
}

ModelPackageContainerDefinition _$ModelPackageContainerDefinitionFromJson(
    Map<String, dynamic> json) {
  return ModelPackageContainerDefinition(
    image: json['Image'] as String,
    containerHostname: json['ContainerHostname'] as String,
    imageDigest: json['ImageDigest'] as String,
    modelDataUrl: json['ModelDataUrl'] as String,
    productId: json['ProductId'] as String,
  );
}

Map<String, dynamic> _$ModelPackageContainerDefinitionToJson(
    ModelPackageContainerDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Image', instance.image);
  writeNotNull('ContainerHostname', instance.containerHostname);
  writeNotNull('ImageDigest', instance.imageDigest);
  writeNotNull('ModelDataUrl', instance.modelDataUrl);
  writeNotNull('ProductId', instance.productId);
  return val;
}

ModelPackageStatusDetails _$ModelPackageStatusDetailsFromJson(
    Map<String, dynamic> json) {
  return ModelPackageStatusDetails(
    validationStatuses: (json['ValidationStatuses'] as List)
        ?.map((e) => e == null
            ? null
            : ModelPackageStatusItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    imageScanStatuses: (json['ImageScanStatuses'] as List)
        ?.map((e) => e == null
            ? null
            : ModelPackageStatusItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ModelPackageStatusItem _$ModelPackageStatusItemFromJson(
    Map<String, dynamic> json) {
  return ModelPackageStatusItem(
    name: json['Name'] as String,
    status: _$enumDecodeNullable(
        _$DetailedModelPackageStatusEnumMap, json['Status']),
    failureReason: json['FailureReason'] as String,
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
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    modelPackageArn: json['ModelPackageArn'] as String,
    modelPackageName: json['ModelPackageName'] as String,
    modelPackageStatus: _$enumDecodeNullable(
        _$ModelPackageStatusEnumMap, json['ModelPackageStatus']),
    modelPackageDescription: json['ModelPackageDescription'] as String,
  );
}

ModelPackageValidationProfile _$ModelPackageValidationProfileFromJson(
    Map<String, dynamic> json) {
  return ModelPackageValidationProfile(
    profileName: json['ProfileName'] as String,
    transformJobDefinition: json['TransformJobDefinition'] == null
        ? null
        : TransformJobDefinition.fromJson(
            json['TransformJobDefinition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelPackageValidationProfileToJson(
    ModelPackageValidationProfile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProfileName', instance.profileName);
  writeNotNull(
      'TransformJobDefinition', instance.transformJobDefinition?.toJson());
  return val;
}

ModelPackageValidationSpecification
    _$ModelPackageValidationSpecificationFromJson(Map<String, dynamic> json) {
  return ModelPackageValidationSpecification(
    validationProfiles: (json['ValidationProfiles'] as List)
        ?.map((e) => e == null
            ? null
            : ModelPackageValidationProfile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    validationRole: json['ValidationRole'] as String,
  );
}

Map<String, dynamic> _$ModelPackageValidationSpecificationToJson(
    ModelPackageValidationSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ValidationProfiles',
      instance.validationProfiles?.map((e) => e?.toJson())?.toList());
  writeNotNull('ValidationRole', instance.validationRole);
  return val;
}

ModelSummary _$ModelSummaryFromJson(Map<String, dynamic> json) {
  return ModelSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    modelArn: json['ModelArn'] as String,
    modelName: json['ModelName'] as String,
  );
}

MonitoringAppSpecification _$MonitoringAppSpecificationFromJson(
    Map<String, dynamic> json) {
  return MonitoringAppSpecification(
    imageUri: json['ImageUri'] as String,
    containerArguments:
        (json['ContainerArguments'] as List)?.map((e) => e as String)?.toList(),
    containerEntrypoint: (json['ContainerEntrypoint'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    postAnalyticsProcessorSourceUri:
        json['PostAnalyticsProcessorSourceUri'] as String,
    recordPreprocessorSourceUri: json['RecordPreprocessorSourceUri'] as String,
  );
}

Map<String, dynamic> _$MonitoringAppSpecificationToJson(
    MonitoringAppSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ImageUri', instance.imageUri);
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

  writeNotNull('ConstraintsResource', instance.constraintsResource?.toJson());
  writeNotNull('StatisticsResource', instance.statisticsResource?.toJson());
  return val;
}

MonitoringClusterConfig _$MonitoringClusterConfigFromJson(
    Map<String, dynamic> json) {
  return MonitoringClusterConfig(
    instanceCount: json['InstanceCount'] as int,
    instanceType: _$enumDecodeNullable(
        _$ProcessingInstanceTypeEnumMap, json['InstanceType']),
    volumeSizeInGB: json['VolumeSizeInGB'] as int,
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
  );
}

Map<String, dynamic> _$MonitoringClusterConfigToJson(
    MonitoringClusterConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceCount', instance.instanceCount);
  writeNotNull(
      'InstanceType', _$ProcessingInstanceTypeEnumMap[instance.instanceType]);
  writeNotNull('VolumeSizeInGB', instance.volumeSizeInGB);
  writeNotNull('VolumeKmsKeyId', instance.volumeKmsKeyId);
  return val;
}

MonitoringConstraintsResource _$MonitoringConstraintsResourceFromJson(
    Map<String, dynamic> json) {
  return MonitoringConstraintsResource(
    s3Uri: json['S3Uri'] as String,
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
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    monitoringExecutionStatus: _$enumDecodeNullable(
        _$ExecutionStatusEnumMap, json['MonitoringExecutionStatus']),
    monitoringScheduleName: json['MonitoringScheduleName'] as String,
    scheduledTime:
        const UnixDateTimeConverter().fromJson(json['ScheduledTime']),
    endpointName: json['EndpointName'] as String,
    failureReason: json['FailureReason'] as String,
    processingJobArn: json['ProcessingJobArn'] as String,
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

MonitoringInput _$MonitoringInputFromJson(Map<String, dynamic> json) {
  return MonitoringInput(
    endpointInput: json['EndpointInput'] == null
        ? null
        : EndpointInput.fromJson(json['EndpointInput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MonitoringInputToJson(MonitoringInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndpointInput', instance.endpointInput?.toJson());
  return val;
}

MonitoringJobDefinition _$MonitoringJobDefinitionFromJson(
    Map<String, dynamic> json) {
  return MonitoringJobDefinition(
    monitoringAppSpecification: json['MonitoringAppSpecification'] == null
        ? null
        : MonitoringAppSpecification.fromJson(
            json['MonitoringAppSpecification'] as Map<String, dynamic>),
    monitoringInputs: (json['MonitoringInputs'] as List)
        ?.map((e) => e == null
            ? null
            : MonitoringInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    monitoringOutputConfig: json['MonitoringOutputConfig'] == null
        ? null
        : MonitoringOutputConfig.fromJson(
            json['MonitoringOutputConfig'] as Map<String, dynamic>),
    monitoringResources: json['MonitoringResources'] == null
        ? null
        : MonitoringResources.fromJson(
            json['MonitoringResources'] as Map<String, dynamic>),
    roleArn: json['RoleArn'] as String,
    baselineConfig: json['BaselineConfig'] == null
        ? null
        : MonitoringBaselineConfig.fromJson(
            json['BaselineConfig'] as Map<String, dynamic>),
    environment: (json['Environment'] as Map<String, dynamic>)?.map(
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
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MonitoringAppSpecification',
      instance.monitoringAppSpecification?.toJson());
  writeNotNull('MonitoringInputs',
      instance.monitoringInputs?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'MonitoringOutputConfig', instance.monitoringOutputConfig?.toJson());
  writeNotNull('MonitoringResources', instance.monitoringResources?.toJson());
  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('BaselineConfig', instance.baselineConfig?.toJson());
  writeNotNull('Environment', instance.environment);
  writeNotNull('NetworkConfig', instance.networkConfig?.toJson());
  writeNotNull('StoppingCondition', instance.stoppingCondition?.toJson());
  return val;
}

MonitoringOutput _$MonitoringOutputFromJson(Map<String, dynamic> json) {
  return MonitoringOutput(
    s3Output: json['S3Output'] == null
        ? null
        : MonitoringS3Output.fromJson(json['S3Output'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MonitoringOutputToJson(MonitoringOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3Output', instance.s3Output?.toJson());
  return val;
}

MonitoringOutputConfig _$MonitoringOutputConfigFromJson(
    Map<String, dynamic> json) {
  return MonitoringOutputConfig(
    monitoringOutputs: (json['MonitoringOutputs'] as List)
        ?.map((e) => e == null
            ? null
            : MonitoringOutput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$MonitoringOutputConfigToJson(
    MonitoringOutputConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MonitoringOutputs',
      instance.monitoringOutputs?.map((e) => e?.toJson())?.toList());
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

MonitoringResources _$MonitoringResourcesFromJson(Map<String, dynamic> json) {
  return MonitoringResources(
    clusterConfig: json['ClusterConfig'] == null
        ? null
        : MonitoringClusterConfig.fromJson(
            json['ClusterConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MonitoringResourcesToJson(MonitoringResources instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterConfig', instance.clusterConfig?.toJson());
  return val;
}

MonitoringS3Output _$MonitoringS3OutputFromJson(Map<String, dynamic> json) {
  return MonitoringS3Output(
    localPath: json['LocalPath'] as String,
    s3Uri: json['S3Uri'] as String,
    s3UploadMode: _$enumDecodeNullable(
        _$ProcessingS3UploadModeEnumMap, json['S3UploadMode']),
  );
}

Map<String, dynamic> _$MonitoringS3OutputToJson(MonitoringS3Output instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LocalPath', instance.localPath);
  writeNotNull('S3Uri', instance.s3Uri);
  writeNotNull(
      'S3UploadMode', _$ProcessingS3UploadModeEnumMap[instance.s3UploadMode]);
  return val;
}

const _$ProcessingS3UploadModeEnumMap = {
  ProcessingS3UploadMode.continuous: 'Continuous',
  ProcessingS3UploadMode.endOfJob: 'EndOfJob',
};

MonitoringScheduleConfig _$MonitoringScheduleConfigFromJson(
    Map<String, dynamic> json) {
  return MonitoringScheduleConfig(
    monitoringJobDefinition: json['MonitoringJobDefinition'] == null
        ? null
        : MonitoringJobDefinition.fromJson(
            json['MonitoringJobDefinition'] as Map<String, dynamic>),
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
  writeNotNull('ScheduleConfig', instance.scheduleConfig?.toJson());
  return val;
}

MonitoringScheduleSummary _$MonitoringScheduleSummaryFromJson(
    Map<String, dynamic> json) {
  return MonitoringScheduleSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    monitoringScheduleArn: json['MonitoringScheduleArn'] as String,
    monitoringScheduleName: json['MonitoringScheduleName'] as String,
    monitoringScheduleStatus: _$enumDecodeNullable(
        _$ScheduleStatusEnumMap, json['MonitoringScheduleStatus']),
    endpointName: json['EndpointName'] as String,
  );
}

MonitoringStatisticsResource _$MonitoringStatisticsResourceFromJson(
    Map<String, dynamic> json) {
  return MonitoringStatisticsResource(
    s3Uri: json['S3Uri'] as String,
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
    MonitoringStoppingCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxRuntimeInSeconds', instance.maxRuntimeInSeconds);
  return val;
}

Map<String, dynamic> _$NestedFiltersToJson(NestedFilters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('NestedPropertyName', instance.nestedPropertyName);
  return val;
}

NetworkConfig _$NetworkConfigFromJson(Map<String, dynamic> json) {
  return NetworkConfig(
    enableNetworkIsolation: json['EnableNetworkIsolation'] as bool,
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
    content: json['Content'] as String,
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
    additionalCodeRepositories: (json['AdditionalCodeRepositories'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    defaultCodeRepository: json['DefaultCodeRepository'] as String,
    instanceType:
        _$enumDecodeNullable(_$InstanceTypeEnumMap, json['InstanceType']),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    notebookInstanceLifecycleConfigName:
        json['NotebookInstanceLifecycleConfigName'] as String,
    notebookInstanceStatus: _$enumDecodeNullable(
        _$NotebookInstanceStatusEnumMap, json['NotebookInstanceStatus']),
    url: json['Url'] as String,
  );
}

NotificationConfiguration _$NotificationConfigurationFromJson(
    Map<String, dynamic> json) {
  return NotificationConfiguration(
    notificationTopicArn: json['NotificationTopicArn'] as String,
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
    failed: json['Failed'] as int,
    pending: json['Pending'] as int,
    succeeded: json['Succeeded'] as int,
  );
}

OutputConfig _$OutputConfigFromJson(Map<String, dynamic> json) {
  return OutputConfig(
    s3OutputLocation: json['S3OutputLocation'] as String,
    targetDevice:
        _$enumDecodeNullable(_$TargetDeviceEnumMap, json['TargetDevice']),
  );
}

Map<String, dynamic> _$OutputConfigToJson(OutputConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3OutputLocation', instance.s3OutputLocation);
  writeNotNull('TargetDevice', _$TargetDeviceEnumMap[instance.targetDevice]);
  return val;
}

OutputDataConfig _$OutputDataConfigFromJson(Map<String, dynamic> json) {
  return OutputDataConfig(
    s3OutputPath: json['S3OutputPath'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$OutputDataConfigToJson(OutputDataConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3OutputPath', instance.s3OutputPath);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

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
    categoricalParameterRanges: (json['CategoricalParameterRanges'] as List)
        ?.map((e) => e == null
            ? null
            : CategoricalParameterRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    continuousParameterRanges: (json['ContinuousParameterRanges'] as List)
        ?.map((e) => e == null
            ? null
            : ContinuousParameterRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    integerParameterRanges: (json['IntegerParameterRanges'] as List)
        ?.map((e) => e == null
            ? null
            : IntegerParameterRange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
      instance.categoricalParameterRanges?.map((e) => e?.toJson())?.toList());
  writeNotNull('ContinuousParameterRanges',
      instance.continuousParameterRanges?.map((e) => e?.toJson())?.toList());
  writeNotNull('IntegerParameterRanges',
      instance.integerParameterRanges?.map((e) => e?.toJson())?.toList());
  return val;
}

Parent _$ParentFromJson(Map<String, dynamic> json) {
  return Parent(
    experimentName: json['ExperimentName'] as String,
    trialName: json['TrialName'] as String,
  );
}

ParentHyperParameterTuningJob _$ParentHyperParameterTuningJobFromJson(
    Map<String, dynamic> json) {
  return ParentHyperParameterTuningJob(
    hyperParameterTuningJobName: json['HyperParameterTuningJobName'] as String,
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

ProcessingClusterConfig _$ProcessingClusterConfigFromJson(
    Map<String, dynamic> json) {
  return ProcessingClusterConfig(
    instanceCount: json['InstanceCount'] as int,
    instanceType: _$enumDecodeNullable(
        _$ProcessingInstanceTypeEnumMap, json['InstanceType']),
    volumeSizeInGB: json['VolumeSizeInGB'] as int,
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
  );
}

Map<String, dynamic> _$ProcessingClusterConfigToJson(
    ProcessingClusterConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceCount', instance.instanceCount);
  writeNotNull(
      'InstanceType', _$ProcessingInstanceTypeEnumMap[instance.instanceType]);
  writeNotNull('VolumeSizeInGB', instance.volumeSizeInGB);
  writeNotNull('VolumeKmsKeyId', instance.volumeKmsKeyId);
  return val;
}

ProcessingInput _$ProcessingInputFromJson(Map<String, dynamic> json) {
  return ProcessingInput(
    inputName: json['InputName'] as String,
    s3Input: json['S3Input'] == null
        ? null
        : ProcessingS3Input.fromJson(json['S3Input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProcessingInputToJson(ProcessingInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InputName', instance.inputName);
  writeNotNull('S3Input', instance.s3Input?.toJson());
  return val;
}

ProcessingJob _$ProcessingJobFromJson(Map<String, dynamic> json) {
  return ProcessingJob(
    appSpecification: json['AppSpecification'] == null
        ? null
        : AppSpecification.fromJson(
            json['AppSpecification'] as Map<String, dynamic>),
    autoMLJobArn: json['AutoMLJobArn'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    environment: (json['Environment'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    exitMessage: json['ExitMessage'] as String,
    experimentConfig: json['ExperimentConfig'] == null
        ? null
        : ExperimentConfig.fromJson(
            json['ExperimentConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    monitoringScheduleArn: json['MonitoringScheduleArn'] as String,
    networkConfig: json['NetworkConfig'] == null
        ? null
        : NetworkConfig.fromJson(json['NetworkConfig'] as Map<String, dynamic>),
    processingEndTime:
        const UnixDateTimeConverter().fromJson(json['ProcessingEndTime']),
    processingInputs: (json['ProcessingInputs'] as List)
        ?.map((e) => e == null
            ? null
            : ProcessingInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    processingJobArn: json['ProcessingJobArn'] as String,
    processingJobName: json['ProcessingJobName'] as String,
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
    roleArn: json['RoleArn'] as String,
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : ProcessingStoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trainingJobArn: json['TrainingJobArn'] as String,
  );
}

ProcessingJobSummary _$ProcessingJobSummaryFromJson(Map<String, dynamic> json) {
  return ProcessingJobSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    processingJobArn: json['ProcessingJobArn'] as String,
    processingJobName: json['ProcessingJobName'] as String,
    processingJobStatus: _$enumDecodeNullable(
        _$ProcessingJobStatusEnumMap, json['ProcessingJobStatus']),
    exitMessage: json['ExitMessage'] as String,
    failureReason: json['FailureReason'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    processingEndTime:
        const UnixDateTimeConverter().fromJson(json['ProcessingEndTime']),
  );
}

ProcessingOutput _$ProcessingOutputFromJson(Map<String, dynamic> json) {
  return ProcessingOutput(
    outputName: json['OutputName'] as String,
    s3Output: json['S3Output'] == null
        ? null
        : ProcessingS3Output.fromJson(json['S3Output'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProcessingOutputToJson(ProcessingOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OutputName', instance.outputName);
  writeNotNull('S3Output', instance.s3Output?.toJson());
  return val;
}

ProcessingOutputConfig _$ProcessingOutputConfigFromJson(
    Map<String, dynamic> json) {
  return ProcessingOutputConfig(
    outputs: (json['Outputs'] as List)
        ?.map((e) => e == null
            ? null
            : ProcessingOutput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$ProcessingOutputConfigToJson(
    ProcessingOutputConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Outputs', instance.outputs?.map((e) => e?.toJson())?.toList());
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  return val;
}

ProcessingResources _$ProcessingResourcesFromJson(Map<String, dynamic> json) {
  return ProcessingResources(
    clusterConfig: json['ClusterConfig'] == null
        ? null
        : ProcessingClusterConfig.fromJson(
            json['ClusterConfig'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProcessingResourcesToJson(ProcessingResources instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterConfig', instance.clusterConfig?.toJson());
  return val;
}

ProcessingS3Input _$ProcessingS3InputFromJson(Map<String, dynamic> json) {
  return ProcessingS3Input(
    localPath: json['LocalPath'] as String,
    s3DataType:
        _$enumDecodeNullable(_$ProcessingS3DataTypeEnumMap, json['S3DataType']),
    s3InputMode: _$enumDecodeNullable(
        _$ProcessingS3InputModeEnumMap, json['S3InputMode']),
    s3Uri: json['S3Uri'] as String,
    s3CompressionType: _$enumDecodeNullable(
        _$ProcessingS3CompressionTypeEnumMap, json['S3CompressionType']),
    s3DataDistributionType: _$enumDecodeNullable(
        _$ProcessingS3DataDistributionTypeEnumMap,
        json['S3DataDistributionType']),
  );
}

Map<String, dynamic> _$ProcessingS3InputToJson(ProcessingS3Input instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LocalPath', instance.localPath);
  writeNotNull(
      'S3DataType', _$ProcessingS3DataTypeEnumMap[instance.s3DataType]);
  writeNotNull(
      'S3InputMode', _$ProcessingS3InputModeEnumMap[instance.s3InputMode]);
  writeNotNull('S3Uri', instance.s3Uri);
  writeNotNull('S3CompressionType',
      _$ProcessingS3CompressionTypeEnumMap[instance.s3CompressionType]);
  writeNotNull(
      'S3DataDistributionType',
      _$ProcessingS3DataDistributionTypeEnumMap[
          instance.s3DataDistributionType]);
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
    s3UploadMode: _$enumDecodeNullable(
        _$ProcessingS3UploadModeEnumMap, json['S3UploadMode']),
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$ProcessingS3OutputToJson(ProcessingS3Output instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LocalPath', instance.localPath);
  writeNotNull(
      'S3UploadMode', _$ProcessingS3UploadModeEnumMap[instance.s3UploadMode]);
  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

ProcessingStoppingCondition _$ProcessingStoppingConditionFromJson(
    Map<String, dynamic> json) {
  return ProcessingStoppingCondition(
    maxRuntimeInSeconds: json['MaxRuntimeInSeconds'] as int,
  );
}

Map<String, dynamic> _$ProcessingStoppingConditionToJson(
    ProcessingStoppingCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxRuntimeInSeconds', instance.maxRuntimeInSeconds);
  return val;
}

ProductionVariant _$ProductionVariantFromJson(Map<String, dynamic> json) {
  return ProductionVariant(
    initialInstanceCount: json['InitialInstanceCount'] as int,
    instanceType: _$enumDecodeNullable(
        _$ProductionVariantInstanceTypeEnumMap, json['InstanceType']),
    modelName: json['ModelName'] as String,
    variantName: json['VariantName'] as String,
    acceleratorType: _$enumDecodeNullable(
        _$ProductionVariantAcceleratorTypeEnumMap, json['AcceleratorType']),
    initialVariantWeight: (json['InitialVariantWeight'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ProductionVariantToJson(ProductionVariant instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InitialInstanceCount', instance.initialInstanceCount);
  writeNotNull('InstanceType',
      _$ProductionVariantInstanceTypeEnumMap[instance.instanceType]);
  writeNotNull('ModelName', instance.modelName);
  writeNotNull('VariantName', instance.variantName);
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
    currentInstanceCount: json['CurrentInstanceCount'] as int,
    currentWeight: (json['CurrentWeight'] as num)?.toDouble(),
    deployedImages: (json['DeployedImages'] as List)
        ?.map((e) => e == null
            ? null
            : DeployedImage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    desiredInstanceCount: json['DesiredInstanceCount'] as int,
    desiredWeight: (json['DesiredWeight'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PropertyNameQueryToJson(PropertyNameQuery instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PropertyNameHint', instance.propertyNameHint);
  return val;
}

PropertyNameSuggestion _$PropertyNameSuggestionFromJson(
    Map<String, dynamic> json) {
  return PropertyNameSuggestion(
    propertyName: json['PropertyName'] as String,
  );
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

RenderUiTemplateResponse _$RenderUiTemplateResponseFromJson(
    Map<String, dynamic> json) {
  return RenderUiTemplateResponse(
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : RenderingError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    renderedContent: json['RenderedContent'] as String,
  );
}

Map<String, dynamic> _$RenderableTaskToJson(RenderableTask instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Input', instance.input);
  return val;
}

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
    instanceType: _$enumDecodeNullable(
        _$TrainingInstanceTypeEnumMap, json['InstanceType']),
    volumeSizeInGB: json['VolumeSizeInGB'] as int,
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
  );
}

Map<String, dynamic> _$ResourceConfigToJson(ResourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceCount', instance.instanceCount);
  writeNotNull(
      'InstanceType', _$TrainingInstanceTypeEnumMap[instance.instanceType]);
  writeNotNull('VolumeSizeInGB', instance.volumeSizeInGB);
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

Map<String, dynamic> _$ResourceLimitsToJson(ResourceLimits instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxNumberOfTrainingJobs', instance.maxNumberOfTrainingJobs);
  writeNotNull('MaxParallelTrainingJobs', instance.maxParallelTrainingJobs);
  return val;
}

ResourceSpec _$ResourceSpecFromJson(Map<String, dynamic> json) {
  return ResourceSpec(
    environmentArn: json['EnvironmentArn'] as String,
    instanceType:
        _$enumDecodeNullable(_$AppInstanceTypeEnumMap, json['InstanceType']),
  );
}

Map<String, dynamic> _$ResourceSpecToJson(ResourceSpec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EnvironmentArn', instance.environmentArn);
  writeNotNull('InstanceType', _$AppInstanceTypeEnumMap[instance.instanceType]);
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
    s3DataType: _$enumDecodeNullable(_$S3DataTypeEnumMap, json['S3DataType']),
    s3Uri: json['S3Uri'] as String,
    attributeNames:
        (json['AttributeNames'] as List)?.map((e) => e as String)?.toList(),
    s3DataDistributionType: _$enumDecodeNullable(
        _$S3DataDistributionEnumMap, json['S3DataDistributionType']),
  );
}

Map<String, dynamic> _$S3DataSourceToJson(S3DataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3DataType', _$S3DataTypeEnumMap[instance.s3DataType]);
  writeNotNull('S3Uri', instance.s3Uri);
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

ScheduleConfig _$ScheduleConfigFromJson(Map<String, dynamic> json) {
  return ScheduleConfig(
    scheduleExpression: json['ScheduleExpression'] as String,
  );
}

Map<String, dynamic> _$ScheduleConfigToJson(ScheduleConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ScheduleExpression', instance.scheduleExpression);
  return val;
}

Map<String, dynamic> _$SearchExpressionToJson(SearchExpression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('NestedFilters',
      instance.nestedFilters?.map((e) => e?.toJson())?.toList());
  writeNotNull('Operator', _$BooleanOperatorEnumMap[instance.operator]);
  writeNotNull('SubExpressions',
      instance.subExpressions?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$BooleanOperatorEnumMap = {
  BooleanOperator.and: 'And',
  BooleanOperator.or: 'Or',
};

SearchRecord _$SearchRecordFromJson(Map<String, dynamic> json) {
  return SearchRecord(
    experiment: json['Experiment'] == null
        ? null
        : Experiment.fromJson(json['Experiment'] as Map<String, dynamic>),
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
    nextToken: json['NextToken'] as String,
    results: (json['Results'] as List)
        ?.map((e) =>
            e == null ? null : SearchRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SecondaryStatusTransition _$SecondaryStatusTransitionFromJson(
    Map<String, dynamic> json) {
  return SecondaryStatusTransition(
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    status: _$enumDecodeNullable(_$SecondaryStatusEnumMap, json['Status']),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    statusMessage: json['StatusMessage'] as String,
  );
}

SharingSettings _$SharingSettingsFromJson(Map<String, dynamic> json) {
  return SharingSettings(
    notebookOutputOption: _$enumDecodeNullable(
        _$NotebookOutputOptionEnumMap, json['NotebookOutputOption']),
    s3KmsKeyId: json['S3KmsKeyId'] as String,
    s3OutputPath: json['S3OutputPath'] as String,
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

Map<String, dynamic> _$ShuffleConfigToJson(ShuffleConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Seed', instance.seed);
  return val;
}

SourceAlgorithm _$SourceAlgorithmFromJson(Map<String, dynamic> json) {
  return SourceAlgorithm(
    algorithmName: json['AlgorithmName'] as String,
    modelDataUrl: json['ModelDataUrl'] as String,
  );
}

Map<String, dynamic> _$SourceAlgorithmToJson(SourceAlgorithm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlgorithmName', instance.algorithmName);
  writeNotNull('ModelDataUrl', instance.modelDataUrl);
  return val;
}

SourceAlgorithmSpecification _$SourceAlgorithmSpecificationFromJson(
    Map<String, dynamic> json) {
  return SourceAlgorithmSpecification(
    sourceAlgorithms: (json['SourceAlgorithms'] as List)
        ?.map((e) => e == null
            ? null
            : SourceAlgorithm.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SourceAlgorithmSpecificationToJson(
    SourceAlgorithmSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceAlgorithms',
      instance.sourceAlgorithms?.map((e) => e?.toJson())?.toList());
  return val;
}

SourceIpConfig _$SourceIpConfigFromJson(Map<String, dynamic> json) {
  return SourceIpConfig(
    cidrs: (json['Cidrs'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SourceIpConfigToJson(SourceIpConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Cidrs', instance.cidrs);
  return val;
}

StoppingCondition _$StoppingConditionFromJson(Map<String, dynamic> json) {
  return StoppingCondition(
    maxRuntimeInSeconds: json['MaxRuntimeInSeconds'] as int,
    maxWaitTimeInSeconds: json['MaxWaitTimeInSeconds'] as int,
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
    listingId: json['ListingId'] as String,
    marketplaceDescription: json['MarketplaceDescription'] as String,
    marketplaceTitle: json['MarketplaceTitle'] as String,
    sellerName: json['SellerName'] as String,
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
    localPath: json['LocalPath'] as String,
  );
}

Map<String, dynamic> _$TensorBoardOutputConfigToJson(
    TensorBoardOutputConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3OutputPath', instance.s3OutputPath);
  writeNotNull('LocalPath', instance.localPath);
  return val;
}

TrainingJob _$TrainingJobFromJson(Map<String, dynamic> json) {
  return TrainingJob(
    algorithmSpecification: json['AlgorithmSpecification'] == null
        ? null
        : AlgorithmSpecification.fromJson(
            json['AlgorithmSpecification'] as Map<String, dynamic>),
    autoMLJobArn: json['AutoMLJobArn'] as String,
    billableTimeInSeconds: json['BillableTimeInSeconds'] as int,
    checkpointConfig: json['CheckpointConfig'] == null
        ? null
        : CheckpointConfig.fromJson(
            json['CheckpointConfig'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    debugHookConfig: json['DebugHookConfig'] == null
        ? null
        : DebugHookConfig.fromJson(
            json['DebugHookConfig'] as Map<String, dynamic>),
    debugRuleConfigurations: (json['DebugRuleConfigurations'] as List)
        ?.map((e) => e == null
            ? null
            : DebugRuleConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    debugRuleEvaluationStatuses: (json['DebugRuleEvaluationStatuses'] as List)
        ?.map((e) => e == null
            ? null
            : DebugRuleEvaluationStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    enableInterContainerTrafficEncryption:
        json['EnableInterContainerTrafficEncryption'] as bool,
    enableManagedSpotTraining: json['EnableManagedSpotTraining'] as bool,
    enableNetworkIsolation: json['EnableNetworkIsolation'] as bool,
    experimentConfig: json['ExperimentConfig'] == null
        ? null
        : ExperimentConfig.fromJson(
            json['ExperimentConfig'] as Map<String, dynamic>),
    failureReason: json['FailureReason'] as String,
    finalMetricDataList: (json['FinalMetricDataList'] as List)
        ?.map((e) =>
            e == null ? null : MetricData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hyperParameters: (json['HyperParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    inputDataConfig: (json['InputDataConfig'] as List)
        ?.map((e) =>
            e == null ? null : Channel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    labelingJobArn: json['LabelingJobArn'] as String,
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
    roleArn: json['RoleArn'] as String,
    secondaryStatus:
        _$enumDecodeNullable(_$SecondaryStatusEnumMap, json['SecondaryStatus']),
    secondaryStatusTransitions: (json['SecondaryStatusTransitions'] as List)
        ?.map((e) => e == null
            ? null
            : SecondaryStatusTransition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : StoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tensorBoardOutputConfig: json['TensorBoardOutputConfig'] == null
        ? null
        : TensorBoardOutputConfig.fromJson(
            json['TensorBoardOutputConfig'] as Map<String, dynamic>),
    trainingEndTime:
        const UnixDateTimeConverter().fromJson(json['TrainingEndTime']),
    trainingJobArn: json['TrainingJobArn'] as String,
    trainingJobName: json['TrainingJobName'] as String,
    trainingJobStatus: _$enumDecodeNullable(
        _$TrainingJobStatusEnumMap, json['TrainingJobStatus']),
    trainingStartTime:
        const UnixDateTimeConverter().fromJson(json['TrainingStartTime']),
    trainingTimeInSeconds: json['TrainingTimeInSeconds'] as int,
    tuningJobArn: json['TuningJobArn'] as String,
    vpcConfig: json['VpcConfig'] == null
        ? null
        : VpcConfig.fromJson(json['VpcConfig'] as Map<String, dynamic>),
  );
}

TrainingJobDefinition _$TrainingJobDefinitionFromJson(
    Map<String, dynamic> json) {
  return TrainingJobDefinition(
    inputDataConfig: (json['InputDataConfig'] as List)
        ?.map((e) =>
            e == null ? null : Channel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outputDataConfig: json['OutputDataConfig'] == null
        ? null
        : OutputDataConfig.fromJson(
            json['OutputDataConfig'] as Map<String, dynamic>),
    resourceConfig: json['ResourceConfig'] == null
        ? null
        : ResourceConfig.fromJson(
            json['ResourceConfig'] as Map<String, dynamic>),
    stoppingCondition: json['StoppingCondition'] == null
        ? null
        : StoppingCondition.fromJson(
            json['StoppingCondition'] as Map<String, dynamic>),
    trainingInputMode: _$enumDecodeNullable(
        _$TrainingInputModeEnumMap, json['TrainingInputMode']),
    hyperParameters: (json['HyperParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$TrainingJobDefinitionToJson(
    TrainingJobDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InputDataConfig',
      instance.inputDataConfig?.map((e) => e?.toJson())?.toList());
  writeNotNull('OutputDataConfig', instance.outputDataConfig?.toJson());
  writeNotNull('ResourceConfig', instance.resourceConfig?.toJson());
  writeNotNull('StoppingCondition', instance.stoppingCondition?.toJson());
  writeNotNull('TrainingInputMode',
      _$TrainingInputModeEnumMap[instance.trainingInputMode]);
  writeNotNull('HyperParameters', instance.hyperParameters);
  return val;
}

TrainingJobStatusCounters _$TrainingJobStatusCountersFromJson(
    Map<String, dynamic> json) {
  return TrainingJobStatusCounters(
    completed: json['Completed'] as int,
    inProgress: json['InProgress'] as int,
    nonRetryableError: json['NonRetryableError'] as int,
    retryableError: json['RetryableError'] as int,
    stopped: json['Stopped'] as int,
  );
}

TrainingJobSummary _$TrainingJobSummaryFromJson(Map<String, dynamic> json) {
  return TrainingJobSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    trainingJobArn: json['TrainingJobArn'] as String,
    trainingJobName: json['TrainingJobName'] as String,
    trainingJobStatus: _$enumDecodeNullable(
        _$TrainingJobStatusEnumMap, json['TrainingJobStatus']),
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
        (json['SupportedTrainingInstanceTypes'] as List)
            ?.map((e) => _$enumDecodeNullable(_$TrainingInstanceTypeEnumMap, e))
            ?.toList(),
    trainingChannels: (json['TrainingChannels'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelSpecification.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trainingImage: json['TrainingImage'] as String,
    metricDefinitions: (json['MetricDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : MetricDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    supportedHyperParameters: (json['SupportedHyperParameters'] as List)
        ?.map((e) => e == null
            ? null
            : HyperParameterSpecification.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    supportedTuningJobObjectiveMetrics:
        (json['SupportedTuningJobObjectiveMetrics'] as List)
            ?.map((e) => e == null
                ? null
                : HyperParameterTuningJobObjective.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    supportsDistributedTraining: json['SupportsDistributedTraining'] as bool,
    trainingImageDigest: json['TrainingImageDigest'] as String,
  );
}

Map<String, dynamic> _$TrainingSpecificationToJson(
    TrainingSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'SupportedTrainingInstanceTypes',
      instance.supportedTrainingInstanceTypes
          ?.map((e) => _$TrainingInstanceTypeEnumMap[e])
          ?.toList());
  writeNotNull('TrainingChannels',
      instance.trainingChannels?.map((e) => e?.toJson())?.toList());
  writeNotNull('TrainingImage', instance.trainingImage);
  writeNotNull('MetricDefinitions',
      instance.metricDefinitions?.map((e) => e?.toJson())?.toList());
  writeNotNull('SupportedHyperParameters',
      instance.supportedHyperParameters?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'SupportedTuningJobObjectiveMetrics',
      instance.supportedTuningJobObjectiveMetrics
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'SupportsDistributedTraining', instance.supportsDistributedTraining);
  writeNotNull('TrainingImageDigest', instance.trainingImageDigest);
  return val;
}

TransformDataSource _$TransformDataSourceFromJson(Map<String, dynamic> json) {
  return TransformDataSource(
    s3DataSource: json['S3DataSource'] == null
        ? null
        : TransformS3DataSource.fromJson(
            json['S3DataSource'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransformDataSourceToJson(TransformDataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3DataSource', instance.s3DataSource?.toJson());
  return val;
}

TransformInput _$TransformInputFromJson(Map<String, dynamic> json) {
  return TransformInput(
    dataSource: json['DataSource'] == null
        ? null
        : TransformDataSource.fromJson(
            json['DataSource'] as Map<String, dynamic>),
    compressionType:
        _$enumDecodeNullable(_$CompressionTypeEnumMap, json['CompressionType']),
    contentType: json['ContentType'] as String,
    splitType: _$enumDecodeNullable(_$SplitTypeEnumMap, json['SplitType']),
  );
}

Map<String, dynamic> _$TransformInputToJson(TransformInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataSource', instance.dataSource?.toJson());
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

TransformJobDefinition _$TransformJobDefinitionFromJson(
    Map<String, dynamic> json) {
  return TransformJobDefinition(
    transformInput: json['TransformInput'] == null
        ? null
        : TransformInput.fromJson(
            json['TransformInput'] as Map<String, dynamic>),
    transformOutput: json['TransformOutput'] == null
        ? null
        : TransformOutput.fromJson(
            json['TransformOutput'] as Map<String, dynamic>),
    transformResources: json['TransformResources'] == null
        ? null
        : TransformResources.fromJson(
            json['TransformResources'] as Map<String, dynamic>),
    batchStrategy:
        _$enumDecodeNullable(_$BatchStrategyEnumMap, json['BatchStrategy']),
    environment: (json['Environment'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    maxConcurrentTransforms: json['MaxConcurrentTransforms'] as int,
    maxPayloadInMB: json['MaxPayloadInMB'] as int,
  );
}

Map<String, dynamic> _$TransformJobDefinitionToJson(
    TransformJobDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TransformInput', instance.transformInput?.toJson());
  writeNotNull('TransformOutput', instance.transformOutput?.toJson());
  writeNotNull('TransformResources', instance.transformResources?.toJson());
  writeNotNull('BatchStrategy', _$BatchStrategyEnumMap[instance.batchStrategy]);
  writeNotNull('Environment', instance.environment);
  writeNotNull('MaxConcurrentTransforms', instance.maxConcurrentTransforms);
  writeNotNull('MaxPayloadInMB', instance.maxPayloadInMB);
  return val;
}

TransformJobSummary _$TransformJobSummaryFromJson(Map<String, dynamic> json) {
  return TransformJobSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    transformJobArn: json['TransformJobArn'] as String,
    transformJobName: json['TransformJobName'] as String,
    transformJobStatus: _$enumDecodeNullable(
        _$TransformJobStatusEnumMap, json['TransformJobStatus']),
    failureReason: json['FailureReason'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    transformEndTime:
        const UnixDateTimeConverter().fromJson(json['TransformEndTime']),
  );
}

TransformOutput _$TransformOutputFromJson(Map<String, dynamic> json) {
  return TransformOutput(
    s3OutputPath: json['S3OutputPath'] as String,
    accept: json['Accept'] as String,
    assembleWith:
        _$enumDecodeNullable(_$AssemblyTypeEnumMap, json['AssembleWith']),
    kmsKeyId: json['KmsKeyId'] as String,
  );
}

Map<String, dynamic> _$TransformOutputToJson(TransformOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3OutputPath', instance.s3OutputPath);
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
    instanceType: _$enumDecodeNullable(
        _$TransformInstanceTypeEnumMap, json['InstanceType']),
    volumeKmsKeyId: json['VolumeKmsKeyId'] as String,
  );
}

Map<String, dynamic> _$TransformResourcesToJson(TransformResources instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InstanceCount', instance.instanceCount);
  writeNotNull(
      'InstanceType', _$TransformInstanceTypeEnumMap[instance.instanceType]);
  writeNotNull('VolumeKmsKeyId', instance.volumeKmsKeyId);
  return val;
}

TransformS3DataSource _$TransformS3DataSourceFromJson(
    Map<String, dynamic> json) {
  return TransformS3DataSource(
    s3DataType: _$enumDecodeNullable(_$S3DataTypeEnumMap, json['S3DataType']),
    s3Uri: json['S3Uri'] as String,
  );
}

Map<String, dynamic> _$TransformS3DataSourceToJson(
    TransformS3DataSource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('S3DataType', _$S3DataTypeEnumMap[instance.s3DataType]);
  writeNotNull('S3Uri', instance.s3Uri);
  return val;
}

Trial _$TrialFromJson(Map<String, dynamic> json) {
  return Trial(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    displayName: json['DisplayName'] as String,
    experimentName: json['ExperimentName'] as String,
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    source: json['Source'] == null
        ? null
        : TrialSource.fromJson(json['Source'] as Map<String, dynamic>),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trialArn: json['TrialArn'] as String,
    trialComponentSummaries: (json['TrialComponentSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : TrialComponentSimpleSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trialName: json['TrialName'] as String,
  );
}

TrialComponent _$TrialComponentFromJson(Map<String, dynamic> json) {
  return TrialComponent(
    createdBy: json['CreatedBy'] == null
        ? null
        : UserContext.fromJson(json['CreatedBy'] as Map<String, dynamic>),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    displayName: json['DisplayName'] as String,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    inputArtifacts: (json['InputArtifacts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : TrialComponentArtifact.fromJson(e as Map<String, dynamic>)),
    ),
    lastModifiedBy: json['LastModifiedBy'] == null
        ? null
        : UserContext.fromJson(json['LastModifiedBy'] as Map<String, dynamic>),
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    metrics: (json['Metrics'] as List)
        ?.map((e) => e == null
            ? null
            : TrialComponentMetricSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outputArtifacts: (json['OutputArtifacts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : TrialComponentArtifact.fromJson(e as Map<String, dynamic>)),
    ),
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : TrialComponentParameterValue.fromJson(
                  e as Map<String, dynamic>)),
    ),
    parents: (json['Parents'] as List)
        ?.map((e) =>
            e == null ? null : Parent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trialComponentArn: json['TrialComponentArn'] as String,
    trialComponentName: json['TrialComponentName'] as String,
  );
}

TrialComponentArtifact _$TrialComponentArtifactFromJson(
    Map<String, dynamic> json) {
  return TrialComponentArtifact(
    value: json['Value'] as String,
    mediaType: json['MediaType'] as String,
  );
}

Map<String, dynamic> _$TrialComponentArtifactToJson(
    TrialComponentArtifact instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Value', instance.value);
  writeNotNull('MediaType', instance.mediaType);
  return val;
}

TrialComponentMetricSummary _$TrialComponentMetricSummaryFromJson(
    Map<String, dynamic> json) {
  return TrialComponentMetricSummary(
    avg: (json['Avg'] as num)?.toDouble(),
    count: json['Count'] as int,
    last: (json['Last'] as num)?.toDouble(),
    max: (json['Max'] as num)?.toDouble(),
    metricName: json['MetricName'] as String,
    min: (json['Min'] as num)?.toDouble(),
    sourceArn: json['SourceArn'] as String,
    stdDev: (json['StdDev'] as num)?.toDouble(),
    timeStamp: const UnixDateTimeConverter().fromJson(json['TimeStamp']),
  );
}

TrialComponentParameterValue _$TrialComponentParameterValueFromJson(
    Map<String, dynamic> json) {
  return TrialComponentParameterValue(
    numberValue: (json['NumberValue'] as num)?.toDouble(),
    stringValue: json['StringValue'] as String,
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
    trialComponentArn: json['TrialComponentArn'] as String,
    trialComponentName: json['TrialComponentName'] as String,
    trialComponentSource: json['TrialComponentSource'] == null
        ? null
        : TrialComponentSource.fromJson(
            json['TrialComponentSource'] as Map<String, dynamic>),
  );
}

TrialComponentSource _$TrialComponentSourceFromJson(Map<String, dynamic> json) {
  return TrialComponentSource(
    sourceArn: json['SourceArn'] as String,
    sourceType: json['SourceType'] as String,
  );
}

TrialComponentSourceDetail _$TrialComponentSourceDetailFromJson(
    Map<String, dynamic> json) {
  return TrialComponentSourceDetail(
    processingJob: json['ProcessingJob'] == null
        ? null
        : ProcessingJob.fromJson(json['ProcessingJob'] as Map<String, dynamic>),
    sourceArn: json['SourceArn'] as String,
    trainingJob: json['TrainingJob'] == null
        ? null
        : TrainingJob.fromJson(json['TrainingJob'] as Map<String, dynamic>),
  );
}

TrialComponentStatus _$TrialComponentStatusFromJson(Map<String, dynamic> json) {
  return TrialComponentStatus(
    message: json['Message'] as String,
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
    displayName: json['DisplayName'] as String,
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
    trialComponentArn: json['TrialComponentArn'] as String,
    trialComponentName: json['TrialComponentName'] as String,
    trialComponentSource: json['TrialComponentSource'] == null
        ? null
        : TrialComponentSource.fromJson(
            json['TrialComponentSource'] as Map<String, dynamic>),
  );
}

TrialSource _$TrialSourceFromJson(Map<String, dynamic> json) {
  return TrialSource(
    sourceArn: json['SourceArn'] as String,
    sourceType: json['SourceType'] as String,
  );
}

TrialSummary _$TrialSummaryFromJson(Map<String, dynamic> json) {
  return TrialSummary(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    displayName: json['DisplayName'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    trialArn: json['TrialArn'] as String,
    trialName: json['TrialName'] as String,
    trialSource: json['TrialSource'] == null
        ? null
        : TrialSource.fromJson(json['TrialSource'] as Map<String, dynamic>),
  );
}

TuningJobCompletionCriteria _$TuningJobCompletionCriteriaFromJson(
    Map<String, dynamic> json) {
  return TuningJobCompletionCriteria(
    targetObjectiveMetricValue:
        (json['TargetObjectiveMetricValue'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TuningJobCompletionCriteriaToJson(
    TuningJobCompletionCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'TargetObjectiveMetricValue', instance.targetObjectiveMetricValue);
  return val;
}

USD _$USDFromJson(Map<String, dynamic> json) {
  return USD(
    cents: json['Cents'] as int,
    dollars: json['Dollars'] as int,
    tenthFractionsOfACent: json['TenthFractionsOfACent'] as int,
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
    uiTemplateS3Uri: json['UiTemplateS3Uri'] as String,
  );
}

Map<String, dynamic> _$UiConfigToJson(UiConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UiTemplateS3Uri', instance.uiTemplateS3Uri);
  return val;
}

Map<String, dynamic> _$UiTemplateToJson(UiTemplate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Content', instance.content);
  return val;
}

UiTemplateInfo _$UiTemplateInfoFromJson(Map<String, dynamic> json) {
  return UiTemplateInfo(
    contentSha256: json['ContentSha256'] as String,
    url: json['Url'] as String,
  );
}

UpdateCodeRepositoryOutput _$UpdateCodeRepositoryOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateCodeRepositoryOutput(
    codeRepositoryArn: json['CodeRepositoryArn'] as String,
  );
}

UpdateDomainResponse _$UpdateDomainResponseFromJson(Map<String, dynamic> json) {
  return UpdateDomainResponse(
    domainArn: json['DomainArn'] as String,
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
    experimentArn: json['ExperimentArn'] as String,
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

UpdateTrialComponentResponse _$UpdateTrialComponentResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateTrialComponentResponse(
    trialComponentArn: json['TrialComponentArn'] as String,
  );
}

UpdateTrialResponse _$UpdateTrialResponseFromJson(Map<String, dynamic> json) {
  return UpdateTrialResponse(
    trialArn: json['TrialArn'] as String,
  );
}

UpdateUserProfileResponse _$UpdateUserProfileResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateUserProfileResponse(
    userProfileArn: json['UserProfileArn'] as String,
  );
}

UpdateWorkforceResponse _$UpdateWorkforceResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateWorkforceResponse(
    workforce: json['Workforce'] == null
        ? null
        : Workforce.fromJson(json['Workforce'] as Map<String, dynamic>),
  );
}

UpdateWorkteamResponse _$UpdateWorkteamResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateWorkteamResponse(
    workteam: json['Workteam'] == null
        ? null
        : Workteam.fromJson(json['Workteam'] as Map<String, dynamic>),
  );
}

UserContext _$UserContextFromJson(Map<String, dynamic> json) {
  return UserContext(
    domainId: json['DomainId'] as String,
    userProfileArn: json['UserProfileArn'] as String,
    userProfileName: json['UserProfileName'] as String,
  );
}

UserProfileDetails _$UserProfileDetailsFromJson(Map<String, dynamic> json) {
  return UserProfileDetails(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    domainId: json['DomainId'] as String,
    lastModifiedTime:
        const UnixDateTimeConverter().fromJson(json['LastModifiedTime']),
    status: _$enumDecodeNullable(_$UserProfileStatusEnumMap, json['Status']),
    userProfileName: json['UserProfileName'] as String,
  );
}

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return UserSettings(
    executionRole: json['ExecutionRole'] as String,
    jupyterServerAppSettings: json['JupyterServerAppSettings'] == null
        ? null
        : JupyterServerAppSettings.fromJson(
            json['JupyterServerAppSettings'] as Map<String, dynamic>),
    kernelGatewayAppSettings: json['KernelGatewayAppSettings'] == null
        ? null
        : KernelGatewayAppSettings.fromJson(
            json['KernelGatewayAppSettings'] as Map<String, dynamic>),
    securityGroups:
        (json['SecurityGroups'] as List)?.map((e) => e as String)?.toList(),
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

Map<String, dynamic> _$VariantPropertyToJson(VariantProperty instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('VariantPropertyType',
      _$VariantPropertyTypeEnumMap[instance.variantPropertyType]);
  return val;
}

const _$VariantPropertyTypeEnumMap = {
  VariantPropertyType.desiredInstanceCount: 'DesiredInstanceCount',
  VariantPropertyType.desiredWeight: 'DesiredWeight',
  VariantPropertyType.dataCaptureConfig: 'DataCaptureConfig',
};

VpcConfig _$VpcConfigFromJson(Map<String, dynamic> json) {
  return VpcConfig(
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnets: (json['Subnets'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$VpcConfigToJson(VpcConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('Subnets', instance.subnets);
  return val;
}

Workforce _$WorkforceFromJson(Map<String, dynamic> json) {
  return Workforce(
    workforceArn: json['WorkforceArn'] as String,
    workforceName: json['WorkforceName'] as String,
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedDate']),
    sourceIpConfig: json['SourceIpConfig'] == null
        ? null
        : SourceIpConfig.fromJson(
            json['SourceIpConfig'] as Map<String, dynamic>),
  );
}

Workteam _$WorkteamFromJson(Map<String, dynamic> json) {
  return Workteam(
    description: json['Description'] as String,
    memberDefinitions: (json['MemberDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : MemberDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    workteamArn: json['WorkteamArn'] as String,
    workteamName: json['WorkteamName'] as String,
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    lastUpdatedDate:
        const UnixDateTimeConverter().fromJson(json['LastUpdatedDate']),
    notificationConfiguration: json['NotificationConfiguration'] == null
        ? null
        : NotificationConfiguration.fromJson(
            json['NotificationConfiguration'] as Map<String, dynamic>),
    productListingIds:
        (json['ProductListingIds'] as List)?.map((e) => e as String)?.toList(),
    subDomain: json['SubDomain'] as String,
  );
}
