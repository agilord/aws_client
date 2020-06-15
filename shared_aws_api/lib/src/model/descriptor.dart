import 'package:json_annotation/json_annotation.dart';

part 'descriptor.g.dart';

@JsonSerializable(includeIfNull: false)
class Descriptor {
  final String shape;

  Descriptor(
    this.shape,
  );

  factory Descriptor.fromJson(Map<String, dynamic> json) =>
      _$DescriptorFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptorToJson(this);
}
