// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pi-2018-02-27.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataPoint _$DataPointFromJson(Map<String, dynamic> json) {
  return DataPoint(
    timestamp: DateTime.parse(json['Timestamp'] as String),
    value: (json['Value'] as num).toDouble(),
  );
}

DescribeDimensionKeysResponse _$DescribeDimensionKeysResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDimensionKeysResponse(
    alignedEndTime:
        const UnixDateTimeConverter().fromJson(json['AlignedEndTime']),
    alignedStartTime:
        const UnixDateTimeConverter().fromJson(json['AlignedStartTime']),
    keys: (json['Keys'] as List<dynamic>?)
        ?.map(
            (e) => DimensionKeyDescription.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
    partitionKeys: (json['PartitionKeys'] as List<dynamic>?)
        ?.map((e) => ResponsePartitionKey.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DimensionGroupToJson(DimensionGroup instance) {
  final val = <String, dynamic>{
    'Group': instance.group,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Dimensions', instance.dimensions);
  writeNotNull('Limit', instance.limit);
  return val;
}

DimensionKeyDescription _$DimensionKeyDescriptionFromJson(
    Map<String, dynamic> json) {
  return DimensionKeyDescription(
    dimensions: (json['Dimensions'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    partitions: (json['Partitions'] as List<dynamic>?)
        ?.map((e) => (e as num).toDouble())
        .toList(),
    total: (json['Total'] as num?)?.toDouble(),
  );
}

GetResourceMetricsResponse _$GetResourceMetricsResponseFromJson(
    Map<String, dynamic> json) {
  return GetResourceMetricsResponse(
    alignedEndTime:
        const UnixDateTimeConverter().fromJson(json['AlignedEndTime']),
    alignedStartTime:
        const UnixDateTimeConverter().fromJson(json['AlignedStartTime']),
    identifier: json['Identifier'] as String?,
    metricList: (json['MetricList'] as List<dynamic>?)
        ?.map((e) => MetricKeyDataPoints.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

MetricKeyDataPoints _$MetricKeyDataPointsFromJson(Map<String, dynamic> json) {
  return MetricKeyDataPoints(
    dataPoints: (json['DataPoints'] as List<dynamic>?)
        ?.map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
        .toList(),
    key: json['Key'] == null
        ? null
        : ResponseResourceMetricKey.fromJson(
            json['Key'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MetricQueryToJson(MetricQuery instance) {
  final val = <String, dynamic>{
    'Metric': instance.metric,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filter', instance.filter);
  writeNotNull('GroupBy', instance.groupBy?.toJson());
  return val;
}

ResponsePartitionKey _$ResponsePartitionKeyFromJson(Map<String, dynamic> json) {
  return ResponsePartitionKey(
    dimensions: Map<String, String>.from(json['Dimensions'] as Map),
  );
}

ResponseResourceMetricKey _$ResponseResourceMetricKeyFromJson(
    Map<String, dynamic> json) {
  return ResponseResourceMetricKey(
    metric: json['Metric'] as String,
    dimensions: (json['Dimensions'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}
