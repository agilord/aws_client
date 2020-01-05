// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamodb-2012-08-10.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchivalSummary _$ArchivalSummaryFromJson(Map<String, dynamic> json) {
  return ArchivalSummary(
    archivalBackupArn: json['ArchivalBackupArn'] as String,
    archivalDateTime: json['ArchivalDateTime'] == null
        ? null
        : DateTime.parse(json['ArchivalDateTime'] as String),
    archivalReason: json['ArchivalReason'] as String,
  );
}

AttributeDefinition _$AttributeDefinitionFromJson(Map<String, dynamic> json) {
  return AttributeDefinition(
    attributeName: json['AttributeName'] as String,
    attributeType: json['AttributeType'] as String,
  );
}

Map<String, dynamic> _$AttributeDefinitionToJson(AttributeDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('AttributeType', instance.attributeType);
  return val;
}

AttributeValue _$AttributeValueFromJson(Map<String, dynamic> json) {
  return AttributeValue(
    b: const Uint8ListConverter().fromJson(json['B'] as String),
    boolValue: json['BOOL'] as bool,
    bs: const Uint8ListListConverter().fromJson(json['BS'] as List<String>),
    l: (json['L'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    m: (json['M'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    n: json['N'] as String,
    ns: (json['NS'] as List)?.map((e) => e as String)?.toList(),
    nullValue: json['NULL'] as bool,
    s: json['S'] as String,
    ss: (json['SS'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AttributeValueToJson(AttributeValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('B', const Uint8ListConverter().toJson(instance.b));
  writeNotNull('BOOL', instance.boolValue);
  writeNotNull('BS', const Uint8ListListConverter().toJson(instance.bs));
  writeNotNull('L', instance.l?.map((e) => e?.toJson())?.toList());
  writeNotNull('M', instance.m?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('N', instance.n);
  writeNotNull('NS', instance.ns);
  writeNotNull('NULL', instance.nullValue);
  writeNotNull('S', instance.s);
  writeNotNull('SS', instance.ss);
  return val;
}

Map<String, dynamic> _$AttributeValueUpdateToJson(
    AttributeValueUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Action', instance.action);
  writeNotNull('Value', instance.value?.toJson());
  return val;
}

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

Map<String, dynamic> _$AutoScalingPolicyUpdateToJson(
    AutoScalingPolicyUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetTrackingScalingPolicyConfiguration',
      instance.targetTrackingScalingPolicyConfiguration?.toJson());
  writeNotNull('PolicyName', instance.policyName);
  return val;
}

AutoScalingSettingsDescription _$AutoScalingSettingsDescriptionFromJson(
    Map<String, dynamic> json) {
  return AutoScalingSettingsDescription(
    autoScalingDisabled: json['AutoScalingDisabled'] as bool,
    autoScalingRoleArn: json['AutoScalingRoleArn'] as String,
    maximumUnits: json['MaximumUnits'] as int,
    minimumUnits: json['MinimumUnits'] as int,
    scalingPolicies: (json['ScalingPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : AutoScalingPolicyDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AutoScalingSettingsUpdateToJson(
    AutoScalingSettingsUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AutoScalingDisabled', instance.autoScalingDisabled);
  writeNotNull('AutoScalingRoleArn', instance.autoScalingRoleArn);
  writeNotNull('MaximumUnits', instance.maximumUnits);
  writeNotNull('MinimumUnits', instance.minimumUnits);
  writeNotNull('ScalingPolicyUpdate', instance.scalingPolicyUpdate?.toJson());
  return val;
}

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
    _$AutoScalingTargetTrackingScalingPolicyConfigurationUpdateToJson(
        AutoScalingTargetTrackingScalingPolicyConfigurationUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TargetValue', instance.targetValue);
  writeNotNull('DisableScaleIn', instance.disableScaleIn);
  writeNotNull('ScaleInCooldown', instance.scaleInCooldown);
  writeNotNull('ScaleOutCooldown', instance.scaleOutCooldown);
  return val;
}

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

BackupDetails _$BackupDetailsFromJson(Map<String, dynamic> json) {
  return BackupDetails(
    backupArn: json['BackupArn'] as String,
    backupCreationDateTime: json['BackupCreationDateTime'] == null
        ? null
        : DateTime.parse(json['BackupCreationDateTime'] as String),
    backupName: json['BackupName'] as String,
    backupStatus: json['BackupStatus'] as String,
    backupType: json['BackupType'] as String,
    backupExpiryDateTime: json['BackupExpiryDateTime'] == null
        ? null
        : DateTime.parse(json['BackupExpiryDateTime'] as String),
    backupSizeBytes: json['BackupSizeBytes'] as int,
  );
}

BackupSummary _$BackupSummaryFromJson(Map<String, dynamic> json) {
  return BackupSummary(
    backupArn: json['BackupArn'] as String,
    backupCreationDateTime: json['BackupCreationDateTime'] == null
        ? null
        : DateTime.parse(json['BackupCreationDateTime'] as String),
    backupExpiryDateTime: json['BackupExpiryDateTime'] == null
        ? null
        : DateTime.parse(json['BackupExpiryDateTime'] as String),
    backupName: json['BackupName'] as String,
    backupSizeBytes: json['BackupSizeBytes'] as int,
    backupStatus: json['BackupStatus'] as String,
    backupType: json['BackupType'] as String,
    tableArn: json['TableArn'] as String,
    tableId: json['TableId'] as String,
    tableName: json['TableName'] as String,
  );
}

BatchGetItemOutput _$BatchGetItemOutputFromJson(Map<String, dynamic> json) {
  return BatchGetItemOutput(
    consumedCapacity: (json['ConsumedCapacity'] as List)
        ?.map((e) => e == null
            ? null
            : ConsumedCapacity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
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
  );
}

BatchWriteItemOutput _$BatchWriteItemOutputFromJson(Map<String, dynamic> json) {
  return BatchWriteItemOutput(
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
    unprocessedItems: (json['UnprocessedItems'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : WriteRequest.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
  );
}

BillingModeSummary _$BillingModeSummaryFromJson(Map<String, dynamic> json) {
  return BillingModeSummary(
    billingMode: json['BillingMode'] as String,
    lastUpdateToPayPerRequestDateTime:
        json['LastUpdateToPayPerRequestDateTime'] == null
            ? null
            : DateTime.parse(
                json['LastUpdateToPayPerRequestDateTime'] as String),
  );
}

Capacity _$CapacityFromJson(Map<String, dynamic> json) {
  return Capacity(
    capacityUnits: (json['CapacityUnits'] as num)?.toDouble(),
    readCapacityUnits: (json['ReadCapacityUnits'] as num)?.toDouble(),
    writeCapacityUnits: (json['WriteCapacityUnits'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ConditionToJson(Condition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComparisonOperator', instance.comparisonOperator);
  writeNotNull('AttributeValueList',
      instance.attributeValueList?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$ConditionCheckToJson(ConditionCheck instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConditionExpression', instance.conditionExpression);
  writeNotNull('Key', instance.key?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('TableName', instance.tableName);
  writeNotNull('ExpressionAttributeNames', instance.expressionAttributeNames);
  writeNotNull(
      'ExpressionAttributeValues',
      instance.expressionAttributeValues
          ?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('ReturnValuesOnConditionCheckFailure',
      instance.returnValuesOnConditionCheckFailure);
  return val;
}

ConsumedCapacity _$ConsumedCapacityFromJson(Map<String, dynamic> json) {
  return ConsumedCapacity(
    capacityUnits: (json['CapacityUnits'] as num)?.toDouble(),
    globalSecondaryIndexes:
        (json['GlobalSecondaryIndexes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Capacity.fromJson(e as Map<String, dynamic>)),
    ),
    localSecondaryIndexes:
        (json['LocalSecondaryIndexes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Capacity.fromJson(e as Map<String, dynamic>)),
    ),
    readCapacityUnits: (json['ReadCapacityUnits'] as num)?.toDouble(),
    table: json['Table'] == null
        ? null
        : Capacity.fromJson(json['Table'] as Map<String, dynamic>),
    tableName: json['TableName'] as String,
    writeCapacityUnits: (json['WriteCapacityUnits'] as num)?.toDouble(),
  );
}

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

ContributorInsightsSummary _$ContributorInsightsSummaryFromJson(
    Map<String, dynamic> json) {
  return ContributorInsightsSummary(
    contributorInsightsStatus: json['ContributorInsightsStatus'] as String,
    indexName: json['IndexName'] as String,
    tableName: json['TableName'] as String,
  );
}

CreateBackupOutput _$CreateBackupOutputFromJson(Map<String, dynamic> json) {
  return CreateBackupOutput(
    backupDetails: json['BackupDetails'] == null
        ? null
        : BackupDetails.fromJson(json['BackupDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateGlobalSecondaryIndexActionToJson(
    CreateGlobalSecondaryIndexAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  writeNotNull(
      'KeySchema', instance.keySchema?.map((e) => e?.toJson())?.toList());
  writeNotNull('Projection', instance.projection?.toJson());
  writeNotNull(
      'ProvisionedThroughput', instance.provisionedThroughput?.toJson());
  return val;
}

CreateGlobalTableOutput _$CreateGlobalTableOutputFromJson(
    Map<String, dynamic> json) {
  return CreateGlobalTableOutput(
    globalTableDescription: json['GlobalTableDescription'] == null
        ? null
        : GlobalTableDescription.fromJson(
            json['GlobalTableDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateReplicaActionToJson(CreateReplicaAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegionName', instance.regionName);
  return val;
}

Map<String, dynamic> _$CreateReplicationGroupMemberActionToJson(
    CreateReplicationGroupMemberAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegionName', instance.regionName);
  writeNotNull('GlobalSecondaryIndexes',
      instance.globalSecondaryIndexes?.map((e) => e?.toJson())?.toList());
  writeNotNull('KMSMasterKeyId', instance.kMSMasterKeyId);
  writeNotNull('ProvisionedThroughputOverride',
      instance.provisionedThroughputOverride?.toJson());
  return val;
}

CreateTableOutput _$CreateTableOutputFromJson(Map<String, dynamic> json) {
  return CreateTableOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteToJson(Delete instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('TableName', instance.tableName);
  writeNotNull('ConditionExpression', instance.conditionExpression);
  writeNotNull('ExpressionAttributeNames', instance.expressionAttributeNames);
  writeNotNull(
      'ExpressionAttributeValues',
      instance.expressionAttributeValues
          ?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('ReturnValuesOnConditionCheckFailure',
      instance.returnValuesOnConditionCheckFailure);
  return val;
}

DeleteBackupOutput _$DeleteBackupOutputFromJson(Map<String, dynamic> json) {
  return DeleteBackupOutput(
    backupDescription: json['BackupDescription'] == null
        ? null
        : BackupDescription.fromJson(
            json['BackupDescription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteGlobalSecondaryIndexActionToJson(
    DeleteGlobalSecondaryIndexAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  return val;
}

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

Map<String, dynamic> _$DeleteReplicaActionToJson(DeleteReplicaAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegionName', instance.regionName);
  return val;
}

Map<String, dynamic> _$DeleteReplicationGroupMemberActionToJson(
    DeleteReplicationGroupMemberAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegionName', instance.regionName);
  return val;
}

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

Map<String, dynamic> _$DeleteRequestToJson(DeleteRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

DeleteTableOutput _$DeleteTableOutputFromJson(Map<String, dynamic> json) {
  return DeleteTableOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

DescribeBackupOutput _$DescribeBackupOutputFromJson(Map<String, dynamic> json) {
  return DescribeBackupOutput(
    backupDescription: json['BackupDescription'] == null
        ? null
        : BackupDescription.fromJson(
            json['BackupDescription'] as Map<String, dynamic>),
  );
}

DescribeContinuousBackupsOutput _$DescribeContinuousBackupsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeContinuousBackupsOutput(
    continuousBackupsDescription: json['ContinuousBackupsDescription'] == null
        ? null
        : ContinuousBackupsDescription.fromJson(
            json['ContinuousBackupsDescription'] as Map<String, dynamic>),
  );
}

DescribeContributorInsightsOutput _$DescribeContributorInsightsOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeContributorInsightsOutput(
    contributorInsightsRuleList: (json['ContributorInsightsRuleList'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    contributorInsightsStatus: json['ContributorInsightsStatus'] as String,
    failureException: json['FailureException'] == null
        ? null
        : FailureException.fromJson(
            json['FailureException'] as Map<String, dynamic>),
    indexName: json['IndexName'] as String,
    lastUpdateDateTime: json['LastUpdateDateTime'] == null
        ? null
        : DateTime.parse(json['LastUpdateDateTime'] as String),
    tableName: json['TableName'] as String,
  );
}

DescribeEndpointsResponse _$DescribeEndpointsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeEndpointsResponse(
    endpoints: (json['Endpoints'] as List)
        ?.map((e) =>
            e == null ? null : Endpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeGlobalTableOutput _$DescribeGlobalTableOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeGlobalTableOutput(
    globalTableDescription: json['GlobalTableDescription'] == null
        ? null
        : GlobalTableDescription.fromJson(
            json['GlobalTableDescription'] as Map<String, dynamic>),
  );
}

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

DescribeLimitsOutput _$DescribeLimitsOutputFromJson(Map<String, dynamic> json) {
  return DescribeLimitsOutput(
    accountMaxReadCapacityUnits: json['AccountMaxReadCapacityUnits'] as int,
    accountMaxWriteCapacityUnits: json['AccountMaxWriteCapacityUnits'] as int,
    tableMaxReadCapacityUnits: json['TableMaxReadCapacityUnits'] as int,
    tableMaxWriteCapacityUnits: json['TableMaxWriteCapacityUnits'] as int,
  );
}

DescribeTableOutput _$DescribeTableOutputFromJson(Map<String, dynamic> json) {
  return DescribeTableOutput(
    table: json['Table'] == null
        ? null
        : TableDescription.fromJson(json['Table'] as Map<String, dynamic>),
  );
}

DescribeTableReplicaAutoScalingOutput
    _$DescribeTableReplicaAutoScalingOutputFromJson(Map<String, dynamic> json) {
  return DescribeTableReplicaAutoScalingOutput(
    tableAutoScalingDescription: json['TableAutoScalingDescription'] == null
        ? null
        : TableAutoScalingDescription.fromJson(
            json['TableAutoScalingDescription'] as Map<String, dynamic>),
  );
}

DescribeTimeToLiveOutput _$DescribeTimeToLiveOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeTimeToLiveOutput(
    timeToLiveDescription: json['TimeToLiveDescription'] == null
        ? null
        : TimeToLiveDescription.fromJson(
            json['TimeToLiveDescription'] as Map<String, dynamic>),
  );
}

Endpoint _$EndpointFromJson(Map<String, dynamic> json) {
  return Endpoint(
    address: json['Address'] as String,
    cachePeriodInMinutes: json['CachePeriodInMinutes'] as int,
  );
}

Map<String, dynamic> _$ExpectedAttributeValueToJson(
    ExpectedAttributeValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeValueList',
      instance.attributeValueList?.map((e) => e?.toJson())?.toList());
  writeNotNull('ComparisonOperator', instance.comparisonOperator);
  writeNotNull('Exists', instance.exists);
  writeNotNull('Value', instance.value?.toJson());
  return val;
}

FailureException _$FailureExceptionFromJson(Map<String, dynamic> json) {
  return FailureException(
    exceptionDescription: json['ExceptionDescription'] as String,
    exceptionName: json['ExceptionName'] as String,
  );
}

Map<String, dynamic> _$GetToJson(Get instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('TableName', instance.tableName);
  writeNotNull('ExpressionAttributeNames', instance.expressionAttributeNames);
  writeNotNull('ProjectionExpression', instance.projectionExpression);
  return val;
}

GetItemOutput _$GetItemOutputFromJson(Map<String, dynamic> json) {
  return GetItemOutput(
    consumedCapacity: json['ConsumedCapacity'] == null
        ? null
        : ConsumedCapacity.fromJson(
            json['ConsumedCapacity'] as Map<String, dynamic>),
    item: (json['Item'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$GlobalSecondaryIndexToJson(
    GlobalSecondaryIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  writeNotNull(
      'KeySchema', instance.keySchema?.map((e) => e?.toJson())?.toList());
  writeNotNull('Projection', instance.projection?.toJson());
  writeNotNull(
      'ProvisionedThroughput', instance.provisionedThroughput?.toJson());
  return val;
}

Map<String, dynamic> _$GlobalSecondaryIndexAutoScalingUpdateToJson(
    GlobalSecondaryIndexAutoScalingUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  writeNotNull('ProvisionedWriteCapacityAutoScalingUpdate',
      instance.provisionedWriteCapacityAutoScalingUpdate?.toJson());
  return val;
}

GlobalSecondaryIndexDescription _$GlobalSecondaryIndexDescriptionFromJson(
    Map<String, dynamic> json) {
  return GlobalSecondaryIndexDescription(
    backfilling: json['Backfilling'] as bool,
    indexArn: json['IndexArn'] as String,
    indexName: json['IndexName'] as String,
    indexSizeBytes: json['IndexSizeBytes'] as int,
    indexStatus: json['IndexStatus'] as String,
    itemCount: json['ItemCount'] as int,
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
        : ProvisionedThroughputDescription.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
  );
}

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

Map<String, dynamic> _$GlobalSecondaryIndexUpdateToJson(
    GlobalSecondaryIndexUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Create', instance.create?.toJson());
  writeNotNull('Delete', instance.delete?.toJson());
  writeNotNull('Update', instance.update?.toJson());
  return val;
}

GlobalTable _$GlobalTableFromJson(Map<String, dynamic> json) {
  return GlobalTable(
    globalTableName: json['GlobalTableName'] as String,
    replicationGroup: (json['ReplicationGroup'] as List)
        ?.map((e) =>
            e == null ? null : Replica.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GlobalTableDescription _$GlobalTableDescriptionFromJson(
    Map<String, dynamic> json) {
  return GlobalTableDescription(
    creationDateTime: json['CreationDateTime'] == null
        ? null
        : DateTime.parse(json['CreationDateTime'] as String),
    globalTableArn: json['GlobalTableArn'] as String,
    globalTableName: json['GlobalTableName'] as String,
    globalTableStatus: json['GlobalTableStatus'] as String,
    replicationGroup: (json['ReplicationGroup'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicaDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GlobalTableGlobalSecondaryIndexSettingsUpdateToJson(
    GlobalTableGlobalSecondaryIndexSettingsUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  writeNotNull('ProvisionedWriteCapacityAutoScalingSettingsUpdate',
      instance.provisionedWriteCapacityAutoScalingSettingsUpdate?.toJson());
  writeNotNull(
      'ProvisionedWriteCapacityUnits', instance.provisionedWriteCapacityUnits);
  return val;
}

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

KeySchemaElement _$KeySchemaElementFromJson(Map<String, dynamic> json) {
  return KeySchemaElement(
    attributeName: json['AttributeName'] as String,
    keyType: json['KeyType'] as String,
  );
}

Map<String, dynamic> _$KeySchemaElementToJson(KeySchemaElement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('KeyType', instance.keyType);
  return val;
}

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
    expressionAttributeNames:
        (json['ExpressionAttributeNames'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    projectionExpression: json['ProjectionExpression'] as String,
  );
}

Map<String, dynamic> _$KeysAndAttributesToJson(KeysAndAttributes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Keys',
      instance.keys
          ?.map((e) => e?.map((k, e) => MapEntry(k, e?.toJson())))
          ?.toList());
  writeNotNull('AttributesToGet', instance.attributesToGet);
  writeNotNull('ConsistentRead', instance.consistentRead);
  writeNotNull('ExpressionAttributeNames', instance.expressionAttributeNames);
  writeNotNull('ProjectionExpression', instance.projectionExpression);
  return val;
}

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

ListContributorInsightsOutput _$ListContributorInsightsOutputFromJson(
    Map<String, dynamic> json) {
  return ListContributorInsightsOutput(
    contributorInsightsSummaries: (json['ContributorInsightsSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : ContributorInsightsSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

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

ListTablesOutput _$ListTablesOutputFromJson(Map<String, dynamic> json) {
  return ListTablesOutput(
    lastEvaluatedTableName: json['LastEvaluatedTableName'] as String,
    tableNames: (json['TableNames'] as List)?.map((e) => e as String)?.toList(),
  );
}

ListTagsOfResourceOutput _$ListTagsOfResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsOfResourceOutput(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LocalSecondaryIndexToJson(LocalSecondaryIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  writeNotNull(
      'KeySchema', instance.keySchema?.map((e) => e?.toJson())?.toList());
  writeNotNull('Projection', instance.projection?.toJson());
  return val;
}

LocalSecondaryIndexDescription _$LocalSecondaryIndexDescriptionFromJson(
    Map<String, dynamic> json) {
  return LocalSecondaryIndexDescription(
    indexArn: json['IndexArn'] as String,
    indexName: json['IndexName'] as String,
    indexSizeBytes: json['IndexSizeBytes'] as int,
    itemCount: json['ItemCount'] as int,
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

PointInTimeRecoveryDescription _$PointInTimeRecoveryDescriptionFromJson(
    Map<String, dynamic> json) {
  return PointInTimeRecoveryDescription(
    earliestRestorableDateTime: json['EarliestRestorableDateTime'] == null
        ? null
        : DateTime.parse(json['EarliestRestorableDateTime'] as String),
    latestRestorableDateTime: json['LatestRestorableDateTime'] == null
        ? null
        : DateTime.parse(json['LatestRestorableDateTime'] as String),
    pointInTimeRecoveryStatus: json['PointInTimeRecoveryStatus'] as String,
  );
}

Map<String, dynamic> _$PointInTimeRecoverySpecificationToJson(
    PointInTimeRecoverySpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'PointInTimeRecoveryEnabled', instance.pointInTimeRecoveryEnabled);
  return val;
}

Projection _$ProjectionFromJson(Map<String, dynamic> json) {
  return Projection(
    nonKeyAttributes:
        (json['NonKeyAttributes'] as List)?.map((e) => e as String)?.toList(),
    projectionType: json['ProjectionType'] as String,
  );
}

Map<String, dynamic> _$ProjectionToJson(Projection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NonKeyAttributes', instance.nonKeyAttributes);
  writeNotNull('ProjectionType', instance.projectionType);
  return val;
}

ProvisionedThroughput _$ProvisionedThroughputFromJson(
    Map<String, dynamic> json) {
  return ProvisionedThroughput(
    readCapacityUnits: json['ReadCapacityUnits'] as int,
    writeCapacityUnits: json['WriteCapacityUnits'] as int,
  );
}

Map<String, dynamic> _$ProvisionedThroughputToJson(
    ProvisionedThroughput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReadCapacityUnits', instance.readCapacityUnits);
  writeNotNull('WriteCapacityUnits', instance.writeCapacityUnits);
  return val;
}

ProvisionedThroughputDescription _$ProvisionedThroughputDescriptionFromJson(
    Map<String, dynamic> json) {
  return ProvisionedThroughputDescription(
    lastDecreaseDateTime: json['LastDecreaseDateTime'] == null
        ? null
        : DateTime.parse(json['LastDecreaseDateTime'] as String),
    lastIncreaseDateTime: json['LastIncreaseDateTime'] == null
        ? null
        : DateTime.parse(json['LastIncreaseDateTime'] as String),
    numberOfDecreasesToday: json['NumberOfDecreasesToday'] as int,
    readCapacityUnits: json['ReadCapacityUnits'] as int,
    writeCapacityUnits: json['WriteCapacityUnits'] as int,
  );
}

ProvisionedThroughputOverride _$ProvisionedThroughputOverrideFromJson(
    Map<String, dynamic> json) {
  return ProvisionedThroughputOverride(
    readCapacityUnits: json['ReadCapacityUnits'] as int,
  );
}

Map<String, dynamic> _$ProvisionedThroughputOverrideToJson(
    ProvisionedThroughputOverride instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ReadCapacityUnits', instance.readCapacityUnits);
  return val;
}

Map<String, dynamic> _$PutToJson(Put instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Item', instance.item?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('TableName', instance.tableName);
  writeNotNull('ConditionExpression', instance.conditionExpression);
  writeNotNull('ExpressionAttributeNames', instance.expressionAttributeNames);
  writeNotNull(
      'ExpressionAttributeValues',
      instance.expressionAttributeValues
          ?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('ReturnValuesOnConditionCheckFailure',
      instance.returnValuesOnConditionCheckFailure);
  return val;
}

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

Map<String, dynamic> _$PutRequestToJson(PutRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Item', instance.item?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

QueryOutput _$QueryOutputFromJson(Map<String, dynamic> json) {
  return QueryOutput(
    consumedCapacity: json['ConsumedCapacity'] == null
        ? null
        : ConsumedCapacity.fromJson(
            json['ConsumedCapacity'] as Map<String, dynamic>),
    count: json['Count'] as int,
    items: (json['Items'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(
                  k,
                  e == null
                      ? null
                      : AttributeValue.fromJson(e as Map<String, dynamic>)),
            ))
        ?.toList(),
    lastEvaluatedKey: (json['LastEvaluatedKey'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    scannedCount: json['ScannedCount'] as int,
  );
}

Replica _$ReplicaFromJson(Map<String, dynamic> json) {
  return Replica(
    regionName: json['RegionName'] as String,
  );
}

Map<String, dynamic> _$ReplicaToJson(Replica instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegionName', instance.regionName);
  return val;
}

ReplicaAutoScalingDescription _$ReplicaAutoScalingDescriptionFromJson(
    Map<String, dynamic> json) {
  return ReplicaAutoScalingDescription(
    globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicaGlobalSecondaryIndexAutoScalingDescription.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    regionName: json['RegionName'] as String,
    replicaProvisionedReadCapacityAutoScalingSettings:
        json['ReplicaProvisionedReadCapacityAutoScalingSettings'] == null
            ? null
            : AutoScalingSettingsDescription.fromJson(
                json['ReplicaProvisionedReadCapacityAutoScalingSettings']
                    as Map<String, dynamic>),
    replicaProvisionedWriteCapacityAutoScalingSettings:
        json['ReplicaProvisionedWriteCapacityAutoScalingSettings'] == null
            ? null
            : AutoScalingSettingsDescription.fromJson(
                json['ReplicaProvisionedWriteCapacityAutoScalingSettings']
                    as Map<String, dynamic>),
    replicaStatus: json['ReplicaStatus'] as String,
  );
}

Map<String, dynamic> _$ReplicaAutoScalingUpdateToJson(
    ReplicaAutoScalingUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegionName', instance.regionName);
  writeNotNull(
      'ReplicaGlobalSecondaryIndexUpdates',
      instance.replicaGlobalSecondaryIndexUpdates
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull('ReplicaProvisionedReadCapacityAutoScalingUpdate',
      instance.replicaProvisionedReadCapacityAutoScalingUpdate?.toJson());
  return val;
}

ReplicaDescription _$ReplicaDescriptionFromJson(Map<String, dynamic> json) {
  return ReplicaDescription(
    globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicaGlobalSecondaryIndexDescription.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    kMSMasterKeyId: json['KMSMasterKeyId'] as String,
    provisionedThroughputOverride: json['ProvisionedThroughputOverride'] == null
        ? null
        : ProvisionedThroughputOverride.fromJson(
            json['ProvisionedThroughputOverride'] as Map<String, dynamic>),
    regionName: json['RegionName'] as String,
    replicaStatus: json['ReplicaStatus'] as String,
    replicaStatusDescription: json['ReplicaStatusDescription'] as String,
    replicaStatusPercentProgress:
        json['ReplicaStatusPercentProgress'] as String,
  );
}

Map<String, dynamic> _$ReplicaGlobalSecondaryIndexToJson(
    ReplicaGlobalSecondaryIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  writeNotNull('ProvisionedThroughputOverride',
      instance.provisionedThroughputOverride?.toJson());
  return val;
}

ReplicaGlobalSecondaryIndexAutoScalingDescription
    _$ReplicaGlobalSecondaryIndexAutoScalingDescriptionFromJson(
        Map<String, dynamic> json) {
  return ReplicaGlobalSecondaryIndexAutoScalingDescription(
    indexName: json['IndexName'] as String,
    indexStatus: json['IndexStatus'] as String,
    provisionedReadCapacityAutoScalingSettings:
        json['ProvisionedReadCapacityAutoScalingSettings'] == null
            ? null
            : AutoScalingSettingsDescription.fromJson(
                json['ProvisionedReadCapacityAutoScalingSettings']
                    as Map<String, dynamic>),
    provisionedWriteCapacityAutoScalingSettings:
        json['ProvisionedWriteCapacityAutoScalingSettings'] == null
            ? null
            : AutoScalingSettingsDescription.fromJson(
                json['ProvisionedWriteCapacityAutoScalingSettings']
                    as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReplicaGlobalSecondaryIndexAutoScalingUpdateToJson(
    ReplicaGlobalSecondaryIndexAutoScalingUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  writeNotNull('ProvisionedReadCapacityAutoScalingUpdate',
      instance.provisionedReadCapacityAutoScalingUpdate?.toJson());
  return val;
}

ReplicaGlobalSecondaryIndexDescription
    _$ReplicaGlobalSecondaryIndexDescriptionFromJson(
        Map<String, dynamic> json) {
  return ReplicaGlobalSecondaryIndexDescription(
    indexName: json['IndexName'] as String,
    provisionedThroughputOverride: json['ProvisionedThroughputOverride'] == null
        ? null
        : ProvisionedThroughputOverride.fromJson(
            json['ProvisionedThroughputOverride'] as Map<String, dynamic>),
  );
}

ReplicaGlobalSecondaryIndexSettingsDescription
    _$ReplicaGlobalSecondaryIndexSettingsDescriptionFromJson(
        Map<String, dynamic> json) {
  return ReplicaGlobalSecondaryIndexSettingsDescription(
    indexName: json['IndexName'] as String,
    indexStatus: json['IndexStatus'] as String,
    provisionedReadCapacityAutoScalingSettings:
        json['ProvisionedReadCapacityAutoScalingSettings'] == null
            ? null
            : AutoScalingSettingsDescription.fromJson(
                json['ProvisionedReadCapacityAutoScalingSettings']
                    as Map<String, dynamic>),
    provisionedReadCapacityUnits: json['ProvisionedReadCapacityUnits'] as int,
    provisionedWriteCapacityAutoScalingSettings:
        json['ProvisionedWriteCapacityAutoScalingSettings'] == null
            ? null
            : AutoScalingSettingsDescription.fromJson(
                json['ProvisionedWriteCapacityAutoScalingSettings']
                    as Map<String, dynamic>),
    provisionedWriteCapacityUnits: json['ProvisionedWriteCapacityUnits'] as int,
  );
}

Map<String, dynamic> _$ReplicaGlobalSecondaryIndexSettingsUpdateToJson(
    ReplicaGlobalSecondaryIndexSettingsUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  writeNotNull('ProvisionedReadCapacityAutoScalingSettingsUpdate',
      instance.provisionedReadCapacityAutoScalingSettingsUpdate?.toJson());
  writeNotNull(
      'ProvisionedReadCapacityUnits', instance.provisionedReadCapacityUnits);
  return val;
}

ReplicaSettingsDescription _$ReplicaSettingsDescriptionFromJson(
    Map<String, dynamic> json) {
  return ReplicaSettingsDescription(
    regionName: json['RegionName'] as String,
    replicaBillingModeSummary: json['ReplicaBillingModeSummary'] == null
        ? null
        : BillingModeSummary.fromJson(
            json['ReplicaBillingModeSummary'] as Map<String, dynamic>),
    replicaGlobalSecondaryIndexSettings:
        (json['ReplicaGlobalSecondaryIndexSettings'] as List)
            ?.map((e) => e == null
                ? null
                : ReplicaGlobalSecondaryIndexSettingsDescription.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
    replicaProvisionedReadCapacityAutoScalingSettings:
        json['ReplicaProvisionedReadCapacityAutoScalingSettings'] == null
            ? null
            : AutoScalingSettingsDescription.fromJson(
                json['ReplicaProvisionedReadCapacityAutoScalingSettings']
                    as Map<String, dynamic>),
    replicaProvisionedReadCapacityUnits:
        json['ReplicaProvisionedReadCapacityUnits'] as int,
    replicaProvisionedWriteCapacityAutoScalingSettings:
        json['ReplicaProvisionedWriteCapacityAutoScalingSettings'] == null
            ? null
            : AutoScalingSettingsDescription.fromJson(
                json['ReplicaProvisionedWriteCapacityAutoScalingSettings']
                    as Map<String, dynamic>),
    replicaProvisionedWriteCapacityUnits:
        json['ReplicaProvisionedWriteCapacityUnits'] as int,
    replicaStatus: json['ReplicaStatus'] as String,
  );
}

Map<String, dynamic> _$ReplicaSettingsUpdateToJson(
    ReplicaSettingsUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegionName', instance.regionName);
  writeNotNull(
      'ReplicaGlobalSecondaryIndexSettingsUpdate',
      instance.replicaGlobalSecondaryIndexSettingsUpdate
          ?.map((e) => e?.toJson())
          ?.toList());
  writeNotNull(
      'ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate',
      instance.replicaProvisionedReadCapacityAutoScalingSettingsUpdate
          ?.toJson());
  writeNotNull('ReplicaProvisionedReadCapacityUnits',
      instance.replicaProvisionedReadCapacityUnits);
  return val;
}

Map<String, dynamic> _$ReplicaUpdateToJson(ReplicaUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Create', instance.create?.toJson());
  writeNotNull('Delete', instance.delete?.toJson());
  return val;
}

Map<String, dynamic> _$ReplicationGroupUpdateToJson(
    ReplicationGroupUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Create', instance.create?.toJson());
  writeNotNull('Delete', instance.delete?.toJson());
  writeNotNull('Update', instance.update?.toJson());
  return val;
}

RestoreSummary _$RestoreSummaryFromJson(Map<String, dynamic> json) {
  return RestoreSummary(
    restoreDateTime: json['RestoreDateTime'] == null
        ? null
        : DateTime.parse(json['RestoreDateTime'] as String),
    restoreInProgress: json['RestoreInProgress'] as bool,
    sourceBackupArn: json['SourceBackupArn'] as String,
    sourceTableArn: json['SourceTableArn'] as String,
  );
}

RestoreTableFromBackupOutput _$RestoreTableFromBackupOutputFromJson(
    Map<String, dynamic> json) {
  return RestoreTableFromBackupOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

RestoreTableToPointInTimeOutput _$RestoreTableToPointInTimeOutputFromJson(
    Map<String, dynamic> json) {
  return RestoreTableToPointInTimeOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

SSEDescription _$SSEDescriptionFromJson(Map<String, dynamic> json) {
  return SSEDescription(
    inaccessibleEncryptionDateTime:
        json['InaccessibleEncryptionDateTime'] == null
            ? null
            : DateTime.parse(json['InaccessibleEncryptionDateTime'] as String),
    kMSMasterKeyArn: json['KMSMasterKeyArn'] as String,
    sSEType: json['SSEType'] as String,
    status: json['Status'] as String,
  );
}

Map<String, dynamic> _$SSESpecificationToJson(SSESpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('KMSMasterKeyId', instance.kMSMasterKeyId);
  writeNotNull('SSEType', instance.sSEType);
  return val;
}

ScanOutput _$ScanOutputFromJson(Map<String, dynamic> json) {
  return ScanOutput(
    consumedCapacity: json['ConsumedCapacity'] == null
        ? null
        : ConsumedCapacity.fromJson(
            json['ConsumedCapacity'] as Map<String, dynamic>),
    count: json['Count'] as int,
    items: (json['Items'] as List)
        ?.map((e) => (e as Map<String, dynamic>)?.map(
              (k, e) => MapEntry(
                  k,
                  e == null
                      ? null
                      : AttributeValue.fromJson(e as Map<String, dynamic>)),
            ))
        ?.toList(),
    lastEvaluatedKey: (json['LastEvaluatedKey'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : AttributeValue.fromJson(e as Map<String, dynamic>)),
    ),
    scannedCount: json['ScannedCount'] as int,
  );
}

SourceTableDetails _$SourceTableDetailsFromJson(Map<String, dynamic> json) {
  return SourceTableDetails(
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : ProvisionedThroughput.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
    tableCreationDateTime: json['TableCreationDateTime'] == null
        ? null
        : DateTime.parse(json['TableCreationDateTime'] as String),
    tableId: json['TableId'] as String,
    tableName: json['TableName'] as String,
    billingMode: json['BillingMode'] as String,
    itemCount: json['ItemCount'] as int,
    tableArn: json['TableArn'] as String,
    tableSizeBytes: json['TableSizeBytes'] as int,
  );
}

SourceTableFeatureDetails _$SourceTableFeatureDetailsFromJson(
    Map<String, dynamic> json) {
  return SourceTableFeatureDetails(
    globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : GlobalSecondaryIndexInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    localSecondaryIndexes: (json['LocalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : LocalSecondaryIndexInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sSEDescription: json['SSEDescription'] == null
        ? null
        : SSEDescription.fromJson(
            json['SSEDescription'] as Map<String, dynamic>),
    streamDescription: json['StreamDescription'] == null
        ? null
        : StreamSpecification.fromJson(
            json['StreamDescription'] as Map<String, dynamic>),
    timeToLiveDescription: json['TimeToLiveDescription'] == null
        ? null
        : TimeToLiveDescription.fromJson(
            json['TimeToLiveDescription'] as Map<String, dynamic>),
  );
}

StreamSpecification _$StreamSpecificationFromJson(Map<String, dynamic> json) {
  return StreamSpecification(
    streamEnabled: json['StreamEnabled'] as bool,
    streamViewType: json['StreamViewType'] as String,
  );
}

Map<String, dynamic> _$StreamSpecificationToJson(StreamSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamEnabled', instance.streamEnabled);
  writeNotNull('StreamViewType', instance.streamViewType);
  return val;
}

TableAutoScalingDescription _$TableAutoScalingDescriptionFromJson(
    Map<String, dynamic> json) {
  return TableAutoScalingDescription(
    replicas: (json['Replicas'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicaAutoScalingDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tableName: json['TableName'] as String,
    tableStatus: json['TableStatus'] as String,
  );
}

TableDescription _$TableDescriptionFromJson(Map<String, dynamic> json) {
  return TableDescription(
    archivalSummary: json['ArchivalSummary'] == null
        ? null
        : ArchivalSummary.fromJson(
            json['ArchivalSummary'] as Map<String, dynamic>),
    attributeDefinitions: (json['AttributeDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeDefinition.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    billingModeSummary: json['BillingModeSummary'] == null
        ? null
        : BillingModeSummary.fromJson(
            json['BillingModeSummary'] as Map<String, dynamic>),
    creationDateTime: json['CreationDateTime'] == null
        ? null
        : DateTime.parse(json['CreationDateTime'] as String),
    globalSecondaryIndexes: (json['GlobalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : GlobalSecondaryIndexDescription.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    globalTableVersion: json['GlobalTableVersion'] as String,
    itemCount: json['ItemCount'] as int,
    keySchema: (json['KeySchema'] as List)
        ?.map((e) => e == null
            ? null
            : KeySchemaElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    latestStreamArn: json['LatestStreamArn'] as String,
    latestStreamLabel: json['LatestStreamLabel'] as String,
    localSecondaryIndexes: (json['LocalSecondaryIndexes'] as List)
        ?.map((e) => e == null
            ? null
            : LocalSecondaryIndexDescription.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    provisionedThroughput: json['ProvisionedThroughput'] == null
        ? null
        : ProvisionedThroughputDescription.fromJson(
            json['ProvisionedThroughput'] as Map<String, dynamic>),
    replicas: (json['Replicas'] as List)
        ?.map((e) => e == null
            ? null
            : ReplicaDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    restoreSummary: json['RestoreSummary'] == null
        ? null
        : RestoreSummary.fromJson(
            json['RestoreSummary'] as Map<String, dynamic>),
    sSEDescription: json['SSEDescription'] == null
        ? null
        : SSEDescription.fromJson(
            json['SSEDescription'] as Map<String, dynamic>),
    streamSpecification: json['StreamSpecification'] == null
        ? null
        : StreamSpecification.fromJson(
            json['StreamSpecification'] as Map<String, dynamic>),
    tableArn: json['TableArn'] as String,
    tableId: json['TableId'] as String,
    tableName: json['TableName'] as String,
    tableSizeBytes: json['TableSizeBytes'] as int,
    tableStatus: json['TableStatus'] as String,
  );
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

TimeToLiveDescription _$TimeToLiveDescriptionFromJson(
    Map<String, dynamic> json) {
  return TimeToLiveDescription(
    attributeName: json['AttributeName'] as String,
    timeToLiveStatus: json['TimeToLiveStatus'] as String,
  );
}

TimeToLiveSpecification _$TimeToLiveSpecificationFromJson(
    Map<String, dynamic> json) {
  return TimeToLiveSpecification(
    attributeName: json['AttributeName'] as String,
    enabled: json['Enabled'] as bool,
  );
}

Map<String, dynamic> _$TimeToLiveSpecificationToJson(
    TimeToLiveSpecification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('Enabled', instance.enabled);
  return val;
}

Map<String, dynamic> _$TransactGetItemToJson(TransactGetItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Get', instance.get?.toJson());
  return val;
}

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

Map<String, dynamic> _$TransactWriteItemToJson(TransactWriteItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConditionCheck', instance.conditionCheck?.toJson());
  writeNotNull('Delete', instance.delete?.toJson());
  writeNotNull('Put', instance.put?.toJson());
  writeNotNull('Update', instance.update?.toJson());
  return val;
}

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

Map<String, dynamic> _$UpdateToJson(Update instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('TableName', instance.tableName);
  writeNotNull('UpdateExpression', instance.updateExpression);
  writeNotNull('ConditionExpression', instance.conditionExpression);
  writeNotNull('ExpressionAttributeNames', instance.expressionAttributeNames);
  writeNotNull(
      'ExpressionAttributeValues',
      instance.expressionAttributeValues
          ?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('ReturnValuesOnConditionCheckFailure',
      instance.returnValuesOnConditionCheckFailure);
  return val;
}

UpdateContinuousBackupsOutput _$UpdateContinuousBackupsOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateContinuousBackupsOutput(
    continuousBackupsDescription: json['ContinuousBackupsDescription'] == null
        ? null
        : ContinuousBackupsDescription.fromJson(
            json['ContinuousBackupsDescription'] as Map<String, dynamic>),
  );
}

UpdateContributorInsightsOutput _$UpdateContributorInsightsOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateContributorInsightsOutput(
    contributorInsightsStatus: json['ContributorInsightsStatus'] as String,
    indexName: json['IndexName'] as String,
    tableName: json['TableName'] as String,
  );
}

Map<String, dynamic> _$UpdateGlobalSecondaryIndexActionToJson(
    UpdateGlobalSecondaryIndexAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('IndexName', instance.indexName);
  writeNotNull(
      'ProvisionedThroughput', instance.provisionedThroughput?.toJson());
  return val;
}

UpdateGlobalTableOutput _$UpdateGlobalTableOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateGlobalTableOutput(
    globalTableDescription: json['GlobalTableDescription'] == null
        ? null
        : GlobalTableDescription.fromJson(
            json['GlobalTableDescription'] as Map<String, dynamic>),
  );
}

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

Map<String, dynamic> _$UpdateReplicationGroupMemberActionToJson(
    UpdateReplicationGroupMemberAction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegionName', instance.regionName);
  writeNotNull('GlobalSecondaryIndexes',
      instance.globalSecondaryIndexes?.map((e) => e?.toJson())?.toList());
  writeNotNull('KMSMasterKeyId', instance.kMSMasterKeyId);
  writeNotNull('ProvisionedThroughputOverride',
      instance.provisionedThroughputOverride?.toJson());
  return val;
}

UpdateTableOutput _$UpdateTableOutputFromJson(Map<String, dynamic> json) {
  return UpdateTableOutput(
    tableDescription: json['TableDescription'] == null
        ? null
        : TableDescription.fromJson(
            json['TableDescription'] as Map<String, dynamic>),
  );
}

UpdateTableReplicaAutoScalingOutput
    _$UpdateTableReplicaAutoScalingOutputFromJson(Map<String, dynamic> json) {
  return UpdateTableReplicaAutoScalingOutput(
    tableAutoScalingDescription: json['TableAutoScalingDescription'] == null
        ? null
        : TableAutoScalingDescription.fromJson(
            json['TableAutoScalingDescription'] as Map<String, dynamic>),
  );
}

UpdateTimeToLiveOutput _$UpdateTimeToLiveOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateTimeToLiveOutput(
    timeToLiveSpecification: json['TimeToLiveSpecification'] == null
        ? null
        : TimeToLiveSpecification.fromJson(
            json['TimeToLiveSpecification'] as Map<String, dynamic>),
  );
}

WriteRequest _$WriteRequestFromJson(Map<String, dynamic> json) {
  return WriteRequest(
    deleteRequest: json['DeleteRequest'] == null
        ? null
        : DeleteRequest.fromJson(json['DeleteRequest'] as Map<String, dynamic>),
    putRequest: json['PutRequest'] == null
        ? null
        : PutRequest.fromJson(json['PutRequest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WriteRequestToJson(WriteRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DeleteRequest', instance.deleteRequest?.toJson());
  writeNotNull('PutRequest', instance.putRequest?.toJson());
  return val;
}
