// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecastquery-2018-06-26.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataPoint _$DataPointFromJson(Map<String, dynamic> json) {
  return DataPoint(
    timestamp: json['Timestamp'] as String,
    value: (json['Value'] as num)?.toDouble(),
  );
}

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast(
    predictions: (json['Predictions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : DataPoint.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
  );
}

Map<String, dynamic> _$QueryForecastRequestToJson(
    QueryForecastRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters);
  writeNotNull('ForecastArn', instance.forecastArn);
  writeNotNull('EndDate', instance.endDate);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StartDate', instance.startDate);
  return val;
}

QueryForecastResponse _$QueryForecastResponseFromJson(
    Map<String, dynamic> json) {
  return QueryForecastResponse(
    forecast: json['Forecast'] == null
        ? null
        : Forecast.fromJson(json['Forecast'] as Map<String, dynamic>),
  );
}
