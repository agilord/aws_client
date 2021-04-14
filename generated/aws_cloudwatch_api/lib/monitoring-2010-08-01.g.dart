// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitoring-2010-08-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AnomalyDetectorConfigurationToJson(
    AnomalyDetectorConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ExcludedTimeRanges',
      instance.excludedTimeRanges?.map((e) => e.toJson()).toList());
  writeNotNull('MetricTimezone', instance.metricTimezone);
  return val;
}

Map<String, dynamic> _$DimensionToJson(Dimension instance) => <String, dynamic>{
      'Name': instance.name,
      'Value': instance.value,
    };

Map<String, dynamic> _$DimensionFilterToJson(DimensionFilter instance) {
  final val = <String, dynamic>{
    'Name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Value', instance.value);
  return val;
}

Map<String, dynamic> _$MetricToJson(Metric instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'Dimensions', instance.dimensions?.map((e) => e.toJson()).toList());
  writeNotNull('MetricName', instance.metricName);
  writeNotNull('Namespace', instance.namespace);
  return val;
}

Map<String, dynamic> _$MetricDataQueryToJson(MetricDataQuery instance) {
  final val = <String, dynamic>{
    'Id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Expression', instance.expression);
  writeNotNull('Label', instance.label);
  writeNotNull('MetricStat', instance.metricStat?.toJson());
  writeNotNull('Period', instance.period);
  writeNotNull('ReturnData', instance.returnData);
  return val;
}

Map<String, dynamic> _$MetricDatumToJson(MetricDatum instance) {
  final val = <String, dynamic>{
    'MetricName': instance.metricName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Counts', instance.counts);
  writeNotNull(
      'Dimensions', instance.dimensions?.map((e) => e.toJson()).toList());
  writeNotNull('StatisticValues', instance.statisticValues?.toJson());
  writeNotNull('StorageResolution', instance.storageResolution);
  writeNotNull(
      'Timestamp', const IsoDateTimeConverter().toJson(instance.timestamp));
  writeNotNull('Unit', _$StandardUnitEnumMap[instance.unit]);
  writeNotNull('Value', instance.value);
  writeNotNull('Values', instance.values);
  return val;
}

const _$StandardUnitEnumMap = {
  StandardUnit.seconds: 'Seconds',
  StandardUnit.microseconds: 'Microseconds',
  StandardUnit.milliseconds: 'Milliseconds',
  StandardUnit.bytes: 'Bytes',
  StandardUnit.kilobytes: 'Kilobytes',
  StandardUnit.megabytes: 'Megabytes',
  StandardUnit.gigabytes: 'Gigabytes',
  StandardUnit.terabytes: 'Terabytes',
  StandardUnit.bits: 'Bits',
  StandardUnit.kilobits: 'Kilobits',
  StandardUnit.megabits: 'Megabits',
  StandardUnit.gigabits: 'Gigabits',
  StandardUnit.terabits: 'Terabits',
  StandardUnit.percent: 'Percent',
  StandardUnit.count: 'Count',
  StandardUnit.bytesSecond: 'Bytes/Second',
  StandardUnit.kilobytesSecond: 'Kilobytes/Second',
  StandardUnit.megabytesSecond: 'Megabytes/Second',
  StandardUnit.gigabytesSecond: 'Gigabytes/Second',
  StandardUnit.terabytesSecond: 'Terabytes/Second',
  StandardUnit.bitsSecond: 'Bits/Second',
  StandardUnit.kilobitsSecond: 'Kilobits/Second',
  StandardUnit.megabitsSecond: 'Megabits/Second',
  StandardUnit.gigabitsSecond: 'Gigabits/Second',
  StandardUnit.terabitsSecond: 'Terabits/Second',
  StandardUnit.countSecond: 'Count/Second',
  StandardUnit.none: 'None',
};

Map<String, dynamic> _$MetricStatToJson(MetricStat instance) {
  final val = <String, dynamic>{
    'Metric': instance.metric.toJson(),
    'Period': instance.period,
    'Stat': instance.stat,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Unit', _$StandardUnitEnumMap[instance.unit]);
  return val;
}

Map<String, dynamic> _$RangeToJson(Range instance) => <String, dynamic>{
      'EndTime': instance.endTime.toIso8601String(),
      'StartTime': instance.startTime.toIso8601String(),
    };

Map<String, dynamic> _$StatisticSetToJson(StatisticSet instance) =>
    <String, dynamic>{
      'Maximum': instance.maximum,
      'Minimum': instance.minimum,
      'SampleCount': instance.sampleCount,
      'Sum': instance.sum,
    };

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'Key': instance.key,
      'Value': instance.value,
    };
