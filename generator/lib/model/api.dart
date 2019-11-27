import 'package:aws_client.generator/model/operation.dart';
import 'package:aws_client.generator/model/shape.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api.g.dart';

@JsonSerializable(createToJson: false)
class Api {
  final String version;
  final Metadata metadata;
  final Map<String, Operation> operations;
  final Map<String, Shape> shapes;
  final String documentation;

  Api(this.metadata, this.operations, this.shapes, this.version, this.documentation);

  factory Api.fromJson(Map<String, dynamic> json) => _$ApiFromJson(json);
}

@JsonSerializable(createToJson: false)
class Metadata {
  final String uid;
  final String apiVersion;
  final String endpointPrefix;
  final String signingName;
  final String globalEndpoint;
  final String signatureVersion;
  final String jsonVersion;
  final String targetPrefix;
  final String protocol;

  /*
  If null, timeStampFormat should be set according to a set of rules:
  If location is in a header: 'rfc822'
  If location is in a querystring: 'iso8601'
  If protocol is 'json' or 'rest-json': unixTimestamp
  If protocol is 'rest-xml', 'query' or 'ec2': iso8601
   */
  final String timeStampFormat;
  final String xmlNamespaceUri;
  final String serviceAbbreviation;
  final String serviceFullName;
  final String serviceId;

  Metadata(
    this.apiVersion,
    this.endpointPrefix,
    this.signingName,
    this.globalEndpoint,
    this.signatureVersion,
    this.jsonVersion,
    this.targetPrefix,
    this.protocol,
    this.timeStampFormat,
    this.xmlNamespaceUri,
    this.serviceAbbreviation,
    this.serviceFullName,
    this.serviceId,
    this.uid,
  );

  String get className => (serviceAbbreviation ?? serviceFullName)
      .replaceAll(RegExp(r'^Amazon|AWS\s*|\(.*|\s+|\W+'), '');

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}
