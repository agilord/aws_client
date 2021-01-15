// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-11-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyzedResource _$AnalyzedResourceFromJson(Map<String, dynamic> json) {
  return AnalyzedResource(
    analyzedAt: const IsoDateTimeConverter().fromJson(json['analyzedAt']),
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    isPublic: json['isPublic'] as bool,
    resourceArn: json['resourceArn'] as String,
    resourceOwnerAccount: json['resourceOwnerAccount'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    updatedAt: const IsoDateTimeConverter().fromJson(json['updatedAt']),
    actions: (json['actions'] as List)?.map((e) => e as String)?.toList(),
    error: json['error'] as String,
    sharedVia: (json['sharedVia'] as List)?.map((e) => e as String)?.toList(),
    status: _$enumDecodeNullable(_$FindingStatusEnumMap, json['status']),
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

const _$ResourceTypeEnumMap = {
  ResourceType.awsS3Bucket: 'AWS::S3::Bucket',
  ResourceType.awsIamRole: 'AWS::IAM::Role',
  ResourceType.awsSqsQueue: 'AWS::SQS::Queue',
  ResourceType.awsLambdaFunction: 'AWS::Lambda::Function',
  ResourceType.awsLambdaLayerVersion: 'AWS::Lambda::LayerVersion',
  ResourceType.awsKmsKey: 'AWS::KMS::Key',
};

const _$FindingStatusEnumMap = {
  FindingStatus.active: 'ACTIVE',
  FindingStatus.archived: 'ARCHIVED',
  FindingStatus.resolved: 'RESOLVED',
};

AnalyzedResourceSummary _$AnalyzedResourceSummaryFromJson(
    Map<String, dynamic> json) {
  return AnalyzedResourceSummary(
    resourceArn: json['resourceArn'] as String,
    resourceOwnerAccount: json['resourceOwnerAccount'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
  );
}

AnalyzerSummary _$AnalyzerSummaryFromJson(Map<String, dynamic> json) {
  return AnalyzerSummary(
    arn: json['arn'] as String,
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    name: json['name'] as String,
    status: _$enumDecodeNullable(_$AnalyzerStatusEnumMap, json['status']),
    type: _$enumDecodeNullable(_$TypeEnumMap, json['type']),
    lastResourceAnalyzed: json['lastResourceAnalyzed'] as String,
    lastResourceAnalyzedAt:
        const IsoDateTimeConverter().fromJson(json['lastResourceAnalyzedAt']),
    statusReason: json['statusReason'] == null
        ? null
        : StatusReason.fromJson(json['statusReason'] as Map<String, dynamic>),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$AnalyzerStatusEnumMap = {
  AnalyzerStatus.active: 'ACTIVE',
  AnalyzerStatus.creating: 'CREATING',
  AnalyzerStatus.disabled: 'DISABLED',
  AnalyzerStatus.failed: 'FAILED',
};

const _$TypeEnumMap = {
  Type.account: 'ACCOUNT',
  Type.organization: 'ORGANIZATION',
};

ArchiveRuleSummary _$ArchiveRuleSummaryFromJson(Map<String, dynamic> json) {
  return ArchiveRuleSummary(
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    filter: (json['filter'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Criterion.fromJson(e as Map<String, dynamic>)),
    ),
    ruleName: json['ruleName'] as String,
    updatedAt: const IsoDateTimeConverter().fromJson(json['updatedAt']),
  );
}

CreateAnalyzerResponse _$CreateAnalyzerResponseFromJson(
    Map<String, dynamic> json) {
  return CreateAnalyzerResponse(
    arn: json['arn'] as String,
  );
}

Criterion _$CriterionFromJson(Map<String, dynamic> json) {
  return Criterion(
    contains: (json['contains'] as List)?.map((e) => e as String)?.toList(),
    eq: (json['eq'] as List)?.map((e) => e as String)?.toList(),
    exists: json['exists'] as bool,
    neq: (json['neq'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CriterionToJson(Criterion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('contains', instance.contains);
  writeNotNull('eq', instance.eq);
  writeNotNull('exists', instance.exists);
  writeNotNull('neq', instance.neq);
  return val;
}

Finding _$FindingFromJson(Map<String, dynamic> json) {
  return Finding(
    analyzedAt: const IsoDateTimeConverter().fromJson(json['analyzedAt']),
    condition: (json['condition'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    id: json['id'] as String,
    resourceOwnerAccount: json['resourceOwnerAccount'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    status: _$enumDecodeNullable(_$FindingStatusEnumMap, json['status']),
    updatedAt: const IsoDateTimeConverter().fromJson(json['updatedAt']),
    action: (json['action'] as List)?.map((e) => e as String)?.toList(),
    error: json['error'] as String,
    isPublic: json['isPublic'] as bool,
    principal: (json['principal'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    resource: json['resource'] as String,
    sources: (json['sources'] as List)
        ?.map((e) => e == null
            ? null
            : FindingSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

FindingSource _$FindingSourceFromJson(Map<String, dynamic> json) {
  return FindingSource(
    type: _$enumDecodeNullable(_$FindingSourceTypeEnumMap, json['type']),
    detail: json['detail'] == null
        ? null
        : FindingSourceDetail.fromJson(json['detail'] as Map<String, dynamic>),
  );
}

const _$FindingSourceTypeEnumMap = {
  FindingSourceType.policy: 'POLICY',
  FindingSourceType.bucketAcl: 'BUCKET_ACL',
  FindingSourceType.s3AccessPoint: 'S3_ACCESS_POINT',
};

FindingSourceDetail _$FindingSourceDetailFromJson(Map<String, dynamic> json) {
  return FindingSourceDetail(
    accessPointArn: json['accessPointArn'] as String,
  );
}

FindingSummary _$FindingSummaryFromJson(Map<String, dynamic> json) {
  return FindingSummary(
    analyzedAt: const IsoDateTimeConverter().fromJson(json['analyzedAt']),
    condition: (json['condition'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    id: json['id'] as String,
    resourceOwnerAccount: json['resourceOwnerAccount'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    status: _$enumDecodeNullable(_$FindingStatusEnumMap, json['status']),
    updatedAt: const IsoDateTimeConverter().fromJson(json['updatedAt']),
    action: (json['action'] as List)?.map((e) => e as String)?.toList(),
    error: json['error'] as String,
    isPublic: json['isPublic'] as bool,
    principal: (json['principal'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    resource: json['resource'] as String,
    sources: (json['sources'] as List)
        ?.map((e) => e == null
            ? null
            : FindingSource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetAnalyzedResourceResponse _$GetAnalyzedResourceResponseFromJson(
    Map<String, dynamic> json) {
  return GetAnalyzedResourceResponse(
    resource: json['resource'] == null
        ? null
        : AnalyzedResource.fromJson(json['resource'] as Map<String, dynamic>),
  );
}

GetAnalyzerResponse _$GetAnalyzerResponseFromJson(Map<String, dynamic> json) {
  return GetAnalyzerResponse(
    analyzer: json['analyzer'] == null
        ? null
        : AnalyzerSummary.fromJson(json['analyzer'] as Map<String, dynamic>),
  );
}

GetArchiveRuleResponse _$GetArchiveRuleResponseFromJson(
    Map<String, dynamic> json) {
  return GetArchiveRuleResponse(
    archiveRule: json['archiveRule'] == null
        ? null
        : ArchiveRuleSummary.fromJson(
            json['archiveRule'] as Map<String, dynamic>),
  );
}

GetFindingResponse _$GetFindingResponseFromJson(Map<String, dynamic> json) {
  return GetFindingResponse(
    finding: json['finding'] == null
        ? null
        : Finding.fromJson(json['finding'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InlineArchiveRuleToJson(InlineArchiveRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'filter', instance.filter?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('ruleName', instance.ruleName);
  return val;
}

ListAnalyzedResourcesResponse _$ListAnalyzedResourcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListAnalyzedResourcesResponse(
    analyzedResources: (json['analyzedResources'] as List)
        ?.map((e) => e == null
            ? null
            : AnalyzedResourceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListAnalyzersResponse _$ListAnalyzersResponseFromJson(
    Map<String, dynamic> json) {
  return ListAnalyzersResponse(
    analyzers: (json['analyzers'] as List)
        ?.map((e) => e == null
            ? null
            : AnalyzerSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListArchiveRulesResponse _$ListArchiveRulesResponseFromJson(
    Map<String, dynamic> json) {
  return ListArchiveRulesResponse(
    archiveRules: (json['archiveRules'] as List)
        ?.map((e) => e == null
            ? null
            : ArchiveRuleSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListFindingsResponse _$ListFindingsResponseFromJson(Map<String, dynamic> json) {
  return ListFindingsResponse(
    findings: (json['findings'] as List)
        ?.map((e) => e == null
            ? null
            : FindingSummary.fromJson(e as Map<String, dynamic>))
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

const _$OrderByEnumMap = {
  OrderBy.asc: 'ASC',
  OrderBy.desc: 'DESC',
};

StatusReason _$StatusReasonFromJson(Map<String, dynamic> json) {
  return StatusReason(
    code: _$enumDecodeNullable(_$ReasonCodeEnumMap, json['code']),
  );
}

const _$ReasonCodeEnumMap = {
  ReasonCode.awsServiceAccessDisabled: 'AWS_SERVICE_ACCESS_DISABLED',
  ReasonCode.delegatedAdministratorDeregistered:
      'DELEGATED_ADMINISTRATOR_DEREGISTERED',
  ReasonCode.organizationDeleted: 'ORGANIZATION_DELETED',
  ReasonCode.serviceLinkedRoleCreationFailed:
      'SERVICE_LINKED_ROLE_CREATION_FAILED',
};

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}
