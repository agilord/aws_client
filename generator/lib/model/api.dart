import 'package:json_annotation/json_annotation.dart';

import '../utils/case.dart';
import 'descriptor.dart';
import 'operation.dart';
import 'shape.dart';
part 'api.g.dart';

@JsonSerializable(createToJson: false)
class Api {
  final String? version;
  final Metadata metadata;
  final Map<String, Operation> operations;
  final Map<String, Shape> shapes;
  final String? documentation;
  final Map<String, dynamic>? examples;
  final Map<String, Authorizer>? authorizers;

  Api({
    required this.metadata,
    required this.operations,
    required this.shapes,
    this.version,
    this.documentation,
    this.examples,
    this.authorizers,
  });

  factory Api.fromJson(Map<String, dynamic> json) => _$ApiFromJson(json);

  void initReferences() {
    for (var o in operations.values) {
      o.api = this;
      o.initReferences();
    }
    for (var e in shapes.entries) {
      e.value.name = e.key;
      e.value.api = this;
      e.value.initReferences();
    }
    // markUsed traverses the graph, so all initReferences must run first.
    for (var s in shapes.values) {
      if (s.exception) {
        s.markUsed(false);
      }
    }
  }

  bool get usesQueryProtocol => metadata.protocol == 'query';

  bool get usesJsonProtocol => metadata.protocol == 'json';

  bool get usesRestJsonProtocol => metadata.protocol == 'rest-json';

  bool get usesRestXmlProtocol => metadata.protocol == 'rest-xml';

  bool get usesEc2Protocol => metadata.protocol == 'ec2';

  bool get generateFromJson => usesJsonProtocol || usesRestJsonProtocol;

  bool get generateToJson =>
      usesJsonProtocol || usesRestJsonProtocol || usesQueryProtocol;

  bool get generateJson => generateFromJson || generateToJson;

  bool get generateFromXml => usesQueryProtocol || usesRestXmlProtocol;

  bool get generateToXml => usesRestXmlProtocol;

  String get fileBasename => 'v${metadata.apiVersion.replaceAll('-', '_')}';

  List<String>? _exceptions;

  List<String> get exceptions {
    if (_exceptions == null) {
      final set = operations.values
          .expand((o) => o.errors ?? <Descriptor>[])
          .map((d) => d.shape)
          .toSet();
      set.addAll(shapes.values.where((s) => s.exception).map((s) => s.name));
      _exceptions = set.toList()..sort();
    }
    return _exceptions!;
  }

  bool get isGlobalService => const {
        'budgets',
        'cloudfront',
        'iam',
        'importexport',
        'route53',
        'sts',
        'waf',
      }.contains(metadata.endpointPrefix);

  String get directoryName {
    var name = const {
      'SESv2': 'ses_v2',
    }[metadata.serviceId];
    if (name != null) return name;

    name = metadata.serviceId ??
        metadata.serviceAbbreviation ??
        metadata.uid?.split('-20').first.toLowerCase() ??
        metadata.serviceFullName;
    return snakeCase(splitWords(name));
  }
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Metadata {
  final String? uid;
  final String apiVersion;
  final String endpointPrefix;
  final String? signingName;
  final String? globalEndpoint;
  final String? signatureVersion;
  final String? jsonVersion;
  final String? targetPrefix;
  final String protocol;
  final List<String>? protocols;

  // If null, timeStampFormat should be set according to a set of rules:
  // If location is in a header: 'rfc822'
  // If location is in a querystring: 'iso8601'
  // If protocol is 'json' or 'rest-json': unixTimestamp
  // If protocol is 'rest-xml', 'query' or 'ec2': iso8601
  final String? timeStampFormat;
  final String? xmlNamespaceUri;
  final String? xmlNamespace;
  final String? serviceAbbreviation;
  final String serviceFullName;
  final String? serviceId;
  final String? checksumFormat;
  final Map<String, String>? protocolSettings;
  final Object? auth;
  final Object? awsQueryCompatible;
  final String? ripServiceName;

  Metadata({
    required this.apiVersion,
    required this.endpointPrefix,
    required this.protocol,
    required this.serviceFullName,
    this.signingName,
    this.globalEndpoint,
    this.signatureVersion,
    this.jsonVersion,
    this.targetPrefix,
    this.timeStampFormat,
    this.xmlNamespaceUri,
    this.serviceAbbreviation,
    this.serviceId,
    this.uid,
    this.xmlNamespace,
    this.checksumFormat,
    this.protocolSettings,
    this.protocols,
    this.auth,
    this.awsQueryCompatible,
    this.ripServiceName,
  });

  String get className {
    final baseName = (serviceAbbreviation ?? serviceFullName)
        .replaceAll(RegExp(r'^Amazon|AWS\s*'), '');

    // Try to follow Effective Dart: DO capitalize acronyms and abbreviations longer than two letters like words.
    // https://dart.dev/guides/language/effective-dart/style#do-capitalize-acronyms-and-abbreviations-longer-than-two-letters-like-words
    final words = splitWords(baseName).map((w) {
      if (const ['IoT'].contains(w) || w.length < 3) {
        return w;
      }
      return w.toLowerCase();
    }).toList();
    if (words.last == 'service' && words.first != 'config') {
      words.removeLast();
    }
    return upperCamel(words);
  }

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Authorizer {
  final String name;
  final String type;
  final Placement placement;

  Authorizer(this.name, this.type, this.placement);

  factory Authorizer.fromJson(Map<String, dynamic> json) =>
      _$AuthorizerFromJson(json);
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class Placement {
  final String location;
  final String name;

  Placement(this.location, this.name);

  factory Placement.fromJson(Map<String, dynamic> json) =>
      _$PlacementFromJson(json);
}
