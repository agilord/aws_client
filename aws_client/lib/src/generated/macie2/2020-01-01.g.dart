// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-01-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptInvitationResponse _$AcceptInvitationResponseFromJson(
    Map<String, dynamic> json) {
  return AcceptInvitationResponse();
}

AccessControlList _$AccessControlListFromJson(Map<String, dynamic> json) {
  return AccessControlList(
    allowsPublicReadAccess: json['allowsPublicReadAccess'] as bool,
    allowsPublicWriteAccess: json['allowsPublicWriteAccess'] as bool,
  );
}

Map<String, dynamic> _$AccountDetailToJson(AccountDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountId', instance.accountId);
  writeNotNull('email', instance.email);
  return val;
}

AccountLevelPermissions _$AccountLevelPermissionsFromJson(
    Map<String, dynamic> json) {
  return AccountLevelPermissions(
    blockPublicAccess: json['blockPublicAccess'] == null
        ? null
        : BlockPublicAccess.fromJson(
            json['blockPublicAccess'] as Map<String, dynamic>),
  );
}

AdminAccount _$AdminAccountFromJson(Map<String, dynamic> json) {
  return AdminAccount(
    accountId: json['accountId'] as String,
    status: _$enumDecodeNullable(_$AdminStatusEnumMap, json['status']),
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

const _$AdminStatusEnumMap = {
  AdminStatus.enabled: 'ENABLED',
  AdminStatus.disablingInProgress: 'DISABLING_IN_PROGRESS',
};

ApiCallDetails _$ApiCallDetailsFromJson(Map<String, dynamic> json) {
  return ApiCallDetails(
    api: json['api'] as String,
    apiServiceName: json['apiServiceName'] as String,
    firstSeen: const IsoDateTimeConverter().fromJson(json['firstSeen']),
    lastSeen: const IsoDateTimeConverter().fromJson(json['lastSeen']),
  );
}

AssumedRole _$AssumedRoleFromJson(Map<String, dynamic> json) {
  return AssumedRole(
    accessKeyId: json['accessKeyId'] as String,
    accountId: json['accountId'] as String,
    arn: json['arn'] as String,
    principalId: json['principalId'] as String,
    sessionContext: json['sessionContext'] == null
        ? null
        : SessionContext.fromJson(
            json['sessionContext'] as Map<String, dynamic>),
  );
}

AwsAccount _$AwsAccountFromJson(Map<String, dynamic> json) {
  return AwsAccount(
    accountId: json['accountId'] as String,
    principalId: json['principalId'] as String,
  );
}

AwsService _$AwsServiceFromJson(Map<String, dynamic> json) {
  return AwsService(
    invokedBy: json['invokedBy'] as String,
  );
}

BatchGetCustomDataIdentifierSummary
    _$BatchGetCustomDataIdentifierSummaryFromJson(Map<String, dynamic> json) {
  return BatchGetCustomDataIdentifierSummary(
    arn: json['arn'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    deleted: json['deleted'] as bool,
    description: json['description'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

BatchGetCustomDataIdentifiersResponse
    _$BatchGetCustomDataIdentifiersResponseFromJson(Map<String, dynamic> json) {
  return BatchGetCustomDataIdentifiersResponse(
    customDataIdentifiers: (json['customDataIdentifiers'] as List)
        ?.map((e) => e == null
            ? null
            : BatchGetCustomDataIdentifierSummary.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    notFoundIdentifierIds: (json['notFoundIdentifierIds'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

BlockPublicAccess _$BlockPublicAccessFromJson(Map<String, dynamic> json) {
  return BlockPublicAccess(
    blockPublicAcls: json['blockPublicAcls'] as bool,
    blockPublicPolicy: json['blockPublicPolicy'] as bool,
    ignorePublicAcls: json['ignorePublicAcls'] as bool,
    restrictPublicBuckets: json['restrictPublicBuckets'] as bool,
  );
}

BucketCountByEffectivePermission _$BucketCountByEffectivePermissionFromJson(
    Map<String, dynamic> json) {
  return BucketCountByEffectivePermission(
    publiclyAccessible: json['publiclyAccessible'] as int,
    publiclyReadable: json['publiclyReadable'] as int,
    publiclyWritable: json['publiclyWritable'] as int,
    unknown: json['unknown'] as int,
  );
}

BucketCountByEncryptionType _$BucketCountByEncryptionTypeFromJson(
    Map<String, dynamic> json) {
  return BucketCountByEncryptionType(
    kmsManaged: json['kmsManaged'] as int,
    s3Managed: json['s3Managed'] as int,
    unencrypted: json['unencrypted'] as int,
  );
}

BucketCountBySharedAccessType _$BucketCountBySharedAccessTypeFromJson(
    Map<String, dynamic> json) {
  return BucketCountBySharedAccessType(
    external: json['external'] as int,
    internal: json['internal'] as int,
    notShared: json['notShared'] as int,
    unknown: json['unknown'] as int,
  );
}

Map<String, dynamic> _$BucketCriteriaAdditionalPropertiesToJson(
    BucketCriteriaAdditionalProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eq', instance.eq);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('neq', instance.neq);
  writeNotNull('prefix', instance.prefix);
  return val;
}

BucketLevelPermissions _$BucketLevelPermissionsFromJson(
    Map<String, dynamic> json) {
  return BucketLevelPermissions(
    accessControlList: json['accessControlList'] == null
        ? null
        : AccessControlList.fromJson(
            json['accessControlList'] as Map<String, dynamic>),
    blockPublicAccess: json['blockPublicAccess'] == null
        ? null
        : BlockPublicAccess.fromJson(
            json['blockPublicAccess'] as Map<String, dynamic>),
    bucketPolicy: json['bucketPolicy'] == null
        ? null
        : BucketPolicy.fromJson(json['bucketPolicy'] as Map<String, dynamic>),
  );
}

BucketMetadata _$BucketMetadataFromJson(Map<String, dynamic> json) {
  return BucketMetadata(
    accountId: json['accountId'] as String,
    bucketArn: json['bucketArn'] as String,
    bucketCreatedAt:
        const IsoDateTimeConverter().fromJson(json['bucketCreatedAt']),
    bucketName: json['bucketName'] as String,
    classifiableObjectCount: json['classifiableObjectCount'] as int,
    classifiableSizeInBytes: json['classifiableSizeInBytes'] as int,
    jobDetails: json['jobDetails'] == null
        ? null
        : JobDetails.fromJson(json['jobDetails'] as Map<String, dynamic>),
    lastUpdated: const IsoDateTimeConverter().fromJson(json['lastUpdated']),
    objectCount: json['objectCount'] as int,
    objectCountByEncryptionType: json['objectCountByEncryptionType'] == null
        ? null
        : ObjectCountByEncryptionType.fromJson(
            json['objectCountByEncryptionType'] as Map<String, dynamic>),
    publicAccess: json['publicAccess'] == null
        ? null
        : BucketPublicAccess.fromJson(
            json['publicAccess'] as Map<String, dynamic>),
    region: json['region'] as String,
    replicationDetails: json['replicationDetails'] == null
        ? null
        : ReplicationDetails.fromJson(
            json['replicationDetails'] as Map<String, dynamic>),
    sharedAccess:
        _$enumDecodeNullable(_$SharedAccessEnumMap, json['sharedAccess']),
    sizeInBytes: json['sizeInBytes'] as int,
    sizeInBytesCompressed: json['sizeInBytesCompressed'] as int,
    tags: (json['tags'] as List)
        ?.map((e) =>
            e == null ? null : KeyValuePair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unclassifiableObjectCount: json['unclassifiableObjectCount'] == null
        ? null
        : ObjectLevelStatistics.fromJson(
            json['unclassifiableObjectCount'] as Map<String, dynamic>),
    unclassifiableObjectSizeInBytes: json['unclassifiableObjectSizeInBytes'] ==
            null
        ? null
        : ObjectLevelStatistics.fromJson(
            json['unclassifiableObjectSizeInBytes'] as Map<String, dynamic>),
    versioning: json['versioning'] as bool,
  );
}

const _$SharedAccessEnumMap = {
  SharedAccess.external: 'EXTERNAL',
  SharedAccess.internal: 'INTERNAL',
  SharedAccess.notShared: 'NOT_SHARED',
  SharedAccess.unknown: 'UNKNOWN',
};

BucketPermissionConfiguration _$BucketPermissionConfigurationFromJson(
    Map<String, dynamic> json) {
  return BucketPermissionConfiguration(
    accountLevelPermissions: json['accountLevelPermissions'] == null
        ? null
        : AccountLevelPermissions.fromJson(
            json['accountLevelPermissions'] as Map<String, dynamic>),
    bucketLevelPermissions: json['bucketLevelPermissions'] == null
        ? null
        : BucketLevelPermissions.fromJson(
            json['bucketLevelPermissions'] as Map<String, dynamic>),
  );
}

BucketPolicy _$BucketPolicyFromJson(Map<String, dynamic> json) {
  return BucketPolicy(
    allowsPublicReadAccess: json['allowsPublicReadAccess'] as bool,
    allowsPublicWriteAccess: json['allowsPublicWriteAccess'] as bool,
  );
}

BucketPublicAccess _$BucketPublicAccessFromJson(Map<String, dynamic> json) {
  return BucketPublicAccess(
    effectivePermission: _$enumDecodeNullable(
        _$EffectivePermissionEnumMap, json['effectivePermission']),
    permissionConfiguration: json['permissionConfiguration'] == null
        ? null
        : BucketPermissionConfiguration.fromJson(
            json['permissionConfiguration'] as Map<String, dynamic>),
  );
}

const _$EffectivePermissionEnumMap = {
  EffectivePermission.public: 'PUBLIC',
  EffectivePermission.notPublic: 'NOT_PUBLIC',
  EffectivePermission.unknown: 'UNKNOWN',
};

Map<String, dynamic> _$BucketSortCriteriaToJson(BucketSortCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attributeName', instance.attributeName);
  writeNotNull('orderBy', _$OrderByEnumMap[instance.orderBy]);
  return val;
}

const _$OrderByEnumMap = {
  OrderBy.asc: 'ASC',
  OrderBy.desc: 'DESC',
};

Cell _$CellFromJson(Map<String, dynamic> json) {
  return Cell(
    cellReference: json['cellReference'] as String,
    column: json['column'] as int,
    columnName: json['columnName'] as String,
    row: json['row'] as int,
  );
}

ClassificationDetails _$ClassificationDetailsFromJson(
    Map<String, dynamic> json) {
  return ClassificationDetails(
    detailedResultsLocation: json['detailedResultsLocation'] as String,
    jobArn: json['jobArn'] as String,
    jobId: json['jobId'] as String,
    result: json['result'] == null
        ? null
        : ClassificationResult.fromJson(json['result'] as Map<String, dynamic>),
  );
}

ClassificationExportConfiguration _$ClassificationExportConfigurationFromJson(
    Map<String, dynamic> json) {
  return ClassificationExportConfiguration(
    s3Destination: json['s3Destination'] == null
        ? null
        : S3Destination.fromJson(json['s3Destination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ClassificationExportConfigurationToJson(
    ClassificationExportConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('s3Destination', instance.s3Destination?.toJson());
  return val;
}

ClassificationResult _$ClassificationResultFromJson(Map<String, dynamic> json) {
  return ClassificationResult(
    additionalOccurrences: json['additionalOccurrences'] as bool,
    customDataIdentifiers: json['customDataIdentifiers'] == null
        ? null
        : CustomDataIdentifiers.fromJson(
            json['customDataIdentifiers'] as Map<String, dynamic>),
    mimeType: json['mimeType'] as String,
    sensitiveData: (json['sensitiveData'] as List)
        ?.map((e) => e == null
            ? null
            : SensitiveDataItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sizeClassified: json['sizeClassified'] as int,
    status: json['status'] == null
        ? null
        : ClassificationResultStatus.fromJson(
            json['status'] as Map<String, dynamic>),
  );
}

ClassificationResultStatus _$ClassificationResultStatusFromJson(
    Map<String, dynamic> json) {
  return ClassificationResultStatus(
    code: json['code'] as String,
    reason: json['reason'] as String,
  );
}

CreateClassificationJobResponse _$CreateClassificationJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateClassificationJobResponse(
    jobArn: json['jobArn'] as String,
    jobId: json['jobId'] as String,
  );
}

CreateCustomDataIdentifierResponse _$CreateCustomDataIdentifierResponseFromJson(
    Map<String, dynamic> json) {
  return CreateCustomDataIdentifierResponse(
    customDataIdentifierId: json['customDataIdentifierId'] as String,
  );
}

CreateFindingsFilterResponse _$CreateFindingsFilterResponseFromJson(
    Map<String, dynamic> json) {
  return CreateFindingsFilterResponse(
    arn: json['arn'] as String,
    id: json['id'] as String,
  );
}

CreateInvitationsResponse _$CreateInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return CreateInvitationsResponse(
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateMemberResponse _$CreateMemberResponseFromJson(Map<String, dynamic> json) {
  return CreateMemberResponse(
    arn: json['arn'] as String,
  );
}

CreateSampleFindingsResponse _$CreateSampleFindingsResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSampleFindingsResponse();
}

CriterionAdditionalProperties _$CriterionAdditionalPropertiesFromJson(
    Map<String, dynamic> json) {
  return CriterionAdditionalProperties(
    eq: (json['eq'] as List)?.map((e) => e as String)?.toList(),
    eqExactMatch:
        (json['eqExactMatch'] as List)?.map((e) => e as String)?.toList(),
    gt: json['gt'] as int,
    gte: json['gte'] as int,
    lt: json['lt'] as int,
    lte: json['lte'] as int,
    neq: (json['neq'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CriterionAdditionalPropertiesToJson(
    CriterionAdditionalProperties instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eq', instance.eq);
  writeNotNull('eqExactMatch', instance.eqExactMatch);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('neq', instance.neq);
  return val;
}

CustomDataIdentifierSummary _$CustomDataIdentifierSummaryFromJson(
    Map<String, dynamic> json) {
  return CustomDataIdentifierSummary(
    arn: json['arn'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    description: json['description'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

CustomDataIdentifiers _$CustomDataIdentifiersFromJson(
    Map<String, dynamic> json) {
  return CustomDataIdentifiers(
    detections: (json['detections'] as List)
        ?.map((e) => e == null
            ? null
            : CustomDetection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalCount: json['totalCount'] as int,
  );
}

CustomDetection _$CustomDetectionFromJson(Map<String, dynamic> json) {
  return CustomDetection(
    arn: json['arn'] as String,
    count: json['count'] as int,
    name: json['name'] as String,
    occurrences: json['occurrences'] == null
        ? null
        : Occurrences.fromJson(json['occurrences'] as Map<String, dynamic>),
  );
}

DailySchedule _$DailyScheduleFromJson(Map<String, dynamic> json) {
  return DailySchedule();
}

Map<String, dynamic> _$DailyScheduleToJson(DailySchedule instance) =>
    <String, dynamic>{};

DeclineInvitationsResponse _$DeclineInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return DeclineInvitationsResponse(
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DefaultDetection _$DefaultDetectionFromJson(Map<String, dynamic> json) {
  return DefaultDetection(
    count: json['count'] as int,
    occurrences: json['occurrences'] == null
        ? null
        : Occurrences.fromJson(json['occurrences'] as Map<String, dynamic>),
    type: json['type'] as String,
  );
}

DeleteCustomDataIdentifierResponse _$DeleteCustomDataIdentifierResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteCustomDataIdentifierResponse();
}

DeleteFindingsFilterResponse _$DeleteFindingsFilterResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteFindingsFilterResponse();
}

DeleteInvitationsResponse _$DeleteInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteInvitationsResponse(
    unprocessedAccounts: (json['unprocessedAccounts'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteMemberResponse _$DeleteMemberResponseFromJson(Map<String, dynamic> json) {
  return DeleteMemberResponse();
}

DescribeBucketsResponse _$DescribeBucketsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeBucketsResponse(
    buckets: (json['buckets'] as List)
        ?.map((e) => e == null
            ? null
            : BucketMetadata.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

DescribeClassificationJobResponse _$DescribeClassificationJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeClassificationJobResponse(
    clientToken: json['clientToken'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    customDataIdentifierIds: (json['customDataIdentifierIds'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    description: json['description'] as String,
    initialRun: json['initialRun'] as bool,
    jobArn: json['jobArn'] as String,
    jobId: json['jobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['jobStatus']),
    jobType: _$enumDecodeNullable(_$JobTypeEnumMap, json['jobType']),
    lastRunErrorStatus: json['lastRunErrorStatus'] == null
        ? null
        : LastRunErrorStatus.fromJson(
            json['lastRunErrorStatus'] as Map<String, dynamic>),
    lastRunTime: const IsoDateTimeConverter().fromJson(json['lastRunTime']),
    name: json['name'] as String,
    s3JobDefinition: json['s3JobDefinition'] == null
        ? null
        : S3JobDefinition.fromJson(
            json['s3JobDefinition'] as Map<String, dynamic>),
    samplingPercentage: json['samplingPercentage'] as int,
    scheduleFrequency: json['scheduleFrequency'] == null
        ? null
        : JobScheduleFrequency.fromJson(
            json['scheduleFrequency'] as Map<String, dynamic>),
    statistics: json['statistics'] == null
        ? null
        : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    userPausedDetails: json['userPausedDetails'] == null
        ? null
        : UserPausedDetails.fromJson(
            json['userPausedDetails'] as Map<String, dynamic>),
  );
}

const _$JobStatusEnumMap = {
  JobStatus.running: 'RUNNING',
  JobStatus.paused: 'PAUSED',
  JobStatus.cancelled: 'CANCELLED',
  JobStatus.complete: 'COMPLETE',
  JobStatus.idle: 'IDLE',
  JobStatus.userPaused: 'USER_PAUSED',
};

const _$JobTypeEnumMap = {
  JobType.oneTime: 'ONE_TIME',
  JobType.scheduled: 'SCHEDULED',
};

DescribeOrganizationConfigurationResponse
    _$DescribeOrganizationConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeOrganizationConfigurationResponse(
    autoEnable: json['autoEnable'] as bool,
    maxAccountLimitReached: json['maxAccountLimitReached'] as bool,
  );
}

DisableMacieResponse _$DisableMacieResponseFromJson(Map<String, dynamic> json) {
  return DisableMacieResponse();
}

DisableOrganizationAdminAccountResponse
    _$DisableOrganizationAdminAccountResponseFromJson(
        Map<String, dynamic> json) {
  return DisableOrganizationAdminAccountResponse();
}

DisassociateFromMasterAccountResponse
    _$DisassociateFromMasterAccountResponseFromJson(Map<String, dynamic> json) {
  return DisassociateFromMasterAccountResponse();
}

DisassociateMemberResponse _$DisassociateMemberResponseFromJson(
    Map<String, dynamic> json) {
  return DisassociateMemberResponse();
}

DomainDetails _$DomainDetailsFromJson(Map<String, dynamic> json) {
  return DomainDetails(
    domainName: json['domainName'] as String,
  );
}

EnableMacieResponse _$EnableMacieResponseFromJson(Map<String, dynamic> json) {
  return EnableMacieResponse();
}

EnableOrganizationAdminAccountResponse
    _$EnableOrganizationAdminAccountResponseFromJson(
        Map<String, dynamic> json) {
  return EnableOrganizationAdminAccountResponse();
}

FederatedUser _$FederatedUserFromJson(Map<String, dynamic> json) {
  return FederatedUser(
    accessKeyId: json['accessKeyId'] as String,
    accountId: json['accountId'] as String,
    arn: json['arn'] as String,
    principalId: json['principalId'] as String,
    sessionContext: json['sessionContext'] == null
        ? null
        : SessionContext.fromJson(
            json['sessionContext'] as Map<String, dynamic>),
  );
}

Finding _$FindingFromJson(Map<String, dynamic> json) {
  return Finding(
    accountId: json['accountId'] as String,
    archived: json['archived'] as bool,
    category: _$enumDecodeNullable(_$FindingCategoryEnumMap, json['category']),
    classificationDetails: json['classificationDetails'] == null
        ? null
        : ClassificationDetails.fromJson(
            json['classificationDetails'] as Map<String, dynamic>),
    count: json['count'] as int,
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    description: json['description'] as String,
    id: json['id'] as String,
    partition: json['partition'] as String,
    policyDetails: json['policyDetails'] == null
        ? null
        : PolicyDetails.fromJson(json['policyDetails'] as Map<String, dynamic>),
    region: json['region'] as String,
    resourcesAffected: json['resourcesAffected'] == null
        ? null
        : ResourcesAffected.fromJson(
            json['resourcesAffected'] as Map<String, dynamic>),
    sample: json['sample'] as bool,
    schemaVersion: json['schemaVersion'] as String,
    severity: json['severity'] == null
        ? null
        : Severity.fromJson(json['severity'] as Map<String, dynamic>),
    title: json['title'] as String,
    type: _$enumDecodeNullable(_$FindingTypeEnumMap, json['type']),
    updatedAt: const IsoDateTimeConverter().fromJson(json['updatedAt']),
  );
}

const _$FindingCategoryEnumMap = {
  FindingCategory.classification: 'CLASSIFICATION',
  FindingCategory.policy: 'POLICY',
};

const _$FindingTypeEnumMap = {
  FindingType.sensitiveDataS3ObjectMultiple: 'SensitiveData:S3Object/Multiple',
  FindingType.sensitiveDataS3ObjectFinancial:
      'SensitiveData:S3Object/Financial',
  FindingType.sensitiveDataS3ObjectPersonal: 'SensitiveData:S3Object/Personal',
  FindingType.sensitiveDataS3ObjectCredentials:
      'SensitiveData:S3Object/Credentials',
  FindingType.sensitiveDataS3ObjectCustomIdentifier:
      'SensitiveData:S3Object/CustomIdentifier',
  FindingType.policyIAMUserS3BucketPublic: 'Policy:IAMUser/S3BucketPublic',
  FindingType.policyIAMUserS3BucketSharedExternally:
      'Policy:IAMUser/S3BucketSharedExternally',
  FindingType.policyIAMUserS3BucketReplicatedExternally:
      'Policy:IAMUser/S3BucketReplicatedExternally',
  FindingType.policyIAMUserS3BucketEncryptionDisabled:
      'Policy:IAMUser/S3BucketEncryptionDisabled',
  FindingType.policyIAMUserS3BlockPublicAccessDisabled:
      'Policy:IAMUser/S3BlockPublicAccessDisabled',
};

FindingAction _$FindingActionFromJson(Map<String, dynamic> json) {
  return FindingAction(
    actionType:
        _$enumDecodeNullable(_$FindingActionTypeEnumMap, json['actionType']),
    apiCallDetails: json['apiCallDetails'] == null
        ? null
        : ApiCallDetails.fromJson(
            json['apiCallDetails'] as Map<String, dynamic>),
  );
}

const _$FindingActionTypeEnumMap = {
  FindingActionType.awsApiCall: 'AWS_API_CALL',
};

FindingActor _$FindingActorFromJson(Map<String, dynamic> json) {
  return FindingActor(
    domainDetails: json['domainDetails'] == null
        ? null
        : DomainDetails.fromJson(json['domainDetails'] as Map<String, dynamic>),
    ipAddressDetails: json['ipAddressDetails'] == null
        ? null
        : IpAddressDetails.fromJson(
            json['ipAddressDetails'] as Map<String, dynamic>),
    userIdentity: json['userIdentity'] == null
        ? null
        : UserIdentity.fromJson(json['userIdentity'] as Map<String, dynamic>),
  );
}

FindingCriteria _$FindingCriteriaFromJson(Map<String, dynamic> json) {
  return FindingCriteria(
    criterion: (json['criterion'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : CriterionAdditionalProperties.fromJson(
                  e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$FindingCriteriaToJson(FindingCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'criterion', instance.criterion?.map((k, e) => MapEntry(k, e?.toJson())));
  return val;
}

Map<String, dynamic> _$FindingStatisticsSortCriteriaToJson(
    FindingStatisticsSortCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attributeName',
      _$FindingStatisticsSortAttributeNameEnumMap[instance.attributeName]);
  writeNotNull('orderBy', _$OrderByEnumMap[instance.orderBy]);
  return val;
}

const _$FindingStatisticsSortAttributeNameEnumMap = {
  FindingStatisticsSortAttributeName.groupKey: 'groupKey',
  FindingStatisticsSortAttributeName.count: 'count',
};

FindingsFilterListItem _$FindingsFilterListItemFromJson(
    Map<String, dynamic> json) {
  return FindingsFilterListItem(
    action: _$enumDecodeNullable(_$FindingsFilterActionEnumMap, json['action']),
    arn: json['arn'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$FindingsFilterActionEnumMap = {
  FindingsFilterAction.archive: 'ARCHIVE',
  FindingsFilterAction.noop: 'NOOP',
};

GetBucketStatisticsResponse _$GetBucketStatisticsResponseFromJson(
    Map<String, dynamic> json) {
  return GetBucketStatisticsResponse(
    bucketCount: json['bucketCount'] as int,
    bucketCountByEffectivePermission:
        json['bucketCountByEffectivePermission'] == null
            ? null
            : BucketCountByEffectivePermission.fromJson(
                json['bucketCountByEffectivePermission']
                    as Map<String, dynamic>),
    bucketCountByEncryptionType: json['bucketCountByEncryptionType'] == null
        ? null
        : BucketCountByEncryptionType.fromJson(
            json['bucketCountByEncryptionType'] as Map<String, dynamic>),
    bucketCountBySharedAccessType: json['bucketCountBySharedAccessType'] == null
        ? null
        : BucketCountBySharedAccessType.fromJson(
            json['bucketCountBySharedAccessType'] as Map<String, dynamic>),
    classifiableObjectCount: json['classifiableObjectCount'] as int,
    classifiableSizeInBytes: json['classifiableSizeInBytes'] as int,
    lastUpdated: const IsoDateTimeConverter().fromJson(json['lastUpdated']),
    objectCount: json['objectCount'] as int,
    sizeInBytes: json['sizeInBytes'] as int,
    sizeInBytesCompressed: json['sizeInBytesCompressed'] as int,
    unclassifiableObjectCount: json['unclassifiableObjectCount'] == null
        ? null
        : ObjectLevelStatistics.fromJson(
            json['unclassifiableObjectCount'] as Map<String, dynamic>),
    unclassifiableObjectSizeInBytes: json['unclassifiableObjectSizeInBytes'] ==
            null
        ? null
        : ObjectLevelStatistics.fromJson(
            json['unclassifiableObjectSizeInBytes'] as Map<String, dynamic>),
  );
}

GetClassificationExportConfigurationResponse
    _$GetClassificationExportConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return GetClassificationExportConfigurationResponse(
    configuration: json['configuration'] == null
        ? null
        : ClassificationExportConfiguration.fromJson(
            json['configuration'] as Map<String, dynamic>),
  );
}

GetCustomDataIdentifierResponse _$GetCustomDataIdentifierResponseFromJson(
    Map<String, dynamic> json) {
  return GetCustomDataIdentifierResponse(
    arn: json['arn'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    deleted: json['deleted'] as bool,
    description: json['description'] as String,
    id: json['id'] as String,
    ignoreWords:
        (json['ignoreWords'] as List)?.map((e) => e as String)?.toList(),
    keywords: (json['keywords'] as List)?.map((e) => e as String)?.toList(),
    maximumMatchDistance: json['maximumMatchDistance'] as int,
    name: json['name'] as String,
    regex: json['regex'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetFindingStatisticsResponse _$GetFindingStatisticsResponseFromJson(
    Map<String, dynamic> json) {
  return GetFindingStatisticsResponse(
    countsByGroup: (json['countsByGroup'] as List)
        ?.map((e) =>
            e == null ? null : GroupCount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetFindingsFilterResponse _$GetFindingsFilterResponseFromJson(
    Map<String, dynamic> json) {
  return GetFindingsFilterResponse(
    action: _$enumDecodeNullable(_$FindingsFilterActionEnumMap, json['action']),
    arn: json['arn'] as String,
    description: json['description'] as String,
    findingCriteria: json['findingCriteria'] == null
        ? null
        : FindingCriteria.fromJson(
            json['findingCriteria'] as Map<String, dynamic>),
    id: json['id'] as String,
    name: json['name'] as String,
    position: json['position'] as int,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetFindingsResponse _$GetFindingsResponseFromJson(Map<String, dynamic> json) {
  return GetFindingsResponse(
    findings: (json['findings'] as List)
        ?.map((e) =>
            e == null ? null : Finding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetInvitationsCountResponse _$GetInvitationsCountResponseFromJson(
    Map<String, dynamic> json) {
  return GetInvitationsCountResponse(
    invitationsCount: json['invitationsCount'] as int,
  );
}

GetMacieSessionResponse _$GetMacieSessionResponseFromJson(
    Map<String, dynamic> json) {
  return GetMacieSessionResponse(
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    findingPublishingFrequency: _$enumDecodeNullable(
        _$FindingPublishingFrequencyEnumMap,
        json['findingPublishingFrequency']),
    serviceRole: json['serviceRole'] as String,
    status: _$enumDecodeNullable(_$MacieStatusEnumMap, json['status']),
    updatedAt: const IsoDateTimeConverter().fromJson(json['updatedAt']),
  );
}

const _$FindingPublishingFrequencyEnumMap = {
  FindingPublishingFrequency.fifteenMinutes: 'FIFTEEN_MINUTES',
  FindingPublishingFrequency.oneHour: 'ONE_HOUR',
  FindingPublishingFrequency.sixHours: 'SIX_HOURS',
};

const _$MacieStatusEnumMap = {
  MacieStatus.paused: 'PAUSED',
  MacieStatus.enabled: 'ENABLED',
};

GetMasterAccountResponse _$GetMasterAccountResponseFromJson(
    Map<String, dynamic> json) {
  return GetMasterAccountResponse(
    master: json['master'] == null
        ? null
        : Invitation.fromJson(json['master'] as Map<String, dynamic>),
  );
}

GetMemberResponse _$GetMemberResponseFromJson(Map<String, dynamic> json) {
  return GetMemberResponse(
    accountId: json['accountId'] as String,
    arn: json['arn'] as String,
    email: json['email'] as String,
    invitedAt: const IsoDateTimeConverter().fromJson(json['invitedAt']),
    masterAccountId: json['masterAccountId'] as String,
    relationshipStatus: _$enumDecodeNullable(
        _$RelationshipStatusEnumMap, json['relationshipStatus']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    updatedAt: const IsoDateTimeConverter().fromJson(json['updatedAt']),
  );
}

const _$RelationshipStatusEnumMap = {
  RelationshipStatus.enabled: 'Enabled',
  RelationshipStatus.paused: 'Paused',
  RelationshipStatus.invited: 'Invited',
  RelationshipStatus.created: 'Created',
  RelationshipStatus.removed: 'Removed',
  RelationshipStatus.resigned: 'Resigned',
  RelationshipStatus.emailVerificationInProgress: 'EmailVerificationInProgress',
  RelationshipStatus.emailVerificationFailed: 'EmailVerificationFailed',
  RelationshipStatus.regionDisabled: 'RegionDisabled',
  RelationshipStatus.accountSuspended: 'AccountSuspended',
};

GetUsageStatisticsResponse _$GetUsageStatisticsResponseFromJson(
    Map<String, dynamic> json) {
  return GetUsageStatisticsResponse(
    nextToken: json['nextToken'] as String,
    records: (json['records'] as List)
        ?.map((e) =>
            e == null ? null : UsageRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetUsageTotalsResponse _$GetUsageTotalsResponseFromJson(
    Map<String, dynamic> json) {
  return GetUsageTotalsResponse(
    usageTotals: (json['usageTotals'] as List)
        ?.map((e) =>
            e == null ? null : UsageTotal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GroupCount _$GroupCountFromJson(Map<String, dynamic> json) {
  return GroupCount(
    count: json['count'] as int,
    groupKey: json['groupKey'] as String,
  );
}

IamUser _$IamUserFromJson(Map<String, dynamic> json) {
  return IamUser(
    accountId: json['accountId'] as String,
    arn: json['arn'] as String,
    principalId: json['principalId'] as String,
    userName: json['userName'] as String,
  );
}

Invitation _$InvitationFromJson(Map<String, dynamic> json) {
  return Invitation(
    accountId: json['accountId'] as String,
    invitationId: json['invitationId'] as String,
    invitedAt: const IsoDateTimeConverter().fromJson(json['invitedAt']),
    relationshipStatus: _$enumDecodeNullable(
        _$RelationshipStatusEnumMap, json['relationshipStatus']),
  );
}

IpAddressDetails _$IpAddressDetailsFromJson(Map<String, dynamic> json) {
  return IpAddressDetails(
    ipAddressV4: json['ipAddressV4'] as String,
    ipCity: json['ipCity'] == null
        ? null
        : IpCity.fromJson(json['ipCity'] as Map<String, dynamic>),
    ipCountry: json['ipCountry'] == null
        ? null
        : IpCountry.fromJson(json['ipCountry'] as Map<String, dynamic>),
    ipGeoLocation: json['ipGeoLocation'] == null
        ? null
        : IpGeoLocation.fromJson(json['ipGeoLocation'] as Map<String, dynamic>),
    ipOwner: json['ipOwner'] == null
        ? null
        : IpOwner.fromJson(json['ipOwner'] as Map<String, dynamic>),
  );
}

IpCity _$IpCityFromJson(Map<String, dynamic> json) {
  return IpCity(
    name: json['name'] as String,
  );
}

IpCountry _$IpCountryFromJson(Map<String, dynamic> json) {
  return IpCountry(
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

IpGeoLocation _$IpGeoLocationFromJson(Map<String, dynamic> json) {
  return IpGeoLocation(
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
  );
}

IpOwner _$IpOwnerFromJson(Map<String, dynamic> json) {
  return IpOwner(
    asn: json['asn'] as String,
    asnOrg: json['asnOrg'] as String,
    isp: json['isp'] as String,
    org: json['org'] as String,
  );
}

JobDetails _$JobDetailsFromJson(Map<String, dynamic> json) {
  return JobDetails(
    isDefinedInJob:
        _$enumDecodeNullable(_$IsDefinedInJobEnumMap, json['isDefinedInJob']),
    isMonitoredByJob: _$enumDecodeNullable(
        _$IsMonitoredByJobEnumMap, json['isMonitoredByJob']),
    lastJobId: json['lastJobId'] as String,
    lastJobRunTime:
        const IsoDateTimeConverter().fromJson(json['lastJobRunTime']),
  );
}

const _$IsDefinedInJobEnumMap = {
  IsDefinedInJob.$true: 'TRUE',
  IsDefinedInJob.$false: 'FALSE',
  IsDefinedInJob.unknown: 'UNKNOWN',
};

const _$IsMonitoredByJobEnumMap = {
  IsMonitoredByJob.$true: 'TRUE',
  IsMonitoredByJob.$false: 'FALSE',
  IsMonitoredByJob.unknown: 'UNKNOWN',
};

JobScheduleFrequency _$JobScheduleFrequencyFromJson(Map<String, dynamic> json) {
  return JobScheduleFrequency(
    dailySchedule: json['dailySchedule'] == null
        ? null
        : DailySchedule.fromJson(json['dailySchedule'] as Map<String, dynamic>),
    monthlySchedule: json['monthlySchedule'] == null
        ? null
        : MonthlySchedule.fromJson(
            json['monthlySchedule'] as Map<String, dynamic>),
    weeklySchedule: json['weeklySchedule'] == null
        ? null
        : WeeklySchedule.fromJson(
            json['weeklySchedule'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JobScheduleFrequencyToJson(
    JobScheduleFrequency instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dailySchedule', instance.dailySchedule?.toJson());
  writeNotNull('monthlySchedule', instance.monthlySchedule?.toJson());
  writeNotNull('weeklySchedule', instance.weeklySchedule?.toJson());
  return val;
}

JobScopeTerm _$JobScopeTermFromJson(Map<String, dynamic> json) {
  return JobScopeTerm(
    simpleScopeTerm: json['simpleScopeTerm'] == null
        ? null
        : SimpleScopeTerm.fromJson(
            json['simpleScopeTerm'] as Map<String, dynamic>),
    tagScopeTerm: json['tagScopeTerm'] == null
        ? null
        : TagScopeTerm.fromJson(json['tagScopeTerm'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JobScopeTermToJson(JobScopeTerm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('simpleScopeTerm', instance.simpleScopeTerm?.toJson());
  writeNotNull('tagScopeTerm', instance.tagScopeTerm?.toJson());
  return val;
}

JobScopingBlock _$JobScopingBlockFromJson(Map<String, dynamic> json) {
  return JobScopingBlock(
    and: (json['and'] as List)
        ?.map((e) =>
            e == null ? null : JobScopeTerm.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$JobScopingBlockToJson(JobScopingBlock instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('and', instance.and?.map((e) => e?.toJson())?.toList());
  return val;
}

JobSummary _$JobSummaryFromJson(Map<String, dynamic> json) {
  return JobSummary(
    bucketDefinitions: (json['bucketDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : S3BucketDefinitionForJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    jobId: json['jobId'] as String,
    jobStatus: _$enumDecodeNullable(_$JobStatusEnumMap, json['jobStatus']),
    jobType: _$enumDecodeNullable(_$JobTypeEnumMap, json['jobType']),
    lastRunErrorStatus: json['lastRunErrorStatus'] == null
        ? null
        : LastRunErrorStatus.fromJson(
            json['lastRunErrorStatus'] as Map<String, dynamic>),
    name: json['name'] as String,
    userPausedDetails: json['userPausedDetails'] == null
        ? null
        : UserPausedDetails.fromJson(
            json['userPausedDetails'] as Map<String, dynamic>),
  );
}

KeyValuePair _$KeyValuePairFromJson(Map<String, dynamic> json) {
  return KeyValuePair(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

LastRunErrorStatus _$LastRunErrorStatusFromJson(Map<String, dynamic> json) {
  return LastRunErrorStatus(
    code: _$enumDecodeNullable(_$LastRunErrorStatusCodeEnumMap, json['code']),
  );
}

const _$LastRunErrorStatusCodeEnumMap = {
  LastRunErrorStatusCode.none: 'NONE',
  LastRunErrorStatusCode.error: 'ERROR',
};

ListClassificationJobsResponse _$ListClassificationJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListClassificationJobsResponse(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : JobSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListCustomDataIdentifiersResponse _$ListCustomDataIdentifiersResponseFromJson(
    Map<String, dynamic> json) {
  return ListCustomDataIdentifiersResponse(
    items: (json['items'] as List)
        ?.map((e) => e == null
            ? null
            : CustomDataIdentifierSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListFindingsFiltersResponse _$ListFindingsFiltersResponseFromJson(
    Map<String, dynamic> json) {
  return ListFindingsFiltersResponse(
    findingsFilterListItems: (json['findingsFilterListItems'] as List)
        ?.map((e) => e == null
            ? null
            : FindingsFilterListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListFindingsResponse _$ListFindingsResponseFromJson(Map<String, dynamic> json) {
  return ListFindingsResponse(
    findingIds: (json['findingIds'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListInvitationsResponse _$ListInvitationsResponseFromJson(
    Map<String, dynamic> json) {
  return ListInvitationsResponse(
    invitations: (json['invitations'] as List)
        ?.map((e) =>
            e == null ? null : Invitation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$ListJobsFilterCriteriaToJson(
    ListJobsFilterCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'excludes', instance.excludes?.map((e) => e?.toJson())?.toList());
  writeNotNull(
      'includes', instance.includes?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$ListJobsFilterTermToJson(ListJobsFilterTerm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comparator', _$JobComparatorEnumMap[instance.comparator]);
  writeNotNull('key', _$ListJobsFilterKeyEnumMap[instance.key]);
  writeNotNull('values', instance.values);
  return val;
}

const _$JobComparatorEnumMap = {
  JobComparator.eq: 'EQ',
  JobComparator.gt: 'GT',
  JobComparator.gte: 'GTE',
  JobComparator.lt: 'LT',
  JobComparator.lte: 'LTE',
  JobComparator.ne: 'NE',
  JobComparator.contains: 'CONTAINS',
};

const _$ListJobsFilterKeyEnumMap = {
  ListJobsFilterKey.jobType: 'jobType',
  ListJobsFilterKey.jobStatus: 'jobStatus',
  ListJobsFilterKey.createdAt: 'createdAt',
  ListJobsFilterKey.name: 'name',
};

Map<String, dynamic> _$ListJobsSortCriteriaToJson(
    ListJobsSortCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attributeName',
      _$ListJobsSortAttributeNameEnumMap[instance.attributeName]);
  writeNotNull('orderBy', _$OrderByEnumMap[instance.orderBy]);
  return val;
}

const _$ListJobsSortAttributeNameEnumMap = {
  ListJobsSortAttributeName.createdAt: 'createdAt',
  ListJobsSortAttributeName.jobStatus: 'jobStatus',
  ListJobsSortAttributeName.name: 'name',
  ListJobsSortAttributeName.jobType: 'jobType',
};

ListMembersResponse _$ListMembersResponseFromJson(Map<String, dynamic> json) {
  return ListMembersResponse(
    members: (json['members'] as List)
        ?.map((e) =>
            e == null ? null : Member.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListOrganizationAdminAccountsResponse
    _$ListOrganizationAdminAccountsResponseFromJson(Map<String, dynamic> json) {
  return ListOrganizationAdminAccountsResponse(
    adminAccounts: (json['adminAccounts'] as List)
        ?.map((e) =>
            e == null ? null : AdminAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    accountId: json['accountId'] as String,
    arn: json['arn'] as String,
    email: json['email'] as String,
    invitedAt: const IsoDateTimeConverter().fromJson(json['invitedAt']),
    masterAccountId: json['masterAccountId'] as String,
    relationshipStatus: _$enumDecodeNullable(
        _$RelationshipStatusEnumMap, json['relationshipStatus']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    updatedAt: const IsoDateTimeConverter().fromJson(json['updatedAt']),
  );
}

MonthlySchedule _$MonthlyScheduleFromJson(Map<String, dynamic> json) {
  return MonthlySchedule(
    dayOfMonth: json['dayOfMonth'] as int,
  );
}

Map<String, dynamic> _$MonthlyScheduleToJson(MonthlySchedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dayOfMonth', instance.dayOfMonth);
  return val;
}

ObjectCountByEncryptionType _$ObjectCountByEncryptionTypeFromJson(
    Map<String, dynamic> json) {
  return ObjectCountByEncryptionType(
    customerManaged: json['customerManaged'] as int,
    kmsManaged: json['kmsManaged'] as int,
    s3Managed: json['s3Managed'] as int,
    unencrypted: json['unencrypted'] as int,
  );
}

ObjectLevelStatistics _$ObjectLevelStatisticsFromJson(
    Map<String, dynamic> json) {
  return ObjectLevelStatistics(
    fileType: json['fileType'] as int,
    storageClass: json['storageClass'] as int,
    total: json['total'] as int,
  );
}

Occurrences _$OccurrencesFromJson(Map<String, dynamic> json) {
  return Occurrences(
    cells: (json['cells'] as List)
        ?.map(
            (e) => e == null ? null : Cell.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    lineRanges: (json['lineRanges'] as List)
        ?.map(
            (e) => e == null ? null : Range.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    offsetRanges: (json['offsetRanges'] as List)
        ?.map(
            (e) => e == null ? null : Range.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pages: (json['pages'] as List)
        ?.map(
            (e) => e == null ? null : Page.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    records: (json['records'] as List)
        ?.map((e) =>
            e == null ? null : Record.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Page _$PageFromJson(Map<String, dynamic> json) {
  return Page(
    lineRange: json['lineRange'] == null
        ? null
        : Range.fromJson(json['lineRange'] as Map<String, dynamic>),
    offsetRange: json['offsetRange'] == null
        ? null
        : Range.fromJson(json['offsetRange'] as Map<String, dynamic>),
    pageNumber: json['pageNumber'] as int,
  );
}

PolicyDetails _$PolicyDetailsFromJson(Map<String, dynamic> json) {
  return PolicyDetails(
    action: json['action'] == null
        ? null
        : FindingAction.fromJson(json['action'] as Map<String, dynamic>),
    actor: json['actor'] == null
        ? null
        : FindingActor.fromJson(json['actor'] as Map<String, dynamic>),
  );
}

PutClassificationExportConfigurationResponse
    _$PutClassificationExportConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return PutClassificationExportConfigurationResponse(
    configuration: json['configuration'] == null
        ? null
        : ClassificationExportConfiguration.fromJson(
            json['configuration'] as Map<String, dynamic>),
  );
}

Range _$RangeFromJson(Map<String, dynamic> json) {
  return Range(
    end: json['end'] as int,
    start: json['start'] as int,
    startColumn: json['startColumn'] as int,
  );
}

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record(
    jsonPath: json['jsonPath'] as String,
    recordIndex: json['recordIndex'] as int,
  );
}

ReplicationDetails _$ReplicationDetailsFromJson(Map<String, dynamic> json) {
  return ReplicationDetails(
    replicated: json['replicated'] as bool,
    replicatedExternally: json['replicatedExternally'] as bool,
    replicationAccounts: (json['replicationAccounts'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

ResourcesAffected _$ResourcesAffectedFromJson(Map<String, dynamic> json) {
  return ResourcesAffected(
    s3Bucket: json['s3Bucket'] == null
        ? null
        : S3Bucket.fromJson(json['s3Bucket'] as Map<String, dynamic>),
    s3Object: json['s3Object'] == null
        ? null
        : S3Object.fromJson(json['s3Object'] as Map<String, dynamic>),
  );
}

S3Bucket _$S3BucketFromJson(Map<String, dynamic> json) {
  return S3Bucket(
    arn: json['arn'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    defaultServerSideEncryption: json['defaultServerSideEncryption'] == null
        ? null
        : ServerSideEncryption.fromJson(
            json['defaultServerSideEncryption'] as Map<String, dynamic>),
    name: json['name'] as String,
    owner: json['owner'] == null
        ? null
        : S3BucketOwner.fromJson(json['owner'] as Map<String, dynamic>),
    publicAccess: json['publicAccess'] == null
        ? null
        : BucketPublicAccess.fromJson(
            json['publicAccess'] as Map<String, dynamic>),
    tags: (json['tags'] as List)
        ?.map((e) =>
            e == null ? null : KeyValuePair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

S3BucketDefinitionForJob _$S3BucketDefinitionForJobFromJson(
    Map<String, dynamic> json) {
  return S3BucketDefinitionForJob(
    accountId: json['accountId'] as String,
    buckets: (json['buckets'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$S3BucketDefinitionForJobToJson(
    S3BucketDefinitionForJob instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountId', instance.accountId);
  writeNotNull('buckets', instance.buckets);
  return val;
}

S3BucketOwner _$S3BucketOwnerFromJson(Map<String, dynamic> json) {
  return S3BucketOwner(
    displayName: json['displayName'] as String,
    id: json['id'] as String,
  );
}

S3Destination _$S3DestinationFromJson(Map<String, dynamic> json) {
  return S3Destination(
    bucketName: json['bucketName'] as String,
    kmsKeyArn: json['kmsKeyArn'] as String,
    keyPrefix: json['keyPrefix'] as String,
  );
}

Map<String, dynamic> _$S3DestinationToJson(S3Destination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketName', instance.bucketName);
  writeNotNull('kmsKeyArn', instance.kmsKeyArn);
  writeNotNull('keyPrefix', instance.keyPrefix);
  return val;
}

S3JobDefinition _$S3JobDefinitionFromJson(Map<String, dynamic> json) {
  return S3JobDefinition(
    bucketDefinitions: (json['bucketDefinitions'] as List)
        ?.map((e) => e == null
            ? null
            : S3BucketDefinitionForJob.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    scoping: json['scoping'] == null
        ? null
        : Scoping.fromJson(json['scoping'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$S3JobDefinitionToJson(S3JobDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bucketDefinitions',
      instance.bucketDefinitions?.map((e) => e?.toJson())?.toList());
  writeNotNull('scoping', instance.scoping?.toJson());
  return val;
}

S3Object _$S3ObjectFromJson(Map<String, dynamic> json) {
  return S3Object(
    bucketArn: json['bucketArn'] as String,
    eTag: json['eTag'] as String,
    extension: json['extension'] as String,
    key: json['key'] as String,
    lastModified: const IsoDateTimeConverter().fromJson(json['lastModified']),
    path: json['path'] as String,
    publicAccess: json['publicAccess'] as bool,
    serverSideEncryption: json['serverSideEncryption'] == null
        ? null
        : ServerSideEncryption.fromJson(
            json['serverSideEncryption'] as Map<String, dynamic>),
    size: json['size'] as int,
    storageClass:
        _$enumDecodeNullable(_$StorageClassEnumMap, json['storageClass']),
    tags: (json['tags'] as List)
        ?.map((e) =>
            e == null ? null : KeyValuePair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    versionId: json['versionId'] as String,
  );
}

const _$StorageClassEnumMap = {
  StorageClass.standard: 'STANDARD',
  StorageClass.reducedRedundancy: 'REDUCED_REDUNDANCY',
  StorageClass.standardIa: 'STANDARD_IA',
  StorageClass.intelligentTiering: 'INTELLIGENT_TIERING',
  StorageClass.deepArchive: 'DEEP_ARCHIVE',
  StorageClass.onezoneIa: 'ONEZONE_IA',
  StorageClass.glacier: 'GLACIER',
};

Scoping _$ScopingFromJson(Map<String, dynamic> json) {
  return Scoping(
    excludes: json['excludes'] == null
        ? null
        : JobScopingBlock.fromJson(json['excludes'] as Map<String, dynamic>),
    includes: json['includes'] == null
        ? null
        : JobScopingBlock.fromJson(json['includes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ScopingToJson(Scoping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('excludes', instance.excludes?.toJson());
  writeNotNull('includes', instance.includes?.toJson());
  return val;
}

SensitiveDataItem _$SensitiveDataItemFromJson(Map<String, dynamic> json) {
  return SensitiveDataItem(
    category: _$enumDecodeNullable(
        _$SensitiveDataItemCategoryEnumMap, json['category']),
    detections: (json['detections'] as List)
        ?.map((e) => e == null
            ? null
            : DefaultDetection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalCount: json['totalCount'] as int,
  );
}

const _$SensitiveDataItemCategoryEnumMap = {
  SensitiveDataItemCategory.financialInformation: 'FINANCIAL_INFORMATION',
  SensitiveDataItemCategory.personalInformation: 'PERSONAL_INFORMATION',
  SensitiveDataItemCategory.credentials: 'CREDENTIALS',
  SensitiveDataItemCategory.customIdentifier: 'CUSTOM_IDENTIFIER',
};

ServerSideEncryption _$ServerSideEncryptionFromJson(Map<String, dynamic> json) {
  return ServerSideEncryption(
    encryptionType:
        _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['encryptionType']),
    kmsMasterKeyId: json['kmsMasterKeyId'] as String,
  );
}

const _$EncryptionTypeEnumMap = {
  EncryptionType.none: 'NONE',
  EncryptionType.aes256: 'AES256',
  EncryptionType.awsKms: 'aws:kms',
  EncryptionType.unknown: 'UNKNOWN',
};

ServiceLimit _$ServiceLimitFromJson(Map<String, dynamic> json) {
  return ServiceLimit(
    isServiceLimited: json['isServiceLimited'] as bool,
    unit: _$enumDecodeNullable(_$UnitEnumMap, json['unit']),
    value: json['value'] as int,
  );
}

const _$UnitEnumMap = {
  Unit.terabytes: 'TERABYTES',
};

SessionContext _$SessionContextFromJson(Map<String, dynamic> json) {
  return SessionContext(
    attributes: json['attributes'] == null
        ? null
        : SessionContextAttributes.fromJson(
            json['attributes'] as Map<String, dynamic>),
    sessionIssuer: json['sessionIssuer'] == null
        ? null
        : SessionIssuer.fromJson(json['sessionIssuer'] as Map<String, dynamic>),
  );
}

SessionContextAttributes _$SessionContextAttributesFromJson(
    Map<String, dynamic> json) {
  return SessionContextAttributes(
    creationDate: const IsoDateTimeConverter().fromJson(json['creationDate']),
    mfaAuthenticated: json['mfaAuthenticated'] as bool,
  );
}

SessionIssuer _$SessionIssuerFromJson(Map<String, dynamic> json) {
  return SessionIssuer(
    accountId: json['accountId'] as String,
    arn: json['arn'] as String,
    principalId: json['principalId'] as String,
    type: json['type'] as String,
    userName: json['userName'] as String,
  );
}

Severity _$SeverityFromJson(Map<String, dynamic> json) {
  return Severity(
    description:
        _$enumDecodeNullable(_$SeverityDescriptionEnumMap, json['description']),
    score: json['score'] as int,
  );
}

const _$SeverityDescriptionEnumMap = {
  SeverityDescription.low: 'Low',
  SeverityDescription.medium: 'Medium',
  SeverityDescription.high: 'High',
};

SimpleScopeTerm _$SimpleScopeTermFromJson(Map<String, dynamic> json) {
  return SimpleScopeTerm(
    comparator:
        _$enumDecodeNullable(_$JobComparatorEnumMap, json['comparator']),
    key: _$enumDecodeNullable(_$ScopeFilterKeyEnumMap, json['key']),
    values: (json['values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SimpleScopeTermToJson(SimpleScopeTerm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comparator', _$JobComparatorEnumMap[instance.comparator]);
  writeNotNull('key', _$ScopeFilterKeyEnumMap[instance.key]);
  writeNotNull('values', instance.values);
  return val;
}

const _$ScopeFilterKeyEnumMap = {
  ScopeFilterKey.bucketCreationDate: 'BUCKET_CREATION_DATE',
  ScopeFilterKey.objectExtension: 'OBJECT_EXTENSION',
  ScopeFilterKey.objectLastModifiedDate: 'OBJECT_LAST_MODIFIED_DATE',
  ScopeFilterKey.objectSize: 'OBJECT_SIZE',
  ScopeFilterKey.tag: 'TAG',
};

Map<String, dynamic> _$SortCriteriaToJson(SortCriteria instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attributeName', instance.attributeName);
  writeNotNull('orderBy', _$OrderByEnumMap[instance.orderBy]);
  return val;
}

Statistics _$StatisticsFromJson(Map<String, dynamic> json) {
  return Statistics(
    approximateNumberOfObjectsToProcess:
        (json['approximateNumberOfObjectsToProcess'] as num)?.toDouble(),
    numberOfRuns: (json['numberOfRuns'] as num)?.toDouble(),
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TagScopeTerm _$TagScopeTermFromJson(Map<String, dynamic> json) {
  return TagScopeTerm(
    comparator:
        _$enumDecodeNullable(_$JobComparatorEnumMap, json['comparator']),
    key: json['key'] as String,
    tagValues: (json['tagValues'] as List)
        ?.map((e) =>
            e == null ? null : TagValuePair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    target: _$enumDecodeNullable(_$TagTargetEnumMap, json['target']),
  );
}

Map<String, dynamic> _$TagScopeTermToJson(TagScopeTerm instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comparator', _$JobComparatorEnumMap[instance.comparator]);
  writeNotNull('key', instance.key);
  writeNotNull(
      'tagValues', instance.tagValues?.map((e) => e?.toJson())?.toList());
  writeNotNull('target', _$TagTargetEnumMap[instance.target]);
  return val;
}

const _$TagTargetEnumMap = {
  TagTarget.s3Object: 'S3_OBJECT',
};

TagValuePair _$TagValuePairFromJson(Map<String, dynamic> json) {
  return TagValuePair(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagValuePairToJson(TagValuePair instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

TestCustomDataIdentifierResponse _$TestCustomDataIdentifierResponseFromJson(
    Map<String, dynamic> json) {
  return TestCustomDataIdentifierResponse(
    matchCount: json['matchCount'] as int,
  );
}

UnprocessedAccount _$UnprocessedAccountFromJson(Map<String, dynamic> json) {
  return UnprocessedAccount(
    accountId: json['accountId'] as String,
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['errorCode']),
    errorMessage: json['errorMessage'] as String,
  );
}

const _$ErrorCodeEnumMap = {
  ErrorCode.clientError: 'ClientError',
  ErrorCode.internalError: 'InternalError',
};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateClassificationJobResponse _$UpdateClassificationJobResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateClassificationJobResponse();
}

UpdateFindingsFilterResponse _$UpdateFindingsFilterResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateFindingsFilterResponse(
    arn: json['arn'] as String,
    id: json['id'] as String,
  );
}

UpdateMacieSessionResponse _$UpdateMacieSessionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateMacieSessionResponse();
}

UpdateMemberSessionResponse _$UpdateMemberSessionResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateMemberSessionResponse();
}

UpdateOrganizationConfigurationResponse
    _$UpdateOrganizationConfigurationResponseFromJson(
        Map<String, dynamic> json) {
  return UpdateOrganizationConfigurationResponse();
}

UsageByAccount _$UsageByAccountFromJson(Map<String, dynamic> json) {
  return UsageByAccount(
    currency: _$enumDecodeNullable(_$CurrencyEnumMap, json['currency']),
    estimatedCost: json['estimatedCost'] as String,
    serviceLimit: json['serviceLimit'] == null
        ? null
        : ServiceLimit.fromJson(json['serviceLimit'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$UsageTypeEnumMap, json['type']),
  );
}

const _$CurrencyEnumMap = {
  Currency.usd: 'USD',
};

const _$UsageTypeEnumMap = {
  UsageType.dataInventoryEvaluation: 'DATA_INVENTORY_EVALUATION',
  UsageType.sensitiveDataDiscovery: 'SENSITIVE_DATA_DISCOVERY',
};

UsageRecord _$UsageRecordFromJson(Map<String, dynamic> json) {
  return UsageRecord(
    accountId: json['accountId'] as String,
    freeTrialStartDate:
        const IsoDateTimeConverter().fromJson(json['freeTrialStartDate']),
    usage: (json['usage'] as List)
        ?.map((e) => e == null
            ? null
            : UsageByAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UsageStatisticsFilterToJson(
    UsageStatisticsFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comparator',
      _$UsageStatisticsFilterComparatorEnumMap[instance.comparator]);
  writeNotNull('key', _$UsageStatisticsFilterKeyEnumMap[instance.key]);
  writeNotNull('values', instance.values);
  return val;
}

const _$UsageStatisticsFilterComparatorEnumMap = {
  UsageStatisticsFilterComparator.gt: 'GT',
  UsageStatisticsFilterComparator.gte: 'GTE',
  UsageStatisticsFilterComparator.lt: 'LT',
  UsageStatisticsFilterComparator.lte: 'LTE',
  UsageStatisticsFilterComparator.eq: 'EQ',
  UsageStatisticsFilterComparator.ne: 'NE',
  UsageStatisticsFilterComparator.contains: 'CONTAINS',
};

const _$UsageStatisticsFilterKeyEnumMap = {
  UsageStatisticsFilterKey.accountId: 'accountId',
  UsageStatisticsFilterKey.serviceLimit: 'serviceLimit',
  UsageStatisticsFilterKey.freeTrialStartDate: 'freeTrialStartDate',
  UsageStatisticsFilterKey.total: 'total',
};

Map<String, dynamic> _$UsageStatisticsSortByToJson(
    UsageStatisticsSortBy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', _$UsageStatisticsSortKeyEnumMap[instance.key]);
  writeNotNull('orderBy', _$OrderByEnumMap[instance.orderBy]);
  return val;
}

const _$UsageStatisticsSortKeyEnumMap = {
  UsageStatisticsSortKey.accountId: 'accountId',
  UsageStatisticsSortKey.total: 'total',
  UsageStatisticsSortKey.serviceLimitValue: 'serviceLimitValue',
  UsageStatisticsSortKey.freeTrialStartDate: 'freeTrialStartDate',
};

UsageTotal _$UsageTotalFromJson(Map<String, dynamic> json) {
  return UsageTotal(
    currency: _$enumDecodeNullable(_$CurrencyEnumMap, json['currency']),
    estimatedCost: json['estimatedCost'] as String,
    type: _$enumDecodeNullable(_$UsageTypeEnumMap, json['type']),
  );
}

UserIdentity _$UserIdentityFromJson(Map<String, dynamic> json) {
  return UserIdentity(
    assumedRole: json['assumedRole'] == null
        ? null
        : AssumedRole.fromJson(json['assumedRole'] as Map<String, dynamic>),
    awsAccount: json['awsAccount'] == null
        ? null
        : AwsAccount.fromJson(json['awsAccount'] as Map<String, dynamic>),
    awsService: json['awsService'] == null
        ? null
        : AwsService.fromJson(json['awsService'] as Map<String, dynamic>),
    federatedUser: json['federatedUser'] == null
        ? null
        : FederatedUser.fromJson(json['federatedUser'] as Map<String, dynamic>),
    iamUser: json['iamUser'] == null
        ? null
        : IamUser.fromJson(json['iamUser'] as Map<String, dynamic>),
    root: json['root'] == null
        ? null
        : UserIdentityRoot.fromJson(json['root'] as Map<String, dynamic>),
    type: _$enumDecodeNullable(_$UserIdentityTypeEnumMap, json['type']),
  );
}

const _$UserIdentityTypeEnumMap = {
  UserIdentityType.assumedRole: 'AssumedRole',
  UserIdentityType.iAMUser: 'IAMUser',
  UserIdentityType.federatedUser: 'FederatedUser',
  UserIdentityType.root: 'Root',
  UserIdentityType.awsAccount: 'AWSAccount',
  UserIdentityType.awsService: 'AWSService',
};

UserIdentityRoot _$UserIdentityRootFromJson(Map<String, dynamic> json) {
  return UserIdentityRoot(
    accountId: json['accountId'] as String,
    arn: json['arn'] as String,
    principalId: json['principalId'] as String,
  );
}

UserPausedDetails _$UserPausedDetailsFromJson(Map<String, dynamic> json) {
  return UserPausedDetails(
    jobExpiresAt: const IsoDateTimeConverter().fromJson(json['jobExpiresAt']),
    jobImminentExpirationHealthEventArn:
        json['jobImminentExpirationHealthEventArn'] as String,
    jobPausedAt: const IsoDateTimeConverter().fromJson(json['jobPausedAt']),
  );
}

WeeklySchedule _$WeeklyScheduleFromJson(Map<String, dynamic> json) {
  return WeeklySchedule(
    dayOfWeek: _$enumDecodeNullable(_$DayOfWeekEnumMap, json['dayOfWeek']),
  );
}

Map<String, dynamic> _$WeeklyScheduleToJson(WeeklySchedule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dayOfWeek', _$DayOfWeekEnumMap[instance.dayOfWeek]);
  return val;
}

const _$DayOfWeekEnumMap = {
  DayOfWeek.sunday: 'SUNDAY',
  DayOfWeek.monday: 'MONDAY',
  DayOfWeek.tuesday: 'TUESDAY',
  DayOfWeek.wednesday: 'WEDNESDAY',
  DayOfWeek.thursday: 'THURSDAY',
  DayOfWeek.friday: 'FRIDAY',
  DayOfWeek.saturday: 'SATURDAY',
};
