import 'package:json_annotation/json_annotation.dart';

import 'api.dart';
import 'descriptor.dart';

part 'operation.g.dart';

@JsonSerializable(includeIfNull: false)
class Operation {
  @JsonKey(ignore: true)
  Api _api;
  final String name;
  final Descriptor input;
  final Descriptor output;

  Operation(
    this.name,
    this.input,
    this.output,
  );

  Api get api => _api;

  set api(Api api) {
    _api = api;
    input?.api = api;
    output?.api = api;
  }

  factory Operation.fromJson(Map<String, dynamic> json) =>
      _$OperationFromJson(json);

  Map<String, dynamic> toJson() => _$OperationToJson(this);
}
