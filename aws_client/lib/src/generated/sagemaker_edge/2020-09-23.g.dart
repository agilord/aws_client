// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-09-23.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$EdgeMetricToJson(EdgeMetric instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Dimension', instance.dimension);
  writeNotNull('MetricName', instance.metricName);
  writeNotNull(
      'Timestamp', const UnixDateTimeConverter().toJson(instance.timestamp));
  writeNotNull('Value', instance.value);
  return val;
}

GetDeviceRegistrationResult _$GetDeviceRegistrationResultFromJson(
    Map<String, dynamic> json) {
  return GetDeviceRegistrationResult(
    cacheTTL: json['CacheTTL'] as String,
    deviceRegistration: json['DeviceRegistration'] as String,
  );
}

Map<String, dynamic> _$ModelToJson(Model instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LatestInference',
      const UnixDateTimeConverter().toJson(instance.latestInference));
  writeNotNull('LatestSampleTime',
      const UnixDateTimeConverter().toJson(instance.latestSampleTime));
  writeNotNull(
      'ModelMetrics', instance.modelMetrics?.map((e) => e?.toJson())?.toList());
  writeNotNull('ModelName', instance.modelName);
  writeNotNull('ModelVersion', instance.modelVersion);
  return val;
}
