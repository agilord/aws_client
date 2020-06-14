import 'package:json_annotation/json_annotation.dart';

import 'descriptor.dart';

part 'operation.g.dart';

@JsonSerializable(includeIfNull: false)
class Operation {
  final String name;
  final Descriptor input;
  final Descriptor output;

  Operation(
    this.name,
    this.input,
    this.output,
  );

  factory Operation.fromJson(Map<String, dynamic> json) =>
      _$OperationFromJson(json);

  Map<String, dynamic> toJson() => _$OperationToJson(this);
}
