// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Amazon API Gateway helps developers deliver robust, secure, and scalable
/// mobile and web application back ends. API Gateway allows developers to
/// securely connect mobile and web applications to APIs that run on Lambda,
/// Amazon EC2, or other publicly addressable web services that are hosted
/// outside of AWS.
class APIGateway {
  final _s.RestJsonProtocol _protocol;
  APIGateway({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'apigateway',
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

  /// Create an ApiKey resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [customerId] :
  /// An Amazon Web Services Marketplace customer identifier, when integrating
  /// with the Amazon Web Services SaaS Marketplace.
  ///
  /// Parameter [description] :
  /// The description of the ApiKey.
  ///
  /// Parameter [enabled] :
  /// Specifies whether the ApiKey can be used by callers.
  ///
  /// Parameter [generateDistinctId] :
  /// Specifies whether (<code>true</code>) or not (<code>false</code>) the key
  /// identifier is distinct from the created API key value. This parameter is
  /// deprecated and should not be used.
  ///
  /// Parameter [name] :
  /// The name of the ApiKey.
  ///
  /// Parameter [stageKeys] :
  /// DEPRECATED FOR USAGE PLANS - Specifies stages associated with the API key.
  ///
  /// Parameter [tags] :
  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  ///
  /// Parameter [value] :
  /// Specifies a value of the API key.
  Future<ApiKey> createApiKey({
    String? customerId,
    String? description,
    bool? enabled,
    bool? generateDistinctId,
    String? name,
    List<StageKey>? stageKeys,
    Map<String, String>? tags,
    String? value,
  }) async {
    final $payload = <String, dynamic>{
      if (customerId != null) 'customerId': customerId,
      if (description != null) 'description': description,
      if (enabled != null) 'enabled': enabled,
      if (generateDistinctId != null) 'generateDistinctId': generateDistinctId,
      if (name != null) 'name': name,
      if (stageKeys != null) 'stageKeys': stageKeys,
      if (tags != null) 'tags': tags,
      if (value != null) 'value': value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/apikeys',
      exceptionFnMap: _exceptionFns,
    );
    return ApiKey.fromJson(response);
  }

  /// Adds a new Authorizer resource to an existing RestApi resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the authorizer.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [type] :
  /// The authorizer type. Valid values are <code>TOKEN</code> for a Lambda
  /// function using a single authorization token submitted in a custom header,
  /// <code>REQUEST</code> for a Lambda function using incoming request
  /// parameters, and <code>COGNITO_USER_POOLS</code> for using an Amazon
  /// Cognito user pool.
  ///
  /// Parameter [authType] :
  /// Optional customer-defined field, used in OpenAPI imports and exports
  /// without functional impact.
  ///
  /// Parameter [authorizerCredentials] :
  /// Specifies the required credentials as an IAM role for API Gateway to
  /// invoke the authorizer. To specify an IAM role for API Gateway to assume,
  /// use the role's Amazon Resource Name (ARN). To use resource-based
  /// permissions on the Lambda function, specify null.
  ///
  /// Parameter [authorizerResultTtlInSeconds] :
  /// The TTL in seconds of cached authorizer results. If it equals 0,
  /// authorization caching is disabled. If it is greater than 0, API Gateway
  /// will cache authorizer responses. If this field is not set, the default
  /// value is 300. The maximum value is 3600, or 1 hour.
  ///
  /// Parameter [authorizerUri] :
  /// Specifies the authorizer's Uniform Resource Identifier (URI). For
  /// <code>TOKEN</code> or <code>REQUEST</code> authorizers, this must be a
  /// well-formed Lambda function URI, for example,
  /// <code>arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations</code>.
  /// In general, the URI has this form
  /// <code>arn:aws:apigateway:{region}:lambda:path/{service_api}</code>, where
  /// <code>{region}</code> is the same as the region hosting the Lambda
  /// function, <code>path</code> indicates that the remaining substring in the
  /// URI should be treated as the path to the resource, including the initial
  /// <code>/</code>. For Lambda functions, this is usually of the form
  /// <code>/2015-03-31/functions/[FunctionARN]/invocations</code>.
  ///
  /// Parameter [identitySource] :
  /// The identity source for which authorization is requested. For a
  /// <code>TOKEN</code> or <code>COGNITO_USER_POOLS</code> authorizer, this is
  /// required and specifies the request header mapping expression for the
  /// custom header holding the authorization token submitted by the client. For
  /// example, if the token header name is <code>Auth</code>, the header mapping
  /// expression is <code>method.request.header.Auth</code>. For the
  /// <code>REQUEST</code> authorizer, this is required when authorization
  /// caching is enabled. The value is a comma-separated string of one or more
  /// mapping expressions of the specified request parameters. For example, if
  /// an <code>Auth</code> header, a <code>Name</code> query string parameter
  /// are defined as identity sources, this value is
  /// <code>method.request.header.Auth, method.request.querystring.Name</code>.
  /// These parameters will be used to derive the authorization caching key and
  /// to perform runtime validation of the <code>REQUEST</code> authorizer by
  /// verifying all of the identity-related request parameters are present, not
  /// null and non-empty. Only when this is true does the authorizer invoke the
  /// authorizer Lambda function, otherwise, it returns a 401 Unauthorized
  /// response without calling the Lambda function. The valid value is a string
  /// of comma-separated mapping expressions of the specified request
  /// parameters. When the authorization caching is not enabled, this property
  /// is optional.
  ///
  /// Parameter [identityValidationExpression] :
  /// A validation expression for the incoming identity token. For
  /// <code>TOKEN</code> authorizers, this value is a regular expression. For
  /// <code>COGNITO_USER_POOLS</code> authorizers, API Gateway will match the
  /// <code>aud</code> field of the incoming token from the client against the
  /// specified regular expression. It will invoke the authorizer's Lambda
  /// function when there is a match. Otherwise, it will return a 401
  /// Unauthorized response without calling the Lambda function. The validation
  /// expression does not apply to the <code>REQUEST</code> authorizer.
  ///
  /// Parameter [providerARNs] :
  /// A list of the Amazon Cognito user pool ARNs for the
  /// <code>COGNITO_USER_POOLS</code> authorizer. Each element is of this
  /// format:
  /// <code>arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}</code>.
  /// For a <code>TOKEN</code> or <code>REQUEST</code> authorizer, this is not
  /// defined.
  Future<Authorizer> createAuthorizer({
    required String name,
    required String restApiId,
    required AuthorizerType type,
    String? authType,
    String? authorizerCredentials,
    int? authorizerResultTtlInSeconds,
    String? authorizerUri,
    String? identitySource,
    String? identityValidationExpression,
    List<String>? providerARNs,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'type': type.value,
      if (authType != null) 'authType': authType,
      if (authorizerCredentials != null)
        'authorizerCredentials': authorizerCredentials,
      if (authorizerResultTtlInSeconds != null)
        'authorizerResultTtlInSeconds': authorizerResultTtlInSeconds,
      if (authorizerUri != null) 'authorizerUri': authorizerUri,
      if (identitySource != null) 'identitySource': identitySource,
      if (identityValidationExpression != null)
        'identityValidationExpression': identityValidationExpression,
      if (providerARNs != null) 'providerARNs': providerARNs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}/authorizers',
      exceptionFnMap: _exceptionFns,
    );
    return Authorizer.fromJson(response);
  }

  /// Creates a new BasePathMapping resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The domain name of the BasePathMapping resource to create.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [basePath] :
  /// The base path name that callers of the API must provide as part of the URL
  /// after the domain name. This value must be unique for all of the mappings
  /// across a single API. Specify '(none)' if you do not want callers to
  /// specify a base path name after the domain name.
  ///
  /// Parameter [stage] :
  /// The name of the API's stage that you want to use for this mapping. Specify
  /// '(none)' if you want callers to explicitly specify the stage name after
  /// any base path name.
  Future<BasePathMapping> createBasePathMapping({
    required String domainName,
    required String restApiId,
    String? basePath,
    String? stage,
  }) async {
    final $payload = <String, dynamic>{
      'restApiId': restApiId,
      if (basePath != null) 'basePath': basePath,
      if (stage != null) 'stage': stage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domainnames/${Uri.encodeComponent(domainName)}/basepathmappings',
      exceptionFnMap: _exceptionFns,
    );
    return BasePathMapping.fromJson(response);
  }

  /// Creates a Deployment resource, which makes a specified RestApi callable
  /// over the internet.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [cacheClusterEnabled] :
  /// Enables a cache cluster for the Stage resource specified in the input.
  ///
  /// Parameter [cacheClusterSize] :
  /// The stage's cache capacity in GB. For more information about choosing a
  /// cache size, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-caching.html">Enabling
  /// API caching to enhance responsiveness</a>.
  ///
  /// Parameter [canarySettings] :
  /// The input configuration for the canary deployment when the deployment is a
  /// canary release deployment.
  ///
  /// Parameter [description] :
  /// The description for the Deployment resource to create.
  ///
  /// Parameter [stageDescription] :
  /// The description of the Stage resource for the Deployment resource to
  /// create.
  ///
  /// Parameter [stageName] :
  /// The name of the Stage resource for the Deployment resource to create.
  ///
  /// Parameter [tracingEnabled] :
  /// Specifies whether active tracing with X-ray is enabled for the Stage.
  ///
  /// Parameter [variables] :
  /// A map that defines the stage variables for the Stage resource that is
  /// associated with the new deployment. Variable names can have alphanumeric
  /// and underscore characters, and the values must match
  /// <code>[A-Za-z0-9-._~:/?#&amp;=,]+</code>.
  Future<Deployment> createDeployment({
    required String restApiId,
    bool? cacheClusterEnabled,
    CacheClusterSize? cacheClusterSize,
    DeploymentCanarySettings? canarySettings,
    String? description,
    String? stageDescription,
    String? stageName,
    bool? tracingEnabled,
    Map<String, String>? variables,
  }) async {
    final $payload = <String, dynamic>{
      if (cacheClusterEnabled != null)
        'cacheClusterEnabled': cacheClusterEnabled,
      if (cacheClusterSize != null) 'cacheClusterSize': cacheClusterSize.value,
      if (canarySettings != null) 'canarySettings': canarySettings,
      if (description != null) 'description': description,
      if (stageDescription != null) 'stageDescription': stageDescription,
      if (stageName != null) 'stageName': stageName,
      if (tracingEnabled != null) 'tracingEnabled': tracingEnabled,
      if (variables != null) 'variables': variables,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}/deployments',
      exceptionFnMap: _exceptionFns,
    );
    return Deployment.fromJson(response);
  }

  /// Creates a documentation part.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [location] :
  /// The location of the targeted API entity of the to-be-created documentation
  /// part.
  ///
  /// Parameter [properties] :
  /// The new documentation content map of the targeted API entity. Enclosed
  /// key-value pairs are API-specific, but only OpenAPI-compliant key-value
  /// pairs can be exported and, hence, published.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<DocumentationPart> createDocumentationPart({
    required DocumentationPartLocation location,
    required String properties,
    required String restApiId,
  }) async {
    final $payload = <String, dynamic>{
      'location': location,
      'properties': properties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/parts',
      exceptionFnMap: _exceptionFns,
    );
    return DocumentationPart.fromJson(response);
  }

  /// Creates a documentation version
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationVersion] :
  /// The version identifier of the new snapshot.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [description] :
  /// A description about the new documentation snapshot.
  ///
  /// Parameter [stageName] :
  /// The stage name to be associated with the new documentation snapshot.
  Future<DocumentationVersion> createDocumentationVersion({
    required String documentationVersion,
    required String restApiId,
    String? description,
    String? stageName,
  }) async {
    final $payload = <String, dynamic>{
      'documentationVersion': documentationVersion,
      if (description != null) 'description': description,
      if (stageName != null) 'stageName': stageName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/versions',
      exceptionFnMap: _exceptionFns,
    );
    return DocumentationVersion.fromJson(response);
  }

  /// Creates a new domain name.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The name of the DomainName resource.
  ///
  /// Parameter [certificateArn] :
  /// The reference to an Amazon Web Services-managed certificate that will be
  /// used by edge-optimized endpoint for this domain name. Certificate Manager
  /// is the only supported source.
  ///
  /// Parameter [certificateBody] :
  /// [Deprecated] The body of the server certificate that will be used by
  /// edge-optimized endpoint for this domain name provided by your certificate
  /// authority.
  ///
  /// Parameter [certificateChain] :
  /// [Deprecated] The intermediate certificates and optionally the root
  /// certificate, one after the other without any blank lines, used by an
  /// edge-optimized endpoint for this domain name. If you include the root
  /// certificate, your certificate chain must start with intermediate
  /// certificates and end with the root certificate. Use the intermediate
  /// certificates that were provided by your certificate authority. Do not
  /// include any intermediaries that are not in the chain of trust path.
  ///
  /// Parameter [certificateName] :
  /// The user-friendly name of the certificate that will be used by
  /// edge-optimized endpoint for this domain name.
  ///
  /// Parameter [certificatePrivateKey] :
  /// [Deprecated] Your edge-optimized endpoint's domain name certificate's
  /// private key.
  ///
  /// Parameter [endpointConfiguration] :
  /// The endpoint configuration of this DomainName showing the endpoint types
  /// of the domain name.
  ///
  /// Parameter [ownershipVerificationCertificateArn] :
  /// The ARN of the public certificate issued by ACM to validate ownership of
  /// your custom domain. Only required when configuring mutual TLS and using an
  /// ACM imported or private CA certificate ARN as the regionalCertificateArn.
  ///
  /// Parameter [regionalCertificateArn] :
  /// The reference to an Amazon Web Services-managed certificate that will be
  /// used by regional endpoint for this domain name. Certificate Manager is the
  /// only supported source.
  ///
  /// Parameter [regionalCertificateName] :
  /// The user-friendly name of the certificate that will be used by regional
  /// endpoint for this domain name.
  ///
  /// Parameter [securityPolicy] :
  /// The Transport Layer Security (TLS) version + cipher suite for this
  /// DomainName. The valid values are <code>TLS_1_0</code> and
  /// <code>TLS_1_2</code>.
  ///
  /// Parameter [tags] :
  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  Future<DomainName> createDomainName({
    required String domainName,
    String? certificateArn,
    String? certificateBody,
    String? certificateChain,
    String? certificateName,
    String? certificatePrivateKey,
    EndpointConfiguration? endpointConfiguration,
    MutualTlsAuthenticationInput? mutualTlsAuthentication,
    String? ownershipVerificationCertificateArn,
    String? regionalCertificateArn,
    String? regionalCertificateName,
    SecurityPolicy? securityPolicy,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'domainName': domainName,
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (certificateBody != null) 'certificateBody': certificateBody,
      if (certificateChain != null) 'certificateChain': certificateChain,
      if (certificateName != null) 'certificateName': certificateName,
      if (certificatePrivateKey != null)
        'certificatePrivateKey': certificatePrivateKey,
      if (endpointConfiguration != null)
        'endpointConfiguration': endpointConfiguration,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
      if (ownershipVerificationCertificateArn != null)
        'ownershipVerificationCertificateArn':
            ownershipVerificationCertificateArn,
      if (regionalCertificateArn != null)
        'regionalCertificateArn': regionalCertificateArn,
      if (regionalCertificateName != null)
        'regionalCertificateName': regionalCertificateName,
      if (securityPolicy != null) 'securityPolicy': securityPolicy.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/domainnames',
      exceptionFnMap: _exceptionFns,
    );
    return DomainName.fromJson(response);
  }

  /// Adds a new Model resource to an existing RestApi resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [contentType] :
  /// The content-type for the model.
  ///
  /// Parameter [name] :
  /// The name of the model. Must be alphanumeric.
  ///
  /// Parameter [restApiId] :
  /// The RestApi identifier under which the Model will be created.
  ///
  /// Parameter [description] :
  /// The description of the model.
  ///
  /// Parameter [schema] :
  /// The schema for the model. For <code>application/json</code> models, this
  /// should be JSON schema draft 4 model. The maximum size of the model is 400
  /// KB.
  Future<Model> createModel({
    required String contentType,
    required String name,
    required String restApiId,
    String? description,
    String? schema,
  }) async {
    final $payload = <String, dynamic>{
      'contentType': contentType,
      'name': name,
      if (description != null) 'description': description,
      if (schema != null) 'schema': schema,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}/models',
      exceptionFnMap: _exceptionFns,
    );
    return Model.fromJson(response);
  }

  /// Creates a RequestValidator of a given RestApi.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [name] :
  /// The name of the to-be-created RequestValidator.
  ///
  /// Parameter [validateRequestBody] :
  /// A Boolean flag to indicate whether to validate request body according to
  /// the configured model schema for the method (<code>true</code>) or not
  /// (<code>false</code>).
  ///
  /// Parameter [validateRequestParameters] :
  /// A Boolean flag to indicate whether to validate request parameters,
  /// <code>true</code>, or not <code>false</code>.
  Future<RequestValidator> createRequestValidator({
    required String restApiId,
    String? name,
    bool? validateRequestBody,
    bool? validateRequestParameters,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'name': name,
      if (validateRequestBody != null)
        'validateRequestBody': validateRequestBody,
      if (validateRequestParameters != null)
        'validateRequestParameters': validateRequestParameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/requestvalidators',
      exceptionFnMap: _exceptionFns,
    );
    return RequestValidator.fromJson(response);
  }

  /// Creates a Resource resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [parentId] :
  /// The parent resource's identifier.
  ///
  /// Parameter [pathPart] :
  /// The last path segment for this resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<Resource> createResource({
    required String parentId,
    required String pathPart,
    required String restApiId,
  }) async {
    final $payload = <String, dynamic>{
      'pathPart': pathPart,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(parentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return Resource.fromJson(response);
  }

  /// Creates a new RestApi resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the RestApi.
  ///
  /// Parameter [apiKeySource] :
  /// The source of the API key for metering requests according to a usage plan.
  /// Valid values are: <code>HEADER</code> to read the API key from the
  /// <code>X-API-Key</code> header of a request. <code>AUTHORIZER</code> to
  /// read the API key from the <code>UsageIdentifierKey</code> from a custom
  /// authorizer.
  ///
  /// Parameter [binaryMediaTypes] :
  /// The list of binary media types supported by the RestApi. By default, the
  /// RestApi supports only UTF-8-encoded text payloads.
  ///
  /// Parameter [cloneFrom] :
  /// The ID of the RestApi that you want to clone from.
  ///
  /// Parameter [description] :
  /// The description of the RestApi.
  ///
  /// Parameter [disableExecuteApiEndpoint] :
  /// Specifies whether clients can invoke your API by using the default
  /// <code>execute-api</code> endpoint. By default, clients can invoke your API
  /// with the default
  /// <code>https://{api_id}.execute-api.{region}.amazonaws.com</code> endpoint.
  /// To require that clients use a custom domain name to invoke your API,
  /// disable the default endpoint
  ///
  /// Parameter [endpointConfiguration] :
  /// The endpoint configuration of this RestApi showing the endpoint types of
  /// the API.
  ///
  /// Parameter [minimumCompressionSize] :
  /// A nullable integer that is used to enable compression (with non-negative
  /// between 0 and 10485760 (10M) bytes, inclusive) or disable compression
  /// (with a null value) on an API. When compression is enabled, compression or
  /// decompression is not applied on the payload if the payload size is smaller
  /// than this value. Setting it to zero allows compression for any payload
  /// size.
  ///
  /// Parameter [policy] :
  /// A stringified JSON policy document that applies to this RestApi regardless
  /// of the caller and Method configuration.
  ///
  /// Parameter [tags] :
  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  ///
  /// Parameter [version] :
  /// A version identifier for the API.
  Future<RestApi> createRestApi({
    required String name,
    ApiKeySourceType? apiKeySource,
    List<String>? binaryMediaTypes,
    String? cloneFrom,
    String? description,
    bool? disableExecuteApiEndpoint,
    EndpointConfiguration? endpointConfiguration,
    int? minimumCompressionSize,
    String? policy,
    Map<String, String>? tags,
    String? version,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (apiKeySource != null) 'apiKeySource': apiKeySource.value,
      if (binaryMediaTypes != null) 'binaryMediaTypes': binaryMediaTypes,
      if (cloneFrom != null) 'cloneFrom': cloneFrom,
      if (description != null) 'description': description,
      if (disableExecuteApiEndpoint != null)
        'disableExecuteApiEndpoint': disableExecuteApiEndpoint,
      if (endpointConfiguration != null)
        'endpointConfiguration': endpointConfiguration,
      if (minimumCompressionSize != null)
        'minimumCompressionSize': minimumCompressionSize,
      if (policy != null) 'policy': policy,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/restapis',
      exceptionFnMap: _exceptionFns,
    );
    return RestApi.fromJson(response);
  }

  /// Creates a new Stage resource that references a pre-existing Deployment for
  /// the API.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [deploymentId] :
  /// The identifier of the Deployment resource for the Stage resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [stageName] :
  /// The name for the Stage resource. Stage names can only contain alphanumeric
  /// characters, hyphens, and underscores. Maximum length is 128 characters.
  ///
  /// Parameter [cacheClusterEnabled] :
  /// Whether cache clustering is enabled for the stage.
  ///
  /// Parameter [cacheClusterSize] :
  /// The stage's cache capacity in GB. For more information about choosing a
  /// cache size, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-caching.html">Enabling
  /// API caching to enhance responsiveness</a>.
  ///
  /// Parameter [canarySettings] :
  /// The canary deployment settings of this stage.
  ///
  /// Parameter [description] :
  /// The description of the Stage resource.
  ///
  /// Parameter [documentationVersion] :
  /// The version of the associated API documentation.
  ///
  /// Parameter [tags] :
  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  ///
  /// Parameter [tracingEnabled] :
  /// Specifies whether active tracing with X-ray is enabled for the Stage.
  ///
  /// Parameter [variables] :
  /// A map that defines the stage variables for the new Stage resource.
  /// Variable names can have alphanumeric and underscore characters, and the
  /// values must match <code>[A-Za-z0-9-._~:/?#&amp;=,]+</code>.
  Future<Stage> createStage({
    required String deploymentId,
    required String restApiId,
    required String stageName,
    bool? cacheClusterEnabled,
    CacheClusterSize? cacheClusterSize,
    CanarySettings? canarySettings,
    String? description,
    String? documentationVersion,
    Map<String, String>? tags,
    bool? tracingEnabled,
    Map<String, String>? variables,
  }) async {
    final $payload = <String, dynamic>{
      'deploymentId': deploymentId,
      'stageName': stageName,
      if (cacheClusterEnabled != null)
        'cacheClusterEnabled': cacheClusterEnabled,
      if (cacheClusterSize != null) 'cacheClusterSize': cacheClusterSize.value,
      if (canarySettings != null) 'canarySettings': canarySettings,
      if (description != null) 'description': description,
      if (documentationVersion != null)
        'documentationVersion': documentationVersion,
      if (tags != null) 'tags': tags,
      if (tracingEnabled != null) 'tracingEnabled': tracingEnabled,
      if (variables != null) 'variables': variables,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}/stages',
      exceptionFnMap: _exceptionFns,
    );
    return Stage.fromJson(response);
  }

  /// Creates a usage plan with the throttle and quota limits, as well as the
  /// associated API stages, specified in the payload.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the usage plan.
  ///
  /// Parameter [apiStages] :
  /// The associated API stages of the usage plan.
  ///
  /// Parameter [description] :
  /// The description of the usage plan.
  ///
  /// Parameter [quota] :
  /// The quota of the usage plan.
  ///
  /// Parameter [tags] :
  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  ///
  /// Parameter [throttle] :
  /// The throttling limits of the usage plan.
  Future<UsagePlan> createUsagePlan({
    required String name,
    List<ApiStage>? apiStages,
    String? description,
    QuotaSettings? quota,
    Map<String, String>? tags,
    ThrottleSettings? throttle,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (apiStages != null) 'apiStages': apiStages,
      if (description != null) 'description': description,
      if (quota != null) 'quota': quota,
      if (tags != null) 'tags': tags,
      if (throttle != null) 'throttle': throttle,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/usageplans',
      exceptionFnMap: _exceptionFns,
    );
    return UsagePlan.fromJson(response);
  }

  /// Creates a usage plan key for adding an existing API key to a usage plan.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [keyId] :
  /// The identifier of a UsagePlanKey resource for a plan customer.
  ///
  /// Parameter [keyType] :
  /// The type of a UsagePlanKey resource for a plan customer.
  ///
  /// Parameter [usagePlanId] :
  /// The Id of the UsagePlan resource representing the usage plan containing
  /// the to-be-created UsagePlanKey resource representing a plan customer.
  Future<UsagePlanKey> createUsagePlanKey({
    required String keyId,
    required String keyType,
    required String usagePlanId,
  }) async {
    final $payload = <String, dynamic>{
      'keyId': keyId,
      'keyType': keyType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/usageplans/${Uri.encodeComponent(usagePlanId)}/keys',
      exceptionFnMap: _exceptionFns,
    );
    return UsagePlanKey.fromJson(response);
  }

  /// Creates a VPC link, under the caller's account in a selected region, in an
  /// asynchronous operation that typically takes 2-4 minutes to complete and
  /// become operational. The caller must have permissions to create and update
  /// VPC Endpoint services.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name used to label and identify the VPC link.
  ///
  /// Parameter [targetArns] :
  /// The ARN of the network load balancer of the VPC targeted by the VPC link.
  /// The network load balancer must be owned by the same Amazon Web Services
  /// account of the API owner.
  ///
  /// Parameter [description] :
  /// The description of the VPC link.
  ///
  /// Parameter [tags] :
  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  Future<VpcLink> createVpcLink({
    required String name,
    required List<String> targetArns,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'targetArns': targetArns,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/vpclinks',
      exceptionFnMap: _exceptionFns,
    );
    return VpcLink.fromJson(response);
  }

  /// Deletes the ApiKey resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiKey] :
  /// The identifier of the ApiKey resource to be deleted.
  Future<void> deleteApiKey({
    required String apiKey,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/apikeys/${Uri.encodeComponent(apiKey)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an existing Authorizer resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authorizerId] :
  /// The identifier of the Authorizer resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<void> deleteAuthorizer({
    required String authorizerId,
    required String restApiId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/authorizers/${Uri.encodeComponent(authorizerId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the BasePathMapping resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [basePath] :
  /// The base path name of the BasePathMapping resource to delete.
  ///
  /// To specify an empty base path, set this parameter to
  /// <code>'(none)'</code>.
  ///
  /// Parameter [domainName] :
  /// The domain name of the BasePathMapping resource to delete.
  Future<void> deleteBasePathMapping({
    required String basePath,
    required String domainName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domainnames/${Uri.encodeComponent(domainName)}/basepathmappings/${Uri.encodeComponent(basePath)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the ClientCertificate resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clientCertificateId] :
  /// The identifier of the ClientCertificate resource to be deleted.
  Future<void> deleteClientCertificate({
    required String clientCertificateId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/clientcertificates/${Uri.encodeComponent(clientCertificateId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Deployment resource. Deleting a deployment will only succeed if
  /// there are no Stage resources associated with it.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [deploymentId] :
  /// The identifier of the Deployment resource to delete.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<void> deleteDeployment({
    required String deploymentId,
    required String restApiId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/deployments/${Uri.encodeComponent(deploymentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a documentation part
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationPartId] :
  /// The identifier of the to-be-deleted documentation part.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<void> deleteDocumentationPart({
    required String documentationPartId,
    required String restApiId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/parts/${Uri.encodeComponent(documentationPartId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a documentation version.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationVersion] :
  /// The version identifier of a to-be-deleted documentation snapshot.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<void> deleteDocumentationVersion({
    required String documentationVersion,
    required String restApiId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/versions/${Uri.encodeComponent(documentationVersion)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the DomainName resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The name of the DomainName resource to be deleted.
  Future<void> deleteDomainName({
    required String domainName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/domainnames/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Clears any customization of a GatewayResponse of a specified response type
  /// on the given RestApi and resets it with the default settings.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [responseType] :
  /// The response type of the associated GatewayResponse.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<void> deleteGatewayResponse({
    required GatewayResponseType responseType,
    required String restApiId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/gatewayresponses/${Uri.encodeComponent(responseType.value)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Represents a delete integration.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// Specifies a delete integration request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// Specifies a delete integration request's resource identifier.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<void> deleteIntegration({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/integration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Represents a delete integration response.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// Specifies a delete integration response request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// Specifies a delete integration response request's resource identifier.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [statusCode] :
  /// Specifies a delete integration response request's status code.
  Future<void> deleteIntegrationResponse({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    required String statusCode,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/integration/responses/${Uri.encodeComponent(statusCode)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an existing Method resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [httpMethod] :
  /// The HTTP verb of the Method resource.
  ///
  /// Parameter [resourceId] :
  /// The Resource identifier for the Method resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<void> deleteMethod({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an existing MethodResponse resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [httpMethod] :
  /// The HTTP verb of the Method resource.
  ///
  /// Parameter [resourceId] :
  /// The Resource identifier for the MethodResponse resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [statusCode] :
  /// The status code identifier for the MethodResponse resource.
  Future<void> deleteMethodResponse({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    required String statusCode,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/responses/${Uri.encodeComponent(statusCode)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a model.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [modelName] :
  /// The name of the model to delete.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<void> deleteModel({
    required String modelName,
    required String restApiId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/models/${Uri.encodeComponent(modelName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a RequestValidator of a given RestApi.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [requestValidatorId] :
  /// The identifier of the RequestValidator to be deleted.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<void> deleteRequestValidator({
    required String requestValidatorId,
    required String restApiId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/requestvalidators/${Uri.encodeComponent(requestValidatorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Resource resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceId] :
  /// The identifier of the Resource resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<void> deleteResource({
    required String resourceId,
    required String restApiId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<void> deleteRestApi({
    required String restApiId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Stage resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [stageName] :
  /// The name of the Stage resource to delete.
  Future<void> deleteStage({
    required String restApiId,
    required String stageName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/stages/${Uri.encodeComponent(stageName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a usage plan of a given plan Id.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [usagePlanId] :
  /// The Id of the to-be-deleted usage plan.
  Future<void> deleteUsagePlan({
    required String usagePlanId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/usageplans/${Uri.encodeComponent(usagePlanId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a usage plan key and remove the underlying API key from the
  /// associated usage plan.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [keyId] :
  /// The Id of the UsagePlanKey resource to be deleted.
  ///
  /// Parameter [usagePlanId] :
  /// The Id of the UsagePlan resource representing the usage plan containing
  /// the to-be-deleted UsagePlanKey resource representing a plan customer.
  Future<void> deleteUsagePlanKey({
    required String keyId,
    required String usagePlanId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/usageplans/${Uri.encodeComponent(usagePlanId)}/keys/${Uri.encodeComponent(keyId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an existing VpcLink of a specified identifier.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [vpcLinkId] :
  /// The identifier of the VpcLink. It is used in an Integration to reference
  /// this VpcLink.
  Future<void> deleteVpcLink({
    required String vpcLinkId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/vpclinks/${Uri.encodeComponent(vpcLinkId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Flushes all authorizer cache entries on a stage.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [stageName] :
  /// The name of the stage to flush.
  Future<void> flushStageAuthorizersCache({
    required String restApiId,
    required String stageName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/stages/${Uri.encodeComponent(stageName)}/cache/authorizers',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Flushes a stage's cache.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [stageName] :
  /// The name of the stage to flush its cache.
  Future<void> flushStageCache({
    required String restApiId,
    required String stageName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/stages/${Uri.encodeComponent(stageName)}/cache/data',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Generates a ClientCertificate resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [description] :
  /// The description of the ClientCertificate.
  ///
  /// Parameter [tags] :
  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  Future<ClientCertificate> generateClientCertificate({
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/clientcertificates',
      exceptionFnMap: _exceptionFns,
    );
    return ClientCertificate.fromJson(response);
  }

  /// Gets information about the current Account resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  Future<Account> getAccount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/account',
      exceptionFnMap: _exceptionFns,
    );
    return Account.fromJson(response);
  }

  /// Gets information about the current ApiKey resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiKey] :
  /// The identifier of the ApiKey resource.
  ///
  /// Parameter [includeValue] :
  /// A boolean flag to specify whether (<code>true</code>) or not
  /// (<code>false</code>) the result contains the key value.
  Future<ApiKey> getApiKey({
    required String apiKey,
    bool? includeValue,
  }) async {
    final $query = <String, List<String>>{
      if (includeValue != null) 'includeValue': [includeValue.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/apikeys/${Uri.encodeComponent(apiKey)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ApiKey.fromJson(response);
  }

  /// Gets information about the current ApiKeys resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [customerId] :
  /// The identifier of a customer in Amazon Web Services Marketplace or an
  /// external system, such as a developer portal.
  ///
  /// Parameter [includeValues] :
  /// A boolean flag to specify whether (<code>true</code>) or not
  /// (<code>false</code>) the result contains key values.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [nameQuery] :
  /// The name of queried API keys.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<ApiKeys> getApiKeys({
    String? customerId,
    bool? includeValues,
    int? limit,
    String? nameQuery,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (customerId != null) 'customerId': [customerId],
      if (includeValues != null) 'includeValues': [includeValues.toString()],
      if (limit != null) 'limit': [limit.toString()],
      if (nameQuery != null) 'name': [nameQuery],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/apikeys',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ApiKeys.fromJson(response);
  }

  /// Describe an existing Authorizer resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authorizerId] :
  /// The identifier of the Authorizer resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<Authorizer> getAuthorizer({
    required String authorizerId,
    required String restApiId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/authorizers/${Uri.encodeComponent(authorizerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return Authorizer.fromJson(response);
  }

  /// Describe an existing Authorizers resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<Authorizers> getAuthorizers({
    required String restApiId,
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}/authorizers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Authorizers.fromJson(response);
  }

  /// Describe a BasePathMapping resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [basePath] :
  /// The base path name that callers of the API must provide as part of the URL
  /// after the domain name. This value must be unique for all of the mappings
  /// across a single API. Specify '(none)' if you do not want callers to
  /// specify any base path name after the domain name.
  ///
  /// Parameter [domainName] :
  /// The domain name of the BasePathMapping resource to be described.
  Future<BasePathMapping> getBasePathMapping({
    required String basePath,
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domainnames/${Uri.encodeComponent(domainName)}/basepathmappings/${Uri.encodeComponent(basePath)}',
      exceptionFnMap: _exceptionFns,
    );
    return BasePathMapping.fromJson(response);
  }

  /// Represents a collection of BasePathMapping resources.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The domain name of a BasePathMapping resource.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<BasePathMappings> getBasePathMappings({
    required String domainName,
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domainnames/${Uri.encodeComponent(domainName)}/basepathmappings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return BasePathMappings.fromJson(response);
  }

  /// Gets information about the current ClientCertificate resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clientCertificateId] :
  /// The identifier of the ClientCertificate resource to be described.
  Future<ClientCertificate> getClientCertificate({
    required String clientCertificateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clientcertificates/${Uri.encodeComponent(clientCertificateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ClientCertificate.fromJson(response);
  }

  /// Gets a collection of ClientCertificate resources.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<ClientCertificates> getClientCertificates({
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/clientcertificates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ClientCertificates.fromJson(response);
  }

  /// Gets information about a Deployment resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [deploymentId] :
  /// The identifier of the Deployment resource to get information about.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [embed] :
  /// A query parameter to retrieve the specified embedded resources of the
  /// returned Deployment resource in the response. In a REST API call, this
  /// <code>embed</code> parameter value is a list of comma-separated strings,
  /// as in <code>GET
  /// /restapis/{restapi_id}/deployments/{deployment_id}?embed=var1,var2</code>.
  /// The SDK and other platform-dependent libraries might use a different
  /// format for the list. Currently, this request supports only retrieval of
  /// the embedded API summary this way. Hence, the parameter value must be a
  /// single-valued list containing only the <code>"apisummary"</code> string.
  /// For example, <code>GET
  /// /restapis/{restapi_id}/deployments/{deployment_id}?embed=apisummary</code>.
  Future<Deployment> getDeployment({
    required String deploymentId,
    required String restApiId,
    List<String>? embed,
  }) async {
    final $query = <String, List<String>>{
      if (embed != null) 'embed': embed,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/deployments/${Uri.encodeComponent(deploymentId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Deployment.fromJson(response);
  }

  /// Gets information about a Deployments collection.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<Deployments> getDeployments({
    required String restApiId,
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}/deployments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Deployments.fromJson(response);
  }

  /// Gets a documentation part.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationPartId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<DocumentationPart> getDocumentationPart({
    required String documentationPartId,
    required String restApiId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/parts/${Uri.encodeComponent(documentationPartId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DocumentationPart.fromJson(response);
  }

  /// Gets documentation parts.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [locationStatus] :
  /// The status of the API documentation parts to retrieve. Valid values are
  /// <code>DOCUMENTED</code> for retrieving DocumentationPart resources with
  /// content and <code>UNDOCUMENTED</code> for DocumentationPart resources
  /// without content.
  ///
  /// Parameter [nameQuery] :
  /// The name of API entities of the to-be-retrieved documentation parts.
  ///
  /// Parameter [path] :
  /// The path of API entities of the to-be-retrieved documentation parts.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  ///
  /// Parameter [type] :
  /// The type of API entities of the to-be-retrieved documentation parts.
  Future<DocumentationParts> getDocumentationParts({
    required String restApiId,
    int? limit,
    LocationStatusType? locationStatus,
    String? nameQuery,
    String? path,
    String? position,
    DocumentationPartType? type,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (locationStatus != null) 'locationStatus': [locationStatus.value],
      if (nameQuery != null) 'name': [nameQuery],
      if (path != null) 'path': [path],
      if (position != null) 'position': [position],
      if (type != null) 'type': [type.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/parts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DocumentationParts.fromJson(response);
  }

  /// Gets a documentation version.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationVersion] :
  /// The version identifier of the to-be-retrieved documentation snapshot.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<DocumentationVersion> getDocumentationVersion({
    required String documentationVersion,
    required String restApiId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/versions/${Uri.encodeComponent(documentationVersion)}',
      exceptionFnMap: _exceptionFns,
    );
    return DocumentationVersion.fromJson(response);
  }

  /// Gets documentation versions.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<DocumentationVersions> getDocumentationVersions({
    required String restApiId,
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DocumentationVersions.fromJson(response);
  }

  /// Represents a domain name that is contained in a simpler, more intuitive
  /// URL that can be called.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The name of the DomainName resource.
  Future<DomainName> getDomainName({
    required String domainName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domainnames/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DomainName.fromJson(response);
  }

  /// Represents a collection of DomainName resources.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<DomainNames> getDomainNames({
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domainnames',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DomainNames.fromJson(response);
  }

  /// Exports a deployed version of a RestApi in a specified format.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [exportType] :
  /// The type of export. Acceptable values are 'oas30' for OpenAPI 3.0.x and
  /// 'swagger' for Swagger/OpenAPI 2.0.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [stageName] :
  /// The name of the Stage that will be exported.
  ///
  /// Parameter [accepts] :
  /// The content-type of the export, for example <code>application/json</code>.
  /// Currently <code>application/json</code> and <code>application/yaml</code>
  /// are supported for <code>exportType</code> of<code>oas30</code> and
  /// <code>swagger</code>. This should be specified in the <code>Accept</code>
  /// header for direct API requests.
  ///
  /// Parameter [parameters] :
  /// A key-value map of query string parameters that specify properties of the
  /// export, depending on the requested <code>exportType</code>. For
  /// <code>exportType</code> <code>oas30</code> and <code>swagger</code>, any
  /// combination of the following parameters are supported:
  /// <code>extensions='integrations'</code> or
  /// <code>extensions='apigateway'</code> will export the API with
  /// x-amazon-apigateway-integration extensions.
  /// <code>extensions='authorizers'</code> will export the API with
  /// x-amazon-apigateway-authorizer extensions. <code>postman</code> will
  /// export the API with Postman extensions, allowing for import to the Postman
  /// tool
  Future<ExportResponse> getExport({
    required String exportType,
    required String restApiId,
    required String stageName,
    String? accepts,
    Map<String, String>? parameters,
  }) async {
    final headers = <String, String>{
      if (accepts != null) 'Accept': accepts.toString(),
    };
    final $query = <String, List<String>>{
      if (parameters != null)
        for (var e in parameters.entries) e.key: [e.value],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/stages/${Uri.encodeComponent(stageName)}/exports/${Uri.encodeComponent(exportType)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ExportResponse(
      body: await response.stream.toBytes(),
      contentDisposition:
          _s.extractHeaderStringValue(response.headers, 'Content-Disposition'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Gets a GatewayResponse of a specified response type on the given RestApi.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [responseType] :
  /// The response type of the associated GatewayResponse.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<GatewayResponse> getGatewayResponse({
    required GatewayResponseType responseType,
    required String restApiId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/gatewayresponses/${Uri.encodeComponent(responseType.value)}',
      exceptionFnMap: _exceptionFns,
    );
    return GatewayResponse.fromJson(response);
  }

  /// Gets the GatewayResponses collection on the given RestApi. If an API
  /// developer has not added any definitions for gateway responses, the result
  /// will be the API Gateway-generated default GatewayResponses collection for
  /// the supported response types.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500. The GatewayResponses collection does not
  /// support pagination and the limit does not apply here.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set. The
  /// GatewayResponse collection does not support pagination and the position
  /// does not apply here.
  Future<GatewayResponses> getGatewayResponses({
    required String restApiId,
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/gatewayresponses',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GatewayResponses.fromJson(response);
  }

  /// Get the integration settings.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// Specifies a get integration request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// Specifies a get integration request's resource identifier
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<Integration> getIntegration({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/integration',
      exceptionFnMap: _exceptionFns,
    );
    return Integration.fromJson(response);
  }

  /// Represents a get integration response.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// Specifies a get integration response request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// Specifies a get integration response request's resource identifier.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [statusCode] :
  /// Specifies a get integration response request's status code.
  Future<IntegrationResponse> getIntegrationResponse({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    required String statusCode,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/integration/responses/${Uri.encodeComponent(statusCode)}',
      exceptionFnMap: _exceptionFns,
    );
    return IntegrationResponse.fromJson(response);
  }

  /// Describe an existing Method resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// Specifies the method request's HTTP method type.
  ///
  /// Parameter [resourceId] :
  /// The Resource identifier for the Method resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<Method> getMethod({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}',
      exceptionFnMap: _exceptionFns,
    );
    return Method.fromJson(response);
  }

  /// Describes a MethodResponse resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// The HTTP verb of the Method resource.
  ///
  /// Parameter [resourceId] :
  /// The Resource identifier for the MethodResponse resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [statusCode] :
  /// The status code for the MethodResponse resource.
  Future<MethodResponse> getMethodResponse({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    required String statusCode,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/responses/${Uri.encodeComponent(statusCode)}',
      exceptionFnMap: _exceptionFns,
    );
    return MethodResponse.fromJson(response);
  }

  /// Describes an existing model defined for a RestApi resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [modelName] :
  /// The name of the model as an identifier.
  ///
  /// Parameter [restApiId] :
  /// The RestApi identifier under which the Model exists.
  ///
  /// Parameter [flatten] :
  /// A query parameter of a Boolean value to resolve (<code>true</code>) all
  /// external model references and returns a flattened model schema or not
  /// (<code>false</code>) The default is <code>false</code>.
  Future<Model> getModel({
    required String modelName,
    required String restApiId,
    bool? flatten,
  }) async {
    final $query = <String, List<String>>{
      if (flatten != null) 'flatten': [flatten.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/models/${Uri.encodeComponent(modelName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Model.fromJson(response);
  }

  /// Generates a sample mapping template that can be used to transform a
  /// payload into the structure of a model.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [modelName] :
  /// The name of the model for which to generate a template.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<Template> getModelTemplate({
    required String modelName,
    required String restApiId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/models/${Uri.encodeComponent(modelName)}/default_template',
      exceptionFnMap: _exceptionFns,
    );
    return Template.fromJson(response);
  }

  /// Describes existing Models defined for a RestApi resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<Models> getModels({
    required String restApiId,
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}/models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Models.fromJson(response);
  }

  /// Gets a RequestValidator of a given RestApi.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [requestValidatorId] :
  /// The identifier of the RequestValidator to be retrieved.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<RequestValidator> getRequestValidator({
    required String requestValidatorId,
    required String restApiId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/requestvalidators/${Uri.encodeComponent(requestValidatorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return RequestValidator.fromJson(response);
  }

  /// Gets the RequestValidators collection of a given RestApi.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<RequestValidators> getRequestValidators({
    required String restApiId,
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/requestvalidators',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RequestValidators.fromJson(response);
  }

  /// Lists information about a resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceId] :
  /// The identifier for the Resource resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [embed] :
  /// A query parameter to retrieve the specified resources embedded in the
  /// returned Resource representation in the response. This <code>embed</code>
  /// parameter value is a list of comma-separated strings. Currently, the
  /// request supports only retrieval of the embedded Method resources this way.
  /// The query parameter value must be a single-valued list and contain the
  /// <code>"methods"</code> string. For example, <code>GET
  /// /restapis/{restapi_id}/resources/{resource_id}?embed=methods</code>.
  Future<Resource> getResource({
    required String resourceId,
    required String restApiId,
    List<String>? embed,
  }) async {
    final $query = <String, List<String>>{
      if (embed != null) 'embed': embed,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Resource.fromJson(response);
  }

  /// Lists information about a collection of Resource resources.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [embed] :
  /// A query parameter used to retrieve the specified resources embedded in the
  /// returned Resources resource in the response. This <code>embed</code>
  /// parameter value is a list of comma-separated strings. Currently, the
  /// request supports only retrieval of the embedded Method resources this way.
  /// The query parameter value must be a single-valued list and contain the
  /// <code>"methods"</code> string. For example, <code>GET
  /// /restapis/{restapi_id}/resources?embed=methods</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<Resources> getResources({
    required String restApiId,
    List<String>? embed,
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (embed != null) 'embed': embed,
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}/resources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Resources.fromJson(response);
  }

  /// Lists the RestApi resource in the collection.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  Future<RestApi> getRestApi({
    required String restApiId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}',
      exceptionFnMap: _exceptionFns,
    );
    return RestApi.fromJson(response);
  }

  /// Lists the RestApis resources for your collection.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<RestApis> getRestApis({
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restapis',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RestApis.fromJson(response);
  }

  /// Generates a client SDK for a RestApi and Stage.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [sdkType] :
  /// The language for the generated SDK. Currently <code>java</code>,
  /// <code>javascript</code>, <code>android</code>, <code>objectivec</code>
  /// (for iOS), <code>swift</code> (for iOS), and <code>ruby</code> are
  /// supported.
  ///
  /// Parameter [stageName] :
  /// The name of the Stage that the SDK will use.
  ///
  /// Parameter [parameters] :
  /// A string-to-string key-value map of query parameters
  /// <code>sdkType</code>-dependent properties of the SDK. For
  /// <code>sdkType</code> of <code>objectivec</code> or <code>swift</code>, a
  /// parameter named <code>classPrefix</code> is required. For
  /// <code>sdkType</code> of <code>android</code>, parameters named
  /// <code>groupId</code>, <code>artifactId</code>,
  /// <code>artifactVersion</code>, and <code>invokerPackage</code> are
  /// required. For <code>sdkType</code> of <code>java</code>, parameters named
  /// <code>serviceName</code> and <code>javaPackageName</code> are required.
  Future<SdkResponse> getSdk({
    required String restApiId,
    required String sdkType,
    required String stageName,
    Map<String, String>? parameters,
  }) async {
    final $query = <String, List<String>>{
      if (parameters != null)
        for (var e in parameters.entries) e.key: [e.value],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/stages/${Uri.encodeComponent(stageName)}/sdks/${Uri.encodeComponent(sdkType)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SdkResponse(
      body: await response.stream.toBytes(),
      contentDisposition:
          _s.extractHeaderStringValue(response.headers, 'Content-Disposition'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Gets an SDK type.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// The identifier of the queried SdkType instance.
  Future<SdkType> getSdkType({
    required String id,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sdktypes/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return SdkType.fromJson(response);
  }

  /// Gets SDK types
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<SdkTypes> getSdkTypes({
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sdktypes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SdkTypes.fromJson(response);
  }

  /// Gets information about a Stage resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [stageName] :
  /// The name of the Stage resource to get information about.
  Future<Stage> getStage({
    required String restApiId,
    required String stageName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/stages/${Uri.encodeComponent(stageName)}',
      exceptionFnMap: _exceptionFns,
    );
    return Stage.fromJson(response);
  }

  /// Gets information about one or more Stage resources.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [deploymentId] :
  /// The stages' deployment identifiers.
  Future<Stages> getStages({
    required String restApiId,
    String? deploymentId,
  }) async {
    final $query = <String, List<String>>{
      if (deploymentId != null) 'deploymentId': [deploymentId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}/stages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Stages.fromJson(response);
  }

  /// Gets the Tags collection for a given resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of a resource that can be tagged.
  ///
  /// Parameter [limit] :
  /// (Not currently supported) The maximum number of returned results per page.
  /// The default value is 25 and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// (Not currently supported) The current pagination position in the paged
  /// result set.
  Future<Tags> getTags({
    required String resourceArn,
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Tags.fromJson(response);
  }

  /// Gets the usage data of a usage plan in a specified time interval.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [endDate] :
  /// The ending date (e.g., 2016-12-31) of the usage data.
  ///
  /// Parameter [startDate] :
  /// The starting date (e.g., 2016-01-01) of the usage data.
  ///
  /// Parameter [usagePlanId] :
  /// The Id of the usage plan associated with the usage data.
  ///
  /// Parameter [keyId] :
  /// The Id of the API key associated with the resultant usage data.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<Usage> getUsage({
    required String endDate,
    required String startDate,
    required String usagePlanId,
    String? keyId,
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      'endDate': [endDate],
      'startDate': [startDate],
      if (keyId != null) 'keyId': [keyId],
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/usageplans/${Uri.encodeComponent(usagePlanId)}/usage',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return Usage.fromJson(response);
  }

  /// Gets a usage plan of a given plan identifier.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [usagePlanId] :
  /// The identifier of the UsagePlan resource to be retrieved.
  Future<UsagePlan> getUsagePlan({
    required String usagePlanId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/usageplans/${Uri.encodeComponent(usagePlanId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UsagePlan.fromJson(response);
  }

  /// Gets a usage plan key of a given key identifier.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [keyId] :
  /// The key Id of the to-be-retrieved UsagePlanKey resource representing a
  /// plan customer.
  ///
  /// Parameter [usagePlanId] :
  /// The Id of the UsagePlan resource representing the usage plan containing
  /// the to-be-retrieved UsagePlanKey resource representing a plan customer.
  Future<UsagePlanKey> getUsagePlanKey({
    required String keyId,
    required String usagePlanId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/usageplans/${Uri.encodeComponent(usagePlanId)}/keys/${Uri.encodeComponent(keyId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UsagePlanKey.fromJson(response);
  }

  /// Gets all the usage plan keys representing the API keys added to a
  /// specified usage plan.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [usagePlanId] :
  /// The Id of the UsagePlan resource representing the usage plan containing
  /// the to-be-retrieved UsagePlanKey resource representing a plan customer.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [nameQuery] :
  /// A query parameter specifying the name of the to-be-returned usage plan
  /// keys.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<UsagePlanKeys> getUsagePlanKeys({
    required String usagePlanId,
    int? limit,
    String? nameQuery,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (nameQuery != null) 'name': [nameQuery],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/usageplans/${Uri.encodeComponent(usagePlanId)}/keys',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UsagePlanKeys.fromJson(response);
  }

  /// Gets all the usage plans of the caller's account.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [keyId] :
  /// The identifier of the API key associated with the usage plans.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<UsagePlans> getUsagePlans({
    String? keyId,
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (keyId != null) 'keyId': [keyId],
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/usageplans',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UsagePlans.fromJson(response);
  }

  /// Gets a specified VPC link under the caller's account in a region.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [vpcLinkId] :
  /// The identifier of the VpcLink. It is used in an Integration to reference
  /// this VpcLink.
  Future<VpcLink> getVpcLink({
    required String vpcLinkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/vpclinks/${Uri.encodeComponent(vpcLinkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return VpcLink.fromJson(response);
  }

  /// Gets the VpcLinks collection under the caller's account in a selected
  /// region.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<VpcLinks> getVpcLinks({
    int? limit,
    String? position,
  }) async {
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (position != null) 'position': [position],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/vpclinks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return VpcLinks.fromJson(response);
  }

  /// Import API keys from an external source, such as a CSV-formatted file.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [body] :
  /// The payload of the POST request to import API keys. For the payload
  /// format, see API Key File Format.
  ///
  /// Parameter [format] :
  /// A query parameter to specify the input format to imported API keys.
  /// Currently, only the <code>csv</code> format is supported.
  ///
  /// Parameter [failOnWarnings] :
  /// A query parameter to indicate whether to rollback ApiKey importation
  /// (<code>true</code>) or not (<code>false</code>) when error is encountered.
  Future<ApiKeyIds> importApiKeys({
    required Uint8List body,
    required ApiKeysFormat format,
    bool? failOnWarnings,
  }) async {
    final $query = <String, List<String>>{
      'format': [format.value],
      if (failOnWarnings != null) 'failonwarnings': [failOnWarnings.toString()],
    };
    final response = await _protocol.send(
      payload: body,
      method: 'POST',
      requestUri: '/apikeys?mode=import',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ApiKeyIds.fromJson(response);
  }

  /// Imports documentation parts
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [body] :
  /// Raw byte array representing the to-be-imported documentation parts. To
  /// import from an OpenAPI file, this is a JSON object.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [failOnWarnings] :
  /// A query parameter to specify whether to rollback the documentation
  /// importation (<code>true</code>) or not (<code>false</code>) when a warning
  /// is encountered. The default value is <code>false</code>.
  ///
  /// Parameter [mode] :
  /// A query parameter to indicate whether to overwrite
  /// (<code>overwrite</code>) any existing DocumentationParts definition or to
  /// merge (<code>merge</code>) the new definition into the existing one. The
  /// default value is <code>merge</code>.
  Future<DocumentationPartIds> importDocumentationParts({
    required Uint8List body,
    required String restApiId,
    bool? failOnWarnings,
    PutMode? mode,
  }) async {
    final $query = <String, List<String>>{
      if (failOnWarnings != null) 'failonwarnings': [failOnWarnings.toString()],
      if (mode != null) 'mode': [mode.value],
    };
    final response = await _protocol.send(
      payload: body,
      method: 'PUT',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/parts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DocumentationPartIds.fromJson(response);
  }

  /// A feature of the API Gateway control service for creating a new API from
  /// an external API definition file.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [body] :
  /// The POST request body containing external API definitions. Currently, only
  /// OpenAPI definition JSON/YAML files are supported. The maximum size of the
  /// API definition file is 6MB.
  ///
  /// Parameter [failOnWarnings] :
  /// A query parameter to indicate whether to rollback the API creation
  /// (<code>true</code>) or not (<code>false</code>) when a warning is
  /// encountered. The default value is <code>false</code>.
  ///
  /// Parameter [parameters] :
  /// A key-value map of context-specific query string parameters specifying the
  /// behavior of different API importing operations. The following shows
  /// operation-specific parameters and their supported values.
  ///
  /// To exclude DocumentationParts from the import, set <code>parameters</code>
  /// as <code>ignore=documentation</code>.
  ///
  /// To configure the endpoint type, set <code>parameters</code> as
  /// <code>endpointConfigurationTypes=EDGE</code>,
  /// <code>endpointConfigurationTypes=REGIONAL</code>, or
  /// <code>endpointConfigurationTypes=PRIVATE</code>. The default endpoint type
  /// is <code>EDGE</code>.
  ///
  /// To handle imported <code>basepath</code>, set <code>parameters</code> as
  /// <code>basepath=ignore</code>, <code>basepath=prepend</code> or
  /// <code>basepath=split</code>.
  Future<RestApi> importRestApi({
    required Uint8List body,
    bool? failOnWarnings,
    Map<String, String>? parameters,
  }) async {
    final $query = <String, List<String>>{
      if (failOnWarnings != null) 'failonwarnings': [failOnWarnings.toString()],
      if (parameters != null)
        for (var e in parameters.entries) e.key: [e.value],
    };
    final response = await _protocol.send(
      payload: body,
      method: 'POST',
      requestUri: '/restapis?mode=import',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RestApi.fromJson(response);
  }

  /// Creates a customization of a GatewayResponse of a specified response type
  /// and status code on the given RestApi.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [responseType] :
  /// The response type of the associated GatewayResponse
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [responseParameters] :
  /// Response parameters (paths, query strings and headers) of the
  /// GatewayResponse as a string-to-string map of key-value pairs.
  ///
  /// Parameter [responseTemplates] :
  /// Response templates of the GatewayResponse as a string-to-string map of
  /// key-value pairs.
  ///
  /// Parameter [statusCode] :
  /// The HTTP status code of the GatewayResponse.
  Future<GatewayResponse> putGatewayResponse({
    required GatewayResponseType responseType,
    required String restApiId,
    Map<String, String>? responseParameters,
    Map<String, String>? responseTemplates,
    String? statusCode,
  }) async {
    final $payload = <String, dynamic>{
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (responseTemplates != null) 'responseTemplates': responseTemplates,
      if (statusCode != null) 'statusCode': statusCode,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/gatewayresponses/${Uri.encodeComponent(responseType.value)}',
      exceptionFnMap: _exceptionFns,
    );
    return GatewayResponse.fromJson(response);
  }

  /// Sets up a method's integration.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// Specifies the HTTP method for the integration.
  ///
  /// Parameter [resourceId] :
  /// Specifies a put integration request's resource ID.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [type] :
  /// Specifies a put integration input's type.
  ///
  /// Parameter [cacheKeyParameters] :
  /// A list of request parameters whose values API Gateway caches. To be valid
  /// values for <code>cacheKeyParameters</code>, these parameters must also be
  /// specified for Method <code>requestParameters</code>.
  ///
  /// Parameter [cacheNamespace] :
  /// Specifies a group of related cached parameters. By default, API Gateway
  /// uses the resource ID as the <code>cacheNamespace</code>. You can specify
  /// the same <code>cacheNamespace</code> across resources to return the same
  /// cached data for requests to different resources.
  ///
  /// Parameter [connectionId] :
  /// The ID of the VpcLink used for the integration. Specify this value only if
  /// you specify <code>VPC_LINK</code> as the connection type.
  ///
  /// Parameter [connectionType] :
  /// The type of the network connection to the integration endpoint. The valid
  /// value is <code>INTERNET</code> for connections through the public routable
  /// internet or <code>VPC_LINK</code> for private connections between API
  /// Gateway and a network load balancer in a VPC. The default value is
  /// <code>INTERNET</code>.
  ///
  /// Parameter [contentHandling] :
  /// Specifies how to handle request payload content type conversions.
  /// Supported values are <code>CONVERT_TO_BINARY</code> and
  /// <code>CONVERT_TO_TEXT</code>, with the following behaviors:
  ///
  /// If this property is not defined, the request payload will be passed
  /// through from the method request to integration request without
  /// modification, provided that the <code>passthroughBehavior</code> is
  /// configured to support payload pass-through.
  ///
  /// Parameter [credentials] :
  /// Specifies whether credentials are required for a put integration.
  ///
  /// Parameter [integrationHttpMethod] :
  /// The HTTP method for the integration.
  ///
  /// Parameter [passthroughBehavior] :
  /// Specifies the pass-through behavior for incoming requests based on the
  /// Content-Type header in the request, and the available mapping templates
  /// specified as the <code>requestTemplates</code> property on the Integration
  /// resource. There are three valid values: <code>WHEN_NO_MATCH</code>,
  /// <code>WHEN_NO_TEMPLATES</code>, and <code>NEVER</code>.
  ///
  /// Parameter [requestParameters] :
  /// A key-value map specifying request parameters that are passed from the
  /// method request to the back end. The key is an integration request
  /// parameter name and the associated value is a method request parameter
  /// value or static value that must be enclosed within single quotes and
  /// pre-encoded as required by the back end. The method request parameter
  /// value must match the pattern of
  /// <code>method.request.{location}.{name}</code>, where <code>location</code>
  /// is <code>querystring</code>, <code>path</code>, or <code>header</code> and
  /// <code>name</code> must be a valid and unique method request parameter
  /// name.
  ///
  /// Parameter [requestTemplates] :
  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value.
  ///
  /// Parameter [timeoutInMillis] :
  /// Custom timeout between 50 and 29,000 milliseconds. The default value is
  /// 29,000 milliseconds or 29 seconds.
  ///
  /// Parameter [uri] :
  /// Specifies Uniform Resource Identifier (URI) of the integration endpoint.
  /// For HTTP or <code>HTTP_PROXY</code> integrations, the URI must be a fully
  /// formed, encoded HTTP(S) URL according to the RFC-3986 specification, for
  /// either standard integration, where <code>connectionType</code> is not
  /// <code>VPC_LINK</code>, or private integration, where
  /// <code>connectionType</code> is <code>VPC_LINK</code>. For a private HTTP
  /// integration, the URI is not used for routing. For <code>AWS</code> or
  /// <code>AWS_PROXY</code> integrations, the URI is of the form
  /// <code>arn:aws:apigateway:{region}:{subdomain.service|service}:path|action/{service_api</code>}.
  /// Here, {Region} is the API Gateway region (e.g., us-east-1); {service} is
  /// the name of the integrated Amazon Web Services service (e.g., s3); and
  /// {subdomain} is a designated subdomain supported by certain Amazon Web
  /// Services service for fast host-name lookup. action can be used for an
  /// Amazon Web Services service action-based API, using an
  /// Action={name}&amp;{p1}={v1}&amp;p2={v2}... query string. The ensuing
  /// {service_api} refers to a supported action {name} plus any required input
  /// parameters. Alternatively, path can be used for an Amazon Web Services
  /// service path-based API. The ensuing service_api refers to the path to an
  /// Amazon Web Services service resource, including the region of the
  /// integrated Amazon Web Services service, if applicable. For example, for
  /// integration with the S3 API of <code>GetObject</code>, the
  /// <code>uri</code> can be either
  /// <code>arn:aws:apigateway:us-west-2:s3:action/GetObject&amp;Bucket={bucket}&amp;Key={key}</code>
  /// or <code>arn:aws:apigateway:us-west-2:s3:path/{bucket}/{key}</code>.
  Future<Integration> putIntegration({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    required IntegrationType type,
    List<String>? cacheKeyParameters,
    String? cacheNamespace,
    String? connectionId,
    ConnectionType? connectionType,
    ContentHandlingStrategy? contentHandling,
    String? credentials,
    String? integrationHttpMethod,
    String? passthroughBehavior,
    Map<String, String>? requestParameters,
    Map<String, String>? requestTemplates,
    int? timeoutInMillis,
    TlsConfig? tlsConfig,
    String? uri,
  }) async {
    final $payload = <String, dynamic>{
      'type': type.value,
      if (cacheKeyParameters != null) 'cacheKeyParameters': cacheKeyParameters,
      if (cacheNamespace != null) 'cacheNamespace': cacheNamespace,
      if (connectionId != null) 'connectionId': connectionId,
      if (connectionType != null) 'connectionType': connectionType.value,
      if (contentHandling != null) 'contentHandling': contentHandling.value,
      if (credentials != null) 'credentials': credentials,
      if (integrationHttpMethod != null) 'httpMethod': integrationHttpMethod,
      if (passthroughBehavior != null)
        'passthroughBehavior': passthroughBehavior,
      if (requestParameters != null) 'requestParameters': requestParameters,
      if (requestTemplates != null) 'requestTemplates': requestTemplates,
      if (timeoutInMillis != null) 'timeoutInMillis': timeoutInMillis,
      if (tlsConfig != null) 'tlsConfig': tlsConfig,
      if (uri != null) 'uri': uri,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/integration',
      exceptionFnMap: _exceptionFns,
    );
    return Integration.fromJson(response);
  }

  /// Represents a put integration.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// Specifies a put integration response request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// Specifies a put integration response request's resource identifier.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [statusCode] :
  /// Specifies the status code that is used to map the integration response to
  /// an existing MethodResponse.
  ///
  /// Parameter [contentHandling] :
  /// Specifies how to handle response payload content type conversions.
  /// Supported values are <code>CONVERT_TO_BINARY</code> and
  /// <code>CONVERT_TO_TEXT</code>, with the following behaviors:
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the method response without
  /// modification.
  ///
  /// Parameter [responseParameters] :
  /// A key-value map specifying response parameters that are passed to the
  /// method response from the back end. The key is a method response header
  /// parameter name and the mapped value is an integration response header
  /// value, a static value enclosed within a pair of single quotes, or a JSON
  /// expression from the integration response body. The mapping key must match
  /// the pattern of <code>method.response.header.{name}</code>, where
  /// <code>name</code> is a valid and unique header name. The mapped non-static
  /// value must match the pattern of
  /// <code>integration.response.header.{name}</code> or
  /// <code>integration.response.body.{JSON-expression}</code>, where
  /// <code>name</code> must be a valid and unique response header name and
  /// <code>JSON-expression</code> a valid JSON expression without the
  /// <code>$</code> prefix.
  ///
  /// Parameter [responseTemplates] :
  /// Specifies a put integration response's templates.
  ///
  /// Parameter [selectionPattern] :
  /// Specifies the selection pattern of a put integration response.
  Future<IntegrationResponse> putIntegrationResponse({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    required String statusCode,
    ContentHandlingStrategy? contentHandling,
    Map<String, String>? responseParameters,
    Map<String, String>? responseTemplates,
    String? selectionPattern,
  }) async {
    final $payload = <String, dynamic>{
      if (contentHandling != null) 'contentHandling': contentHandling.value,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (responseTemplates != null) 'responseTemplates': responseTemplates,
      if (selectionPattern != null) 'selectionPattern': selectionPattern,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/integration/responses/${Uri.encodeComponent(statusCode)}',
      exceptionFnMap: _exceptionFns,
    );
    return IntegrationResponse.fromJson(response);
  }

  /// Add a method to an existing Resource resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authorizationType] :
  /// The method's authorization type. Valid values are <code>NONE</code> for
  /// open access, <code>AWS_IAM</code> for using AWS IAM permissions,
  /// <code>CUSTOM</code> for using a custom authorizer, or
  /// <code>COGNITO_USER_POOLS</code> for using a Cognito user pool.
  ///
  /// Parameter [httpMethod] :
  /// Specifies the method request's HTTP method type.
  ///
  /// Parameter [resourceId] :
  /// The Resource identifier for the new Method resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [apiKeyRequired] :
  /// Specifies whether the method required a valid ApiKey.
  ///
  /// Parameter [authorizationScopes] :
  /// A list of authorization scopes configured on the method. The scopes are
  /// used with a <code>COGNITO_USER_POOLS</code> authorizer to authorize the
  /// method invocation. The authorization works by matching the method scopes
  /// against the scopes parsed from the access token in the incoming request.
  /// The method invocation is authorized if any method scopes matches a claimed
  /// scope in the access token. Otherwise, the invocation is not authorized.
  /// When the method scope is configured, the client must provide an access
  /// token instead of an identity token for authorization purposes.
  ///
  /// Parameter [authorizerId] :
  /// Specifies the identifier of an Authorizer to use on this Method, if the
  /// type is CUSTOM or COGNITO_USER_POOLS. The authorizer identifier is
  /// generated by API Gateway when you created the authorizer.
  ///
  /// Parameter [operationName] :
  /// A human-friendly operation identifier for the method. For example, you can
  /// assign the <code>operationName</code> of <code>ListPets</code> for the
  /// <code>GET /pets</code> method in the <code>PetStore</code> example.
  ///
  /// Parameter [requestModels] :
  /// Specifies the Model resources used for the request's content type. Request
  /// models are represented as a key/value map, with a content type as the key
  /// and a Model name as the value.
  ///
  /// Parameter [requestParameters] :
  /// A key-value map defining required or optional method request parameters
  /// that can be accepted by API Gateway. A key defines a method request
  /// parameter name matching the pattern of
  /// <code>method.request.{location}.{name}</code>, where <code>location</code>
  /// is <code>querystring</code>, <code>path</code>, or <code>header</code> and
  /// <code>name</code> is a valid and unique parameter name. The value
  /// associated with the key is a Boolean flag indicating whether the parameter
  /// is required (<code>true</code>) or optional (<code>false</code>). The
  /// method request parameter names defined here are available in Integration
  /// to be mapped to integration request parameters or body-mapping templates.
  ///
  /// Parameter [requestValidatorId] :
  /// The identifier of a RequestValidator for validating the method request.
  Future<Method> putMethod({
    required String authorizationType,
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    bool? apiKeyRequired,
    List<String>? authorizationScopes,
    String? authorizerId,
    String? operationName,
    Map<String, String>? requestModels,
    Map<String, bool>? requestParameters,
    String? requestValidatorId,
  }) async {
    final $payload = <String, dynamic>{
      'authorizationType': authorizationType,
      if (apiKeyRequired != null) 'apiKeyRequired': apiKeyRequired,
      if (authorizationScopes != null)
        'authorizationScopes': authorizationScopes,
      if (authorizerId != null) 'authorizerId': authorizerId,
      if (operationName != null) 'operationName': operationName,
      if (requestModels != null) 'requestModels': requestModels,
      if (requestParameters != null) 'requestParameters': requestParameters,
      if (requestValidatorId != null) 'requestValidatorId': requestValidatorId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}',
      exceptionFnMap: _exceptionFns,
    );
    return Method.fromJson(response);
  }

  /// Adds a MethodResponse to an existing Method resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// The HTTP verb of the Method resource.
  ///
  /// Parameter [resourceId] :
  /// The Resource identifier for the Method resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [statusCode] :
  /// The method response's status code.
  ///
  /// Parameter [responseModels] :
  /// Specifies the Model resources used for the response's content type.
  /// Response models are represented as a key/value map, with a content type as
  /// the key and a Model name as the value.
  ///
  /// Parameter [responseParameters] :
  /// A key-value map specifying required or optional response parameters that
  /// API Gateway can send back to the caller. A key defines a method response
  /// header name and the associated value is a Boolean flag indicating whether
  /// the method response parameter is required or not. The method response
  /// header names must match the pattern of
  /// <code>method.response.header.{name}</code>, where <code>name</code> is a
  /// valid and unique header name. The response parameter names defined here
  /// are available in the integration response to be mapped from an integration
  /// response header expressed in
  /// <code>integration.response.header.{name}</code>, a static value enclosed
  /// within a pair of single quotes (e.g., <code>'application/json'</code>), or
  /// a JSON expression from the back-end response payload in the form of
  /// <code>integration.response.body.{JSON-expression}</code>, where
  /// <code>JSON-expression</code> is a valid JSON expression without the
  /// <code>$</code> prefix.)
  Future<MethodResponse> putMethodResponse({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    required String statusCode,
    Map<String, String>? responseModels,
    Map<String, bool>? responseParameters,
  }) async {
    final $payload = <String, dynamic>{
      if (responseModels != null) 'responseModels': responseModels,
      if (responseParameters != null) 'responseParameters': responseParameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/responses/${Uri.encodeComponent(statusCode)}',
      exceptionFnMap: _exceptionFns,
    );
    return MethodResponse.fromJson(response);
  }

  /// A feature of the API Gateway control service for updating an existing API
  /// with an input of external API definitions. The update can take the form of
  /// merging the supplied definition into the existing API or overwriting the
  /// existing API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [body] :
  /// The PUT request body containing external API definitions. Currently, only
  /// OpenAPI definition JSON/YAML files are supported. The maximum size of the
  /// API definition file is 6MB.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [failOnWarnings] :
  /// A query parameter to indicate whether to rollback the API update
  /// (<code>true</code>) or not (<code>false</code>) when a warning is
  /// encountered. The default value is <code>false</code>.
  ///
  /// Parameter [mode] :
  /// The <code>mode</code> query parameter to specify the update mode. Valid
  /// values are "merge" and "overwrite". By default, the update mode is
  /// "merge".
  ///
  /// Parameter [parameters] :
  /// Custom header parameters as part of the request. For example, to exclude
  /// DocumentationParts from an imported API, set
  /// <code>ignore=documentation</code> as a <code>parameters</code> value, as
  /// in the AWS CLI command of <code>aws apigateway import-rest-api
  /// --parameters ignore=documentation --body
  /// 'file:///path/to/imported-api-body.json'</code>.
  Future<RestApi> putRestApi({
    required Uint8List body,
    required String restApiId,
    bool? failOnWarnings,
    PutMode? mode,
    Map<String, String>? parameters,
  }) async {
    final $query = <String, List<String>>{
      if (failOnWarnings != null) 'failonwarnings': [failOnWarnings.toString()],
      if (mode != null) 'mode': [mode.value],
      if (parameters != null)
        for (var e in parameters.entries) e.key: [e.value],
    };
    final response = await _protocol.send(
      payload: body,
      method: 'PUT',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RestApi.fromJson(response);
  }

  /// Adds or updates a tag on a given resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of a resource that can be tagged.
  ///
  /// Parameter [tags] :
  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Simulate the execution of an Authorizer in your RestApi with headers,
  /// parameters, and an incoming request body.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authorizerId] :
  /// Specifies a test invoke authorizer request's Authorizer ID.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [additionalContext] :
  /// A key-value map of additional context variables.
  ///
  /// Parameter [body] :
  /// The simulated request body of an incoming invocation request.
  ///
  /// Parameter [headers] :
  /// A key-value map of headers to simulate an incoming invocation request.
  /// This is where the incoming authorization token, or identity source, should
  /// be specified.
  ///
  /// Parameter [multiValueHeaders] :
  /// The headers as a map from string to list of values to simulate an incoming
  /// invocation request. This is where the incoming authorization token, or
  /// identity source, may be specified.
  ///
  /// Parameter [pathWithQueryString] :
  /// The URI path, including query string, of the simulated invocation request.
  /// Use this to specify path parameters and query string parameters.
  ///
  /// Parameter [stageVariables] :
  /// A key-value map of stage variables to simulate an invocation on a deployed
  /// Stage.
  Future<TestInvokeAuthorizerResponse> testInvokeAuthorizer({
    required String authorizerId,
    required String restApiId,
    Map<String, String>? additionalContext,
    String? body,
    Map<String, String>? headers,
    Map<String, List<String>>? multiValueHeaders,
    String? pathWithQueryString,
    Map<String, String>? stageVariables,
  }) async {
    final $payload = <String, dynamic>{
      if (additionalContext != null) 'additionalContext': additionalContext,
      if (body != null) 'body': body,
      if (headers != null) 'headers': headers,
      if (multiValueHeaders != null) 'multiValueHeaders': multiValueHeaders,
      if (pathWithQueryString != null)
        'pathWithQueryString': pathWithQueryString,
      if (stageVariables != null) 'stageVariables': stageVariables,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/authorizers/${Uri.encodeComponent(authorizerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return TestInvokeAuthorizerResponse.fromJson(response);
  }

  /// Simulate the invocation of a Method in your RestApi with headers,
  /// parameters, and an incoming request body.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// Specifies a test invoke method request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// Specifies a test invoke method request's resource ID.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [body] :
  /// The simulated request body of an incoming invocation request.
  ///
  /// Parameter [clientCertificateId] :
  /// A ClientCertificate identifier to use in the test invocation. API Gateway
  /// will use the certificate when making the HTTPS request to the defined
  /// back-end endpoint.
  ///
  /// Parameter [headers] :
  /// A key-value map of headers to simulate an incoming invocation request.
  ///
  /// Parameter [multiValueHeaders] :
  /// The headers as a map from string to list of values to simulate an incoming
  /// invocation request.
  ///
  /// Parameter [pathWithQueryString] :
  /// The URI path, including query string, of the simulated invocation request.
  /// Use this to specify path parameters and query string parameters.
  ///
  /// Parameter [stageVariables] :
  /// A key-value map of stage variables to simulate an invocation on a deployed
  /// Stage.
  Future<TestInvokeMethodResponse> testInvokeMethod({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    String? body,
    String? clientCertificateId,
    Map<String, String>? headers,
    Map<String, List<String>>? multiValueHeaders,
    String? pathWithQueryString,
    Map<String, String>? stageVariables,
  }) async {
    final $payload = <String, dynamic>{
      if (body != null) 'body': body,
      if (clientCertificateId != null)
        'clientCertificateId': clientCertificateId,
      if (headers != null) 'headers': headers,
      if (multiValueHeaders != null) 'multiValueHeaders': multiValueHeaders,
      if (pathWithQueryString != null)
        'pathWithQueryString': pathWithQueryString,
      if (stageVariables != null) 'stageVariables': stageVariables,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}',
      exceptionFnMap: _exceptionFns,
    );
    return TestInvokeMethodResponse.fromJson(response);
  }

  /// Removes a tag from a given resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of a resource that can be tagged.
  ///
  /// Parameter [tagKeys] :
  /// The Tag keys to delete.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Changes information about the current Account resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<Account> updateAccount({
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/account',
      exceptionFnMap: _exceptionFns,
    );
    return Account.fromJson(response);
  }

  /// Changes information about an ApiKey resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiKey] :
  /// The identifier of the ApiKey resource to be updated.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<ApiKey> updateApiKey({
    required String apiKey,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/apikeys/${Uri.encodeComponent(apiKey)}',
      exceptionFnMap: _exceptionFns,
    );
    return ApiKey.fromJson(response);
  }

  /// Updates an existing Authorizer resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authorizerId] :
  /// The identifier of the Authorizer resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<Authorizer> updateAuthorizer({
    required String authorizerId,
    required String restApiId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/authorizers/${Uri.encodeComponent(authorizerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return Authorizer.fromJson(response);
  }

  /// Changes information about the BasePathMapping resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [basePath] :
  /// The base path of the BasePathMapping resource to change.
  ///
  /// To specify an empty base path, set this parameter to
  /// <code>'(none)'</code>.
  ///
  /// Parameter [domainName] :
  /// The domain name of the BasePathMapping resource to change.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<BasePathMapping> updateBasePathMapping({
    required String basePath,
    required String domainName,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/domainnames/${Uri.encodeComponent(domainName)}/basepathmappings/${Uri.encodeComponent(basePath)}',
      exceptionFnMap: _exceptionFns,
    );
    return BasePathMapping.fromJson(response);
  }

  /// Changes information about an ClientCertificate resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clientCertificateId] :
  /// The identifier of the ClientCertificate resource to be updated.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<ClientCertificate> updateClientCertificate({
    required String clientCertificateId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/clientcertificates/${Uri.encodeComponent(clientCertificateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ClientCertificate.fromJson(response);
  }

  /// Changes information about a Deployment resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [deploymentId] :
  /// The replacement identifier for the Deployment resource to change
  /// information about.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<Deployment> updateDeployment({
    required String deploymentId,
    required String restApiId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/deployments/${Uri.encodeComponent(deploymentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return Deployment.fromJson(response);
  }

  /// Updates a documentation part.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationPartId] :
  /// The identifier of the to-be-updated documentation part.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<DocumentationPart> updateDocumentationPart({
    required String documentationPartId,
    required String restApiId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/parts/${Uri.encodeComponent(documentationPartId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DocumentationPart.fromJson(response);
  }

  /// Updates a documentation version.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationVersion] :
  /// The version identifier of the to-be-updated documentation version.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<DocumentationVersion> updateDocumentationVersion({
    required String documentationVersion,
    required String restApiId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/versions/${Uri.encodeComponent(documentationVersion)}',
      exceptionFnMap: _exceptionFns,
    );
    return DocumentationVersion.fromJson(response);
  }

  /// Changes information about the DomainName resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The name of the DomainName resource to be changed.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<DomainName> updateDomainName({
    required String domainName,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/domainnames/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DomainName.fromJson(response);
  }

  /// Updates a GatewayResponse of a specified response type on the given
  /// RestApi.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [responseType] :
  /// The response type of the associated GatewayResponse.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<GatewayResponse> updateGatewayResponse({
    required GatewayResponseType responseType,
    required String restApiId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/gatewayresponses/${Uri.encodeComponent(responseType.value)}',
      exceptionFnMap: _exceptionFns,
    );
    return GatewayResponse.fromJson(response);
  }

  /// Represents an update integration.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// Represents an update integration request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// Represents an update integration request's resource identifier.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<Integration> updateIntegration({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/integration',
      exceptionFnMap: _exceptionFns,
    );
    return Integration.fromJson(response);
  }

  /// Represents an update integration response.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// Specifies an update integration response request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// Specifies an update integration response request's resource identifier.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [statusCode] :
  /// Specifies an update integration response request's status code.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<IntegrationResponse> updateIntegrationResponse({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    required String statusCode,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/integration/responses/${Uri.encodeComponent(statusCode)}',
      exceptionFnMap: _exceptionFns,
    );
    return IntegrationResponse.fromJson(response);
  }

  /// Updates an existing Method resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// The HTTP verb of the Method resource.
  ///
  /// Parameter [resourceId] :
  /// The Resource identifier for the Method resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<Method> updateMethod({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}',
      exceptionFnMap: _exceptionFns,
    );
    return Method.fromJson(response);
  }

  /// Updates an existing MethodResponse resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// The HTTP verb of the Method resource.
  ///
  /// Parameter [resourceId] :
  /// The Resource identifier for the MethodResponse resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [statusCode] :
  /// The status code for the MethodResponse resource.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<MethodResponse> updateMethodResponse({
    required String httpMethod,
    required String resourceId,
    required String restApiId,
    required String statusCode,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/responses/${Uri.encodeComponent(statusCode)}',
      exceptionFnMap: _exceptionFns,
    );
    return MethodResponse.fromJson(response);
  }

  /// Changes information about a model. The maximum size of the model is 400
  /// KB.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [modelName] :
  /// The name of the model to update.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<Model> updateModel({
    required String modelName,
    required String restApiId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/models/${Uri.encodeComponent(modelName)}',
      exceptionFnMap: _exceptionFns,
    );
    return Model.fromJson(response);
  }

  /// Updates a RequestValidator of a given RestApi.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [requestValidatorId] :
  /// The identifier of RequestValidator to be updated.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<RequestValidator> updateRequestValidator({
    required String requestValidatorId,
    required String restApiId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/requestvalidators/${Uri.encodeComponent(requestValidatorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return RequestValidator.fromJson(response);
  }

  /// Changes information about a Resource resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceId] :
  /// The identifier of the Resource resource.
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<Resource> updateResource({
    required String resourceId,
    required String restApiId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return Resource.fromJson(response);
  }

  /// Changes information about the specified API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<RestApi> updateRestApi({
    required String restApiId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}',
      exceptionFnMap: _exceptionFns,
    );
    return RestApi.fromJson(response);
  }

  /// Changes information about a Stage resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated RestApi.
  ///
  /// Parameter [stageName] :
  /// The name of the Stage resource to change information about.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<Stage> updateStage({
    required String restApiId,
    required String stageName,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/stages/${Uri.encodeComponent(stageName)}',
      exceptionFnMap: _exceptionFns,
    );
    return Stage.fromJson(response);
  }

  /// Grants a temporary extension to the remaining quota of a usage plan
  /// associated with a specified API key.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [keyId] :
  /// The identifier of the API key associated with the usage plan in which a
  /// temporary extension is granted to the remaining quota.
  ///
  /// Parameter [usagePlanId] :
  /// The Id of the usage plan associated with the usage data.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<Usage> updateUsage({
    required String keyId,
    required String usagePlanId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/usageplans/${Uri.encodeComponent(usagePlanId)}/keys/${Uri.encodeComponent(keyId)}/usage',
      exceptionFnMap: _exceptionFns,
    );
    return Usage.fromJson(response);
  }

  /// Updates a usage plan of a given plan Id.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [usagePlanId] :
  /// The Id of the to-be-updated usage plan.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<UsagePlan> updateUsagePlan({
    required String usagePlanId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/usageplans/${Uri.encodeComponent(usagePlanId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UsagePlan.fromJson(response);
  }

  /// Updates an existing VpcLink of a specified identifier.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [vpcLinkId] :
  /// The identifier of the VpcLink. It is used in an Integration to reference
  /// this VpcLink.
  ///
  /// Parameter [patchOperations] :
  /// For more information about supported patch operations, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
  /// Operations</a>.
  Future<VpcLink> updateVpcLink({
    required String vpcLinkId,
    List<PatchOperation>? patchOperations,
  }) async {
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/vpclinks/${Uri.encodeComponent(vpcLinkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return VpcLink.fromJson(response);
  }
}

/// Access log settings, including the access log format and access log
/// destination ARN.
class AccessLogSettings {
  /// The Amazon Resource Name (ARN) of the CloudWatch Logs log group or Kinesis
  /// Data Firehose delivery stream to receive access logs. If you specify a
  /// Kinesis Data Firehose delivery stream, the stream name must begin with
  /// <code>amazon-apigateway-</code>.
  final String? destinationArn;

  /// A single line format of the access logs of data, as specified by selected
  /// $context variables. The format must include at least
  /// <code>$context.requestId</code>.
  final String? format;

  AccessLogSettings({
    this.destinationArn,
    this.format,
  });

  factory AccessLogSettings.fromJson(Map<String, dynamic> json) {
    return AccessLogSettings(
      destinationArn: json['destinationArn'] as String?,
      format: json['format'] as String?,
    );
  }
}

/// Represents an AWS account that is associated with API Gateway.
class Account {
  /// The version of the API keys used for the account.
  final String? apiKeyVersion;

  /// The ARN of an Amazon CloudWatch role for the current Account.
  final String? cloudwatchRoleArn;

  /// A list of features supported for the account. When usage plans are enabled,
  /// the features list will include an entry of <code>"UsagePlans"</code>.
  final List<String>? features;

  /// Specifies the API request limits configured for the current Account.
  final ThrottleSettings? throttleSettings;

  Account({
    this.apiKeyVersion,
    this.cloudwatchRoleArn,
    this.features,
    this.throttleSettings,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      apiKeyVersion: json['apiKeyVersion'] as String?,
      cloudwatchRoleArn: json['cloudwatchRoleArn'] as String?,
      features: (json['features'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      throttleSettings: json['throttleSettings'] != null
          ? ThrottleSettings.fromJson(
              json['throttleSettings'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// A resource that can be distributed to callers for executing Method resources
/// that require an API key. API keys can be mapped to any Stage on any RestApi,
/// which indicates that the callers with the API key can make requests to that
/// stage.
class ApiKey {
  /// The timestamp when the API Key was created.
  final DateTime? createdDate;

  /// An Amazon Web Services Marketplace customer identifier, when integrating
  /// with the Amazon Web Services SaaS Marketplace.
  final String? customerId;

  /// The description of the API Key.
  final String? description;

  /// Specifies whether the API Key can be used by callers.
  final bool? enabled;

  /// The identifier of the API Key.
  final String? id;

  /// The timestamp when the API Key was last updated.
  final DateTime? lastUpdatedDate;

  /// The name of the API Key.
  final String? name;

  /// A list of Stage resources that are associated with the ApiKey resource.
  final List<String>? stageKeys;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  /// The value of the API Key.
  final String? value;

  ApiKey({
    this.createdDate,
    this.customerId,
    this.description,
    this.enabled,
    this.id,
    this.lastUpdatedDate,
    this.name,
    this.stageKeys,
    this.tags,
    this.value,
  });

  factory ApiKey.fromJson(Map<String, dynamic> json) {
    return ApiKey(
      createdDate: timeStampFromJson(json['createdDate']),
      customerId: json['customerId'] as String?,
      description: json['description'] as String?,
      enabled: json['enabled'] as bool?,
      id: json['id'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      name: json['name'] as String?,
      stageKeys: (json['stageKeys'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      value: json['value'] as String?,
    );
  }
}

/// The identifier of an ApiKey used in a UsagePlan.
class ApiKeyIds {
  /// A list of all the ApiKey identifiers.
  final List<String>? ids;

  /// A list of warning messages.
  final List<String>? warnings;

  ApiKeyIds({
    this.ids,
    this.warnings,
  });

  factory ApiKeyIds.fromJson(Map<String, dynamic> json) {
    return ApiKeyIds(
      ids: (json['ids'] as List?)?.nonNulls.map((e) => e as String).toList(),
      warnings: (json['warnings'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

enum ApiKeySourceType {
  header('HEADER'),
  authorizer('AUTHORIZER'),
  ;

  final String value;

  const ApiKeySourceType(this.value);

  static ApiKeySourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ApiKeySourceType'));
}

/// Represents a collection of API keys as represented by an ApiKeys resource.
class ApiKeys {
  /// The current page of elements from this collection.
  final List<ApiKey>? items;
  final String? position;

  /// A list of warning messages logged during the import of API keys when the
  /// <code>failOnWarnings</code> option is set to true.
  final List<String>? warnings;

  ApiKeys({
    this.items,
    this.position,
    this.warnings,
  });

  factory ApiKeys.fromJson(Map<String, dynamic> json) {
    return ApiKeys(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => ApiKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
      warnings: (json['warnings'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

enum ApiKeysFormat {
  csv('csv'),
  ;

  final String value;

  const ApiKeysFormat(this.value);

  static ApiKeysFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ApiKeysFormat'));
}

/// API stage name of the associated API stage in a usage plan.
class ApiStage {
  /// API Id of the associated API stage in a usage plan.
  final String? apiId;

  /// API stage name of the associated API stage in a usage plan.
  final String? stage;

  /// Map containing method level throttling information for API stage in a usage
  /// plan.
  final Map<String, ThrottleSettings>? throttle;

  ApiStage({
    this.apiId,
    this.stage,
    this.throttle,
  });

  factory ApiStage.fromJson(Map<String, dynamic> json) {
    return ApiStage(
      apiId: json['apiId'] as String?,
      stage: json['stage'] as String?,
      throttle: (json['throttle'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ThrottleSettings.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final apiId = this.apiId;
    final stage = this.stage;
    final throttle = this.throttle;
    return {
      if (apiId != null) 'apiId': apiId,
      if (stage != null) 'stage': stage,
      if (throttle != null) 'throttle': throttle,
    };
  }
}

/// Represents an authorization layer for methods. If enabled on a method, API
/// Gateway will activate the authorizer when a client calls the method.
class Authorizer {
  /// Optional customer-defined field, used in OpenAPI imports and exports without
  /// functional impact.
  final String? authType;

  /// Specifies the required credentials as an IAM role for API Gateway to invoke
  /// the authorizer. To specify an IAM role for API Gateway to assume, use the
  /// role's Amazon Resource Name (ARN). To use resource-based permissions on the
  /// Lambda function, specify null.
  final String? authorizerCredentials;

  /// The TTL in seconds of cached authorizer results. If it equals 0,
  /// authorization caching is disabled. If it is greater than 0, API Gateway will
  /// cache authorizer responses. If this field is not set, the default value is
  /// 300. The maximum value is 3600, or 1 hour.
  final int? authorizerResultTtlInSeconds;

  /// Specifies the authorizer's Uniform Resource Identifier (URI). For
  /// <code>TOKEN</code> or <code>REQUEST</code> authorizers, this must be a
  /// well-formed Lambda function URI, for example,
  /// <code>arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations</code>.
  /// In general, the URI has this form
  /// <code>arn:aws:apigateway:{region}:lambda:path/{service_api}</code>, where
  /// <code>{region}</code> is the same as the region hosting the Lambda function,
  /// <code>path</code> indicates that the remaining substring in the URI should
  /// be treated as the path to the resource, including the initial
  /// <code>/</code>. For Lambda functions, this is usually of the form
  /// <code>/2015-03-31/functions/[FunctionARN]/invocations</code>.
  final String? authorizerUri;

  /// The identifier for the authorizer resource.
  final String? id;

  /// The identity source for which authorization is requested. For a
  /// <code>TOKEN</code> or <code>COGNITO_USER_POOLS</code> authorizer, this is
  /// required and specifies the request header mapping expression for the custom
  /// header holding the authorization token submitted by the client. For example,
  /// if the token header name is <code>Auth</code>, the header mapping expression
  /// is <code>method.request.header.Auth</code>. For the <code>REQUEST</code>
  /// authorizer, this is required when authorization caching is enabled. The
  /// value is a comma-separated string of one or more mapping expressions of the
  /// specified request parameters. For example, if an <code>Auth</code> header, a
  /// <code>Name</code> query string parameter are defined as identity sources,
  /// this value is <code>method.request.header.Auth</code>,
  /// <code>method.request.querystring.Name</code>. These parameters will be used
  /// to derive the authorization caching key and to perform runtime validation of
  /// the <code>REQUEST</code> authorizer by verifying all of the identity-related
  /// request parameters are present, not null and non-empty. Only when this is
  /// true does the authorizer invoke the authorizer Lambda function, otherwise,
  /// it returns a 401 Unauthorized response without calling the Lambda function.
  /// The valid value is a string of comma-separated mapping expressions of the
  /// specified request parameters. When the authorization caching is not enabled,
  /// this property is optional.
  final String? identitySource;

  /// A validation expression for the incoming identity token. For
  /// <code>TOKEN</code> authorizers, this value is a regular expression. For
  /// <code>COGNITO_USER_POOLS</code> authorizers, API Gateway will match the
  /// <code>aud</code> field of the incoming token from the client against the
  /// specified regular expression. It will invoke the authorizer's Lambda
  /// function when there is a match. Otherwise, it will return a 401 Unauthorized
  /// response without calling the Lambda function. The validation expression does
  /// not apply to the <code>REQUEST</code> authorizer.
  final String? identityValidationExpression;

  /// The name of the authorizer.
  final String? name;

  /// A list of the Amazon Cognito user pool ARNs for the
  /// <code>COGNITO_USER_POOLS</code> authorizer. Each element is of this format:
  /// <code>arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}</code>.
  /// For a <code>TOKEN</code> or <code>REQUEST</code> authorizer, this is not
  /// defined.
  final List<String>? providerARNs;

  /// The authorizer type. Valid values are <code>TOKEN</code> for a Lambda
  /// function using a single authorization token submitted in a custom header,
  /// <code>REQUEST</code> for a Lambda function using incoming request
  /// parameters, and <code>COGNITO_USER_POOLS</code> for using an Amazon Cognito
  /// user pool.
  final AuthorizerType? type;

  Authorizer({
    this.authType,
    this.authorizerCredentials,
    this.authorizerResultTtlInSeconds,
    this.authorizerUri,
    this.id,
    this.identitySource,
    this.identityValidationExpression,
    this.name,
    this.providerARNs,
    this.type,
  });

  factory Authorizer.fromJson(Map<String, dynamic> json) {
    return Authorizer(
      authType: json['authType'] as String?,
      authorizerCredentials: json['authorizerCredentials'] as String?,
      authorizerResultTtlInSeconds:
          json['authorizerResultTtlInSeconds'] as int?,
      authorizerUri: json['authorizerUri'] as String?,
      id: json['id'] as String?,
      identitySource: json['identitySource'] as String?,
      identityValidationExpression:
          json['identityValidationExpression'] as String?,
      name: json['name'] as String?,
      providerARNs: (json['providerARNs'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String?)?.let(AuthorizerType.fromString),
    );
  }
}

/// The authorizer type. Valid values are <code>TOKEN</code> for a Lambda
/// function using a single authorization token submitted in a custom header,
/// <code>REQUEST</code> for a Lambda function using incoming request
/// parameters, and <code>COGNITO_USER_POOLS</code> for using an Amazon Cognito
/// user pool.
enum AuthorizerType {
  token('TOKEN'),
  request('REQUEST'),
  cognitoUserPools('COGNITO_USER_POOLS'),
  ;

  final String value;

  const AuthorizerType(this.value);

  static AuthorizerType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AuthorizerType'));
}

/// Represents a collection of Authorizer resources.
class Authorizers {
  /// The current page of elements from this collection.
  final List<Authorizer>? items;
  final String? position;

  Authorizers({
    this.items,
    this.position,
  });

  factory Authorizers.fromJson(Map<String, dynamic> json) {
    return Authorizers(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => Authorizer.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// Represents the base path that callers of the API must provide as part of the
/// URL after the domain name.
class BasePathMapping {
  /// The base path name that callers of the API must provide as part of the URL
  /// after the domain name.
  final String? basePath;

  /// The string identifier of the associated RestApi.
  final String? restApiId;

  /// The name of the associated stage.
  final String? stage;

  BasePathMapping({
    this.basePath,
    this.restApiId,
    this.stage,
  });

  factory BasePathMapping.fromJson(Map<String, dynamic> json) {
    return BasePathMapping(
      basePath: json['basePath'] as String?,
      restApiId: json['restApiId'] as String?,
      stage: json['stage'] as String?,
    );
  }
}

/// Represents a collection of BasePathMapping resources.
class BasePathMappings {
  /// The current page of elements from this collection.
  final List<BasePathMapping>? items;
  final String? position;

  BasePathMappings({
    this.items,
    this.position,
  });

  factory BasePathMappings.fromJson(Map<String, dynamic> json) {
    return BasePathMappings(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => BasePathMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// Returns the size of the CacheCluster.
enum CacheClusterSize {
  $0_5('0.5'),
  $1_6('1.6'),
  $6_1('6.1'),
  $13_5('13.5'),
  $28_4('28.4'),
  $58_2('58.2'),
  $118('118'),
  $237('237'),
  ;

  final String value;

  const CacheClusterSize(this.value);

  static CacheClusterSize fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CacheClusterSize'));
}

/// Returns the status of the CacheCluster.
enum CacheClusterStatus {
  createInProgress('CREATE_IN_PROGRESS'),
  available('AVAILABLE'),
  deleteInProgress('DELETE_IN_PROGRESS'),
  notAvailable('NOT_AVAILABLE'),
  flushInProgress('FLUSH_IN_PROGRESS'),
  ;

  final String value;

  const CacheClusterStatus(this.value);

  static CacheClusterStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum CacheClusterStatus'));
}

/// Configuration settings of a canary deployment.
class CanarySettings {
  /// The ID of the canary deployment.
  final String? deploymentId;

  /// The percent (0-100) of traffic diverted to a canary deployment.
  final double? percentTraffic;

  /// Stage variables overridden for a canary release deployment, including new
  /// stage variables introduced in the canary. These stage variables are
  /// represented as a string-to-string map between stage variable names and their
  /// values.
  final Map<String, String>? stageVariableOverrides;

  /// A Boolean flag to indicate whether the canary deployment uses the stage
  /// cache or not.
  final bool? useStageCache;

  CanarySettings({
    this.deploymentId,
    this.percentTraffic,
    this.stageVariableOverrides,
    this.useStageCache,
  });

  factory CanarySettings.fromJson(Map<String, dynamic> json) {
    return CanarySettings(
      deploymentId: json['deploymentId'] as String?,
      percentTraffic: json['percentTraffic'] as double?,
      stageVariableOverrides:
          (json['stageVariableOverrides'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      useStageCache: json['useStageCache'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    final percentTraffic = this.percentTraffic;
    final stageVariableOverrides = this.stageVariableOverrides;
    final useStageCache = this.useStageCache;
    return {
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (percentTraffic != null) 'percentTraffic': percentTraffic,
      if (stageVariableOverrides != null)
        'stageVariableOverrides': stageVariableOverrides,
      if (useStageCache != null) 'useStageCache': useStageCache,
    };
  }
}

/// Represents a client certificate used to configure client-side SSL
/// authentication while sending requests to the integration endpoint.
class ClientCertificate {
  /// The identifier of the client certificate.
  final String? clientCertificateId;

  /// The timestamp when the client certificate was created.
  final DateTime? createdDate;

  /// The description of the client certificate.
  final String? description;

  /// The timestamp when the client certificate will expire.
  final DateTime? expirationDate;

  /// The PEM-encoded public key of the client certificate, which can be used to
  /// configure certificate authentication in the integration endpoint .
  final String? pemEncodedCertificate;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  ClientCertificate({
    this.clientCertificateId,
    this.createdDate,
    this.description,
    this.expirationDate,
    this.pemEncodedCertificate,
    this.tags,
  });

  factory ClientCertificate.fromJson(Map<String, dynamic> json) {
    return ClientCertificate(
      clientCertificateId: json['clientCertificateId'] as String?,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      expirationDate: timeStampFromJson(json['expirationDate']),
      pemEncodedCertificate: json['pemEncodedCertificate'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

/// Represents a collection of ClientCertificate resources.
class ClientCertificates {
  /// The current page of elements from this collection.
  final List<ClientCertificate>? items;
  final String? position;

  ClientCertificates({
    this.items,
    this.position,
  });

  factory ClientCertificates.fromJson(Map<String, dynamic> json) {
    return ClientCertificates(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => ClientCertificate.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

enum ConnectionType {
  internet('INTERNET'),
  vpcLink('VPC_LINK'),
  ;

  final String value;

  const ConnectionType(this.value);

  static ConnectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ConnectionType'));
}

enum ContentHandlingStrategy {
  convertToBinary('CONVERT_TO_BINARY'),
  convertToText('CONVERT_TO_TEXT'),
  ;

  final String value;

  const ContentHandlingStrategy(this.value);

  static ContentHandlingStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ContentHandlingStrategy'));
}

/// An immutable representation of a RestApi resource that can be called by
/// users using Stages. A deployment must be associated with a Stage for it to
/// be callable over the Internet.
class Deployment {
  /// A summary of the RestApi at the date and time that the deployment resource
  /// was created.
  final Map<String, Map<String, MethodSnapshot>>? apiSummary;

  /// The date and time that the deployment resource was created.
  final DateTime? createdDate;

  /// The description for the deployment resource.
  final String? description;

  /// The identifier for the deployment resource.
  final String? id;

  Deployment({
    this.apiSummary,
    this.createdDate,
    this.description,
    this.id,
  });

  factory Deployment.fromJson(Map<String, dynamic> json) {
    return Deployment(
      apiSummary: (json['apiSummary'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as Map<String, dynamic>).map((k, e) => MapEntry(
                  k, MethodSnapshot.fromJson(e as Map<String, dynamic>))))),
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      id: json['id'] as String?,
    );
  }
}

/// The input configuration for a canary deployment.
class DeploymentCanarySettings {
  /// The percentage (0.0-100.0) of traffic routed to the canary deployment.
  final double? percentTraffic;

  /// A stage variable overrides used for the canary release deployment. They can
  /// override existing stage variables or add new stage variables for the canary
  /// release deployment. These stage variables are represented as a
  /// string-to-string map between stage variable names and their values.
  final Map<String, String>? stageVariableOverrides;

  /// A Boolean flag to indicate whether the canary release deployment uses the
  /// stage cache or not.
  final bool? useStageCache;

  DeploymentCanarySettings({
    this.percentTraffic,
    this.stageVariableOverrides,
    this.useStageCache,
  });

  Map<String, dynamic> toJson() {
    final percentTraffic = this.percentTraffic;
    final stageVariableOverrides = this.stageVariableOverrides;
    final useStageCache = this.useStageCache;
    return {
      if (percentTraffic != null) 'percentTraffic': percentTraffic,
      if (stageVariableOverrides != null)
        'stageVariableOverrides': stageVariableOverrides,
      if (useStageCache != null) 'useStageCache': useStageCache,
    };
  }
}

/// Represents a collection resource that contains zero or more references to
/// your existing deployments, and links that guide you on how to interact with
/// your collection. The collection offers a paginated view of the contained
/// deployments.
class Deployments {
  /// The current page of elements from this collection.
  final List<Deployment>? items;
  final String? position;

  Deployments({
    this.items,
    this.position,
  });

  factory Deployments.fromJson(Map<String, dynamic> json) {
    return Deployments(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => Deployment.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// A documentation part for a targeted API entity.
class DocumentationPart {
  /// The DocumentationPart identifier, generated by API Gateway when the
  /// <code>DocumentationPart</code> is created.
  final String? id;

  /// The location of the API entity to which the documentation applies. Valid
  /// fields depend on the targeted API entity type. All the valid location fields
  /// are not required. If not explicitly specified, a valid location field is
  /// treated as a wildcard and associated documentation content may be inherited
  /// by matching entities, unless overridden.
  final DocumentationPartLocation? location;

  /// A content map of API-specific key-value pairs describing the targeted API
  /// entity. The map must be encoded as a JSON string, e.g., <code>"{
  /// \"description\": \"The API does ...\" }"</code>. Only OpenAPI-compliant
  /// documentation-related fields from the properties map are exported and,
  /// hence, published as part of the API entity definitions, while the original
  /// documentation parts are exported in a OpenAPI extension of
  /// <code>x-amazon-apigateway-documentation</code>.
  final String? properties;

  DocumentationPart({
    this.id,
    this.location,
    this.properties,
  });

  factory DocumentationPart.fromJson(Map<String, dynamic> json) {
    return DocumentationPart(
      id: json['id'] as String?,
      location: json['location'] != null
          ? DocumentationPartLocation.fromJson(
              json['location'] as Map<String, dynamic>)
          : null,
      properties: json['properties'] as String?,
    );
  }
}

/// A collection of the imported DocumentationPart identifiers.
class DocumentationPartIds {
  /// A list of the returned documentation part identifiers.
  final List<String>? ids;

  /// A list of warning messages reported during import of documentation parts.
  final List<String>? warnings;

  DocumentationPartIds({
    this.ids,
    this.warnings,
  });

  factory DocumentationPartIds.fromJson(Map<String, dynamic> json) {
    return DocumentationPartIds(
      ids: (json['ids'] as List?)?.nonNulls.map((e) => e as String).toList(),
      warnings: (json['warnings'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// Specifies the target API entity to which the documentation applies.
class DocumentationPartLocation {
  /// The type of API entity to which the documentation content applies. Valid
  /// values are <code>API</code>, <code>AUTHORIZER</code>, <code>MODEL</code>,
  /// <code>RESOURCE</code>, <code>METHOD</code>, <code>PATH_PARAMETER</code>,
  /// <code>QUERY_PARAMETER</code>, <code>REQUEST_HEADER</code>,
  /// <code>REQUEST_BODY</code>, <code>RESPONSE</code>,
  /// <code>RESPONSE_HEADER</code>, and <code>RESPONSE_BODY</code>. Content
  /// inheritance does not apply to any entity of the <code>API</code>,
  /// <code>AUTHORIZER</code>, <code>METHOD</code>, <code>MODEL</code>,
  /// <code>REQUEST_BODY</code>, or <code>RESOURCE</code> type.
  final DocumentationPartType type;

  /// The HTTP verb of a method. It is a valid field for the API entity types of
  /// <code>METHOD</code>, <code>PATH_PARAMETER</code>,
  /// <code>QUERY_PARAMETER</code>, <code>REQUEST_HEADER</code>,
  /// <code>REQUEST_BODY</code>, <code>RESPONSE</code>,
  /// <code>RESPONSE_HEADER</code>, and <code>RESPONSE_BODY</code>. The default
  /// value is <code>*</code> for any method. When an applicable child entity
  /// inherits the content of an entity of the same type with more general
  /// specifications of the other <code>location</code> attributes, the child
  /// entity's <code>method</code> attribute must match that of the parent entity
  /// exactly.
  final String? method;

  /// The name of the targeted API entity. It is a valid and required field for
  /// the API entity types of <code>AUTHORIZER</code>, <code>MODEL</code>,
  /// <code>PATH_PARAMETER</code>, <code>QUERY_PARAMETER</code>,
  /// <code>REQUEST_HEADER</code>, <code>REQUEST_BODY</code> and
  /// <code>RESPONSE_HEADER</code>. It is an invalid field for any other entity
  /// type.
  final String? name;

  /// The URL path of the target. It is a valid field for the API entity types of
  /// <code>RESOURCE</code>, <code>METHOD</code>, <code>PATH_PARAMETER</code>,
  /// <code>QUERY_PARAMETER</code>, <code>REQUEST_HEADER</code>,
  /// <code>REQUEST_BODY</code>, <code>RESPONSE</code>,
  /// <code>RESPONSE_HEADER</code>, and <code>RESPONSE_BODY</code>. The default
  /// value is <code>/</code> for the root resource. When an applicable child
  /// entity inherits the content of another entity of the same type with more
  /// general specifications of the other <code>location</code> attributes, the
  /// child entity's <code>path</code> attribute must match that of the parent
  /// entity as a prefix.
  final String? path;

  /// The HTTP status code of a response. It is a valid field for the API entity
  /// types of <code>RESPONSE</code>, <code>RESPONSE_HEADER</code>, and
  /// <code>RESPONSE_BODY</code>. The default value is <code>*</code> for any
  /// status code. When an applicable child entity inherits the content of an
  /// entity of the same type with more general specifications of the other
  /// <code>location</code> attributes, the child entity's <code>statusCode</code>
  /// attribute must match that of the parent entity exactly.
  final String? statusCode;

  DocumentationPartLocation({
    required this.type,
    this.method,
    this.name,
    this.path,
    this.statusCode,
  });

  factory DocumentationPartLocation.fromJson(Map<String, dynamic> json) {
    return DocumentationPartLocation(
      type: DocumentationPartType.fromString((json['type'] as String)),
      method: json['method'] as String?,
      name: json['name'] as String?,
      path: json['path'] as String?,
      statusCode: json['statusCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final method = this.method;
    final name = this.name;
    final path = this.path;
    final statusCode = this.statusCode;
    return {
      'type': type.value,
      if (method != null) 'method': method,
      if (name != null) 'name': name,
      if (path != null) 'path': path,
      if (statusCode != null) 'statusCode': statusCode,
    };
  }
}

enum DocumentationPartType {
  api('API'),
  authorizer('AUTHORIZER'),
  model('MODEL'),
  resource('RESOURCE'),
  method('METHOD'),
  pathParameter('PATH_PARAMETER'),
  queryParameter('QUERY_PARAMETER'),
  requestHeader('REQUEST_HEADER'),
  requestBody('REQUEST_BODY'),
  response('RESPONSE'),
  responseHeader('RESPONSE_HEADER'),
  responseBody('RESPONSE_BODY'),
  ;

  final String value;

  const DocumentationPartType(this.value);

  static DocumentationPartType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum DocumentationPartType'));
}

/// The collection of documentation parts of an API.
class DocumentationParts {
  /// The current page of elements from this collection.
  final List<DocumentationPart>? items;
  final String? position;

  DocumentationParts({
    this.items,
    this.position,
  });

  factory DocumentationParts.fromJson(Map<String, dynamic> json) {
    return DocumentationParts(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => DocumentationPart.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// A snapshot of the documentation of an API.
class DocumentationVersion {
  /// The date when the API documentation snapshot is created.
  final DateTime? createdDate;

  /// The description of the API documentation snapshot.
  final String? description;

  /// The version identifier of the API documentation snapshot.
  final String? version;

  DocumentationVersion({
    this.createdDate,
    this.description,
    this.version,
  });

  factory DocumentationVersion.fromJson(Map<String, dynamic> json) {
    return DocumentationVersion(
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      version: json['version'] as String?,
    );
  }
}

/// The collection of documentation snapshots of an API.
class DocumentationVersions {
  /// The current page of elements from this collection.
  final List<DocumentationVersion>? items;
  final String? position;

  DocumentationVersions({
    this.items,
    this.position,
  });

  factory DocumentationVersions.fromJson(Map<String, dynamic> json) {
    return DocumentationVersions(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => DocumentationVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// Represents a custom domain name as a user-friendly host name of an API
/// (RestApi).
class DomainName {
  /// The reference to an Amazon Web Services-managed certificate that will be
  /// used by edge-optimized endpoint for this domain name. Certificate Manager is
  /// the only supported source.
  final String? certificateArn;

  /// The name of the certificate that will be used by edge-optimized endpoint for
  /// this domain name.
  final String? certificateName;

  /// The timestamp when the certificate that was used by edge-optimized endpoint
  /// for this domain name was uploaded.
  final DateTime? certificateUploadDate;

  /// The domain name of the Amazon CloudFront distribution associated with this
  /// custom domain name for an edge-optimized endpoint. You set up this
  /// association when adding a DNS record pointing the custom domain name to this
  /// distribution name. For more information about CloudFront distributions, see
  /// the Amazon CloudFront documentation.
  final String? distributionDomainName;

  /// The region-agnostic Amazon Route 53 Hosted Zone ID of the edge-optimized
  /// endpoint. The valid value is <code>Z2FDTNDATAQYW2</code> for all the
  /// regions. For more information, see Set up a Regional Custom Domain Name and
  /// AWS Regions and Endpoints for API Gateway.
  final String? distributionHostedZoneId;

  /// The custom domain name as an API host name, for example,
  /// <code>my-api.example.com</code>.
  final String? domainName;

  /// The status of the DomainName migration. The valid values are
  /// <code>AVAILABLE</code> and <code>UPDATING</code>. If the status is
  /// <code>UPDATING</code>, the domain cannot be modified further until the
  /// existing operation is complete. If it is <code>AVAILABLE</code>, the domain
  /// can be updated.
  final DomainNameStatus? domainNameStatus;

  /// An optional text message containing detailed information about status of the
  /// DomainName migration.
  final String? domainNameStatusMessage;

  /// The endpoint configuration of this DomainName showing the endpoint types of
  /// the domain name.
  final EndpointConfiguration? endpointConfiguration;

  /// The mutual TLS authentication configuration for a custom domain name. If
  /// specified, API Gateway performs two-way authentication between the client
  /// and the server. Clients must present a trusted certificate to access your
  /// API.
  final MutualTlsAuthentication? mutualTlsAuthentication;

  /// The ARN of the public certificate issued by ACM to validate ownership of
  /// your custom domain. Only required when configuring mutual TLS and using an
  /// ACM imported or private CA certificate ARN as the regionalCertificateArn.
  final String? ownershipVerificationCertificateArn;

  /// The reference to an Amazon Web Services-managed certificate that will be
  /// used for validating the regional domain name. Certificate Manager is the
  /// only supported source.
  final String? regionalCertificateArn;

  /// The name of the certificate that will be used for validating the regional
  /// domain name.
  final String? regionalCertificateName;

  /// The domain name associated with the regional endpoint for this custom domain
  /// name. You set up this association by adding a DNS record that points the
  /// custom domain name to this regional domain name. The regional domain name is
  /// returned by API Gateway when you create a regional endpoint.
  final String? regionalDomainName;

  /// The region-specific Amazon Route 53 Hosted Zone ID of the regional endpoint.
  /// For more information, see Set up a Regional Custom Domain Name and AWS
  /// Regions and Endpoints for API Gateway.
  final String? regionalHostedZoneId;

  /// The Transport Layer Security (TLS) version + cipher suite for this
  /// DomainName. The valid values are <code>TLS_1_0</code> and
  /// <code>TLS_1_2</code>.
  final SecurityPolicy? securityPolicy;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  DomainName({
    this.certificateArn,
    this.certificateName,
    this.certificateUploadDate,
    this.distributionDomainName,
    this.distributionHostedZoneId,
    this.domainName,
    this.domainNameStatus,
    this.domainNameStatusMessage,
    this.endpointConfiguration,
    this.mutualTlsAuthentication,
    this.ownershipVerificationCertificateArn,
    this.regionalCertificateArn,
    this.regionalCertificateName,
    this.regionalDomainName,
    this.regionalHostedZoneId,
    this.securityPolicy,
    this.tags,
  });

  factory DomainName.fromJson(Map<String, dynamic> json) {
    return DomainName(
      certificateArn: json['certificateArn'] as String?,
      certificateName: json['certificateName'] as String?,
      certificateUploadDate: timeStampFromJson(json['certificateUploadDate']),
      distributionDomainName: json['distributionDomainName'] as String?,
      distributionHostedZoneId: json['distributionHostedZoneId'] as String?,
      domainName: json['domainName'] as String?,
      domainNameStatus: (json['domainNameStatus'] as String?)
          ?.let(DomainNameStatus.fromString),
      domainNameStatusMessage: json['domainNameStatusMessage'] as String?,
      endpointConfiguration: json['endpointConfiguration'] != null
          ? EndpointConfiguration.fromJson(
              json['endpointConfiguration'] as Map<String, dynamic>)
          : null,
      mutualTlsAuthentication: json['mutualTlsAuthentication'] != null
          ? MutualTlsAuthentication.fromJson(
              json['mutualTlsAuthentication'] as Map<String, dynamic>)
          : null,
      ownershipVerificationCertificateArn:
          json['ownershipVerificationCertificateArn'] as String?,
      regionalCertificateArn: json['regionalCertificateArn'] as String?,
      regionalCertificateName: json['regionalCertificateName'] as String?,
      regionalDomainName: json['regionalDomainName'] as String?,
      regionalHostedZoneId: json['regionalHostedZoneId'] as String?,
      securityPolicy:
          (json['securityPolicy'] as String?)?.let(SecurityPolicy.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

enum DomainNameStatus {
  available('AVAILABLE'),
  updating('UPDATING'),
  pending('PENDING'),
  pendingCertificateReimport('PENDING_CERTIFICATE_REIMPORT'),
  pendingOwnershipVerification('PENDING_OWNERSHIP_VERIFICATION'),
  ;

  final String value;

  const DomainNameStatus(this.value);

  static DomainNameStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DomainNameStatus'));
}

/// Represents a collection of DomainName resources.
class DomainNames {
  /// The current page of elements from this collection.
  final List<DomainName>? items;
  final String? position;

  DomainNames({
    this.items,
    this.position,
  });

  factory DomainNames.fromJson(Map<String, dynamic> json) {
    return DomainNames(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => DomainName.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// The endpoint configuration to indicate the types of endpoints an API
/// (RestApi) or its custom domain name (DomainName) has.
class EndpointConfiguration {
  /// A list of endpoint types of an API (RestApi) or its custom domain name
  /// (DomainName). For an edge-optimized API and its custom domain name, the
  /// endpoint type is <code>"EDGE"</code>. For a regional API and its custom
  /// domain name, the endpoint type is <code>REGIONAL</code>. For a private API,
  /// the endpoint type is <code>PRIVATE</code>.
  final List<EndpointType>? types;

  /// A list of VpcEndpointIds of an API (RestApi) against which to create Route53
  /// ALIASes. It is only supported for <code>PRIVATE</code> endpoint type.
  final List<String>? vpcEndpointIds;

  EndpointConfiguration({
    this.types,
    this.vpcEndpointIds,
  });

  factory EndpointConfiguration.fromJson(Map<String, dynamic> json) {
    return EndpointConfiguration(
      types: (json['types'] as List?)
          ?.nonNulls
          .map((e) => EndpointType.fromString((e as String)))
          .toList(),
      vpcEndpointIds: (json['vpcEndpointIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final types = this.types;
    final vpcEndpointIds = this.vpcEndpointIds;
    return {
      if (types != null) 'types': types.map((e) => e.value).toList(),
      if (vpcEndpointIds != null) 'vpcEndpointIds': vpcEndpointIds,
    };
  }
}

/// The endpoint type. The valid values are <code>EDGE</code> for edge-optimized
/// API setup, most suitable for mobile applications; <code>REGIONAL</code> for
/// regional API endpoint setup, most suitable for calling from AWS Region; and
/// <code>PRIVATE</code> for private APIs.
enum EndpointType {
  regional('REGIONAL'),
  edge('EDGE'),
  private('PRIVATE'),
  ;

  final String value;

  const EndpointType(this.value);

  static EndpointType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EndpointType'));
}

/// The binary blob response to GetExport, which contains the generated SDK.
class ExportResponse {
  /// The binary blob response to GetExport, which contains the export.
  final Uint8List? body;

  /// The content-disposition header value in the HTTP response.
  final String? contentDisposition;

  /// The content-type header value in the HTTP response. This will correspond to
  /// a valid 'accept' type in the request.
  final String? contentType;

  ExportResponse({
    this.body,
    this.contentDisposition,
    this.contentType,
  });
}

/// A gateway response of a given response type and status code, with optional
/// response parameters and mapping templates.
class GatewayResponse {
  /// A Boolean flag to indicate whether this GatewayResponse is the default
  /// gateway response (<code>true</code>) or not (<code>false</code>). A default
  /// gateway response is one generated by API Gateway without any customization
  /// by an API developer.
  final bool? defaultResponse;

  /// Response parameters (paths, query strings and headers) of the
  /// GatewayResponse as a string-to-string map of key-value pairs.
  final Map<String, String>? responseParameters;

  /// Response templates of the GatewayResponse as a string-to-string map of
  /// key-value pairs.
  final Map<String, String>? responseTemplates;

  /// The response type of the associated GatewayResponse.
  final GatewayResponseType? responseType;

  /// The HTTP status code for this GatewayResponse.
  final String? statusCode;

  GatewayResponse({
    this.defaultResponse,
    this.responseParameters,
    this.responseTemplates,
    this.responseType,
    this.statusCode,
  });

  factory GatewayResponse.fromJson(Map<String, dynamic> json) {
    return GatewayResponse(
      defaultResponse: json['defaultResponse'] as bool?,
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseTemplates: (json['responseTemplates'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseType: (json['responseType'] as String?)
          ?.let(GatewayResponseType.fromString),
      statusCode: json['statusCode'] as String?,
    );
  }
}

enum GatewayResponseType {
  default_4xx('DEFAULT_4XX'),
  default_5xx('DEFAULT_5XX'),
  resourceNotFound('RESOURCE_NOT_FOUND'),
  unauthorized('UNAUTHORIZED'),
  invalidApiKey('INVALID_API_KEY'),
  accessDenied('ACCESS_DENIED'),
  authorizerFailure('AUTHORIZER_FAILURE'),
  authorizerConfigurationError('AUTHORIZER_CONFIGURATION_ERROR'),
  invalidSignature('INVALID_SIGNATURE'),
  expiredToken('EXPIRED_TOKEN'),
  missingAuthenticationToken('MISSING_AUTHENTICATION_TOKEN'),
  integrationFailure('INTEGRATION_FAILURE'),
  integrationTimeout('INTEGRATION_TIMEOUT'),
  apiConfigurationError('API_CONFIGURATION_ERROR'),
  unsupportedMediaType('UNSUPPORTED_MEDIA_TYPE'),
  badRequestParameters('BAD_REQUEST_PARAMETERS'),
  badRequestBody('BAD_REQUEST_BODY'),
  requestTooLarge('REQUEST_TOO_LARGE'),
  throttled('THROTTLED'),
  quotaExceeded('QUOTA_EXCEEDED'),
  wafFiltered('WAF_FILTERED'),
  ;

  final String value;

  const GatewayResponseType(this.value);

  static GatewayResponseType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum GatewayResponseType'));
}

/// The collection of the GatewayResponse instances of a RestApi as a
/// <code>responseType</code>-to-GatewayResponse object map of key-value pairs.
/// As such, pagination is not supported for querying this collection.
class GatewayResponses {
  /// Returns the entire collection, because of no pagination support.
  final List<GatewayResponse>? items;
  final String? position;

  GatewayResponses({
    this.items,
    this.position,
  });

  factory GatewayResponses.fromJson(Map<String, dynamic> json) {
    return GatewayResponses(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => GatewayResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// Represents an <code>HTTP</code>, <code>HTTP_PROXY</code>, <code>AWS</code>,
/// <code>AWS_PROXY</code>, or Mock integration.
class Integration {
  /// A list of request parameters whose values API Gateway caches. To be valid
  /// values for <code>cacheKeyParameters</code>, these parameters must also be
  /// specified for Method <code>requestParameters</code>.
  final List<String>? cacheKeyParameters;

  /// Specifies a group of related cached parameters. By default, API Gateway uses
  /// the resource ID as the <code>cacheNamespace</code>. You can specify the same
  /// <code>cacheNamespace</code> across resources to return the same cached data
  /// for requests to different resources.
  final String? cacheNamespace;

  /// The ID of the VpcLink used for the integration when
  /// <code>connectionType=VPC_LINK</code> and undefined, otherwise.
  final String? connectionId;

  /// The type of the network connection to the integration endpoint. The valid
  /// value is <code>INTERNET</code> for connections through the public routable
  /// internet or <code>VPC_LINK</code> for private connections between API
  /// Gateway and a network load balancer in a VPC. The default value is
  /// <code>INTERNET</code>.
  final ConnectionType? connectionType;

  /// Specifies how to handle request payload content type conversions. Supported
  /// values are <code>CONVERT_TO_BINARY</code> and <code>CONVERT_TO_TEXT</code>,
  /// with the following behaviors:
  ///
  /// If this property is not defined, the request payload will be passed through
  /// from the method request to integration request without modification,
  /// provided that the <code>passthroughBehavior</code> is configured to support
  /// payload pass-through.
  final ContentHandlingStrategy? contentHandling;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string <code>arn:aws:iam::\*:user/\*</code>. To use resource-based
  /// permissions on supported Amazon Web Services services, specify null.
  final String? credentials;

  /// Specifies the integration's HTTP method type. For the Type property, if you
  /// specify <code>MOCK</code>, this property is optional. For Lambda
  /// integrations, you must set the integration method to <code>POST</code>. For
  /// all other types, you must specify this property.
  final String? httpMethod;

  /// Specifies the integration's responses.
  final Map<String, IntegrationResponse>? integrationResponses;

  /// Specifies how the method request body of an unmapped content type will be
  /// passed through the integration request to the back end without
  /// transformation. A content type is unmapped if no mapping template is defined
  /// in the integration or the content type does not match any of the mapped
  /// content types, as specified in <code>requestTemplates</code>. The valid
  /// value is one of the following: <code>WHEN_NO_MATCH</code>: passes the method
  /// request body through the integration request to the back end without
  /// transformation when the method request content type does not match any
  /// content type associated with the mapping templates defined in the
  /// integration request. <code>WHEN_NO_TEMPLATES</code>: passes the method
  /// request body through the integration request to the back end without
  /// transformation when no mapping template is defined in the integration
  /// request. If a template is defined when this option is selected, the method
  /// request of an unmapped content-type will be rejected with an HTTP 415
  /// Unsupported Media Type response. <code>NEVER</code>: rejects the method
  /// request with an HTTP 415 Unsupported Media Type response when either the
  /// method request content type does not match any content type associated with
  /// the mapping templates defined in the integration request or no mapping
  /// template is defined in the integration request.
  final String? passthroughBehavior;

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the back end. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or static
  /// value that must be enclosed within single quotes and pre-encoded as required
  /// by the back end. The method request parameter value must match the pattern
  /// of <code>method.request.{location}.{name}</code>, where
  /// <code>location</code> is <code>querystring</code>, <code>path</code>, or
  /// <code>header</code> and <code>name</code> must be a valid and unique method
  /// request parameter name.
  final Map<String, String>? requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value.
  final Map<String, String>? requestTemplates;

  /// Custom timeout between 50 and 29,000 milliseconds. The default value is
  /// 29,000 milliseconds or 29 seconds.
  final int? timeoutInMillis;

  /// Specifies the TLS configuration for an integration.
  final TlsConfig? tlsConfig;

  /// Specifies an API method integration type. The valid value is one of the
  /// following:
  ///
  /// For the HTTP and HTTP proxy integrations, each integration can specify a
  /// protocol (<code>http/https</code>), port and path. Standard 80 and 443 ports
  /// are supported as well as custom ports above 1024. An HTTP or HTTP proxy
  /// integration with a <code>connectionType</code> of <code>VPC_LINK</code> is
  /// referred to as a private integration and uses a VpcLink to connect API
  /// Gateway to a network load balancer of a VPC.
  final IntegrationType? type;

  /// Specifies Uniform Resource Identifier (URI) of the integration endpoint.
  ///
  /// For <code>HTTP</code> or <code>HTTP_PROXY</code> integrations, the URI must
  /// be a fully formed, encoded HTTP(S) URL according to the RFC-3986
  /// specification for standard integrations. If <code>connectionType</code> is
  /// <code>VPC_LINK</code> specify the Network Load Balancer DNS name. For
  /// <code>AWS</code> or <code>AWS_PROXY</code> integrations, the URI is of the
  /// form
  /// <code>arn:aws:apigateway:{region}:{subdomain.service|service}:path|action/{service_api}</code>.
  /// Here, {Region} is the API Gateway region (e.g., us-east-1); {service} is the
  /// name of the integrated Amazon Web Services service (e.g., s3); and
  /// {subdomain} is a designated subdomain supported by certain Amazon Web
  /// Services service for fast host-name lookup. action can be used for an Amazon
  /// Web Services service action-based API, using an
  /// Action={name}&amp;{p1}={v1}&amp;p2={v2}... query string. The ensuing
  /// {service_api} refers to a supported action {name} plus any required input
  /// parameters. Alternatively, path can be used for an Amazon Web Services
  /// service path-based API. The ensuing service_api refers to the path to an
  /// Amazon Web Services service resource, including the region of the integrated
  /// Amazon Web Services service, if applicable. For example, for integration
  /// with the S3 API of GetObject, the uri can be either
  /// <code>arn:aws:apigateway:us-west-2:s3:action/GetObject&amp;Bucket={bucket}&amp;Key={key}</code>
  /// or <code>arn:aws:apigateway:us-west-2:s3:path/{bucket}/{key}</code>
  final String? uri;

  Integration({
    this.cacheKeyParameters,
    this.cacheNamespace,
    this.connectionId,
    this.connectionType,
    this.contentHandling,
    this.credentials,
    this.httpMethod,
    this.integrationResponses,
    this.passthroughBehavior,
    this.requestParameters,
    this.requestTemplates,
    this.timeoutInMillis,
    this.tlsConfig,
    this.type,
    this.uri,
  });

  factory Integration.fromJson(Map<String, dynamic> json) {
    return Integration(
      cacheKeyParameters: (json['cacheKeyParameters'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      cacheNamespace: json['cacheNamespace'] as String?,
      connectionId: json['connectionId'] as String?,
      connectionType:
          (json['connectionType'] as String?)?.let(ConnectionType.fromString),
      contentHandling: (json['contentHandling'] as String?)
          ?.let(ContentHandlingStrategy.fromString),
      credentials: json['credentials'] as String?,
      httpMethod: json['httpMethod'] as String?,
      integrationResponses:
          (json['integrationResponses'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k, IntegrationResponse.fromJson(e as Map<String, dynamic>))),
      passthroughBehavior: json['passthroughBehavior'] as String?,
      requestParameters: (json['requestParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      requestTemplates: (json['requestTemplates'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      timeoutInMillis: json['timeoutInMillis'] as int?,
      tlsConfig: json['tlsConfig'] != null
          ? TlsConfig.fromJson(json['tlsConfig'] as Map<String, dynamic>)
          : null,
      type: (json['type'] as String?)?.let(IntegrationType.fromString),
      uri: json['uri'] as String?,
    );
  }
}

/// Represents an integration response. The status code must map to an existing
/// MethodResponse, and parameters and templates can be used to transform the
/// back-end response.
class IntegrationResponse {
  /// Specifies how to handle response payload content type conversions. Supported
  /// values are <code>CONVERT_TO_BINARY</code> and <code>CONVERT_TO_TEXT</code>,
  /// with the following behaviors:
  ///
  /// If this property is not defined, the response payload will be passed through
  /// from the integration response to the method response without modification.
  final ContentHandlingStrategy? contentHandling;

  /// A key-value map specifying response parameters that are passed to the method
  /// response from the back end. The key is a method response header parameter
  /// name and the mapped value is an integration response header value, a static
  /// value enclosed within a pair of single quotes, or a JSON expression from the
  /// integration response body. The mapping key must match the pattern of
  /// <code>method.response.header.{name}</code>, where <code>name</code> is a
  /// valid and unique header name. The mapped non-static value must match the
  /// pattern of <code>integration.response.header.{name}</code> or
  /// <code>integration.response.body.{JSON-expression}</code>, where
  /// <code>name</code> is a valid and unique response header name and
  /// <code>JSON-expression</code> is a valid JSON expression without the
  /// <code>$</code> prefix.
  final Map<String, String>? responseParameters;

  /// Specifies the templates used to transform the integration response body.
  /// Response templates are represented as a key/value map, with a content-type
  /// as the key and a template as the value.
  final Map<String, String>? responseTemplates;

  /// Specifies the regular expression (regex) pattern used to choose an
  /// integration response based on the response from the back end. For example,
  /// if the success response returns nothing and the error response returns some
  /// string, you could use the <code>.+</code> regex to match error response.
  /// However, make sure that the error response does not contain any newline
  /// (<code>\n</code>) character in such cases. If the back end is an Lambda
  /// function, the Lambda function error header is matched. For all other HTTP
  /// and Amazon Web Services back ends, the HTTP status code is matched.
  final String? selectionPattern;

  /// Specifies the status code that is used to map the integration response to an
  /// existing MethodResponse.
  final String? statusCode;

  IntegrationResponse({
    this.contentHandling,
    this.responseParameters,
    this.responseTemplates,
    this.selectionPattern,
    this.statusCode,
  });

  factory IntegrationResponse.fromJson(Map<String, dynamic> json) {
    return IntegrationResponse(
      contentHandling: (json['contentHandling'] as String?)
          ?.let(ContentHandlingStrategy.fromString),
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseTemplates: (json['responseTemplates'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      selectionPattern: json['selectionPattern'] as String?,
      statusCode: json['statusCode'] as String?,
    );
  }
}

/// The integration type. The valid value is <code>HTTP</code> for integrating
/// an API method with an HTTP backend; <code>AWS</code> with any Amazon Web
/// Services service endpoints; <code>MOCK</code> for testing without actually
/// invoking the backend; <code>HTTP_PROXY</code> for integrating with the HTTP
/// proxy integration; <code>AWS_PROXY</code> for integrating with the Lambda
/// proxy integration.
enum IntegrationType {
  http('HTTP'),
  aws('AWS'),
  mock('MOCK'),
  httpProxy('HTTP_PROXY'),
  awsProxy('AWS_PROXY'),
  ;

  final String value;

  const IntegrationType(this.value);

  static IntegrationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum IntegrationType'));
}

enum LocationStatusType {
  documented('DOCUMENTED'),
  undocumented('UNDOCUMENTED'),
  ;

  final String value;

  const LocationStatusType(this.value);

  static LocationStatusType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum LocationStatusType'));
}

/// Represents a client-facing interface by which the client calls the API to
/// access back-end resources. A Method resource is integrated with an
/// Integration resource. Both consist of a request and one or more responses.
/// The method request takes the client input that is passed to the back end
/// through the integration request. A method response returns the output from
/// the back end to the client through an integration response. A method request
/// is embodied in a Method resource, whereas an integration request is embodied
/// in an Integration resource. On the other hand, a method response is
/// represented by a MethodResponse resource, whereas an integration response is
/// represented by an IntegrationResponse resource.
class Method {
  /// A boolean flag specifying whether a valid ApiKey is required to invoke this
  /// method.
  final bool? apiKeyRequired;

  /// A list of authorization scopes configured on the method. The scopes are used
  /// with a <code>COGNITO_USER_POOLS</code> authorizer to authorize the method
  /// invocation. The authorization works by matching the method scopes against
  /// the scopes parsed from the access token in the incoming request. The method
  /// invocation is authorized if any method scopes matches a claimed scope in the
  /// access token. Otherwise, the invocation is not authorized. When the method
  /// scope is configured, the client must provide an access token instead of an
  /// identity token for authorization purposes.
  final List<String>? authorizationScopes;

  /// The method's authorization type. Valid values are <code>NONE</code> for open
  /// access, <code>AWS_IAM</code> for using AWS IAM permissions,
  /// <code>CUSTOM</code> for using a custom authorizer, or
  /// <code>COGNITO_USER_POOLS</code> for using a Cognito user pool.
  final String? authorizationType;

  /// The identifier of an Authorizer to use on this method. The
  /// <code>authorizationType</code> must be <code>CUSTOM</code>.
  final String? authorizerId;

  /// The method's HTTP verb.
  final String? httpMethod;

  /// Gets the method's integration responsible for passing the client-submitted
  /// request to the back end and performing necessary transformations to make the
  /// request compliant with the back end.
  final Integration? methodIntegration;

  /// Gets a method response associated with a given HTTP status code.
  final Map<String, MethodResponse>? methodResponses;

  /// A human-friendly operation identifier for the method. For example, you can
  /// assign the <code>operationName</code> of <code>ListPets</code> for the
  /// <code>GET /pets</code> method in the <code>PetStore</code> example.
  final String? operationName;

  /// A key-value map specifying data schemas, represented by Model resources, (as
  /// the mapped value) of the request payloads of given content types (as the
  /// mapping key).
  final Map<String, String>? requestModels;

  /// A key-value map defining required or optional method request parameters that
  /// can be accepted by API Gateway. A key is a method request parameter name
  /// matching the pattern of <code>method.request.{location}.{name}</code>, where
  /// <code>location</code> is <code>querystring</code>, <code>path</code>, or
  /// <code>header</code> and <code>name</code> is a valid and unique parameter
  /// name. The value associated with the key is a Boolean flag indicating whether
  /// the parameter is required (<code>true</code>) or optional
  /// (<code>false</code>). The method request parameter names defined here are
  /// available in Integration to be mapped to integration request parameters or
  /// templates.
  final Map<String, bool>? requestParameters;

  /// The identifier of a RequestValidator for request validation.
  final String? requestValidatorId;

  Method({
    this.apiKeyRequired,
    this.authorizationScopes,
    this.authorizationType,
    this.authorizerId,
    this.httpMethod,
    this.methodIntegration,
    this.methodResponses,
    this.operationName,
    this.requestModels,
    this.requestParameters,
    this.requestValidatorId,
  });

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(
      apiKeyRequired: json['apiKeyRequired'] as bool?,
      authorizationScopes: (json['authorizationScopes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      authorizationType: json['authorizationType'] as String?,
      authorizerId: json['authorizerId'] as String?,
      httpMethod: json['httpMethod'] as String?,
      methodIntegration: json['methodIntegration'] != null
          ? Integration.fromJson(
              json['methodIntegration'] as Map<String, dynamic>)
          : null,
      methodResponses: (json['methodResponses'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, MethodResponse.fromJson(e as Map<String, dynamic>))),
      operationName: json['operationName'] as String?,
      requestModels: (json['requestModels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      requestParameters: (json['requestParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as bool)),
      requestValidatorId: json['requestValidatorId'] as String?,
    );
  }
}

/// Represents a method response of a given HTTP status code returned to the
/// client. The method response is passed from the back end through the
/// associated integration response that can be transformed using a mapping
/// template.
class MethodResponse {
  /// Specifies the Model resources used for the response's content-type. Response
  /// models are represented as a key/value map, with a content-type as the key
  /// and a Model name as the value.
  final Map<String, String>? responseModels;

  /// A key-value map specifying required or optional response parameters that API
  /// Gateway can send back to the caller. A key defines a method response header
  /// and the value specifies whether the associated method response header is
  /// required or not. The expression of the key must match the pattern
  /// <code>method.response.header.{name}</code>, where <code>name</code> is a
  /// valid and unique header name. API Gateway passes certain integration
  /// response data to the method response headers specified here according to the
  /// mapping you prescribe in the API's IntegrationResponse. The integration
  /// response data that can be mapped include an integration response header
  /// expressed in <code>integration.response.header.{name}</code>, a static value
  /// enclosed within a pair of single quotes (e.g.,
  /// <code>'application/json'</code>), or a JSON expression from the back-end
  /// response payload in the form of
  /// <code>integration.response.body.{JSON-expression}</code>, where
  /// <code>JSON-expression</code> is a valid JSON expression without the
  /// <code>$</code> prefix.)
  final Map<String, bool>? responseParameters;

  /// The method response's status code.
  final String? statusCode;

  MethodResponse({
    this.responseModels,
    this.responseParameters,
    this.statusCode,
  });

  factory MethodResponse.fromJson(Map<String, dynamic> json) {
    return MethodResponse(
      responseModels: (json['responseModels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as bool)),
      statusCode: json['statusCode'] as String?,
    );
  }
}

/// Specifies the method setting properties.
class MethodSetting {
  /// Specifies whether the cached responses are encrypted.
  final bool? cacheDataEncrypted;

  /// Specifies the time to live (TTL), in seconds, for cached responses. The
  /// higher the TTL, the longer the response will be cached.
  final int? cacheTtlInSeconds;

  /// Specifies whether responses should be cached and returned for requests. A
  /// cache cluster must be enabled on the stage for responses to be cached.
  final bool? cachingEnabled;

  /// Specifies whether data trace logging is enabled for this method, which
  /// affects the log entries pushed to Amazon CloudWatch Logs. This can be useful
  /// to troubleshoot APIs, but can result in logging sensitive data. We recommend
  /// that you don't enable this option for production APIs.
  final bool? dataTraceEnabled;

  /// Specifies the logging level for this method, which affects the log entries
  /// pushed to Amazon CloudWatch Logs. Valid values are <code>OFF</code>,
  /// <code>ERROR</code>, and <code>INFO</code>. Choose <code>ERROR</code> to
  /// write only error-level entries to CloudWatch Logs, or choose
  /// <code>INFO</code> to include all <code>ERROR</code> events as well as extra
  /// informational events.
  final String? loggingLevel;

  /// Specifies whether Amazon CloudWatch metrics are enabled for this method.
  final bool? metricsEnabled;

  /// Specifies whether authorization is required for a cache invalidation
  /// request.
  final bool? requireAuthorizationForCacheControl;

  /// Specifies the throttling burst limit.
  final int? throttlingBurstLimit;

  /// Specifies the throttling rate limit.
  final double? throttlingRateLimit;

  /// Specifies how to handle unauthorized requests for cache invalidation.
  final UnauthorizedCacheControlHeaderStrategy?
      unauthorizedCacheControlHeaderStrategy;

  MethodSetting({
    this.cacheDataEncrypted,
    this.cacheTtlInSeconds,
    this.cachingEnabled,
    this.dataTraceEnabled,
    this.loggingLevel,
    this.metricsEnabled,
    this.requireAuthorizationForCacheControl,
    this.throttlingBurstLimit,
    this.throttlingRateLimit,
    this.unauthorizedCacheControlHeaderStrategy,
  });

  factory MethodSetting.fromJson(Map<String, dynamic> json) {
    return MethodSetting(
      cacheDataEncrypted: json['cacheDataEncrypted'] as bool?,
      cacheTtlInSeconds: json['cacheTtlInSeconds'] as int?,
      cachingEnabled: json['cachingEnabled'] as bool?,
      dataTraceEnabled: json['dataTraceEnabled'] as bool?,
      loggingLevel: json['loggingLevel'] as String?,
      metricsEnabled: json['metricsEnabled'] as bool?,
      requireAuthorizationForCacheControl:
          json['requireAuthorizationForCacheControl'] as bool?,
      throttlingBurstLimit: json['throttlingBurstLimit'] as int?,
      throttlingRateLimit: json['throttlingRateLimit'] as double?,
      unauthorizedCacheControlHeaderStrategy:
          (json['unauthorizedCacheControlHeaderStrategy'] as String?)
              ?.let(UnauthorizedCacheControlHeaderStrategy.fromString),
    );
  }
}

/// Represents a summary of a Method resource, given a particular date and time.
class MethodSnapshot {
  /// Specifies whether the method requires a valid ApiKey.
  final bool? apiKeyRequired;

  /// The method's authorization type. Valid values are <code>NONE</code> for open
  /// access, <code>AWS_IAM</code> for using AWS IAM permissions,
  /// <code>CUSTOM</code> for using a custom authorizer, or
  /// <code>COGNITO_USER_POOLS</code> for using a Cognito user pool.
  final String? authorizationType;

  MethodSnapshot({
    this.apiKeyRequired,
    this.authorizationType,
  });

  factory MethodSnapshot.fromJson(Map<String, dynamic> json) {
    return MethodSnapshot(
      apiKeyRequired: json['apiKeyRequired'] as bool?,
      authorizationType: json['authorizationType'] as String?,
    );
  }
}

/// Represents the data structure of a method's request or response payload.
class Model {
  /// The content-type for the model.
  final String? contentType;

  /// The description of the model.
  final String? description;

  /// The identifier for the model resource.
  final String? id;

  /// The name of the model. Must be an alphanumeric string.
  final String? name;

  /// The schema for the model. For <code>application/json</code> models, this
  /// should be JSON schema draft 4 model. Do not include "\*/" characters in the
  /// description of any properties because such "\*/" characters may be
  /// interpreted as the closing marker for comments in some languages, such as
  /// Java or JavaScript, causing the installation of your API's SDK generated by
  /// API Gateway to fail.
  final String? schema;

  Model({
    this.contentType,
    this.description,
    this.id,
    this.name,
    this.schema,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      contentType: json['contentType'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      schema: json['schema'] as String?,
    );
  }
}

/// Represents a collection of Model resources.
class Models {
  /// The current page of elements from this collection.
  final List<Model>? items;
  final String? position;

  Models({
    this.items,
    this.position,
  });

  factory Models.fromJson(Map<String, dynamic> json) {
    return Models(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// The mutual TLS authentication configuration for a custom domain name. If
/// specified, API Gateway performs two-way authentication between the client
/// and the server. Clients must present a trusted certificate to access your
/// API.
class MutualTlsAuthentication {
  /// An Amazon S3 URL that specifies the truststore for mutual TLS
  /// authentication, for example <code>s3://bucket-name/key-name</code>. The
  /// truststore can contain certificates from public or private certificate
  /// authorities. To update the truststore, upload a new version to S3, and then
  /// update your custom domain name to use the new version. To update the
  /// truststore, you must have permissions to access the S3 object.
  final String? truststoreUri;

  /// The version of the S3 object that contains your truststore. To specify a
  /// version, you must have versioning enabled for the S3 bucket.
  final String? truststoreVersion;

  /// A list of warnings that API Gateway returns while processing your
  /// truststore. Invalid certificates produce warnings. Mutual TLS is still
  /// enabled, but some clients might not be able to access your API. To resolve
  /// warnings, upload a new truststore to S3, and then update you domain name to
  /// use the new version.
  final List<String>? truststoreWarnings;

  MutualTlsAuthentication({
    this.truststoreUri,
    this.truststoreVersion,
    this.truststoreWarnings,
  });

  factory MutualTlsAuthentication.fromJson(Map<String, dynamic> json) {
    return MutualTlsAuthentication(
      truststoreUri: json['truststoreUri'] as String?,
      truststoreVersion: json['truststoreVersion'] as String?,
      truststoreWarnings: (json['truststoreWarnings'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// The mutual TLS authentication configuration for a custom domain name. If
/// specified, API Gateway performs two-way authentication between the client
/// and the server. Clients must present a trusted certificate to access your
/// API.
class MutualTlsAuthenticationInput {
  /// An Amazon S3 URL that specifies the truststore for mutual TLS
  /// authentication, for example <code>s3://bucket-name/key-name</code>. The
  /// truststore can contain certificates from public or private certificate
  /// authorities. To update the truststore, upload a new version to S3, and then
  /// update your custom domain name to use the new version. To update the
  /// truststore, you must have permissions to access the S3 object.
  final String? truststoreUri;

  /// The version of the S3 object that contains your truststore. To specify a
  /// version, you must have versioning enabled for the S3 bucket
  final String? truststoreVersion;

  MutualTlsAuthenticationInput({
    this.truststoreUri,
    this.truststoreVersion,
  });

  Map<String, dynamic> toJson() {
    final truststoreUri = this.truststoreUri;
    final truststoreVersion = this.truststoreVersion;
    return {
      if (truststoreUri != null) 'truststoreUri': truststoreUri,
      if (truststoreVersion != null) 'truststoreVersion': truststoreVersion,
    };
  }
}

enum Op {
  add('add'),
  remove('remove'),
  replace('replace'),
  move('move'),
  copy('copy'),
  test('test'),
  ;

  final String value;

  const Op(this.value);

  static Op fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Op'));
}

/// For more information about supported patch operations, see <a
/// href="https://docs.aws.amazon.com/apigateway/latest/api/patch-operations.html">Patch
/// Operations</a>.
class PatchOperation {
  /// The copy update operation's source as identified by a JSON-Pointer value
  /// referencing the location within the targeted resource to copy the value
  /// from. For example, to promote a canary deployment, you copy the canary
  /// deployment ID to the affiliated deployment ID by calling a PATCH request on
  /// a Stage resource with "op":"copy", "from":"/canarySettings/deploymentId" and
  /// "path":"/deploymentId".
  final String? from;

  /// An update operation to be performed with this PATCH request. The valid value
  /// can be add, remove, replace or copy. Not all valid operations are supported
  /// for a given resource. Support of the operations depends on specific
  /// operational contexts. Attempts to apply an unsupported operation on a
  /// resource will return an error message..
  final Op? op;

  /// The op operation's target, as identified by a JSON Pointer value that
  /// references a location within the targeted resource. For example, if the
  /// target resource has an updateable property of {"name":"value"}, the path for
  /// this property is /name. If the name property value is a JSON object (e.g.,
  /// {"name": {"child/name": "child-value"}}), the path for the child/name
  /// property will be /name/child~1name. Any slash ("/") character appearing in
  /// path names must be escaped with "~1", as shown in the example above. Each op
  /// operation can have only one path associated with it.
  final String? path;

  /// The new target value of the update operation. It is applicable for the add
  /// or replace operation. When using AWS CLI to update a property of a JSON
  /// value, enclose the JSON object with a pair of single quotes in a Linux
  /// shell, e.g., '{"a": ...}'.
  final String? value;

  PatchOperation({
    this.from,
    this.op,
    this.path,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final from = this.from;
    final op = this.op;
    final path = this.path;
    final value = this.value;
    return {
      if (from != null) 'from': from,
      if (op != null) 'op': op.value,
      if (path != null) 'path': path,
      if (value != null) 'value': value,
    };
  }
}

enum PutMode {
  merge('merge'),
  overwrite('overwrite'),
  ;

  final String value;

  const PutMode(this.value);

  static PutMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum PutMode'));
}

enum QuotaPeriodType {
  day('DAY'),
  week('WEEK'),
  month('MONTH'),
  ;

  final String value;

  const QuotaPeriodType(this.value);

  static QuotaPeriodType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum QuotaPeriodType'));
}

/// Quotas configured for a usage plan.
class QuotaSettings {
  /// The target maximum number of requests that can be made in a given time
  /// period.
  final int? limit;

  /// The number of requests subtracted from the given limit in the initial time
  /// period.
  final int? offset;

  /// The time period in which the limit applies. Valid values are "DAY", "WEEK"
  /// or "MONTH".
  final QuotaPeriodType? period;

  QuotaSettings({
    this.limit,
    this.offset,
    this.period,
  });

  factory QuotaSettings.fromJson(Map<String, dynamic> json) {
    return QuotaSettings(
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      period: (json['period'] as String?)?.let(QuotaPeriodType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final limit = this.limit;
    final offset = this.offset;
    final period = this.period;
    return {
      if (limit != null) 'limit': limit,
      if (offset != null) 'offset': offset,
      if (period != null) 'period': period.value,
    };
  }
}

/// A set of validation rules for incoming Method requests.
class RequestValidator {
  /// The identifier of this RequestValidator.
  final String? id;

  /// The name of this RequestValidator
  final String? name;

  /// A Boolean flag to indicate whether to validate a request body according to
  /// the configured Model schema.
  final bool? validateRequestBody;

  /// A Boolean flag to indicate whether to validate request parameters
  /// (<code>true</code>) or not (<code>false</code>).
  final bool? validateRequestParameters;

  RequestValidator({
    this.id,
    this.name,
    this.validateRequestBody,
    this.validateRequestParameters,
  });

  factory RequestValidator.fromJson(Map<String, dynamic> json) {
    return RequestValidator(
      id: json['id'] as String?,
      name: json['name'] as String?,
      validateRequestBody: json['validateRequestBody'] as bool?,
      validateRequestParameters: json['validateRequestParameters'] as bool?,
    );
  }
}

/// A collection of RequestValidator resources of a given RestApi.
class RequestValidators {
  /// The current page of elements from this collection.
  final List<RequestValidator>? items;
  final String? position;

  RequestValidators({
    this.items,
    this.position,
  });

  factory RequestValidators.fromJson(Map<String, dynamic> json) {
    return RequestValidators(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => RequestValidator.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// Represents an API resource.
class Resource {
  /// The resource's identifier.
  final String? id;

  /// The parent resource's identifier.
  final String? parentId;

  /// The full path for this resource.
  final String? path;

  /// The last path segment for this resource.
  final String? pathPart;

  /// Gets an API resource's method of a given HTTP verb.
  final Map<String, Method>? resourceMethods;

  Resource({
    this.id,
    this.parentId,
    this.path,
    this.pathPart,
    this.resourceMethods,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      id: json['id'] as String?,
      parentId: json['parentId'] as String?,
      path: json['path'] as String?,
      pathPart: json['pathPart'] as String?,
      resourceMethods: (json['resourceMethods'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Method.fromJson(e as Map<String, dynamic>))),
    );
  }
}

/// Represents a collection of Resource resources.
class Resources {
  /// The current page of elements from this collection.
  final List<Resource>? items;
  final String? position;

  Resources({
    this.items,
    this.position,
  });

  factory Resources.fromJson(Map<String, dynamic> json) {
    return Resources(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// Represents a REST API.
class RestApi {
  /// The source of the API key for metering requests according to a usage plan.
  /// Valid values are: &gt;<code>HEADER</code> to read the API key from the
  /// <code>X-API-Key</code> header of a request. <code>AUTHORIZER</code> to read
  /// the API key from the <code>UsageIdentifierKey</code> from a custom
  /// authorizer.
  final ApiKeySourceType? apiKeySource;

  /// The list of binary media types supported by the RestApi. By default, the
  /// RestApi supports only UTF-8-encoded text payloads.
  final List<String>? binaryMediaTypes;

  /// The timestamp when the API was created.
  final DateTime? createdDate;

  /// The API's description.
  final String? description;

  /// Specifies whether clients can invoke your API by using the default
  /// <code>execute-api</code> endpoint. By default, clients can invoke your API
  /// with the default
  /// <code>https://{api_id}.execute-api.{region}.amazonaws.com</code> endpoint.
  /// To require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  final bool? disableExecuteApiEndpoint;

  /// The endpoint configuration of this RestApi showing the endpoint types of the
  /// API.
  final EndpointConfiguration? endpointConfiguration;

  /// The API's identifier. This identifier is unique across all of your APIs in
  /// API Gateway.
  final String? id;

  /// A nullable integer that is used to enable compression (with non-negative
  /// between 0 and 10485760 (10M) bytes, inclusive) or disable compression (with
  /// a null value) on an API. When compression is enabled, compression or
  /// decompression is not applied on the payload if the payload size is smaller
  /// than this value. Setting it to zero allows compression for any payload size.
  final int? minimumCompressionSize;

  /// The API's name.
  final String? name;

  /// A stringified JSON policy document that applies to this RestApi regardless
  /// of the caller and Method configuration.
  final String? policy;

  /// The API's root resource ID.
  final String? rootResourceId;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  /// A version identifier for the API.
  final String? version;

  /// The warning messages reported when <code>failonwarnings</code> is turned on
  /// during API import.
  final List<String>? warnings;

  RestApi({
    this.apiKeySource,
    this.binaryMediaTypes,
    this.createdDate,
    this.description,
    this.disableExecuteApiEndpoint,
    this.endpointConfiguration,
    this.id,
    this.minimumCompressionSize,
    this.name,
    this.policy,
    this.rootResourceId,
    this.tags,
    this.version,
    this.warnings,
  });

  factory RestApi.fromJson(Map<String, dynamic> json) {
    return RestApi(
      apiKeySource:
          (json['apiKeySource'] as String?)?.let(ApiKeySourceType.fromString),
      binaryMediaTypes: (json['binaryMediaTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool?,
      endpointConfiguration: json['endpointConfiguration'] != null
          ? EndpointConfiguration.fromJson(
              json['endpointConfiguration'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      minimumCompressionSize: json['minimumCompressionSize'] as int?,
      name: json['name'] as String?,
      policy: json['policy'] as String?,
      rootResourceId: json['rootResourceId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// Contains references to your APIs and links that guide you in how to interact
/// with your collection. A collection offers a paginated view of your APIs.
class RestApis {
  /// The current page of elements from this collection.
  final List<RestApi>? items;
  final String? position;

  RestApis({
    this.items,
    this.position,
  });

  factory RestApis.fromJson(Map<String, dynamic> json) {
    return RestApis(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => RestApi.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// A configuration property of an SDK type.
class SdkConfigurationProperty {
  /// The default value of an SdkType configuration property.
  final String? defaultValue;

  /// The description of an SdkType configuration property.
  final String? description;

  /// The user-friendly name of an SdkType configuration property.
  final String? friendlyName;

  /// The name of a an SdkType configuration property.
  final String? name;

  /// A boolean flag of an SdkType configuration property to indicate if the
  /// associated SDK configuration property is required (<code>true</code>) or not
  /// (<code>false</code>).
  final bool? required;

  SdkConfigurationProperty({
    this.defaultValue,
    this.description,
    this.friendlyName,
    this.name,
    this.required,
  });

  factory SdkConfigurationProperty.fromJson(Map<String, dynamic> json) {
    return SdkConfigurationProperty(
      defaultValue: json['defaultValue'] as String?,
      description: json['description'] as String?,
      friendlyName: json['friendlyName'] as String?,
      name: json['name'] as String?,
      required: json['required'] as bool?,
    );
  }
}

/// The binary blob response to GetSdk, which contains the generated SDK.
class SdkResponse {
  /// The binary blob response to GetSdk, which contains the generated SDK.
  final Uint8List? body;

  /// The content-disposition header value in the HTTP response.
  final String? contentDisposition;

  /// The content-type header value in the HTTP response.
  final String? contentType;

  SdkResponse({
    this.body,
    this.contentDisposition,
    this.contentType,
  });
}

/// A type of SDK that API Gateway can generate.
class SdkType {
  /// A list of configuration properties of an SdkType.
  final List<SdkConfigurationProperty>? configurationProperties;

  /// The description of an SdkType.
  final String? description;

  /// The user-friendly name of an SdkType instance.
  final String? friendlyName;

  /// The identifier of an SdkType instance.
  final String? id;

  SdkType({
    this.configurationProperties,
    this.description,
    this.friendlyName,
    this.id,
  });

  factory SdkType.fromJson(Map<String, dynamic> json) {
    return SdkType(
      configurationProperties: (json['configurationProperties'] as List?)
          ?.nonNulls
          .map((e) =>
              SdkConfigurationProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      friendlyName: json['friendlyName'] as String?,
      id: json['id'] as String?,
    );
  }
}

/// The collection of SdkType instances.
class SdkTypes {
  /// The current page of elements from this collection.
  final List<SdkType>? items;
  final String? position;

  SdkTypes({
    this.items,
    this.position,
  });

  factory SdkTypes.fromJson(Map<String, dynamic> json) {
    return SdkTypes(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => SdkType.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

enum SecurityPolicy {
  tls_1_0('TLS_1_0'),
  tls_1_2('TLS_1_2'),
  ;

  final String value;

  const SecurityPolicy(this.value);

  static SecurityPolicy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SecurityPolicy'));
}

/// Represents a unique identifier for a version of a deployed RestApi that is
/// callable by users.
class Stage {
  /// Settings for logging access in this stage.
  final AccessLogSettings? accessLogSettings;

  /// Specifies whether a cache cluster is enabled for the stage. To activate a
  /// method-level cache, set <code>CachingEnabled</code> to <code>true</code> for
  /// a method.
  final bool? cacheClusterEnabled;

  /// The stage's cache capacity in GB. For more information about choosing a
  /// cache size, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-caching.html">Enabling
  /// API caching to enhance responsiveness</a>.
  final CacheClusterSize? cacheClusterSize;

  /// The status of the cache cluster for the stage, if enabled.
  final CacheClusterStatus? cacheClusterStatus;

  /// Settings for the canary deployment in this stage.
  final CanarySettings? canarySettings;

  /// The identifier of a client certificate for an API stage.
  final String? clientCertificateId;

  /// The timestamp when the stage was created.
  final DateTime? createdDate;

  /// The identifier of the Deployment that the stage points to.
  final String? deploymentId;

  /// The stage's description.
  final String? description;

  /// The version of the associated API documentation.
  final String? documentationVersion;

  /// The timestamp when the stage last updated.
  final DateTime? lastUpdatedDate;

  /// A map that defines the method settings for a Stage resource. Keys
  /// (designated as <code>/{method_setting_key</code> below) are method paths
  /// defined as <code>{resource_path}/{http_method}</code> for an individual
  /// method override, or <code>/\*/\*</code> for overriding all methods in the
  /// stage.
  final Map<String, MethodSetting>? methodSettings;

  /// The name of the stage is the first path segment in the Uniform Resource
  /// Identifier (URI) of a call to API Gateway. Stage names can only contain
  /// alphanumeric characters, hyphens, and underscores. Maximum length is 128
  /// characters.
  final String? stageName;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  /// Specifies whether active tracing with X-ray is enabled for the Stage.
  final bool? tracingEnabled;

  /// A map that defines the stage variables for a Stage resource. Variable names
  /// can have alphanumeric and underscore characters, and the values must match
  /// <code>[A-Za-z0-9-._~:/?#&amp;=,]+</code>.
  final Map<String, String>? variables;

  /// The ARN of the WebAcl associated with the Stage.
  final String? webAclArn;

  Stage({
    this.accessLogSettings,
    this.cacheClusterEnabled,
    this.cacheClusterSize,
    this.cacheClusterStatus,
    this.canarySettings,
    this.clientCertificateId,
    this.createdDate,
    this.deploymentId,
    this.description,
    this.documentationVersion,
    this.lastUpdatedDate,
    this.methodSettings,
    this.stageName,
    this.tags,
    this.tracingEnabled,
    this.variables,
    this.webAclArn,
  });

  factory Stage.fromJson(Map<String, dynamic> json) {
    return Stage(
      accessLogSettings: json['accessLogSettings'] != null
          ? AccessLogSettings.fromJson(
              json['accessLogSettings'] as Map<String, dynamic>)
          : null,
      cacheClusterEnabled: json['cacheClusterEnabled'] as bool?,
      cacheClusterSize: (json['cacheClusterSize'] as String?)
          ?.let(CacheClusterSize.fromString),
      cacheClusterStatus: (json['cacheClusterStatus'] as String?)
          ?.let(CacheClusterStatus.fromString),
      canarySettings: json['canarySettings'] != null
          ? CanarySettings.fromJson(
              json['canarySettings'] as Map<String, dynamic>)
          : null,
      clientCertificateId: json['clientCertificateId'] as String?,
      createdDate: timeStampFromJson(json['createdDate']),
      deploymentId: json['deploymentId'] as String?,
      description: json['description'] as String?,
      documentationVersion: json['documentationVersion'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      methodSettings: (json['methodSettings'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, MethodSetting.fromJson(e as Map<String, dynamic>))),
      stageName: json['stageName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tracingEnabled: json['tracingEnabled'] as bool?,
      variables: (json['variables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      webAclArn: json['webAclArn'] as String?,
    );
  }
}

/// A reference to a unique stage identified in the format
/// <code>{restApiId}/{stage}</code>.
class StageKey {
  /// The string identifier of the associated RestApi.
  final String? restApiId;

  /// The stage name associated with the stage key.
  final String? stageName;

  StageKey({
    this.restApiId,
    this.stageName,
  });

  Map<String, dynamic> toJson() {
    final restApiId = this.restApiId;
    final stageName = this.stageName;
    return {
      if (restApiId != null) 'restApiId': restApiId,
      if (stageName != null) 'stageName': stageName,
    };
  }
}

/// A list of Stage resources that are associated with the ApiKey resource.
class Stages {
  /// The current page of elements from this collection.
  final List<Stage>? item;

  Stages({
    this.item,
  });

  factory Stages.fromJson(Map<String, dynamic> json) {
    return Stages(
      item: (json['item'] as List?)
          ?.nonNulls
          .map((e) => Stage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The collection of tags. Each tag element is associated with a given
/// resource.
class Tags {
  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  Tags({
    this.tags,
  });

  factory Tags.fromJson(Map<String, dynamic> json) {
    return Tags(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

/// Represents a mapping template used to transform a payload.
class Template {
  /// The Apache Velocity Template Language (VTL) template content used for the
  /// template resource.
  final String? value;

  Template({
    this.value,
  });

  factory Template.fromJson(Map<String, dynamic> json) {
    return Template(
      value: json['value'] as String?,
    );
  }
}

/// Represents the response of the test invoke request for a custom Authorizer
class TestInvokeAuthorizerResponse {
  /// The authorization response.
  final Map<String, List<String>>? authorization;

  /// The open identity claims, with any supported custom attributes, returned
  /// from the Cognito Your User Pool configured for the API.
  final Map<String, String>? claims;

  /// The HTTP status code that the client would have received. Value is 0 if the
  /// authorizer succeeded.
  final int? clientStatus;

  /// The execution latency, in ms, of the test authorizer request.
  final int? latency;

  /// The API Gateway execution log for the test authorizer request.
  final String? log;

  /// The JSON policy document returned by the Authorizer
  final String? policy;

  /// The principal identity returned by the Authorizer
  final String? principalId;

  TestInvokeAuthorizerResponse({
    this.authorization,
    this.claims,
    this.clientStatus,
    this.latency,
    this.log,
    this.policy,
    this.principalId,
  });

  factory TestInvokeAuthorizerResponse.fromJson(Map<String, dynamic> json) {
    return TestInvokeAuthorizerResponse(
      authorization: (json['authorization'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, (e as List).nonNulls.map((e) => e as String).toList())),
      claims: (json['claims'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      clientStatus: json['clientStatus'] as int?,
      latency: json['latency'] as int?,
      log: json['log'] as String?,
      policy: json['policy'] as String?,
      principalId: json['principalId'] as String?,
    );
  }
}

/// Represents the response of the test invoke request in the HTTP method.
class TestInvokeMethodResponse {
  /// The body of the HTTP response.
  final String? body;

  /// The headers of the HTTP response.
  final Map<String, String>? headers;

  /// The execution latency, in ms, of the test invoke request.
  final int? latency;

  /// The API Gateway execution log for the test invoke request.
  final String? log;

  /// The headers of the HTTP response as a map from string to list of values.
  final Map<String, List<String>>? multiValueHeaders;

  /// The HTTP status code.
  final int? status;

  TestInvokeMethodResponse({
    this.body,
    this.headers,
    this.latency,
    this.log,
    this.multiValueHeaders,
    this.status,
  });

  factory TestInvokeMethodResponse.fromJson(Map<String, dynamic> json) {
    return TestInvokeMethodResponse(
      body: json['body'] as String?,
      headers: (json['headers'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      latency: json['latency'] as int?,
      log: json['log'] as String?,
      multiValueHeaders: (json['multiValueHeaders'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, (e as List).nonNulls.map((e) => e as String).toList())),
      status: json['status'] as int?,
    );
  }
}

/// The API request rate limits.
class ThrottleSettings {
  /// The API target request burst rate limit. This allows more requests through
  /// for a period of time than the target rate limit.
  final int? burstLimit;

  /// The API target request rate limit.
  final double? rateLimit;

  ThrottleSettings({
    this.burstLimit,
    this.rateLimit,
  });

  factory ThrottleSettings.fromJson(Map<String, dynamic> json) {
    return ThrottleSettings(
      burstLimit: json['burstLimit'] as int?,
      rateLimit: json['rateLimit'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final burstLimit = this.burstLimit;
    final rateLimit = this.rateLimit;
    return {
      if (burstLimit != null) 'burstLimit': burstLimit,
      if (rateLimit != null) 'rateLimit': rateLimit,
    };
  }
}

/// Specifies the TLS configuration for an integration.
class TlsConfig {
  /// Specifies whether or not API Gateway skips verification that the certificate
  /// for an integration endpoint is issued by a supported certificate authority.
  /// This isn’t recommended, but it enables you to use certificates that are
  /// signed by private certificate authorities, or certificates that are
  /// self-signed. If enabled, API Gateway still performs basic certificate
  /// validation, which includes checking the certificate's expiration date,
  /// hostname, and presence of a root certificate authority. Supported only for
  /// <code>HTTP</code> and <code>HTTP_PROXY</code> integrations.
  /// <important>
  /// Enabling <code>insecureSkipVerification</code> isn't recommended, especially
  /// for integrations with public HTTPS endpoints. If you enable
  /// <code>insecureSkipVerification</code>, you increase the risk of
  /// man-in-the-middle attacks.
  /// </important>
  final bool? insecureSkipVerification;

  TlsConfig({
    this.insecureSkipVerification,
  });

  factory TlsConfig.fromJson(Map<String, dynamic> json) {
    return TlsConfig(
      insecureSkipVerification: json['insecureSkipVerification'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final insecureSkipVerification = this.insecureSkipVerification;
    return {
      if (insecureSkipVerification != null)
        'insecureSkipVerification': insecureSkipVerification,
    };
  }
}

enum UnauthorizedCacheControlHeaderStrategy {
  failWith_403('FAIL_WITH_403'),
  succeedWithResponseHeader('SUCCEED_WITH_RESPONSE_HEADER'),
  succeedWithoutResponseHeader('SUCCEED_WITHOUT_RESPONSE_HEADER'),
  ;

  final String value;

  const UnauthorizedCacheControlHeaderStrategy(this.value);

  static UnauthorizedCacheControlHeaderStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum UnauthorizedCacheControlHeaderStrategy'));
}

/// Represents the usage data of a usage plan.
class Usage {
  /// The ending date of the usage data.
  final String? endDate;

  /// The usage data, as daily logs of used and remaining quotas, over the
  /// specified time interval indexed over the API keys in a usage plan. For
  /// example, <code>{..., "values" : { "{api_key}" : [ [0, 100], [10, 90], [100,
  /// 10]]}</code>, where <code>{api_key}</code> stands for an API key value and
  /// the daily log entry is of the format <code>[used quota, remaining
  /// quota]</code>.
  final Map<String, List<List<int>>>? items;
  final String? position;

  /// The starting date of the usage data.
  final String? startDate;

  /// The plan Id associated with this usage data.
  final String? usagePlanId;

  Usage({
    this.endDate,
    this.items,
    this.position,
    this.startDate,
    this.usagePlanId,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      endDate: json['endDate'] as String?,
      items: (json['values'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k,
          (e as List)
              .nonNulls
              .map((e) => (e as List).nonNulls.map((e) => e as int).toList())
              .toList())),
      position: json['position'] as String?,
      startDate: json['startDate'] as String?,
      usagePlanId: json['usagePlanId'] as String?,
    );
  }
}

/// Represents a usage plan used to specify who can assess associated API
/// stages. Optionally, target request rate and quota limits can be set. In some
/// cases clients can exceed the targets that you set. Don’t rely on usage plans
/// to control costs. Consider using <a
/// href="https://docs.aws.amazon.com/cost-management/latest/userguide/budgets-managing-costs.html">Amazon
/// Web Services Budgets</a> to monitor costs and <a
/// href="https://docs.aws.amazon.com/waf/latest/developerguide/waf-chapter.html">WAF</a>
/// to manage API requests.
class UsagePlan {
  /// The associated API stages of a usage plan.
  final List<ApiStage>? apiStages;

  /// The description of a usage plan.
  final String? description;

  /// The identifier of a UsagePlan resource.
  final String? id;

  /// The name of a usage plan.
  final String? name;

  /// The Amazon Web Services Marketplace product identifier to associate with the
  /// usage plan as a SaaS product on the Amazon Web Services Marketplace.
  final String? productCode;

  /// The target maximum number of permitted requests per a given unit time
  /// interval.
  final QuotaSettings? quota;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  /// A map containing method level throttling information for API stage in a
  /// usage plan.
  final ThrottleSettings? throttle;

  UsagePlan({
    this.apiStages,
    this.description,
    this.id,
    this.name,
    this.productCode,
    this.quota,
    this.tags,
    this.throttle,
  });

  factory UsagePlan.fromJson(Map<String, dynamic> json) {
    return UsagePlan(
      apiStages: (json['apiStages'] as List?)
          ?.nonNulls
          .map((e) => ApiStage.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      productCode: json['productCode'] as String?,
      quota: json['quota'] != null
          ? QuotaSettings.fromJson(json['quota'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      throttle: json['throttle'] != null
          ? ThrottleSettings.fromJson(json['throttle'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Represents a usage plan key to identify a plan customer.
class UsagePlanKey {
  /// The Id of a usage plan key.
  final String? id;

  /// The name of a usage plan key.
  final String? name;

  /// The type of a usage plan key. Currently, the valid key type is
  /// <code>API_KEY</code>.
  final String? type;

  /// The value of a usage plan key.
  final String? value;

  UsagePlanKey({
    this.id,
    this.name,
    this.type,
    this.value,
  });

  factory UsagePlanKey.fromJson(Map<String, dynamic> json) {
    return UsagePlanKey(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      value: json['value'] as String?,
    );
  }
}

/// Represents the collection of usage plan keys added to usage plans for the
/// associated API keys and, possibly, other types of keys.
class UsagePlanKeys {
  /// The current page of elements from this collection.
  final List<UsagePlanKey>? items;
  final String? position;

  UsagePlanKeys({
    this.items,
    this.position,
  });

  factory UsagePlanKeys.fromJson(Map<String, dynamic> json) {
    return UsagePlanKeys(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => UsagePlanKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// Represents a collection of usage plans for an AWS account.
class UsagePlans {
  /// The current page of elements from this collection.
  final List<UsagePlan>? items;
  final String? position;

  UsagePlans({
    this.items,
    this.position,
  });

  factory UsagePlans.fromJson(Map<String, dynamic> json) {
    return UsagePlans(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => UsagePlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

/// An API Gateway VPC link for a RestApi to access resources in an Amazon
/// Virtual Private Cloud (VPC).
class VpcLink {
  /// The description of the VPC link.
  final String? description;

  /// The identifier of the VpcLink. It is used in an Integration to reference
  /// this VpcLink.
  final String? id;

  /// The name used to label and identify the VPC link.
  final String? name;

  /// The status of the VPC link. The valid values are <code>AVAILABLE</code>,
  /// <code>PENDING</code>, <code>DELETING</code>, or <code>FAILED</code>.
  /// Deploying an API will wait if the status is <code>PENDING</code> and will
  /// fail if the status is <code>DELETING</code>.
  final VpcLinkStatus? status;

  /// A description about the VPC link status.
  final String? statusMessage;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  /// The ARN of the network load balancer of the VPC targeted by the VPC link.
  /// The network load balancer must be owned by the same Amazon Web Services
  /// account of the API owner.
  final List<String>? targetArns;

  VpcLink({
    this.description,
    this.id,
    this.name,
    this.status,
    this.statusMessage,
    this.tags,
    this.targetArns,
  });

  factory VpcLink.fromJson(Map<String, dynamic> json) {
    return VpcLink(
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: (json['status'] as String?)?.let(VpcLinkStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetArns: (json['targetArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }
}

enum VpcLinkStatus {
  available('AVAILABLE'),
  pending('PENDING'),
  deleting('DELETING'),
  failed('FAILED'),
  ;

  final String value;

  const VpcLinkStatus(this.value);

  static VpcLinkStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum VpcLinkStatus'));
}

/// The collection of VPC links under the caller's account in a region.
class VpcLinks {
  /// The current page of elements from this collection.
  final List<VpcLink>? items;
  final String? position;

  VpcLinks({
    this.items,
    this.position,
  });

  factory VpcLinks.fromJson(Map<String, dynamic> json) {
    return VpcLinks(
      items: (json['item'] as List?)
          ?.nonNulls
          .map((e) => VpcLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      position: json['position'] as String?,
    );
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
};
