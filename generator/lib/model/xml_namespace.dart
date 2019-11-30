import 'package:json_annotation/json_annotation.dart';

part 'xml_namespace.g.dart';

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class XmlNamespace {
  final String uri;
  final String prefix;

  XmlNamespace(this.uri, this.prefix);

  factory XmlNamespace.fromJson(Map<String, dynamic> json) =>
      _$XmlNamespaceFromJson(json);
}