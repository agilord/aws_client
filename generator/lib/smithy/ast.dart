import 'package:json_annotation/json_annotation.dart';

part 'ast.g.dart';

@JsonSerializable(createToJson: false)
class SmithyModel {
  final String smithy;
  final Map<String, SmithyShape> shapes;

  SmithyModel(this.smithy, this.shapes);

  factory SmithyModel.fromJson(Map<String, dynamic> json) =>
      _$SmithyModelFromJson(json);

  MapEntry<String, SmithyShape> get service =>
      shapes.entries.firstWhere((e) => e.value.type == 'service',
          orElse: () => throw StateError('Model has no service shape'));
}

@JsonSerializable(createToJson: false)
class SmithyShape {
  final String type;

  final String? version;
  final List<ShapeRef>? operations;
  final List<ShapeRef>? resources;

  final ShapeRef? create;
  final ShapeRef? put;
  final ShapeRef? read;
  final ShapeRef? update;
  final ShapeRef? delete;
  final ShapeRef? list;
  final List<ShapeRef>? collectionOperations;

  final ShapeRef? input;
  final ShapeRef? output;
  final List<ShapeRef>? errors;

  final Map<String, ShapeRef>? members;

  final ShapeRef? member;

  final ShapeRef? key;
  final ShapeRef? value;

  final List<ShapeRef>? mixins;

  @JsonKey(defaultValue: {})
  final Map<String, Object?> traits;

  SmithyShape(
    this.type,
    this.version,
    this.operations,
    this.resources,
    this.create,
    this.put,
    this.read,
    this.update,
    this.delete,
    this.list,
    this.collectionOperations,
    this.input,
    this.output,
    this.errors,
    this.members,
    this.member,
    this.key,
    this.value,
    this.mixins,
    this.traits,
  );

  factory SmithyShape.fromJson(Map<String, dynamic> json) =>
      _$SmithyShapeFromJson(json);
}

@JsonSerializable(createToJson: false)
class ShapeRef {
  final String target;

  @JsonKey(defaultValue: {})
  final Map<String, Object?> traits;

  ShapeRef(this.target, this.traits);

  factory ShapeRef.fromJson(Map<String, dynamic> json) =>
      _$ShapeRefFromJson(json);
}
