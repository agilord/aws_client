// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2015-05-28.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteThingShadowResponse _$DeleteThingShadowResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteThingShadowResponse(
    payload: const Uint8ListConverter().fromJson(json['payload'] as String),
  );
}

GetThingShadowResponse _$GetThingShadowResponseFromJson(
    Map<String, dynamic> json) {
  return GetThingShadowResponse(
    payload: const Uint8ListConverter().fromJson(json['payload'] as String),
  );
}

ListNamedShadowsForThingResponse _$ListNamedShadowsForThingResponseFromJson(
    Map<String, dynamic> json) {
  return ListNamedShadowsForThingResponse(
    nextToken: json['nextToken'] as String,
    results: (json['results'] as List)?.map((e) => e as String)?.toList(),
    timestamp: json['timestamp'] as int,
  );
}

UpdateThingShadowResponse _$UpdateThingShadowResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateThingShadowResponse(
    payload: const Uint8ListConverter().fromJson(json['payload'] as String),
  );
}
