// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Api _$ApiFromJson(Map<String, dynamic> json) => Api(
      (json['operations'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Operation.fromJson(e as Map<String, dynamic>)),
      ),
      (json['shapes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Shape.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ApiToJson(Api instance) => <String, dynamic>{
      'operations': instance.operations,
      'shapes': instance.shapes,
    };
