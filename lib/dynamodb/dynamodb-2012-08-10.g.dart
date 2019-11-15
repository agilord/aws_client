// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamodb-2012-08-10.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeDefinition _$AttributeDefinitionFromJson(Map<String, dynamic> json) {
  return AttributeDefinition(
    attributeName: json['AttributeName'] as String,
    attributeType: json['AttributeType'] as String,
  );
}

Map<String, dynamic> _$AttributeDefinitionToJson(
        AttributeDefinition instance) =>
    <String, dynamic>{
      'AttributeName': instance.attributeName,
      'AttributeType': instance.attributeType,
    };

AttributeValue _$AttributeValueFromJson(Map<String, dynamic> json) {
  return AttributeValue(
    s: json['S'] as String,
    n: json['N'] as String,
    b: const Base64Converter().fromJson(json['B'] as String),
    sS: (json['SS'] as List)?.map((e) => e as String)?.toList(),
    nS: (json['NS'] as List)?.map((e) => e as String)?.toList(),
    bS: const Base64ListConverter().fromJson(json['BS'] as List<String>),
    m: (json['M'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    l: (json['L'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nULL: json['NULL'] as bool,
    bOOL: json['BOOL'] as bool,
  );
}

Map<String, dynamic> _$AttributeValueToJson(AttributeValue instance) =>
    <String, dynamic>{
      'S': instance.s,
      'N': instance.n,
      'B': const Base64Converter().toJson(instance.b),
      'SS': instance.sS,
      'NS': instance.nS,
      'BS': const Base64ListConverter().toJson(instance.bS),
      'M': instance.m,
      'L': instance.l,
      'NULL': instance.nULL,
      'BOOL': instance.bOOL,
    };

AttributeValueUpdate _$AttributeValueUpdateFromJson(Map<String, dynamic> json) {
  return AttributeValueUpdate(
    value: json['Value'] == null
        ? null
        : AttributeValue.fromJson(json['Value'] as Map<String, dynamic>),
    action: json['Action'] as String,
  );
}

Map<String, dynamic> _$AttributeValueUpdateToJson(
        AttributeValueUpdate instance) =>
    <String, dynamic>{
      'Value': instance.value,
      'Action': instance.action,
    };

AutoScalingPolicyDescription _$AutoScalingPolicyDescriptionFromJson(
    Map<String, dynamic> json) {
  return AutoScalingPolicyDescription(
    policyName: json['PolicyName'] as String,
    targetTrackingScalingPolicyConfiguration:
        json['TargetTrackingScalingPolicyConfiguration'] == null
            ? null
            : AutoScalingTargetTrackingScalingPolicyConfigurationDescription
                .fromJson(json['TargetTrackingScalingPolicyConfiguration']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AutoScalingPolicyDescriptionToJson(
        AutoScalingPolicyDescription instance) =>
    <String, dynamic>{
      'PolicyName': instance.policyName,
      'TargetTrackingScalingPolicyConfiguration':
          instance.targetTrackingScalingPolicyConfiguration,
    };

AutoScalingPolicyUpdate _$AutoScalingPolicyUpdateFromJson(
    Map<String, dynamic> json) {
  return AutoScalingPolicyUpdate(
    targetTrackingScalingPolicyConfiguration:
        json['TargetTrackingScalingPolicyConfiguration'] == null
            ? null
            : AutoScalingTargetTrackingScalingPolicyConfigurationUpdate
                .fromJson(json['TargetTrackingScalingPolicyConfiguration']
                    as Map<String, dynamic>),
    policyName: json['PolicyName'] as String,
  );
}

Map<String, dynamic> _$AutoScalingPolicyUpdateToJson(
        AutoScalingPolicyUpdate instance) =>
    <String, dynamic>{
      'TargetTrackingScalingPolicyConfiguration':
          instance.targetTrackingScalingPolicyConfiguration,
      'PolicyName': instance.policyName,
    };

AutoScalingSettingsDescription _$AutoScalingSettingsDescriptionFromJson(
    Map<String, dynamic> json) {
  return AutoScalingSettingsDescription(
    minimumUnits: json['MinimumUnits'] as int,
    maximumUnits: json['MaximumUnits'] as int,
    autoScalingDisabled: json['AutoScalingDisabled'] as bool,
    autoScalingRoleArn: json['AutoScalingRoleArn'] as String,
    scalingPolicies: (json['ScalingPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : AutoScalingPolicyDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AutoScalingSettingsDescriptionToJson(
        AutoScalingSettingsDescription instance) =>
    <String, dynamic>{
      'MinimumUnits': instance.minimumUnits,
      'MaximumUnits': instance.maximumUnits,
      'AutoScalingDisabled': instance.autoScalingDisabled,
      'AutoScalingRoleArn': instance.autoScalingRoleArn,
      'ScalingPolicies': instance.scalingPolicies,
    };

AutoScalingSettingsUpdate _$AutoScalingSettingsUpdateFromJson(
    Map<String, dynamic> json) {
  return AutoScalingSettingsUpdate(
    minimumUnits: json['MinimumUnits'] as int,
    maximumUnits: json['MaximumUnits'] as int,
    autoScalingDisabled: json['AutoScalingDisabled'] as bool,
    autoScalingRoleArn: json['AutoScalingRoleArn'] as String,
    scalingPolicyUpdate: json['ScalingPolicyUpdate'] == null
        ? null
        : AutoScalingPolicyUpdate.fromJson(
            json['ScalingPolicyUpdate'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AutoScalingSettingsUpdateToJson(
        AutoScalingSettingsUpdate instance) =>
    <String, dynamic>{
      'MinimumUnits': instance.minimumUnits,
      'MaximumUnits': instance.maximumUnits,
      'AutoScalingDisabled': instance.autoScalingDisabled,
      'AutoScalingRoleArn': instance.autoScalingRoleArn,
      'ScalingPolicyUpdate': instance.scalingPolicyUpdate,
    };

AutoScalingTargetTrackingScalingPolicyConfigurationDescription
    _$AutoScalingTargetTrackingScalingPolicyConfigurationDescriptionFromJson(
        Map<String, dynamic> json) {
  return AutoScalingTargetTrackingScalingPolicyConfigurationDescription(
    targetValue: (json['TargetValue'] as num)?.toDouble(),
    disableScaleIn: json['DisableScaleIn'] as bool,
    scaleInCooldown: json['ScaleInCooldown'] as int,
    scaleOutCooldown: json['ScaleOutCooldown'] as int,
  );
}

Map<String, dynamic>
    _$AutoScalingTargetTrackingScalingPolicyConfigurationDescriptionToJson(
            AutoScalingTargetTrackingScalingPolicyConfigurationDescription
                instance) =>
        <String, dynamic>{
          'TargetValue': instance.targetValue,
          'DisableScaleIn': instance.disableScaleIn,
          'ScaleInCooldown': instance.scaleInCooldown,
          'ScaleOutCooldown': instance.scaleOutCooldown,
        };

AutoScalingTargetTrackingScalingPolicyConfigurationUpdate
    _$AutoScalingTargetTrackingScalingPolicyConfigurationUpdateFromJson(
        Map<String, dynamic> json) {
  return AutoScalingTargetTrackingScalingPolicyConfigurationUpdate(
    targetValue: (json['TargetValue'] as num)?.toDouble(),
    disableScaleIn: json['DisableScaleIn'] as bool,
    scaleInCooldown: json['ScaleInCooldown'] as int,
    scaleOutCooldown: json['ScaleOutCooldown'] as int,
  );
}

Map<String,
    dynamic> _$AutoScalingTargetTrackingScalingPolicyConfigurationUpdateToJson(
        AutoScalingTargetTrackingScalingPolicyConfigurationUpdate instance) =>
    <String, dynamic>{
      'TargetValue': instance.targetValue,
      'DisableScaleIn': instance.disableScaleIn,
      'ScaleInCooldown': instance.scaleInCooldown,
      'ScaleOutCooldown': instance.scaleOutCooldown,
    };

BackupDescription _$BackupDescriptionFromJson(Map<String, dynamic> json) {
  return BackupDescription(
    backupDetails: json['BackupDetails'] == null
        ? null
        : BackupDetails.fromJson(json['BackupDetails'] as Map<String, dynamic>),
    sourceTableDetails: json['SourceTableDetails'] == null
        ? null
        : SourceTableDetails.fromJson(
            json['SourceTableDetails'] as Map<String, dynamic>),
    sourceTableFeatureDetails: json['SourceTableFeatureDetails'] == null
        ? null
        : SourceTableFeatureDetails.fromJson(
            json['SourceTableFeatureDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BackupDescriptionToJson(BackupDescription instance) =>
    <String, dynamic>{
      'BackupDetails': instance.backupDetails,
      'SourceTableDetails': instance.sourceTableDetails,
      'SourceTableFeatureDetails': instance.sourceTableFeatureDetails,
    };

BackupDetails _$BackupDetailsFromJson(Map<String, dynamic> json) {
  return BackupDetails(
    backupArn: json['BackupArn'] as String,
    backupName: json['BackupName'] as String,
    backupStatus: json['BackupStatus'] as String,
    backupType: json['BackupType'] as String,
    backupCreationDateTime: json['BackupCreationDateTime'] as String,
    backupSizeBytes: json['BackupSizeBytes'] as int,
    backupExpiryDateTime: json['BackupExpiryDateTime'] as String,
  );
}

Map<String, dynamic> _$BackupDetailsToJson(BackupDetails instance) =>
    <String, dynamic>{
      'BackupArn': instance.backupArn,
      'BackupName': instance.backupName,
      'BackupStatus': instance.backupStatus,
      'BackupType': instance.backupType,
      'BackupCreationDateTime': instance.backupCreationDateTime,
      'BackupSizeBytes': instance.backupSizeBytes,
      'BackupExpiryDateTime': instance.backupExpiryDateTime,
    };

BackupSummary _$BackupSummaryFromJson(Map<String, dynamic> json) {
  return BackupSummary(
    tableName: json['TableName'] as String,
    tableId: json['TableId'] as String,
    tableArn: json['TableArn'] as String,
    backupArn: json['BackupArn'] as String,
    backupName: json['BackupName'] as String,
    backupCreationDateTime: json['BackupCreationDateTime'] as String,
    backupExpiryDateTime: json['BackupExpiryDateTime'] as String,
    backupStatus: json['BackupStatus'] as String,
    backupType: json['BackupType'] as String,
    backupSizeBytes: json['BackupSizeBytes'] as int,
  );
}

Map<String, dynamic> _$BackupSummaryToJson(BackupSummary instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'TableId': instance.tableId,
      'TableArn': instance.tableArn,
      'BackupArn': instance.backupArn,
      'BackupName': instance.backupName,
      'BackupCreationDateTime': instance.backupCreationDateTime,
      'BackupExpiryDateTime': instance.backupExpiryDateTime,
      'BackupStatus': instance.backupStatus,
      'BackupType': instance.backupType,
      'BackupSizeBytes': instance.backupSizeBytes,
    };

BatchGetItemInput _$BatchGetItemInputFromJson(Map<String, dynamic> json) {
  return BatchGetItemInput(
    requestItems: (json['RequestItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : KeysAndAttributes.fromJson(e as Map<String, dynamic>)),
    ),
    returnConsumedCapacity: json['ReturnConsumedCapacity'] as String,
  );
}

Map<String, dynamic> _$BatchGetItemInputToJson(BatchGetItemInput instance) =>
    <String, dynamic>{
      'RequestItems': instance.requestItems,
      'ReturnConsumedCapacity': instance.returnConsumedCapacity,
    };

BatchGetItemOutput _$BatchGetItemOutputFromJson(Map<String, dynamic> json) {
  return BatchGetItemOutput(
    responses: (json['Responses'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => (e as Map<String, dynamic>)?.map(
                    (k, e) => MapEntry(
                        k,
                        e == null
                            ? null
                            : AttributeValue.fromJson(
                                e as Map<String, dynamic>)),
                  ))
              ?.toList()),
    ),
    unprocessedKeys: (json['UnprocessedKeys'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : KeysAndAttributes.fromJson(e as Map<String, dynamic>)),
    ),
    consumedCapacity: (json['ConsumedCapacity'] as List)
        ?.map((e) => e == null
            ? null
            : ConsumedCapacity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchGetItemOutputToJson(BatchGetItemOutput instance) =>
    <String, dynamic>{
      'Responses': instance.responses,
      'UnprocessedKeys': instance.unprocessedKeys,
      'ConsumedCapacity': instance.consumedCapacity,
    };

BatchWriteItemInput _$BatchWriteItemInputFromJson(Map<String, dynamic> json) {
  return BatchWriteItemInput(
    requestItems: (json['RequestItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : WriteRequest.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
    returnConsumedCapacity: json['ReturnConsumedCapacity'] as String,
    returnItemCollectionMetrics: json['ReturnItemCollectionMetrics'] as String,
  );
}

Map<String, dynamic> _$BatchWriteItemInputToJson(
        BatchWriteItemInput instance) =>
    <String, dynamic>{
      'RequestItems': instance.requestItems,
      'ReturnConsumedCapacity': instance.returnConsumedCapacity,
      'ReturnItemCollectionMetrics': instance.returnItemCollectionMetrics,
    };

BatchWriteItemOutput _$BatchWriteItemOutputFromJson(Map<String, dynamic> json) {
  return BatchWriteItemOutput(
    unprocessedItems: (json['UnprocessedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : WriteRequest.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
    itemCollectionMetrics:
        (json['ItemCollectionMetrics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : ItemCollectionMetrics.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
    consumedCapacity: (json['ConsumedCapacity'] as List)
        ?.map((e) => e == null
            ? null
            : ConsumedCapacity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BatchWriteItemOutputToJson(
        BatchWriteItemOutput instance) =>
    <String, dynamic>{
      'UnprocessedItems': instance.unprocessedItems,
      'ItemCollectionMetrics': instance.itemCollectionMetrics,
      'ConsumedCapacity': instance.consumedCapacity,
    };

BillingModeSummary _$BillingModeSummaryFromJson(Map<String, dynamic> json) {
  return BillingModeSummary(
    billingMode: json['BillingMode'] as String,
    lastUpdateToPayPerRequestDateTime:
        json['LastUpdateToPayPerRequestDateTime'] as String,
  );
}

Map<String, dynamic> _$BillingModeSummaryToJson(BillingModeSummary instance) =>
    <String, dynamic>{
      'BillingMode': instance.billingMode,
      'LastUpdateToPayPerRequestDateTime':
          instance.lastUpdateToPayPerRequestDateTime,
    };

Capacity _$CapacityFromJson(Map<String, dynamic> json) {
  return Capacity(
    readCapacityUnits: (json['ReadCapacityUnits'] as num)?.toDouble(),
    writeCapacityUnits: (json['WriteCapacityUnits'] as num)?.toDouble(),
    capacityUnits: (json['CapacityUnits'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CapacityToJson(Capacity instance) => <String, dynamic>{
      'ReadCapacityUnits': instance.readCapacityUnits,
      'WriteCapacityUnits': instance.writeCapacityUnits,
      'CapacityUnits': instance.capacityUnits,
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return Condition(
    comparisonOperator: json['ComparisonOperator'] as String,
    attributeValueList: (json['AttributeValueList'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'ComparisonOperator': instance.comparisonOperator,
      'AttributeValueList': instance.attributeValueList,
    };

ConditionCheck _$ConditionCheckFromJson(Map<String, dynamic> json) {
  return ConditionCheck(
    key: (json['Key'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    tableName: json['TableName'] as String,
    conditionExpression: json['ConditionExpression'] as String,
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    expressionAttributeValues:
        (json['ExpressionAttributeValues'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    returnValuesOnConditionCheckFailure:
        json['ReturnValuesOnConditionCheckFailure'] as String,
  );
}

Map<String, dynamic> _$ConditionCheckToJson(ConditionCheck instance) =>
    <String, dynamic>{
      'Key': instance.key,
      'TableName': instance.tableName,
      'ConditionExpression': instance.conditionExpression,
      'ExpressionAttributeNames': instance.expressionAttributeNames,
      'ExpressionAttributeValues': instance.expressionAttributeValues,
      'ReturnValuesOnConditionCheckFailure':
          instance.returnValuesOnConditionCheckFailure,
    };

ConsumedCapacity _$ConsumedCapacityFromJson(Map<String, dynamic> json) {
  return ConsumedCapacity(
    tableName: json['TableName'] as String,
    capacityUnits: (json['CapacityUnits'] as num)?.toDouble(),
    readCapacityUnits: (json['ReadCapacityUnits'] as num)?.toDouble(),
    writeCapacityUnits: (json['WriteCapacityUnits'] as num)?.toDouble(),
    table: json['Table'] == null
        ? null
        : Capacity.fromJson(json['Table'] as Map<String, dynamic>),
    localSecondaryIndexes:
        (json['LocalSecondaryIndexes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Capacity.fromJson(e as Map<String, dynamic>)),
    ),
    globalSecondaryIndexes:
        (json['GlobalSecondaryIndexes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Capacity.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$ConsumedCapacityToJson(ConsumedCapacity instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'CapacityUnits': instance.capacityUnits,
      'ReadCapacityUnits': instance.readCapacityUnits,
      'WriteCapacityUnits': instance.writeCapacityUnits,
      'Table': instance.table,
      'LocalSecondaryIndexes': instance.localSecondaryIndexes,
      'GlobalSecondaryIndexes': instance.globalSecondaryIndexes,
    };

ContinuousBackupsDescription _$ContinuousBackupsDescriptionFromJson(
    Map<String, dynamic> json) {
  return ContinuousBackupsDescription(
    continuousBackupsStatus: json['ContinuousBackupsStatus'] as String,
    pointInTimeRecoveryDescription:
        json['PointInTimeRecoveryDescription'] == null
            ? null
            : PointInTimeRecoveryDescription.fromJson(
                json['PointInTimeRecoveryDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContinuousBackupsDescriptionToJson(
        ContinuousBackupsDescription instance) =>
    <String, dynamic>{
      'ContinuousBackupsStatus': instance.continuousBackupsStatus,
      'PointInTimeRecoveryDescription': instance.pointInTimeRecoveryDescription,
    };

CreateBackupInput _$CreateBackupInputFromJson(Map<String, dynamic> json) {
  return CreateBackupInput(
    tableName: json['TableName'] as String,
    backupName: json['BackupName'] as String,
  );
}

Map<String, dynamic> _$CreateBackupInputToJson(CreateBackupInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'BackupName': instance.backupName,
    };

CreateBackupOutput _$CreateBackupOutputFromJson(Map<String, dynamic> json) {
  return CreateBackupOutput(
    backupDetails: json['BackupDetails'] == null
        ? null
        : BackupDetails.fromJson(json['BackupDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateBackupOutputToJson(CreateBackupOutput instance) =>
    <String, dynamic>{
      'BackupDetails': instance.backupDetails,
    };

CreateGlobalSecondaryIndexAction _$CreateGlobalSecondaryIndexActionFromJson(
    Map<String, dynamic> json) {
  return CreateGlobalSecondaryIndexAction(
    indexName: json['IndexName'] as String,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projection: json['Projection'] == null
        ? null
        : Projection.fromJson(json['Projection'] as Map<String, dynamic>),
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : ProvisionedThroughput.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateGlobalSecondaryIndexActionToJson(
        CreateGlobalSecondaryIndexAction instance) =>
    <String, dynamic>{
      'IndexName': instance.indexName,
      'KeySchema': instance.keySchema,
      'Projection': instance.projection,
      'ProvisionedThroughput': instance.provisionedThroughput,
    };

CreateGlobalTableInput _$CreateGlobalTableInputFromJson(
    Map<String, dynamic> json) {
  return CreateGlobalTableInput(
    globalTableName: json['GlobalTableName'] as String,
    replicationGroup: (json['ReplicationGroup'] as List)
        ?.map((e) =>
            e == null ? null : Replica.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreateGlobalTableInputToJson(
        CreateGlobalTableInput instance) =>
    <String, dynamic>{
      'GlobalTableName': instance.globalTableName,
      'ReplicationGroup': instance.replicationGroup,
    };

CreateGlobalTableOutput _$CreateGlobalTableOutputFromJson(
    Map<String, dynamic> json) {
  return CreateGlobalTableOutput(
    globalTableDescription: json['GlobalTableDescription'] == null
        ? null
        : GlobalTableDescription.fromJson(
            json['GlobalTableDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateGlobalTableOutputToJson(
        CreateGlobalTableOutput instance) =>
    <String, dynamic>{
      'GlobalTableDescription': instance.globalTableDescription,
    };

CreateReplicaAction _$CreateReplicaActionFromJson(Map<String, dynamic> json) {
  return CreateReplicaAction(
    regionName: json['RegionName'] as String,
  );
}

Map<String, dynamic> _$CreateReplicaActionToJson(
        CreateReplicaAction instance) =>
    <String, dynamic>{
      'RegionName': instance.regionName,
    };

CreateTableInput _$CreateTableInputFromJson(Map<String, dynamic> json) {
  return CreateTableInput(
    attributeDefinitions: (json['AttributeDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tableName: json['TableName'] as String,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    localSecondaryIndexes: (json['LocalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : LocalSecondaryIndex.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : GlobalSecondaryIndex.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    billingMode: json['BillingMode'] as String,
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : ProvisionedThroughput.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
    streamSpecification: json['StreamSpecification'] == null
        ? null
        : StreamSpecification.fromJson(
            json['StreamSpecification'] as Map<String, dynamic>),
    sSESpecification: json['SSESpecification'] == null
        ? null
        : SSESpecification.fromJson(
            json['SSESpecification'] as Map<String, dynamic>),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreateTableInputToJson(CreateTableInput instance) =>
    <String, dynamic>{
      'AttributeDefinitions': instance.attributeDefinitions,
      'TableName': instance.tableName,
      'KeySchema': instance.keySchema,
      'LocalSecondaryIndexes': instance.localSecondaryIndexes,
      'GlobalSecondaryIndexes': instance.globalSecondaryIndexes,
      'BillingMode': instance.billingMode,
      'ProvisionedThroughput': instance.provisionedThroughput,
      'StreamSpecification': instance.streamSpecification,
      'SSESpecification': instance.sSESpecification,
      'Tags': instance.tags,
    };

CreateTableOutput _$CreateTableOutputFromJson(Map<String, dynamic> json) {
  return CreateTableOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateTableOutputToJson(CreateTableOutput instance) =>
    <String, dynamic>{
      'TableDescription': instance.tableDescription,
    };

Delete _$DeleteFromJson(Map<String, dynamic> json) {
  return Delete(
    key: (json['Key'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    tableName: json['TableName'] as String,
    conditionExpression: json['ConditionExpression'] as String,
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    expressionAttributeValues:
        (json['ExpressionAttributeValues'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    returnValuesOnConditionCheckFailure:
        json['ReturnValuesOnConditionCheckFailure'] as String,
  );
}

Map<String, dynamic> _$DeleteToJson(Delete instance) => <String, dynamic>{
      'Key': instance.key,
      'TableName': instance.tableName,
      'ConditionExpression': instance.conditionExpression,
      'ExpressionAttributeNames': instance.expressionAttributeNames,
      'ExpressionAttributeValues': instance.expressionAttributeValues,
      'ReturnValuesOnConditionCheckFailure':
          instance.returnValuesOnConditionCheckFailure,
    };

DeleteBackupInput _$DeleteBackupInputFromJson(Map<String, dynamic> json) {
  return DeleteBackupInput(
    backupArn: json['BackupArn'] as String,
  );
}

Map<String, dynamic> _$DeleteBackupInputToJson(DeleteBackupInput instance) =>
    <String, dynamic>{
      'BackupArn': instance.backupArn,
    };

DeleteBackupOutput _$DeleteBackupOutputFromJson(Map<String, dynamic> json) {
  return DeleteBackupOutput(
    backupDescription: json['BackupDescription'] == null
        ? null
        : BackupDescription.fromJson(
            json['BackupDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteBackupOutputToJson(DeleteBackupOutput instance) =>
    <String, dynamic>{
      'BackupDescription': instance.backupDescription,
    };

DeleteGlobalSecondaryIndexAction _$DeleteGlobalSecondaryIndexActionFromJson(
    Map<String, dynamic> json) {
  return DeleteGlobalSecondaryIndexAction(
    indexName: json['IndexName'] as String,
  );
}

Map<String, dynamic> _$DeleteGlobalSecondaryIndexActionToJson(
        DeleteGlobalSecondaryIndexAction instance) =>
    <String, dynamic>{
      'IndexName': instance.indexName,
    };

DeleteItemInput _$DeleteItemInputFromJson(Map<String, dynamic> json) {
  return DeleteItemInput(
    tableName: json['TableName'] as String,
    key: (json['Key'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    expected: (json['Expected'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ExpectedAttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    conditionalOperator: json['ConditionalOperator'] as String,
    returnValues: json['ReturnValues'] as String,
    returnConsumedCapacity: json['ReturnConsumedCapacity'] as String,
    returnItemCollectionMetrics: json['ReturnItemCollectionMetrics'] as String,
    conditionExpression: json['ConditionExpression'] as String,
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    expressionAttributeValues:
        (json['ExpressionAttributeValues'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$DeleteItemInputToJson(DeleteItemInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'Key': instance.key,
      'Expected': instance.expected,
      'ConditionalOperator': instance.conditionalOperator,
      'ReturnValues': instance.returnValues,
      'ReturnConsumedCapacity': instance.returnConsumedCapacity,
      'ReturnItemCollectionMetrics': instance.returnItemCollectionMetrics,
      'ConditionExpression': instance.conditionExpression,
      'ExpressionAttributeNames': instance.expressionAttributeNames,
      'ExpressionAttributeValues': instance.expressionAttributeValues,
    };

DeleteItemOutput _$DeleteItemOutputFromJson(Map<String, dynamic> json) {
  return DeleteItemOutput(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    consumedCapacity: json['ConsumedCapacity'] == null
        ? null
        : ConsumedCapacity.fromJson(
            json['ConsumedCapacity'] as Map<String, dynamic>),
    itemCollectionMetrics: json['ItemCollectionMetrics'] == null
        ? null
        : ItemCollectionMetrics.fromJson(
            json['ItemCollectionMetrics'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteItemOutputToJson(DeleteItemOutput instance) =>
    <String, dynamic>{
      'Attributes': instance.attributes,
      'ConsumedCapacity': instance.consumedCapacity,
      'ItemCollectionMetrics': instance.itemCollectionMetrics,
    };

DeleteReplicaAction _$DeleteReplicaActionFromJson(Map<String, dynamic> json) {
  return DeleteReplicaAction(
    regionName: json['RegionName'] as String,
  );
}

Map<String, dynamic> _$DeleteReplicaActionToJson(
        DeleteReplicaAction instance) =>
    <String, dynamic>{
      'RegionName': instance.regionName,
    };

DeleteRequest _$DeleteRequestFromJson(Map<String, dynamic> json) {
  return DeleteRequest(
    key: (json['Key'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$DeleteRequestToJson(DeleteRequest instance) =>
    <String, dynamic>{
      'Key': instance.key,
    };

DeleteTableInput _$DeleteTableInputFromJson(Map<String, dynamic> json) {
  return DeleteTableInput(
    tableName: json['TableName'] as String,
  );
}

Map<String, dynamic> _$DeleteTableInputToJson(DeleteTableInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
    };

DeleteTableOutput _$DeleteTableOutputFromJson(Map<String, dynamic> json) {
  return DeleteTableOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteTableOutputToJson(DeleteTableOutput instance) =>
    <String, dynamic>{
      'TableDescription': instance.tableDescription,
    };

DescribeBackupInput _$DescribeBackupInputFromJson(Map<String, dynamic> json) {
  return DescribeBackupInput(
    backupArn: json['BackupArn'] as String,
  );
}

Map<String, dynamic> _$DescribeBackupInputToJson(
        DescribeBackupInput instance) =>
    <String, dynamic>{
      'BackupArn': instance.backupArn,
    };

DescribeBackupOutput _$DescribeBackupOutputFromJson(Map<String, dynamic> json) {
  return DescribeBackupOutput(
    backupDescription: json['BackupDescription'] == null
        ? null
        : BackupDescription.fromJson(
            json['BackupDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeBackupOutputToJson(
        DescribeBackupOutput instance) =>
    <String, dynamic>{
      'BackupDescription': instance.backupDescription,
    };

DescribeContinuousBackupsInput _$DescribeContinuousBackupsInputFromJson(
    Map<String, dynamic> json) {
  return DescribeContinuousBackupsInput(
    tableName: json['TableName'] as String,
  );
}

Map<String, dynamic> _$DescribeContinuousBackupsInputToJson(
        DescribeContinuousBackupsInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
    };

DescribeContinuousBackupsOutput _$DescribeContinuousBackupsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeContinuousBackupsOutput(
    continuousBackupsDescription: json['ContinuousBackupsDescription'] == null
        ? null
        : ContinuousBackupsDescription.fromJson(
            json['ContinuousBackupsDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeContinuousBackupsOutputToJson(
        DescribeContinuousBackupsOutput instance) =>
    <String, dynamic>{
      'ContinuousBackupsDescription': instance.continuousBackupsDescription,
    };

DescribeEndpointsResponse _$DescribeEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointsResponse(
    endpoints: (json['Endpoints'] as List)
        ?.map((e) =>
            e == null ? null : Endpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeEndpointsResponseToJson(
        DescribeEndpointsResponse instance) =>
    <String, dynamic>{
      'Endpoints': instance.endpoints,
    };

DescribeGlobalTableInput _$DescribeGlobalTableInputFromJson(
    Map<String, dynamic> json) {
  return DescribeGlobalTableInput(
    globalTableName: json['GlobalTableName'] as String,
  );
}

Map<String, dynamic> _$DescribeGlobalTableInputToJson(
        DescribeGlobalTableInput instance) =>
    <String, dynamic>{
      'GlobalTableName': instance.globalTableName,
    };

DescribeGlobalTableOutput _$DescribeGlobalTableOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeGlobalTableOutput(
    globalTableDescription: json['GlobalTableDescription'] == null
        ? null
        : GlobalTableDescription.fromJson(
            json['GlobalTableDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeGlobalTableOutputToJson(
        DescribeGlobalTableOutput instance) =>
    <String, dynamic>{
      'GlobalTableDescription': instance.globalTableDescription,
    };

DescribeGlobalTableSettingsInput _$DescribeGlobalTableSettingsInputFromJson(
    Map<String, dynamic> json) {
  return DescribeGlobalTableSettingsInput(
    globalTableName: json['GlobalTableName'] as String,
  );
}

Map<String, dynamic> _$DescribeGlobalTableSettingsInputToJson(
        DescribeGlobalTableSettingsInput instance) =>
    <String, dynamic>{
      'GlobalTableName': instance.globalTableName,
    };

DescribeGlobalTableSettingsOutput _$DescribeGlobalTableSettingsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeGlobalTableSettingsOutput(
    globalTableName: json['GlobalTableName'] as String,
    replicaSettings: (json['ReplicaSettings'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicaSettingsDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DescribeGlobalTableSettingsOutputToJson(
        DescribeGlobalTableSettingsOutput instance) =>
    <String, dynamic>{
      'GlobalTableName': instance.globalTableName,
      'ReplicaSettings': instance.replicaSettings,
    };

DescribeLimitsOutput _$DescribeLimitsOutputFromJson(Map<String, dynamic> json) {
  return DescribeLimitsOutput(
    accountMaxReadCapacityUnits: json['AccountMaxReadCapacityUnits'] as int,
    accountMaxWriteCapacityUnits: json['AccountMaxWriteCapacityUnits'] as int,
    tableMaxReadCapacityUnits: json['TableMaxReadCapacityUnits'] as int,
    tableMaxWriteCapacityUnits: json['TableMaxWriteCapacityUnits'] as int,
  );
}

Map<String, dynamic> _$DescribeLimitsOutputToJson(
        DescribeLimitsOutput instance) =>
    <String, dynamic>{
      'AccountMaxReadCapacityUnits': instance.accountMaxReadCapacityUnits,
      'AccountMaxWriteCapacityUnits': instance.accountMaxWriteCapacityUnits,
      'TableMaxReadCapacityUnits': instance.tableMaxReadCapacityUnits,
      'TableMaxWriteCapacityUnits': instance.tableMaxWriteCapacityUnits,
    };

DescribeTableInput _$DescribeTableInputFromJson(Map<String, dynamic> json) {
  return DescribeTableInput(
    tableName: json['TableName'] as String,
  );
}

Map<String, dynamic> _$DescribeTableInputToJson(DescribeTableInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
    };

DescribeTableOutput _$DescribeTableOutputFromJson(Map<String, dynamic> json) {
  return DescribeTableOutput(
    table: json['Table'] == null
        ? null
        : TableDescription.fromJson(json['Table'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeTableOutputToJson(
        DescribeTableOutput instance) =>
    <String, dynamic>{
      'Table': instance.table,
    };

DescribeTimeToLiveInput _$DescribeTimeToLiveInputFromJson(
    Map<String, dynamic> json) {
  return DescribeTimeToLiveInput(
    tableName: json['TableName'] as String,
  );
}

Map<String, dynamic> _$DescribeTimeToLiveInputToJson(
        DescribeTimeToLiveInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
    };

DescribeTimeToLiveOutput _$DescribeTimeToLiveOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeTimeToLiveOutput(
    timeToLiveDescription: json['TimeToLiveDescription'] == null
        ? null
        : TimeToLiveDescription.fromJson(
            json['TimeToLiveDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeTimeToLiveOutputToJson(
        DescribeTimeToLiveOutput instance) =>
    <String, dynamic>{
      'TimeToLiveDescription': instance.timeToLiveDescription,
    };

Endpoint _$EndpointFromJson(Map<String, dynamic> json) {
  return Endpoint(
    address: json['Address'] as String,
    cachePeriodInMinutes: json['CachePeriodInMinutes'] as int,
  );
}

Map<String, dynamic> _$EndpointToJson(Endpoint instance) => <String, dynamic>{
      'Address': instance.address,
      'CachePeriodInMinutes': instance.cachePeriodInMinutes,
    };

ExpectedAttributeValue _$ExpectedAttributeValueFromJson(
    Map<String, dynamic> json) {
  return ExpectedAttributeValue(
    value: json['Value'] == null
        ? null
        : AttributeValue.fromJson(json['Value'] as Map<String, dynamic>),
    exists: json['Exists'] as bool,
    comparisonOperator: json['ComparisonOperator'] as String,
    attributeValueList: (json['AttributeValueList'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ExpectedAttributeValueToJson(
        ExpectedAttributeValue instance) =>
    <String, dynamic>{
      'Value': instance.value,
      'Exists': instance.exists,
      'ComparisonOperator': instance.comparisonOperator,
      'AttributeValueList': instance.attributeValueList,
    };

Get _$GetFromJson(Map<String, dynamic> json) {
  return Get(
    key: (json['Key'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    tableName: json['TableName'] as String,
    projectionExpression: json['ProjectionExpression'] as String,
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$GetToJson(Get instance) => <String, dynamic>{
      'Key': instance.key,
      'TableName': instance.tableName,
      'ProjectionExpression': instance.projectionExpression,
      'ExpressionAttributeNames': instance.expressionAttributeNames,
    };

GetItemInput _$GetItemInputFromJson(Map<String, dynamic> json) {
  return GetItemInput(
    tableName: json['TableName'] as String,
    key: (json['Key'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    attributesToGet:
        (json['AttributesToGet'] as List)?.map((e) => e as String)?.toList(),
    consistentRead: json['ConsistentRead'] as bool,
    returnConsumedCapacity: json['ReturnConsumedCapacity'] as String,
    projectionExpression: json['ProjectionExpression'] as String,
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$GetItemInputToJson(GetItemInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'Key': instance.key,
      'AttributesToGet': instance.attributesToGet,
      'ConsistentRead': instance.consistentRead,
      'ReturnConsumedCapacity': instance.returnConsumedCapacity,
      'ProjectionExpression': instance.projectionExpression,
      'ExpressionAttributeNames': instance.expressionAttributeNames,
    };

GetItemOutput _$GetItemOutputFromJson(Map<String, dynamic> json) {
  return GetItemOutput(
    item: (json['Item'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    consumedCapacity: json['ConsumedCapacity'] == null
        ? null
        : ConsumedCapacity.fromJson(
            json['ConsumedCapacity'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetItemOutputToJson(GetItemOutput instance) =>
    <String, dynamic>{
      'Item': instance.item,
      'ConsumedCapacity': instance.consumedCapacity,
    };

GlobalSecondaryIndex _$GlobalSecondaryIndexFromJson(Map<String, dynamic> json) {
  return GlobalSecondaryIndex(
    indexName: json['IndexName'] as String,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projection: json['Projection'] == null
        ? null
        : Projection.fromJson(json['Projection'] as Map<String, dynamic>),
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : ProvisionedThroughput.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GlobalSecondaryIndexToJson(
        GlobalSecondaryIndex instance) =>
    <String, dynamic>{
      'IndexName': instance.indexName,
      'KeySchema': instance.keySchema,
      'Projection': instance.projection,
      'ProvisionedThroughput': instance.provisionedThroughput,
    };

GlobalSecondaryIndexDescription _$GlobalSecondaryIndexDescriptionFromJson(
    Map<String, dynamic> json) {
  return GlobalSecondaryIndexDescription(
    indexName: json['IndexName'] as String,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projection: json['Projection'] == null
        ? null
        : Projection.fromJson(json['Projection'] as Map<String, dynamic>),
    indexStatus: json['IndexStatus'] as String,
    backfilling: json['Backfilling'] as bool,
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : ProvisionedThroughputDescription.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
    indexSizeBytes: json['IndexSizeBytes'] as int,
    itemCount: json['ItemCount'] as int,
    indexArn: json['IndexArn'] as String,
  );
}

Map<String, dynamic> _$GlobalSecondaryIndexDescriptionToJson(
        GlobalSecondaryIndexDescription instance) =>
    <String, dynamic>{
      'IndexName': instance.indexName,
      'KeySchema': instance.keySchema,
      'Projection': instance.projection,
      'IndexStatus': instance.indexStatus,
      'Backfilling': instance.backfilling,
      'ProvisionedThroughput': instance.provisionedThroughput,
      'IndexSizeBytes': instance.indexSizeBytes,
      'ItemCount': instance.itemCount,
      'IndexArn': instance.indexArn,
    };

GlobalSecondaryIndexInfo _$GlobalSecondaryIndexInfoFromJson(
    Map<String, dynamic> json) {
  return GlobalSecondaryIndexInfo(
    indexName: json['IndexName'] as String,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projection: json['Projection'] == null
        ? null
        : Projection.fromJson(json['Projection'] as Map<String, dynamic>),
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : ProvisionedThroughput.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GlobalSecondaryIndexInfoToJson(
        GlobalSecondaryIndexInfo instance) =>
    <String, dynamic>{
      'IndexName': instance.indexName,
      'KeySchema': instance.keySchema,
      'Projection': instance.projection,
      'ProvisionedThroughput': instance.provisionedThroughput,
    };

GlobalSecondaryIndexUpdate _$GlobalSecondaryIndexUpdateFromJson(
    Map<String, dynamic> json) {
  return GlobalSecondaryIndexUpdate(
    update: json['Update'] == null
        ? null
        : UpdateGlobalSecondaryIndexAction.fromJson(
            json['Update'] as Map<String, dynamic>),
    create: json['Create'] == null
        ? null
        : CreateGlobalSecondaryIndexAction.fromJson(
            json['Create'] as Map<String, dynamic>),
    delete: json['Delete'] == null
        ? null
        : DeleteGlobalSecondaryIndexAction.fromJson(
            json['Delete'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GlobalSecondaryIndexUpdateToJson(
        GlobalSecondaryIndexUpdate instance) =>
    <String, dynamic>{
      'Update': instance.update,
      'Create': instance.create,
      'Delete': instance.delete,
    };

GlobalTable _$GlobalTableFromJson(Map<String, dynamic> json) {
  return GlobalTable(
    globalTableName: json['GlobalTableName'] as String,
    replicationGroup: (json['ReplicationGroup'] as List)
        ?.map((e) =>
            e == null ? null : Replica.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GlobalTableToJson(GlobalTable instance) =>
    <String, dynamic>{
      'GlobalTableName': instance.globalTableName,
      'ReplicationGroup': instance.replicationGroup,
    };

GlobalTableDescription _$GlobalTableDescriptionFromJson(
    Map<String, dynamic> json) {
  return GlobalTableDescription(
    replicationGroup: (json['ReplicationGroup'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicaDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    globalTableArn: json['GlobalTableArn'] as String,
    creationDateTime: json['CreationDateTime'] as String,
    globalTableStatus: json['GlobalTableStatus'] as String,
    globalTableName: json['GlobalTableName'] as String,
  );
}

Map<String, dynamic> _$GlobalTableDescriptionToJson(
        GlobalTableDescription instance) =>
    <String, dynamic>{
      'ReplicationGroup': instance.replicationGroup,
      'GlobalTableArn': instance.globalTableArn,
      'CreationDateTime': instance.creationDateTime,
      'GlobalTableStatus': instance.globalTableStatus,
      'GlobalTableName': instance.globalTableName,
    };

GlobalTableGlobalSecondaryIndexSettingsUpdate
    _$GlobalTableGlobalSecondaryIndexSettingsUpdateFromJson(
        Map<String, dynamic> json) {
  return GlobalTableGlobalSecondaryIndexSettingsUpdate(
    indexName: json['IndexName'] as String,
    provisionedWriteCapacityUnits: json['ProvisionedWriteCapacityUnits'] as int,
    provisionedWriteCapacityAutoScalingSettingsUpdate:
        json['ProvisionedWriteCapacityAutoScalingSettingsUpdate'] == null
            ? null
            : AutoScalingSettingsUpdate.fromJson(
                json['ProvisionedWriteCapacityAutoScalingSettingsUpdate']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GlobalTableGlobalSecondaryIndexSettingsUpdateToJson(
        GlobalTableGlobalSecondaryIndexSettingsUpdate instance) =>
    <String, dynamic>{
      'IndexName': instance.indexName,
      'ProvisionedWriteCapacityUnits': instance.provisionedWriteCapacityUnits,
      'ProvisionedWriteCapacityAutoScalingSettingsUpdate':
          instance.provisionedWriteCapacityAutoScalingSettingsUpdate,
    };

ItemCollectionMetrics _$ItemCollectionMetricsFromJson(
    Map<String, dynamic> json) {
  return ItemCollectionMetrics(
    itemCollectionKey: (json['ItemCollectionKey'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    sizeEstimateRangeGB: (json['SizeEstimateRangeGB'] as List)
        ?.map((e) => (e as num)?.toDouble())
        ?.toList(),
  );
}

Map<String, dynamic> _$ItemCollectionMetricsToJson(
        ItemCollectionMetrics instance) =>
    <String, dynamic>{
      'ItemCollectionKey': instance.itemCollectionKey,
      'SizeEstimateRangeGB': instance.sizeEstimateRangeGB,
    };

ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) {
  return ItemResponse(
    item: (json['Item'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$ItemResponseToJson(ItemResponse instance) =>
    <String, dynamic>{
      'Item': instance.item,
    };

KeySchemaElement _$KeySchemaElementFromJson(Map<String, dynamic> json) {
  return KeySchemaElement(
    attributeName: json['AttributeName'] as String,
    keyType: json['KeyType'] as String,
  );
}

Map<String, dynamic> _$KeySchemaElementToJson(KeySchemaElement instance) =>
    <String, dynamic>{
      'AttributeName': instance.attributeName,
      'KeyType': instance.keyType,
    };

KeysAndAttributes _$KeysAndAttributesFromJson(Map<String, dynamic> json) {
  return KeysAndAttributes(
    keys: (json['Keys'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(
                  k,
                  e == null
                      ? null
                      : AttributeValue.fromJson(e as Map<String, dynamic>)),
            ))
        ?.toList(),
    attributesToGet:
        (json['AttributesToGet'] as List)?.map((e) => e as String)?.toList(),
    consistentRead: json['ConsistentRead'] as bool,
    projectionExpression: json['ProjectionExpression'] as String,
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$KeysAndAttributesToJson(KeysAndAttributes instance) =>
    <String, dynamic>{
      'Keys': instance.keys,
      'AttributesToGet': instance.attributesToGet,
      'ConsistentRead': instance.consistentRead,
      'ProjectionExpression': instance.projectionExpression,
      'ExpressionAttributeNames': instance.expressionAttributeNames,
    };

ListBackupsInput _$ListBackupsInputFromJson(Map<String, dynamic> json) {
  return ListBackupsInput(
    tableName: json['TableName'] as String,
    limit: json['Limit'] as int,
    timeRangeLowerBound: json['TimeRangeLowerBound'] as String,
    timeRangeUpperBound: json['TimeRangeUpperBound'] as String,
    exclusiveStartBackupArn: json['ExclusiveStartBackupArn'] as String,
    backupType: json['BackupType'] as String,
  );
}

Map<String, dynamic> _$ListBackupsInputToJson(ListBackupsInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'Limit': instance.limit,
      'TimeRangeLowerBound': instance.timeRangeLowerBound,
      'TimeRangeUpperBound': instance.timeRangeUpperBound,
      'ExclusiveStartBackupArn': instance.exclusiveStartBackupArn,
      'BackupType': instance.backupType,
    };

ListBackupsOutput _$ListBackupsOutputFromJson(Map<String, dynamic> json) {
  return ListBackupsOutput(
    backupSummaries: (json['BackupSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : BackupSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastEvaluatedBackupArn: json['LastEvaluatedBackupArn'] as String,
  );
}

Map<String, dynamic> _$ListBackupsOutputToJson(ListBackupsOutput instance) =>
    <String, dynamic>{
      'BackupSummaries': instance.backupSummaries,
      'LastEvaluatedBackupArn': instance.lastEvaluatedBackupArn,
    };

ListGlobalTablesInput _$ListGlobalTablesInputFromJson(
    Map<String, dynamic> json) {
  return ListGlobalTablesInput(
    exclusiveStartGlobalTableName:
        json['ExclusiveStartGlobalTableName'] as String,
    limit: json['Limit'] as int,
    regionName: json['RegionName'] as String,
  );
}

Map<String, dynamic> _$ListGlobalTablesInputToJson(
        ListGlobalTablesInput instance) =>
    <String, dynamic>{
      'ExclusiveStartGlobalTableName': instance.exclusiveStartGlobalTableName,
      'Limit': instance.limit,
      'RegionName': instance.regionName,
    };

ListGlobalTablesOutput _$ListGlobalTablesOutputFromJson(
    Map<String, dynamic> json) {
  return ListGlobalTablesOutput(
    globalTables: (json['GlobalTables'] as List)
        ?.map((e) =>
            e == null ? null : GlobalTable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lastEvaluatedGlobalTableName:
        json['LastEvaluatedGlobalTableName'] as String,
  );
}

Map<String, dynamic> _$ListGlobalTablesOutputToJson(
        ListGlobalTablesOutput instance) =>
    <String, dynamic>{
      'GlobalTables': instance.globalTables,
      'LastEvaluatedGlobalTableName': instance.lastEvaluatedGlobalTableName,
    };

ListTablesInput _$ListTablesInputFromJson(Map<String, dynamic> json) {
  return ListTablesInput(
    exclusiveStartTableName: json['ExclusiveStartTableName'] as String,
    limit: json['Limit'] as int,
  );
}

Map<String, dynamic> _$ListTablesInputToJson(ListTablesInput instance) =>
    <String, dynamic>{
      'ExclusiveStartTableName': instance.exclusiveStartTableName,
      'Limit': instance.limit,
    };

ListTablesOutput _$ListTablesOutputFromJson(Map<String, dynamic> json) {
  return ListTablesOutput(
    tableNames: (json['TableNames'] as List)?.map((e) => e as String)?.toList(),
    lastEvaluatedTableName: json['LastEvaluatedTableName'] as String,
  );
}

Map<String, dynamic> _$ListTablesOutputToJson(ListTablesOutput instance) =>
    <String, dynamic>{
      'TableNames': instance.tableNames,
      'LastEvaluatedTableName': instance.lastEvaluatedTableName,
    };

ListTagsOfResourceInput _$ListTagsOfResourceInputFromJson(
    Map<String, dynamic> json) {
  return ListTagsOfResourceInput(
    resourceArn: json['ResourceArn'] as String,
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListTagsOfResourceInputToJson(
        ListTagsOfResourceInput instance) =>
    <String, dynamic>{
      'ResourceArn': instance.resourceArn,
      'NextToken': instance.nextToken,
    };

ListTagsOfResourceOutput _$ListTagsOfResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsOfResourceOutput(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListTagsOfResourceOutputToJson(
        ListTagsOfResourceOutput instance) =>
    <String, dynamic>{
      'Tags': instance.tags,
      'NextToken': instance.nextToken,
    };

LocalSecondaryIndex _$LocalSecondaryIndexFromJson(Map<String, dynamic> json) {
  return LocalSecondaryIndex(
    indexName: json['IndexName'] as String,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projection: json['Projection'] == null
        ? null
        : Projection.fromJson(json['Projection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocalSecondaryIndexToJson(
        LocalSecondaryIndex instance) =>
    <String, dynamic>{
      'IndexName': instance.indexName,
      'KeySchema': instance.keySchema,
      'Projection': instance.projection,
    };

LocalSecondaryIndexDescription _$LocalSecondaryIndexDescriptionFromJson(
    Map<String, dynamic> json) {
  return LocalSecondaryIndexDescription(
    indexName: json['IndexName'] as String,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projection: json['Projection'] == null
        ? null
        : Projection.fromJson(json['Projection'] as Map<String, dynamic>),
    indexSizeBytes: json['IndexSizeBytes'] as int,
    itemCount: json['ItemCount'] as int,
    indexArn: json['IndexArn'] as String,
  );
}

Map<String, dynamic> _$LocalSecondaryIndexDescriptionToJson(
        LocalSecondaryIndexDescription instance) =>
    <String, dynamic>{
      'IndexName': instance.indexName,
      'KeySchema': instance.keySchema,
      'Projection': instance.projection,
      'IndexSizeBytes': instance.indexSizeBytes,
      'ItemCount': instance.itemCount,
      'IndexArn': instance.indexArn,
    };

LocalSecondaryIndexInfo _$LocalSecondaryIndexInfoFromJson(
    Map<String, dynamic> json) {
  return LocalSecondaryIndexInfo(
    indexName: json['IndexName'] as String,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    projection: json['Projection'] == null
        ? null
        : Projection.fromJson(json['Projection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocalSecondaryIndexInfoToJson(
        LocalSecondaryIndexInfo instance) =>
    <String, dynamic>{
      'IndexName': instance.indexName,
      'KeySchema': instance.keySchema,
      'Projection': instance.projection,
    };

PointInTimeRecoveryDescription _$PointInTimeRecoveryDescriptionFromJson(
    Map<String, dynamic> json) {
  return PointInTimeRecoveryDescription(
    pointInTimeRecoveryStatus: json['PointInTimeRecoveryStatus'] as String,
    earliestRestorableDateTime: json['EarliestRestorableDateTime'] as String,
    latestRestorableDateTime: json['LatestRestorableDateTime'] as String,
  );
}

Map<String, dynamic> _$PointInTimeRecoveryDescriptionToJson(
        PointInTimeRecoveryDescription instance) =>
    <String, dynamic>{
      'PointInTimeRecoveryStatus': instance.pointInTimeRecoveryStatus,
      'EarliestRestorableDateTime': instance.earliestRestorableDateTime,
      'LatestRestorableDateTime': instance.latestRestorableDateTime,
    };

PointInTimeRecoverySpecification _$PointInTimeRecoverySpecificationFromJson(
    Map<String, dynamic> json) {
  return PointInTimeRecoverySpecification(
    pointInTimeRecoveryEnabled: json['PointInTimeRecoveryEnabled'] as bool,
  );
}

Map<String, dynamic> _$PointInTimeRecoverySpecificationToJson(
        PointInTimeRecoverySpecification instance) =>
    <String, dynamic>{
      'PointInTimeRecoveryEnabled': instance.pointInTimeRecoveryEnabled,
    };

Projection _$ProjectionFromJson(Map<String, dynamic> json) {
  return Projection(
    projectionType: json['ProjectionType'] as String,
    nonKeyAttributes:
        (json['NonKeyAttributes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ProjectionToJson(Projection instance) =>
    <String, dynamic>{
      'ProjectionType': instance.projectionType,
      'NonKeyAttributes': instance.nonKeyAttributes,
    };

ProvisionedThroughput _$ProvisionedThroughputFromJson(
    Map<String, dynamic> json) {
  return ProvisionedThroughput(
    readCapacityUnits: json['ReadCapacityUnits'] as int,
    writeCapacityUnits: json['WriteCapacityUnits'] as int,
  );
}

Map<String, dynamic> _$ProvisionedThroughputToJson(
        ProvisionedThroughput instance) =>
    <String, dynamic>{
      'ReadCapacityUnits': instance.readCapacityUnits,
      'WriteCapacityUnits': instance.writeCapacityUnits,
    };

ProvisionedThroughputDescription _$ProvisionedThroughputDescriptionFromJson(
    Map<String, dynamic> json) {
  return ProvisionedThroughputDescription(
    lastIncreaseDateTime: json['LastIncreaseDateTime'] as String,
    lastDecreaseDateTime: json['LastDecreaseDateTime'] as String,
    numberOfDecreasesToday: json['NumberOfDecreasesToday'] as int,
    readCapacityUnits: json['ReadCapacityUnits'] as int,
    writeCapacityUnits: json['WriteCapacityUnits'] as int,
  );
}

Map<String, dynamic> _$ProvisionedThroughputDescriptionToJson(
        ProvisionedThroughputDescription instance) =>
    <String, dynamic>{
      'LastIncreaseDateTime': instance.lastIncreaseDateTime,
      'LastDecreaseDateTime': instance.lastDecreaseDateTime,
      'NumberOfDecreasesToday': instance.numberOfDecreasesToday,
      'ReadCapacityUnits': instance.readCapacityUnits,
      'WriteCapacityUnits': instance.writeCapacityUnits,
    };

Put _$PutFromJson(Map<String, dynamic> json) {
  return Put(
    item: (json['Item'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    tableName: json['TableName'] as String,
    conditionExpression: json['ConditionExpression'] as String,
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    expressionAttributeValues:
        (json['ExpressionAttributeValues'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    returnValuesOnConditionCheckFailure:
        json['ReturnValuesOnConditionCheckFailure'] as String,
  );
}

Map<String, dynamic> _$PutToJson(Put instance) => <String, dynamic>{
      'Item': instance.item,
      'TableName': instance.tableName,
      'ConditionExpression': instance.conditionExpression,
      'ExpressionAttributeNames': instance.expressionAttributeNames,
      'ExpressionAttributeValues': instance.expressionAttributeValues,
      'ReturnValuesOnConditionCheckFailure':
          instance.returnValuesOnConditionCheckFailure,
    };

PutItemInput _$PutItemInputFromJson(Map<String, dynamic> json) {
  return PutItemInput(
    tableName: json['TableName'] as String,
    item: (json['Item'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    expected: (json['Expected'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ExpectedAttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    returnValues: json['ReturnValues'] as String,
    returnConsumedCapacity: json['ReturnConsumedCapacity'] as String,
    returnItemCollectionMetrics: json['ReturnItemCollectionMetrics'] as String,
    conditionalOperator: json['ConditionalOperator'] as String,
    conditionExpression: json['ConditionExpression'] as String,
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    expressionAttributeValues:
        (json['ExpressionAttributeValues'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$PutItemInputToJson(PutItemInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'Item': instance.item,
      'Expected': instance.expected,
      'ReturnValues': instance.returnValues,
      'ReturnConsumedCapacity': instance.returnConsumedCapacity,
      'ReturnItemCollectionMetrics': instance.returnItemCollectionMetrics,
      'ConditionalOperator': instance.conditionalOperator,
      'ConditionExpression': instance.conditionExpression,
      'ExpressionAttributeNames': instance.expressionAttributeNames,
      'ExpressionAttributeValues': instance.expressionAttributeValues,
    };

PutItemOutput _$PutItemOutputFromJson(Map<String, dynamic> json) {
  return PutItemOutput(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    consumedCapacity: json['ConsumedCapacity'] == null
        ? null
        : ConsumedCapacity.fromJson(
            json['ConsumedCapacity'] as Map<String, dynamic>),
    itemCollectionMetrics: json['ItemCollectionMetrics'] == null
        ? null
        : ItemCollectionMetrics.fromJson(
            json['ItemCollectionMetrics'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PutItemOutputToJson(PutItemOutput instance) =>
    <String, dynamic>{
      'Attributes': instance.attributes,
      'ConsumedCapacity': instance.consumedCapacity,
      'ItemCollectionMetrics': instance.itemCollectionMetrics,
    };

PutRequest _$PutRequestFromJson(Map<String, dynamic> json) {
  return PutRequest(
    item: (json['Item'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$PutRequestToJson(PutRequest instance) =>
    <String, dynamic>{
      'Item': instance.item,
    };

QueryInput _$QueryInputFromJson(Map<String, dynamic> json) {
  return QueryInput(
    tableName: json['TableName'] as String,
    indexName: json['IndexName'] as String,
    select: json['Select'] as String,
    attributesToGet:
        (json['AttributesToGet'] as List)?.map((e) => e as String)?.toList(),
    limit: json['Limit'] as int,
    consistentRead: json['ConsistentRead'] as bool,
    keyConditions: (json['KeyConditions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Condition.fromJson(e as Map<String, dynamic>)),
    ),
    queryFilter: (json['QueryFilter'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Condition.fromJson(e as Map<String, dynamic>)),
    ),
    conditionalOperator: json['ConditionalOperator'] as String,
    scanIndexForward: json['ScanIndexForward'] as bool,
    exclusiveStartKey: (json['ExclusiveStartKey'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    returnConsumedCapacity: json['ReturnConsumedCapacity'] as String,
    projectionExpression: json['ProjectionExpression'] as String,
    filterExpression: json['FilterExpression'] as String,
    keyConditionExpression: json['KeyConditionExpression'] as String,
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    expressionAttributeValues:
        (json['ExpressionAttributeValues'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$QueryInputToJson(QueryInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'IndexName': instance.indexName,
      'Select': instance.select,
      'AttributesToGet': instance.attributesToGet,
      'Limit': instance.limit,
      'ConsistentRead': instance.consistentRead,
      'KeyConditions': instance.keyConditions,
      'QueryFilter': instance.queryFilter,
      'ConditionalOperator': instance.conditionalOperator,
      'ScanIndexForward': instance.scanIndexForward,
      'ExclusiveStartKey': instance.exclusiveStartKey,
      'ReturnConsumedCapacity': instance.returnConsumedCapacity,
      'ProjectionExpression': instance.projectionExpression,
      'FilterExpression': instance.filterExpression,
      'KeyConditionExpression': instance.keyConditionExpression,
      'ExpressionAttributeNames': instance.expressionAttributeNames,
      'ExpressionAttributeValues': instance.expressionAttributeValues,
    };

QueryOutput _$QueryOutputFromJson(Map<String, dynamic> json) {
  return QueryOutput(
    items: (json['Items'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(
                  k,
                  e == null
                      ? null
                      : AttributeValue.fromJson(e as Map<String, dynamic>)),
            ))
        ?.toList(),
    count: json['Count'] as int,
    scannedCount: json['ScannedCount'] as int,
    lastEvaluatedKey: (json['LastEvaluatedKey'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    consumedCapacity: json['ConsumedCapacity'] == null
        ? null
        : ConsumedCapacity.fromJson(
            json['ConsumedCapacity'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QueryOutputToJson(QueryOutput instance) =>
    <String, dynamic>{
      'Items': instance.items,
      'Count': instance.count,
      'ScannedCount': instance.scannedCount,
      'LastEvaluatedKey': instance.lastEvaluatedKey,
      'ConsumedCapacity': instance.consumedCapacity,
    };

Replica _$ReplicaFromJson(Map<String, dynamic> json) {
  return Replica(
    regionName: json['RegionName'] as String,
  );
}

Map<String, dynamic> _$ReplicaToJson(Replica instance) => <String, dynamic>{
      'RegionName': instance.regionName,
    };

ReplicaDescription _$ReplicaDescriptionFromJson(Map<String, dynamic> json) {
  return ReplicaDescription(
    regionName: json['RegionName'] as String,
  );
}

Map<String, dynamic> _$ReplicaDescriptionToJson(ReplicaDescription instance) =>
    <String, dynamic>{
      'RegionName': instance.regionName,
    };

ReplicaGlobalSecondaryIndexSettingsDescription
    _$ReplicaGlobalSecondaryIndexSettingsDescriptionFromJson(
        Map<String, dynamic> json) {
  return ReplicaGlobalSecondaryIndexSettingsDescription(
    indexName: json['IndexName'] as String,
    indexStatus: json['IndexStatus'] as String,
    provisionedReadCapacityUnits: json['ProvisionedReadCapacityUnits'] as int,
    provisionedReadCapacityAutoScalingSettings:
        json['ProvisionedReadCapacityAutoScalingSettings'] == null
            ? null
            : AutoScalingSettingsDescription.fromJson(
                json['ProvisionedReadCapacityAutoScalingSettings']
                    as Map<String, dynamic>),
    provisionedWriteCapacityUnits: json['ProvisionedWriteCapacityUnits'] as int,
    provisionedWriteCapacityAutoScalingSettings:
        json['ProvisionedWriteCapacityAutoScalingSettings'] == null
            ? null
            : AutoScalingSettingsDescription.fromJson(
                json['ProvisionedWriteCapacityAutoScalingSettings']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReplicaGlobalSecondaryIndexSettingsDescriptionToJson(
        ReplicaGlobalSecondaryIndexSettingsDescription instance) =>
    <String, dynamic>{
      'IndexName': instance.indexName,
      'IndexStatus': instance.indexStatus,
      'ProvisionedReadCapacityUnits': instance.provisionedReadCapacityUnits,
      'ProvisionedReadCapacityAutoScalingSettings':
          instance.provisionedReadCapacityAutoScalingSettings,
      'ProvisionedWriteCapacityUnits': instance.provisionedWriteCapacityUnits,
      'ProvisionedWriteCapacityAutoScalingSettings':
          instance.provisionedWriteCapacityAutoScalingSettings,
    };

ReplicaGlobalSecondaryIndexSettingsUpdate
    _$ReplicaGlobalSecondaryIndexSettingsUpdateFromJson(
        Map<String, dynamic> json) {
  return ReplicaGlobalSecondaryIndexSettingsUpdate(
    indexName: json['IndexName'] as String,
    provisionedReadCapacityUnits: json['ProvisionedReadCapacityUnits'] as int,
    provisionedReadCapacityAutoScalingSettingsUpdate:
        json['ProvisionedReadCapacityAutoScalingSettingsUpdate'] == null
            ? null
            : AutoScalingSettingsUpdate.fromJson(
                json['ProvisionedReadCapacityAutoScalingSettingsUpdate']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReplicaGlobalSecondaryIndexSettingsUpdateToJson(
        ReplicaGlobalSecondaryIndexSettingsUpdate instance) =>
    <String, dynamic>{
      'IndexName': instance.indexName,
      'ProvisionedReadCapacityUnits': instance.provisionedReadCapacityUnits,
      'ProvisionedReadCapacityAutoScalingSettingsUpdate':
          instance.provisionedReadCapacityAutoScalingSettingsUpdate,
    };

ReplicaSettingsDescription _$ReplicaSettingsDescriptionFromJson(
    Map<String, dynamic> json) {
  return ReplicaSettingsDescription(
    regionName: json['RegionName'] as String,
    replicaStatus: json['ReplicaStatus'] as String,
    replicaBillingModeSummary: json['ReplicaBillingModeSummary'] == null
        ? null
        : BillingModeSummary.fromJson(
            json['ReplicaBillingModeSummary'] as Map<String, dynamic>),
    replicaProvisionedReadCapacityUnits:
        json['ReplicaProvisionedReadCapacityUnits'] as int,
    replicaProvisionedReadCapacityAutoScalingSettings:
        json['ReplicaProvisionedReadCapacityAutoScalingSettings'] == null
            ? null
            : AutoScalingSettingsDescription.fromJson(
                json['ReplicaProvisionedReadCapacityAutoScalingSettings']
                    as Map<String, dynamic>),
    replicaProvisionedWriteCapacityUnits:
        json['ReplicaProvisionedWriteCapacityUnits'] as int,
    replicaProvisionedWriteCapacityAutoScalingSettings:
        json['ReplicaProvisionedWriteCapacityAutoScalingSettings'] == null
            ? null
            : AutoScalingSettingsDescription.fromJson(
                json['ReplicaProvisionedWriteCapacityAutoScalingSettings']
                    as Map<String, dynamic>),
    replicaGlobalSecondaryIndexSettings:
        (json['ReplicaGlobalSecondaryIndexSettings'] as List)
            ?.map((e) => e == null
                ? null
                : ReplicaGlobalSecondaryIndexSettingsDescription.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

Map<String, dynamic> _$ReplicaSettingsDescriptionToJson(
        ReplicaSettingsDescription instance) =>
    <String, dynamic>{
      'RegionName': instance.regionName,
      'ReplicaStatus': instance.replicaStatus,
      'ReplicaBillingModeSummary': instance.replicaBillingModeSummary,
      'ReplicaProvisionedReadCapacityUnits':
          instance.replicaProvisionedReadCapacityUnits,
      'ReplicaProvisionedReadCapacityAutoScalingSettings':
          instance.replicaProvisionedReadCapacityAutoScalingSettings,
      'ReplicaProvisionedWriteCapacityUnits':
          instance.replicaProvisionedWriteCapacityUnits,
      'ReplicaProvisionedWriteCapacityAutoScalingSettings':
          instance.replicaProvisionedWriteCapacityAutoScalingSettings,
      'ReplicaGlobalSecondaryIndexSettings':
          instance.replicaGlobalSecondaryIndexSettings,
    };

ReplicaSettingsUpdate _$ReplicaSettingsUpdateFromJson(
    Map<String, dynamic> json) {
  return ReplicaSettingsUpdate(
    regionName: json['RegionName'] as String,
    replicaProvisionedReadCapacityUnits:
        json['ReplicaProvisionedReadCapacityUnits'] as int,
    replicaProvisionedReadCapacityAutoScalingSettingsUpdate:
        json['ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate'] == null
            ? null
            : AutoScalingSettingsUpdate.fromJson(
                json['ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate']
                    as Map<String, dynamic>),
    replicaGlobalSecondaryIndexSettingsUpdate:
        (json['ReplicaGlobalSecondaryIndexSettingsUpdate'] as List)
            ?.map((e) => e == null
                ? null
                : ReplicaGlobalSecondaryIndexSettingsUpdate.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

Map<String, dynamic> _$ReplicaSettingsUpdateToJson(
        ReplicaSettingsUpdate instance) =>
    <String, dynamic>{
      'RegionName': instance.regionName,
      'ReplicaProvisionedReadCapacityUnits':
          instance.replicaProvisionedReadCapacityUnits,
      'ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate':
          instance.replicaProvisionedReadCapacityAutoScalingSettingsUpdate,
      'ReplicaGlobalSecondaryIndexSettingsUpdate':
          instance.replicaGlobalSecondaryIndexSettingsUpdate,
    };

ReplicaUpdate _$ReplicaUpdateFromJson(Map<String, dynamic> json) {
  return ReplicaUpdate(
    create: json['Create'] == null
        ? null
        : CreateReplicaAction.fromJson(json['Create'] as Map<String, dynamic>),
    delete: json['Delete'] == null
        ? null
        : DeleteReplicaAction.fromJson(json['Delete'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReplicaUpdateToJson(ReplicaUpdate instance) =>
    <String, dynamic>{
      'Create': instance.create,
      'Delete': instance.delete,
    };

RestoreSummary _$RestoreSummaryFromJson(Map<String, dynamic> json) {
  return RestoreSummary(
    restoreDateTime: json['RestoreDateTime'] as String,
    restoreInProgress: json['RestoreInProgress'] as bool,
    sourceBackupArn: json['SourceBackupArn'] as String,
    sourceTableArn: json['SourceTableArn'] as String,
  );
}

Map<String, dynamic> _$RestoreSummaryToJson(RestoreSummary instance) =>
    <String, dynamic>{
      'RestoreDateTime': instance.restoreDateTime,
      'RestoreInProgress': instance.restoreInProgress,
      'SourceBackupArn': instance.sourceBackupArn,
      'SourceTableArn': instance.sourceTableArn,
    };

RestoreTableFromBackupInput _$RestoreTableFromBackupInputFromJson(
    Map<String, dynamic> json) {
  return RestoreTableFromBackupInput(
    targetTableName: json['TargetTableName'] as String,
    backupArn: json['BackupArn'] as String,
  );
}

Map<String, dynamic> _$RestoreTableFromBackupInputToJson(
        RestoreTableFromBackupInput instance) =>
    <String, dynamic>{
      'TargetTableName': instance.targetTableName,
      'BackupArn': instance.backupArn,
    };

RestoreTableFromBackupOutput _$RestoreTableFromBackupOutputFromJson(
    Map<String, dynamic> json) {
  return RestoreTableFromBackupOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RestoreTableFromBackupOutputToJson(
        RestoreTableFromBackupOutput instance) =>
    <String, dynamic>{
      'TableDescription': instance.tableDescription,
    };

RestoreTableToPointInTimeInput _$RestoreTableToPointInTimeInputFromJson(
    Map<String, dynamic> json) {
  return RestoreTableToPointInTimeInput(
    sourceTableName: json['SourceTableName'] as String,
    targetTableName: json['TargetTableName'] as String,
    useLatestRestorableTime: json['UseLatestRestorableTime'] as bool,
    restoreDateTime: json['RestoreDateTime'] as String,
  );
}

Map<String, dynamic> _$RestoreTableToPointInTimeInputToJson(
        RestoreTableToPointInTimeInput instance) =>
    <String, dynamic>{
      'SourceTableName': instance.sourceTableName,
      'TargetTableName': instance.targetTableName,
      'UseLatestRestorableTime': instance.useLatestRestorableTime,
      'RestoreDateTime': instance.restoreDateTime,
    };

RestoreTableToPointInTimeOutput _$RestoreTableToPointInTimeOutputFromJson(
    Map<String, dynamic> json) {
  return RestoreTableToPointInTimeOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RestoreTableToPointInTimeOutputToJson(
        RestoreTableToPointInTimeOutput instance) =>
    <String, dynamic>{
      'TableDescription': instance.tableDescription,
    };

SSEDescription _$SSEDescriptionFromJson(Map<String, dynamic> json) {
  return SSEDescription(
    status: json['Status'] as String,
    sSEType: json['SSEType'] as String,
    kMSMasterKeyArn: json['KMSMasterKeyArn'] as String,
  );
}

Map<String, dynamic> _$SSEDescriptionToJson(SSEDescription instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'SSEType': instance.sSEType,
      'KMSMasterKeyArn': instance.kMSMasterKeyArn,
    };

SSESpecification _$SSESpecificationFromJson(Map<String, dynamic> json) {
  return SSESpecification(
    enabled: json['Enabled'] as bool,
    sSEType: json['SSEType'] as String,
    kMSMasterKeyId: json['KMSMasterKeyId'] as String,
  );
}

Map<String, dynamic> _$SSESpecificationToJson(SSESpecification instance) =>
    <String, dynamic>{
      'Enabled': instance.enabled,
      'SSEType': instance.sSEType,
      'KMSMasterKeyId': instance.kMSMasterKeyId,
    };

ScanInput _$ScanInputFromJson(Map<String, dynamic> json) {
  return ScanInput(
    tableName: json['TableName'] as String,
    indexName: json['IndexName'] as String,
    attributesToGet:
        (json['AttributesToGet'] as List)?.map((e) => e as String)?.toList(),
    limit: json['Limit'] as int,
    select: json['Select'] as String,
    scanFilter: (json['ScanFilter'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Condition.fromJson(e as Map<String, dynamic>)),
    ),
    conditionalOperator: json['ConditionalOperator'] as String,
    exclusiveStartKey: (json['ExclusiveStartKey'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    returnConsumedCapacity: json['ReturnConsumedCapacity'] as String,
    totalSegments: json['TotalSegments'] as int,
    segment: json['Segment'] as int,
    projectionExpression: json['ProjectionExpression'] as String,
    filterExpression: json['FilterExpression'] as String,
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    expressionAttributeValues:
        (json['ExpressionAttributeValues'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    consistentRead: json['ConsistentRead'] as bool,
  );
}

Map<String, dynamic> _$ScanInputToJson(ScanInput instance) => <String, dynamic>{
      'TableName': instance.tableName,
      'IndexName': instance.indexName,
      'AttributesToGet': instance.attributesToGet,
      'Limit': instance.limit,
      'Select': instance.select,
      'ScanFilter': instance.scanFilter,
      'ConditionalOperator': instance.conditionalOperator,
      'ExclusiveStartKey': instance.exclusiveStartKey,
      'ReturnConsumedCapacity': instance.returnConsumedCapacity,
      'TotalSegments': instance.totalSegments,
      'Segment': instance.segment,
      'ProjectionExpression': instance.projectionExpression,
      'FilterExpression': instance.filterExpression,
      'ExpressionAttributeNames': instance.expressionAttributeNames,
      'ExpressionAttributeValues': instance.expressionAttributeValues,
      'ConsistentRead': instance.consistentRead,
    };

ScanOutput _$ScanOutputFromJson(Map<String, dynamic> json) {
  return ScanOutput(
    items: (json['Items'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(
                  k,
                  e == null
                      ? null
                      : AttributeValue.fromJson(e as Map<String, dynamic>)),
            ))
        ?.toList(),
    count: json['Count'] as int,
    scannedCount: json['ScannedCount'] as int,
    lastEvaluatedKey: (json['LastEvaluatedKey'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    consumedCapacity: json['ConsumedCapacity'] == null
        ? null
        : ConsumedCapacity.fromJson(
            json['ConsumedCapacity'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ScanOutputToJson(ScanOutput instance) =>
    <String, dynamic>{
      'Items': instance.items,
      'Count': instance.count,
      'ScannedCount': instance.scannedCount,
      'LastEvaluatedKey': instance.lastEvaluatedKey,
      'ConsumedCapacity': instance.consumedCapacity,
    };

SourceTableDetails _$SourceTableDetailsFromJson(Map<String, dynamic> json) {
  return SourceTableDetails(
    tableName: json['TableName'] as String,
    tableId: json['TableId'] as String,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tableCreationDateTime: json['TableCreationDateTime'] as String,
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : ProvisionedThroughput.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
    tableArn: json['TableArn'] as String,
    tableSizeBytes: json['TableSizeBytes'] as int,
    itemCount: json['ItemCount'] as int,
    billingMode: json['BillingMode'] as String,
  );
}

Map<String, dynamic> _$SourceTableDetailsToJson(SourceTableDetails instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'TableId': instance.tableId,
      'KeySchema': instance.keySchema,
      'TableCreationDateTime': instance.tableCreationDateTime,
      'ProvisionedThroughput': instance.provisionedThroughput,
      'TableArn': instance.tableArn,
      'TableSizeBytes': instance.tableSizeBytes,
      'ItemCount': instance.itemCount,
      'BillingMode': instance.billingMode,
    };

SourceTableFeatureDetails _$SourceTableFeatureDetailsFromJson(
    Map<String, dynamic> json) {
  return SourceTableFeatureDetails(
    localSecondaryIndexes: (json['LocalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : LocalSecondaryIndexInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : GlobalSecondaryIndexInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    streamDescription: json['StreamDescription'] == null
        ? null
        : StreamSpecification.fromJson(
            json['StreamDescription'] as Map<String, dynamic>),
    timeToLiveDescription: json['TimeToLiveDescription'] == null
        ? null
        : TimeToLiveDescription.fromJson(
            json['TimeToLiveDescription'] as Map<String, dynamic>),
    sSEDescription: json['SSEDescription'] == null
        ? null
        : SSEDescription.fromJson(
            json['SSEDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SourceTableFeatureDetailsToJson(
        SourceTableFeatureDetails instance) =>
    <String, dynamic>{
      'LocalSecondaryIndexes': instance.localSecondaryIndexes,
      'GlobalSecondaryIndexes': instance.globalSecondaryIndexes,
      'StreamDescription': instance.streamDescription,
      'TimeToLiveDescription': instance.timeToLiveDescription,
      'SSEDescription': instance.sSEDescription,
    };

StreamSpecification _$StreamSpecificationFromJson(Map<String, dynamic> json) {
  return StreamSpecification(
    streamEnabled: json['StreamEnabled'] as bool,
    streamViewType: json['StreamViewType'] as String,
  );
}

Map<String, dynamic> _$StreamSpecificationToJson(
        StreamSpecification instance) =>
    <String, dynamic>{
      'StreamEnabled': instance.streamEnabled,
      'StreamViewType': instance.streamViewType,
    };

TableDescription _$TableDescriptionFromJson(Map<String, dynamic> json) {
  return TableDescription(
    attributeDefinitions: (json['AttributeDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tableName: json['TableName'] as String,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tableStatus: json['TableStatus'] as String,
    creationDateTime: json['CreationDateTime'] as String,
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : ProvisionedThroughputDescription.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
    tableSizeBytes: json['TableSizeBytes'] as int,
    itemCount: json['ItemCount'] as int,
    tableArn: json['TableArn'] as String,
    tableId: json['TableId'] as String,
    billingModeSummary: json['BillingModeSummary'] == null
        ? null
        : BillingModeSummary.fromJson(
            json['BillingModeSummary'] as Map<String, dynamic>),
    localSecondaryIndexes: (json['LocalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : LocalSecondaryIndexDescription.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : GlobalSecondaryIndexDescription.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    streamSpecification: json['StreamSpecification'] == null
        ? null
        : StreamSpecification.fromJson(
            json['StreamSpecification'] as Map<String, dynamic>),
    latestStreamLabel: json['LatestStreamLabel'] as String,
    latestStreamArn: json['LatestStreamArn'] as String,
    restoreSummary: json['RestoreSummary'] == null
        ? null
        : RestoreSummary.fromJson(
            json['RestoreSummary'] as Map<String, dynamic>),
    sSEDescription: json['SSEDescription'] == null
        ? null
        : SSEDescription.fromJson(
            json['SSEDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TableDescriptionToJson(TableDescription instance) =>
    <String, dynamic>{
      'AttributeDefinitions': instance.attributeDefinitions,
      'TableName': instance.tableName,
      'KeySchema': instance.keySchema,
      'TableStatus': instance.tableStatus,
      'CreationDateTime': instance.creationDateTime,
      'ProvisionedThroughput': instance.provisionedThroughput,
      'TableSizeBytes': instance.tableSizeBytes,
      'ItemCount': instance.itemCount,
      'TableArn': instance.tableArn,
      'TableId': instance.tableId,
      'BillingModeSummary': instance.billingModeSummary,
      'LocalSecondaryIndexes': instance.localSecondaryIndexes,
      'GlobalSecondaryIndexes': instance.globalSecondaryIndexes,
      'StreamSpecification': instance.streamSpecification,
      'LatestStreamLabel': instance.latestStreamLabel,
      'LatestStreamArn': instance.latestStreamArn,
      'RestoreSummary': instance.restoreSummary,
      'SSEDescription': instance.sSEDescription,
    };

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

TagResourceInput _$TagResourceInputFromJson(Map<String, dynamic> json) {
  return TagResourceInput(
    resourceArn: json['ResourceArn'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TagResourceInputToJson(TagResourceInput instance) =>
    <String, dynamic>{
      'ResourceArn': instance.resourceArn,
      'Tags': instance.tags,
    };

TimeToLiveDescription _$TimeToLiveDescriptionFromJson(
    Map<String, dynamic> json) {
  return TimeToLiveDescription(
    timeToLiveStatus: json['TimeToLiveStatus'] as String,
    attributeName: json['AttributeName'] as String,
  );
}

Map<String, dynamic> _$TimeToLiveDescriptionToJson(
        TimeToLiveDescription instance) =>
    <String, dynamic>{
      'TimeToLiveStatus': instance.timeToLiveStatus,
      'AttributeName': instance.attributeName,
    };

TimeToLiveSpecification _$TimeToLiveSpecificationFromJson(
    Map<String, dynamic> json) {
  return TimeToLiveSpecification(
    enabled: json['Enabled'] as bool,
    attributeName: json['AttributeName'] as String,
  );
}

Map<String, dynamic> _$TimeToLiveSpecificationToJson(
        TimeToLiveSpecification instance) =>
    <String, dynamic>{
      'Enabled': instance.enabled,
      'AttributeName': instance.attributeName,
    };

TransactGetItem _$TransactGetItemFromJson(Map<String, dynamic> json) {
  return TransactGetItem(
    get: json['Get'] == null
        ? null
        : Get.fromJson(json['Get'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransactGetItemToJson(TransactGetItem instance) =>
    <String, dynamic>{
      'Get': instance.get,
    };

TransactGetItemsInput _$TransactGetItemsInputFromJson(
    Map<String, dynamic> json) {
  return TransactGetItemsInput(
    transactItems: (json['TransactItems'] as List)
        ?.map((e) => e == null
            ? null
            : TransactGetItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    returnConsumedCapacity: json['ReturnConsumedCapacity'] as String,
  );
}

Map<String, dynamic> _$TransactGetItemsInputToJson(
        TransactGetItemsInput instance) =>
    <String, dynamic>{
      'TransactItems': instance.transactItems,
      'ReturnConsumedCapacity': instance.returnConsumedCapacity,
    };

TransactGetItemsOutput _$TransactGetItemsOutputFromJson(
    Map<String, dynamic> json) {
  return TransactGetItemsOutput(
    consumedCapacity: (json['ConsumedCapacity'] as List)
        ?.map((e) => e == null
            ? null
            : ConsumedCapacity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    responses: (json['Responses'] as List)
        ?.map((e) =>
            e == null ? null : ItemResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TransactGetItemsOutputToJson(
        TransactGetItemsOutput instance) =>
    <String, dynamic>{
      'ConsumedCapacity': instance.consumedCapacity,
      'Responses': instance.responses,
    };

TransactWriteItem _$TransactWriteItemFromJson(Map<String, dynamic> json) {
  return TransactWriteItem(
    conditionCheck: json['ConditionCheck'] == null
        ? null
        : ConditionCheck.fromJson(
            json['ConditionCheck'] as Map<String, dynamic>),
    put: json['Put'] == null
        ? null
        : Put.fromJson(json['Put'] as Map<String, dynamic>),
    delete: json['Delete'] == null
        ? null
        : Delete.fromJson(json['Delete'] as Map<String, dynamic>),
    update: json['Update'] == null
        ? null
        : Update.fromJson(json['Update'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransactWriteItemToJson(TransactWriteItem instance) =>
    <String, dynamic>{
      'ConditionCheck': instance.conditionCheck,
      'Put': instance.put,
      'Delete': instance.delete,
      'Update': instance.update,
    };

TransactWriteItemsInput _$TransactWriteItemsInputFromJson(
    Map<String, dynamic> json) {
  return TransactWriteItemsInput(
    transactItems: (json['TransactItems'] as List)
        ?.map((e) => e == null
            ? null
            : TransactWriteItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    returnConsumedCapacity: json['ReturnConsumedCapacity'] as String,
    returnItemCollectionMetrics: json['ReturnItemCollectionMetrics'] as String,
    clientRequestToken: json['ClientRequestToken'] as String,
  );
}

Map<String, dynamic> _$TransactWriteItemsInputToJson(
        TransactWriteItemsInput instance) =>
    <String, dynamic>{
      'TransactItems': instance.transactItems,
      'ReturnConsumedCapacity': instance.returnConsumedCapacity,
      'ReturnItemCollectionMetrics': instance.returnItemCollectionMetrics,
      'ClientRequestToken': instance.clientRequestToken,
    };

TransactWriteItemsOutput _$TransactWriteItemsOutputFromJson(
    Map<String, dynamic> json) {
  return TransactWriteItemsOutput(
    consumedCapacity: (json['ConsumedCapacity'] as List)
        ?.map((e) => e == null
            ? null
            : ConsumedCapacity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    itemCollectionMetrics:
        (json['ItemCollectionMetrics'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : ItemCollectionMetrics.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
  );
}

Map<String, dynamic> _$TransactWriteItemsOutputToJson(
        TransactWriteItemsOutput instance) =>
    <String, dynamic>{
      'ConsumedCapacity': instance.consumedCapacity,
      'ItemCollectionMetrics': instance.itemCollectionMetrics,
    };

UntagResourceInput _$UntagResourceInputFromJson(Map<String, dynamic> json) {
  return UntagResourceInput(
    resourceArn: json['ResourceArn'] as String,
    tagKeys: (json['TagKeys'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UntagResourceInputToJson(UntagResourceInput instance) =>
    <String, dynamic>{
      'ResourceArn': instance.resourceArn,
      'TagKeys': instance.tagKeys,
    };

Update _$UpdateFromJson(Map<String, dynamic> json) {
  return Update(
    key: (json['Key'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    updateExpression: json['UpdateExpression'] as String,
    tableName: json['TableName'] as String,
    conditionExpression: json['ConditionExpression'] as String,
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    expressionAttributeValues:
        (json['ExpressionAttributeValues'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    returnValuesOnConditionCheckFailure:
        json['ReturnValuesOnConditionCheckFailure'] as String,
  );
}

Map<String, dynamic> _$UpdateToJson(Update instance) => <String, dynamic>{
      'Key': instance.key,
      'UpdateExpression': instance.updateExpression,
      'TableName': instance.tableName,
      'ConditionExpression': instance.conditionExpression,
      'ExpressionAttributeNames': instance.expressionAttributeNames,
      'ExpressionAttributeValues': instance.expressionAttributeValues,
      'ReturnValuesOnConditionCheckFailure':
          instance.returnValuesOnConditionCheckFailure,
    };

UpdateContinuousBackupsInput _$UpdateContinuousBackupsInputFromJson(
    Map<String, dynamic> json) {
  return UpdateContinuousBackupsInput(
    tableName: json['TableName'] as String,
    pointInTimeRecoverySpecification:
        json['PointInTimeRecoverySpecification'] == null
            ? null
            : PointInTimeRecoverySpecification.fromJson(
                json['PointInTimeRecoverySpecification']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateContinuousBackupsInputToJson(
        UpdateContinuousBackupsInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'PointInTimeRecoverySpecification':
          instance.pointInTimeRecoverySpecification,
    };

UpdateContinuousBackupsOutput _$UpdateContinuousBackupsOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateContinuousBackupsOutput(
    continuousBackupsDescription: json['ContinuousBackupsDescription'] == null
        ? null
        : ContinuousBackupsDescription.fromJson(
            json['ContinuousBackupsDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateContinuousBackupsOutputToJson(
        UpdateContinuousBackupsOutput instance) =>
    <String, dynamic>{
      'ContinuousBackupsDescription': instance.continuousBackupsDescription,
    };

UpdateGlobalSecondaryIndexAction _$UpdateGlobalSecondaryIndexActionFromJson(
    Map<String, dynamic> json) {
  return UpdateGlobalSecondaryIndexAction(
    indexName: json['IndexName'] as String,
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : ProvisionedThroughput.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateGlobalSecondaryIndexActionToJson(
        UpdateGlobalSecondaryIndexAction instance) =>
    <String, dynamic>{
      'IndexName': instance.indexName,
      'ProvisionedThroughput': instance.provisionedThroughput,
    };

UpdateGlobalTableInput _$UpdateGlobalTableInputFromJson(
    Map<String, dynamic> json) {
  return UpdateGlobalTableInput(
    globalTableName: json['GlobalTableName'] as String,
    replicaUpdates: (json['ReplicaUpdates'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicaUpdate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UpdateGlobalTableInputToJson(
        UpdateGlobalTableInput instance) =>
    <String, dynamic>{
      'GlobalTableName': instance.globalTableName,
      'ReplicaUpdates': instance.replicaUpdates,
    };

UpdateGlobalTableOutput _$UpdateGlobalTableOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGlobalTableOutput(
    globalTableDescription: json['GlobalTableDescription'] == null
        ? null
        : GlobalTableDescription.fromJson(
            json['GlobalTableDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateGlobalTableOutputToJson(
        UpdateGlobalTableOutput instance) =>
    <String, dynamic>{
      'GlobalTableDescription': instance.globalTableDescription,
    };

UpdateGlobalTableSettingsInput _$UpdateGlobalTableSettingsInputFromJson(
    Map<String, dynamic> json) {
  return UpdateGlobalTableSettingsInput(
    globalTableName: json['GlobalTableName'] as String,
    globalTableBillingMode: json['GlobalTableBillingMode'] as String,
    globalTableProvisionedWriteCapacityUnits:
        json['GlobalTableProvisionedWriteCapacityUnits'] as int,
    globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate: json[
                'GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate'] ==
            null
        ? null
        : AutoScalingSettingsUpdate.fromJson(
            json['GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate']
                as Map<String, dynamic>),
    globalTableGlobalSecondaryIndexSettingsUpdate:
        (json['GlobalTableGlobalSecondaryIndexSettingsUpdate'] as List)
            ?.map((e) => e == null
                ? null
                : GlobalTableGlobalSecondaryIndexSettingsUpdate.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    replicaSettingsUpdate: (json['ReplicaSettingsUpdate'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicaSettingsUpdate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UpdateGlobalTableSettingsInputToJson(
        UpdateGlobalTableSettingsInput instance) =>
    <String, dynamic>{
      'GlobalTableName': instance.globalTableName,
      'GlobalTableBillingMode': instance.globalTableBillingMode,
      'GlobalTableProvisionedWriteCapacityUnits':
          instance.globalTableProvisionedWriteCapacityUnits,
      'GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate':
          instance.globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate,
      'GlobalTableGlobalSecondaryIndexSettingsUpdate':
          instance.globalTableGlobalSecondaryIndexSettingsUpdate,
      'ReplicaSettingsUpdate': instance.replicaSettingsUpdate,
    };

UpdateGlobalTableSettingsOutput _$UpdateGlobalTableSettingsOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGlobalTableSettingsOutput(
    globalTableName: json['GlobalTableName'] as String,
    replicaSettings: (json['ReplicaSettings'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicaSettingsDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UpdateGlobalTableSettingsOutputToJson(
        UpdateGlobalTableSettingsOutput instance) =>
    <String, dynamic>{
      'GlobalTableName': instance.globalTableName,
      'ReplicaSettings': instance.replicaSettings,
    };

UpdateItemInput _$UpdateItemInputFromJson(Map<String, dynamic> json) {
  return UpdateItemInput(
    tableName: json['TableName'] as String,
    key: (json['Key'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    attributeUpdates: (json['AttributeUpdates'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValueUpdate.fromJson(e as Map<String, dynamic>)),
    ),
    expected: (json['Expected'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : ExpectedAttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    conditionalOperator: json['ConditionalOperator'] as String,
    returnValues: json['ReturnValues'] as String,
    returnConsumedCapacity: json['ReturnConsumedCapacity'] as String,
    returnItemCollectionMetrics: json['ReturnItemCollectionMetrics'] as String,
    updateExpression: json['UpdateExpression'] as String,
    conditionExpression: json['ConditionExpression'] as String,
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    expressionAttributeValues:
        (json['ExpressionAttributeValues'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$UpdateItemInputToJson(UpdateItemInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'Key': instance.key,
      'AttributeUpdates': instance.attributeUpdates,
      'Expected': instance.expected,
      'ConditionalOperator': instance.conditionalOperator,
      'ReturnValues': instance.returnValues,
      'ReturnConsumedCapacity': instance.returnConsumedCapacity,
      'ReturnItemCollectionMetrics': instance.returnItemCollectionMetrics,
      'UpdateExpression': instance.updateExpression,
      'ConditionExpression': instance.conditionExpression,
      'ExpressionAttributeNames': instance.expressionAttributeNames,
      'ExpressionAttributeValues': instance.expressionAttributeValues,
    };

UpdateItemOutput _$UpdateItemOutputFromJson(Map<String, dynamic> json) {
  return UpdateItemOutput(
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    consumedCapacity: json['ConsumedCapacity'] == null
        ? null
        : ConsumedCapacity.fromJson(
            json['ConsumedCapacity'] as Map<String, dynamic>),
    itemCollectionMetrics: json['ItemCollectionMetrics'] == null
        ? null
        : ItemCollectionMetrics.fromJson(
            json['ItemCollectionMetrics'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateItemOutputToJson(UpdateItemOutput instance) =>
    <String, dynamic>{
      'Attributes': instance.attributes,
      'ConsumedCapacity': instance.consumedCapacity,
      'ItemCollectionMetrics': instance.itemCollectionMetrics,
    };

UpdateTableInput _$UpdateTableInputFromJson(Map<String, dynamic> json) {
  return UpdateTableInput(
    tableName: json['TableName'] as String,
    attributeDefinitions: (json['AttributeDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    billingMode: json['BillingMode'] as String,
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : ProvisionedThroughput.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
    globalSecondaryIndexUpdates: (json['GlobalSecondaryIndexUpdates'] as List)
        ?.map((e) => e == null
            ? null
            : GlobalSecondaryIndexUpdate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    streamSpecification: json['StreamSpecification'] == null
        ? null
        : StreamSpecification.fromJson(
            json['StreamSpecification'] as Map<String, dynamic>),
    sSESpecification: json['SSESpecification'] == null
        ? null
        : SSESpecification.fromJson(
            json['SSESpecification'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateTableInputToJson(UpdateTableInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'AttributeDefinitions': instance.attributeDefinitions,
      'BillingMode': instance.billingMode,
      'ProvisionedThroughput': instance.provisionedThroughput,
      'GlobalSecondaryIndexUpdates': instance.globalSecondaryIndexUpdates,
      'StreamSpecification': instance.streamSpecification,
      'SSESpecification': instance.sSESpecification,
    };

UpdateTableOutput _$UpdateTableOutputFromJson(Map<String, dynamic> json) {
  return UpdateTableOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateTableOutputToJson(UpdateTableOutput instance) =>
    <String, dynamic>{
      'TableDescription': instance.tableDescription,
    };

UpdateTimeToLiveInput _$UpdateTimeToLiveInputFromJson(
    Map<String, dynamic> json) {
  return UpdateTimeToLiveInput(
    tableName: json['TableName'] as String,
    timeToLiveSpecification: json['TimeToLiveSpecification'] == null
        ? null
        : TimeToLiveSpecification.fromJson(
            json['TimeToLiveSpecification'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateTimeToLiveInputToJson(
        UpdateTimeToLiveInput instance) =>
    <String, dynamic>{
      'TableName': instance.tableName,
      'TimeToLiveSpecification': instance.timeToLiveSpecification,
    };

UpdateTimeToLiveOutput _$UpdateTimeToLiveOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateTimeToLiveOutput(
    timeToLiveSpecification: json['TimeToLiveSpecification'] == null
        ? null
        : TimeToLiveSpecification.fromJson(
            json['TimeToLiveSpecification'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateTimeToLiveOutputToJson(
        UpdateTimeToLiveOutput instance) =>
    <String, dynamic>{
      'TimeToLiveSpecification': instance.timeToLiveSpecification,
    };

WriteRequest _$WriteRequestFromJson(Map<String, dynamic> json) {
  return WriteRequest(
    putRequest: json['PutRequest'] == null
        ? null
        : PutRequest.fromJson(json['PutRequest'] as Map<String, dynamic>),
    deleteRequest: json['DeleteRequest'] == null
        ? null
        : DeleteRequest.fromJson(json['DeleteRequest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WriteRequestToJson(WriteRequest instance) =>
    <String, dynamic>{
      'PutRequest': instance.putRequest,
      'DeleteRequest': instance.deleteRequest,
    };
