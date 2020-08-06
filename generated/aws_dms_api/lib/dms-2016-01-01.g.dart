// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dms-2016-01-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountQuota _$AccountQuotaFromJson(Map<String, dynamic> json) {
  return AccountQuota(
    accountQuotaName: json['AccountQuotaName'] as String,
    max: json['Max'] as int,
    used: json['Used'] as int,
  );
}

AddTagsToResourceResponse _$AddTagsToResourceResponseFromJson(
    Map<String, dynamic> json) {
  return AddTagsToResourceResponse();
}

ApplyPendingMaintenanceActionResponse
    _$ApplyPendingMaintenanceActionResponseFromJson(Map<String, dynamic> json) {
  return ApplyPendingMaintenanceActionResponse(
    resourcePendingMaintenanceActions:
        json['ResourcePendingMaintenanceActions'] == null
            ? null
            : ResourcePendingMaintenanceActions.fromJson(
                json['ResourcePendingMaintenanceActions']
                    as Map<String, dynamic>),
  );
}

AvailabilityZone _$AvailabilityZoneFromJson(Map<String, dynamic> json) {
  return AvailabilityZone(
    name: json['Name'] as String,
  );
}

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return Certificate(
    certificateArn: json['CertificateArn'] as String,
    certificateCreationDate:
        unixTimestampFromJson(json['CertificateCreationDate']),
    certificateIdentifier: json['CertificateIdentifier'] as String,
    certificateOwner: json['CertificateOwner'] as String,
    certificatePem: json['CertificatePem'] as String,
    certificateWallet: const Uint8ListConverter()
        .fromJson(json['CertificateWallet'] as String),
    keyLength: json['KeyLength'] as int,
    signingAlgorithm: json['SigningAlgorithm'] as String,
    validFromDate: unixTimestampFromJson(json['ValidFromDate']),
    validToDate: unixTimestampFromJson(json['ValidToDate']),
  );
}

Connection _$ConnectionFromJson(Map<String, dynamic> json) {
  return Connection(
    endpointArn: json['EndpointArn'] as String,
    endpointIdentifier: json['EndpointIdentifier'] as String,
    lastFailureMessage: json['LastFailureMessage'] as String,
    replicationInstanceArn: json['ReplicationInstanceArn'] as String,
    replicationInstanceIdentifier:
        json['ReplicationInstanceIdentifier'] as String,
    status: json['Status'] as String,
  );
}

CreateEndpointResponse _$CreateEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEndpointResponse(
    endpoint: json['Endpoint'] == null
        ? null
        : Endpoint.fromJson(json['Endpoint'] as Map<String, dynamic>),
  );
}

CreateEventSubscriptionResponse _$CreateEventSubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateEventSubscriptionResponse(
    eventSubscription: json['EventSubscription'] == null
        ? null
        : EventSubscription.fromJson(
            json['EventSubscription'] as Map<String, dynamic>),
  );
}

CreateReplicationInstanceResponse _$CreateReplicationInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return CreateReplicationInstanceResponse(
    replicationInstance: json['ReplicationInstance'] == null
        ? null
        : ReplicationInstance.fromJson(
            json['ReplicationInstance'] as Map<String, dynamic>),
  );
}

CreateReplicationSubnetGroupResponse
    _$CreateReplicationSubnetGroupResponseFromJson(Map<String, dynamic> json) {
  return CreateReplicationSubnetGroupResponse(
    replicationSubnetGroup: json['ReplicationSubnetGroup'] == null
        ? null
        : ReplicationSubnetGroup.fromJson(
            json['ReplicationSubnetGroup'] as Map<String, dynamic>),
  );
}

CreateReplicationTaskResponse _$CreateReplicationTaskResponseFromJson(
    Map<String, dynamic> json) {
  return CreateReplicationTaskResponse(
    replicationTask: json['ReplicationTask'] == null
        ? null
        : ReplicationTask.fromJson(
            json['ReplicationTask'] as Map<String, dynamic>),
  );
}

DeleteCertificateResponse _$DeleteCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCertificateResponse(
    certificate: json['Certificate'] == null
        ? null
        : Certificate.fromJson(json['Certificate'] as Map<String, dynamic>),
  );
}

DeleteConnectionResponse _$DeleteConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteConnectionResponse(
    connection: json['Connection'] == null
        ? null
        : Connection.fromJson(json['Connection'] as Map<String, dynamic>),
  );
}

DeleteEndpointResponse _$DeleteEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEndpointResponse(
    endpoint: json['Endpoint'] == null
        ? null
        : Endpoint.fromJson(json['Endpoint'] as Map<String, dynamic>),
  );
}

DeleteEventSubscriptionResponse _$DeleteEventSubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteEventSubscriptionResponse(
    eventSubscription: json['EventSubscription'] == null
        ? null
        : EventSubscription.fromJson(
            json['EventSubscription'] as Map<String, dynamic>),
  );
}

DeleteReplicationInstanceResponse _$DeleteReplicationInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteReplicationInstanceResponse(
    replicationInstance: json['ReplicationInstance'] == null
        ? null
        : ReplicationInstance.fromJson(
            json['ReplicationInstance'] as Map<String, dynamic>),
  );
}

DeleteReplicationSubnetGroupResponse
    _$DeleteReplicationSubnetGroupResponseFromJson(Map<String, dynamic> json) {
  return DeleteReplicationSubnetGroupResponse();
}

DeleteReplicationTaskResponse _$DeleteReplicationTaskResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteReplicationTaskResponse(
    replicationTask: json['ReplicationTask'] == null
        ? null
        : ReplicationTask.fromJson(
            json['ReplicationTask'] as Map<String, dynamic>),
  );
}

DescribeAccountAttributesResponse _$DescribeAccountAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAccountAttributesResponse(
    accountQuotas: (json['AccountQuotas'] as List)
        ?.map((e) =>
            e == null ? null : AccountQuota.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    uniqueAccountIdentifier: json['UniqueAccountIdentifier'] as String,
  );
}

DescribeCertificatesResponse _$DescribeCertificatesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeCertificatesResponse(
    certificates: (json['Certificates'] as List)
        ?.map((e) =>
            e == null ? null : Certificate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

DescribeConnectionsResponse _$DescribeConnectionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeConnectionsResponse(
    connections: (json['Connections'] as List)
        ?.map((e) =>
            e == null ? null : Connection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

DescribeEndpointTypesResponse _$DescribeEndpointTypesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointTypesResponse(
    marker: json['Marker'] as String,
    supportedEndpointTypes: (json['SupportedEndpointTypes'] as List)
        ?.map((e) => e == null
            ? null
            : SupportedEndpointType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeEndpointsResponse _$DescribeEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointsResponse(
    endpoints: (json['Endpoints'] as List)
        ?.map((e) =>
            e == null ? null : Endpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

DescribeEventCategoriesResponse _$DescribeEventCategoriesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventCategoriesResponse(
    eventCategoryGroupList: (json['EventCategoryGroupList'] as List)
        ?.map((e) => e == null
            ? null
            : EventCategoryGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeEventSubscriptionsResponse _$DescribeEventSubscriptionsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventSubscriptionsResponse(
    eventSubscriptionsList: (json['EventSubscriptionsList'] as List)
        ?.map((e) => e == null
            ? null
            : EventSubscription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

DescribeEventsResponse _$DescribeEventsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEventsResponse(
    events: (json['Events'] as List)
        ?.map(
            (e) => e == null ? null : Event.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['Marker'] as String,
  );
}

DescribeOrderableReplicationInstancesResponse
    _$DescribeOrderableReplicationInstancesResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeOrderableReplicationInstancesResponse(
    marker: json['Marker'] as String,
    orderableReplicationInstances: (json['OrderableReplicationInstances']
            as List)
        ?.map((e) => e == null
            ? null
            : OrderableReplicationInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribePendingMaintenanceActionsResponse
    _$DescribePendingMaintenanceActionsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribePendingMaintenanceActionsResponse(
    marker: json['Marker'] as String,
    pendingMaintenanceActions: (json['PendingMaintenanceActions'] as List)
        ?.map((e) => e == null
            ? null
            : ResourcePendingMaintenanceActions.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeRefreshSchemasStatusResponse
    _$DescribeRefreshSchemasStatusResponseFromJson(Map<String, dynamic> json) {
  return DescribeRefreshSchemasStatusResponse(
    refreshSchemasStatus: json['RefreshSchemasStatus'] == null
        ? null
        : RefreshSchemasStatus.fromJson(
            json['RefreshSchemasStatus'] as Map<String, dynamic>),
  );
}

DescribeReplicationInstanceTaskLogsResponse
    _$DescribeReplicationInstanceTaskLogsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeReplicationInstanceTaskLogsResponse(
    marker: json['Marker'] as String,
    replicationInstanceArn: json['ReplicationInstanceArn'] as String,
    replicationInstanceTaskLogs: (json['ReplicationInstanceTaskLogs'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicationInstanceTaskLog.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeReplicationInstancesResponse
    _$DescribeReplicationInstancesResponseFromJson(Map<String, dynamic> json) {
  return DescribeReplicationInstancesResponse(
    marker: json['Marker'] as String,
    replicationInstances: (json['ReplicationInstances'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicationInstance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeReplicationSubnetGroupsResponse
    _$DescribeReplicationSubnetGroupsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeReplicationSubnetGroupsResponse(
    marker: json['Marker'] as String,
    replicationSubnetGroups: (json['ReplicationSubnetGroups'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicationSubnetGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeReplicationTaskAssessmentResultsResponse
    _$DescribeReplicationTaskAssessmentResultsResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeReplicationTaskAssessmentResultsResponse(
    bucketName: json['BucketName'] as String,
    marker: json['Marker'] as String,
    replicationTaskAssessmentResults:
        (json['ReplicationTaskAssessmentResults'] as List)
            ?.map((e) => e == null
                ? null
                : ReplicationTaskAssessmentResult.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

DescribeReplicationTasksResponse _$DescribeReplicationTasksResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeReplicationTasksResponse(
    marker: json['Marker'] as String,
    replicationTasks: (json['ReplicationTasks'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicationTask.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeSchemasResponse _$DescribeSchemasResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSchemasResponse(
    marker: json['Marker'] as String,
    schemas: (json['Schemas'] as List)?.map((e) => e as String)?.toList(),
  );
}

DescribeTableStatisticsResponse _$DescribeTableStatisticsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTableStatisticsResponse(
    marker: json['Marker'] as String,
    replicationTaskArn: json['ReplicationTaskArn'] as String,
    tableStatistics: (json['TableStatistics'] as List)
        ?.map((e) => e == null
            ? null
            : TableStatistics.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DmsTransferSettings _$DmsTransferSettingsFromJson(Map<String, dynamic> json) {
  return DmsTransferSettings(
    bucketName: json['BucketName'] as String,
    serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String,
  );
}

Map<String, dynamic> _$DmsTransferSettingsToJson(DmsTransferSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketName', instance.bucketName);
  writeNotNull('ServiceAccessRoleArn', instance.serviceAccessRoleArn);
  return val;
}

DynamoDbSettings _$DynamoDbSettingsFromJson(Map<String, dynamic> json) {
  return DynamoDbSettings(
    serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String,
  );
}

Map<String, dynamic> _$DynamoDbSettingsToJson(DynamoDbSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServiceAccessRoleArn', instance.serviceAccessRoleArn);
  return val;
}

ElasticsearchSettings _$ElasticsearchSettingsFromJson(
    Map<String, dynamic> json) {
  return ElasticsearchSettings(
    endpointUri: json['EndpointUri'] as String,
    serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String,
    errorRetryDuration: json['ErrorRetryDuration'] as int,
    fullLoadErrorPercentage: json['FullLoadErrorPercentage'] as int,
  );
}

Map<String, dynamic> _$ElasticsearchSettingsToJson(
    ElasticsearchSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndpointUri', instance.endpointUri);
  writeNotNull('ServiceAccessRoleArn', instance.serviceAccessRoleArn);
  writeNotNull('ErrorRetryDuration', instance.errorRetryDuration);
  writeNotNull('FullLoadErrorPercentage', instance.fullLoadErrorPercentage);
  return val;
}

Endpoint _$EndpointFromJson(Map<String, dynamic> json) {
  return Endpoint(
    certificateArn: json['CertificateArn'] as String,
    databaseName: json['DatabaseName'] as String,
    dmsTransferSettings: json['DmsTransferSettings'] == null
        ? null
        : DmsTransferSettings.fromJson(
            json['DmsTransferSettings'] as Map<String, dynamic>),
    dynamoDbSettings: json['DynamoDbSettings'] == null
        ? null
        : DynamoDbSettings.fromJson(
            json['DynamoDbSettings'] as Map<String, dynamic>),
    elasticsearchSettings: json['ElasticsearchSettings'] == null
        ? null
        : ElasticsearchSettings.fromJson(
            json['ElasticsearchSettings'] as Map<String, dynamic>),
    endpointArn: json['EndpointArn'] as String,
    endpointIdentifier: json['EndpointIdentifier'] as String,
    endpointType: _$enumDecodeNullable(
        _$ReplicationEndpointTypeValueEnumMap, json['EndpointType']),
    engineDisplayName: json['EngineDisplayName'] as String,
    engineName: json['EngineName'] as String,
    externalId: json['ExternalId'] as String,
    externalTableDefinition: json['ExternalTableDefinition'] as String,
    extraConnectionAttributes: json['ExtraConnectionAttributes'] as String,
    kafkaSettings: json['KafkaSettings'] == null
        ? null
        : KafkaSettings.fromJson(json['KafkaSettings'] as Map<String, dynamic>),
    kinesisSettings: json['KinesisSettings'] == null
        ? null
        : KinesisSettings.fromJson(
            json['KinesisSettings'] as Map<String, dynamic>),
    kmsKeyId: json['KmsKeyId'] as String,
    mongoDbSettings: json['MongoDbSettings'] == null
        ? null
        : MongoDbSettings.fromJson(
            json['MongoDbSettings'] as Map<String, dynamic>),
    port: json['Port'] as int,
    redshiftSettings: json['RedshiftSettings'] == null
        ? null
        : RedshiftSettings.fromJson(
            json['RedshiftSettings'] as Map<String, dynamic>),
    s3Settings: json['S3Settings'] == null
        ? null
        : S3Settings.fromJson(json['S3Settings'] as Map<String, dynamic>),
    serverName: json['ServerName'] as String,
    serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String,
    sslMode: _$enumDecodeNullable(_$DmsSslModeValueEnumMap, json['SslMode']),
    status: json['Status'] as String,
    username: json['Username'] as String,
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

const _$ReplicationEndpointTypeValueEnumMap = {
  ReplicationEndpointTypeValue.source: 'source',
  ReplicationEndpointTypeValue.target: 'target',
};

const _$DmsSslModeValueEnumMap = {
  DmsSslModeValue.none: 'none',
  DmsSslModeValue.require: 'require',
  DmsSslModeValue.verifyCa: 'verify-ca',
  DmsSslModeValue.verifyFull: 'verify-full',
};

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    date: unixTimestampFromJson(json['Date']),
    eventCategories:
        (json['EventCategories'] as List)?.map((e) => e as String)?.toList(),
    message: json['Message'] as String,
    sourceIdentifier: json['SourceIdentifier'] as String,
    sourceType: _$enumDecodeNullable(_$SourceTypeEnumMap, json['SourceType']),
  );
}

const _$SourceTypeEnumMap = {
  SourceType.replicationInstance: 'replication-instance',
};

EventCategoryGroup _$EventCategoryGroupFromJson(Map<String, dynamic> json) {
  return EventCategoryGroup(
    eventCategories:
        (json['EventCategories'] as List)?.map((e) => e as String)?.toList(),
    sourceType: json['SourceType'] as String,
  );
}

EventSubscription _$EventSubscriptionFromJson(Map<String, dynamic> json) {
  return EventSubscription(
    custSubscriptionId: json['CustSubscriptionId'] as String,
    customerAwsId: json['CustomerAwsId'] as String,
    enabled: json['Enabled'] as bool,
    eventCategoriesList: (json['EventCategoriesList'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    snsTopicArn: json['SnsTopicArn'] as String,
    sourceIdsList:
        (json['SourceIdsList'] as List)?.map((e) => e as String)?.toList(),
    sourceType: json['SourceType'] as String,
    status: json['Status'] as String,
    subscriptionCreationTime: json['SubscriptionCreationTime'] as String,
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
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

ImportCertificateResponse _$ImportCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return ImportCertificateResponse(
    certificate: json['Certificate'] == null
        ? null
        : Certificate.fromJson(json['Certificate'] as Map<String, dynamic>),
  );
}

KafkaSettings _$KafkaSettingsFromJson(Map<String, dynamic> json) {
  return KafkaSettings(
    broker: json['Broker'] as String,
    topic: json['Topic'] as String,
  );
}

Map<String, dynamic> _$KafkaSettingsToJson(KafkaSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Broker', instance.broker);
  writeNotNull('Topic', instance.topic);
  return val;
}

KinesisSettings _$KinesisSettingsFromJson(Map<String, dynamic> json) {
  return KinesisSettings(
    includeControlDetails: json['IncludeControlDetails'] as bool,
    includePartitionValue: json['IncludePartitionValue'] as bool,
    includeTableAlterOperations: json['IncludeTableAlterOperations'] as bool,
    includeTransactionDetails: json['IncludeTransactionDetails'] as bool,
    messageFormat: _$enumDecodeNullable(
        _$MessageFormatValueEnumMap, json['MessageFormat']),
    partitionIncludeSchemaTable: json['PartitionIncludeSchemaTable'] as bool,
    serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String,
    streamArn: json['StreamArn'] as String,
  );
}

Map<String, dynamic> _$KinesisSettingsToJson(KinesisSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IncludeControlDetails', instance.includeControlDetails);
  writeNotNull('IncludePartitionValue', instance.includePartitionValue);
  writeNotNull(
      'IncludeTableAlterOperations', instance.includeTableAlterOperations);
  writeNotNull('IncludeTransactionDetails', instance.includeTransactionDetails);
  writeNotNull(
      'MessageFormat', _$MessageFormatValueEnumMap[instance.messageFormat]);
  writeNotNull(
      'PartitionIncludeSchemaTable', instance.partitionIncludeSchemaTable);
  writeNotNull('ServiceAccessRoleArn', instance.serviceAccessRoleArn);
  writeNotNull('StreamArn', instance.streamArn);
  return val;
}

const _$MessageFormatValueEnumMap = {
  MessageFormatValue.json: 'json',
  MessageFormatValue.jsonUnformatted: 'json-unformatted',
};

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tagList: (json['TagList'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ModifyEndpointResponse _$ModifyEndpointResponseFromJson(
    Map<String, dynamic> json) {
  return ModifyEndpointResponse(
    endpoint: json['Endpoint'] == null
        ? null
        : Endpoint.fromJson(json['Endpoint'] as Map<String, dynamic>),
  );
}

ModifyEventSubscriptionResponse _$ModifyEventSubscriptionResponseFromJson(
    Map<String, dynamic> json) {
  return ModifyEventSubscriptionResponse(
    eventSubscription: json['EventSubscription'] == null
        ? null
        : EventSubscription.fromJson(
            json['EventSubscription'] as Map<String, dynamic>),
  );
}

ModifyReplicationInstanceResponse _$ModifyReplicationInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return ModifyReplicationInstanceResponse(
    replicationInstance: json['ReplicationInstance'] == null
        ? null
        : ReplicationInstance.fromJson(
            json['ReplicationInstance'] as Map<String, dynamic>),
  );
}

ModifyReplicationSubnetGroupResponse
    _$ModifyReplicationSubnetGroupResponseFromJson(Map<String, dynamic> json) {
  return ModifyReplicationSubnetGroupResponse(
    replicationSubnetGroup: json['ReplicationSubnetGroup'] == null
        ? null
        : ReplicationSubnetGroup.fromJson(
            json['ReplicationSubnetGroup'] as Map<String, dynamic>),
  );
}

ModifyReplicationTaskResponse _$ModifyReplicationTaskResponseFromJson(
    Map<String, dynamic> json) {
  return ModifyReplicationTaskResponse(
    replicationTask: json['ReplicationTask'] == null
        ? null
        : ReplicationTask.fromJson(
            json['ReplicationTask'] as Map<String, dynamic>),
  );
}

MongoDbSettings _$MongoDbSettingsFromJson(Map<String, dynamic> json) {
  return MongoDbSettings(
    authMechanism: _$enumDecodeNullable(
        _$AuthMechanismValueEnumMap, json['AuthMechanism']),
    authSource: json['AuthSource'] as String,
    authType: _$enumDecodeNullable(_$AuthTypeValueEnumMap, json['AuthType']),
    databaseName: json['DatabaseName'] as String,
    docsToInvestigate: json['DocsToInvestigate'] as String,
    extractDocId: json['ExtractDocId'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    nestingLevel:
        _$enumDecodeNullable(_$NestingLevelValueEnumMap, json['NestingLevel']),
    password: json['Password'] as String,
    port: json['Port'] as int,
    serverName: json['ServerName'] as String,
    username: json['Username'] as String,
  );
}

Map<String, dynamic> _$MongoDbSettingsToJson(MongoDbSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'AuthMechanism', _$AuthMechanismValueEnumMap[instance.authMechanism]);
  writeNotNull('AuthSource', instance.authSource);
  writeNotNull('AuthType', _$AuthTypeValueEnumMap[instance.authType]);
  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('DocsToInvestigate', instance.docsToInvestigate);
  writeNotNull('ExtractDocId', instance.extractDocId);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull(
      'NestingLevel', _$NestingLevelValueEnumMap[instance.nestingLevel]);
  writeNotNull('Password', instance.password);
  writeNotNull('Port', instance.port);
  writeNotNull('ServerName', instance.serverName);
  writeNotNull('Username', instance.username);
  return val;
}

const _$AuthMechanismValueEnumMap = {
  AuthMechanismValue.$default: 'default',
  AuthMechanismValue.mongodbCr: 'mongodb_cr',
  AuthMechanismValue.scramSha_1: 'scram_sha_1',
};

const _$AuthTypeValueEnumMap = {
  AuthTypeValue.no: 'no',
  AuthTypeValue.password: 'password',
};

const _$NestingLevelValueEnumMap = {
  NestingLevelValue.none: 'none',
  NestingLevelValue.one: 'one',
};

OrderableReplicationInstance _$OrderableReplicationInstanceFromJson(
    Map<String, dynamic> json) {
  return OrderableReplicationInstance(
    availabilityZones:
        (json['AvailabilityZones'] as List)?.map((e) => e as String)?.toList(),
    defaultAllocatedStorage: json['DefaultAllocatedStorage'] as int,
    engineVersion: json['EngineVersion'] as String,
    includedAllocatedStorage: json['IncludedAllocatedStorage'] as int,
    maxAllocatedStorage: json['MaxAllocatedStorage'] as int,
    minAllocatedStorage: json['MinAllocatedStorage'] as int,
    releaseStatus: _$enumDecodeNullable(
        _$ReleaseStatusValuesEnumMap, json['ReleaseStatus']),
    replicationInstanceClass: json['ReplicationInstanceClass'] as String,
    storageType: json['StorageType'] as String,
  );
}

const _$ReleaseStatusValuesEnumMap = {
  ReleaseStatusValues.beta: 'beta',
};

PendingMaintenanceAction _$PendingMaintenanceActionFromJson(
    Map<String, dynamic> json) {
  return PendingMaintenanceAction(
    action: json['Action'] as String,
    autoAppliedAfterDate: unixTimestampFromJson(json['AutoAppliedAfterDate']),
    currentApplyDate: unixTimestampFromJson(json['CurrentApplyDate']),
    description: json['Description'] as String,
    forcedApplyDate: unixTimestampFromJson(json['ForcedApplyDate']),
    optInStatus: json['OptInStatus'] as String,
  );
}

RebootReplicationInstanceResponse _$RebootReplicationInstanceResponseFromJson(
    Map<String, dynamic> json) {
  return RebootReplicationInstanceResponse(
    replicationInstance: json['ReplicationInstance'] == null
        ? null
        : ReplicationInstance.fromJson(
            json['ReplicationInstance'] as Map<String, dynamic>),
  );
}

RedshiftSettings _$RedshiftSettingsFromJson(Map<String, dynamic> json) {
  return RedshiftSettings(
    acceptAnyDate: json['AcceptAnyDate'] as bool,
    afterConnectScript: json['AfterConnectScript'] as String,
    bucketFolder: json['BucketFolder'] as String,
    bucketName: json['BucketName'] as String,
    connectionTimeout: json['ConnectionTimeout'] as int,
    databaseName: json['DatabaseName'] as String,
    dateFormat: json['DateFormat'] as String,
    emptyAsNull: json['EmptyAsNull'] as bool,
    encryptionMode: _$enumDecodeNullable(
        _$EncryptionModeValueEnumMap, json['EncryptionMode']),
    fileTransferUploadStreams: json['FileTransferUploadStreams'] as int,
    loadTimeout: json['LoadTimeout'] as int,
    maxFileSize: json['MaxFileSize'] as int,
    password: json['Password'] as String,
    port: json['Port'] as int,
    removeQuotes: json['RemoveQuotes'] as bool,
    replaceChars: json['ReplaceChars'] as String,
    replaceInvalidChars: json['ReplaceInvalidChars'] as String,
    serverName: json['ServerName'] as String,
    serverSideEncryptionKmsKeyId:
        json['ServerSideEncryptionKmsKeyId'] as String,
    serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String,
    timeFormat: json['TimeFormat'] as String,
    trimBlanks: json['TrimBlanks'] as bool,
    truncateColumns: json['TruncateColumns'] as bool,
    username: json['Username'] as String,
    writeBufferSize: json['WriteBufferSize'] as int,
  );
}

Map<String, dynamic> _$RedshiftSettingsToJson(RedshiftSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AcceptAnyDate', instance.acceptAnyDate);
  writeNotNull('AfterConnectScript', instance.afterConnectScript);
  writeNotNull('BucketFolder', instance.bucketFolder);
  writeNotNull('BucketName', instance.bucketName);
  writeNotNull('ConnectionTimeout', instance.connectionTimeout);
  writeNotNull('DatabaseName', instance.databaseName);
  writeNotNull('DateFormat', instance.dateFormat);
  writeNotNull('EmptyAsNull', instance.emptyAsNull);
  writeNotNull(
      'EncryptionMode', _$EncryptionModeValueEnumMap[instance.encryptionMode]);
  writeNotNull('FileTransferUploadStreams', instance.fileTransferUploadStreams);
  writeNotNull('LoadTimeout', instance.loadTimeout);
  writeNotNull('MaxFileSize', instance.maxFileSize);
  writeNotNull('Password', instance.password);
  writeNotNull('Port', instance.port);
  writeNotNull('RemoveQuotes', instance.removeQuotes);
  writeNotNull('ReplaceChars', instance.replaceChars);
  writeNotNull('ReplaceInvalidChars', instance.replaceInvalidChars);
  writeNotNull('ServerName', instance.serverName);
  writeNotNull(
      'ServerSideEncryptionKmsKeyId', instance.serverSideEncryptionKmsKeyId);
  writeNotNull('ServiceAccessRoleArn', instance.serviceAccessRoleArn);
  writeNotNull('TimeFormat', instance.timeFormat);
  writeNotNull('TrimBlanks', instance.trimBlanks);
  writeNotNull('TruncateColumns', instance.truncateColumns);
  writeNotNull('Username', instance.username);
  writeNotNull('WriteBufferSize', instance.writeBufferSize);
  return val;
}

const _$EncryptionModeValueEnumMap = {
  EncryptionModeValue.sseS3: 'sse-s3',
  EncryptionModeValue.sseKms: 'sse-kms',
};

RefreshSchemasResponse _$RefreshSchemasResponseFromJson(
    Map<String, dynamic> json) {
  return RefreshSchemasResponse(
    refreshSchemasStatus: json['RefreshSchemasStatus'] == null
        ? null
        : RefreshSchemasStatus.fromJson(
            json['RefreshSchemasStatus'] as Map<String, dynamic>),
  );
}

RefreshSchemasStatus _$RefreshSchemasStatusFromJson(Map<String, dynamic> json) {
  return RefreshSchemasStatus(
    endpointArn: json['EndpointArn'] as String,
    lastFailureMessage: json['LastFailureMessage'] as String,
    lastRefreshDate: unixTimestampFromJson(json['LastRefreshDate']),
    replicationInstanceArn: json['ReplicationInstanceArn'] as String,
    status: _$enumDecodeNullable(
        _$RefreshSchemasStatusTypeValueEnumMap, json['Status']),
  );
}

const _$RefreshSchemasStatusTypeValueEnumMap = {
  RefreshSchemasStatusTypeValue.successful: 'successful',
  RefreshSchemasStatusTypeValue.failed: 'failed',
  RefreshSchemasStatusTypeValue.refreshing: 'refreshing',
};

ReloadTablesResponse _$ReloadTablesResponseFromJson(Map<String, dynamic> json) {
  return ReloadTablesResponse(
    replicationTaskArn: json['ReplicationTaskArn'] as String,
  );
}

RemoveTagsFromResourceResponse _$RemoveTagsFromResourceResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveTagsFromResourceResponse();
}

ReplicationInstance _$ReplicationInstanceFromJson(Map<String, dynamic> json) {
  return ReplicationInstance(
    allocatedStorage: json['AllocatedStorage'] as int,
    autoMinorVersionUpgrade: json['AutoMinorVersionUpgrade'] as bool,
    availabilityZone: json['AvailabilityZone'] as String,
    dnsNameServers: json['DnsNameServers'] as String,
    engineVersion: json['EngineVersion'] as String,
    freeUntil: unixTimestampFromJson(json['FreeUntil']),
    instanceCreateTime: unixTimestampFromJson(json['InstanceCreateTime']),
    kmsKeyId: json['KmsKeyId'] as String,
    multiAZ: json['MultiAZ'] as bool,
    pendingModifiedValues: json['PendingModifiedValues'] == null
        ? null
        : ReplicationPendingModifiedValues.fromJson(
            json['PendingModifiedValues'] as Map<String, dynamic>),
    preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String,
    publiclyAccessible: json['PubliclyAccessible'] as bool,
    replicationInstanceArn: json['ReplicationInstanceArn'] as String,
    replicationInstanceClass: json['ReplicationInstanceClass'] as String,
    replicationInstanceIdentifier:
        json['ReplicationInstanceIdentifier'] as String,
    replicationInstancePrivateIpAddress:
        json['ReplicationInstancePrivateIpAddress'] as String,
    replicationInstancePrivateIpAddresses:
        (json['ReplicationInstancePrivateIpAddresses'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    replicationInstancePublicIpAddress:
        json['ReplicationInstancePublicIpAddress'] as String,
    replicationInstancePublicIpAddresses:
        (json['ReplicationInstancePublicIpAddresses'] as List)
            ?.map((e) => e as String)
            ?.toList(),
    replicationInstanceStatus: json['ReplicationInstanceStatus'] as String,
    replicationSubnetGroup: json['ReplicationSubnetGroup'] == null
        ? null
        : ReplicationSubnetGroup.fromJson(
            json['ReplicationSubnetGroup'] as Map<String, dynamic>),
    secondaryAvailabilityZone: json['SecondaryAvailabilityZone'] as String,
    vpcSecurityGroups: (json['VpcSecurityGroups'] as List)
        ?.map((e) => e == null
            ? null
            : VpcSecurityGroupMembership.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ReplicationInstanceTaskLog _$ReplicationInstanceTaskLogFromJson(
    Map<String, dynamic> json) {
  return ReplicationInstanceTaskLog(
    replicationInstanceTaskLogSize:
        json['ReplicationInstanceTaskLogSize'] as int,
    replicationTaskArn: json['ReplicationTaskArn'] as String,
    replicationTaskName: json['ReplicationTaskName'] as String,
  );
}

ReplicationPendingModifiedValues _$ReplicationPendingModifiedValuesFromJson(
    Map<String, dynamic> json) {
  return ReplicationPendingModifiedValues(
    allocatedStorage: json['AllocatedStorage'] as int,
    engineVersion: json['EngineVersion'] as String,
    multiAZ: json['MultiAZ'] as bool,
    replicationInstanceClass: json['ReplicationInstanceClass'] as String,
  );
}

ReplicationSubnetGroup _$ReplicationSubnetGroupFromJson(
    Map<String, dynamic> json) {
  return ReplicationSubnetGroup(
    replicationSubnetGroupDescription:
        json['ReplicationSubnetGroupDescription'] as String,
    replicationSubnetGroupIdentifier:
        json['ReplicationSubnetGroupIdentifier'] as String,
    subnetGroupStatus: json['SubnetGroupStatus'] as String,
    subnets: (json['Subnets'] as List)
        ?.map((e) =>
            e == null ? null : Subnet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    vpcId: json['VpcId'] as String,
  );
}

ReplicationTask _$ReplicationTaskFromJson(Map<String, dynamic> json) {
  return ReplicationTask(
    cdcStartPosition: json['CdcStartPosition'] as String,
    cdcStopPosition: json['CdcStopPosition'] as String,
    lastFailureMessage: json['LastFailureMessage'] as String,
    migrationType: _$enumDecodeNullable(
        _$MigrationTypeValueEnumMap, json['MigrationType']),
    recoveryCheckpoint: json['RecoveryCheckpoint'] as String,
    replicationInstanceArn: json['ReplicationInstanceArn'] as String,
    replicationTaskArn: json['ReplicationTaskArn'] as String,
    replicationTaskCreationDate:
        unixTimestampFromJson(json['ReplicationTaskCreationDate']),
    replicationTaskIdentifier: json['ReplicationTaskIdentifier'] as String,
    replicationTaskSettings: json['ReplicationTaskSettings'] as String,
    replicationTaskStartDate:
        unixTimestampFromJson(json['ReplicationTaskStartDate']),
    replicationTaskStats: json['ReplicationTaskStats'] == null
        ? null
        : ReplicationTaskStats.fromJson(
            json['ReplicationTaskStats'] as Map<String, dynamic>),
    sourceEndpointArn: json['SourceEndpointArn'] as String,
    status: json['Status'] as String,
    stopReason: json['StopReason'] as String,
    tableMappings: json['TableMappings'] as String,
    targetEndpointArn: json['TargetEndpointArn'] as String,
  );
}

const _$MigrationTypeValueEnumMap = {
  MigrationTypeValue.fullLoad: 'full-load',
  MigrationTypeValue.cdc: 'cdc',
  MigrationTypeValue.fullLoadAndCdc: 'full-load-and-cdc',
};

ReplicationTaskAssessmentResult _$ReplicationTaskAssessmentResultFromJson(
    Map<String, dynamic> json) {
  return ReplicationTaskAssessmentResult(
    assessmentResults: json['AssessmentResults'] as String,
    assessmentResultsFile: json['AssessmentResultsFile'] as String,
    assessmentStatus: json['AssessmentStatus'] as String,
    replicationTaskArn: json['ReplicationTaskArn'] as String,
    replicationTaskIdentifier: json['ReplicationTaskIdentifier'] as String,
    replicationTaskLastAssessmentDate:
        unixTimestampFromJson(json['ReplicationTaskLastAssessmentDate']),
    s3ObjectUrl: json['S3ObjectUrl'] as String,
  );
}

ReplicationTaskStats _$ReplicationTaskStatsFromJson(Map<String, dynamic> json) {
  return ReplicationTaskStats(
    elapsedTimeMillis: json['ElapsedTimeMillis'] as int,
    freshStartDate: unixTimestampFromJson(json['FreshStartDate']),
    fullLoadFinishDate: unixTimestampFromJson(json['FullLoadFinishDate']),
    fullLoadProgressPercent: json['FullLoadProgressPercent'] as int,
    fullLoadStartDate: unixTimestampFromJson(json['FullLoadStartDate']),
    startDate: unixTimestampFromJson(json['StartDate']),
    stopDate: unixTimestampFromJson(json['StopDate']),
    tablesErrored: json['TablesErrored'] as int,
    tablesLoaded: json['TablesLoaded'] as int,
    tablesLoading: json['TablesLoading'] as int,
    tablesQueued: json['TablesQueued'] as int,
  );
}

ResourcePendingMaintenanceActions _$ResourcePendingMaintenanceActionsFromJson(
    Map<String, dynamic> json) {
  return ResourcePendingMaintenanceActions(
    pendingMaintenanceActionDetails:
        (json['PendingMaintenanceActionDetails'] as List)
            ?.map((e) => e == null
                ? null
                : PendingMaintenanceAction.fromJson(e as Map<String, dynamic>))
            ?.toList(),
    resourceIdentifier: json['ResourceIdentifier'] as String,
  );
}

S3Settings _$S3SettingsFromJson(Map<String, dynamic> json) {
  return S3Settings(
    bucketFolder: json['BucketFolder'] as String,
    bucketName: json['BucketName'] as String,
    cdcInsertsAndUpdates: json['CdcInsertsAndUpdates'] as bool,
    cdcInsertsOnly: json['CdcInsertsOnly'] as bool,
    compressionType: _$enumDecodeNullable(
        _$CompressionTypeValueEnumMap, json['CompressionType']),
    csvDelimiter: json['CsvDelimiter'] as String,
    csvRowDelimiter: json['CsvRowDelimiter'] as String,
    dataFormat:
        _$enumDecodeNullable(_$DataFormatValueEnumMap, json['DataFormat']),
    dataPageSize: json['DataPageSize'] as int,
    dictPageSizeLimit: json['DictPageSizeLimit'] as int,
    enableStatistics: json['EnableStatistics'] as bool,
    encodingType:
        _$enumDecodeNullable(_$EncodingTypeValueEnumMap, json['EncodingType']),
    encryptionMode: _$enumDecodeNullable(
        _$EncryptionModeValueEnumMap, json['EncryptionMode']),
    externalTableDefinition: json['ExternalTableDefinition'] as String,
    includeOpForFullLoad: json['IncludeOpForFullLoad'] as bool,
    parquetTimestampInMillisecond:
        json['ParquetTimestampInMillisecond'] as bool,
    parquetVersion: _$enumDecodeNullable(
        _$ParquetVersionValueEnumMap, json['ParquetVersion']),
    rowGroupLength: json['RowGroupLength'] as int,
    serverSideEncryptionKmsKeyId:
        json['ServerSideEncryptionKmsKeyId'] as String,
    serviceAccessRoleArn: json['ServiceAccessRoleArn'] as String,
    timestampColumnName: json['TimestampColumnName'] as String,
  );
}

Map<String, dynamic> _$S3SettingsToJson(S3Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BucketFolder', instance.bucketFolder);
  writeNotNull('BucketName', instance.bucketName);
  writeNotNull('CdcInsertsAndUpdates', instance.cdcInsertsAndUpdates);
  writeNotNull('CdcInsertsOnly', instance.cdcInsertsOnly);
  writeNotNull('CompressionType',
      _$CompressionTypeValueEnumMap[instance.compressionType]);
  writeNotNull('CsvDelimiter', instance.csvDelimiter);
  writeNotNull('CsvRowDelimiter', instance.csvRowDelimiter);
  writeNotNull('DataFormat', _$DataFormatValueEnumMap[instance.dataFormat]);
  writeNotNull('DataPageSize', instance.dataPageSize);
  writeNotNull('DictPageSizeLimit', instance.dictPageSizeLimit);
  writeNotNull('EnableStatistics', instance.enableStatistics);
  writeNotNull(
      'EncodingType', _$EncodingTypeValueEnumMap[instance.encodingType]);
  writeNotNull(
      'EncryptionMode', _$EncryptionModeValueEnumMap[instance.encryptionMode]);
  writeNotNull('ExternalTableDefinition', instance.externalTableDefinition);
  writeNotNull('IncludeOpForFullLoad', instance.includeOpForFullLoad);
  writeNotNull(
      'ParquetTimestampInMillisecond', instance.parquetTimestampInMillisecond);
  writeNotNull(
      'ParquetVersion', _$ParquetVersionValueEnumMap[instance.parquetVersion]);
  writeNotNull('RowGroupLength', instance.rowGroupLength);
  writeNotNull(
      'ServerSideEncryptionKmsKeyId', instance.serverSideEncryptionKmsKeyId);
  writeNotNull('ServiceAccessRoleArn', instance.serviceAccessRoleArn);
  writeNotNull('TimestampColumnName', instance.timestampColumnName);
  return val;
}

const _$CompressionTypeValueEnumMap = {
  CompressionTypeValue.none: 'none',
  CompressionTypeValue.gzip: 'gzip',
};

const _$DataFormatValueEnumMap = {
  DataFormatValue.csv: 'csv',
  DataFormatValue.parquet: 'parquet',
};

const _$EncodingTypeValueEnumMap = {
  EncodingTypeValue.plain: 'plain',
  EncodingTypeValue.plainDictionary: 'plain-dictionary',
  EncodingTypeValue.rleDictionary: 'rle-dictionary',
};

const _$ParquetVersionValueEnumMap = {
  ParquetVersionValue.parquet_1_0: 'parquet-1-0',
  ParquetVersionValue.parquet_2_0: 'parquet-2-0',
};

StartReplicationTaskAssessmentResponse
    _$StartReplicationTaskAssessmentResponseFromJson(
        Map<String, dynamic> json) {
  return StartReplicationTaskAssessmentResponse(
    replicationTask: json['ReplicationTask'] == null
        ? null
        : ReplicationTask.fromJson(
            json['ReplicationTask'] as Map<String, dynamic>),
  );
}

StartReplicationTaskResponse _$StartReplicationTaskResponseFromJson(
    Map<String, dynamic> json) {
  return StartReplicationTaskResponse(
    replicationTask: json['ReplicationTask'] == null
        ? null
        : ReplicationTask.fromJson(
            json['ReplicationTask'] as Map<String, dynamic>),
  );
}

StopReplicationTaskResponse _$StopReplicationTaskResponseFromJson(
    Map<String, dynamic> json) {
  return StopReplicationTaskResponse(
    replicationTask: json['ReplicationTask'] == null
        ? null
        : ReplicationTask.fromJson(
            json['ReplicationTask'] as Map<String, dynamic>),
  );
}

Subnet _$SubnetFromJson(Map<String, dynamic> json) {
  return Subnet(
    subnetAvailabilityZone: json['SubnetAvailabilityZone'] == null
        ? null
        : AvailabilityZone.fromJson(
            json['SubnetAvailabilityZone'] as Map<String, dynamic>),
    subnetIdentifier: json['SubnetIdentifier'] as String,
    subnetStatus: json['SubnetStatus'] as String,
  );
}

SupportedEndpointType _$SupportedEndpointTypeFromJson(
    Map<String, dynamic> json) {
  return SupportedEndpointType(
    endpointType: _$enumDecodeNullable(
        _$ReplicationEndpointTypeValueEnumMap, json['EndpointType']),
    engineDisplayName: json['EngineDisplayName'] as String,
    engineName: json['EngineName'] as String,
    supportsCDC: json['SupportsCDC'] as bool,
  );
}

TableStatistics _$TableStatisticsFromJson(Map<String, dynamic> json) {
  return TableStatistics(
    ddls: json['Ddls'] as int,
    deletes: json['Deletes'] as int,
    fullLoadCondtnlChkFailedRows: json['FullLoadCondtnlChkFailedRows'] as int,
    fullLoadEndTime: unixTimestampFromJson(json['FullLoadEndTime']),
    fullLoadErrorRows: json['FullLoadErrorRows'] as int,
    fullLoadReloaded: json['FullLoadReloaded'] as bool,
    fullLoadRows: json['FullLoadRows'] as int,
    fullLoadStartTime: unixTimestampFromJson(json['FullLoadStartTime']),
    inserts: json['Inserts'] as int,
    lastUpdateTime: unixTimestampFromJson(json['LastUpdateTime']),
    schemaName: json['SchemaName'] as String,
    tableName: json['TableName'] as String,
    tableState: json['TableState'] as String,
    updates: json['Updates'] as int,
    validationFailedRecords: json['ValidationFailedRecords'] as int,
    validationPendingRecords: json['ValidationPendingRecords'] as int,
    validationState: json['ValidationState'] as String,
    validationStateDetails: json['ValidationStateDetails'] as String,
    validationSuspendedRecords: json['ValidationSuspendedRecords'] as int,
  );
}

Map<String, dynamic> _$TableToReloadToJson(TableToReload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SchemaName', instance.schemaName);
  writeNotNull('TableName', instance.tableName);
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

TestConnectionResponse _$TestConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return TestConnectionResponse(
    connection: json['Connection'] == null
        ? null
        : Connection.fromJson(json['Connection'] as Map<String, dynamic>),
  );
}

VpcSecurityGroupMembership _$VpcSecurityGroupMembershipFromJson(
    Map<String, dynamic> json) {
  return VpcSecurityGroupMembership(
    status: json['Status'] as String,
    vpcSecurityGroupId: json['VpcSecurityGroupId'] as String,
  );
}
