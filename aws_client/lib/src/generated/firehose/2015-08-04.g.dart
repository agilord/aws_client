// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-08-04.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BufferingHints _$BufferingHintsFromJson(Map<String, dynamic> json) {
  return BufferingHints(
    intervalInSeconds: json['IntervalInSeconds'] as int,
    sizeInMBs: json['SizeInMBs'] as int,
  );
}

Map<String, dynamic> _$BufferingHintsToJson(BufferingHints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IntervalInSeconds', instance.intervalInSeconds);
  writeNotNull('SizeInMBs', instance.sizeInMBs);
  return val;
}

CloudWatchLoggingOptions _$CloudWatchLoggingOptionsFromJson(
    Map<String, dynamic> json) {
  return CloudWatchLoggingOptions(
    enabled: json['Enabled'] as bool,
    logGroupName: json['LogGroupName'] as String,
    logStreamName: json['LogStreamName'] as String,
  );
}

Map<String, dynamic> _$CloudWatchLoggingOptionsToJson(
    CloudWatchLoggingOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('LogGroupName', instance.logGroupName);
  writeNotNull('LogStreamName', instance.logStreamName);
  return val;
}

CopyCommand _$CopyCommandFromJson(Map<String, dynamic> json) {
  return CopyCommand(
    dataTableName: json['DataTableName'] as String,
    copyOptions: json['CopyOptions'] as String,
    dataTableColumns: json['DataTableColumns'] as String,
  );
}

Map<String, dynamic> _$CopyCommandToJson(CopyCommand instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DataTableName', instance.dataTableName);
  writeNotNull('CopyOptions', instance.copyOptions);
  writeNotNull('DataTableColumns', instance.dataTableColumns);
  return val;
}

CreateDeliveryStreamOutput _$CreateDeliveryStreamOutputFromJson(
    Map<String, dynamic> json) {
  return CreateDeliveryStreamOutput(
    deliveryStreamARN: json['DeliveryStreamARN'] as String,
  );
}

DataFormatConversionConfiguration _$DataFormatConversionConfigurationFromJson(
    Map<String, dynamic> json) {
  return DataFormatConversionConfiguration(
    enabled: json['Enabled'] as bool,
    inputFormatConfiguration: json['InputFormatConfiguration'] == null
        ? null
        : InputFormatConfiguration.fromJson(
            json['InputFormatConfiguration'] as Map<String, dynamic>),
    outputFormatConfiguration: json['OutputFormatConfiguration'] == null
        ? null
        : OutputFormatConfiguration.fromJson(
            json['OutputFormatConfiguration'] as Map<String, dynamic>),
    schemaConfiguration: json['SchemaConfiguration'] == null
        ? null
        : SchemaConfiguration.fromJson(
            json['SchemaConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataFormatConversionConfigurationToJson(
    DataFormatConversionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull(
      'InputFormatConfiguration', instance.inputFormatConfiguration?.toJson());
  writeNotNull('OutputFormatConfiguration',
      instance.outputFormatConfiguration?.toJson());
  writeNotNull('SchemaConfiguration', instance.schemaConfiguration?.toJson());
  return val;
}

DeleteDeliveryStreamOutput _$DeleteDeliveryStreamOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteDeliveryStreamOutput();
}

DeliveryStreamDescription _$DeliveryStreamDescriptionFromJson(
    Map<String, dynamic> json) {
  return DeliveryStreamDescription(
    deliveryStreamARN: json['DeliveryStreamARN'] as String,
    deliveryStreamName: json['DeliveryStreamName'] as String,
    deliveryStreamStatus: _$enumDecodeNullable(
        _$DeliveryStreamStatusEnumMap, json['DeliveryStreamStatus']),
    deliveryStreamType: _$enumDecodeNullable(
        _$DeliveryStreamTypeEnumMap, json['DeliveryStreamType']),
    destinations: (json['Destinations'] as List)
        ?.map((e) => e == null
            ? null
            : DestinationDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hasMoreDestinations: json['HasMoreDestinations'] as bool,
    versionId: json['VersionId'] as String,
    createTimestamp:
        const UnixDateTimeConverter().fromJson(json['CreateTimestamp']),
    deliveryStreamEncryptionConfiguration:
        json['DeliveryStreamEncryptionConfiguration'] == null
            ? null
            : DeliveryStreamEncryptionConfiguration.fromJson(
                json['DeliveryStreamEncryptionConfiguration']
                    as Map<String, dynamic>),
    failureDescription: json['FailureDescription'] == null
        ? null
        : FailureDescription.fromJson(
            json['FailureDescription'] as Map<String, dynamic>),
    lastUpdateTimestamp:
        const UnixDateTimeConverter().fromJson(json['LastUpdateTimestamp']),
    source: json['Source'] == null
        ? null
        : SourceDescription.fromJson(json['Source'] as Map<String, dynamic>),
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

const _$DeliveryStreamStatusEnumMap = {
  DeliveryStreamStatus.creating: 'CREATING',
  DeliveryStreamStatus.creatingFailed: 'CREATING_FAILED',
  DeliveryStreamStatus.deleting: 'DELETING',
  DeliveryStreamStatus.deletingFailed: 'DELETING_FAILED',
  DeliveryStreamStatus.active: 'ACTIVE',
};

const _$DeliveryStreamTypeEnumMap = {
  DeliveryStreamType.directPut: 'DirectPut',
  DeliveryStreamType.kinesisStreamAsSource: 'KinesisStreamAsSource',
};

DeliveryStreamEncryptionConfiguration
    _$DeliveryStreamEncryptionConfigurationFromJson(Map<String, dynamic> json) {
  return DeliveryStreamEncryptionConfiguration(
    failureDescription: json['FailureDescription'] == null
        ? null
        : FailureDescription.fromJson(
            json['FailureDescription'] as Map<String, dynamic>),
    keyARN: json['KeyARN'] as String,
    keyType: _$enumDecodeNullable(_$KeyTypeEnumMap, json['KeyType']),
    status: _$enumDecodeNullable(
        _$DeliveryStreamEncryptionStatusEnumMap, json['Status']),
  );
}

const _$KeyTypeEnumMap = {
  KeyType.awsOwnedCmk: 'AWS_OWNED_CMK',
  KeyType.customerManagedCmk: 'CUSTOMER_MANAGED_CMK',
};

const _$DeliveryStreamEncryptionStatusEnumMap = {
  DeliveryStreamEncryptionStatus.enabled: 'ENABLED',
  DeliveryStreamEncryptionStatus.enabling: 'ENABLING',
  DeliveryStreamEncryptionStatus.enablingFailed: 'ENABLING_FAILED',
  DeliveryStreamEncryptionStatus.disabled: 'DISABLED',
  DeliveryStreamEncryptionStatus.disabling: 'DISABLING',
  DeliveryStreamEncryptionStatus.disablingFailed: 'DISABLING_FAILED',
};

Map<String, dynamic> _$DeliveryStreamEncryptionConfigurationInputToJson(
    DeliveryStreamEncryptionConfigurationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KeyType', _$KeyTypeEnumMap[instance.keyType]);
  writeNotNull('KeyARN', instance.keyARN);
  return val;
}

DescribeDeliveryStreamOutput _$DescribeDeliveryStreamOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeDeliveryStreamOutput(
    deliveryStreamDescription: json['DeliveryStreamDescription'] == null
        ? null
        : DeliveryStreamDescription.fromJson(
            json['DeliveryStreamDescription'] as Map<String, dynamic>),
  );
}

Deserializer _$DeserializerFromJson(Map<String, dynamic> json) {
  return Deserializer(
    hiveJsonSerDe: json['HiveJsonSerDe'] == null
        ? null
        : HiveJsonSerDe.fromJson(json['HiveJsonSerDe'] as Map<String, dynamic>),
    openXJsonSerDe: json['OpenXJsonSerDe'] == null
        ? null
        : OpenXJsonSerDe.fromJson(
            json['OpenXJsonSerDe'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeserializerToJson(Deserializer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HiveJsonSerDe', instance.hiveJsonSerDe?.toJson());
  writeNotNull('OpenXJsonSerDe', instance.openXJsonSerDe?.toJson());
  return val;
}

DestinationDescription _$DestinationDescriptionFromJson(
    Map<String, dynamic> json) {
  return DestinationDescription(
    destinationId: json['DestinationId'] as String,
    elasticsearchDestinationDescription:
        json['ElasticsearchDestinationDescription'] == null
            ? null
            : ElasticsearchDestinationDescription.fromJson(
                json['ElasticsearchDestinationDescription']
                    as Map<String, dynamic>),
    extendedS3DestinationDescription:
        json['ExtendedS3DestinationDescription'] == null
            ? null
            : ExtendedS3DestinationDescription.fromJson(
                json['ExtendedS3DestinationDescription']
                    as Map<String, dynamic>),
    httpEndpointDestinationDescription:
        json['HttpEndpointDestinationDescription'] == null
            ? null
            : HttpEndpointDestinationDescription.fromJson(
                json['HttpEndpointDestinationDescription']
                    as Map<String, dynamic>),
    redshiftDestinationDescription:
        json['RedshiftDestinationDescription'] == null
            ? null
            : RedshiftDestinationDescription.fromJson(
                json['RedshiftDestinationDescription'] as Map<String, dynamic>),
    s3DestinationDescription: json['S3DestinationDescription'] == null
        ? null
        : S3DestinationDescription.fromJson(
            json['S3DestinationDescription'] as Map<String, dynamic>),
    splunkDestinationDescription: json['SplunkDestinationDescription'] == null
        ? null
        : SplunkDestinationDescription.fromJson(
            json['SplunkDestinationDescription'] as Map<String, dynamic>),
  );
}

ElasticsearchBufferingHints _$ElasticsearchBufferingHintsFromJson(
    Map<String, dynamic> json) {
  return ElasticsearchBufferingHints(
    intervalInSeconds: json['IntervalInSeconds'] as int,
    sizeInMBs: json['SizeInMBs'] as int,
  );
}

Map<String, dynamic> _$ElasticsearchBufferingHintsToJson(
    ElasticsearchBufferingHints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IntervalInSeconds', instance.intervalInSeconds);
  writeNotNull('SizeInMBs', instance.sizeInMBs);
  return val;
}

Map<String, dynamic> _$ElasticsearchDestinationConfigurationToJson(
    ElasticsearchDestinationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull('S3Configuration', instance.s3Configuration?.toJson());
  writeNotNull('BufferingHints', instance.bufferingHints?.toJson());
  writeNotNull(
      'CloudWatchLoggingOptions', instance.cloudWatchLoggingOptions?.toJson());
  writeNotNull('ClusterEndpoint', instance.clusterEndpoint);
  writeNotNull('DomainARN', instance.domainARN);
  writeNotNull('IndexRotationPeriod',
      _$ElasticsearchIndexRotationPeriodEnumMap[instance.indexRotationPeriod]);
  writeNotNull(
      'ProcessingConfiguration', instance.processingConfiguration?.toJson());
  writeNotNull('RetryOptions', instance.retryOptions?.toJson());
  writeNotNull('S3BackupMode',
      _$ElasticsearchS3BackupModeEnumMap[instance.s3BackupMode]);
  writeNotNull('TypeName', instance.typeName);
  writeNotNull('VpcConfiguration', instance.vpcConfiguration?.toJson());
  return val;
}

const _$ElasticsearchIndexRotationPeriodEnumMap = {
  ElasticsearchIndexRotationPeriod.noRotation: 'NoRotation',
  ElasticsearchIndexRotationPeriod.oneHour: 'OneHour',
  ElasticsearchIndexRotationPeriod.oneDay: 'OneDay',
  ElasticsearchIndexRotationPeriod.oneWeek: 'OneWeek',
  ElasticsearchIndexRotationPeriod.oneMonth: 'OneMonth',
};

const _$ElasticsearchS3BackupModeEnumMap = {
  ElasticsearchS3BackupMode.failedDocumentsOnly: 'FailedDocumentsOnly',
  ElasticsearchS3BackupMode.allDocuments: 'AllDocuments',
};

ElasticsearchDestinationDescription
    _$ElasticsearchDestinationDescriptionFromJson(Map<String, dynamic> json) {
  return ElasticsearchDestinationDescription(
    bufferingHints: json['BufferingHints'] == null
        ? null
        : ElasticsearchBufferingHints.fromJson(
            json['BufferingHints'] as Map<String, dynamic>),
    cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] == null
        ? null
        : CloudWatchLoggingOptions.fromJson(
            json['CloudWatchLoggingOptions'] as Map<String, dynamic>),
    clusterEndpoint: json['ClusterEndpoint'] as String,
    domainARN: json['DomainARN'] as String,
    indexName: json['IndexName'] as String,
    indexRotationPeriod: _$enumDecodeNullable(
        _$ElasticsearchIndexRotationPeriodEnumMap, json['IndexRotationPeriod']),
    processingConfiguration: json['ProcessingConfiguration'] == null
        ? null
        : ProcessingConfiguration.fromJson(
            json['ProcessingConfiguration'] as Map<String, dynamic>),
    retryOptions: json['RetryOptions'] == null
        ? null
        : ElasticsearchRetryOptions.fromJson(
            json['RetryOptions'] as Map<String, dynamic>),
    roleARN: json['RoleARN'] as String,
    s3BackupMode: _$enumDecodeNullable(
        _$ElasticsearchS3BackupModeEnumMap, json['S3BackupMode']),
    s3DestinationDescription: json['S3DestinationDescription'] == null
        ? null
        : S3DestinationDescription.fromJson(
            json['S3DestinationDescription'] as Map<String, dynamic>),
    typeName: json['TypeName'] as String,
    vpcConfigurationDescription: json['VpcConfigurationDescription'] == null
        ? null
        : VpcConfigurationDescription.fromJson(
            json['VpcConfigurationDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ElasticsearchDestinationUpdateToJson(
    ElasticsearchDestinationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BufferingHints', instance.bufferingHints?.toJson());
  writeNotNull(
      'CloudWatchLoggingOptions', instance.cloudWatchLoggingOptions?.toJson());
  writeNotNull('ClusterEndpoint', instance.clusterEndpoint);
  writeNotNull('DomainARN', instance.domainARN);
  writeNotNull('IndexName', instance.indexName);
  writeNotNull('IndexRotationPeriod',
      _$ElasticsearchIndexRotationPeriodEnumMap[instance.indexRotationPeriod]);
  writeNotNull(
      'ProcessingConfiguration', instance.processingConfiguration?.toJson());
  writeNotNull('RetryOptions', instance.retryOptions?.toJson());
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull('S3Update', instance.s3Update?.toJson());
  writeNotNull('TypeName', instance.typeName);
  return val;
}

ElasticsearchRetryOptions _$ElasticsearchRetryOptionsFromJson(
    Map<String, dynamic> json) {
  return ElasticsearchRetryOptions(
    durationInSeconds: json['DurationInSeconds'] as int,
  );
}

Map<String, dynamic> _$ElasticsearchRetryOptionsToJson(
    ElasticsearchRetryOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DurationInSeconds', instance.durationInSeconds);
  return val;
}

EncryptionConfiguration _$EncryptionConfigurationFromJson(
    Map<String, dynamic> json) {
  return EncryptionConfiguration(
    kMSEncryptionConfig: json['KMSEncryptionConfig'] == null
        ? null
        : KMSEncryptionConfig.fromJson(
            json['KMSEncryptionConfig'] as Map<String, dynamic>),
    noEncryptionConfig: _$enumDecodeNullable(
        _$NoEncryptionConfigEnumMap, json['NoEncryptionConfig']),
  );
}

Map<String, dynamic> _$EncryptionConfigurationToJson(
    EncryptionConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KMSEncryptionConfig', instance.kMSEncryptionConfig?.toJson());
  writeNotNull('NoEncryptionConfig',
      _$NoEncryptionConfigEnumMap[instance.noEncryptionConfig]);
  return val;
}

const _$NoEncryptionConfigEnumMap = {
  NoEncryptionConfig.noEncryption: 'NoEncryption',
};

Map<String, dynamic> _$ExtendedS3DestinationConfigurationToJson(
    ExtendedS3DestinationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketARN', instance.bucketARN);
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull('BufferingHints', instance.bufferingHints?.toJson());
  writeNotNull(
      'CloudWatchLoggingOptions', instance.cloudWatchLoggingOptions?.toJson());
  writeNotNull('CompressionFormat',
      _$CompressionFormatEnumMap[instance.compressionFormat]);
  writeNotNull('DataFormatConversionConfiguration',
      instance.dataFormatConversionConfiguration?.toJson());
  writeNotNull(
      'EncryptionConfiguration', instance.encryptionConfiguration?.toJson());
  writeNotNull('ErrorOutputPrefix', instance.errorOutputPrefix);
  writeNotNull('Prefix', instance.prefix);
  writeNotNull(
      'ProcessingConfiguration', instance.processingConfiguration?.toJson());
  writeNotNull(
      'S3BackupConfiguration', instance.s3BackupConfiguration?.toJson());
  writeNotNull('S3BackupMode', _$S3BackupModeEnumMap[instance.s3BackupMode]);
  return val;
}

const _$CompressionFormatEnumMap = {
  CompressionFormat.uncompressed: 'UNCOMPRESSED',
  CompressionFormat.gzip: 'GZIP',
  CompressionFormat.zip: 'ZIP',
  CompressionFormat.snappy: 'Snappy',
  CompressionFormat.hadoopSnappy: 'HADOOP_SNAPPY',
};

const _$S3BackupModeEnumMap = {
  S3BackupMode.disabled: 'Disabled',
  S3BackupMode.enabled: 'Enabled',
};

ExtendedS3DestinationDescription _$ExtendedS3DestinationDescriptionFromJson(
    Map<String, dynamic> json) {
  return ExtendedS3DestinationDescription(
    bucketARN: json['BucketARN'] as String,
    bufferingHints: json['BufferingHints'] == null
        ? null
        : BufferingHints.fromJson(
            json['BufferingHints'] as Map<String, dynamic>),
    compressionFormat: _$enumDecodeNullable(
        _$CompressionFormatEnumMap, json['CompressionFormat']),
    encryptionConfiguration: json['EncryptionConfiguration'] == null
        ? null
        : EncryptionConfiguration.fromJson(
            json['EncryptionConfiguration'] as Map<String, dynamic>),
    roleARN: json['RoleARN'] as String,
    cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] == null
        ? null
        : CloudWatchLoggingOptions.fromJson(
            json['CloudWatchLoggingOptions'] as Map<String, dynamic>),
    dataFormatConversionConfiguration:
        json['DataFormatConversionConfiguration'] == null
            ? null
            : DataFormatConversionConfiguration.fromJson(
                json['DataFormatConversionConfiguration']
                    as Map<String, dynamic>),
    errorOutputPrefix: json['ErrorOutputPrefix'] as String,
    prefix: json['Prefix'] as String,
    processingConfiguration: json['ProcessingConfiguration'] == null
        ? null
        : ProcessingConfiguration.fromJson(
            json['ProcessingConfiguration'] as Map<String, dynamic>),
    s3BackupDescription: json['S3BackupDescription'] == null
        ? null
        : S3DestinationDescription.fromJson(
            json['S3BackupDescription'] as Map<String, dynamic>),
    s3BackupMode:
        _$enumDecodeNullable(_$S3BackupModeEnumMap, json['S3BackupMode']),
  );
}

Map<String, dynamic> _$ExtendedS3DestinationUpdateToJson(
    ExtendedS3DestinationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketARN', instance.bucketARN);
  writeNotNull('BufferingHints', instance.bufferingHints?.toJson());
  writeNotNull(
      'CloudWatchLoggingOptions', instance.cloudWatchLoggingOptions?.toJson());
  writeNotNull('CompressionFormat',
      _$CompressionFormatEnumMap[instance.compressionFormat]);
  writeNotNull('DataFormatConversionConfiguration',
      instance.dataFormatConversionConfiguration?.toJson());
  writeNotNull(
      'EncryptionConfiguration', instance.encryptionConfiguration?.toJson());
  writeNotNull('ErrorOutputPrefix', instance.errorOutputPrefix);
  writeNotNull('Prefix', instance.prefix);
  writeNotNull(
      'ProcessingConfiguration', instance.processingConfiguration?.toJson());
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull('S3BackupMode', _$S3BackupModeEnumMap[instance.s3BackupMode]);
  writeNotNull('S3BackupUpdate', instance.s3BackupUpdate?.toJson());
  return val;
}

FailureDescription _$FailureDescriptionFromJson(Map<String, dynamic> json) {
  return FailureDescription(
    details: json['Details'] as String,
    type:
        _$enumDecodeNullable(_$DeliveryStreamFailureTypeEnumMap, json['Type']),
  );
}

const _$DeliveryStreamFailureTypeEnumMap = {
  DeliveryStreamFailureType.retireKmsGrantFailed: 'RETIRE_KMS_GRANT_FAILED',
  DeliveryStreamFailureType.createKmsGrantFailed: 'CREATE_KMS_GRANT_FAILED',
  DeliveryStreamFailureType.kmsAccessDenied: 'KMS_ACCESS_DENIED',
  DeliveryStreamFailureType.disabledKmsKey: 'DISABLED_KMS_KEY',
  DeliveryStreamFailureType.invalidKmsKey: 'INVALID_KMS_KEY',
  DeliveryStreamFailureType.kmsKeyNotFound: 'KMS_KEY_NOT_FOUND',
  DeliveryStreamFailureType.kmsOptInRequired: 'KMS_OPT_IN_REQUIRED',
  DeliveryStreamFailureType.createEniFailed: 'CREATE_ENI_FAILED',
  DeliveryStreamFailureType.deleteEniFailed: 'DELETE_ENI_FAILED',
  DeliveryStreamFailureType.subnetNotFound: 'SUBNET_NOT_FOUND',
  DeliveryStreamFailureType.securityGroupNotFound: 'SECURITY_GROUP_NOT_FOUND',
  DeliveryStreamFailureType.eniAccessDenied: 'ENI_ACCESS_DENIED',
  DeliveryStreamFailureType.subnetAccessDenied: 'SUBNET_ACCESS_DENIED',
  DeliveryStreamFailureType.securityGroupAccessDenied:
      'SECURITY_GROUP_ACCESS_DENIED',
  DeliveryStreamFailureType.unknownError: 'UNKNOWN_ERROR',
};

HiveJsonSerDe _$HiveJsonSerDeFromJson(Map<String, dynamic> json) {
  return HiveJsonSerDe(
    timestampFormats:
        (json['TimestampFormats'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$HiveJsonSerDeToJson(HiveJsonSerDe instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TimestampFormats', instance.timestampFormats);
  return val;
}

HttpEndpointBufferingHints _$HttpEndpointBufferingHintsFromJson(
    Map<String, dynamic> json) {
  return HttpEndpointBufferingHints(
    intervalInSeconds: json['IntervalInSeconds'] as int,
    sizeInMBs: json['SizeInMBs'] as int,
  );
}

Map<String, dynamic> _$HttpEndpointBufferingHintsToJson(
    HttpEndpointBufferingHints instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IntervalInSeconds', instance.intervalInSeconds);
  writeNotNull('SizeInMBs', instance.sizeInMBs);
  return val;
}

HttpEndpointCommonAttribute _$HttpEndpointCommonAttributeFromJson(
    Map<String, dynamic> json) {
  return HttpEndpointCommonAttribute(
    attributeName: json['AttributeName'] as String,
    attributeValue: json['AttributeValue'] as String,
  );
}

Map<String, dynamic> _$HttpEndpointCommonAttributeToJson(
    HttpEndpointCommonAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('AttributeValue', instance.attributeValue);
  return val;
}

Map<String, dynamic> _$HttpEndpointConfigurationToJson(
    HttpEndpointConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Url', instance.url);
  writeNotNull('AccessKey', instance.accessKey);
  writeNotNull('Name', instance.name);
  return val;
}

HttpEndpointDescription _$HttpEndpointDescriptionFromJson(
    Map<String, dynamic> json) {
  return HttpEndpointDescription(
    name: json['Name'] as String,
    url: json['Url'] as String,
  );
}

Map<String, dynamic> _$HttpEndpointDestinationConfigurationToJson(
    HttpEndpointDestinationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'EndpointConfiguration', instance.endpointConfiguration?.toJson());
  writeNotNull('S3Configuration', instance.s3Configuration?.toJson());
  writeNotNull('BufferingHints', instance.bufferingHints?.toJson());
  writeNotNull(
      'CloudWatchLoggingOptions', instance.cloudWatchLoggingOptions?.toJson());
  writeNotNull(
      'ProcessingConfiguration', instance.processingConfiguration?.toJson());
  writeNotNull('RequestConfiguration', instance.requestConfiguration?.toJson());
  writeNotNull('RetryOptions', instance.retryOptions?.toJson());
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull(
      'S3BackupMode', _$HttpEndpointS3BackupModeEnumMap[instance.s3BackupMode]);
  return val;
}

const _$HttpEndpointS3BackupModeEnumMap = {
  HttpEndpointS3BackupMode.failedDataOnly: 'FailedDataOnly',
  HttpEndpointS3BackupMode.allData: 'AllData',
};

HttpEndpointDestinationDescription _$HttpEndpointDestinationDescriptionFromJson(
    Map<String, dynamic> json) {
  return HttpEndpointDestinationDescription(
    bufferingHints: json['BufferingHints'] == null
        ? null
        : HttpEndpointBufferingHints.fromJson(
            json['BufferingHints'] as Map<String, dynamic>),
    cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] == null
        ? null
        : CloudWatchLoggingOptions.fromJson(
            json['CloudWatchLoggingOptions'] as Map<String, dynamic>),
    endpointConfiguration: json['EndpointConfiguration'] == null
        ? null
        : HttpEndpointDescription.fromJson(
            json['EndpointConfiguration'] as Map<String, dynamic>),
    processingConfiguration: json['ProcessingConfiguration'] == null
        ? null
        : ProcessingConfiguration.fromJson(
            json['ProcessingConfiguration'] as Map<String, dynamic>),
    requestConfiguration: json['RequestConfiguration'] == null
        ? null
        : HttpEndpointRequestConfiguration.fromJson(
            json['RequestConfiguration'] as Map<String, dynamic>),
    retryOptions: json['RetryOptions'] == null
        ? null
        : HttpEndpointRetryOptions.fromJson(
            json['RetryOptions'] as Map<String, dynamic>),
    roleARN: json['RoleARN'] as String,
    s3BackupMode: _$enumDecodeNullable(
        _$HttpEndpointS3BackupModeEnumMap, json['S3BackupMode']),
    s3DestinationDescription: json['S3DestinationDescription'] == null
        ? null
        : S3DestinationDescription.fromJson(
            json['S3DestinationDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HttpEndpointDestinationUpdateToJson(
    HttpEndpointDestinationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BufferingHints', instance.bufferingHints?.toJson());
  writeNotNull(
      'CloudWatchLoggingOptions', instance.cloudWatchLoggingOptions?.toJson());
  writeNotNull(
      'EndpointConfiguration', instance.endpointConfiguration?.toJson());
  writeNotNull(
      'ProcessingConfiguration', instance.processingConfiguration?.toJson());
  writeNotNull('RequestConfiguration', instance.requestConfiguration?.toJson());
  writeNotNull('RetryOptions', instance.retryOptions?.toJson());
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull(
      'S3BackupMode', _$HttpEndpointS3BackupModeEnumMap[instance.s3BackupMode]);
  writeNotNull('S3Update', instance.s3Update?.toJson());
  return val;
}

HttpEndpointRequestConfiguration _$HttpEndpointRequestConfigurationFromJson(
    Map<String, dynamic> json) {
  return HttpEndpointRequestConfiguration(
    commonAttributes: (json['CommonAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : HttpEndpointCommonAttribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    contentEncoding:
        _$enumDecodeNullable(_$ContentEncodingEnumMap, json['ContentEncoding']),
  );
}

Map<String, dynamic> _$HttpEndpointRequestConfigurationToJson(
    HttpEndpointRequestConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CommonAttributes',
      instance.commonAttributes?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'ContentEncoding', _$ContentEncodingEnumMap[instance.contentEncoding]);
  return val;
}

const _$ContentEncodingEnumMap = {
  ContentEncoding.none: 'NONE',
  ContentEncoding.gzip: 'GZIP',
};

HttpEndpointRetryOptions _$HttpEndpointRetryOptionsFromJson(
    Map<String, dynamic> json) {
  return HttpEndpointRetryOptions(
    durationInSeconds: json['DurationInSeconds'] as int,
  );
}

Map<String, dynamic> _$HttpEndpointRetryOptionsToJson(
    HttpEndpointRetryOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DurationInSeconds', instance.durationInSeconds);
  return val;
}

InputFormatConfiguration _$InputFormatConfigurationFromJson(
    Map<String, dynamic> json) {
  return InputFormatConfiguration(
    deserializer: json['Deserializer'] == null
        ? null
        : Deserializer.fromJson(json['Deserializer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InputFormatConfigurationToJson(
    InputFormatConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Deserializer', instance.deserializer?.toJson());
  return val;
}

KMSEncryptionConfig _$KMSEncryptionConfigFromJson(Map<String, dynamic> json) {
  return KMSEncryptionConfig(
    awsKMSKeyARN: json['AWSKMSKeyARN'] as String,
  );
}

Map<String, dynamic> _$KMSEncryptionConfigToJson(KMSEncryptionConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AWSKMSKeyARN', instance.awsKMSKeyARN);
  return val;
}

Map<String, dynamic> _$KinesisStreamSourceConfigurationToJson(
    KinesisStreamSourceConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('KinesisStreamARN', instance.kinesisStreamARN);
  writeNotNull('RoleARN', instance.roleARN);
  return val;
}

KinesisStreamSourceDescription _$KinesisStreamSourceDescriptionFromJson(
    Map<String, dynamic> json) {
  return KinesisStreamSourceDescription(
    deliveryStartTimestamp:
        const UnixDateTimeConverter().fromJson(json['DeliveryStartTimestamp']),
    kinesisStreamARN: json['KinesisStreamARN'] as String,
    roleARN: json['RoleARN'] as String,
  );
}

ListDeliveryStreamsOutput _$ListDeliveryStreamsOutputFromJson(
    Map<String, dynamic> json) {
  return ListDeliveryStreamsOutput(
    deliveryStreamNames: (json['DeliveryStreamNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    hasMoreDeliveryStreams: json['HasMoreDeliveryStreams'] as bool,
  );
}

ListTagsForDeliveryStreamOutput _$ListTagsForDeliveryStreamOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForDeliveryStreamOutput(
    hasMoreTags: json['HasMoreTags'] as bool,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

OpenXJsonSerDe _$OpenXJsonSerDeFromJson(Map<String, dynamic> json) {
  return OpenXJsonSerDe(
    caseInsensitive: json['CaseInsensitive'] as bool,
    columnToJsonKeyMappings:
        (json['ColumnToJsonKeyMappings'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    convertDotsInJsonKeysToUnderscores:
        json['ConvertDotsInJsonKeysToUnderscores'] as bool,
  );
}

Map<String, dynamic> _$OpenXJsonSerDeToJson(OpenXJsonSerDe instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CaseInsensitive', instance.caseInsensitive);
  writeNotNull('ColumnToJsonKeyMappings', instance.columnToJsonKeyMappings);
  writeNotNull('ConvertDotsInJsonKeysToUnderscores',
      instance.convertDotsInJsonKeysToUnderscores);
  return val;
}

OrcSerDe _$OrcSerDeFromJson(Map<String, dynamic> json) {
  return OrcSerDe(
    blockSizeBytes: json['BlockSizeBytes'] as int,
    bloomFilterColumns:
        (json['BloomFilterColumns'] as List)?.map((e) => e as String)?.toList(),
    bloomFilterFalsePositiveProbability:
        (json['BloomFilterFalsePositiveProbability'] as num)?.toDouble(),
    compression:
        _$enumDecodeNullable(_$OrcCompressionEnumMap, json['Compression']),
    dictionaryKeyThreshold: (json['DictionaryKeyThreshold'] as num)?.toDouble(),
    enablePadding: json['EnablePadding'] as bool,
    formatVersion:
        _$enumDecodeNullable(_$OrcFormatVersionEnumMap, json['FormatVersion']),
    paddingTolerance: (json['PaddingTolerance'] as num)?.toDouble(),
    rowIndexStride: json['RowIndexStride'] as int,
    stripeSizeBytes: json['StripeSizeBytes'] as int,
  );
}

Map<String, dynamic> _$OrcSerDeToJson(OrcSerDe instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BlockSizeBytes', instance.blockSizeBytes);
  writeNotNull('BloomFilterColumns', instance.bloomFilterColumns);
  writeNotNull('BloomFilterFalsePositiveProbability',
      instance.bloomFilterFalsePositiveProbability);
  writeNotNull('Compression', _$OrcCompressionEnumMap[instance.compression]);
  writeNotNull('DictionaryKeyThreshold', instance.dictionaryKeyThreshold);
  writeNotNull('EnablePadding', instance.enablePadding);
  writeNotNull(
      'FormatVersion', _$OrcFormatVersionEnumMap[instance.formatVersion]);
  writeNotNull('PaddingTolerance', instance.paddingTolerance);
  writeNotNull('RowIndexStride', instance.rowIndexStride);
  writeNotNull('StripeSizeBytes', instance.stripeSizeBytes);
  return val;
}

const _$OrcCompressionEnumMap = {
  OrcCompression.none: 'NONE',
  OrcCompression.zlib: 'ZLIB',
  OrcCompression.snappy: 'SNAPPY',
};

const _$OrcFormatVersionEnumMap = {
  OrcFormatVersion.v0_11: 'V0_11',
  OrcFormatVersion.v0_12: 'V0_12',
};

OutputFormatConfiguration _$OutputFormatConfigurationFromJson(
    Map<String, dynamic> json) {
  return OutputFormatConfiguration(
    serializer: json['Serializer'] == null
        ? null
        : Serializer.fromJson(json['Serializer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OutputFormatConfigurationToJson(
    OutputFormatConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Serializer', instance.serializer?.toJson());
  return val;
}

ParquetSerDe _$ParquetSerDeFromJson(Map<String, dynamic> json) {
  return ParquetSerDe(
    blockSizeBytes: json['BlockSizeBytes'] as int,
    compression:
        _$enumDecodeNullable(_$ParquetCompressionEnumMap, json['Compression']),
    enableDictionaryCompression: json['EnableDictionaryCompression'] as bool,
    maxPaddingBytes: json['MaxPaddingBytes'] as int,
    pageSizeBytes: json['PageSizeBytes'] as int,
    writerVersion: _$enumDecodeNullable(
        _$ParquetWriterVersionEnumMap, json['WriterVersion']),
  );
}

Map<String, dynamic> _$ParquetSerDeToJson(ParquetSerDe instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BlockSizeBytes', instance.blockSizeBytes);
  writeNotNull(
      'Compression', _$ParquetCompressionEnumMap[instance.compression]);
  writeNotNull(
      'EnableDictionaryCompression', instance.enableDictionaryCompression);
  writeNotNull('MaxPaddingBytes', instance.maxPaddingBytes);
  writeNotNull('PageSizeBytes', instance.pageSizeBytes);
  writeNotNull(
      'WriterVersion', _$ParquetWriterVersionEnumMap[instance.writerVersion]);
  return val;
}

const _$ParquetCompressionEnumMap = {
  ParquetCompression.uncompressed: 'UNCOMPRESSED',
  ParquetCompression.gzip: 'GZIP',
  ParquetCompression.snappy: 'SNAPPY',
};

const _$ParquetWriterVersionEnumMap = {
  ParquetWriterVersion.v1: 'V1',
  ParquetWriterVersion.v2: 'V2',
};

ProcessingConfiguration _$ProcessingConfigurationFromJson(
    Map<String, dynamic> json) {
  return ProcessingConfiguration(
    enabled: json['Enabled'] as bool,
    processors: (json['Processors'] as List)
        ?.map((e) =>
            e == null ? null : Processor.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProcessingConfigurationToJson(
    ProcessingConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull(
      'Processors', instance.processors?.map((e) => e?.toJson())?.toList());
  return val;
}

Processor _$ProcessorFromJson(Map<String, dynamic> json) {
  return Processor(
    type: _$enumDecodeNullable(_$ProcessorTypeEnumMap, json['Type']),
    parameters: (json['Parameters'] as List)
        ?.map((e) => e == null
            ? null
            : ProcessorParameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProcessorToJson(Processor instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$ProcessorTypeEnumMap[instance.type]);
  writeNotNull(
      'Parameters', instance.parameters?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$ProcessorTypeEnumMap = {
  ProcessorType.lambda: 'Lambda',
};

ProcessorParameter _$ProcessorParameterFromJson(Map<String, dynamic> json) {
  return ProcessorParameter(
    parameterName: _$enumDecodeNullable(
        _$ProcessorParameterNameEnumMap, json['ParameterName']),
    parameterValue: json['ParameterValue'] as String,
  );
}

Map<String, dynamic> _$ProcessorParameterToJson(ProcessorParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ParameterName', _$ProcessorParameterNameEnumMap[instance.parameterName]);
  writeNotNull('ParameterValue', instance.parameterValue);
  return val;
}

const _$ProcessorParameterNameEnumMap = {
  ProcessorParameterName.lambdaArn: 'LambdaArn',
  ProcessorParameterName.numberOfRetries: 'NumberOfRetries',
  ProcessorParameterName.roleArn: 'RoleArn',
  ProcessorParameterName.bufferSizeInMBs: 'BufferSizeInMBs',
  ProcessorParameterName.bufferIntervalInSeconds: 'BufferIntervalInSeconds',
};

PutRecordBatchOutput _$PutRecordBatchOutputFromJson(Map<String, dynamic> json) {
  return PutRecordBatchOutput(
    failedPutCount: json['FailedPutCount'] as int,
    requestResponses: (json['RequestResponses'] as List)
        ?.map((e) => e == null
            ? null
            : PutRecordBatchResponseEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    encrypted: json['Encrypted'] as bool,
  );
}

PutRecordBatchResponseEntry _$PutRecordBatchResponseEntryFromJson(
    Map<String, dynamic> json) {
  return PutRecordBatchResponseEntry(
    errorCode: json['ErrorCode'] as String,
    errorMessage: json['ErrorMessage'] as String,
    recordId: json['RecordId'] as String,
  );
}

PutRecordOutput _$PutRecordOutputFromJson(Map<String, dynamic> json) {
  return PutRecordOutput(
    recordId: json['RecordId'] as String,
    encrypted: json['Encrypted'] as bool,
  );
}

Map<String, dynamic> _$RecordToJson(Record instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Data', const Uint8ListConverter().toJson(instance.data));
  return val;
}

Map<String, dynamic> _$RedshiftDestinationConfigurationToJson(
    RedshiftDestinationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClusterJDBCURL', instance.clusterJDBCURL);
  writeNotNull('CopyCommand', instance.copyCommand?.toJson());
  writeNotNull('Password', instance.password);
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull('S3Configuration', instance.s3Configuration?.toJson());
  writeNotNull('Username', instance.username);
  writeNotNull(
      'CloudWatchLoggingOptions', instance.cloudWatchLoggingOptions?.toJson());
  writeNotNull(
      'ProcessingConfiguration', instance.processingConfiguration?.toJson());
  writeNotNull('RetryOptions', instance.retryOptions?.toJson());
  writeNotNull(
      'S3BackupConfiguration', instance.s3BackupConfiguration?.toJson());
  writeNotNull(
      'S3BackupMode', _$RedshiftS3BackupModeEnumMap[instance.s3BackupMode]);
  return val;
}

const _$RedshiftS3BackupModeEnumMap = {
  RedshiftS3BackupMode.disabled: 'Disabled',
  RedshiftS3BackupMode.enabled: 'Enabled',
};

RedshiftDestinationDescription _$RedshiftDestinationDescriptionFromJson(
    Map<String, dynamic> json) {
  return RedshiftDestinationDescription(
    clusterJDBCURL: json['ClusterJDBCURL'] as String,
    copyCommand: json['CopyCommand'] == null
        ? null
        : CopyCommand.fromJson(json['CopyCommand'] as Map<String, dynamic>),
    roleARN: json['RoleARN'] as String,
    s3DestinationDescription: json['S3DestinationDescription'] == null
        ? null
        : S3DestinationDescription.fromJson(
            json['S3DestinationDescription'] as Map<String, dynamic>),
    username: json['Username'] as String,
    cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] == null
        ? null
        : CloudWatchLoggingOptions.fromJson(
            json['CloudWatchLoggingOptions'] as Map<String, dynamic>),
    processingConfiguration: json['ProcessingConfiguration'] == null
        ? null
        : ProcessingConfiguration.fromJson(
            json['ProcessingConfiguration'] as Map<String, dynamic>),
    retryOptions: json['RetryOptions'] == null
        ? null
        : RedshiftRetryOptions.fromJson(
            json['RetryOptions'] as Map<String, dynamic>),
    s3BackupDescription: json['S3BackupDescription'] == null
        ? null
        : S3DestinationDescription.fromJson(
            json['S3BackupDescription'] as Map<String, dynamic>),
    s3BackupMode: _$enumDecodeNullable(
        _$RedshiftS3BackupModeEnumMap, json['S3BackupMode']),
  );
}

Map<String, dynamic> _$RedshiftDestinationUpdateToJson(
    RedshiftDestinationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CloudWatchLoggingOptions', instance.cloudWatchLoggingOptions?.toJson());
  writeNotNull('ClusterJDBCURL', instance.clusterJDBCURL);
  writeNotNull('CopyCommand', instance.copyCommand?.toJson());
  writeNotNull('Password', instance.password);
  writeNotNull(
      'ProcessingConfiguration', instance.processingConfiguration?.toJson());
  writeNotNull('RetryOptions', instance.retryOptions?.toJson());
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull(
      'S3BackupMode', _$RedshiftS3BackupModeEnumMap[instance.s3BackupMode]);
  writeNotNull('S3BackupUpdate', instance.s3BackupUpdate?.toJson());
  writeNotNull('S3Update', instance.s3Update?.toJson());
  writeNotNull('Username', instance.username);
  return val;
}

RedshiftRetryOptions _$RedshiftRetryOptionsFromJson(Map<String, dynamic> json) {
  return RedshiftRetryOptions(
    durationInSeconds: json['DurationInSeconds'] as int,
  );
}

Map<String, dynamic> _$RedshiftRetryOptionsToJson(
    RedshiftRetryOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DurationInSeconds', instance.durationInSeconds);
  return val;
}

Map<String, dynamic> _$S3DestinationConfigurationToJson(
    S3DestinationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketARN', instance.bucketARN);
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull('BufferingHints', instance.bufferingHints?.toJson());
  writeNotNull(
      'CloudWatchLoggingOptions', instance.cloudWatchLoggingOptions?.toJson());
  writeNotNull('CompressionFormat',
      _$CompressionFormatEnumMap[instance.compressionFormat]);
  writeNotNull(
      'EncryptionConfiguration', instance.encryptionConfiguration?.toJson());
  writeNotNull('ErrorOutputPrefix', instance.errorOutputPrefix);
  writeNotNull('Prefix', instance.prefix);
  return val;
}

S3DestinationDescription _$S3DestinationDescriptionFromJson(
    Map<String, dynamic> json) {
  return S3DestinationDescription(
    bucketARN: json['BucketARN'] as String,
    bufferingHints: json['BufferingHints'] == null
        ? null
        : BufferingHints.fromJson(
            json['BufferingHints'] as Map<String, dynamic>),
    compressionFormat: _$enumDecodeNullable(
        _$CompressionFormatEnumMap, json['CompressionFormat']),
    encryptionConfiguration: json['EncryptionConfiguration'] == null
        ? null
        : EncryptionConfiguration.fromJson(
            json['EncryptionConfiguration'] as Map<String, dynamic>),
    roleARN: json['RoleARN'] as String,
    cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] == null
        ? null
        : CloudWatchLoggingOptions.fromJson(
            json['CloudWatchLoggingOptions'] as Map<String, dynamic>),
    errorOutputPrefix: json['ErrorOutputPrefix'] as String,
    prefix: json['Prefix'] as String,
  );
}

Map<String, dynamic> _$S3DestinationUpdateToJson(S3DestinationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketARN', instance.bucketARN);
  writeNotNull('BufferingHints', instance.bufferingHints?.toJson());
  writeNotNull(
      'CloudWatchLoggingOptions', instance.cloudWatchLoggingOptions?.toJson());
  writeNotNull('CompressionFormat',
      _$CompressionFormatEnumMap[instance.compressionFormat]);
  writeNotNull(
      'EncryptionConfiguration', instance.encryptionConfiguration?.toJson());
  writeNotNull('ErrorOutputPrefix', instance.errorOutputPrefix);
  writeNotNull('Prefix', instance.prefix);
  writeNotNull('RoleARN', instance.roleARN);
  return val;
}

SchemaConfiguration _$SchemaConfigurationFromJson(Map<String, dynamic> json) {
  return SchemaConfiguration(
    catalogId: json['CatalogId'] as String,
    databaseName: json['DatabaseName'] as String,
    region: json['Region'] as String,
    roleARN: json['RoleARN'] as String,
    tableName: json['TableName'] as String,
    versionId: json['VersionId'] as String,
  );
}

Map<String, dynamic> _$SchemaConfigurationToJson(SchemaConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CatalogId', instance.catalogId);
  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('Region', instance.region);
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull('TableName', instance.tableName);
  writeNotNull('VersionId', instance.versionId);
  return val;
}

Serializer _$SerializerFromJson(Map<String, dynamic> json) {
  return Serializer(
    orcSerDe: json['OrcSerDe'] == null
        ? null
        : OrcSerDe.fromJson(json['OrcSerDe'] as Map<String, dynamic>),
    parquetSerDe: json['ParquetSerDe'] == null
        ? null
        : ParquetSerDe.fromJson(json['ParquetSerDe'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SerializerToJson(Serializer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('OrcSerDe', instance.orcSerDe?.toJson());
  writeNotNull('ParquetSerDe', instance.parquetSerDe?.toJson());
  return val;
}

SourceDescription _$SourceDescriptionFromJson(Map<String, dynamic> json) {
  return SourceDescription(
    kinesisStreamSourceDescription:
        json['KinesisStreamSourceDescription'] == null
            ? null
            : KinesisStreamSourceDescription.fromJson(
                json['KinesisStreamSourceDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SplunkDestinationConfigurationToJson(
    SplunkDestinationConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HECEndpoint', instance.hECEndpoint);
  writeNotNull(
      'HECEndpointType', _$HECEndpointTypeEnumMap[instance.hECEndpointType]);
  writeNotNull('HECToken', instance.hECToken);
  writeNotNull('S3Configuration', instance.s3Configuration?.toJson());
  writeNotNull(
      'CloudWatchLoggingOptions', instance.cloudWatchLoggingOptions?.toJson());
  writeNotNull('HECAcknowledgmentTimeoutInSeconds',
      instance.hECAcknowledgmentTimeoutInSeconds);
  writeNotNull(
      'ProcessingConfiguration', instance.processingConfiguration?.toJson());
  writeNotNull('RetryOptions', instance.retryOptions?.toJson());
  writeNotNull(
      'S3BackupMode', _$SplunkS3BackupModeEnumMap[instance.s3BackupMode]);
  return val;
}

const _$HECEndpointTypeEnumMap = {
  HECEndpointType.raw: 'Raw',
  HECEndpointType.event: 'Event',
};

const _$SplunkS3BackupModeEnumMap = {
  SplunkS3BackupMode.failedEventsOnly: 'FailedEventsOnly',
  SplunkS3BackupMode.allEvents: 'AllEvents',
};

SplunkDestinationDescription _$SplunkDestinationDescriptionFromJson(
    Map<String, dynamic> json) {
  return SplunkDestinationDescription(
    cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] == null
        ? null
        : CloudWatchLoggingOptions.fromJson(
            json['CloudWatchLoggingOptions'] as Map<String, dynamic>),
    hECAcknowledgmentTimeoutInSeconds:
        json['HECAcknowledgmentTimeoutInSeconds'] as int,
    hECEndpoint: json['HECEndpoint'] as String,
    hECEndpointType:
        _$enumDecodeNullable(_$HECEndpointTypeEnumMap, json['HECEndpointType']),
    hECToken: json['HECToken'] as String,
    processingConfiguration: json['ProcessingConfiguration'] == null
        ? null
        : ProcessingConfiguration.fromJson(
            json['ProcessingConfiguration'] as Map<String, dynamic>),
    retryOptions: json['RetryOptions'] == null
        ? null
        : SplunkRetryOptions.fromJson(
            json['RetryOptions'] as Map<String, dynamic>),
    s3BackupMode:
        _$enumDecodeNullable(_$SplunkS3BackupModeEnumMap, json['S3BackupMode']),
    s3DestinationDescription: json['S3DestinationDescription'] == null
        ? null
        : S3DestinationDescription.fromJson(
            json['S3DestinationDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SplunkDestinationUpdateToJson(
    SplunkDestinationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'CloudWatchLoggingOptions', instance.cloudWatchLoggingOptions?.toJson());
  writeNotNull('HECAcknowledgmentTimeoutInSeconds',
      instance.hECAcknowledgmentTimeoutInSeconds);
  writeNotNull('HECEndpoint', instance.hECEndpoint);
  writeNotNull(
      'HECEndpointType', _$HECEndpointTypeEnumMap[instance.hECEndpointType]);
  writeNotNull('HECToken', instance.hECToken);
  writeNotNull(
      'ProcessingConfiguration', instance.processingConfiguration?.toJson());
  writeNotNull('RetryOptions', instance.retryOptions?.toJson());
  writeNotNull(
      'S3BackupMode', _$SplunkS3BackupModeEnumMap[instance.s3BackupMode]);
  writeNotNull('S3Update', instance.s3Update?.toJson());
  return val;
}

SplunkRetryOptions _$SplunkRetryOptionsFromJson(Map<String, dynamic> json) {
  return SplunkRetryOptions(
    durationInSeconds: json['DurationInSeconds'] as int,
  );
}

Map<String, dynamic> _$SplunkRetryOptionsToJson(SplunkRetryOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DurationInSeconds', instance.durationInSeconds);
  return val;
}

StartDeliveryStreamEncryptionOutput
    _$StartDeliveryStreamEncryptionOutputFromJson(Map<String, dynamic> json) {
  return StartDeliveryStreamEncryptionOutput();
}

StopDeliveryStreamEncryptionOutput _$StopDeliveryStreamEncryptionOutputFromJson(
    Map<String, dynamic> json) {
  return StopDeliveryStreamEncryptionOutput();
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

TagDeliveryStreamOutput _$TagDeliveryStreamOutputFromJson(
    Map<String, dynamic> json) {
  return TagDeliveryStreamOutput();
}

UntagDeliveryStreamOutput _$UntagDeliveryStreamOutputFromJson(
    Map<String, dynamic> json) {
  return UntagDeliveryStreamOutput();
}

UpdateDestinationOutput _$UpdateDestinationOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateDestinationOutput();
}

Map<String, dynamic> _$VpcConfigurationToJson(VpcConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  return val;
}

VpcConfigurationDescription _$VpcConfigurationDescriptionFromJson(
    Map<String, dynamic> json) {
  return VpcConfigurationDescription(
    roleARN: json['RoleARN'] as String,
    securityGroupIds:
        (json['SecurityGroupIds'] as List)?.map((e) => e as String)?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcId: json['VpcId'] as String,
  );
}
