import 'package:json_annotation/json_annotation.dart';

import '../utils/aws_names.dart';

import '../utils/case.dart';
import 'descriptor.dart';
import 'operation.dart';
import 'shape.dart';
part 'api.g.dart';

@JsonSerializable(createToJson: false)
class Api {
  static bool isGeneratingSinglePackage = false;

  final String? version;
  final Metadata metadata;
  final Map<String, Operation> operations;
  final Map<String, Shape> shapes;
  final String? documentation;
  final Map<String, dynamic>? examples;
  final Map<String, Authorizer>? authorizers;

  Api(
    this.metadata,
    this.operations,
    this.shapes,
    this.version,
    this.documentation,
    this.examples,
    this.authorizers,
  );

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
      if (e.value.exception) {
        e.value.markUsed(false);
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

  String get directoryPath {
    // TODO: lowercase directory name
    return metadata.className;
  }

  String get fileBasename {
    if (isGeneratingSinglePackage) {
      return _singlePackageFileBasename;
    }
    // TODO: lowercase file name
    return metadata.uid ?? '${metadata.endpointPrefix}-${metadata.apiVersion}';
  }

  String get _singlePackageFileBasename =>
      'v${metadata.apiVersion.replaceAll('-', '_')}';

  bool get isRecognized => packageBaseName != null;

  String get packageName {
    if (packageBaseName == null) {
      throw ArgumentError('API not recognized: $fileBasename');
    }
    return 'aws_${packageBaseName?.replaceAll('-', '_')}_api';
  }

  String? get packageBaseName {
    final candidates = <String?>[
      metadata.uid?.split('-20').first,
      metadata.className.toLowerCase(),
      metadata.endpointPrefix
    ];
    final identified = candidates
        .firstWhere((c) => awsCliServiceNames.contains(c), orElse: () => null);
    if (identified != null) {
      return identified;
    }

    final mapped = {
      'codedeploy-2014-10-06': 'deploy',
      'elasticloadbalancing-2012-06-01': 'elb',
      'elasticloadbalancingv2-2015-12-01': 'elbv2',
      'devices-2018-05-14': 'iot1click-devices',
      'runtime.lex-2016-11-28': 'lex-runtime',
      'entitlement.marketplace-2017-01-11': 'marketplace-entitlement',
      'runtime.sagemaker-2017-05-13': 'sagemaker-runtime',
    }[fileBasename];
    if (mapped != null && awsCliServiceNames.contains(mapped)) {
      return mapped;
    }
    return null;
  }

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
    this.xmlNamespace,
    this.checksumFormat,
    this.protocolSettings,
    this.protocols,
    this.auth,
    this.awsQueryCompatible,
    this.ripServiceName,
  );

  String get className {
    if (Api.isGeneratingSinglePackage) {
      return _singlePackageClassName;
    }

    final name = (serviceAbbreviation ?? serviceFullName)
        .replaceAll(RegExp(r'^Amazon|AWS\s*|\(.*|\s+|\W+'), '');
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }

  String get _singlePackageClassName {
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
