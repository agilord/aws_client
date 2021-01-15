// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uri_parameter_querystring_params_headers_and_json_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
