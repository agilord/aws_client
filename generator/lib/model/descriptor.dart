import 'package:json_annotation/json_annotation.dart';

import 'error.dart';
import 'xml_namespace.dart';

part 'descriptor.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Descriptor {
  final String shape;
  final String resultWrapper;
  final String locationName;
  final String documentation;
  @JsonKey(defaultValue: false)
  final bool exception;
  final HttpError error;
  @JsonKey(defaultValue: false)
  final bool fault;
  final XmlNamespace xmlNamespace;
  @JsonKey(defaultValue: false)
  final bool jsonvalue;

  Descriptor(
    this.shape,
    this.resultWrapper,
    this.locationName,
    this.documentation,
    this.exception,
    this.error,
    this.fault,
    this.xmlNamespace,
    this.jsonvalue,
  );

  factory Descriptor.fromJson(Map<String, dynamic> json) =>
      _$DescriptorFromJson(json);
}
