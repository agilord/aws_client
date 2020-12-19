// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xray-2016-04-12.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alias _$AliasFromJson(Map<String, dynamic> json) {
  return Alias(
    name: json['Name'] as String,
    names: (json['Names'] as List)?.map((e) => e as String)?.toList(),
    type: json['Type'] as String,
  );
}

AnnotationValue _$AnnotationValueFromJson(Map<String, dynamic> json) {
  return AnnotationValue(
    booleanValue: json['BooleanValue'] as bool,
    numberValue: (json['NumberValue'] as num)?.toDouble(),
    stringValue: json['StringValue'] as String,
  );
}

AvailabilityZoneDetail _$AvailabilityZoneDetailFromJson(
    Map<String, dynamic> json) {
  return AvailabilityZoneDetail(
    name: json['Name'] as String,
  );
}

Map<String, dynamic> _$BackendConnectionErrorsToJson(
    BackendConnectionErrors instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConnectionRefusedCount', instance.connectionRefusedCount);
  writeNotNull('HTTPCode4XXCount', instance.hTTPCode4XXCount);
  writeNotNull('HTTPCode5XXCount', instance.hTTPCode5XXCount);
  writeNotNull('OtherCount', instance.otherCount);
  writeNotNull('TimeoutCount', instance.timeoutCount);
  writeNotNull('UnknownHostCount', instance.unknownHostCount);
  return val;
}

BatchGetTracesResult _$BatchGetTracesResultFromJson(Map<String, dynamic> json) {
  return BatchGetTracesResult(
    nextToken: json['NextToken'] as String,
    traces: (json['Traces'] as List)
        ?.map(
            (e) => e == null ? null : Trace.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedTraceIds: (json['UnprocessedTraceIds'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

CreateGroupResult _$CreateGroupResultFromJson(Map<String, dynamic> json) {
  return CreateGroupResult(
    group: json['Group'] == null
        ? null
        : Group.fromJson(json['Group'] as Map<String, dynamic>),
  );
}

CreateSamplingRuleResult _$CreateSamplingRuleResultFromJson(
    Map<String, dynamic> json) {
  return CreateSamplingRuleResult(
    samplingRuleRecord: json['SamplingRuleRecord'] == null
        ? null
        : SamplingRuleRecord.fromJson(
            json['SamplingRuleRecord'] as Map<String, dynamic>),
  );
}

DeleteGroupResult _$DeleteGroupResultFromJson(Map<String, dynamic> json) {
  return DeleteGroupResult();
}

DeleteSamplingRuleResult _$DeleteSamplingRuleResultFromJson(
    Map<String, dynamic> json) {
  return DeleteSamplingRuleResult(
    samplingRuleRecord: json['SamplingRuleRecord'] == null
        ? null
        : SamplingRuleRecord.fromJson(
            json['SamplingRuleRecord'] as Map<String, dynamic>),
  );
}

Edge _$EdgeFromJson(Map<String, dynamic> json) {
  return Edge(
    aliases: (json['Aliases'] as List)
        ?.map(
            (e) => e == null ? null : Alias.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    referenceId: json['ReferenceId'] as int,
    responseTimeHistogram: (json['ResponseTimeHistogram'] as List)
        ?.map((e) => e == null
            ? null
            : HistogramEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    summaryStatistics: json['SummaryStatistics'] == null
        ? null
        : EdgeStatistics.fromJson(
            json['SummaryStatistics'] as Map<String, dynamic>),
  );
}

EdgeStatistics _$EdgeStatisticsFromJson(Map<String, dynamic> json) {
  return EdgeStatistics(
    errorStatistics: json['ErrorStatistics'] == null
        ? null
        : ErrorStatistics.fromJson(
            json['ErrorStatistics'] as Map<String, dynamic>),
    faultStatistics: json['FaultStatistics'] == null
        ? null
        : FaultStatistics.fromJson(
            json['FaultStatistics'] as Map<String, dynamic>),
    okCount: json['OkCount'] as int,
    totalCount: json['TotalCount'] as int,
    totalResponseTime: (json['TotalResponseTime'] as num)?.toDouble(),
  );
}

EncryptionConfig _$EncryptionConfigFromJson(Map<String, dynamic> json) {
  return EncryptionConfig(
    keyId: json['KeyId'] as String,
    status: _$enumDecodeNullable(_$EncryptionStatusEnumMap, json['Status']),
    type: _$enumDecodeNullable(_$EncryptionTypeEnumMap, json['Type']),
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

const _$EncryptionStatusEnumMap = {
  EncryptionStatus.updating: 'UPDATING',
  EncryptionStatus.active: 'ACTIVE',
};

const _$EncryptionTypeEnumMap = {
  EncryptionType.none: 'NONE',
  EncryptionType.kms: 'KMS',
};

ErrorRootCause _$ErrorRootCauseFromJson(Map<String, dynamic> json) {
  return ErrorRootCause(
    clientImpacting: json['ClientImpacting'] as bool,
    services: (json['Services'] as List)
        ?.map((e) => e == null
            ? null
            : ErrorRootCauseService.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ErrorRootCauseEntity _$ErrorRootCauseEntityFromJson(Map<String, dynamic> json) {
  return ErrorRootCauseEntity(
    exceptions: (json['Exceptions'] as List)
        ?.map((e) => e == null
            ? null
            : RootCauseException.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
    remote: json['Remote'] as bool,
  );
}

ErrorRootCauseService _$ErrorRootCauseServiceFromJson(
    Map<String, dynamic> json) {
  return ErrorRootCauseService(
    accountId: json['AccountId'] as String,
    entityPath: (json['EntityPath'] as List)
        ?.map((e) => e == null
            ? null
            : ErrorRootCauseEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inferred: json['Inferred'] as bool,
    name: json['Name'] as String,
    names: (json['Names'] as List)?.map((e) => e as String)?.toList(),
    type: json['Type'] as String,
  );
}

ErrorStatistics _$ErrorStatisticsFromJson(Map<String, dynamic> json) {
  return ErrorStatistics(
    otherCount: json['OtherCount'] as int,
    throttleCount: json['ThrottleCount'] as int,
    totalCount: json['TotalCount'] as int,
  );
}

FaultRootCause _$FaultRootCauseFromJson(Map<String, dynamic> json) {
  return FaultRootCause(
    clientImpacting: json['ClientImpacting'] as bool,
    services: (json['Services'] as List)
        ?.map((e) => e == null
            ? null
            : FaultRootCauseService.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

FaultRootCauseEntity _$FaultRootCauseEntityFromJson(Map<String, dynamic> json) {
  return FaultRootCauseEntity(
    exceptions: (json['Exceptions'] as List)
        ?.map((e) => e == null
            ? null
            : RootCauseException.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['Name'] as String,
    remote: json['Remote'] as bool,
  );
}

FaultRootCauseService _$FaultRootCauseServiceFromJson(
    Map<String, dynamic> json) {
  return FaultRootCauseService(
    accountId: json['AccountId'] as String,
    entityPath: (json['EntityPath'] as List)
        ?.map((e) => e == null
            ? null
            : FaultRootCauseEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inferred: json['Inferred'] as bool,
    name: json['Name'] as String,
    names: (json['Names'] as List)?.map((e) => e as String)?.toList(),
    type: json['Type'] as String,
  );
}

FaultStatistics _$FaultStatisticsFromJson(Map<String, dynamic> json) {
  return FaultStatistics(
    otherCount: json['OtherCount'] as int,
    totalCount: json['TotalCount'] as int,
  );
}

GetEncryptionConfigResult _$GetEncryptionConfigResultFromJson(
    Map<String, dynamic> json) {
  return GetEncryptionConfigResult(
    encryptionConfig: json['EncryptionConfig'] == null
        ? null
        : EncryptionConfig.fromJson(
            json['EncryptionConfig'] as Map<String, dynamic>),
  );
}

GetGroupResult _$GetGroupResultFromJson(Map<String, dynamic> json) {
  return GetGroupResult(
    group: json['Group'] == null
        ? null
        : Group.fromJson(json['Group'] as Map<String, dynamic>),
  );
}

GetGroupsResult _$GetGroupsResultFromJson(Map<String, dynamic> json) {
  return GetGroupsResult(
    groups: (json['Groups'] as List)
        ?.map((e) =>
            e == null ? null : GroupSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetSamplingRulesResult _$GetSamplingRulesResultFromJson(
    Map<String, dynamic> json) {
  return GetSamplingRulesResult(
    nextToken: json['NextToken'] as String,
    samplingRuleRecords: (json['SamplingRuleRecords'] as List)
        ?.map((e) => e == null
            ? null
            : SamplingRuleRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetSamplingStatisticSummariesResult
    _$GetSamplingStatisticSummariesResultFromJson(Map<String, dynamic> json) {
  return GetSamplingStatisticSummariesResult(
    nextToken: json['NextToken'] as String,
    samplingStatisticSummaries: (json['SamplingStatisticSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : SamplingStatisticSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetSamplingTargetsResult _$GetSamplingTargetsResultFromJson(
    Map<String, dynamic> json) {
  return GetSamplingTargetsResult(
    lastRuleModification:
        const UnixDateTimeConverter().fromJson(json['LastRuleModification']),
    samplingTargetDocuments: (json['SamplingTargetDocuments'] as List)
        ?.map((e) => e == null
            ? null
            : SamplingTargetDocument.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedStatistics: (json['UnprocessedStatistics'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedStatistics.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetServiceGraphResult _$GetServiceGraphResultFromJson(
    Map<String, dynamic> json) {
  return GetServiceGraphResult(
    containsOldGroupVersions: json['ContainsOldGroupVersions'] as bool,
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    nextToken: json['NextToken'] as String,
    services: (json['Services'] as List)
        ?.map((e) =>
            e == null ? null : Service.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
  );
}

GetTimeSeriesServiceStatisticsResult
    _$GetTimeSeriesServiceStatisticsResultFromJson(Map<String, dynamic> json) {
  return GetTimeSeriesServiceStatisticsResult(
    containsOldGroupVersions: json['ContainsOldGroupVersions'] as bool,
    nextToken: json['NextToken'] as String,
    timeSeriesServiceStatistics: (json['TimeSeriesServiceStatistics'] as List)
        ?.map((e) => e == null
            ? null
            : TimeSeriesServiceStatistics.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetTraceGraphResult _$GetTraceGraphResultFromJson(Map<String, dynamic> json) {
  return GetTraceGraphResult(
    nextToken: json['NextToken'] as String,
    services: (json['Services'] as List)
        ?.map((e) =>
            e == null ? null : Service.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetTraceSummariesResult _$GetTraceSummariesResultFromJson(
    Map<String, dynamic> json) {
  return GetTraceSummariesResult(
    approximateTime:
        const UnixDateTimeConverter().fromJson(json['ApproximateTime']),
    nextToken: json['NextToken'] as String,
    traceSummaries: (json['TraceSummaries'] as List)
        ?.map((e) =>
            e == null ? null : TraceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tracesProcessedCount: json['TracesProcessedCount'] as int,
  );
}

Group _$GroupFromJson(Map<String, dynamic> json) {
  return Group(
    filterExpression: json['FilterExpression'] as String,
    groupARN: json['GroupARN'] as String,
    groupName: json['GroupName'] as String,
  );
}

GroupSummary _$GroupSummaryFromJson(Map<String, dynamic> json) {
  return GroupSummary(
    filterExpression: json['FilterExpression'] as String,
    groupARN: json['GroupARN'] as String,
    groupName: json['GroupName'] as String,
  );
}

HistogramEntry _$HistogramEntryFromJson(Map<String, dynamic> json) {
  return HistogramEntry(
    count: json['Count'] as int,
    value: (json['Value'] as num)?.toDouble(),
  );
}

Http _$HttpFromJson(Map<String, dynamic> json) {
  return Http(
    clientIp: json['ClientIp'] as String,
    httpMethod: json['HttpMethod'] as String,
    httpStatus: json['HttpStatus'] as int,
    httpURL: json['HttpURL'] as String,
    userAgent: json['UserAgent'] as String,
  );
}

InstanceIdDetail _$InstanceIdDetailFromJson(Map<String, dynamic> json) {
  return InstanceIdDetail(
    id: json['Id'] as String,
  );
}

PutEncryptionConfigResult _$PutEncryptionConfigResultFromJson(
    Map<String, dynamic> json) {
  return PutEncryptionConfigResult(
    encryptionConfig: json['EncryptionConfig'] == null
        ? null
        : EncryptionConfig.fromJson(
            json['EncryptionConfig'] as Map<String, dynamic>),
  );
}

PutTelemetryRecordsResult _$PutTelemetryRecordsResultFromJson(
    Map<String, dynamic> json) {
  return PutTelemetryRecordsResult();
}

PutTraceSegmentsResult _$PutTraceSegmentsResultFromJson(
    Map<String, dynamic> json) {
  return PutTraceSegmentsResult(
    unprocessedTraceSegments: (json['UnprocessedTraceSegments'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedTraceSegment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ResourceARNDetail _$ResourceARNDetailFromJson(Map<String, dynamic> json) {
  return ResourceARNDetail(
    arn: json['ARN'] as String,
  );
}

ResponseTimeRootCause _$ResponseTimeRootCauseFromJson(
    Map<String, dynamic> json) {
  return ResponseTimeRootCause(
    clientImpacting: json['ClientImpacting'] as bool,
    services: (json['Services'] as List)
        ?.map((e) => e == null
            ? null
            : ResponseTimeRootCauseService.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ResponseTimeRootCauseEntity _$ResponseTimeRootCauseEntityFromJson(
    Map<String, dynamic> json) {
  return ResponseTimeRootCauseEntity(
    coverage: (json['Coverage'] as num)?.toDouble(),
    name: json['Name'] as String,
    remote: json['Remote'] as bool,
  );
}

ResponseTimeRootCauseService _$ResponseTimeRootCauseServiceFromJson(
    Map<String, dynamic> json) {
  return ResponseTimeRootCauseService(
    accountId: json['AccountId'] as String,
    entityPath: (json['EntityPath'] as List)
        ?.map((e) => e == null
            ? null
            : ResponseTimeRootCauseEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    inferred: json['Inferred'] as bool,
    name: json['Name'] as String,
    names: (json['Names'] as List)?.map((e) => e as String)?.toList(),
    type: json['Type'] as String,
  );
}

RootCauseException _$RootCauseExceptionFromJson(Map<String, dynamic> json) {
  return RootCauseException(
    message: json['Message'] as String,
    name: json['Name'] as String,
  );
}

SamplingRule _$SamplingRuleFromJson(Map<String, dynamic> json) {
  return SamplingRule(
    fixedRate: (json['FixedRate'] as num)?.toDouble(),
    hTTPMethod: json['HTTPMethod'] as String,
    host: json['Host'] as String,
    priority: json['Priority'] as int,
    reservoirSize: json['ReservoirSize'] as int,
    resourceARN: json['ResourceARN'] as String,
    serviceName: json['ServiceName'] as String,
    serviceType: json['ServiceType'] as String,
    uRLPath: json['URLPath'] as String,
    version: json['Version'] as int,
    attributes: (json['Attributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    ruleARN: json['RuleARN'] as String,
    ruleName: json['RuleName'] as String,
  );
}

Map<String, dynamic> _$SamplingRuleToJson(SamplingRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FixedRate', instance.fixedRate);
  writeNotNull('HTTPMethod', instance.hTTPMethod);
  writeNotNull('Host', instance.host);
  writeNotNull('Priority', instance.priority);
  writeNotNull('ReservoirSize', instance.reservoirSize);
  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('ServiceName', instance.serviceName);
  writeNotNull('ServiceType', instance.serviceType);
  writeNotNull('URLPath', instance.uRLPath);
  writeNotNull('Version', instance.version);
  writeNotNull('Attributes', instance.attributes);
  writeNotNull('RuleARN', instance.ruleARN);
  writeNotNull('RuleName', instance.ruleName);
  return val;
}

SamplingRuleRecord _$SamplingRuleRecordFromJson(Map<String, dynamic> json) {
  return SamplingRuleRecord(
    createdAt: const UnixDateTimeConverter().fromJson(json['CreatedAt']),
    modifiedAt: const UnixDateTimeConverter().fromJson(json['ModifiedAt']),
    samplingRule: json['SamplingRule'] == null
        ? null
        : SamplingRule.fromJson(json['SamplingRule'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SamplingRuleUpdateToJson(SamplingRuleUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Attributes', instance.attributes);
  writeNotNull('FixedRate', instance.fixedRate);
  writeNotNull('HTTPMethod', instance.hTTPMethod);
  writeNotNull('Host', instance.host);
  writeNotNull('Priority', instance.priority);
  writeNotNull('ReservoirSize', instance.reservoirSize);
  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('RuleARN', instance.ruleARN);
  writeNotNull('RuleName', instance.ruleName);
  writeNotNull('ServiceName', instance.serviceName);
  writeNotNull('ServiceType', instance.serviceType);
  writeNotNull('URLPath', instance.uRLPath);
  return val;
}

SamplingStatisticSummary _$SamplingStatisticSummaryFromJson(
    Map<String, dynamic> json) {
  return SamplingStatisticSummary(
    borrowCount: json['BorrowCount'] as int,
    requestCount: json['RequestCount'] as int,
    ruleName: json['RuleName'] as String,
    sampledCount: json['SampledCount'] as int,
    timestamp: const UnixDateTimeConverter().fromJson(json['Timestamp']),
  );
}

Map<String, dynamic> _$SamplingStatisticsDocumentToJson(
    SamplingStatisticsDocument instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClientID', instance.clientID);
  writeNotNull('RequestCount', instance.requestCount);
  writeNotNull('RuleName', instance.ruleName);
  writeNotNull('SampledCount', instance.sampledCount);
  writeNotNull(
      'Timestamp', const UnixDateTimeConverter().toJson(instance.timestamp));
  writeNotNull('BorrowCount', instance.borrowCount);
  return val;
}

Map<String, dynamic> _$SamplingStrategyToJson(SamplingStrategy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$SamplingStrategyNameEnumMap[instance.name]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$SamplingStrategyNameEnumMap = {
  SamplingStrategyName.partialScan: 'PartialScan',
  SamplingStrategyName.fixedRate: 'FixedRate',
};

SamplingTargetDocument _$SamplingTargetDocumentFromJson(
    Map<String, dynamic> json) {
  return SamplingTargetDocument(
    fixedRate: (json['FixedRate'] as num)?.toDouble(),
    interval: json['Interval'] as int,
    reservoirQuota: json['ReservoirQuota'] as int,
    reservoirQuotaTTL:
        const UnixDateTimeConverter().fromJson(json['ReservoirQuotaTTL']),
    ruleName: json['RuleName'] as String,
  );
}

Segment _$SegmentFromJson(Map<String, dynamic> json) {
  return Segment(
    document: json['Document'] as String,
    id: json['Id'] as String,
  );
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    accountId: json['AccountId'] as String,
    durationHistogram: (json['DurationHistogram'] as List)
        ?.map((e) => e == null
            ? null
            : HistogramEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    edges: (json['Edges'] as List)
        ?.map(
            (e) => e == null ? null : Edge.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    endTime: const UnixDateTimeConverter().fromJson(json['EndTime']),
    name: json['Name'] as String,
    names: (json['Names'] as List)?.map((e) => e as String)?.toList(),
    referenceId: json['ReferenceId'] as int,
    responseTimeHistogram: (json['ResponseTimeHistogram'] as List)
        ?.map((e) => e == null
            ? null
            : HistogramEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    root: json['Root'] as bool,
    startTime: const UnixDateTimeConverter().fromJson(json['StartTime']),
    state: json['State'] as String,
    summaryStatistics: json['SummaryStatistics'] == null
        ? null
        : ServiceStatistics.fromJson(
            json['SummaryStatistics'] as Map<String, dynamic>),
    type: json['Type'] as String,
  );
}

ServiceId _$ServiceIdFromJson(Map<String, dynamic> json) {
  return ServiceId(
    accountId: json['AccountId'] as String,
    name: json['Name'] as String,
    names: (json['Names'] as List)?.map((e) => e as String)?.toList(),
    type: json['Type'] as String,
  );
}

ServiceStatistics _$ServiceStatisticsFromJson(Map<String, dynamic> json) {
  return ServiceStatistics(
    errorStatistics: json['ErrorStatistics'] == null
        ? null
        : ErrorStatistics.fromJson(
            json['ErrorStatistics'] as Map<String, dynamic>),
    faultStatistics: json['FaultStatistics'] == null
        ? null
        : FaultStatistics.fromJson(
            json['FaultStatistics'] as Map<String, dynamic>),
    okCount: json['OkCount'] as int,
    totalCount: json['TotalCount'] as int,
    totalResponseTime: (json['TotalResponseTime'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TelemetryRecordToJson(TelemetryRecord instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Timestamp', const UnixDateTimeConverter().toJson(instance.timestamp));
  writeNotNull(
      'BackendConnectionErrors', instance.backendConnectionErrors?.toJson());
  writeNotNull('SegmentsReceivedCount', instance.segmentsReceivedCount);
  writeNotNull('SegmentsRejectedCount', instance.segmentsRejectedCount);
  writeNotNull('SegmentsSentCount', instance.segmentsSentCount);
  writeNotNull('SegmentsSpilloverCount', instance.segmentsSpilloverCount);
  return val;
}

TimeSeriesServiceStatistics _$TimeSeriesServiceStatisticsFromJson(
    Map<String, dynamic> json) {
  return TimeSeriesServiceStatistics(
    edgeSummaryStatistics: json['EdgeSummaryStatistics'] == null
        ? null
        : EdgeStatistics.fromJson(
            json['EdgeSummaryStatistics'] as Map<String, dynamic>),
    responseTimeHistogram: (json['ResponseTimeHistogram'] as List)
        ?.map((e) => e == null
            ? null
            : HistogramEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    serviceSummaryStatistics: json['ServiceSummaryStatistics'] == null
        ? null
        : ServiceStatistics.fromJson(
            json['ServiceSummaryStatistics'] as Map<String, dynamic>),
    timestamp: const UnixDateTimeConverter().fromJson(json['Timestamp']),
  );
}

Trace _$TraceFromJson(Map<String, dynamic> json) {
  return Trace(
    duration: (json['Duration'] as num)?.toDouble(),
    id: json['Id'] as String,
    segments: (json['Segments'] as List)
        ?.map((e) =>
            e == null ? null : Segment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

TraceSummary _$TraceSummaryFromJson(Map<String, dynamic> json) {
  return TraceSummary(
    annotations: (json['Annotations'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : ValueWithServiceIds.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
    availabilityZones: (json['AvailabilityZones'] as List)
        ?.map((e) => e == null
            ? null
            : AvailabilityZoneDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    duration: (json['Duration'] as num)?.toDouble(),
    entryPoint: json['EntryPoint'] == null
        ? null
        : ServiceId.fromJson(json['EntryPoint'] as Map<String, dynamic>),
    errorRootCauses: (json['ErrorRootCauses'] as List)
        ?.map((e) => e == null
            ? null
            : ErrorRootCause.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    faultRootCauses: (json['FaultRootCauses'] as List)
        ?.map((e) => e == null
            ? null
            : FaultRootCause.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    hasError: json['HasError'] as bool,
    hasFault: json['HasFault'] as bool,
    hasThrottle: json['HasThrottle'] as bool,
    http: json['Http'] == null
        ? null
        : Http.fromJson(json['Http'] as Map<String, dynamic>),
    id: json['Id'] as String,
    instanceIds: (json['InstanceIds'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceIdDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    isPartial: json['IsPartial'] as bool,
    matchedEventTime:
        const UnixDateTimeConverter().fromJson(json['MatchedEventTime']),
    resourceARNs: (json['ResourceARNs'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceARNDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    responseTime: (json['ResponseTime'] as num)?.toDouble(),
    responseTimeRootCauses: (json['ResponseTimeRootCauses'] as List)
        ?.map((e) => e == null
            ? null
            : ResponseTimeRootCause.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    revision: json['Revision'] as int,
    serviceIds: (json['ServiceIds'] as List)
        ?.map((e) =>
            e == null ? null : ServiceId.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    users: (json['Users'] as List)
        ?.map((e) =>
            e == null ? null : TraceUser.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

TraceUser _$TraceUserFromJson(Map<String, dynamic> json) {
  return TraceUser(
    serviceIds: (json['ServiceIds'] as List)
        ?.map((e) =>
            e == null ? null : ServiceId.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userName: json['UserName'] as String,
  );
}

UnprocessedStatistics _$UnprocessedStatisticsFromJson(
    Map<String, dynamic> json) {
  return UnprocessedStatistics(
    errorCode: json['ErrorCode'] as String,
    message: json['Message'] as String,
    ruleName: json['RuleName'] as String,
  );
}

UnprocessedTraceSegment _$UnprocessedTraceSegmentFromJson(
    Map<String, dynamic> json) {
  return UnprocessedTraceSegment(
    errorCode: json['ErrorCode'] as String,
    id: json['Id'] as String,
    message: json['Message'] as String,
  );
}

UpdateGroupResult _$UpdateGroupResultFromJson(Map<String, dynamic> json) {
  return UpdateGroupResult(
    group: json['Group'] == null
        ? null
        : Group.fromJson(json['Group'] as Map<String, dynamic>),
  );
}

UpdateSamplingRuleResult _$UpdateSamplingRuleResultFromJson(
    Map<String, dynamic> json) {
  return UpdateSamplingRuleResult(
    samplingRuleRecord: json['SamplingRuleRecord'] == null
        ? null
        : SamplingRuleRecord.fromJson(
            json['SamplingRuleRecord'] as Map<String, dynamic>),
  );
}

ValueWithServiceIds _$ValueWithServiceIdsFromJson(Map<String, dynamic> json) {
  return ValueWithServiceIds(
    annotationValue: json['AnnotationValue'] == null
        ? null
        : AnnotationValue.fromJson(
            json['AnnotationValue'] as Map<String, dynamic>),
    serviceIds: (json['ServiceIds'] as List)
        ?.map((e) =>
            e == null ? null : ServiceId.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
