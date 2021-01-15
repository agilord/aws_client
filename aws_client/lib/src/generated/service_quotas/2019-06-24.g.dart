// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-06-24.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssociateServiceQuotaTemplateResponse
    _$AssociateServiceQuotaTemplateResponseFromJson(Map<String, dynamic> json) {
  return AssociateServiceQuotaTemplateResponse();
}

DeleteServiceQuotaIncreaseRequestFromTemplateResponse
    _$DeleteServiceQuotaIncreaseRequestFromTemplateResponseFromJson(
        Map<String, dynamic> json) {
  return DeleteServiceQuotaIncreaseRequestFromTemplateResponse();
}

DisassociateServiceQuotaTemplateResponse
    _$DisassociateServiceQuotaTemplateResponseFromJson(
        Map<String, dynamic> json) {
  return DisassociateServiceQuotaTemplateResponse();
}

ErrorReason _$ErrorReasonFromJson(Map<String, dynamic> json) {
  return ErrorReason(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['ErrorCode']),
    errorMessage: json['ErrorMessage'] as String,
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

const _$ErrorCodeEnumMap = {
  ErrorCode.dependencyAccessDeniedError: 'DEPENDENCY_ACCESS_DENIED_ERROR',
  ErrorCode.dependencyThrottlingError: 'DEPENDENCY_THROTTLING_ERROR',
  ErrorCode.dependencyServiceError: 'DEPENDENCY_SERVICE_ERROR',
  ErrorCode.serviceQuotaNotAvailableError: 'SERVICE_QUOTA_NOT_AVAILABLE_ERROR',
};

GetAWSDefaultServiceQuotaResponse _$GetAWSDefaultServiceQuotaResponseFromJson(
    Map<String, dynamic> json) {
  return GetAWSDefaultServiceQuotaResponse(
    quota: json['Quota'] == null
        ? null
        : ServiceQuota.fromJson(json['Quota'] as Map<String, dynamic>),
  );
}

GetAssociationForServiceQuotaTemplateResponse
    _$GetAssociationForServiceQuotaTemplateResponseFromJson(
        Map<String, dynamic> json) {
  return GetAssociationForServiceQuotaTemplateResponse(
    serviceQuotaTemplateAssociationStatus: _$enumDecodeNullable(
        _$ServiceQuotaTemplateAssociationStatusEnumMap,
        json['ServiceQuotaTemplateAssociationStatus']),
  );
}

const _$ServiceQuotaTemplateAssociationStatusEnumMap = {
  ServiceQuotaTemplateAssociationStatus.associated: 'ASSOCIATED',
  ServiceQuotaTemplateAssociationStatus.disassociated: 'DISASSOCIATED',
};

GetRequestedServiceQuotaChangeResponse
    _$GetRequestedServiceQuotaChangeResponseFromJson(
        Map<String, dynamic> json) {
  return GetRequestedServiceQuotaChangeResponse(
    requestedQuota: json['RequestedQuota'] == null
        ? null
        : RequestedServiceQuotaChange.fromJson(
            json['RequestedQuota'] as Map<String, dynamic>),
  );
}

GetServiceQuotaIncreaseRequestFromTemplateResponse
    _$GetServiceQuotaIncreaseRequestFromTemplateResponseFromJson(
        Map<String, dynamic> json) {
  return GetServiceQuotaIncreaseRequestFromTemplateResponse(
    serviceQuotaIncreaseRequestInTemplate:
        json['ServiceQuotaIncreaseRequestInTemplate'] == null
            ? null
            : ServiceQuotaIncreaseRequestInTemplate.fromJson(
                json['ServiceQuotaIncreaseRequestInTemplate']
                    as Map<String, dynamic>),
  );
}

GetServiceQuotaResponse _$GetServiceQuotaResponseFromJson(
    Map<String, dynamic> json) {
  return GetServiceQuotaResponse(
    quota: json['Quota'] == null
        ? null
        : ServiceQuota.fromJson(json['Quota'] as Map<String, dynamic>),
  );
}

ListAWSDefaultServiceQuotasResponse
    _$ListAWSDefaultServiceQuotasResponseFromJson(Map<String, dynamic> json) {
  return ListAWSDefaultServiceQuotasResponse(
    nextToken: json['NextToken'] as String,
    quotas: (json['Quotas'] as List)
        ?.map((e) =>
            e == null ? null : ServiceQuota.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRequestedServiceQuotaChangeHistoryByQuotaResponse
    _$ListRequestedServiceQuotaChangeHistoryByQuotaResponseFromJson(
        Map<String, dynamic> json) {
  return ListRequestedServiceQuotaChangeHistoryByQuotaResponse(
    nextToken: json['NextToken'] as String,
    requestedQuotas: (json['RequestedQuotas'] as List)
        ?.map((e) => e == null
            ? null
            : RequestedServiceQuotaChange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListRequestedServiceQuotaChangeHistoryResponse
    _$ListRequestedServiceQuotaChangeHistoryResponseFromJson(
        Map<String, dynamic> json) {
  return ListRequestedServiceQuotaChangeHistoryResponse(
    nextToken: json['NextToken'] as String,
    requestedQuotas: (json['RequestedQuotas'] as List)
        ?.map((e) => e == null
            ? null
            : RequestedServiceQuotaChange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListServiceQuotaIncreaseRequestsInTemplateResponse
    _$ListServiceQuotaIncreaseRequestsInTemplateResponseFromJson(
        Map<String, dynamic> json) {
  return ListServiceQuotaIncreaseRequestsInTemplateResponse(
    nextToken: json['NextToken'] as String,
    serviceQuotaIncreaseRequestInTemplateList:
        (json['ServiceQuotaIncreaseRequestInTemplateList'] as List)
            ?.map((e) => e == null
                ? null
                : ServiceQuotaIncreaseRequestInTemplate.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

ListServiceQuotasResponse _$ListServiceQuotasResponseFromJson(
    Map<String, dynamic> json) {
  return ListServiceQuotasResponse(
    nextToken: json['NextToken'] as String,
    quotas: (json['Quotas'] as List)
        ?.map((e) =>
            e == null ? null : ServiceQuota.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListServicesResponse _$ListServicesResponseFromJson(Map<String, dynamic> json) {
  return ListServicesResponse(
    nextToken: json['NextToken'] as String,
    services: (json['Services'] as List)
        ?.map((e) =>
            e == null ? null : ServiceInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MetricInfo _$MetricInfoFromJson(Map<String, dynamic> json) {
  return MetricInfo(
    metricDimensions: (json['MetricDimensions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    metricName: json['MetricName'] as String,
    metricNamespace: json['MetricNamespace'] as String,
    metricStatisticRecommendation:
        json['MetricStatisticRecommendation'] as String,
  );
}

PutServiceQuotaIncreaseRequestIntoTemplateResponse
    _$PutServiceQuotaIncreaseRequestIntoTemplateResponseFromJson(
        Map<String, dynamic> json) {
  return PutServiceQuotaIncreaseRequestIntoTemplateResponse(
    serviceQuotaIncreaseRequestInTemplate:
        json['ServiceQuotaIncreaseRequestInTemplate'] == null
            ? null
            : ServiceQuotaIncreaseRequestInTemplate.fromJson(
                json['ServiceQuotaIncreaseRequestInTemplate']
                    as Map<String, dynamic>),
  );
}

QuotaPeriod _$QuotaPeriodFromJson(Map<String, dynamic> json) {
  return QuotaPeriod(
    periodUnit: _$enumDecodeNullable(_$PeriodUnitEnumMap, json['PeriodUnit']),
    periodValue: json['PeriodValue'] as int,
  );
}

const _$PeriodUnitEnumMap = {
  PeriodUnit.microsecond: 'MICROSECOND',
  PeriodUnit.millisecond: 'MILLISECOND',
  PeriodUnit.second: 'SECOND',
  PeriodUnit.minute: 'MINUTE',
  PeriodUnit.hour: 'HOUR',
  PeriodUnit.day: 'DAY',
  PeriodUnit.week: 'WEEK',
};

RequestServiceQuotaIncreaseResponse
    _$RequestServiceQuotaIncreaseResponseFromJson(Map<String, dynamic> json) {
  return RequestServiceQuotaIncreaseResponse(
    requestedQuota: json['RequestedQuota'] == null
        ? null
        : RequestedServiceQuotaChange.fromJson(
            json['RequestedQuota'] as Map<String, dynamic>),
  );
}

RequestedServiceQuotaChange _$RequestedServiceQuotaChangeFromJson(
    Map<String, dynamic> json) {
  return RequestedServiceQuotaChange(
    caseId: json['CaseId'] as String,
    created: const UnixDateTimeConverter().fromJson(json['Created']),
    desiredValue: (json['DesiredValue'] as num)?.toDouble(),
    globalQuota: json['GlobalQuota'] as bool,
    id: json['Id'] as String,
    lastUpdated: const UnixDateTimeConverter().fromJson(json['LastUpdated']),
    quotaArn: json['QuotaArn'] as String,
    quotaCode: json['QuotaCode'] as String,
    quotaName: json['QuotaName'] as String,
    requester: json['Requester'] as String,
    serviceCode: json['ServiceCode'] as String,
    serviceName: json['ServiceName'] as String,
    status: _$enumDecodeNullable(_$RequestStatusEnumMap, json['Status']),
    unit: json['Unit'] as String,
  );
}

const _$RequestStatusEnumMap = {
  RequestStatus.pending: 'PENDING',
  RequestStatus.caseOpened: 'CASE_OPENED',
  RequestStatus.approved: 'APPROVED',
  RequestStatus.denied: 'DENIED',
  RequestStatus.caseClosed: 'CASE_CLOSED',
};

ServiceInfo _$ServiceInfoFromJson(Map<String, dynamic> json) {
  return ServiceInfo(
    serviceCode: json['ServiceCode'] as String,
    serviceName: json['ServiceName'] as String,
  );
}

ServiceQuota _$ServiceQuotaFromJson(Map<String, dynamic> json) {
  return ServiceQuota(
    adjustable: json['Adjustable'] as bool,
    errorReason: json['ErrorReason'] == null
        ? null
        : ErrorReason.fromJson(json['ErrorReason'] as Map<String, dynamic>),
    globalQuota: json['GlobalQuota'] as bool,
    period: json['Period'] == null
        ? null
        : QuotaPeriod.fromJson(json['Period'] as Map<String, dynamic>),
    quotaArn: json['QuotaArn'] as String,
    quotaCode: json['QuotaCode'] as String,
    quotaName: json['QuotaName'] as String,
    serviceCode: json['ServiceCode'] as String,
    serviceName: json['ServiceName'] as String,
    unit: json['Unit'] as String,
    usageMetric: json['UsageMetric'] == null
        ? null
        : MetricInfo.fromJson(json['UsageMetric'] as Map<String, dynamic>),
    value: (json['Value'] as num)?.toDouble(),
  );
}

ServiceQuotaIncreaseRequestInTemplate
    _$ServiceQuotaIncreaseRequestInTemplateFromJson(Map<String, dynamic> json) {
  return ServiceQuotaIncreaseRequestInTemplate(
    awsRegion: json['AwsRegion'] as String,
    desiredValue: (json['DesiredValue'] as num)?.toDouble(),
    globalQuota: json['GlobalQuota'] as bool,
    quotaCode: json['QuotaCode'] as String,
    quotaName: json['QuotaName'] as String,
    serviceCode: json['ServiceCode'] as String,
    serviceName: json['ServiceName'] as String,
    unit: json['Unit'] as String,
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

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}
