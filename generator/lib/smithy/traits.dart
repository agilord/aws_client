import 'ast.dart';

class TraitIds {
  static const awsJson1_0 = 'aws.protocols#awsJson1_0';
  static const awsJson1_1 = 'aws.protocols#awsJson1_1';
  static const restJson1 = 'aws.protocols#restJson1';
  static const restXml = 'aws.protocols#restXml';
  static const awsQuery = 'aws.protocols#awsQuery';
  static const ec2Query = 'aws.protocols#ec2Query';

  static const awsApiService = 'aws.api#service';
  static const sigv4 = 'aws.auth#sigv4';

  static const optionalAuth = 'smithy.api#optionalAuth';
  static const unsignedPayload = 'aws.auth#unsignedPayload';
  static const documentation = 'smithy.api#documentation';
  static const title = 'smithy.api#title';
  static const deprecated = 'smithy.api#deprecated';

  static const required = 'smithy.api#required';
  static const sensitive = 'smithy.api#sensitive';
  static const enumTrait = 'smithy.api#enum';
  static const length = 'smithy.api#length';
  static const range = 'smithy.api#range';
  static const pattern = 'smithy.api#pattern';
  static const mediaType = 'smithy.api#mediaType';
  static const error = 'smithy.api#error';
  static const httpError = 'smithy.api#httpError';
  static const jsonName = 'smithy.api#jsonName';
  static const xmlName = 'smithy.api#xmlName';
  static const xmlNamespace = 'smithy.api#xmlNamespace';
  static const xmlFlattened = 'smithy.api#xmlFlattened';
  static const xmlAttribute = 'smithy.api#xmlAttribute';

  static const http = 'smithy.api#http';
  static const httpLabel = 'smithy.api#httpLabel';
  static const httpQuery = 'smithy.api#httpQuery';
  static const httpHeader = 'smithy.api#httpHeader';
  static const httpPrefixHeaders = 'smithy.api#httpPrefixHeaders';
  static const httpPayload = 'smithy.api#httpPayload';
  static const httpResponseCode = 'smithy.api#httpResponseCode';
  static const timestampFormat = 'smithy.api#timestampFormat';
  static const idempotencyToken = 'smithy.api#idempotencyToken';
  static const hostLabel = 'smithy.api#hostLabel';

  // Adapter-internal only — not a real Smithy trait. Carries the fixture's
  // original wire name so the generated client emits the expected Action/target.
  static const operationWireName = 'aws_client.adapter#operationWireName';

  static const _protocols = {
    awsJson1_0,
    awsJson1_1,
    restJson1,
    restXml,
    awsQuery,
    ec2Query,
  };
}

extension TraitMap on Map<String, Object?> {
  bool has(String id) => containsKey(id);

  Map<String, Object?>? object(String id) {
    final v = this[id];
    return v is Map ? v.cast<String, Object?>() : null;
  }

  String? string(String id) {
    final v = this[id];
    return v is String ? v : null;
  }
}

extension ShapeTraits on SmithyShape {
  String? get documentation => traits.string(TraitIds.documentation);

  String? get protocolTraitId {
    for (final id in TraitIds._protocols) {
      if (traits.has(id)) return id;
    }
    return null;
  }
}

extension RefTraits on ShapeRef {
  bool get isRequired => traits.has(TraitIds.required);
  String? get documentation => traits.string(TraitIds.documentation);
}
