// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// The AWS Marketplace Deployment Service supports the Quick Launch experience,
/// which is a deployment option for software as a service (SaaS) products.
/// Quick Launch simplifies and reduces the time, resources, and steps required
/// to configure, deploy, and launch a products. The AWS Marketplace Deployment
/// Service provides sellers with a secure method for passing deployment
/// parameters (for example, API keys and external IDs) to buyers during the
/// Quick Launch experience.
class MarketplaceDeployment {
  final _s.RestJsonProtocol _protocol;
  MarketplaceDeployment({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'deployment-marketplace',
            signingName: 'aws-marketplace',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Lists all tags that have been added to a deployment parameter resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) associated with the deployment parameter
  /// resource you want to list tags on.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Creates or updates a deployment parameter and is targeted by
  /// <code>catalog</code> and <code>agreementId</code>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement.
  ///
  /// Parameter [catalog] :
  /// The catalog related to the request. Fixed value: <code>AWS
  /// Marketplace</code>
  ///
  /// Parameter [deploymentParameter] :
  /// The deployment parameter targeted to the acceptor of an agreement for
  /// which to create the AWS Secret Manager resource.
  ///
  /// Parameter [productId] :
  /// The product for which AWS Marketplace will save secrets for the buyer’s
  /// account.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for deployment parameters. A unique identifier for
  /// the new version.
  ///
  /// Parameter [expirationDate] :
  /// The date when deployment parameters expire and are scheduled for deletion.
  ///
  /// Parameter [tags] :
  /// A map of key-value pairs, where each pair represents a tag saved to the
  /// resource. Tags will only be applied for create operations, and they'll be
  /// ignored if the resource already exists.
  Future<PutDeploymentParameterResponse> putDeploymentParameter({
    required String agreementId,
    required String catalog,
    required DeploymentParameterInput deploymentParameter,
    required String productId,
    String? clientToken,
    DateTime? expirationDate,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'agreementId': agreementId,
      'deploymentParameter': deploymentParameter,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (expirationDate != null)
        'expirationDate': iso8601ToJson(expirationDate),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/catalogs/${Uri.encodeComponent(catalog)}/products/${Uri.encodeComponent(productId)}/deployment-parameters',
      exceptionFnMap: _exceptionFns,
    );
    return PutDeploymentParameterResponse.fromJson(response);
  }

  /// Tags a resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) associated with the resource you want to
  /// tag.
  ///
  /// Parameter [tags] :
  /// A map of key-value pairs, where each pair represents a tag present on the
  /// resource.
  Future<void> tagResource({
    required String resourceArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag or list of tags from a resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) associated with the resource you want to
  /// remove the tag from.
  ///
  /// Parameter [tagKeys] :
  /// A list of key names of tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// The shape containing the requested deployment parameter name and
/// secretString.
class DeploymentParameterInput {
  /// The desired name of the deployment parameter. This is the identifier on
  /// which deployment parameters are keyed for a given buyer and product. If this
  /// name matches an existing deployment parameter, this request will update the
  /// existing resource.
  final String name;

  /// The text to encrypt and store in the secret.
  final String secretString;

  DeploymentParameterInput({
    required this.name,
    required this.secretString,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final secretString = this.secretString;
    return {
      'name': name,
      'secretString': secretString,
    };
  }
}

class ListTagsForResourceResponse {
  /// A map of key-value pairs, where each pair represents a tag present on the
  /// resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

class PutDeploymentParameterResponse {
  /// The unique identifier of the agreement.
  final String agreementId;

  /// The unique identifier of the deployment parameter.
  final String deploymentParameterId;

  /// The Amazon Resource Name (ARN) associated with the deployment parameter
  /// resource you want to create or update.
  final String resourceArn;

  /// A map of key-value pairs, where each pair represents a tag saved to the
  /// resource. Tags will only be applied for create operations, and they'll be
  /// ignored if the resource already exists.
  final Map<String, String>? tags;

  PutDeploymentParameterResponse({
    required this.agreementId,
    required this.deploymentParameterId,
    required this.resourceArn,
    this.tags,
  });

  factory PutDeploymentParameterResponse.fromJson(Map<String, dynamic> json) {
    return PutDeploymentParameterResponse(
      agreementId: json['agreementId'] as String,
      deploymentParameterId: json['deploymentParameterId'] as String,
      resourceArn: json['resourceArn'] as String,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    final deploymentParameterId = this.deploymentParameterId;
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      'agreementId': agreementId,
      'deploymentParameterId': deploymentParameterId,
      'resourceArn': resourceArn,
      if (tags != null) 'tags': tags,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
