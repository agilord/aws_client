// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uri_parameter,_querystring_params,_headers_and_json_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$InputShapeToJson(InputShape instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Config', instance.config?.toJson());
  return val;
}

Map<String, dynamic> _$StructTypeToJson(StructType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('A', instance.a);
  writeNotNull('B', instance.b);
  return val;
}
