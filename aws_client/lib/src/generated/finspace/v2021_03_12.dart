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

/// The FinSpace management service provides the APIs for managing FinSpace
/// environments.
class Finspace {
  final _s.RestJsonProtocol _protocol;
  Finspace({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'finspace',
            signingName: 'finspace',
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

  /// Create a new FinSpace environment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [name] :
  /// The name of the FinSpace environment to be created.
  ///
  /// Parameter [dataBundles] :
  /// The list of Amazon Resource Names (ARN) of the data bundles to install.
  /// Currently supported data bundle ARNs:
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:finspace:${Region}::data-bundle/capital-markets-sample</code>
  /// - Contains sample Capital Markets datasets, categories and controlled
  /// vocabularies.
  /// </li>
  /// <li>
  /// <code>arn:aws:finspace:${Region}::data-bundle/taq</code> (default) -
  /// Contains trades and quotes data in addition to sample Capital Markets
  /// data.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// The description of the FinSpace environment to be created.
  ///
  /// Parameter [federationMode] :
  /// Authentication mode for the environment.
  ///
  /// <ul>
  /// <li>
  /// <code>FEDERATED</code> - Users access FinSpace through Single Sign On
  /// (SSO) via your Identity provider.
  /// </li>
  /// <li>
  /// <code>LOCAL</code> - Users access FinSpace via email and password managed
  /// within the FinSpace environment.
  /// </li>
  /// </ul>
  ///
  /// Parameter [federationParameters] :
  /// Configuration information when authentication mode is FEDERATED.
  ///
  /// Parameter [kmsKeyId] :
  /// The KMS key id to encrypt your data in the FinSpace environment.
  ///
  /// Parameter [superuserParameters] :
  /// Configuration information for the superuser.
  ///
  /// Parameter [tags] :
  /// Add tags to your FinSpace environment.
  Future<CreateEnvironmentResponse> createEnvironment({
    required String name,
    List<String>? dataBundles,
    String? description,
    FederationMode? federationMode,
    FederationParameters? federationParameters,
    String? kmsKeyId,
    SuperuserParameters? superuserParameters,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (dataBundles != null) 'dataBundles': dataBundles,
      if (description != null) 'description': description,
      if (federationMode != null) 'federationMode': federationMode.toValue(),
      if (federationParameters != null)
        'federationParameters': federationParameters,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (superuserParameters != null)
        'superuserParameters': superuserParameters,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/environment',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEnvironmentResponse.fromJson(response);
  }

  /// Delete an FinSpace environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// The identifier for the FinSpace environment.
  Future<void> deleteEnvironment({
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/environment/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the FinSpace environment object.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [environmentId] :
  /// The identifier of the FinSpace environment.
  Future<GetEnvironmentResponse> getEnvironment({
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/environment/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnvironmentResponse.fromJson(response);
  }

  /// A list of all of your FinSpace environments.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this request.
  ///
  /// Parameter [nextToken] :
  /// A token generated by FinSpace that specifies where to continue pagination
  /// if a previous request was truncated. To get the next set of pages, pass in
  /// the nextToken value from the response object of the previous page call.
  Future<ListEnvironmentsResponse> listEnvironments({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/environment',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnvironmentsResponse.fromJson(response);
  }

  /// A list of all tags for a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name of the resource.
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

  /// Adds metadata tags to a FinSpace resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource.
  ///
  /// Parameter [tags] :
  /// One or more tags to be assigned to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes metadata tags from a FinSpace resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// A FinSpace resource from which you want to remove a tag or tags. The value
  /// for this parameter is an Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// The tag keys (names) of one or more tags to be removed.
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

  /// Update your FinSpace environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [environmentId] :
  /// The identifier of the FinSpace environment.
  ///
  /// Parameter [description] :
  /// The description of the environment.
  ///
  /// Parameter [federationMode] :
  /// Authentication mode for the environment.
  ///
  /// <ul>
  /// <li>
  /// <code>FEDERATED</code> - Users access FinSpace through Single Sign On
  /// (SSO) via your Identity provider.
  /// </li>
  /// <li>
  /// <code>LOCAL</code> - Users access FinSpace via email and password managed
  /// within the FinSpace environment.
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The name of the environment.
  Future<UpdateEnvironmentResponse> updateEnvironment({
    required String environmentId,
    String? description,
    FederationMode? federationMode,
    FederationParameters? federationParameters,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (federationMode != null) 'federationMode': federationMode.toValue(),
      if (federationParameters != null)
        'federationParameters': federationParameters,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/environment/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEnvironmentResponse.fromJson(response);
  }
}

class CreateEnvironmentResponse {
  /// The Amazon Resource Name (ARN) of the FinSpace environment that you created.
  final String? environmentArn;

  /// The unique identifier for FinSpace environment that you created.
  final String? environmentId;

  /// The sign-in url for the web application of the FinSpace environment you
  /// created.
  final String? environmentUrl;

  CreateEnvironmentResponse({
    this.environmentArn,
    this.environmentId,
    this.environmentUrl,
  });

  factory CreateEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentResponse(
      environmentArn: json['environmentArn'] as String?,
      environmentId: json['environmentId'] as String?,
      environmentUrl: json['environmentUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final environmentUrl = this.environmentUrl;
    return {
      if (environmentArn != null) 'environmentArn': environmentArn,
      if (environmentId != null) 'environmentId': environmentId,
      if (environmentUrl != null) 'environmentUrl': environmentUrl,
    };
  }
}

class DeleteEnvironmentResponse {
  DeleteEnvironmentResponse();

  factory DeleteEnvironmentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEnvironmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents an FinSpace environment.
class Environment {
  /// The ID of the AWS account in which the FinSpace environment is created.
  final String? awsAccountId;

  /// The AWS account ID of the dedicated service account associated with your
  /// FinSpace environment.
  final String? dedicatedServiceAccountId;

  /// The description of the FinSpace environment.
  final String? description;

  /// The Amazon Resource Name (ARN) of your FinSpace environment.
  final String? environmentArn;

  /// The identifier of the FinSpace environment.
  final String? environmentId;

  /// The sign-in url for the web application of your FinSpace environment.
  final String? environmentUrl;

  /// The authentication mode for the environment.
  final FederationMode? federationMode;

  /// Configuration information when authentication mode is FEDERATED.
  final FederationParameters? federationParameters;

  /// The KMS key id used to encrypt in the FinSpace environment.
  final String? kmsKeyId;

  /// The name of the FinSpace environment.
  final String? name;

  /// The url of the integrated FinSpace notebook environment in your web
  /// application.
  final String? sageMakerStudioDomainUrl;

  /// The current status of creation of the FinSpace environment.
  final EnvironmentStatus? status;

  Environment({
    this.awsAccountId,
    this.dedicatedServiceAccountId,
    this.description,
    this.environmentArn,
    this.environmentId,
    this.environmentUrl,
    this.federationMode,
    this.federationParameters,
    this.kmsKeyId,
    this.name,
    this.sageMakerStudioDomainUrl,
    this.status,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      awsAccountId: json['awsAccountId'] as String?,
      dedicatedServiceAccountId: json['dedicatedServiceAccountId'] as String?,
      description: json['description'] as String?,
      environmentArn: json['environmentArn'] as String?,
      environmentId: json['environmentId'] as String?,
      environmentUrl: json['environmentUrl'] as String?,
      federationMode: (json['federationMode'] as String?)?.toFederationMode(),
      federationParameters: json['federationParameters'] != null
          ? FederationParameters.fromJson(
              json['federationParameters'] as Map<String, dynamic>)
          : null,
      kmsKeyId: json['kmsKeyId'] as String?,
      name: json['name'] as String?,
      sageMakerStudioDomainUrl: json['sageMakerStudioDomainUrl'] as String?,
      status: (json['status'] as String?)?.toEnvironmentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final dedicatedServiceAccountId = this.dedicatedServiceAccountId;
    final description = this.description;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final environmentUrl = this.environmentUrl;
    final federationMode = this.federationMode;
    final federationParameters = this.federationParameters;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final sageMakerStudioDomainUrl = this.sageMakerStudioDomainUrl;
    final status = this.status;
    return {
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (dedicatedServiceAccountId != null)
        'dedicatedServiceAccountId': dedicatedServiceAccountId,
      if (description != null) 'description': description,
      if (environmentArn != null) 'environmentArn': environmentArn,
      if (environmentId != null) 'environmentId': environmentId,
      if (environmentUrl != null) 'environmentUrl': environmentUrl,
      if (federationMode != null) 'federationMode': federationMode.toValue(),
      if (federationParameters != null)
        'federationParameters': federationParameters,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (name != null) 'name': name,
      if (sageMakerStudioDomainUrl != null)
        'sageMakerStudioDomainUrl': sageMakerStudioDomainUrl,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum EnvironmentStatus {
  createRequested,
  creating,
  created,
  deleteRequested,
  deleting,
  deleted,
  failedCreation,
  retryDeletion,
  failedDeletion,
  suspended,
}

extension EnvironmentStatusValueExtension on EnvironmentStatus {
  String toValue() {
    switch (this) {
      case EnvironmentStatus.createRequested:
        return 'CREATE_REQUESTED';
      case EnvironmentStatus.creating:
        return 'CREATING';
      case EnvironmentStatus.created:
        return 'CREATED';
      case EnvironmentStatus.deleteRequested:
        return 'DELETE_REQUESTED';
      case EnvironmentStatus.deleting:
        return 'DELETING';
      case EnvironmentStatus.deleted:
        return 'DELETED';
      case EnvironmentStatus.failedCreation:
        return 'FAILED_CREATION';
      case EnvironmentStatus.retryDeletion:
        return 'RETRY_DELETION';
      case EnvironmentStatus.failedDeletion:
        return 'FAILED_DELETION';
      case EnvironmentStatus.suspended:
        return 'SUSPENDED';
    }
  }
}

extension EnvironmentStatusFromString on String {
  EnvironmentStatus toEnvironmentStatus() {
    switch (this) {
      case 'CREATE_REQUESTED':
        return EnvironmentStatus.createRequested;
      case 'CREATING':
        return EnvironmentStatus.creating;
      case 'CREATED':
        return EnvironmentStatus.created;
      case 'DELETE_REQUESTED':
        return EnvironmentStatus.deleteRequested;
      case 'DELETING':
        return EnvironmentStatus.deleting;
      case 'DELETED':
        return EnvironmentStatus.deleted;
      case 'FAILED_CREATION':
        return EnvironmentStatus.failedCreation;
      case 'RETRY_DELETION':
        return EnvironmentStatus.retryDeletion;
      case 'FAILED_DELETION':
        return EnvironmentStatus.failedDeletion;
      case 'SUSPENDED':
        return EnvironmentStatus.suspended;
    }
    throw Exception('$this is not known in enum EnvironmentStatus');
  }
}

enum FederationMode {
  federated,
  local,
}

extension FederationModeValueExtension on FederationMode {
  String toValue() {
    switch (this) {
      case FederationMode.federated:
        return 'FEDERATED';
      case FederationMode.local:
        return 'LOCAL';
    }
  }
}

extension FederationModeFromString on String {
  FederationMode toFederationMode() {
    switch (this) {
      case 'FEDERATED':
        return FederationMode.federated;
      case 'LOCAL':
        return FederationMode.local;
    }
    throw Exception('$this is not known in enum FederationMode');
  }
}

/// Configuration information when authentication mode is FEDERATED.
class FederationParameters {
  /// The redirect or sign-in URL that should be entered into the SAML 2.0
  /// compliant identity provider configuration (IdP).
  final String? applicationCallBackURL;

  /// SAML attribute name and value. The name must always be <code>Email</code>
  /// and the value should be set to the attribute definition in which user email
  /// is set. For example, name would be <code>Email</code> and value
  /// <code>http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress</code>.
  /// Please check your SAML 2.0 compliant identity provider (IdP) documentation
  /// for details.
  final Map<String, String>? attributeMap;

  /// Name of the identity provider (IdP).
  final String? federationProviderName;

  /// The Uniform Resource Name (URN). Also referred as Service Provider URN or
  /// Audience URI or Service Provider Entity ID.
  final String? federationURN;

  /// SAML 2.0 Metadata document from identity provider (IdP).
  final String? samlMetadataDocument;

  /// Provide the metadata URL from your SAML 2.0 compliant identity provider
  /// (IdP).
  final String? samlMetadataURL;

  FederationParameters({
    this.applicationCallBackURL,
    this.attributeMap,
    this.federationProviderName,
    this.federationURN,
    this.samlMetadataDocument,
    this.samlMetadataURL,
  });

  factory FederationParameters.fromJson(Map<String, dynamic> json) {
    return FederationParameters(
      applicationCallBackURL: json['applicationCallBackURL'] as String?,
      attributeMap: (json['attributeMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      federationProviderName: json['federationProviderName'] as String?,
      federationURN: json['federationURN'] as String?,
      samlMetadataDocument: json['samlMetadataDocument'] as String?,
      samlMetadataURL: json['samlMetadataURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationCallBackURL = this.applicationCallBackURL;
    final attributeMap = this.attributeMap;
    final federationProviderName = this.federationProviderName;
    final federationURN = this.federationURN;
    final samlMetadataDocument = this.samlMetadataDocument;
    final samlMetadataURL = this.samlMetadataURL;
    return {
      if (applicationCallBackURL != null)
        'applicationCallBackURL': applicationCallBackURL,
      if (attributeMap != null) 'attributeMap': attributeMap,
      if (federationProviderName != null)
        'federationProviderName': federationProviderName,
      if (federationURN != null) 'federationURN': federationURN,
      if (samlMetadataDocument != null)
        'samlMetadataDocument': samlMetadataDocument,
      if (samlMetadataURL != null) 'samlMetadataURL': samlMetadataURL,
    };
  }
}

class GetEnvironmentResponse {
  /// The name of the FinSpace environment.
  final Environment? environment;

  GetEnvironmentResponse({
    this.environment,
  });

  factory GetEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentResponse(
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      if (environment != null) 'environment': environment,
    };
  }
}

class ListEnvironmentsResponse {
  /// A list of all of your FinSpace environments.
  final List<Environment>? environments;

  /// A token that you can use in a subsequent call to retrieve the next set of
  /// results.
  final String? nextToken;

  ListEnvironmentsResponse({
    this.environments,
    this.nextToken,
  });

  factory ListEnvironmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentsResponse(
      environments: (json['environments'] as List?)
          ?.whereNotNull()
          .map((e) => Environment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environments = this.environments;
    final nextToken = this.nextToken;
    return {
      if (environments != null) 'environments': environments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of all tags for a resource.
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

/// Configuration information for the superuser.
class SuperuserParameters {
  /// The email address of the superuser.
  final String emailAddress;

  /// The first name of the superuser.
  final String firstName;

  /// The last name of the superuser.
  final String lastName;

  SuperuserParameters({
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() {
    final emailAddress = this.emailAddress;
    final firstName = this.firstName;
    final lastName = this.lastName;
    return {
      'emailAddress': emailAddress,
      'firstName': firstName,
      'lastName': lastName,
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

class UpdateEnvironmentResponse {
  /// Returns the FinSpace environment object.
  final Environment? environment;

  UpdateEnvironmentResponse({
    this.environment,
  });

  factory UpdateEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEnvironmentResponse(
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environment = this.environment;
    return {
      if (environment != null) 'environment': environment,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
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
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
