import 'package:json_annotation/json_annotation.dart';

import 'operation.dart';
import 'shape.dart';

part 'api.g.dart';

@JsonSerializable(includeIfNull: false)
class Api {
  final Map<String, Operation> operations;
  final Map<String, Shape> shapes;

  Api(
    this.operations,
    this.shapes,
  ) {
    operations?.values?.forEach((o) => o.api = this);
    shapes?.entries?.forEach((e) => e.value.api = this);
  }

  factory Api.fromJson(Map<String, dynamic> json) => _$ApiFromJson(json);

  Map<String, dynamic> toJson() => _$ApiToJson(this);
}
