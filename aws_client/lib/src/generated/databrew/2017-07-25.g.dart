// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-07-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchDeleteRecipeVersionResponse _$BatchDeleteRecipeVersionResponseFromJson(
    Map<String, dynamic> json) {
  return BatchDeleteRecipeVersionResponse(
    name: json['Name'] as String,
    errors: (json['Errors'] as List)
        ?.map((e) => e == null
            ? null
            : RecipeVersionErrorDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ConditionExpression _$ConditionExpressionFromJson(Map<String, dynamic> json) {
  return ConditionExpression(
    condition: json['Condition'] as String,
    targetColumn: json['TargetColumn'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$ConditionExpressionToJson(ConditionExpression instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Condition', instance.condition);
  writeNotNull('TargetColumn', instance.targetColumn);
  writeNotNull('Value', instance.value);
  return val;
}

CreateDatasetResponse _$CreateDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return CreateDatasetResponse(
    name: json['Name'] as String,
  );
}

CreateProfileJobResponse _$CreateProfileJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProfileJobResponse(
    name: json['Name'] as String,
  );
}

CreateProjectResponse _$CreateProjectResponseFromJson(
    Map<String, dynamic> json) {
  return CreateProjectResponse(
    name: json['Name'] as String,
  );
}

CreateRecipeJobResponse _$CreateRecipeJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateRecipeJobResponse(
    name: json['Name'] as String,
  );
}

CreateRecipeResponse _$CreateRecipeResponseFromJson(Map<String, dynamic> json) {
  return CreateRecipeResponse(
    name: json['Name'] as String,
  );
}

CreateScheduleResponse _$CreateScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return CreateScheduleResponse(
    name: json['Name'] as String,
  );
}

DataCatalogInputDefinition _$DataCatalogInputDefinitionFromJson(
    Map<String, dynamic> json) {
  return DataCatalogInputDefinition(
    databaseName: json['DatabaseName'] as String,
    tableName: json['TableName'] as String,
    catalogId: json['CatalogId'] as String,
    tempDirectory: json['TempDirectory'] == null
        ? null
        : S3Location.fromJson(json['TempDirectory'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataCatalogInputDefinitionToJson(
    DataCatalogInputDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('TableName', instance.tableName);
  writeNotNull('CatalogId', instance.catalogId);
  writeNotNull('TempDirectory', instance.tempDirectory?.toJson());
  return val;
}

Dataset _$DatasetFromJson(Map<String, dynamic> json) {
  return Dataset(
    input: json['Input'] == null
        ? null
        : Input.fromJson(json['Input'] as Map<String, dynamic>),
    name: json['Name'] as String,
    accountId: json['AccountId'] as String,
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    createdBy: json['CreatedBy'] as String,
    formatOptions: json['FormatOptions'] == null
        ? null
        : FormatOptions.fromJson(json['FormatOptions'] as Map<String, dynamic>),
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    resourceArn: json['ResourceArn'] as String,
    source: _$enumDecodeNullable(_$SourceEnumMap, json['Source']),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
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

const _$SourceEnumMap = {
  Source.s3: 'S3',
  Source.dataCatalog: 'DATA-CATALOG',
};

DeleteDatasetResponse _$DeleteDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDatasetResponse(
    name: json['Name'] as String,
  );
}

DeleteJobResponse _$DeleteJobResponseFromJson(Map<String, dynamic> json) {
  return DeleteJobResponse(
    name: json['Name'] as String,
  );
}

DeleteProjectResponse _$DeleteProjectResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteProjectResponse(
    name: json['Name'] as String,
  );
}

DeleteRecipeVersionResponse _$DeleteRecipeVersionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteRecipeVersionResponse(
    name: json['Name'] as String,
    recipeVersion: json['RecipeVersion'] as String,
  );
}

DeleteScheduleResponse _$DeleteScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteScheduleResponse(
    name: json['Name'] as String,
  );
}

DescribeDatasetResponse _$DescribeDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDatasetResponse(
    input: json['Input'] == null
        ? null
        : Input.fromJson(json['Input'] as Map<String, dynamic>),
    name: json['Name'] as String,
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    createdBy: json['CreatedBy'] as String,
    formatOptions: json['FormatOptions'] == null
        ? null
        : FormatOptions.fromJson(json['FormatOptions'] as Map<String, dynamic>),
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    resourceArn: json['ResourceArn'] as String,
    source: _$enumDecodeNullable(_$SourceEnumMap, json['Source']),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DescribeJobResponse _$DescribeJobResponseFromJson(Map<String, dynamic> json) {
  return DescribeJobResponse(
    name: json['Name'] as String,
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    createdBy: json['CreatedBy'] as String,
    datasetName: json['DatasetName'] as String,
    encryptionKeyArn: json['EncryptionKeyArn'] as String,
    encryptionMode:
        _$enumDecodeNullable(_$EncryptionModeEnumMap, json['EncryptionMode']),
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    logSubscription:
        _$enumDecodeNullable(_$LogSubscriptionEnumMap, json['LogSubscription']),
    maxCapacity: json['MaxCapacity'] as int,
    maxRetries: json['MaxRetries'] as int,
    outputs: (json['Outputs'] as List)
        ?.map((e) =>
            e == null ? null : Output.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projectName: json['ProjectName'] as String,
    recipeReference: json['RecipeReference'] == null
        ? null
        : RecipeReference.fromJson(
            json['RecipeReference'] as Map<String, dynamic>),
    resourceArn: json['ResourceArn'] as String,
    roleArn: json['RoleArn'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    timeout: json['Timeout'] as int,
    type: _$enumDecodeNullable(_$JobTypeEnumMap, json['Type']),
  );
}

const _$EncryptionModeEnumMap = {
  EncryptionMode.sseKms: 'SSE-KMS',
  EncryptionMode.sseS3: 'SSE-S3',
};

const _$LogSubscriptionEnumMap = {
  LogSubscription.enable: 'ENABLE',
  LogSubscription.disable: 'DISABLE',
};

const _$JobTypeEnumMap = {
  JobType.profile: 'PROFILE',
  JobType.recipe: 'RECIPE',
};

DescribeProjectResponse _$DescribeProjectResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeProjectResponse(
    name: json['Name'] as String,
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    createdBy: json['CreatedBy'] as String,
    datasetName: json['DatasetName'] as String,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    openDate: const UnixDateTimeConverter().fromJson(json['OpenDate']),
    openedBy: json['OpenedBy'] as String,
    recipeName: json['RecipeName'] as String,
    resourceArn: json['ResourceArn'] as String,
    roleArn: json['RoleArn'] as String,
    sample: json['Sample'] == null
        ? null
        : Sample.fromJson(json['Sample'] as Map<String, dynamic>),
    sessionStatus:
        _$enumDecodeNullable(_$SessionStatusEnumMap, json['SessionStatus']),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$SessionStatusEnumMap = {
  SessionStatus.assigned: 'ASSIGNED',
  SessionStatus.failed: 'FAILED',
  SessionStatus.initializing: 'INITIALIZING',
  SessionStatus.provisioning: 'PROVISIONING',
  SessionStatus.ready: 'READY',
  SessionStatus.recycling: 'RECYCLING',
  SessionStatus.rotating: 'ROTATING',
  SessionStatus.terminated: 'TERMINATED',
  SessionStatus.terminating: 'TERMINATING',
  SessionStatus.updating: 'UPDATING',
};

DescribeRecipeResponse _$DescribeRecipeResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRecipeResponse(
    name: json['Name'] as String,
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    createdBy: json['CreatedBy'] as String,
    description: json['Description'] as String,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    projectName: json['ProjectName'] as String,
    publishedBy: json['PublishedBy'] as String,
    publishedDate:
        const UnixDateTimeConverter().fromJson(json['PublishedDate']),
    recipeVersion: json['RecipeVersion'] as String,
    resourceArn: json['ResourceArn'] as String,
    steps: (json['Steps'] as List)
        ?.map((e) =>
            e == null ? null : RecipeStep.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

DescribeScheduleResponse _$DescribeScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeScheduleResponse(
    name: json['Name'] as String,
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    createdBy: json['CreatedBy'] as String,
    cronExpression: json['CronExpression'] as String,
    jobNames: (json['JobNames'] as List)?.map((e) => e as String)?.toList(),
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    resourceArn: json['ResourceArn'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ExcelOptions _$ExcelOptionsFromJson(Map<String, dynamic> json) {
  return ExcelOptions(
    sheetIndexes:
        (json['SheetIndexes'] as List)?.map((e) => e as int)?.toList(),
    sheetNames: (json['SheetNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ExcelOptionsToJson(ExcelOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SheetIndexes', instance.sheetIndexes);
  writeNotNull('SheetNames', instance.sheetNames);
  return val;
}

FormatOptions _$FormatOptionsFromJson(Map<String, dynamic> json) {
  return FormatOptions(
    excel: json['Excel'] == null
        ? null
        : ExcelOptions.fromJson(json['Excel'] as Map<String, dynamic>),
    json: json['Json'] == null
        ? null
        : JsonOptions.fromJson(json['Json'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FormatOptionsToJson(FormatOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Excel', instance.excel?.toJson());
  writeNotNull('Json', instance.json?.toJson());
  return val;
}

Input _$InputFromJson(Map<String, dynamic> json) {
  return Input(
    dataCatalogInputDefinition: json['DataCatalogInputDefinition'] == null
        ? null
        : DataCatalogInputDefinition.fromJson(
            json['DataCatalogInputDefinition'] as Map<String, dynamic>),
    s3InputDefinition: json['S3InputDefinition'] == null
        ? null
        : S3Location.fromJson(
            json['S3InputDefinition'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InputToJson(Input instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataCatalogInputDefinition',
      instance.dataCatalogInputDefinition?.toJson());
  writeNotNull('S3InputDefinition', instance.s3InputDefinition?.toJson());
  return val;
}

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
    name: json['Name'] as String,
    accountId: json['AccountId'] as String,
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    createdBy: json['CreatedBy'] as String,
    datasetName: json['DatasetName'] as String,
    encryptionKeyArn: json['EncryptionKeyArn'] as String,
    encryptionMode:
        _$enumDecodeNullable(_$EncryptionModeEnumMap, json['EncryptionMode']),
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    logSubscription:
        _$enumDecodeNullable(_$LogSubscriptionEnumMap, json['LogSubscription']),
    maxCapacity: json['MaxCapacity'] as int,
    maxRetries: json['MaxRetries'] as int,
    outputs: (json['Outputs'] as List)
        ?.map((e) =>
            e == null ? null : Output.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projectName: json['ProjectName'] as String,
    recipeReference: json['RecipeReference'] == null
        ? null
        : RecipeReference.fromJson(
            json['RecipeReference'] as Map<String, dynamic>),
    resourceArn: json['ResourceArn'] as String,
    roleArn: json['RoleArn'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    timeout: json['Timeout'] as int,
    type: _$enumDecodeNullable(_$JobTypeEnumMap, json['Type']),
  );
}

JobRun _$JobRunFromJson(Map<String, dynamic> json) {
  return JobRun(
    attempt: json['Attempt'] as int,
    completedOn: const UnixDateTimeConverter().fromJson(json['CompletedOn']),
    datasetName: json['DatasetName'] as String,
    errorMessage: json['ErrorMessage'] as String,
    executionTime: json['ExecutionTime'] as int,
    jobName: json['JobName'] as String,
    logGroupName: json['LogGroupName'] as String,
    logSubscription:
        _$enumDecodeNullable(_$LogSubscriptionEnumMap, json['LogSubscription']),
    outputs: (json['Outputs'] as List)
        ?.map((e) =>
            e == null ? null : Output.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recipeReference: json['RecipeReference'] == null
        ? null
        : RecipeReference.fromJson(
            json['RecipeReference'] as Map<String, dynamic>),
    runId: json['RunId'] as String,
    startedBy: json['StartedBy'] as String,
    startedOn: const UnixDateTimeConverter().fromJson(json['StartedOn']),
    state: _$enumDecodeNullable(_$JobRunStateEnumMap, json['State']),
  );
}

const _$JobRunStateEnumMap = {
  JobRunState.starting: 'STARTING',
  JobRunState.running: 'RUNNING',
  JobRunState.stopping: 'STOPPING',
  JobRunState.stopped: 'STOPPED',
  JobRunState.succeeded: 'SUCCEEDED',
  JobRunState.failed: 'FAILED',
  JobRunState.timeout: 'TIMEOUT',
};

JsonOptions _$JsonOptionsFromJson(Map<String, dynamic> json) {
  return JsonOptions(
    multiLine: json['MultiLine'] as bool,
  );
}

Map<String, dynamic> _$JsonOptionsToJson(JsonOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MultiLine', instance.multiLine);
  return val;
}

ListDatasetsResponse _$ListDatasetsResponseFromJson(Map<String, dynamic> json) {
  return ListDatasetsResponse(
    datasets: (json['Datasets'] as List)
        ?.map((e) =>
            e == null ? null : Dataset.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListJobRunsResponse _$ListJobRunsResponseFromJson(Map<String, dynamic> json) {
  return ListJobRunsResponse(
    jobRuns: (json['JobRuns'] as List)
        ?.map((e) =>
            e == null ? null : JobRun.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListJobsResponse _$ListJobsResponseFromJson(Map<String, dynamic> json) {
  return ListJobsResponse(
    jobs: (json['Jobs'] as List)
        ?.map((e) => e == null ? null : Job.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListProjectsResponse _$ListProjectsResponseFromJson(Map<String, dynamic> json) {
  return ListProjectsResponse(
    projects: (json['Projects'] as List)
        ?.map((e) =>
            e == null ? null : Project.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListRecipeVersionsResponse _$ListRecipeVersionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListRecipeVersionsResponse(
    recipes: (json['Recipes'] as List)
        ?.map((e) =>
            e == null ? null : Recipe.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListRecipesResponse _$ListRecipesResponseFromJson(Map<String, dynamic> json) {
  return ListRecipesResponse(
    recipes: (json['Recipes'] as List)
        ?.map((e) =>
            e == null ? null : Recipe.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListSchedulesResponse _$ListSchedulesResponseFromJson(
    Map<String, dynamic> json) {
  return ListSchedulesResponse(
    schedules: (json['Schedules'] as List)
        ?.map((e) =>
            e == null ? null : Schedule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Output _$OutputFromJson(Map<String, dynamic> json) {
  return Output(
    location: json['Location'] == null
        ? null
        : S3Location.fromJson(json['Location'] as Map<String, dynamic>),
    compressionFormat: _$enumDecodeNullable(
        _$CompressionFormatEnumMap, json['CompressionFormat']),
    format: _$enumDecodeNullable(_$OutputFormatEnumMap, json['Format']),
    overwrite: json['Overwrite'] as bool,
    partitionColumns:
        (json['PartitionColumns'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$OutputToJson(Output instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Location', instance.location?.toJson());
  writeNotNull('CompressionFormat',
      _$CompressionFormatEnumMap[instance.compressionFormat]);
  writeNotNull('Format', _$OutputFormatEnumMap[instance.format]);
  writeNotNull('Overwrite', instance.overwrite);
  writeNotNull('PartitionColumns', instance.partitionColumns);
  return val;
}

const _$CompressionFormatEnumMap = {
  CompressionFormat.gzip: 'GZIP',
  CompressionFormat.lz4: 'LZ4',
  CompressionFormat.snappy: 'SNAPPY',
  CompressionFormat.bzip2: 'BZIP2',
  CompressionFormat.deflate: 'DEFLATE',
  CompressionFormat.lzo: 'LZO',
  CompressionFormat.brotli: 'BROTLI',
  CompressionFormat.zstd: 'ZSTD',
  CompressionFormat.zlib: 'ZLIB',
};

const _$OutputFormatEnumMap = {
  OutputFormat.csv: 'CSV',
  OutputFormat.json: 'JSON',
  OutputFormat.parquet: 'PARQUET',
  OutputFormat.glueparquet: 'GLUEPARQUET',
  OutputFormat.avro: 'AVRO',
  OutputFormat.orc: 'ORC',
  OutputFormat.xml: 'XML',
};

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project(
    name: json['Name'] as String,
    recipeName: json['RecipeName'] as String,
    accountId: json['AccountId'] as String,
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    createdBy: json['CreatedBy'] as String,
    datasetName: json['DatasetName'] as String,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    openDate: const UnixDateTimeConverter().fromJson(json['OpenDate']),
    openedBy: json['OpenedBy'] as String,
    resourceArn: json['ResourceArn'] as String,
    roleArn: json['RoleArn'] as String,
    sample: json['Sample'] == null
        ? null
        : Sample.fromJson(json['Sample'] as Map<String, dynamic>),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

PublishRecipeResponse _$PublishRecipeResponseFromJson(
    Map<String, dynamic> json) {
  return PublishRecipeResponse(
    name: json['Name'] as String,
  );
}

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    name: json['Name'] as String,
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    createdBy: json['CreatedBy'] as String,
    description: json['Description'] as String,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    projectName: json['ProjectName'] as String,
    publishedBy: json['PublishedBy'] as String,
    publishedDate:
        const UnixDateTimeConverter().fromJson(json['PublishedDate']),
    recipeVersion: json['RecipeVersion'] as String,
    resourceArn: json['ResourceArn'] as String,
    steps: (json['Steps'] as List)
        ?.map((e) =>
            e == null ? null : RecipeStep.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

RecipeAction _$RecipeActionFromJson(Map<String, dynamic> json) {
  return RecipeAction(
    operation: json['Operation'] as String,
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$RecipeActionToJson(RecipeAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Operation', instance.operation);
  writeNotNull('Parameters', instance.parameters);
  return val;
}

RecipeReference _$RecipeReferenceFromJson(Map<String, dynamic> json) {
  return RecipeReference(
    name: json['Name'] as String,
    recipeVersion: json['RecipeVersion'] as String,
  );
}

Map<String, dynamic> _$RecipeReferenceToJson(RecipeReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('RecipeVersion', instance.recipeVersion);
  return val;
}

RecipeStep _$RecipeStepFromJson(Map<String, dynamic> json) {
  return RecipeStep(
    action: json['Action'] == null
        ? null
        : RecipeAction.fromJson(json['Action'] as Map<String, dynamic>),
    conditionExpressions: (json['ConditionExpressions'] as List)
        ?.map((e) => e == null
            ? null
            : ConditionExpression.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RecipeStepToJson(RecipeStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', instance.action?.toJson());
  writeNotNull('ConditionExpressions',
      instance.conditionExpressions?.map((e) => e?.toJson())?.toList());
  return val;
}

RecipeVersionErrorDetail _$RecipeVersionErrorDetailFromJson(
    Map<String, dynamic> json) {
  return RecipeVersionErrorDetail(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    recipeVersion: json['RecipeVersion'] as String,
  );
}

S3Location _$S3LocationFromJson(Map<String, dynamic> json) {
  return S3Location(
    bucket: json['Bucket'] as String,
    key: json['Key'] as String,
  );
}

Map<String, dynamic> _$S3LocationToJson(S3Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Bucket', instance.bucket);
  writeNotNull('Key', instance.key);
  return val;
}

Sample _$SampleFromJson(Map<String, dynamic> json) {
  return Sample(
    type: _$enumDecodeNullable(_$SampleTypeEnumMap, json['Type']),
    size: json['Size'] as int,
  );
}

Map<String, dynamic> _$SampleToJson(Sample instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$SampleTypeEnumMap[instance.type]);
  writeNotNull('Size', instance.size);
  return val;
}

const _$SampleTypeEnumMap = {
  SampleType.firstN: 'FIRST_N',
  SampleType.lastN: 'LAST_N',
  SampleType.random: 'RANDOM',
};

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    name: json['Name'] as String,
    accountId: json['AccountId'] as String,
    createDate: const UnixDateTimeConverter().fromJson(json['CreateDate']),
    createdBy: json['CreatedBy'] as String,
    cronExpression: json['CronExpression'] as String,
    jobNames: (json['JobNames'] as List)?.map((e) => e as String)?.toList(),
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    resourceArn: json['ResourceArn'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

SendProjectSessionActionResponse _$SendProjectSessionActionResponseFromJson(
    Map<String, dynamic> json) {
  return SendProjectSessionActionResponse(
    name: json['Name'] as String,
    actionId: json['ActionId'] as int,
    result: json['Result'] as String,
  );
}

StartJobRunResponse _$StartJobRunResponseFromJson(Map<String, dynamic> json) {
  return StartJobRunResponse(
    runId: json['RunId'] as String,
  );
}

StartProjectSessionResponse _$StartProjectSessionResponseFromJson(
    Map<String, dynamic> json) {
  return StartProjectSessionResponse(
    name: json['Name'] as String,
    clientSessionId: json['ClientSessionId'] as String,
  );
}

StopJobRunResponse _$StopJobRunResponseFromJson(Map<String, dynamic> json) {
  return StopJobRunResponse(
    runId: json['RunId'] as String,
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateDatasetResponse _$UpdateDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDatasetResponse(
    name: json['Name'] as String,
  );
}

UpdateProfileJobResponse _$UpdateProfileJobResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProfileJobResponse(
    name: json['Name'] as String,
  );
}

UpdateProjectResponse _$UpdateProjectResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateProjectResponse(
    name: json['Name'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
  );
}

UpdateRecipeJobResponse _$UpdateRecipeJobResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRecipeJobResponse(
    name: json['Name'] as String,
  );
}

UpdateRecipeResponse _$UpdateRecipeResponseFromJson(Map<String, dynamic> json) {
  return UpdateRecipeResponse(
    name: json['Name'] as String,
  );
}

UpdateScheduleResponse _$UpdateScheduleResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateScheduleResponse(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$ViewFrameToJson(ViewFrame instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StartColumnIndex', instance.startColumnIndex);
  writeNotNull('ColumnRange', instance.columnRange);
  writeNotNull('HiddenColumns', instance.hiddenColumns);
  return val;
}
