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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2015-07-09.g.dart';

/// Amazon API Gateway helps developers deliver robust, secure, and scalable
/// mobile and web application back ends. API Gateway allows developers to
/// securely connect mobile and web applications to APIs that run on AWS Lambda,
/// Amazon EC2, or other publicly addressable web services that are hosted
/// outside of AWS.
class ApiGateway {
  final _s.RestJsonProtocol _protocol;
  ApiGateway({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'apigateway',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Create an <a>ApiKey</a> resource.
  /// <div class="seeAlso"><a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/create-api-key.html">AWS
  /// CLI</a></div>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [customerId] :
  /// An AWS Marketplace customer identifier , when integrating with the AWS
  /// SaaS Marketplace.
  ///
  /// Parameter [description] :
  /// The description of the <a>ApiKey</a>.
  ///
  /// Parameter [enabled] :
  /// Specifies whether the <a>ApiKey</a> can be used by callers.
  ///
  /// Parameter [generateDistinctId] :
  /// Specifies whether (<code>true</code>) or not (<code>false</code>) the key
  /// identifier is distinct from the created API key value. This parameter is
  /// deprecated and should not be used.
  ///
  /// Parameter [name] :
  /// The name of the <a>ApiKey</a>.
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
    String customerId,
    String description,
    bool enabled,
    bool generateDistinctId,
    String name,
    List<StageKey> stageKeys,
    Map<String, String> tags,
    String value,
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

  /// Adds a new <a>Authorizer</a> resource to an existing <a>RestApi</a>
  /// resource.
  /// <div class="seeAlso"><a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/create-authorizer.html">AWS
  /// CLI</a></div>
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// [Required] The name of the authorizer.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [type] :
  /// [Required] The authorizer type. Valid values are <code>TOKEN</code> for a
  /// Lambda function using a single authorization token submitted in a custom
  /// header, <code>REQUEST</code> for a Lambda function using incoming request
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
  /// The identity source for which authorization is requested.
  /// <ul>
  /// <li>For a <code>TOKEN</code> or <code>COGNITO_USER_POOLS</code>
  /// authorizer, this is required and specifies the request header mapping
  /// expression for the custom header holding the authorization token submitted
  /// by the client. For example, if the token header name is <code>Auth</code>,
  /// the header mapping expression is
  /// <code>method.request.header.Auth</code>.</li>
  /// <li>For the <code>REQUEST</code> authorizer, this is required when
  /// authorization caching is enabled. The value is a comma-separated string of
  /// one or more mapping expressions of the specified request parameters. For
  /// example, if an <code>Auth</code> header, a <code>Name</code> query string
  /// parameter are defined as identity sources, this value is
  /// <code>method.request.header.Auth, method.request.querystring.Name</code>.
  /// These parameters will be used to derive the authorization caching key and
  /// to perform runtime validation of the <code>REQUEST</code> authorizer by
  /// verifying all of the identity-related request parameters are present, not
  /// null and non-empty. Only when this is true does the authorizer invoke the
  /// authorizer Lambda function, otherwise, it returns a 401 Unauthorized
  /// response without calling the Lambda function. The valid value is a string
  /// of comma-separated mapping expressions of the specified request
  /// parameters. When the authorization caching is not enabled, this property
  /// is optional.</li>
  /// </ul>
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
    @_s.required String name,
    @_s.required String restApiId,
    @_s.required AuthorizerType type,
    String authType,
    String authorizerCredentials,
    int authorizerResultTtlInSeconds,
    String authorizerUri,
    String identitySource,
    String identityValidationExpression,
    List<String> providerARNs,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'name': name,
      'type': type?.toValue() ?? '',
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

  /// Creates a new <a>BasePathMapping</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// [Required] The domain name of the <a>BasePathMapping</a> resource to
  /// create.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
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
    @_s.required String domainName,
    @_s.required String restApiId,
    String basePath,
    String stage,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Creates a <a>Deployment</a> resource, which makes a specified
  /// <a>RestApi</a> callable over the internet.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [cacheClusterEnabled] :
  /// Enables a cache cluster for the <a>Stage</a> resource specified in the
  /// input.
  ///
  /// Parameter [cacheClusterSize] :
  /// Specifies the cache cluster size for the <a>Stage</a> resource specified
  /// in the input, if a cache cluster is enabled.
  ///
  /// Parameter [canarySettings] :
  /// The input configuration for the canary deployment when the deployment is a
  /// canary release deployment.
  ///
  /// Parameter [description] :
  /// The description for the <a>Deployment</a> resource to create.
  ///
  /// Parameter [stageDescription] :
  /// The description of the <a>Stage</a> resource for the <a>Deployment</a>
  /// resource to create.
  ///
  /// Parameter [stageName] :
  /// The name of the <a>Stage</a> resource for the <a>Deployment</a> resource
  /// to create.
  ///
  /// Parameter [tracingEnabled] :
  /// Specifies whether active tracing with X-ray is enabled for the
  /// <a>Stage</a>.
  ///
  /// Parameter [variables] :
  /// A map that defines the stage variables for the <a>Stage</a> resource that
  /// is associated with the new deployment. Variable names can have
  /// alphanumeric and underscore characters, and the values must match
  /// <code>[A-Za-z0-9-._~:/?#&amp;=,]+</code>.
  Future<Deployment> createDeployment({
    @_s.required String restApiId,
    bool cacheClusterEnabled,
    CacheClusterSize cacheClusterSize,
    DeploymentCanarySettings canarySettings,
    String description,
    String stageDescription,
    String stageName,
    bool tracingEnabled,
    Map<String, String> variables,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final $payload = <String, dynamic>{
      if (cacheClusterEnabled != null)
        'cacheClusterEnabled': cacheClusterEnabled,
      if (cacheClusterSize != null)
        'cacheClusterSize': cacheClusterSize.toValue(),
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

  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [location] :
  /// [Required] The location of the targeted API entity of the to-be-created
  /// documentation part.
  ///
  /// Parameter [properties] :
  /// [Required] The new documentation content map of the targeted API entity.
  /// Enclosed key-value pairs are API-specific, but only OpenAPI-compliant
  /// key-value pairs can be exported and, hence, published.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<DocumentationPart> createDocumentationPart({
    @_s.required DocumentationPartLocation location,
    @_s.required String properties,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(location, 'location');
    ArgumentError.checkNotNull(properties, 'properties');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationVersion] :
  /// [Required] The version identifier of the new snapshot.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [description] :
  /// A description about the new documentation snapshot.
  ///
  /// Parameter [stageName] :
  /// The stage name to be associated with the new documentation snapshot.
  Future<DocumentationVersion> createDocumentationVersion({
    @_s.required String documentationVersion,
    @_s.required String restApiId,
    String description,
    String stageName,
  }) async {
    ArgumentError.checkNotNull(documentationVersion, 'documentationVersion');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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
  /// May throw [UnauthorizedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// [Required] The name of the <a>DomainName</a> resource.
  ///
  /// Parameter [certificateArn] :
  /// The reference to an AWS-managed certificate that will be used by
  /// edge-optimized endpoint for this domain name. AWS Certificate Manager is
  /// the only supported source.
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
  /// The endpoint configuration of this <a>DomainName</a> showing the endpoint
  /// types of the domain name.
  ///
  /// Parameter [regionalCertificateArn] :
  /// The reference to an AWS-managed certificate that will be used by regional
  /// endpoint for this domain name. AWS Certificate Manager is the only
  /// supported source.
  ///
  /// Parameter [regionalCertificateName] :
  /// The user-friendly name of the certificate that will be used by regional
  /// endpoint for this domain name.
  ///
  /// Parameter [securityPolicy] :
  /// The Transport Layer Security (TLS) version + cipher suite for this
  /// <a>DomainName</a>. The valid values are <code>TLS_1_0</code> and
  /// <code>TLS_1_2</code>.
  ///
  /// Parameter [tags] :
  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  Future<DomainName> createDomainName({
    @_s.required String domainName,
    String certificateArn,
    String certificateBody,
    String certificateChain,
    String certificateName,
    String certificatePrivateKey,
    EndpointConfiguration endpointConfiguration,
    MutualTlsAuthenticationInput mutualTlsAuthentication,
    String regionalCertificateArn,
    String regionalCertificateName,
    SecurityPolicy securityPolicy,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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
      if (regionalCertificateArn != null)
        'regionalCertificateArn': regionalCertificateArn,
      if (regionalCertificateName != null)
        'regionalCertificateName': regionalCertificateName,
      if (securityPolicy != null) 'securityPolicy': securityPolicy.toValue(),
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

  /// Adds a new <a>Model</a> resource to an existing <a>RestApi</a> resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [contentType] :
  /// [Required] The content-type for the model.
  ///
  /// Parameter [name] :
  /// [Required] The name of the model. Must be alphanumeric.
  ///
  /// Parameter [restApiId] :
  /// [Required] The <a>RestApi</a> identifier under which the <a>Model</a> will
  /// be created.
  ///
  /// Parameter [description] :
  /// The description of the model.
  ///
  /// Parameter [schema] :
  /// The schema for the model. For <code>application/json</code> models, this
  /// should be <a href="https://tools.ietf.org/html/draft-zyp-json-schema-04"
  /// target="_blank">JSON schema draft 4</a> model.
  Future<Model> createModel({
    @_s.required String contentType,
    @_s.required String name,
    @_s.required String restApiId,
    String description,
    String schema,
  }) async {
    ArgumentError.checkNotNull(contentType, 'contentType');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Creates a <a>ReqeustValidator</a> of a given <a>RestApi</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [name] :
  /// The name of the to-be-created <a>RequestValidator</a>.
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
    @_s.required String restApiId,
    String name,
    bool validateRequestBody,
    bool validateRequestParameters,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Creates a <a>Resource</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [parentId] :
  /// [Required] The parent resource's identifier.
  ///
  /// Parameter [pathPart] :
  /// The last path segment for this resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<Resource> createResource({
    @_s.required String parentId,
    @_s.required String pathPart,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(parentId, 'parentId');
    ArgumentError.checkNotNull(pathPart, 'pathPart');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Creates a new <a>RestApi</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// [Required] The name of the <a>RestApi</a>.
  ///
  /// Parameter [apiKeySource] :
  /// The source of the API key for metering requests according to a usage plan.
  /// Valid values are:
  /// <ul>
  /// <li><code>HEADER</code> to read the API key from the
  /// <code>X-API-Key</code> header of a request. </li>
  /// <li><code>AUTHORIZER</code> to read the API key from the
  /// <code>UsageIdentifierKey</code> from a custom authorizer.</li>
  /// </ul>
  ///
  /// Parameter [binaryMediaTypes] :
  /// The list of binary media types supported by the <a>RestApi</a>. By
  /// default, the <a>RestApi</a> supports only UTF-8-encoded text payloads.
  ///
  /// Parameter [cloneFrom] :
  /// The ID of the <a>RestApi</a> that you want to clone from.
  ///
  /// Parameter [description] :
  /// The description of the <a>RestApi</a>.
  ///
  /// Parameter [disableExecuteApiEndpoint] :
  /// Specifies whether clients can invoke your API by using the default
  /// <code>execute-api</code> endpoint. By default, clients can invoke your API
  /// with the default https://{api_id}.execute-api.{region}.amazonaws.com
  /// endpoint. To require that clients use a custom domain name to invoke your
  /// API, disable the default endpoint.
  ///
  /// Parameter [endpointConfiguration] :
  /// The endpoint configuration of this <a>RestApi</a> showing the endpoint
  /// types of the API.
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
  /// of the caller and <a>Method</a> configuration.
  ///
  /// Parameter [tags] :
  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  ///
  /// Parameter [version] :
  /// A version identifier for the API.
  Future<RestApi> createRestApi({
    @_s.required String name,
    ApiKeySourceType apiKeySource,
    List<String> binaryMediaTypes,
    String cloneFrom,
    String description,
    bool disableExecuteApiEndpoint,
    EndpointConfiguration endpointConfiguration,
    int minimumCompressionSize,
    String policy,
    Map<String, String> tags,
    String version,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'name': name,
      if (apiKeySource != null) 'apiKeySource': apiKeySource.toValue(),
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

  /// Creates a new <a>Stage</a> resource that references a pre-existing
  /// <a>Deployment</a> for the API.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [deploymentId] :
  /// [Required] The identifier of the <a>Deployment</a> resource for the
  /// <a>Stage</a> resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [stageName] :
  /// [Required] The name for the <a>Stage</a> resource. Stage names can only
  /// contain alphanumeric characters, hyphens, and underscores. Maximum length
  /// is 128 characters.
  ///
  /// Parameter [cacheClusterEnabled] :
  /// Whether cache clustering is enabled for the stage.
  ///
  /// Parameter [cacheClusterSize] :
  /// The stage's cache cluster size.
  ///
  /// Parameter [canarySettings] :
  /// The canary deployment settings of this stage.
  ///
  /// Parameter [description] :
  /// The description of the <a>Stage</a> resource.
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
  /// Specifies whether active tracing with X-ray is enabled for the
  /// <a>Stage</a>.
  ///
  /// Parameter [variables] :
  /// A map that defines the stage variables for the new <a>Stage</a> resource.
  /// Variable names can have alphanumeric and underscore characters, and the
  /// values must match <code>[A-Za-z0-9-._~:/?#&amp;=,]+</code>.
  Future<Stage> createStage({
    @_s.required String deploymentId,
    @_s.required String restApiId,
    @_s.required String stageName,
    bool cacheClusterEnabled,
    CacheClusterSize cacheClusterSize,
    CanarySettings canarySettings,
    String description,
    String documentationVersion,
    Map<String, String> tags,
    bool tracingEnabled,
    Map<String, String> variables,
  }) async {
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
    final $payload = <String, dynamic>{
      'deploymentId': deploymentId,
      'stageName': stageName,
      if (cacheClusterEnabled != null)
        'cacheClusterEnabled': cacheClusterEnabled,
      if (cacheClusterSize != null)
        'cacheClusterSize': cacheClusterSize.toValue(),
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
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [name] :
  /// [Required] The name of the usage plan.
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
    @_s.required String name,
    List<ApiStage> apiStages,
    String description,
    QuotaSettings quota,
    Map<String, String> tags,
    ThrottleSettings throttle,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [keyId] :
  /// [Required] The identifier of a <a>UsagePlanKey</a> resource for a plan
  /// customer.
  ///
  /// Parameter [keyType] :
  /// [Required] The type of a <a>UsagePlanKey</a> resource for a plan customer.
  ///
  /// Parameter [usagePlanId] :
  /// [Required] The Id of the <a>UsagePlan</a> resource representing the usage
  /// plan containing the to-be-created <a>UsagePlanKey</a> resource
  /// representing a plan customer.
  Future<UsagePlanKey> createUsagePlanKey({
    @_s.required String keyId,
    @_s.required String keyType,
    @_s.required String usagePlanId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    ArgumentError.checkNotNull(keyType, 'keyType');
    ArgumentError.checkNotNull(usagePlanId, 'usagePlanId');
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
  /// May throw [UnauthorizedException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// [Required] The name used to label and identify the VPC link.
  ///
  /// Parameter [targetArns] :
  /// [Required] The ARN of the network load balancer of the VPC targeted by the
  /// VPC link. The network load balancer must be owned by the same AWS account
  /// of the API owner.
  ///
  /// Parameter [description] :
  /// The description of the VPC link.
  ///
  /// Parameter [tags] :
  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  Future<VpcLink> createVpcLink({
    @_s.required String name,
    @_s.required List<String> targetArns,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(targetArns, 'targetArns');
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

  /// Deletes the <a>ApiKey</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiKey] :
  /// [Required] The identifier of the <a>ApiKey</a> resource to be deleted.
  Future<void> deleteApiKey({
    @_s.required String apiKey,
  }) async {
    ArgumentError.checkNotNull(apiKey, 'apiKey');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/apikeys/${Uri.encodeComponent(apiKey)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an existing <a>Authorizer</a> resource.
  /// <div class="seeAlso"><a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/delete-authorizer.html">AWS
  /// CLI</a></div>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [authorizerId] :
  /// [Required] The identifier of the <a>Authorizer</a> resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<void> deleteAuthorizer({
    @_s.required String authorizerId,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(authorizerId, 'authorizerId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/authorizers/${Uri.encodeComponent(authorizerId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the <a>BasePathMapping</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [basePath] :
  /// [Required] The base path name of the <a>BasePathMapping</a> resource to
  /// delete.
  ///
  /// To specify an empty base path, set this parameter to
  /// <code>'(none)'</code>.
  ///
  /// Parameter [domainName] :
  /// [Required] The domain name of the <a>BasePathMapping</a> resource to
  /// delete.
  Future<void> deleteBasePathMapping({
    @_s.required String basePath,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(basePath, 'basePath');
    ArgumentError.checkNotNull(domainName, 'domainName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domainnames/${Uri.encodeComponent(domainName)}/basepathmappings/${Uri.encodeComponent(basePath)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the <a>ClientCertificate</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [clientCertificateId] :
  /// [Required] The identifier of the <a>ClientCertificate</a> resource to be
  /// deleted.
  Future<void> deleteClientCertificate({
    @_s.required String clientCertificateId,
  }) async {
    ArgumentError.checkNotNull(clientCertificateId, 'clientCertificateId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/clientcertificates/${Uri.encodeComponent(clientCertificateId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a <a>Deployment</a> resource. Deleting a deployment will only
  /// succeed if there are no <a>Stage</a> resources associated with it.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [deploymentId] :
  /// [Required] The identifier of the <a>Deployment</a> resource to delete.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<void> deleteDeployment({
    @_s.required String deploymentId,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/deployments/${Uri.encodeComponent(deploymentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [documentationPartId] :
  /// [Required] The identifier of the to-be-deleted documentation part.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<void> deleteDocumentationPart({
    @_s.required String documentationPartId,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(documentationPartId, 'documentationPartId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/parts/${Uri.encodeComponent(documentationPartId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationVersion] :
  /// [Required] The version identifier of a to-be-deleted documentation
  /// snapshot.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<void> deleteDocumentationVersion({
    @_s.required String documentationVersion,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(documentationVersion, 'documentationVersion');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/versions/${Uri.encodeComponent(documentationVersion)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the <a>DomainName</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [domainName] :
  /// [Required] The name of the <a>DomainName</a> resource to be deleted.
  Future<void> deleteDomainName({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/domainnames/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Clears any customization of a <a>GatewayResponse</a> of a specified
  /// response type on the given <a>RestApi</a> and resets it with the default
  /// settings.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [responseType] :
  /// [Required]
  /// The response type of the associated <a>GatewayResponse</a>. Valid values
  /// are
  /// <ul>
  /// <li>ACCESS_DENIED</li>
  /// <li>API_CONFIGURATION_ERROR</li>
  /// <li>AUTHORIZER_FAILURE</li>
  /// <li> AUTHORIZER_CONFIGURATION_ERROR</li>
  /// <li>BAD_REQUEST_PARAMETERS</li>
  /// <li>BAD_REQUEST_BODY</li>
  /// <li>DEFAULT_4XX</li>
  /// <li>DEFAULT_5XX</li>
  /// <li>EXPIRED_TOKEN</li>
  /// <li>INVALID_SIGNATURE</li>
  /// <li>INTEGRATION_FAILURE</li>
  /// <li>INTEGRATION_TIMEOUT</li>
  /// <li>INVALID_API_KEY</li>
  /// <li>MISSING_AUTHENTICATION_TOKEN</li>
  /// <li> QUOTA_EXCEEDED</li>
  /// <li>REQUEST_TOO_LARGE</li>
  /// <li>RESOURCE_NOT_FOUND</li>
  /// <li>THROTTLED</li>
  /// <li>UNAUTHORIZED</li>
  /// <li>UNSUPPORTED_MEDIA_TYPE</li>
  /// </ul>
  ///
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<void> deleteGatewayResponse({
    @_s.required GatewayResponseType responseType,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(responseType, 'responseType');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/gatewayresponses/${Uri.encodeComponent(responseType.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Represents a delete integration.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] Specifies a delete integration request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// [Required] Specifies a delete integration request's resource identifier.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<void> deleteIntegration({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] Specifies a delete integration response request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// [Required] Specifies a delete integration response request's resource
  /// identifier.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [statusCode] :
  /// [Required] Specifies a delete integration response request's status code.
  Future<void> deleteIntegrationResponse({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    @_s.required String statusCode,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(statusCode, 'statusCode');
    _s.validateStringPattern(
      'statusCode',
      statusCode,
      r'''[1-5]\d\d''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/integration/responses/${Uri.encodeComponent(statusCode)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an existing <a>Method</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] The HTTP verb of the <a>Method</a> resource.
  ///
  /// Parameter [resourceId] :
  /// [Required] The <a>Resource</a> identifier for the <a>Method</a> resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<void> deleteMethod({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an existing <a>MethodResponse</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] The HTTP verb of the <a>Method</a> resource.
  ///
  /// Parameter [resourceId] :
  /// [Required] The <a>Resource</a> identifier for the <a>MethodResponse</a>
  /// resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [statusCode] :
  /// [Required] The status code identifier for the <a>MethodResponse</a>
  /// resource.
  Future<void> deleteMethodResponse({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    @_s.required String statusCode,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(statusCode, 'statusCode');
    _s.validateStringPattern(
      'statusCode',
      statusCode,
      r'''[1-5]\d\d''',
      isRequired: true,
    );
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [modelName] :
  /// [Required] The name of the model to delete.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<void> deleteModel({
    @_s.required String modelName,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(modelName, 'modelName');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/models/${Uri.encodeComponent(modelName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a <a>RequestValidator</a> of a given <a>RestApi</a>.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [requestValidatorId] :
  /// [Required] The identifier of the <a>RequestValidator</a> to be deleted.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<void> deleteRequestValidator({
    @_s.required String requestValidatorId,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(requestValidatorId, 'requestValidatorId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/requestvalidators/${Uri.encodeComponent(requestValidatorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a <a>Resource</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceId] :
  /// [Required] The identifier of the <a>Resource</a> resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<void> deleteResource({
    @_s.required String resourceId,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<void> deleteRestApi({
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a <a>Stage</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [stageName] :
  /// [Required] The name of the <a>Stage</a> resource to delete.
  Future<void> deleteStage({
    @_s.required String restApiId,
    @_s.required String stageName,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
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
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [usagePlanId] :
  /// [Required] The Id of the to-be-deleted usage plan.
  Future<void> deleteUsagePlan({
    @_s.required String usagePlanId,
  }) async {
    ArgumentError.checkNotNull(usagePlanId, 'usagePlanId');
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [keyId] :
  /// [Required] The Id of the <a>UsagePlanKey</a> resource to be deleted.
  ///
  /// Parameter [usagePlanId] :
  /// [Required] The Id of the <a>UsagePlan</a> resource representing the usage
  /// plan containing the to-be-deleted <a>UsagePlanKey</a> resource
  /// representing a plan customer.
  Future<void> deleteUsagePlanKey({
    @_s.required String keyId,
    @_s.required String usagePlanId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    ArgumentError.checkNotNull(usagePlanId, 'usagePlanId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/usageplans/${Uri.encodeComponent(usagePlanId)}/keys/${Uri.encodeComponent(keyId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an existing <a>VpcLink</a> of a specified identifier.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [vpcLinkId] :
  /// [Required] The identifier of the <a>VpcLink</a>. It is used in an
  /// <a>Integration</a> to reference this <a>VpcLink</a>.
  Future<void> deleteVpcLink({
    @_s.required String vpcLinkId,
  }) async {
    ArgumentError.checkNotNull(vpcLinkId, 'vpcLinkId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/vpclinks/${Uri.encodeComponent(vpcLinkId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Flushes all authorizer cache entries on a stage.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [stageName] :
  /// The name of the stage to flush.
  Future<void> flushStageAuthorizersCache({
    @_s.required String restApiId,
    @_s.required String stageName,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [stageName] :
  /// [Required] The name of the stage to flush its cache.
  Future<void> flushStageCache({
    @_s.required String restApiId,
    @_s.required String stageName,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/stages/${Uri.encodeComponent(stageName)}/cache/data',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Generates a <a>ClientCertificate</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [description] :
  /// The description of the <a>ClientCertificate</a>.
  ///
  /// Parameter [tags] :
  /// The key-value map of strings. The valid character set is [a-zA-Z+-=._:/].
  /// The tag key can be up to 128 characters and must not start with
  /// <code>aws:</code>. The tag value can be up to 256 characters.
  Future<ClientCertificate> generateClientCertificate({
    String description,
    Map<String, String> tags,
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

  /// Gets information about the current <a>Account</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
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

  /// Gets information about the current <a>ApiKey</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiKey] :
  /// [Required] The identifier of the <a>ApiKey</a> resource.
  ///
  /// Parameter [includeValue] :
  /// A boolean flag to specify whether (<code>true</code>) or not
  /// (<code>false</code>) the result contains the key value.
  Future<ApiKey> getApiKey({
    @_s.required String apiKey,
    bool includeValue,
  }) async {
    ArgumentError.checkNotNull(apiKey, 'apiKey');
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

  /// Gets information about the current <a>ApiKeys</a> resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [customerId] :
  /// The identifier of a customer in AWS Marketplace or an external system,
  /// such as a developer portal.
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
    String customerId,
    bool includeValues,
    int limit,
    String nameQuery,
    String position,
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

  /// Describe an existing <a>Authorizer</a> resource.
  /// <div class="seeAlso"><a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-authorizer.html">AWS
  /// CLI</a></div>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authorizerId] :
  /// [Required] The identifier of the <a>Authorizer</a> resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<Authorizer> getAuthorizer({
    @_s.required String authorizerId,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(authorizerId, 'authorizerId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/authorizers/${Uri.encodeComponent(authorizerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return Authorizer.fromJson(response);
  }

  /// Describe an existing <a>Authorizers</a> resource.
  /// <div class="seeAlso"><a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-authorizers.html">AWS
  /// CLI</a></div>
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<Authorizers> getAuthorizers({
    @_s.required String restApiId,
    int limit,
    String position,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Describe a <a>BasePathMapping</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [basePath] :
  /// [Required] The base path name that callers of the API must provide as part
  /// of the URL after the domain name. This value must be unique for all of the
  /// mappings across a single API. Specify '(none)' if you do not want callers
  /// to specify any base path name after the domain name.
  ///
  /// Parameter [domainName] :
  /// [Required] The domain name of the <a>BasePathMapping</a> resource to be
  /// described.
  Future<BasePathMapping> getBasePathMapping({
    @_s.required String basePath,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(basePath, 'basePath');
    ArgumentError.checkNotNull(domainName, 'domainName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domainnames/${Uri.encodeComponent(domainName)}/basepathmappings/${Uri.encodeComponent(basePath)}',
      exceptionFnMap: _exceptionFns,
    );
    return BasePathMapping.fromJson(response);
  }

  /// Represents a collection of <a>BasePathMapping</a> resources.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// [Required] The domain name of a <a>BasePathMapping</a> resource.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<BasePathMappings> getBasePathMappings({
    @_s.required String domainName,
    int limit,
    String position,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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

  /// Gets information about the current <a>ClientCertificate</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [clientCertificateId] :
  /// [Required] The identifier of the <a>ClientCertificate</a> resource to be
  /// described.
  Future<ClientCertificate> getClientCertificate({
    @_s.required String clientCertificateId,
  }) async {
    ArgumentError.checkNotNull(clientCertificateId, 'clientCertificateId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/clientcertificates/${Uri.encodeComponent(clientCertificateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return ClientCertificate.fromJson(response);
  }

  /// Gets a collection of <a>ClientCertificate</a> resources.
  ///
  /// May throw [BadRequestException].
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
    int limit,
    String position,
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

  /// Gets information about a <a>Deployment</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [deploymentId] :
  /// [Required] The identifier of the <a>Deployment</a> resource to get
  /// information about.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [embed] :
  /// A query parameter to retrieve the specified embedded resources of the
  /// returned <a>Deployment</a> resource in the response. In a REST API call,
  /// this <code>embed</code> parameter value is a list of comma-separated
  /// strings, as in <code>GET
  /// /restapis/{restapi_id}/deployments/{deployment_id}?embed=var1,var2</code>.
  /// The SDK and other platform-dependent libraries might use a different
  /// format for the list. Currently, this request supports only retrieval of
  /// the embedded API summary this way. Hence, the parameter value must be a
  /// single-valued list containing only the <code>"apisummary"</code> string.
  /// For example, <code>GET
  /// /restapis/{restapi_id}/deployments/{deployment_id}?embed=apisummary</code>.
  Future<Deployment> getDeployment({
    @_s.required String deploymentId,
    @_s.required String restApiId,
    List<String> embed,
  }) async {
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Gets information about a <a>Deployments</a> collection.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<Deployments> getDeployments({
    @_s.required String restApiId,
    int limit,
    String position,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationPartId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<DocumentationPart> getDocumentationPart({
    @_s.required String documentationPartId,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(documentationPartId, 'documentationPartId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/parts/${Uri.encodeComponent(documentationPartId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DocumentationPart.fromJson(response);
  }

  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [locationStatus] :
  /// The status of the API documentation parts to retrieve. Valid values are
  /// <code>DOCUMENTED</code> for retrieving <a>DocumentationPart</a> resources
  /// with content and <code>UNDOCUMENTED</code> for <a>DocumentationPart</a>
  /// resources without content.
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
    @_s.required String restApiId,
    int limit,
    LocationStatusType locationStatus,
    String nameQuery,
    String path,
    String position,
    DocumentationPartType type,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (locationStatus != null) 'locationStatus': [locationStatus.toValue()],
      if (nameQuery != null) 'name': [nameQuery],
      if (path != null) 'path': [path],
      if (position != null) 'position': [position],
      if (type != null) 'type': [type.toValue()],
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

  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationVersion] :
  /// [Required] The version identifier of the to-be-retrieved documentation
  /// snapshot.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<DocumentationVersion> getDocumentationVersion({
    @_s.required String documentationVersion,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(documentationVersion, 'documentationVersion');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/documentation/versions/${Uri.encodeComponent(documentationVersion)}',
      exceptionFnMap: _exceptionFns,
    );
    return DocumentationVersion.fromJson(response);
  }

  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<DocumentationVersions> getDocumentationVersions({
    @_s.required String restApiId,
    int limit,
    String position,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// [Required] The name of the <a>DomainName</a> resource.
  Future<DomainName> getDomainName({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domainnames/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DomainName.fromJson(response);
  }

  /// Represents a collection of <a>DomainName</a> resources.
  ///
  /// May throw [BadRequestException].
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
    int limit,
    String position,
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

  /// Exports a deployed version of a <a>RestApi</a> in a specified format.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [exportType] :
  /// [Required] The type of export. Acceptable values are 'oas30' for OpenAPI
  /// 3.0.x and 'swagger' for Swagger/OpenAPI 2.0.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [stageName] :
  /// [Required] The name of the <a>Stage</a> that will be exported.
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
    @_s.required String exportType,
    @_s.required String restApiId,
    @_s.required String stageName,
    String accepts,
    Map<String, String> parameters,
  }) async {
    ArgumentError.checkNotNull(exportType, 'exportType');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
    final headers = <String, String>{};
    accepts?.let((v) => headers['Accept'] = v.toString());
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

  /// Gets a <a>GatewayResponse</a> of a specified response type on the given
  /// <a>RestApi</a>.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [responseType] :
  /// [Required]
  /// The response type of the associated <a>GatewayResponse</a>. Valid values
  /// are
  /// <ul>
  /// <li>ACCESS_DENIED</li>
  /// <li>API_CONFIGURATION_ERROR</li>
  /// <li>AUTHORIZER_FAILURE</li>
  /// <li> AUTHORIZER_CONFIGURATION_ERROR</li>
  /// <li>BAD_REQUEST_PARAMETERS</li>
  /// <li>BAD_REQUEST_BODY</li>
  /// <li>DEFAULT_4XX</li>
  /// <li>DEFAULT_5XX</li>
  /// <li>EXPIRED_TOKEN</li>
  /// <li>INVALID_SIGNATURE</li>
  /// <li>INTEGRATION_FAILURE</li>
  /// <li>INTEGRATION_TIMEOUT</li>
  /// <li>INVALID_API_KEY</li>
  /// <li>MISSING_AUTHENTICATION_TOKEN</li>
  /// <li> QUOTA_EXCEEDED</li>
  /// <li>REQUEST_TOO_LARGE</li>
  /// <li>RESOURCE_NOT_FOUND</li>
  /// <li>THROTTLED</li>
  /// <li>UNAUTHORIZED</li>
  /// <li>UNSUPPORTED_MEDIA_TYPE</li>
  /// </ul>
  ///
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<GatewayResponse> getGatewayResponse({
    @_s.required GatewayResponseType responseType,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(responseType, 'responseType');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/gatewayresponses/${Uri.encodeComponent(responseType.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return GatewayResponse.fromJson(response);
  }

  /// Gets the <a>GatewayResponses</a> collection on the given <a>RestApi</a>.
  /// If an API developer has not added any definitions for gateway responses,
  /// the result will be the API Gateway-generated default
  /// <a>GatewayResponses</a> collection for the supported response types.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500. The <a>GatewayResponses</a> collection does
  /// not support pagination and the limit does not apply here.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set. The
  /// <a>GatewayResponse</a> collection does not support pagination and the
  /// position does not apply here.
  Future<GatewayResponses> getGatewayResponses({
    @_s.required String restApiId,
    int limit,
    String position,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] Specifies a get integration request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// [Required] Specifies a get integration request's resource identifier
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<Integration> getIntegration({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] Specifies a get integration response request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// [Required] Specifies a get integration response request's resource
  /// identifier.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [statusCode] :
  /// [Required] Specifies a get integration response request's status code.
  Future<IntegrationResponse> getIntegrationResponse({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    @_s.required String statusCode,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(statusCode, 'statusCode');
    _s.validateStringPattern(
      'statusCode',
      statusCode,
      r'''[1-5]\d\d''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/integration/responses/${Uri.encodeComponent(statusCode)}',
      exceptionFnMap: _exceptionFns,
    );
    return IntegrationResponse.fromJson(response);
  }

  /// Describe an existing <a>Method</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] Specifies the method request's HTTP method type.
  ///
  /// Parameter [resourceId] :
  /// [Required] The <a>Resource</a> identifier for the <a>Method</a> resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<Method> getMethod({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}',
      exceptionFnMap: _exceptionFns,
    );
    return Method.fromJson(response);
  }

  /// Describes a <a>MethodResponse</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] The HTTP verb of the <a>Method</a> resource.
  ///
  /// Parameter [resourceId] :
  /// [Required] The <a>Resource</a> identifier for the <a>MethodResponse</a>
  /// resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [statusCode] :
  /// [Required] The status code for the <a>MethodResponse</a> resource.
  Future<MethodResponse> getMethodResponse({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    @_s.required String statusCode,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(statusCode, 'statusCode');
    _s.validateStringPattern(
      'statusCode',
      statusCode,
      r'''[1-5]\d\d''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/resources/${Uri.encodeComponent(resourceId)}/methods/${Uri.encodeComponent(httpMethod)}/responses/${Uri.encodeComponent(statusCode)}',
      exceptionFnMap: _exceptionFns,
    );
    return MethodResponse.fromJson(response);
  }

  /// Describes an existing model defined for a <a>RestApi</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [modelName] :
  /// [Required] The name of the model as an identifier.
  ///
  /// Parameter [restApiId] :
  /// [Required] The <a>RestApi</a> identifier under which the <a>Model</a>
  /// exists.
  ///
  /// Parameter [flatten] :
  /// A query parameter of a Boolean value to resolve (<code>true</code>) all
  /// external model references and returns a flattened model schema or not
  /// (<code>false</code>) The default is <code>false</code>.
  Future<Model> getModel({
    @_s.required String modelName,
    @_s.required String restApiId,
    bool flatten,
  }) async {
    ArgumentError.checkNotNull(modelName, 'modelName');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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
  /// [Required] The name of the model for which to generate a template.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<Template> getModelTemplate({
    @_s.required String modelName,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(modelName, 'modelName');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/models/${Uri.encodeComponent(modelName)}/default_template',
      exceptionFnMap: _exceptionFns,
    );
    return Template.fromJson(response);
  }

  /// Describes existing <a>Models</a> defined for a <a>RestApi</a> resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<Models> getModels({
    @_s.required String restApiId,
    int limit,
    String position,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Gets a <a>RequestValidator</a> of a given <a>RestApi</a>.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [requestValidatorId] :
  /// [Required] The identifier of the <a>RequestValidator</a> to be retrieved.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<RequestValidator> getRequestValidator({
    @_s.required String requestValidatorId,
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(requestValidatorId, 'requestValidatorId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/requestvalidators/${Uri.encodeComponent(requestValidatorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return RequestValidator.fromJson(response);
  }

  /// Gets the <a>RequestValidators</a> collection of a given <a>RestApi</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<RequestValidators> getRequestValidators({
    @_s.required String restApiId,
    int limit,
    String position,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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
  /// [Required] The identifier for the <a>Resource</a> resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [embed] :
  /// A query parameter to retrieve the specified resources embedded in the
  /// returned <a>Resource</a> representation in the response. This
  /// <code>embed</code> parameter value is a list of comma-separated strings.
  /// Currently, the request supports only retrieval of the embedded
  /// <a>Method</a> resources this way. The query parameter value must be a
  /// single-valued list and contain the <code>"methods"</code> string. For
  /// example, <code>GET
  /// /restapis/{restapi_id}/resources/{resource_id}?embed=methods</code>.
  Future<Resource> getResource({
    @_s.required String resourceId,
    @_s.required String restApiId,
    List<String> embed,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Lists information about a collection of <a>Resource</a> resources.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [embed] :
  /// A query parameter used to retrieve the specified resources embedded in the
  /// returned <a>Resources</a> resource in the response. This
  /// <code>embed</code> parameter value is a list of comma-separated strings.
  /// Currently, the request supports only retrieval of the embedded
  /// <a>Method</a> resources this way. The query parameter value must be a
  /// single-valued list and contain the <code>"methods"</code> string. For
  /// example, <code>GET /restapis/{restapi_id}/resources?embed=methods</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of returned results per page. The default value is 25
  /// and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// The current pagination position in the paged result set.
  Future<Resources> getResources({
    @_s.required String restApiId,
    List<String> embed,
    int limit,
    String position,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Lists the <a>RestApi</a> resource in the collection.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  Future<RestApi> getRestApi({
    @_s.required String restApiId,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restapis/${Uri.encodeComponent(restApiId)}',
      exceptionFnMap: _exceptionFns,
    );
    return RestApi.fromJson(response);
  }

  /// Lists the <a>RestApis</a> resources for your collection.
  ///
  /// May throw [BadRequestException].
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
    int limit,
    String position,
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

  /// Generates a client SDK for a <a>RestApi</a> and <a>Stage</a>.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [sdkType] :
  /// [Required] The language for the generated SDK. Currently
  /// <code>java</code>, <code>javascript</code>, <code>android</code>,
  /// <code>objectivec</code> (for iOS), <code>swift</code> (for iOS), and
  /// <code>ruby</code> are supported.
  ///
  /// Parameter [stageName] :
  /// [Required] The name of the <a>Stage</a> that the SDK will use.
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
    @_s.required String restApiId,
    @_s.required String sdkType,
    @_s.required String stageName,
    Map<String, String> parameters,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(sdkType, 'sdkType');
    ArgumentError.checkNotNull(stageName, 'stageName');
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

  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [id] :
  /// [Required] The identifier of the queried <a>SdkType</a> instance.
  Future<SdkType> getSdkType({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sdktypes/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    return SdkType.fromJson(response);
  }

  ///
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
    int limit,
    String position,
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

  /// Gets information about a <a>Stage</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [stageName] :
  /// [Required] The name of the <a>Stage</a> resource to get information about.
  Future<Stage> getStage({
    @_s.required String restApiId,
    @_s.required String stageName,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/stages/${Uri.encodeComponent(stageName)}',
      exceptionFnMap: _exceptionFns,
    );
    return Stage.fromJson(response);
  }

  /// Gets information about one or more <a>Stage</a> resources.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [deploymentId] :
  /// The stages' deployment identifiers.
  Future<Stages> getStages({
    @_s.required String restApiId,
    String deploymentId,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Gets the <a>Tags</a> collection for a given resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// [Required] The ARN of a resource that can be tagged.
  ///
  /// Parameter [limit] :
  /// (Not currently supported) The maximum number of returned results per page.
  /// The default value is 25 and the maximum value is 500.
  ///
  /// Parameter [position] :
  /// (Not currently supported) The current pagination position in the paged
  /// result set.
  Future<Tags> getTags({
    @_s.required String resourceArn,
    int limit,
    String position,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
  /// [Required] The ending date (e.g., 2016-12-31) of the usage data.
  ///
  /// Parameter [startDate] :
  /// [Required] The starting date (e.g., 2016-01-01) of the usage data.
  ///
  /// Parameter [usagePlanId] :
  /// [Required] The Id of the usage plan associated with the usage data.
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
    @_s.required String endDate,
    @_s.required String startDate,
    @_s.required String usagePlanId,
    String keyId,
    int limit,
    String position,
  }) async {
    ArgumentError.checkNotNull(endDate, 'endDate');
    ArgumentError.checkNotNull(startDate, 'startDate');
    ArgumentError.checkNotNull(usagePlanId, 'usagePlanId');
    final $query = <String, List<String>>{
      if (endDate != null) 'endDate': [endDate],
      if (startDate != null) 'startDate': [startDate],
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [usagePlanId] :
  /// [Required] The identifier of the <a>UsagePlan</a> resource to be
  /// retrieved.
  Future<UsagePlan> getUsagePlan({
    @_s.required String usagePlanId,
  }) async {
    ArgumentError.checkNotNull(usagePlanId, 'usagePlanId');
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [keyId] :
  /// [Required] The key Id of the to-be-retrieved <a>UsagePlanKey</a> resource
  /// representing a plan customer.
  ///
  /// Parameter [usagePlanId] :
  /// [Required] The Id of the <a>UsagePlan</a> resource representing the usage
  /// plan containing the to-be-retrieved <a>UsagePlanKey</a> resource
  /// representing a plan customer.
  Future<UsagePlanKey> getUsagePlanKey({
    @_s.required String keyId,
    @_s.required String usagePlanId,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    ArgumentError.checkNotNull(usagePlanId, 'usagePlanId');
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [usagePlanId] :
  /// [Required] The Id of the <a>UsagePlan</a> resource representing the usage
  /// plan containing the to-be-retrieved <a>UsagePlanKey</a> resource
  /// representing a plan customer.
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
    @_s.required String usagePlanId,
    int limit,
    String nameQuery,
    String position,
  }) async {
    ArgumentError.checkNotNull(usagePlanId, 'usagePlanId');
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
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
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
    String keyId,
    int limit,
    String position,
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [vpcLinkId] :
  /// [Required] The identifier of the <a>VpcLink</a>. It is used in an
  /// <a>Integration</a> to reference this <a>VpcLink</a>.
  Future<VpcLink> getVpcLink({
    @_s.required String vpcLinkId,
  }) async {
    ArgumentError.checkNotNull(vpcLinkId, 'vpcLinkId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/vpclinks/${Uri.encodeComponent(vpcLinkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return VpcLink.fromJson(response);
  }

  /// Gets the <a>VpcLinks</a> collection under the caller's account in a
  /// selected region.
  ///
  /// May throw [BadRequestException].
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
    int limit,
    String position,
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [body] :
  /// The payload of the POST request to import API keys. For the payload
  /// format, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-key-file-format.html">API
  /// Key File Format</a>.
  ///
  /// Parameter [format] :
  /// A query parameter to specify the input format to imported API keys.
  /// Currently, only the <code>csv</code> format is supported.
  ///
  /// Parameter [failOnWarnings] :
  /// A query parameter to indicate whether to rollback <a>ApiKey</a>
  /// importation (<code>true</code>) or not (<code>false</code>) when error is
  /// encountered.
  Future<ApiKeyIds> importApiKeys({
    @_s.required Uint8List body,
    @_s.required ApiKeysFormat format,
    bool failOnWarnings,
  }) async {
    ArgumentError.checkNotNull(body, 'body');
    ArgumentError.checkNotNull(format, 'format');
    final $query = <String, List<String>>{
      if (format != null) 'format': [format.toValue()],
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

  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [body] :
  /// [Required] Raw byte array representing the to-be-imported documentation
  /// parts. To import from an OpenAPI file, this is a JSON object.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [failOnWarnings] :
  /// A query parameter to specify whether to rollback the documentation
  /// importation (<code>true</code>) or not (<code>false</code>) when a warning
  /// is encountered. The default value is <code>false</code>.
  ///
  /// Parameter [mode] :
  /// A query parameter to indicate whether to overwrite
  /// (<code>OVERWRITE</code>) any existing <a>DocumentationParts</a> definition
  /// or to merge (<code>MERGE</code>) the new definition into the existing one.
  /// The default value is <code>MERGE</code>.
  Future<DocumentationPartIds> importDocumentationParts({
    @_s.required Uint8List body,
    @_s.required String restApiId,
    bool failOnWarnings,
    PutMode mode,
  }) async {
    ArgumentError.checkNotNull(body, 'body');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final $query = <String, List<String>>{
      if (failOnWarnings != null) 'failonwarnings': [failOnWarnings.toString()],
      if (mode != null) 'mode': [mode.toValue()],
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
  /// May throw [UnauthorizedException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [body] :
  /// [Required] The POST request body containing external API definitions.
  /// Currently, only OpenAPI definition JSON/YAML files are supported. The
  /// maximum size of the API definition file is 6MB.
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
  /// To exclude <a>DocumentationParts</a> from the import, set
  /// <code>parameters</code> as <code>ignore=documentation</code>.
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
  ///
  /// For example, the AWS CLI command to exclude documentation from the
  /// imported API is:
  /// <pre><code>aws apigateway import-rest-api --parameters
  /// ignore=documentation --body
  /// 'file:///path/to/imported-api-body.json'</code></pre>
  /// The AWS CLI command to set the regional endpoint on the imported API is:
  /// <pre><code>aws apigateway import-rest-api --parameters
  /// endpointConfigurationTypes=REGIONAL --body
  /// 'file:///path/to/imported-api-body.json'</code></pre>
  Future<RestApi> importRestApi({
    @_s.required Uint8List body,
    bool failOnWarnings,
    Map<String, String> parameters,
  }) async {
    ArgumentError.checkNotNull(body, 'body');
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

  /// Creates a customization of a <a>GatewayResponse</a> of a specified
  /// response type and status code on the given <a>RestApi</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [responseType] :
  /// [Required]
  /// The response type of the associated <a>GatewayResponse</a>. Valid values
  /// are
  /// <ul>
  /// <li>ACCESS_DENIED</li>
  /// <li>API_CONFIGURATION_ERROR</li>
  /// <li>AUTHORIZER_FAILURE</li>
  /// <li> AUTHORIZER_CONFIGURATION_ERROR</li>
  /// <li>BAD_REQUEST_PARAMETERS</li>
  /// <li>BAD_REQUEST_BODY</li>
  /// <li>DEFAULT_4XX</li>
  /// <li>DEFAULT_5XX</li>
  /// <li>EXPIRED_TOKEN</li>
  /// <li>INVALID_SIGNATURE</li>
  /// <li>INTEGRATION_FAILURE</li>
  /// <li>INTEGRATION_TIMEOUT</li>
  /// <li>INVALID_API_KEY</li>
  /// <li>MISSING_AUTHENTICATION_TOKEN</li>
  /// <li> QUOTA_EXCEEDED</li>
  /// <li>REQUEST_TOO_LARGE</li>
  /// <li>RESOURCE_NOT_FOUND</li>
  /// <li>THROTTLED</li>
  /// <li>UNAUTHORIZED</li>
  /// <li>UNSUPPORTED_MEDIA_TYPE</li>
  /// </ul>
  ///
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [responseParameters] :
  ///
  /// Response parameters (paths, query strings and headers) of the
  /// <a>GatewayResponse</a> as a string-to-string map of key-value pairs.
  ///
  ///
  /// Parameter [responseTemplates] :
  ///
  /// Response templates of the <a>GatewayResponse</a> as a string-to-string map
  /// of key-value pairs.
  ///
  ///
  /// Parameter [statusCode] :
  /// The HTTP status code of the <a>GatewayResponse</a>.
  Future<GatewayResponse> putGatewayResponse({
    @_s.required GatewayResponseType responseType,
    @_s.required String restApiId,
    Map<String, String> responseParameters,
    Map<String, String> responseTemplates,
    String statusCode,
  }) async {
    ArgumentError.checkNotNull(responseType, 'responseType');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    _s.validateStringPattern(
      'statusCode',
      statusCode,
      r'''[1-5]\d\d''',
    );
    final $payload = <String, dynamic>{
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (responseTemplates != null) 'responseTemplates': responseTemplates,
      if (statusCode != null) 'statusCode': statusCode,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/gatewayresponses/${Uri.encodeComponent(responseType.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return GatewayResponse.fromJson(response);
  }

  /// Sets up a method's integration.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] Specifies a put integration request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// [Required] Specifies a put integration request's resource ID.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [type] :
  /// [Required] Specifies a put integration input's type.
  ///
  /// Parameter [cacheKeyParameters] :
  /// A list of request parameters whose values API Gateway caches. To be valid
  /// values for <code>cacheKeyParameters</code>, these parameters must also be
  /// specified for <a>Method</a> <code>requestParameters</code>.
  ///
  /// Parameter [cacheNamespace] :
  /// Specifies a group of related cached parameters. By default, API Gateway
  /// uses the resource ID as the <code>cacheNamespace</code>. You can specify
  /// the same <code>cacheNamespace</code> across resources to return the same
  /// cached data for requests to different resources.
  ///
  /// Parameter [connectionId] :
  /// The (<a
  /// href="https://docs.aws.amazon.com/apigateway/api-reference/resource/vpc-link/#id"><code>id</code></a>)
  /// of the <a>VpcLink</a> used for the integration when
  /// <code>connectionType=VPC_LINK</code> and undefined, otherwise.
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
  /// <ul>
  /// <li>
  /// <code>CONVERT_TO_BINARY</code>: Converts a request payload from a
  /// Base64-encoded string to the corresponding binary blob.
  /// </li>
  /// <li>
  /// <code>CONVERT_TO_TEXT</code>: Converts a request payload from a binary
  /// blob to a Base64-encoded string.
  /// </li>
  /// </ul>
  /// If this property is not defined, the request payload will be passed
  /// through from the method request to integration request without
  /// modification, provided that the <code>passthroughBehavior</code> is
  /// configured to support payload pass-through.
  ///
  /// Parameter [credentials] :
  /// Specifies whether credentials are required for a put integration.
  ///
  /// Parameter [integrationHttpMethod] :
  /// Specifies a put integration HTTP method. When the integration type is HTTP
  /// or AWS, this field is required.
  ///
  /// Parameter [passthroughBehavior] :
  /// Specifies the pass-through behavior for incoming requests based on the
  /// Content-Type header in the request, and the available mapping templates
  /// specified as the <code>requestTemplates</code> property on the Integration
  /// resource. There are three valid values: <code>WHEN_NO_MATCH</code>,
  /// <code>WHEN_NO_TEMPLATES</code>, and <code>NEVER</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>WHEN_NO_MATCH</code> passes the request body for unmapped content
  /// types through to the integration back end without transformation.
  /// </li>
  /// <li>
  /// <code>NEVER</code> rejects unmapped content types with an HTTP 415
  /// 'Unsupported Media Type' response.
  /// </li>
  /// <li>
  /// <code>WHEN_NO_TEMPLATES</code> allows pass-through when the integration
  /// has NO content types mapped to templates. However if there is at least one
  /// content type defined, unmapped content types will be rejected with the
  /// same 415 response.
  /// </li>
  /// </ul>
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
  ///
  /// <ul>
  /// <li>
  /// For <code>HTTP</code> or <code>HTTP_PROXY</code> integrations, the URI
  /// must be a fully formed, encoded HTTP(S) URL according to the <a
  /// href="https://en.wikipedia.org/wiki/Uniform_Resource_Identifier"
  /// target="_blank">RFC-3986 specification</a>, for either standard
  /// integration, where <code>connectionType</code> is not
  /// <code>VPC_LINK</code>, or private integration, where
  /// <code>connectionType</code> is <code>VPC_LINK</code>. For a private HTTP
  /// integration, the URI is not used for routing.
  /// </li>
  /// <li>
  /// For <code>AWS</code> or <code>AWS_PROXY</code> integrations, the URI is of
  /// the form
  /// <code>arn:aws:apigateway:{region}:{subdomain.service|service}:path|action/{service_api}</code>.
  /// Here, <code>{Region}</code> is the API Gateway region (e.g.,
  /// <code>us-east-1</code>); <code>{service}</code> is the name of the
  /// integrated AWS service (e.g., <code>s3</code>); and
  /// <code>{subdomain}</code> is a designated subdomain supported by certain
  /// AWS service for fast host-name lookup. <code>action</code> can be used for
  /// an AWS service action-based API, using an
  /// <code>Action={name}&amp;{p1}={v1}&amp;p2={v2}...</code> query string. The
  /// ensuing <code>{service_api}</code> refers to a supported action
  /// <code>{name}</code> plus any required input parameters. Alternatively,
  /// <code>path</code> can be used for an AWS service path-based API. The
  /// ensuing <code>service_api</code> refers to the path to an AWS service
  /// resource, including the region of the integrated AWS service, if
  /// applicable. For example, for integration with the S3 API of <code><a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectGET.html">GetObject</a></code>,
  /// the <code>uri</code> can be either
  /// <code>arn:aws:apigateway:us-west-2:s3:action/GetObject&amp;Bucket={bucket}&amp;Key={key}</code>
  /// or <code>arn:aws:apigateway:us-west-2:s3:path/{bucket}/{key}</code>
  /// </li>
  /// </ul>
  Future<Integration> putIntegration({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    @_s.required IntegrationType type,
    List<String> cacheKeyParameters,
    String cacheNamespace,
    String connectionId,
    ConnectionType connectionType,
    ContentHandlingStrategy contentHandling,
    String credentials,
    String integrationHttpMethod,
    String passthroughBehavior,
    Map<String, String> requestParameters,
    Map<String, String> requestTemplates,
    int timeoutInMillis,
    TlsConfig tlsConfig,
    String uri,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'type': type?.toValue() ?? '',
      if (cacheKeyParameters != null) 'cacheKeyParameters': cacheKeyParameters,
      if (cacheNamespace != null) 'cacheNamespace': cacheNamespace,
      if (connectionId != null) 'connectionId': connectionId,
      if (connectionType != null) 'connectionType': connectionType.toValue(),
      if (contentHandling != null) 'contentHandling': contentHandling.toValue(),
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] Specifies a put integration response request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// [Required] Specifies a put integration response request's resource
  /// identifier.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [statusCode] :
  /// [Required] Specifies the status code that is used to map the integration
  /// response to an existing <a>MethodResponse</a>.
  ///
  /// Parameter [contentHandling] :
  /// Specifies how to handle response payload content type conversions.
  /// Supported values are <code>CONVERT_TO_BINARY</code> and
  /// <code>CONVERT_TO_TEXT</code>, with the following behaviors:
  ///
  /// <ul>
  /// <li>
  /// <code>CONVERT_TO_BINARY</code>: Converts a response payload from a
  /// Base64-encoded string to the corresponding binary blob.
  /// </li>
  /// <li>
  /// <code>CONVERT_TO_TEXT</code>: Converts a response payload from a binary
  /// blob to a Base64-encoded string.
  /// </li>
  /// </ul>
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
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    @_s.required String statusCode,
    ContentHandlingStrategy contentHandling,
    Map<String, String> responseParameters,
    Map<String, String> responseTemplates,
    String selectionPattern,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(statusCode, 'statusCode');
    _s.validateStringPattern(
      'statusCode',
      statusCode,
      r'''[1-5]\d\d''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (contentHandling != null) 'contentHandling': contentHandling.toValue(),
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

  /// Add a method to an existing <a>Resource</a> resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authorizationType] :
  /// [Required] The method's authorization type. Valid values are
  /// <code>NONE</code> for open access, <code>AWS_IAM</code> for using AWS IAM
  /// permissions, <code>CUSTOM</code> for using a custom authorizer, or
  /// <code>COGNITO_USER_POOLS</code> for using a Cognito user pool.
  ///
  /// Parameter [httpMethod] :
  /// [Required] Specifies the method request's HTTP method type.
  ///
  /// Parameter [resourceId] :
  /// [Required] The <a>Resource</a> identifier for the new <a>Method</a>
  /// resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [apiKeyRequired] :
  /// Specifies whether the method required a valid <a>ApiKey</a>.
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
  /// Specifies the identifier of an <a>Authorizer</a> to use on this Method, if
  /// the type is CUSTOM or COGNITO_USER_POOLS. The authorizer identifier is
  /// generated by API Gateway when you created the authorizer.
  ///
  /// Parameter [operationName] :
  /// A human-friendly operation identifier for the method. For example, you can
  /// assign the <code>operationName</code> of <code>ListPets</code> for the
  /// <code>GET /pets</code> method in the <code>PetStore</code> example.
  ///
  /// Parameter [requestModels] :
  /// Specifies the <a>Model</a> resources used for the request's content type.
  /// Request models are represented as a key/value map, with a content type as
  /// the key and a <a>Model</a> name as the value.
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
  /// method request parameter names defined here are available in
  /// <a>Integration</a> to be mapped to integration request parameters or
  /// body-mapping templates.
  ///
  /// Parameter [requestValidatorId] :
  /// The identifier of a <a>RequestValidator</a> for validating the method
  /// request.
  Future<Method> putMethod({
    @_s.required String authorizationType,
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    bool apiKeyRequired,
    List<String> authorizationScopes,
    String authorizerId,
    String operationName,
    Map<String, String> requestModels,
    Map<String, bool> requestParameters,
    String requestValidatorId,
  }) async {
    ArgumentError.checkNotNull(authorizationType, 'authorizationType');
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Adds a <a>MethodResponse</a> to an existing <a>Method</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] The HTTP verb of the <a>Method</a> resource.
  ///
  /// Parameter [resourceId] :
  /// [Required] The <a>Resource</a> identifier for the <a>Method</a> resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [statusCode] :
  /// [Required] The method response's status code.
  ///
  /// Parameter [responseModels] :
  /// Specifies the <a>Model</a> resources used for the response's content type.
  /// Response models are represented as a key/value map, with a content type as
  /// the key and a <a>Model</a> name as the value.
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
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    @_s.required String statusCode,
    Map<String, String> responseModels,
    Map<String, bool> responseParameters,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(statusCode, 'statusCode');
    _s.validateStringPattern(
      'statusCode',
      statusCode,
      r'''[1-5]\d\d''',
      isRequired: true,
    );
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
  /// May throw [UnauthorizedException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [body] :
  /// [Required] The PUT request body containing external API definitions.
  /// Currently, only OpenAPI definition JSON/YAML files are supported. The
  /// maximum size of the API definition file is 6MB.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
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
  /// <a>DocumentationParts</a> from an imported API, set
  /// <code>ignore=documentation</code> as a <code>parameters</code> value, as
  /// in the AWS CLI command of <code>aws apigateway import-rest-api
  /// --parameters ignore=documentation --body
  /// 'file:///path/to/imported-api-body.json'</code>.
  Future<RestApi> putRestApi({
    @_s.required Uint8List body,
    @_s.required String restApiId,
    bool failOnWarnings,
    PutMode mode,
    Map<String, String> parameters,
  }) async {
    ArgumentError.checkNotNull(body, 'body');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final $query = <String, List<String>>{
      if (failOnWarnings != null) 'failonwarnings': [failOnWarnings.toString()],
      if (mode != null) 'mode': [mode.toValue()],
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
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// [Required] The ARN of a resource that can be tagged.
  ///
  /// Parameter [tags] :
  /// [Required] The key-value map of strings. The valid character set is
  /// [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not
  /// start with <code>aws:</code>. The tag value can be up to 256 characters.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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

  /// Simulate the execution of an <a>Authorizer</a> in your <a>RestApi</a> with
  /// headers, parameters, and an incoming request body.
  /// <div class="seeAlso"> <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-use-lambda-authorizer.html">Use
  /// Lambda Function as Authorizer</a> <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-integrate-with-cognito.html">Use
  /// Cognito User Pool as Authorizer</a> </div>
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authorizerId] :
  /// [Required] Specifies a test invoke authorizer request's <a>Authorizer</a>
  /// ID.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [additionalContext] :
  /// [Optional] A key-value map of additional context variables.
  ///
  /// Parameter [body] :
  /// [Optional] The simulated request body of an incoming invocation request.
  ///
  /// Parameter [headers] :
  /// [Required] A key-value map of headers to simulate an incoming invocation
  /// request. This is where the incoming authorization token, or identity
  /// source, should be specified.
  ///
  /// Parameter [multiValueHeaders] :
  /// [Optional] The headers as a map from string to list of values to simulate
  /// an incoming invocation request. This is where the incoming authorization
  /// token, or identity source, may be specified.
  ///
  /// Parameter [pathWithQueryString] :
  /// [Optional] The URI path, including query string, of the simulated
  /// invocation request. Use this to specify path parameters and query string
  /// parameters.
  ///
  /// Parameter [stageVariables] :
  /// A key-value map of stage variables to simulate an invocation on a deployed
  /// <a>Stage</a>.
  Future<TestInvokeAuthorizerResponse> testInvokeAuthorizer({
    @_s.required String authorizerId,
    @_s.required String restApiId,
    Map<String, String> additionalContext,
    String body,
    Map<String, String> headers,
    Map<String, List<String>> multiValueHeaders,
    String pathWithQueryString,
    Map<String, String> stageVariables,
  }) async {
    ArgumentError.checkNotNull(authorizerId, 'authorizerId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Simulate the execution of a <a>Method</a> in your <a>RestApi</a> with
  /// headers, parameters, and an incoming request body.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] Specifies a test invoke method request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// [Required] Specifies a test invoke method request's resource ID.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [body] :
  /// The simulated request body of an incoming invocation request.
  ///
  /// Parameter [clientCertificateId] :
  /// A <a>ClientCertificate</a> identifier to use in the test invocation. API
  /// Gateway will use the certificate when making the HTTPS request to the
  /// defined back-end endpoint.
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
  /// <a>Stage</a>.
  Future<TestInvokeMethodResponse> testInvokeMethod({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    String body,
    String clientCertificateId,
    Map<String, String> headers,
    Map<String, List<String>> multiValueHeaders,
    String pathWithQueryString,
    Map<String, String> stageVariables,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// [Required] The ARN of a resource that can be tagged.
  ///
  /// Parameter [tagKeys] :
  /// [Required] The Tag keys to delete.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Changes information about the current <a>Account</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<Account> updateAccount({
    List<PatchOperation> patchOperations,
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

  /// Changes information about an <a>ApiKey</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiKey] :
  /// [Required] The identifier of the <a>ApiKey</a> resource to be updated.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<ApiKey> updateApiKey({
    @_s.required String apiKey,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(apiKey, 'apiKey');
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

  /// Updates an existing <a>Authorizer</a> resource.
  /// <div class="seeAlso"><a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/update-authorizer.html">AWS
  /// CLI</a></div>
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authorizerId] :
  /// [Required] The identifier of the <a>Authorizer</a> resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<Authorizer> updateAuthorizer({
    @_s.required String authorizerId,
    @_s.required String restApiId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(authorizerId, 'authorizerId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Changes information about the <a>BasePathMapping</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [basePath] :
  /// [Required] The base path of the <a>BasePathMapping</a> resource to change.
  ///
  /// To specify an empty base path, set this parameter to
  /// <code>'(none)'</code>.
  ///
  /// Parameter [domainName] :
  /// [Required] The domain name of the <a>BasePathMapping</a> resource to
  /// change.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<BasePathMapping> updateBasePathMapping({
    @_s.required String basePath,
    @_s.required String domainName,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(basePath, 'basePath');
    ArgumentError.checkNotNull(domainName, 'domainName');
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

  /// Changes information about an <a>ClientCertificate</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [clientCertificateId] :
  /// [Required] The identifier of the <a>ClientCertificate</a> resource to be
  /// updated.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<ClientCertificate> updateClientCertificate({
    @_s.required String clientCertificateId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(clientCertificateId, 'clientCertificateId');
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

  /// Changes information about a <a>Deployment</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [deploymentId] :
  /// The replacement identifier for the <a>Deployment</a> resource to change
  /// information about.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<Deployment> updateDeployment({
    @_s.required String deploymentId,
    @_s.required String restApiId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationPartId] :
  /// [Required] The identifier of the to-be-updated documentation part.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<DocumentationPart> updateDocumentationPart({
    @_s.required String documentationPartId,
    @_s.required String restApiId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(documentationPartId, 'documentationPartId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [documentationVersion] :
  /// [Required] The version identifier of the to-be-updated documentation
  /// version.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>..
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<DocumentationVersion> updateDocumentationVersion({
    @_s.required String documentationVersion,
    @_s.required String restApiId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(documentationVersion, 'documentationVersion');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Changes information about the <a>DomainName</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// [Required] The name of the <a>DomainName</a> resource to be changed.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<DomainName> updateDomainName({
    @_s.required String domainName,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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

  /// Updates a <a>GatewayResponse</a> of a specified response type on the given
  /// <a>RestApi</a>.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [responseType] :
  /// [Required]
  /// The response type of the associated <a>GatewayResponse</a>. Valid values
  /// are
  /// <ul>
  /// <li>ACCESS_DENIED</li>
  /// <li>API_CONFIGURATION_ERROR</li>
  /// <li>AUTHORIZER_FAILURE</li>
  /// <li> AUTHORIZER_CONFIGURATION_ERROR</li>
  /// <li>BAD_REQUEST_PARAMETERS</li>
  /// <li>BAD_REQUEST_BODY</li>
  /// <li>DEFAULT_4XX</li>
  /// <li>DEFAULT_5XX</li>
  /// <li>EXPIRED_TOKEN</li>
  /// <li>INVALID_SIGNATURE</li>
  /// <li>INTEGRATION_FAILURE</li>
  /// <li>INTEGRATION_TIMEOUT</li>
  /// <li>INVALID_API_KEY</li>
  /// <li>MISSING_AUTHENTICATION_TOKEN</li>
  /// <li> QUOTA_EXCEEDED</li>
  /// <li>REQUEST_TOO_LARGE</li>
  /// <li>RESOURCE_NOT_FOUND</li>
  /// <li>THROTTLED</li>
  /// <li>UNAUTHORIZED</li>
  /// <li>UNSUPPORTED_MEDIA_TYPE</li>
  /// </ul>
  ///
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<GatewayResponse> updateGatewayResponse({
    @_s.required GatewayResponseType responseType,
    @_s.required String restApiId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(responseType, 'responseType');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    final $payload = <String, dynamic>{
      if (patchOperations != null) 'patchOperations': patchOperations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/restapis/${Uri.encodeComponent(restApiId)}/gatewayresponses/${Uri.encodeComponent(responseType.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return GatewayResponse.fromJson(response);
  }

  /// Represents an update integration.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] Represents an update integration request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// [Required] Represents an update integration request's resource identifier.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<Integration> updateIntegration({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] Specifies an update integration response request's HTTP method.
  ///
  /// Parameter [resourceId] :
  /// [Required] Specifies an update integration response request's resource
  /// identifier.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [statusCode] :
  /// [Required] Specifies an update integration response request's status code.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<IntegrationResponse> updateIntegrationResponse({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    @_s.required String statusCode,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(statusCode, 'statusCode');
    _s.validateStringPattern(
      'statusCode',
      statusCode,
      r'''[1-5]\d\d''',
      isRequired: true,
    );
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

  /// Updates an existing <a>Method</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] The HTTP verb of the <a>Method</a> resource.
  ///
  /// Parameter [resourceId] :
  /// [Required] The <a>Resource</a> identifier for the <a>Method</a> resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<Method> updateMethod({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Updates an existing <a>MethodResponse</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [httpMethod] :
  /// [Required] The HTTP verb of the <a>Method</a> resource.
  ///
  /// Parameter [resourceId] :
  /// [Required] The <a>Resource</a> identifier for the <a>MethodResponse</a>
  /// resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [statusCode] :
  /// [Required] The status code for the <a>MethodResponse</a> resource.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<MethodResponse> updateMethodResponse({
    @_s.required String httpMethod,
    @_s.required String resourceId,
    @_s.required String restApiId,
    @_s.required String statusCode,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(httpMethod, 'httpMethod');
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(statusCode, 'statusCode');
    _s.validateStringPattern(
      'statusCode',
      statusCode,
      r'''[1-5]\d\d''',
      isRequired: true,
    );
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

  /// Changes information about a model.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [modelName] :
  /// [Required] The name of the model to update.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<Model> updateModel({
    @_s.required String modelName,
    @_s.required String restApiId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(modelName, 'modelName');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Updates a <a>RequestValidator</a> of a given <a>RestApi</a>.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [requestValidatorId] :
  /// [Required] The identifier of <a>RequestValidator</a> to be updated.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<RequestValidator> updateRequestValidator({
    @_s.required String requestValidatorId,
    @_s.required String restApiId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(requestValidatorId, 'requestValidatorId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Changes information about a <a>Resource</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceId] :
  /// [Required] The identifier of the <a>Resource</a> resource.
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<Resource> updateResource({
    @_s.required String resourceId,
    @_s.required String restApiId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<RestApi> updateRestApi({
    @_s.required String restApiId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
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

  /// Changes information about a <a>Stage</a> resource.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [restApiId] :
  /// [Required] The string identifier of the associated <a>RestApi</a>.
  ///
  /// Parameter [stageName] :
  /// [Required] The name of the <a>Stage</a> resource to change information
  /// about.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<Stage> updateStage({
    @_s.required String restApiId,
    @_s.required String stageName,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(restApiId, 'restApiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
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
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [keyId] :
  /// [Required] The identifier of the API key associated with the usage plan in
  /// which a temporary extension is granted to the remaining quota.
  ///
  /// Parameter [usagePlanId] :
  /// [Required] The Id of the usage plan associated with the usage data.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<Usage> updateUsage({
    @_s.required String keyId,
    @_s.required String usagePlanId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(keyId, 'keyId');
    ArgumentError.checkNotNull(usagePlanId, 'usagePlanId');
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
  /// May throw [UnauthorizedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [usagePlanId] :
  /// [Required] The Id of the to-be-updated usage plan.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<UsagePlan> updateUsagePlan({
    @_s.required String usagePlanId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(usagePlanId, 'usagePlanId');
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

  /// Updates an existing <a>VpcLink</a> of a specified identifier.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [vpcLinkId] :
  /// [Required] The identifier of the <a>VpcLink</a>. It is used in an
  /// <a>Integration</a> to reference this <a>VpcLink</a>.
  ///
  /// Parameter [patchOperations] :
  /// A list of update operations to be applied to the specified resource and in
  /// the order specified in this list.
  Future<VpcLink> updateVpcLink({
    @_s.required String vpcLinkId,
    List<PatchOperation> patchOperations,
  }) async {
    ArgumentError.checkNotNull(vpcLinkId, 'vpcLinkId');
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccessLogSettings {
  /// The Amazon Resource Name (ARN) of the CloudWatch Logs log group or Kinesis
  /// Data Firehose delivery stream to receive access logs. If you specify a
  /// Kinesis Data Firehose delivery stream, the stream name must begin with
  /// <code>amazon-apigateway-</code>.
  @_s.JsonKey(name: 'destinationArn')
  final String destinationArn;

  /// A single line format of the access logs of data, as specified by selected <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-mapping-template-reference.html#context-variable-reference">$context
  /// variables</a>. The format must include at least
  /// <code>$context.requestId</code>.
  @_s.JsonKey(name: 'format')
  final String format;

  AccessLogSettings({
    this.destinationArn,
    this.format,
  });
  factory AccessLogSettings.fromJson(Map<String, dynamic> json) =>
      _$AccessLogSettingsFromJson(json);
}

/// Represents an AWS account that is associated with API Gateway.
/// <div class="remarks">
/// To view the account info, call <code>GET</code> on this resource.
/// <h4>Error Codes</h4>
/// The following exception may be thrown when the request fails.
///
/// <ul>
/// <li>UnauthorizedException</li>
/// <li>NotFoundException</li>
/// <li>TooManyRequestsException</li>
/// </ul>
/// For detailed error code information, including the corresponding HTTP Status
/// Codes, see <a
/// href="https://docs.aws.amazon.com/apigateway/api-reference/handling-errors/#api-error-codes">API
/// Gateway Error Codes</a>
/// <h4>Example: Get the information about an account.</h4> <h5>Request</h5>
/// <pre><code>GET /account HTTP/1.1 Content-Type: application/json Host:
/// apigateway.us-east-1.amazonaws.com X-Amz-Date: 20160531T184618Z
/// Authorization: AWS4-HMAC-SHA256
/// Credential={access_key_ID}/us-east-1/apigateway/aws4_request,
/// SignedHeaders=content-type;host;x-amz-date, Signature={sig4_hash}
/// </code></pre> <h5>Response</h5>
/// The successful response returns a <code>200 OK</code> status code and a
/// payload similar to the following:
/// <pre><code>{ "_links": { "curies": { "href":
/// "https://docs.aws.amazon.com/apigateway/latest/developerguide/account-apigateway-{rel}.html",
/// "name": "account", "templated": true }, "self": { "href": "/account" },
/// "account:update": { "href": "/account" } }, "cloudwatchRoleArn":
/// "arn:aws:iam::123456789012:role/apigAwsProxyRole", "throttleSettings": {
/// "rateLimit": 500, "burstLimit": 1000 } } </code></pre>
/// In addition to making the REST API call directly, you can use the AWS CLI
/// and an AWS SDK to access this resource.
/// </div> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-limits.html">API
/// Gateway Limits</a> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/welcome.html">Developer
/// Guide</a>, <a
/// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-account.html">AWS
/// CLI</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Account {
  /// The version of the API keys used for the account.
  @_s.JsonKey(name: 'apiKeyVersion')
  final String apiKeyVersion;

  /// The ARN of an Amazon CloudWatch role for the current <a>Account</a>.
  @_s.JsonKey(name: 'cloudwatchRoleArn')
  final String cloudwatchRoleArn;

  /// A list of features supported for the account. When usage plans are enabled,
  /// the features list will include an entry of <code>"UsagePlans"</code>.
  @_s.JsonKey(name: 'features')
  final List<String> features;

  /// Specifies the API request limits configured for the current <a>Account</a>.
  @_s.JsonKey(name: 'throttleSettings')
  final ThrottleSettings throttleSettings;

  Account({
    this.apiKeyVersion,
    this.cloudwatchRoleArn,
    this.features,
    this.throttleSettings,
  });
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

/// A resource that can be distributed to callers for executing <a>Method</a>
/// resources that require an API key. API keys can be mapped to any
/// <a>Stage</a> on any <a>RestApi</a>, which indicates that the callers with
/// the API key can make requests to that stage.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-api-keys.html">Use
/// API Keys</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApiKey {
  /// The timestamp when the API Key was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// An AWS Marketplace customer identifier , when integrating with the AWS SaaS
  /// Marketplace.
  @_s.JsonKey(name: 'customerId')
  final String customerId;

  /// The description of the API Key.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies whether the API Key can be used by callers.
  @_s.JsonKey(name: 'enabled')
  final bool enabled;

  /// The identifier of the API Key.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The timestamp when the API Key was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// The name of the API Key.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of <a>Stage</a> resources that are associated with the <a>ApiKey</a>
  /// resource.
  @_s.JsonKey(name: 'stageKeys')
  final List<String> stageKeys;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The value of the API Key.
  @_s.JsonKey(name: 'value')
  final String value;

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
  factory ApiKey.fromJson(Map<String, dynamic> json) => _$ApiKeyFromJson(json);
}

/// The identifier of an <a>ApiKey</a> used in a <a>UsagePlan</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApiKeyIds {
  /// A list of all the <a>ApiKey</a> identifiers.
  @_s.JsonKey(name: 'ids')
  final List<String> ids;

  /// A list of warning messages.
  @_s.JsonKey(name: 'warnings')
  final List<String> warnings;

  ApiKeyIds({
    this.ids,
    this.warnings,
  });
  factory ApiKeyIds.fromJson(Map<String, dynamic> json) =>
      _$ApiKeyIdsFromJson(json);
}

enum ApiKeySourceType {
  @_s.JsonValue('HEADER')
  header,
  @_s.JsonValue('AUTHORIZER')
  authorizer,
}

extension on ApiKeySourceType {
  String toValue() {
    switch (this) {
      case ApiKeySourceType.header:
        return 'HEADER';
      case ApiKeySourceType.authorizer:
        return 'AUTHORIZER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents a collection of API keys as represented by an <a>ApiKeys</a>
/// resource.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-api-keys.html">Use
/// API Keys</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApiKeys {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<ApiKey> items;
  @_s.JsonKey(name: 'position')
  final String position;

  /// A list of warning messages logged during the import of API keys when the
  /// <code>failOnWarnings</code> option is set to true.
  @_s.JsonKey(name: 'warnings')
  final List<String> warnings;

  ApiKeys({
    this.items,
    this.position,
    this.warnings,
  });
  factory ApiKeys.fromJson(Map<String, dynamic> json) =>
      _$ApiKeysFromJson(json);
}

enum ApiKeysFormat {
  @_s.JsonValue('csv')
  csv,
}

extension on ApiKeysFormat {
  String toValue() {
    switch (this) {
      case ApiKeysFormat.csv:
        return 'csv';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// API stage name of the associated API stage in a usage plan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ApiStage {
  /// API Id of the associated API stage in a usage plan.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// API stage name of the associated API stage in a usage plan.
  @_s.JsonKey(name: 'stage')
  final String stage;

  /// Map containing method level throttling information for API stage in a usage
  /// plan.
  @_s.JsonKey(name: 'throttle')
  final Map<String, ThrottleSettings> throttle;

  ApiStage({
    this.apiId,
    this.stage,
    this.throttle,
  });
  factory ApiStage.fromJson(Map<String, dynamic> json) =>
      _$ApiStageFromJson(json);

  Map<String, dynamic> toJson() => _$ApiStageToJson(this);
}

/// Represents an authorization layer for methods. If enabled on a method, API
/// Gateway will activate the authorizer when a client calls the method.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-use-lambda-authorizer.html">Use
/// Lambda Function as Authorizer</a> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-integrate-with-cognito.html">Use
/// Cognito User Pool as Authorizer</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Authorizer {
  /// Optional customer-defined field, used in OpenAPI imports and exports without
  /// functional impact.
  @_s.JsonKey(name: 'authType')
  final String authType;

  /// Specifies the required credentials as an IAM role for API Gateway to invoke
  /// the authorizer. To specify an IAM role for API Gateway to assume, use the
  /// role's Amazon Resource Name (ARN). To use resource-based permissions on the
  /// Lambda function, specify null.
  @_s.JsonKey(name: 'authorizerCredentials')
  final String authorizerCredentials;

  /// The TTL in seconds of cached authorizer results. If it equals 0,
  /// authorization caching is disabled. If it is greater than 0, API Gateway will
  /// cache authorizer responses. If this field is not set, the default value is
  /// 300. The maximum value is 3600, or 1 hour.
  @_s.JsonKey(name: 'authorizerResultTtlInSeconds')
  final int authorizerResultTtlInSeconds;

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
  @_s.JsonKey(name: 'authorizerUri')
  final String authorizerUri;

  /// The identifier for the authorizer resource.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The identity source for which authorization is requested.
  /// <ul>
  /// <li>For a <code>TOKEN</code> or <code>COGNITO_USER_POOLS</code> authorizer,
  /// this is required and specifies the request header mapping expression for the
  /// custom header holding the authorization token submitted by the client. For
  /// example, if the token header name is <code>Auth</code>, the header mapping
  /// expression is <code>method.request.header.Auth</code>.</li>
  /// <li>For the <code>REQUEST</code> authorizer, this is required when
  /// authorization caching is enabled. The value is a comma-separated string of
  /// one or more mapping expressions of the specified request parameters. For
  /// example, if an <code>Auth</code> header, a <code>Name</code> query string
  /// parameter are defined as identity sources, this value is
  /// <code>method.request.header.Auth, method.request.querystring.Name</code>.
  /// These parameters will be used to derive the authorization caching key and to
  /// perform runtime validation of the <code>REQUEST</code> authorizer by
  /// verifying all of the identity-related request parameters are present, not
  /// null and non-empty. Only when this is true does the authorizer invoke the
  /// authorizer Lambda function, otherwise, it returns a 401 Unauthorized
  /// response without calling the Lambda function. The valid value is a string of
  /// comma-separated mapping expressions of the specified request parameters.
  /// When the authorization caching is not enabled, this property is
  /// optional.</li>
  /// </ul>
  @_s.JsonKey(name: 'identitySource')
  final String identitySource;

  /// A validation expression for the incoming identity token. For
  /// <code>TOKEN</code> authorizers, this value is a regular expression. For
  /// <code>COGNITO_USER_POOLS</code> authorizers, API Gateway will match the
  /// <code>aud</code> field of the incoming token from the client against the
  /// specified regular expression. It will invoke the authorizer's Lambda
  /// function when there is a match. Otherwise, it will return a 401 Unauthorized
  /// response without calling the Lambda function. The validation expression does
  /// not apply to the <code>REQUEST</code> authorizer.
  @_s.JsonKey(name: 'identityValidationExpression')
  final String identityValidationExpression;

  /// [Required] The name of the authorizer.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of the Amazon Cognito user pool ARNs for the
  /// <code>COGNITO_USER_POOLS</code> authorizer. Each element is of this format:
  /// <code>arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}</code>.
  /// For a <code>TOKEN</code> or <code>REQUEST</code> authorizer, this is not
  /// defined.
  @_s.JsonKey(name: 'providerARNs')
  final List<String> providerARNs;

  /// The authorizer type. Valid values are <code>TOKEN</code> for a Lambda
  /// function using a single authorization token submitted in a custom header,
  /// <code>REQUEST</code> for a Lambda function using incoming request
  /// parameters, and <code>COGNITO_USER_POOLS</code> for using an Amazon Cognito
  /// user pool.
  @_s.JsonKey(name: 'type')
  final AuthorizerType type;

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
  factory Authorizer.fromJson(Map<String, dynamic> json) =>
      _$AuthorizerFromJson(json);
}

/// The authorizer type. Valid values are <code>TOKEN</code> for a Lambda
/// function using a single authorization token submitted in a custom header,
/// <code>REQUEST</code> for a Lambda function using incoming request
/// parameters, and <code>COGNITO_USER_POOLS</code> for using an Amazon Cognito
/// user pool.
enum AuthorizerType {
  @_s.JsonValue('TOKEN')
  token,
  @_s.JsonValue('REQUEST')
  request,
  @_s.JsonValue('COGNITO_USER_POOLS')
  cognitoUserPools,
}

extension on AuthorizerType {
  String toValue() {
    switch (this) {
      case AuthorizerType.token:
        return 'TOKEN';
      case AuthorizerType.request:
        return 'REQUEST';
      case AuthorizerType.cognitoUserPools:
        return 'COGNITO_USER_POOLS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents a collection of <a>Authorizer</a> resources.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-use-lambda-authorizer.html">Use
/// Lambda Function as Authorizer</a> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-integrate-with-cognito.html">Use
/// Cognito User Pool as Authorizer</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Authorizers {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<Authorizer> items;
  @_s.JsonKey(name: 'position')
  final String position;

  Authorizers({
    this.items,
    this.position,
  });
  factory Authorizers.fromJson(Map<String, dynamic> json) =>
      _$AuthorizersFromJson(json);
}

/// Represents the base path that callers of the API must provide as part of the
/// URL after the domain name.
/// <div class="remarks">A custom domain name plus a
/// <code>BasePathMapping</code> specification identifies a deployed
/// <a>RestApi</a> in a given stage of the owner <a>Account</a>.</div> <div
/// class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-custom-domains.html">Use
/// Custom Domain Names</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BasePathMapping {
  /// The base path name that callers of the API must provide as part of the URL
  /// after the domain name.
  @_s.JsonKey(name: 'basePath')
  final String basePath;

  /// The string identifier of the associated <a>RestApi</a>.
  @_s.JsonKey(name: 'restApiId')
  final String restApiId;

  /// The name of the associated stage.
  @_s.JsonKey(name: 'stage')
  final String stage;

  BasePathMapping({
    this.basePath,
    this.restApiId,
    this.stage,
  });
  factory BasePathMapping.fromJson(Map<String, dynamic> json) =>
      _$BasePathMappingFromJson(json);
}

/// Represents a collection of <a>BasePathMapping</a> resources.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-custom-domains.html">Use
/// Custom Domain Names</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BasePathMappings {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<BasePathMapping> items;
  @_s.JsonKey(name: 'position')
  final String position;

  BasePathMappings({
    this.items,
    this.position,
  });
  factory BasePathMappings.fromJson(Map<String, dynamic> json) =>
      _$BasePathMappingsFromJson(json);
}

/// Returns the size of the <b>CacheCluster</b>.
enum CacheClusterSize {
  @_s.JsonValue('0.5')
  $0_5,
  @_s.JsonValue('1.6')
  $1_6,
  @_s.JsonValue('6.1')
  $6_1,
  @_s.JsonValue('13.5')
  $13_5,
  @_s.JsonValue('28.4')
  $28_4,
  @_s.JsonValue('58.2')
  $58_2,
  @_s.JsonValue('118')
  $118,
  @_s.JsonValue('237')
  $237,
}

extension on CacheClusterSize {
  String toValue() {
    switch (this) {
      case CacheClusterSize.$0_5:
        return '0.5';
      case CacheClusterSize.$1_6:
        return '1.6';
      case CacheClusterSize.$6_1:
        return '6.1';
      case CacheClusterSize.$13_5:
        return '13.5';
      case CacheClusterSize.$28_4:
        return '28.4';
      case CacheClusterSize.$58_2:
        return '58.2';
      case CacheClusterSize.$118:
        return '118';
      case CacheClusterSize.$237:
        return '237';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Returns the status of the <b>CacheCluster</b>.
enum CacheClusterStatus {
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETE_IN_PROGRESS')
  deleteInProgress,
  @_s.JsonValue('NOT_AVAILABLE')
  notAvailable,
  @_s.JsonValue('FLUSH_IN_PROGRESS')
  flushInProgress,
}

/// Configuration settings of a canary deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CanarySettings {
  /// The ID of the canary deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The percent (0-100) of traffic diverted to a canary deployment.
  @_s.JsonKey(name: 'percentTraffic')
  final double percentTraffic;

  /// Stage variables overridden for a canary release deployment, including new
  /// stage variables introduced in the canary. These stage variables are
  /// represented as a string-to-string map between stage variable names and their
  /// values.
  @_s.JsonKey(name: 'stageVariableOverrides')
  final Map<String, String> stageVariableOverrides;

  /// A Boolean flag to indicate whether the canary deployment uses the stage
  /// cache or not.
  @_s.JsonKey(name: 'useStageCache')
  final bool useStageCache;

  CanarySettings({
    this.deploymentId,
    this.percentTraffic,
    this.stageVariableOverrides,
    this.useStageCache,
  });
  factory CanarySettings.fromJson(Map<String, dynamic> json) =>
      _$CanarySettingsFromJson(json);

  Map<String, dynamic> toJson() => _$CanarySettingsToJson(this);
}

/// Represents a client certificate used to configure client-side SSL
/// authentication while sending requests to the integration endpoint.
/// <div class="remarks">Client certificates are used to authenticate an API by
/// the backend server. To authenticate an API client (or user), use IAM roles
/// and policies, a custom <a>Authorizer</a> or an Amazon Cognito user
/// pool.</div> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-client-side-ssl-authentication.html">Use
/// Client-Side Certificate</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClientCertificate {
  /// The identifier of the client certificate.
  @_s.JsonKey(name: 'clientCertificateId')
  final String clientCertificateId;

  /// The timestamp when the client certificate was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The description of the client certificate.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The timestamp when the client certificate will expire.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expirationDate')
  final DateTime expirationDate;

  /// The PEM-encoded public key of the client certificate, which can be used to
  /// configure certificate authentication in the integration endpoint .
  @_s.JsonKey(name: 'pemEncodedCertificate')
  final String pemEncodedCertificate;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ClientCertificate({
    this.clientCertificateId,
    this.createdDate,
    this.description,
    this.expirationDate,
    this.pemEncodedCertificate,
    this.tags,
  });
  factory ClientCertificate.fromJson(Map<String, dynamic> json) =>
      _$ClientCertificateFromJson(json);
}

/// Represents a collection of <a>ClientCertificate</a> resources.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-client-side-ssl-authentication.html">Use
/// Client-Side Certificate</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClientCertificates {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<ClientCertificate> items;
  @_s.JsonKey(name: 'position')
  final String position;

  ClientCertificates({
    this.items,
    this.position,
  });
  factory ClientCertificates.fromJson(Map<String, dynamic> json) =>
      _$ClientCertificatesFromJson(json);
}

enum ConnectionType {
  @_s.JsonValue('INTERNET')
  internet,
  @_s.JsonValue('VPC_LINK')
  vpcLink,
}

extension on ConnectionType {
  String toValue() {
    switch (this) {
      case ConnectionType.internet:
        return 'INTERNET';
      case ConnectionType.vpcLink:
        return 'VPC_LINK';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ContentHandlingStrategy {
  @_s.JsonValue('CONVERT_TO_BINARY')
  convertToBinary,
  @_s.JsonValue('CONVERT_TO_TEXT')
  convertToText,
}

extension on ContentHandlingStrategy {
  String toValue() {
    switch (this) {
      case ContentHandlingStrategy.convertToBinary:
        return 'CONVERT_TO_BINARY';
      case ContentHandlingStrategy.convertToText:
        return 'CONVERT_TO_TEXT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An immutable representation of a <a>RestApi</a> resource that can be called
/// by users using <a>Stages</a>. A deployment must be associated with a
/// <a>Stage</a> for it to be callable over the Internet.
/// <div class="remarks">To create a deployment, call <code>POST</code> on the
/// <a>Deployments</a> resource of a <a>RestApi</a>. To view, update, or delete
/// a deployment, call <code>GET</code>, <code>PATCH</code>, or
/// <code>DELETE</code> on the specified deployment resource
/// (<code>/restapis/{restapi_id}/deployments/{deployment_id}</code>).</div>
/// <div class="seeAlso"><a>RestApi</a>, <a>Deployments</a>, <a>Stage</a>, <a
/// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-deployment.html">AWS
/// CLI</a>, <a href="https://aws.amazon.com/tools/">AWS SDKs</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Deployment {
  /// A summary of the <a>RestApi</a> at the date and time that the deployment
  /// resource was created.
  @_s.JsonKey(name: 'apiSummary')
  final Map<String, Map<String, MethodSnapshot>> apiSummary;

  /// The date and time that the deployment resource was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The description for the deployment resource.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The identifier for the deployment resource.
  @_s.JsonKey(name: 'id')
  final String id;

  Deployment({
    this.apiSummary,
    this.createdDate,
    this.description,
    this.id,
  });
  factory Deployment.fromJson(Map<String, dynamic> json) =>
      _$DeploymentFromJson(json);
}

/// The input configuration for a canary deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeploymentCanarySettings {
  /// The percentage (0.0-100.0) of traffic routed to the canary deployment.
  @_s.JsonKey(name: 'percentTraffic')
  final double percentTraffic;

  /// A stage variable overrides used for the canary release deployment. They can
  /// override existing stage variables or add new stage variables for the canary
  /// release deployment. These stage variables are represented as a
  /// string-to-string map between stage variable names and their values.
  @_s.JsonKey(name: 'stageVariableOverrides')
  final Map<String, String> stageVariableOverrides;

  /// A Boolean flag to indicate whether the canary release deployment uses the
  /// stage cache or not.
  @_s.JsonKey(name: 'useStageCache')
  final bool useStageCache;

  DeploymentCanarySettings({
    this.percentTraffic,
    this.stageVariableOverrides,
    this.useStageCache,
  });
  Map<String, dynamic> toJson() => _$DeploymentCanarySettingsToJson(this);
}

/// Represents a collection resource that contains zero or more references to
/// your existing deployments, and links that guide you on how to interact with
/// your collection. The collection offers a paginated view of the contained
/// deployments.
/// <div class="remarks">To create a new deployment of a <a>RestApi</a>, make a
/// <code>POST</code> request against this resource. To view, update, or delete
/// an existing deployment, make a <code>GET</code>, <code>PATCH</code>, or
/// <code>DELETE</code> request, respectively, on a specified <a>Deployment</a>
/// resource.</div> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-deploy-api.html">Deploying
/// an API</a>, <a
/// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-deployment.html">AWS
/// CLI</a>, <a href="https://aws.amazon.com/tools/">AWS SDKs</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Deployments {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<Deployment> items;
  @_s.JsonKey(name: 'position')
  final String position;

  Deployments({
    this.items,
    this.position,
  });
  factory Deployments.fromJson(Map<String, dynamic> json) =>
      _$DeploymentsFromJson(json);
}

/// A documentation part for a targeted API entity.
/// <div class="remarks">
/// A documentation part consists of a content map (<code>properties</code>) and
/// a target (<code>location</code>). The target specifies an API entity to
/// which the documentation content applies. The supported API entity types are
/// <code>API</code>, <code>AUTHORIZER</code>, <code>MODEL</code>,
/// <code>RESOURCE</code>, <code>METHOD</code>, <code>PATH_PARAMETER</code>,
/// <code>QUERY_PARAMETER</code>, <code>REQUEST_HEADER</code>,
/// <code>REQUEST_BODY</code>, <code>RESPONSE</code>,
/// <code>RESPONSE_HEADER</code>, and <code>RESPONSE_BODY</code>. Valid
/// <code>location</code> fields depend on the API entity type. All valid fields
/// are not required.
///
/// The content map is a JSON string of API-specific key-value pairs. Although
/// an API can use any shape for the content map, only the OpenAPI-compliant
/// documentation fields will be injected into the associated API entity
/// definition in the exported OpenAPI definition file.
/// </div> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html">Documenting
/// an API</a>, <a>DocumentationParts</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentationPart {
  /// The <a>DocumentationPart</a> identifier, generated by API Gateway when the
  /// <code>DocumentationPart</code> is created.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The location of the API entity to which the documentation applies. Valid
  /// fields depend on the targeted API entity type. All the valid location fields
  /// are not required. If not explicitly specified, a valid location field is
  /// treated as a wildcard and associated documentation content may be inherited
  /// by matching entities, unless overridden.
  @_s.JsonKey(name: 'location')
  final DocumentationPartLocation location;

  /// A content map of API-specific key-value pairs describing the targeted API
  /// entity. The map must be encoded as a JSON string, e.g., <code>"{
  /// \"description\": \"The API does ...\" }"</code>. Only OpenAPI-compliant
  /// documentation-related fields from the <literal>properties</literal> map are
  /// exported and, hence, published as part of the API entity definitions, while
  /// the original documentation parts are exported in a OpenAPI extension of
  /// <code>x-amazon-apigateway-documentation</code>.
  @_s.JsonKey(name: 'properties')
  final String properties;

  DocumentationPart({
    this.id,
    this.location,
    this.properties,
  });
  factory DocumentationPart.fromJson(Map<String, dynamic> json) =>
      _$DocumentationPartFromJson(json);
}

/// A collection of the imported <a>DocumentationPart</a> identifiers.
/// <div class="remarks">This is used to return the result when documentation
/// parts in an external (e.g., OpenAPI) file are imported into API
/// Gateway</div> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html">Documenting
/// an API</a>, <a
/// href="https://docs.aws.amazon.com/apigateway/api-reference/link-relation/documentationpart-import/">documentationpart:import</a>,
/// <a>DocumentationPart</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentationPartIds {
  /// A list of the returned documentation part identifiers.
  @_s.JsonKey(name: 'ids')
  final List<String> ids;

  /// A list of warning messages reported during import of documentation parts.
  @_s.JsonKey(name: 'warnings')
  final List<String> warnings;

  DocumentationPartIds({
    this.ids,
    this.warnings,
  });
  factory DocumentationPartIds.fromJson(Map<String, dynamic> json) =>
      _$DocumentationPartIdsFromJson(json);
}

/// Specifies the target API entity to which the documentation applies.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DocumentationPartLocation {
  /// [Required] The type of API entity to which the documentation content
  /// applies. Valid values are <code>API</code>, <code>AUTHORIZER</code>,
  /// <code>MODEL</code>, <code>RESOURCE</code>, <code>METHOD</code>,
  /// <code>PATH_PARAMETER</code>, <code>QUERY_PARAMETER</code>,
  /// <code>REQUEST_HEADER</code>, <code>REQUEST_BODY</code>,
  /// <code>RESPONSE</code>, <code>RESPONSE_HEADER</code>, and
  /// <code>RESPONSE_BODY</code>. Content inheritance does not apply to any entity
  /// of the <code>API</code>, <code>AUTHORIZER</code>, <code>METHOD</code>,
  /// <code>MODEL</code>, <code>REQUEST_BODY</code>, or <code>RESOURCE</code>
  /// type.
  @_s.JsonKey(name: 'type')
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
  @_s.JsonKey(name: 'method')
  final String method;

  /// The name of the targeted API entity. It is a valid and required field for
  /// the API entity types of <code>AUTHORIZER</code>, <code>MODEL</code>,
  /// <code>PATH_PARAMETER</code>, <code>QUERY_PARAMETER</code>,
  /// <code>REQUEST_HEADER</code>, <code>REQUEST_BODY</code> and
  /// <code>RESPONSE_HEADER</code>. It is an invalid field for any other entity
  /// type.
  @_s.JsonKey(name: 'name')
  final String name;

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
  @_s.JsonKey(name: 'path')
  final String path;

  /// The HTTP status code of a response. It is a valid field for the API entity
  /// types of <code>RESPONSE</code>, <code>RESPONSE_HEADER</code>, and
  /// <code>RESPONSE_BODY</code>. The default value is <code>*</code> for any
  /// status code. When an applicable child entity inherits the content of an
  /// entity of the same type with more general specifications of the other
  /// <code>location</code> attributes, the child entity's <code>statusCode</code>
  /// attribute must match that of the parent entity exactly.
  @_s.JsonKey(name: 'statusCode')
  final String statusCode;

  DocumentationPartLocation({
    @_s.required this.type,
    this.method,
    this.name,
    this.path,
    this.statusCode,
  });
  factory DocumentationPartLocation.fromJson(Map<String, dynamic> json) =>
      _$DocumentationPartLocationFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentationPartLocationToJson(this);
}

enum DocumentationPartType {
  @_s.JsonValue('API')
  api,
  @_s.JsonValue('AUTHORIZER')
  authorizer,
  @_s.JsonValue('MODEL')
  model,
  @_s.JsonValue('RESOURCE')
  resource,
  @_s.JsonValue('METHOD')
  method,
  @_s.JsonValue('PATH_PARAMETER')
  pathParameter,
  @_s.JsonValue('QUERY_PARAMETER')
  queryParameter,
  @_s.JsonValue('REQUEST_HEADER')
  requestHeader,
  @_s.JsonValue('REQUEST_BODY')
  requestBody,
  @_s.JsonValue('RESPONSE')
  response,
  @_s.JsonValue('RESPONSE_HEADER')
  responseHeader,
  @_s.JsonValue('RESPONSE_BODY')
  responseBody,
}

extension on DocumentationPartType {
  String toValue() {
    switch (this) {
      case DocumentationPartType.api:
        return 'API';
      case DocumentationPartType.authorizer:
        return 'AUTHORIZER';
      case DocumentationPartType.model:
        return 'MODEL';
      case DocumentationPartType.resource:
        return 'RESOURCE';
      case DocumentationPartType.method:
        return 'METHOD';
      case DocumentationPartType.pathParameter:
        return 'PATH_PARAMETER';
      case DocumentationPartType.queryParameter:
        return 'QUERY_PARAMETER';
      case DocumentationPartType.requestHeader:
        return 'REQUEST_HEADER';
      case DocumentationPartType.requestBody:
        return 'REQUEST_BODY';
      case DocumentationPartType.response:
        return 'RESPONSE';
      case DocumentationPartType.responseHeader:
        return 'RESPONSE_HEADER';
      case DocumentationPartType.responseBody:
        return 'RESPONSE_BODY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The collection of documentation parts of an API.
/// <div class="remarks"/> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html">Documenting
/// an API</a>, <a>DocumentationPart</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentationParts {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<DocumentationPart> items;
  @_s.JsonKey(name: 'position')
  final String position;

  DocumentationParts({
    this.items,
    this.position,
  });
  factory DocumentationParts.fromJson(Map<String, dynamic> json) =>
      _$DocumentationPartsFromJson(json);
}

/// A snapshot of the documentation of an API.
/// <div class="remarks">
/// Publishing API documentation involves creating a documentation version
/// associated with an API stage and exporting the versioned documentation to an
/// external (e.g., OpenAPI) file.
/// </div> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html">Documenting
/// an API</a>, <a>DocumentationPart</a>, <a>DocumentationVersions</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentationVersion {
  /// The date when the API documentation snapshot is created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The description of the API documentation snapshot.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The version identifier of the API documentation snapshot.
  @_s.JsonKey(name: 'version')
  final String version;

  DocumentationVersion({
    this.createdDate,
    this.description,
    this.version,
  });
  factory DocumentationVersion.fromJson(Map<String, dynamic> json) =>
      _$DocumentationVersionFromJson(json);
}

/// The collection of documentation snapshots of an API.
/// <div class="remarks">
/// Use the <a>DocumentationVersions</a> to manage documentation snapshots
/// associated with various API stages.
/// </div> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-documenting-api.html">Documenting
/// an API</a>, <a>DocumentationPart</a>, <a>DocumentationVersion</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentationVersions {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<DocumentationVersion> items;
  @_s.JsonKey(name: 'position')
  final String position;

  DocumentationVersions({
    this.items,
    this.position,
  });
  factory DocumentationVersions.fromJson(Map<String, dynamic> json) =>
      _$DocumentationVersionsFromJson(json);
}

/// Represents a custom domain name as a user-friendly host name of an API
/// (<a>RestApi</a>).
/// <div class="Remarks">
/// When you deploy an API, API Gateway creates a default host name for the API.
/// This default API host name is of the
/// <code>{restapi-id}.execute-api.{region}.amazonaws.com</code> format. With
/// the default host name, you can access the API's root resource with the URL
/// of
/// <code>https://{restapi-id}.execute-api.{region}.amazonaws.com/{stage}/</code>.
/// When you set up a custom domain name of <code>apis.example.com</code> for
/// this API, you can then access the same resource using the URL of the
/// <code>https://apis.examples.com/myApi</code>, where <code>myApi</code> is
/// the base path mapping (<a>BasePathMapping</a>) of your API under the custom
/// domain name.
/// </div> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-custom-domains.html">Set
/// a Custom Host Name for an API</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainName {
  /// The reference to an AWS-managed certificate that will be used by
  /// edge-optimized endpoint for this domain name. AWS Certificate Manager is the
  /// only supported source.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The name of the certificate that will be used by edge-optimized endpoint for
  /// this domain name.
  @_s.JsonKey(name: 'certificateName')
  final String certificateName;

  /// The timestamp when the certificate that was used by edge-optimized endpoint
  /// for this domain name was uploaded.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'certificateUploadDate')
  final DateTime certificateUploadDate;

  /// The domain name of the Amazon CloudFront distribution associated with this
  /// custom domain name for an edge-optimized endpoint. You set up this
  /// association when adding a DNS record pointing the custom domain name to this
  /// distribution name. For more information about CloudFront distributions, see
  /// the <a href="https://aws.amazon.com/documentation/cloudfront/"
  /// target="_blank">Amazon CloudFront documentation</a>.
  @_s.JsonKey(name: 'distributionDomainName')
  final String distributionDomainName;

  /// The region-agnostic Amazon Route 53 Hosted Zone ID of the edge-optimized
  /// endpoint. The valid value is <code>Z2FDTNDATAQYW2</code> for all the
  /// regions. For more information, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-regional-api-custom-domain-create.html">Set
  /// up a Regional Custom Domain Name</a> and <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#apigateway_region">AWS
  /// Regions and Endpoints for API Gateway</a>.
  @_s.JsonKey(name: 'distributionHostedZoneId')
  final String distributionHostedZoneId;

  /// The custom domain name as an API host name, for example,
  /// <code>my-api.example.com</code>.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The status of the <a>DomainName</a> migration. The valid values are
  /// <code>AVAILABLE</code> and <code>UPDATING</code>. If the status is
  /// <code>UPDATING</code>, the domain cannot be modified further until the
  /// existing operation is complete. If it is <code>AVAILABLE</code>, the domain
  /// can be updated.
  @_s.JsonKey(name: 'domainNameStatus')
  final DomainNameStatus domainNameStatus;

  /// An optional text message containing detailed information about status of the
  /// <a>DomainName</a> migration.
  @_s.JsonKey(name: 'domainNameStatusMessage')
  final String domainNameStatusMessage;

  /// The endpoint configuration of this <a>DomainName</a> showing the endpoint
  /// types of the domain name.
  @_s.JsonKey(name: 'endpointConfiguration')
  final EndpointConfiguration endpointConfiguration;

  /// The mutual TLS authentication configuration for a custom domain name. If
  /// specified, API Gateway performs two-way authentication between the client
  /// and the server. Clients must present a trusted certificate to access your
  /// API.
  @_s.JsonKey(name: 'mutualTlsAuthentication')
  final MutualTlsAuthentication mutualTlsAuthentication;

  /// The reference to an AWS-managed certificate that will be used for validating
  /// the regional domain name. AWS Certificate Manager is the only supported
  /// source.
  @_s.JsonKey(name: 'regionalCertificateArn')
  final String regionalCertificateArn;

  /// The name of the certificate that will be used for validating the regional
  /// domain name.
  @_s.JsonKey(name: 'regionalCertificateName')
  final String regionalCertificateName;

  /// The domain name associated with the regional endpoint for this custom domain
  /// name. You set up this association by adding a DNS record that points the
  /// custom domain name to this regional domain name. The regional domain name is
  /// returned by API Gateway when you create a regional endpoint.
  @_s.JsonKey(name: 'regionalDomainName')
  final String regionalDomainName;

  /// The region-specific Amazon Route 53 Hosted Zone ID of the regional endpoint.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-regional-api-custom-domain-create.html">Set
  /// up a Regional Custom Domain Name</a> and <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/rande.html#apigateway_region">AWS
  /// Regions and Endpoints for API Gateway</a>.
  @_s.JsonKey(name: 'regionalHostedZoneId')
  final String regionalHostedZoneId;

  /// The Transport Layer Security (TLS) version + cipher suite for this
  /// <a>DomainName</a>. The valid values are <code>TLS_1_0</code> and
  /// <code>TLS_1_2</code>.
  @_s.JsonKey(name: 'securityPolicy')
  final SecurityPolicy securityPolicy;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
    this.regionalCertificateArn,
    this.regionalCertificateName,
    this.regionalDomainName,
    this.regionalHostedZoneId,
    this.securityPolicy,
    this.tags,
  });
  factory DomainName.fromJson(Map<String, dynamic> json) =>
      _$DomainNameFromJson(json);
}

enum DomainNameStatus {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('PENDING')
  pending,
}

/// Represents a collection of <a>DomainName</a> resources.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-custom-domains.html">Use
/// Client-Side Certificate</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainNames {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<DomainName> items;
  @_s.JsonKey(name: 'position')
  final String position;

  DomainNames({
    this.items,
    this.position,
  });
  factory DomainNames.fromJson(Map<String, dynamic> json) =>
      _$DomainNamesFromJson(json);
}

/// The endpoint configuration to indicate the types of endpoints an API
/// (<a>RestApi</a>) or its custom domain name (<a>DomainName</a>) has.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EndpointConfiguration {
  /// A list of endpoint types of an API (<a>RestApi</a>) or its custom domain
  /// name (<a>DomainName</a>). For an edge-optimized API and its custom domain
  /// name, the endpoint type is <code>"EDGE"</code>. For a regional API and its
  /// custom domain name, the endpoint type is <code>REGIONAL</code>. For a
  /// private API, the endpoint type is <code>PRIVATE</code>.
  @_s.JsonKey(name: 'types')
  final List<EndpointType> types;

  /// A list of VpcEndpointIds of an API (<a>RestApi</a>) against which to create
  /// Route53 ALIASes. It is only supported for <code>PRIVATE</code> endpoint
  /// type.
  @_s.JsonKey(name: 'vpcEndpointIds')
  final List<String> vpcEndpointIds;

  EndpointConfiguration({
    this.types,
    this.vpcEndpointIds,
  });
  factory EndpointConfiguration.fromJson(Map<String, dynamic> json) =>
      _$EndpointConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointConfigurationToJson(this);
}

/// The endpoint type. The valid values are <code>EDGE</code> for edge-optimized
/// API setup, most suitable for mobile applications; <code>REGIONAL</code> for
/// regional API endpoint setup, most suitable for calling from AWS Region; and
/// <code>PRIVATE</code> for private APIs.
enum EndpointType {
  @_s.JsonValue('REGIONAL')
  regional,
  @_s.JsonValue('EDGE')
  edge,
  @_s.JsonValue('PRIVATE')
  private,
}

/// The binary blob response to <a>GetExport</a>, which contains the generated
/// SDK.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportResponse {
  /// The binary blob response to <a>GetExport</a>, which contains the export.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'body')
  final Uint8List body;

  /// The content-disposition header value in the HTTP response.
  @_s.JsonKey(name: 'Content-Disposition')
  final String contentDisposition;

  /// The content-type header value in the HTTP response. This will correspond to
  /// a valid 'accept' type in the request.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  ExportResponse({
    this.body,
    this.contentDisposition,
    this.contentType,
  });
  factory ExportResponse.fromJson(Map<String, dynamic> json) =>
      _$ExportResponseFromJson(json);
}

/// A gateway response of a given response type and status code, with optional
/// response parameters and mapping templates.
/// <div class="remarks"> For more information about valid gateway response
/// types, see <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/supported-gateway-response-types.html">Gateway
/// Response Types Supported by API Gateway</a> <div class="example">
/// <h4>Example: Get a Gateway Response of a given response type</h4>
/// <h5>Request</h5>
/// This example shows how to get a gateway response of the
/// <code>MISSING_AUTHENTICATION_TOKEN</code> type.
/// <pre><code>GET
/// /restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN HTTP/1.1
/// Host: beta-apigateway.us-east-1.amazonaws.com Content-Type: application/json
/// X-Amz-Date: 20170503T202516Z Authorization: AWS4-HMAC-SHA256
/// Credential={access-key-id}/20170503/us-east-1/apigateway/aws4_request,
/// SignedHeaders=content-type;host;x-amz-date,
/// Signature=1b52460e3159c1a26cff29093855d50ea141c1c5b937528fecaf60f51129697a
/// Cache-Control: no-cache Postman-Token: 3b2a1ce9-c848-2e26-2e2f-9c2caefbed45
/// </code></pre>
/// The response type is specified as a URL path.
/// <h5>Response</h5>
/// The successful operation returns the <code>200 OK</code> status code and a
/// payload similar to the following:
/// <pre><code>{ "_links": { "curies": { "href":
/// "http://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-gatewayresponse-{rel}.html",
/// "name": "gatewayresponse", "templated": true }, "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN" },
/// "gatewayresponse:delete": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN" } },
/// "defaultResponse": false, "responseParameters": {
/// "gatewayresponse.header.x-request-path": "method.request.path.petId",
/// "gatewayresponse.header.Access-Control-Allow-Origin": "&apos;a.b.c&apos;",
/// "gatewayresponse.header.x-request-query": "method.request.querystring.q",
/// "gatewayresponse.header.x-request-header": "method.request.header.Accept" },
/// "responseTemplates": { "application/json": "{\n \"message\":
/// $context.error.messageString,\n \"type\": \"$context.error.responseType\",\n
/// \"stage\": \"$context.stage\",\n \"resourcePath\":
/// \"$context.resourcePath\",\n \"stageVariables.a\": \"$stageVariables.a\",\n
/// \"statusCode\": \"&apos;404&apos;\"\n}" }, "responseType":
/// "MISSING_AUTHENTICATION_TOKEN", "statusCode": "404" }</code></pre> <p/>
/// </div> </div> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/customize-gateway-responses.html">Customize
/// Gateway Responses</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GatewayResponse {
  /// A Boolean flag to indicate whether this <a>GatewayResponse</a> is the
  /// default gateway response (<code>true</code>) or not (<code>false</code>). A
  /// default gateway response is one generated by API Gateway without any
  /// customization by an API developer.
  @_s.JsonKey(name: 'defaultResponse')
  final bool defaultResponse;

  /// Response parameters (paths, query strings and headers) of the
  /// <a>GatewayResponse</a> as a string-to-string map of key-value pairs.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, String> responseParameters;

  /// Response templates of the <a>GatewayResponse</a> as a string-to-string map
  /// of key-value pairs.
  @_s.JsonKey(name: 'responseTemplates')
  final Map<String, String> responseTemplates;

  /// The response type of the associated <a>GatewayResponse</a>. Valid values are
  /// <ul>
  /// <li>ACCESS_DENIED</li>
  /// <li>API_CONFIGURATION_ERROR</li>
  /// <li>AUTHORIZER_FAILURE</li>
  /// <li> AUTHORIZER_CONFIGURATION_ERROR</li>
  /// <li>BAD_REQUEST_PARAMETERS</li>
  /// <li>BAD_REQUEST_BODY</li>
  /// <li>DEFAULT_4XX</li>
  /// <li>DEFAULT_5XX</li>
  /// <li>EXPIRED_TOKEN</li>
  /// <li>INVALID_SIGNATURE</li>
  /// <li>INTEGRATION_FAILURE</li>
  /// <li>INTEGRATION_TIMEOUT</li>
  /// <li>INVALID_API_KEY</li>
  /// <li>MISSING_AUTHENTICATION_TOKEN</li>
  /// <li> QUOTA_EXCEEDED</li>
  /// <li>REQUEST_TOO_LARGE</li>
  /// <li>RESOURCE_NOT_FOUND</li>
  /// <li>THROTTLED</li>
  /// <li>UNAUTHORIZED</li>
  /// <li>UNSUPPORTED_MEDIA_TYPE</li>
  /// </ul>
  @_s.JsonKey(name: 'responseType')
  final GatewayResponseType responseType;

  /// The HTTP status code for this <a>GatewayResponse</a>.
  @_s.JsonKey(name: 'statusCode')
  final String statusCode;

  GatewayResponse({
    this.defaultResponse,
    this.responseParameters,
    this.responseTemplates,
    this.responseType,
    this.statusCode,
  });
  factory GatewayResponse.fromJson(Map<String, dynamic> json) =>
      _$GatewayResponseFromJson(json);
}

enum GatewayResponseType {
  @_s.JsonValue('DEFAULT_4XX')
  default_4xx,
  @_s.JsonValue('DEFAULT_5XX')
  default_5xx,
  @_s.JsonValue('RESOURCE_NOT_FOUND')
  resourceNotFound,
  @_s.JsonValue('UNAUTHORIZED')
  unauthorized,
  @_s.JsonValue('INVALID_API_KEY')
  invalidApiKey,
  @_s.JsonValue('ACCESS_DENIED')
  accessDenied,
  @_s.JsonValue('AUTHORIZER_FAILURE')
  authorizerFailure,
  @_s.JsonValue('AUTHORIZER_CONFIGURATION_ERROR')
  authorizerConfigurationError,
  @_s.JsonValue('INVALID_SIGNATURE')
  invalidSignature,
  @_s.JsonValue('EXPIRED_TOKEN')
  expiredToken,
  @_s.JsonValue('MISSING_AUTHENTICATION_TOKEN')
  missingAuthenticationToken,
  @_s.JsonValue('INTEGRATION_FAILURE')
  integrationFailure,
  @_s.JsonValue('INTEGRATION_TIMEOUT')
  integrationTimeout,
  @_s.JsonValue('API_CONFIGURATION_ERROR')
  apiConfigurationError,
  @_s.JsonValue('UNSUPPORTED_MEDIA_TYPE')
  unsupportedMediaType,
  @_s.JsonValue('BAD_REQUEST_PARAMETERS')
  badRequestParameters,
  @_s.JsonValue('BAD_REQUEST_BODY')
  badRequestBody,
  @_s.JsonValue('REQUEST_TOO_LARGE')
  requestTooLarge,
  @_s.JsonValue('THROTTLED')
  throttled,
  @_s.JsonValue('QUOTA_EXCEEDED')
  quotaExceeded,
}

extension on GatewayResponseType {
  String toValue() {
    switch (this) {
      case GatewayResponseType.default_4xx:
        return 'DEFAULT_4XX';
      case GatewayResponseType.default_5xx:
        return 'DEFAULT_5XX';
      case GatewayResponseType.resourceNotFound:
        return 'RESOURCE_NOT_FOUND';
      case GatewayResponseType.unauthorized:
        return 'UNAUTHORIZED';
      case GatewayResponseType.invalidApiKey:
        return 'INVALID_API_KEY';
      case GatewayResponseType.accessDenied:
        return 'ACCESS_DENIED';
      case GatewayResponseType.authorizerFailure:
        return 'AUTHORIZER_FAILURE';
      case GatewayResponseType.authorizerConfigurationError:
        return 'AUTHORIZER_CONFIGURATION_ERROR';
      case GatewayResponseType.invalidSignature:
        return 'INVALID_SIGNATURE';
      case GatewayResponseType.expiredToken:
        return 'EXPIRED_TOKEN';
      case GatewayResponseType.missingAuthenticationToken:
        return 'MISSING_AUTHENTICATION_TOKEN';
      case GatewayResponseType.integrationFailure:
        return 'INTEGRATION_FAILURE';
      case GatewayResponseType.integrationTimeout:
        return 'INTEGRATION_TIMEOUT';
      case GatewayResponseType.apiConfigurationError:
        return 'API_CONFIGURATION_ERROR';
      case GatewayResponseType.unsupportedMediaType:
        return 'UNSUPPORTED_MEDIA_TYPE';
      case GatewayResponseType.badRequestParameters:
        return 'BAD_REQUEST_PARAMETERS';
      case GatewayResponseType.badRequestBody:
        return 'BAD_REQUEST_BODY';
      case GatewayResponseType.requestTooLarge:
        return 'REQUEST_TOO_LARGE';
      case GatewayResponseType.throttled:
        return 'THROTTLED';
      case GatewayResponseType.quotaExceeded:
        return 'QUOTA_EXCEEDED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The collection of the <a>GatewayResponse</a> instances of a <a>RestApi</a>
/// as a <code>responseType</code>-to-<a>GatewayResponse</a> object map of
/// key-value pairs. As such, pagination is not supported for querying this
/// collection.
/// <div class="remarks"> For more information about valid gateway response
/// types, see <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/supported-gateway-response-types.html">Gateway
/// Response Types Supported by API Gateway</a> <div class="example">
/// <h4>Example: Get the collection of gateway responses of an API</h4>
/// <h5>Request</h5>
/// This example request shows how to retrieve the <a>GatewayResponses</a>
/// collection from an API.
/// <pre><code>GET /restapis/o81lxisefl/gatewayresponses HTTP/1.1 Host:
/// beta-apigateway.us-east-1.amazonaws.com Content-Type: application/json
/// X-Amz-Date: 20170503T220604Z Authorization: AWS4-HMAC-SHA256
/// Credential={access-key-id}/20170503/us-east-1/apigateway/aws4_request,
/// SignedHeaders=content-type;host;x-amz-date,
/// Signature=59b42fe54a76a5de8adf2c67baa6d39206f8e9ad49a1d77ccc6a5da3103a398a
/// Cache-Control: no-cache Postman-Token: 5637af27-dc29-fc5c-9dfe-0645d52cb515
/// </code></pre> <p/> <h5>Response</h5>
/// The successful operation returns the <code>200 OK</code> status code and a
/// payload similar to the following:
/// <pre><code>{ "_links": { "curies": { "href":
/// "http://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-gatewayresponse-{rel}.html",
/// "name": "gatewayresponse", "templated": true }, "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses" }, "first": { "href":
/// "/restapis/o81lxisefl/gatewayresponses" }, "gatewayresponse:by-type": {
/// "href": "/restapis/o81lxisefl/gatewayresponses/{response_type}",
/// "templated": true }, "item": [ { "href":
/// "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_FAILURE" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/RESOURCE_NOT_FOUND" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/REQUEST_TOO_LARGE" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/THROTTLED" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/UNSUPPORTED_MEDIA_TYPE" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER_CONFIGURATION_ERROR" }, {
/// "href": "/restapis/o81lxisefl/gatewayresponses/DEFAULT_5XX" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/DEFAULT_4XX" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/BAD_REQUEST_PARAMETERS" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/BAD_REQUEST_BODY" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/EXPIRED_TOKEN" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/ACCESS_DENIED" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/INVALID_API_KEY" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/UNAUTHORIZED" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/API_CONFIGURATION_ERROR" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/QUOTA_EXCEEDED" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_TIMEOUT" }, { "href":
/// "/restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN" }, {
/// "href": "/restapis/o81lxisefl/gatewayresponses/INVALID_SIGNATURE" }, {
/// "href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER_FAILURE" } ] },
/// "_embedded": { "item": [ { "_links": { "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_FAILURE" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_FAILURE" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "INTEGRATION_FAILURE", "statusCode": "504" }, { "_links": {
/// "self": { "href": "/restapis/o81lxisefl/gatewayresponses/RESOURCE_NOT_FOUND"
/// }, "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/RESOURCE_NOT_FOUND" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "RESOURCE_NOT_FOUND", "statusCode": "404" }, { "_links": {
/// "self": { "href": "/restapis/o81lxisefl/gatewayresponses/REQUEST_TOO_LARGE"
/// }, "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/REQUEST_TOO_LARGE" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "REQUEST_TOO_LARGE", "statusCode": "413" }, { "_links": {
/// "self": { "href": "/restapis/o81lxisefl/gatewayresponses/THROTTLED" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/THROTTLED" } }, "defaultResponse":
/// true, "responseParameters": {}, "responseTemplates": { "application/json":
/// "{\"message\":$context.error.messageString}" }, "responseType": "THROTTLED",
/// "statusCode": "429" }, { "_links": { "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/UNSUPPORTED_MEDIA_TYPE" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/UNSUPPORTED_MEDIA_TYPE" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "UNSUPPORTED_MEDIA_TYPE", "statusCode": "415" }, { "_links":
/// { "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER_CONFIGURATION_ERROR" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER_CONFIGURATION_ERROR" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "AUTHORIZER_CONFIGURATION_ERROR", "statusCode": "500" }, {
/// "_links": { "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/DEFAULT_5XX" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/DEFAULT_5XX" } }, "defaultResponse":
/// true, "responseParameters": {}, "responseTemplates": { "application/json":
/// "{\"message\":$context.error.messageString}" }, "responseType":
/// "DEFAULT_5XX" }, { "_links": { "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/DEFAULT_4XX" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/DEFAULT_4XX" } }, "defaultResponse":
/// true, "responseParameters": {}, "responseTemplates": { "application/json":
/// "{\"message\":$context.error.messageString}" }, "responseType":
/// "DEFAULT_4XX" }, { "_links": { "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/BAD_REQUEST_PARAMETERS" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/BAD_REQUEST_PARAMETERS" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "BAD_REQUEST_PARAMETERS", "statusCode": "400" }, { "_links":
/// { "self": { "href": "/restapis/o81lxisefl/gatewayresponses/BAD_REQUEST_BODY"
/// }, "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/BAD_REQUEST_BODY" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "BAD_REQUEST_BODY", "statusCode": "400" }, { "_links": {
/// "self": { "href": "/restapis/o81lxisefl/gatewayresponses/EXPIRED_TOKEN" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/EXPIRED_TOKEN" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "EXPIRED_TOKEN", "statusCode": "403" }, { "_links": {
/// "self": { "href": "/restapis/o81lxisefl/gatewayresponses/ACCESS_DENIED" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/ACCESS_DENIED" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "ACCESS_DENIED", "statusCode": "403" }, { "_links": {
/// "self": { "href": "/restapis/o81lxisefl/gatewayresponses/INVALID_API_KEY" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/INVALID_API_KEY" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "INVALID_API_KEY", "statusCode": "403" }, { "_links": {
/// "self": { "href": "/restapis/o81lxisefl/gatewayresponses/UNAUTHORIZED" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/UNAUTHORIZED" } }, "defaultResponse":
/// true, "responseParameters": {}, "responseTemplates": { "application/json":
/// "{\"message\":$context.error.messageString}" }, "responseType":
/// "UNAUTHORIZED", "statusCode": "401" }, { "_links": { "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/API_CONFIGURATION_ERROR" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/API_CONFIGURATION_ERROR" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "API_CONFIGURATION_ERROR", "statusCode": "500" }, {
/// "_links": { "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/QUOTA_EXCEEDED" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/QUOTA_EXCEEDED" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "QUOTA_EXCEEDED", "statusCode": "429" }, { "_links": {
/// "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_TIMEOUT" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/INTEGRATION_TIMEOUT" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "INTEGRATION_TIMEOUT", "statusCode": "504" }, { "_links": {
/// "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/MISSING_AUTHENTICATION_TOKEN" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "MISSING_AUTHENTICATION_TOKEN", "statusCode": "403" }, {
/// "_links": { "self": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/INVALID_SIGNATURE" },
/// "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/INVALID_SIGNATURE" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "INVALID_SIGNATURE", "statusCode": "403" }, { "_links": {
/// "self": { "href": "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER_FAILURE"
/// }, "gatewayresponse:put": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/{response_type}", "templated": true
/// }, "gatewayresponse:update": { "href":
/// "/restapis/o81lxisefl/gatewayresponses/AUTHORIZER_FAILURE" } },
/// "defaultResponse": true, "responseParameters": {}, "responseTemplates": {
/// "application/json": "{\"message\":$context.error.messageString}" },
/// "responseType": "AUTHORIZER_FAILURE", "statusCode": "500" } ] }
/// }</code></pre> <p/> </div> </div> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/customize-gateway-responses.html">Customize
/// Gateway Responses</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GatewayResponses {
  /// Returns the entire collection, because of no pagination support.
  @_s.JsonKey(name: 'item')
  final List<GatewayResponse> items;
  @_s.JsonKey(name: 'position')
  final String position;

  GatewayResponses({
    this.items,
    this.position,
  });
  factory GatewayResponses.fromJson(Map<String, dynamic> json) =>
      _$GatewayResponsesFromJson(json);
}

/// Represents an HTTP, HTTP_PROXY, AWS, AWS_PROXY, or Mock integration.
/// <div class="remarks">In the API Gateway console, the built-in Lambda
/// integration is an AWS integration.</div> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Creating
/// an API</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Integration {
  /// A list of request parameters whose values API Gateway caches. To be valid
  /// values for <code>cacheKeyParameters</code>, these parameters must also be
  /// specified for <a>Method</a> <code>requestParameters</code>.
  @_s.JsonKey(name: 'cacheKeyParameters')
  final List<String> cacheKeyParameters;

  /// Specifies a group of related cached parameters. By default, API Gateway uses
  /// the resource ID as the <code>cacheNamespace</code>. You can specify the same
  /// <code>cacheNamespace</code> across resources to return the same cached data
  /// for requests to different resources.
  @_s.JsonKey(name: 'cacheNamespace')
  final String cacheNamespace;

  /// The (<a
  /// href="https://docs.aws.amazon.com/apigateway/api-reference/resource/vpc-link/#id"><code>id</code></a>)
  /// of the <a>VpcLink</a> used for the integration when
  /// <code>connectionType=VPC_LINK</code> and undefined, otherwise.
  @_s.JsonKey(name: 'connectionId')
  final String connectionId;

  /// The type of the network connection to the integration endpoint. The valid
  /// value is <code>INTERNET</code> for connections through the public routable
  /// internet or <code>VPC_LINK</code> for private connections between API
  /// Gateway and a network load balancer in a VPC. The default value is
  /// <code>INTERNET</code>.
  @_s.JsonKey(name: 'connectionType')
  final ConnectionType connectionType;

  /// Specifies how to handle request payload content type conversions. Supported
  /// values are <code>CONVERT_TO_BINARY</code> and <code>CONVERT_TO_TEXT</code>,
  /// with the following behaviors:
  ///
  /// <ul>
  /// <li>
  /// <code>CONVERT_TO_BINARY</code>: Converts a request payload from a
  /// Base64-encoded string to the corresponding binary blob.
  /// </li>
  /// <li>
  /// <code>CONVERT_TO_TEXT</code>: Converts a request payload from a binary blob
  /// to a Base64-encoded string.
  /// </li>
  /// </ul>
  /// If this property is not defined, the request payload will be passed through
  /// from the method request to integration request without modification,
  /// provided that the <code>passthroughBehavior</code> is configured to support
  /// payload pass-through.
  @_s.JsonKey(name: 'contentHandling')
  final ContentHandlingStrategy contentHandling;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string <code>arn:aws:iam::\*:user/\*</code>. To use resource-based
  /// permissions on supported AWS services, specify null.
  @_s.JsonKey(name: 'credentials')
  final String credentials;

  /// Specifies the integration's HTTP method type.
  @_s.JsonKey(name: 'httpMethod')
  final String httpMethod;

  /// Specifies the integration's responses.
  /// <div class="remarks"> <p/> <h4>Example: Get integration responses of a
  /// method</h4> <h5>Request</h5> <p/> <pre><code>GET
  /// /restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200
  /// HTTP/1.1 Content-Type: application/json Host:
  /// apigateway.us-east-1.amazonaws.com X-Amz-Date: 20160607T191449Z
  /// Authorization: AWS4-HMAC-SHA256
  /// Credential={access_key_ID}/20160607/us-east-1/apigateway/aws4_request,
  /// SignedHeaders=content-type;host;x-amz-date, Signature={sig4_hash}
  /// </code></pre> <h5>Response</h5>
  /// The successful response returns <code>200 OK</code> status and a payload as
  /// follows:
  /// <pre><code>{ "_links": { "curies": { "href":
  /// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-response-{rel}.html",
  /// "name": "integrationresponse", "templated": true }, "self": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
  /// "title": "200" }, "integrationresponse:delete": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
  /// }, "integrationresponse:update": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
  /// } }, "responseParameters": { "method.response.header.Content-Type":
  /// "'application/xml'" }, "responseTemplates": { "application/json":
  /// "$util.urlDecode(\"%3CkinesisStreams%3E#foreach($stream in
  /// $input.path('$.StreamNames'))%3Cstream%3E%3Cname%3E$stream%3C/name%3E%3C/stream%3E#end%3C/kinesisStreams%3E\")\n"
  /// }, "statusCode": "200" }</code></pre> <p/> </div> <div class="seeAlso"> <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Creating
  /// an API</a> </div>
  @_s.JsonKey(name: 'integrationResponses')
  final Map<String, IntegrationResponse> integrationResponses;

  /// <div>
  /// Specifies how the method request body of an unmapped content type will be
  /// passed through the integration request to the back end without
  /// transformation. A content type is unmapped if no mapping template is defined
  /// in the integration or the content type does not match any of the mapped
  /// content types, as specified in <code>requestTemplates</code>. The valid
  /// value is one of the following:
  ///
  /// <ul>
  /// <li> <code>WHEN_NO_MATCH</code>: passes the method request body through the
  /// integration request to the back end without transformation when the method
  /// request content type does not match any content type associated with the
  /// mapping templates defined in the integration request. </li>
  /// <li> <code>WHEN_NO_TEMPLATES</code>: passes the method request body through
  /// the integration request to the back end without transformation when no
  /// mapping template is defined in the integration request. If a template is
  /// defined when this option is selected, the method request of an unmapped
  /// content-type will be rejected with an HTTP <code>415 Unsupported Media
  /// Type</code> response. </li>
  /// <li> <code>NEVER</code>: rejects the method request with an HTTP <code>415
  /// Unsupported Media Type</code> response when either the method request
  /// content type does not match any content type associated with the mapping
  /// templates defined in the integration request or no mapping template is
  /// defined in the integration request. </li>
  /// </ul> </div>
  @_s.JsonKey(name: 'passthroughBehavior')
  final String passthroughBehavior;

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the back end. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or static
  /// value that must be enclosed within single quotes and pre-encoded as required
  /// by the back end. The method request parameter value must match the pattern
  /// of <code>method.request.{location}.{name}</code>, where
  /// <code>location</code> is <code>querystring</code>, <code>path</code>, or
  /// <code>header</code> and <code>name</code> must be a valid and unique method
  /// request parameter name.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value.
  @_s.JsonKey(name: 'requestTemplates')
  final Map<String, String> requestTemplates;

  /// Custom timeout between 50 and 29,000 milliseconds. The default value is
  /// 29,000 milliseconds or 29 seconds.
  @_s.JsonKey(name: 'timeoutInMillis')
  final int timeoutInMillis;

  /// Specifies the TLS configuration for an integration.
  @_s.JsonKey(name: 'tlsConfig')
  final TlsConfig tlsConfig;

  /// Specifies an API method integration type. The valid value is one of the
  /// following:
  ///
  /// <ul>
  /// <li><code>AWS</code>: for integrating the API method request with an AWS
  /// service action, including the Lambda function-invoking action. With the
  /// Lambda function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration.</li>
  /// <li><code>AWS_PROXY</code>: for integrating the API method request with the
  /// Lambda function-invoking action with the client request passed through
  /// as-is. This integration is also referred to as the Lambda proxy
  /// integration.</li>
  /// <li><code>HTTP</code>: for integrating the API method request with an HTTP
  /// endpoint, including a private HTTP endpoint within a VPC. This integration
  /// is also referred to as the HTTP custom integration.</li>
  /// <li><code>HTTP_PROXY</code>: for integrating the API method request with an
  /// HTTP endpoint, including a private HTTP endpoint within a VPC, with the
  /// client request passed through as-is. This is also referred to as the HTTP
  /// proxy integration.</li>
  /// <li><code>MOCK</code>: for integrating the API method request with API
  /// Gateway as a "loop-back" endpoint without invoking any backend.</li>
  /// </ul>
  /// For the HTTP and HTTP proxy integrations, each integration can specify a
  /// protocol (<code>http/https</code>), port and path. Standard 80 and 443 ports
  /// are supported as well as custom ports above 1024. An HTTP or HTTP proxy
  /// integration with a <code>connectionType</code> of <code>VPC_LINK</code> is
  /// referred to as a private integration and uses a <a>VpcLink</a> to connect
  /// API Gateway to a network load balancer of a VPC.
  @_s.JsonKey(name: 'type')
  final IntegrationType type;

  /// Specifies Uniform Resource Identifier (URI) of the integration endpoint.
  ///
  /// <ul>
  /// <li>
  /// For <code>HTTP</code> or <code>HTTP_PROXY</code> integrations, the URI must
  /// be a fully formed, encoded HTTP(S) URL according to the <a
  /// href="https://en.wikipedia.org/wiki/Uniform_Resource_Identifier"
  /// target="_blank">RFC-3986 specification</a>, for either standard integration,
  /// where <code>connectionType</code> is not <code>VPC_LINK</code>, or private
  /// integration, where <code>connectionType</code> is <code>VPC_LINK</code>. For
  /// a private HTTP integration, the URI is not used for routing.
  /// </li>
  /// <li>
  /// For <code>AWS</code> or <code>AWS_PROXY</code> integrations, the URI is of
  /// the form
  /// <code>arn:aws:apigateway:{region}:{subdomain.service|service}:path|action/{service_api}</code>.
  /// Here, <code>{Region}</code> is the API Gateway region (e.g.,
  /// <code>us-east-1</code>); <code>{service}</code> is the name of the
  /// integrated AWS service (e.g., <code>s3</code>); and <code>{subdomain}</code>
  /// is a designated subdomain supported by certain AWS service for fast
  /// host-name lookup. <code>action</code> can be used for an AWS service
  /// action-based API, using an
  /// <code>Action={name}&amp;{p1}={v1}&amp;p2={v2}...</code> query string. The
  /// ensuing <code>{service_api}</code> refers to a supported action
  /// <code>{name}</code> plus any required input parameters. Alternatively,
  /// <code>path</code> can be used for an AWS service path-based API. The ensuing
  /// <code>service_api</code> refers to the path to an AWS service resource,
  /// including the region of the integrated AWS service, if applicable. For
  /// example, for integration with the S3 API of <code><a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectGET.html">GetObject</a></code>,
  /// the <code>uri</code> can be either
  /// <code>arn:aws:apigateway:us-west-2:s3:action/GetObject&amp;Bucket={bucket}&amp;Key={key}</code>
  /// or <code>arn:aws:apigateway:us-west-2:s3:path/{bucket}/{key}</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'uri')
  final String uri;

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
  factory Integration.fromJson(Map<String, dynamic> json) =>
      _$IntegrationFromJson(json);
}

/// Represents an integration response. The status code must map to an existing
/// <a>MethodResponse</a>, and parameters and templates can be used to transform
/// the back-end response.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Creating
/// an API</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IntegrationResponse {
  /// Specifies how to handle response payload content type conversions. Supported
  /// values are <code>CONVERT_TO_BINARY</code> and <code>CONVERT_TO_TEXT</code>,
  /// with the following behaviors:
  ///
  /// <ul>
  /// <li>
  /// <code>CONVERT_TO_BINARY</code>: Converts a response payload from a
  /// Base64-encoded string to the corresponding binary blob.
  /// </li>
  /// <li>
  /// <code>CONVERT_TO_TEXT</code>: Converts a response payload from a binary blob
  /// to a Base64-encoded string.
  /// </li>
  /// </ul>
  /// If this property is not defined, the response payload will be passed through
  /// from the integration response to the method response without modification.
  @_s.JsonKey(name: 'contentHandling')
  final ContentHandlingStrategy contentHandling;

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
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, String> responseParameters;

  /// Specifies the templates used to transform the integration response body.
  /// Response templates are represented as a key/value map, with a content-type
  /// as the key and a template as the value.
  @_s.JsonKey(name: 'responseTemplates')
  final Map<String, String> responseTemplates;

  /// Specifies the regular expression (regex) pattern used to choose an
  /// integration response based on the response from the back end. For example,
  /// if the success response returns nothing and the error response returns some
  /// string, you could use the <code>.+</code> regex to match error response.
  /// However, make sure that the error response does not contain any newline
  /// (<code>\n</code>) character in such cases. If the back end is an AWS Lambda
  /// function, the AWS Lambda function error header is matched. For all other
  /// HTTP and AWS back ends, the HTTP status code is matched.
  @_s.JsonKey(name: 'selectionPattern')
  final String selectionPattern;

  /// Specifies the status code that is used to map the integration response to an
  /// existing <a>MethodResponse</a>.
  @_s.JsonKey(name: 'statusCode')
  final String statusCode;

  IntegrationResponse({
    this.contentHandling,
    this.responseParameters,
    this.responseTemplates,
    this.selectionPattern,
    this.statusCode,
  });
  factory IntegrationResponse.fromJson(Map<String, dynamic> json) =>
      _$IntegrationResponseFromJson(json);
}

/// The integration type. The valid value is <code>HTTP</code> for integrating
/// an API method with an HTTP backend; <code>AWS</code> with any AWS service
/// endpoints; <code>MOCK</code> for testing without actually invoking the
/// backend; <code>HTTP_PROXY</code> for integrating with the HTTP proxy
/// integration; <code>AWS_PROXY</code> for integrating with the Lambda proxy
/// integration.
enum IntegrationType {
  @_s.JsonValue('HTTP')
  http,
  @_s.JsonValue('AWS')
  aws,
  @_s.JsonValue('MOCK')
  mock,
  @_s.JsonValue('HTTP_PROXY')
  httpProxy,
  @_s.JsonValue('AWS_PROXY')
  awsProxy,
}

extension on IntegrationType {
  String toValue() {
    switch (this) {
      case IntegrationType.http:
        return 'HTTP';
      case IntegrationType.aws:
        return 'AWS';
      case IntegrationType.mock:
        return 'MOCK';
      case IntegrationType.httpProxy:
        return 'HTTP_PROXY';
      case IntegrationType.awsProxy:
        return 'AWS_PROXY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum LocationStatusType {
  @_s.JsonValue('DOCUMENTED')
  documented,
  @_s.JsonValue('UNDOCUMENTED')
  undocumented,
}

extension on LocationStatusType {
  String toValue() {
    switch (this) {
      case LocationStatusType.documented:
        return 'DOCUMENTED';
      case LocationStatusType.undocumented:
        return 'UNDOCUMENTED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents a client-facing interface by which the client calls the API to
/// access back-end resources. A <b>Method</b> resource is integrated with an
/// <a>Integration</a> resource. Both consist of a request and one or more
/// responses. The method request takes the client input that is passed to the
/// back end through the integration request. A method response returns the
/// output from the back end to the client through an integration response. A
/// method request is embodied in a <b>Method</b> resource, whereas an
/// integration request is embodied in an <a>Integration</a> resource. On the
/// other hand, a method response is represented by a <a>MethodResponse</a>
/// resource, whereas an integration response is represented by an
/// <a>IntegrationResponse</a> resource.
/// <div class="remarks"> <p/> <h4>Example: Retrive the GET method on a
/// specified resource</h4> <h5>Request</h5>
/// The following example request retrieves the information about the GET method
/// on an API resource (<code>3kzxbg5sa2</code>) of an API
/// (<code>fugvjdxtri</code>).
/// <pre><code>GET /restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET
/// HTTP/1.1 Content-Type: application/json Host:
/// apigateway.us-east-1.amazonaws.com X-Amz-Date: 20160603T210259Z
/// Authorization: AWS4-HMAC-SHA256
/// Credential={access_key_ID}/20160603/us-east-1/apigateway/aws4_request,
/// SignedHeaders=content-type;host;x-amz-date,
/// Signature={sig4_hash}</code></pre> <h5>Response</h5>
/// The successful response returns a <code>200 OK</code> status code and a
/// payload similar to the following:
/// <pre><code>{ "_links": { "curies": [ { "href":
/// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-{rel}.html",
/// "name": "integration", "templated": true }, { "href":
/// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-response-{rel}.html",
/// "name": "integrationresponse", "templated": true }, { "href":
/// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-{rel}.html",
/// "name": "method", "templated": true }, { "href":
/// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-response-{rel}.html",
/// "name": "methodresponse", "templated": true } ], "self": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET", "name": "GET",
/// "title": "GET" }, "integration:put": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
/// "method:delete": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET" },
/// "method:integration": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
/// "method:responses": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
/// "name": "200", "title": "200" }, "method:update": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET" },
/// "methodresponse:put": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/{status_code}",
/// "templated": true } }, "apiKeyRequired": true, "authorizationType": "NONE",
/// "httpMethod": "GET", "_embedded": { "method:integration": { "_links": {
/// "self": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
/// "integration:delete": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
/// "integration:responses": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
/// "name": "200", "title": "200" }, "integration:update": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
/// "integrationresponse:put": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/{status_code}",
/// "templated": true } }, "cacheKeyParameters": [], "cacheNamespace":
/// "3kzxbg5sa2", "credentials":
/// "arn:aws:iam::123456789012:role/apigAwsProxyRole", "httpMethod": "POST",
/// "passthroughBehavior": "WHEN_NO_MATCH", "requestParameters": {
/// "integration.request.header.Content-Type": "'application/x-amz-json-1.1'" },
/// "requestTemplates": { "application/json": "{\n}" }, "type": "AWS", "uri":
/// "arn:aws:apigateway:us-east-1:kinesis:action/ListStreams", "_embedded": {
/// "integration:responses": { "_links": { "self": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
/// "name": "200", "title": "200" }, "integrationresponse:delete": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
/// }, "integrationresponse:update": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
/// } }, "responseParameters": { "method.response.header.Content-Type":
/// "'application/xml'" }, "responseTemplates": { "application/json":
/// "$util.urlDecode(\"%3CkinesisStreams%3E%23foreach(%24stream%20in%20%24input.path(%27%24.StreamNames%27))%3Cstream%3E%3Cname%3E%24stream%3C%2Fname%3E%3C%2Fstream%3E%23end%3C%2FkinesisStreams%3E\")"
/// }, "statusCode": "200" } } }, "method:responses": { "_links": { "self": {
/// "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
/// "name": "200", "title": "200" }, "methodresponse:delete": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200" },
/// "methodresponse:update": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200" } },
/// "responseModels": { "application/json": "Empty" }, "responseParameters": {
/// "method.response.header.Content-Type": false }, "statusCode": "200" } }
/// }</code></pre>
/// In the example above, the response template for the <code>200 OK</code>
/// response maps the JSON output from the <code>ListStreams</code> action in
/// the back end to an XML output. The mapping template is URL-encoded as
/// <code>%3CkinesisStreams%3E%23foreach(%24stream%20in%20%24input.path(%27%24.StreamNames%27))%3Cstream%3E%3Cname%3E%24stream%3C%2Fname%3E%3C%2Fstream%3E%23end%3C%2FkinesisStreams%3E</code>
/// and the output is decoded using the <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-mapping-template-reference.html#util-templat-reference">$util.urlDecode()</a>
/// helper function.
/// </div> <div class="seeAlso"> <a>MethodResponse</a>, <a>Integration</a>,
/// <a>IntegrationResponse</a>, <a>Resource</a>, <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-method-settings.html">Set
/// up an API's method</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Method {
  /// A boolean flag specifying whether a valid <a>ApiKey</a> is required to
  /// invoke this method.
  @_s.JsonKey(name: 'apiKeyRequired')
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on the method. The scopes are used
  /// with a <code>COGNITO_USER_POOLS</code> authorizer to authorize the method
  /// invocation. The authorization works by matching the method scopes against
  /// the scopes parsed from the access token in the incoming request. The method
  /// invocation is authorized if any method scopes matches a claimed scope in the
  /// access token. Otherwise, the invocation is not authorized. When the method
  /// scope is configured, the client must provide an access token instead of an
  /// identity token for authorization purposes.
  @_s.JsonKey(name: 'authorizationScopes')
  final List<String> authorizationScopes;

  /// The method's authorization type. Valid values are <code>NONE</code> for open
  /// access, <code>AWS_IAM</code> for using AWS IAM permissions,
  /// <code>CUSTOM</code> for using a custom authorizer, or
  /// <code>COGNITO_USER_POOLS</code> for using a Cognito user pool.
  @_s.JsonKey(name: 'authorizationType')
  final String authorizationType;

  /// The identifier of an <a>Authorizer</a> to use on this method. The
  /// <code>authorizationType</code> must be <code>CUSTOM</code>.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// The method's HTTP verb.
  @_s.JsonKey(name: 'httpMethod')
  final String httpMethod;

  /// Gets the method's integration responsible for passing the client-submitted
  /// request to the back end and performing necessary transformations to make the
  /// request compliant with the back end.
  /// <div class="remarks"> <p/> <h4>Example: </h4> <h5>Request</h5> <p/>
  /// <pre><code>GET /restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration
  /// HTTP/1.1 Content-Type: application/json Host:
  /// apigateway.us-east-1.amazonaws.com Content-Length: 117 X-Amz-Date:
  /// 20160613T213210Z Authorization: AWS4-HMAC-SHA256
  /// Credential={access_key_ID}/20160613/us-east-1/apigateway/aws4_request,
  /// SignedHeaders=content-type;host;x-amz-date,
  /// Signature={sig4_hash}</code></pre> <h5>Response</h5>
  /// The successful response returns a <code>200 OK</code> status code and a
  /// payload similar to the following:
  /// <pre><code>{ "_links": { "curies": [ { "href":
  /// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-{rel}.html",
  /// "name": "integration", "templated": true }, { "href":
  /// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-response-{rel}.html",
  /// "name": "integrationresponse", "templated": true } ], "self": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration" },
  /// "integration:delete": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration" },
  /// "integration:responses": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/200",
  /// "name": "200", "title": "200" }, "integration:update": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration" },
  /// "integrationresponse:put": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/{status_code}",
  /// "templated": true } }, "cacheKeyParameters": [], "cacheNamespace": "0cjtch",
  /// "credentials": "arn:aws:iam::123456789012:role/apigAwsProxyRole",
  /// "httpMethod": "POST", "passthroughBehavior": "WHEN_NO_MATCH",
  /// "requestTemplates": { "application/json": "{\n \"a\":
  /// \"$input.params('operand1')\",\n \"b\": \"$input.params('operand2')\", \n
  /// \"op\": \"$input.params('operator')\" \n}" }, "type": "AWS", "uri":
  /// "arn:aws:apigateway:us-west-2:lambda:path//2015-03-31/functions/arn:aws:lambda:us-west-2:123456789012:function:Calc/invocations",
  /// "_embedded": { "integration:responses": { "_links": { "self": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/200",
  /// "name": "200", "title": "200" }, "integrationresponse:delete": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/200"
  /// }, "integrationresponse:update": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/integration/responses/200"
  /// } }, "responseParameters": { "method.response.header.operator":
  /// "integration.response.body.op", "method.response.header.operand_2":
  /// "integration.response.body.b", "method.response.header.operand_1":
  /// "integration.response.body.a" }, "responseTemplates": { "application/json":
  /// "#set($res = $input.path('$'))\n{\n \"result\": \"$res.a, $res.b, $res.op =>
  /// $res.c\",\n \"a\" : \"$res.a\",\n \"b\" : \"$res.b\",\n \"op\" :
  /// \"$res.op\",\n \"c\" : \"$res.c\"\n}" }, "selectionPattern": "",
  /// "statusCode": "200" } } }</code></pre> <p/> </div> <div class="seeAlso"> <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-integration.html">AWS
  /// CLI</a> </div>
  @_s.JsonKey(name: 'methodIntegration')
  final Integration methodIntegration;

  /// Gets a method response associated with a given HTTP status code.
  /// <div class="remarks">
  /// The collection of method responses are encapsulated in a key-value map,
  /// where the key is a response's HTTP status code and the value is a
  /// <a>MethodResponse</a> resource that specifies the response returned to the
  /// caller from the back end through the integration response.
  /// <h4>Example: Get a 200 OK response of a GET method</h4> <h5>Request</h5>
  /// <p/> <pre><code>GET
  /// /restapis/uojnr9hd57/resources/0cjtch/methods/GET/responses/200 HTTP/1.1
  /// Content-Type: application/json Host: apigateway.us-east-1.amazonaws.com
  /// Content-Length: 117 X-Amz-Date: 20160613T215008Z Authorization:
  /// AWS4-HMAC-SHA256
  /// Credential={access_key_ID}/20160613/us-east-1/apigateway/aws4_request,
  /// SignedHeaders=content-type;host;x-amz-date,
  /// Signature={sig4_hash}</code></pre> <h5>Response</h5>
  /// The successful response returns a <code>200 OK</code> status code and a
  /// payload similar to the following:
  /// <pre><code>{ "_links": { "curies": { "href":
  /// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-response-{rel}.html",
  /// "name": "methodresponse", "templated": true }, "self": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/responses/200", "title":
  /// "200" }, "methodresponse:delete": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/responses/200" },
  /// "methodresponse:update": { "href":
  /// "/restapis/uojnr9hd57/resources/0cjtch/methods/GET/responses/200" } },
  /// "responseModels": { "application/json": "Empty" }, "responseParameters": {
  /// "method.response.header.operator": false,
  /// "method.response.header.operand_2": false,
  /// "method.response.header.operand_1": false }, "statusCode": "200"
  /// }</code></pre> <p/> </div> <div class="seeAlso"> <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-method-response.html">AWS
  /// CLI</a> </div>
  @_s.JsonKey(name: 'methodResponses')
  final Map<String, MethodResponse> methodResponses;

  /// A human-friendly operation identifier for the method. For example, you can
  /// assign the <code>operationName</code> of <code>ListPets</code> for the
  /// <code>GET /pets</code> method in the <code>PetStore</code> example.
  @_s.JsonKey(name: 'operationName')
  final String operationName;

  /// A key-value map specifying data schemas, represented by <a>Model</a>
  /// resources, (as the mapped value) of the request payloads of given content
  /// types (as the mapping key).
  @_s.JsonKey(name: 'requestModels')
  final Map<String, String> requestModels;

  /// A key-value map defining required or optional method request parameters that
  /// can be accepted by API Gateway. A key is a method request parameter name
  /// matching the pattern of <code>method.request.{location}.{name}</code>, where
  /// <code>location</code> is <code>querystring</code>, <code>path</code>, or
  /// <code>header</code> and <code>name</code> is a valid and unique parameter
  /// name. The value associated with the key is a Boolean flag indicating whether
  /// the parameter is required (<code>true</code>) or optional
  /// (<code>false</code>). The method request parameter names defined here are
  /// available in <a>Integration</a> to be mapped to integration request
  /// parameters or templates.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, bool> requestParameters;

  /// The identifier of a <a>RequestValidator</a> for request validation.
  @_s.JsonKey(name: 'requestValidatorId')
  final String requestValidatorId;

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
  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);
}

/// Represents a method response of a given HTTP status code returned to the
/// client. The method response is passed from the back end through the
/// associated integration response that can be transformed using a mapping
/// template.
/// <div class="remarks"> <p/> <h4>Example: A <b>MethodResponse</b> instance of
/// an API</h4> <h5>Request</h5>
/// The example request retrieves a <b>MethodResponse</b> of the 200 status
/// code.
/// <pre><code>GET
/// /restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200 HTTP/1.1
/// Content-Type: application/json Host: apigateway.us-east-1.amazonaws.com
/// X-Amz-Date: 20160603T222952Z Authorization: AWS4-HMAC-SHA256
/// Credential={access_key_ID}/20160603/us-east-1/apigateway/aws4_request,
/// SignedHeaders=content-type;host;x-amz-date,
/// Signature={sig4_hash}</code></pre> <h5>Response</h5>
/// The successful response returns <code>200 OK</code> status and a payload as
/// follows:
/// <pre><code>{ "_links": { "curies": { "href":
/// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-response-{rel}.html",
/// "name": "methodresponse", "templated": true }, "self": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
/// "title": "200" }, "methodresponse:delete": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200" },
/// "methodresponse:update": { "href":
/// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200" } },
/// "responseModels": { "application/json": "Empty" }, "responseParameters": {
/// "method.response.header.Content-Type": false }, "statusCode": "200"
/// }</code></pre> <p/> </div> <div class="seeAlso"> <a>Method</a>,
/// <a>IntegrationResponse</a>, <a>Integration</a> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Creating
/// an API</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MethodResponse {
  /// Specifies the <a>Model</a> resources used for the response's content-type.
  /// Response models are represented as a key/value map, with a content-type as
  /// the key and a <a>Model</a> name as the value.
  @_s.JsonKey(name: 'responseModels')
  final Map<String, String> responseModels;

  /// A key-value map specifying required or optional response parameters that API
  /// Gateway can send back to the caller. A key defines a method response header
  /// and the value specifies whether the associated method response header is
  /// required or not. The expression of the key must match the pattern
  /// <code>method.response.header.{name}</code>, where <code>name</code> is a
  /// valid and unique header name. API Gateway passes certain integration
  /// response data to the method response headers specified here according to the
  /// mapping you prescribe in the API's <a>IntegrationResponse</a>. The
  /// integration response data that can be mapped include an integration response
  /// header expressed in <code>integration.response.header.{name}</code>, a
  /// static value enclosed within a pair of single quotes (e.g.,
  /// <code>'application/json'</code>), or a JSON expression from the back-end
  /// response payload in the form of
  /// <code>integration.response.body.{JSON-expression}</code>, where
  /// <code>JSON-expression</code> is a valid JSON expression without the
  /// <code>$</code> prefix.)
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, bool> responseParameters;

  /// The method response's status code.
  @_s.JsonKey(name: 'statusCode')
  final String statusCode;

  MethodResponse({
    this.responseModels,
    this.responseParameters,
    this.statusCode,
  });
  factory MethodResponse.fromJson(Map<String, dynamic> json) =>
      _$MethodResponseFromJson(json);
}

/// Specifies the method setting properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MethodSetting {
  /// Specifies whether the cached responses are encrypted. The PATCH path for
  /// this setting is <code>/{method_setting_key}/caching/dataEncrypted</code>,
  /// and the value is a Boolean.
  @_s.JsonKey(name: 'cacheDataEncrypted')
  final bool cacheDataEncrypted;

  /// Specifies the time to live (TTL), in seconds, for cached responses. The
  /// higher the TTL, the longer the response will be cached. The PATCH path for
  /// this setting is <code>/{method_setting_key}/caching/ttlInSeconds</code>, and
  /// the value is an integer.
  @_s.JsonKey(name: 'cacheTtlInSeconds')
  final int cacheTtlInSeconds;

  /// Specifies whether responses should be cached and returned for requests. A
  /// cache cluster must be enabled on the stage for responses to be cached. The
  /// PATCH path for this setting is
  /// <code>/{method_setting_key}/caching/enabled</code>, and the value is a
  /// Boolean.
  @_s.JsonKey(name: 'cachingEnabled')
  final bool cachingEnabled;

  /// Specifies whether data trace logging is enabled for this method, which
  /// affects the log entries pushed to Amazon CloudWatch Logs. The PATCH path for
  /// this setting is <code>/{method_setting_key}/logging/dataTrace</code>, and
  /// the value is a Boolean.
  @_s.JsonKey(name: 'dataTraceEnabled')
  final bool dataTraceEnabled;

  /// Specifies the logging level for this method, which affects the log entries
  /// pushed to Amazon CloudWatch Logs. The PATCH path for this setting is
  /// <code>/{method_setting_key}/logging/loglevel</code>, and the available
  /// levels are <code>OFF</code>, <code>ERROR</code>, and <code>INFO</code>.
  /// Choose <code>ERROR</code> to write only error-level entries to CloudWatch
  /// Logs, or choose <code>INFO</code> to include all <code>ERROR</code> events
  /// as well as extra informational events.
  @_s.JsonKey(name: 'loggingLevel')
  final String loggingLevel;

  /// Specifies whether Amazon CloudWatch metrics are enabled for this method. The
  /// PATCH path for this setting is
  /// <code>/{method_setting_key}/metrics/enabled</code>, and the value is a
  /// Boolean.
  @_s.JsonKey(name: 'metricsEnabled')
  final bool metricsEnabled;

  /// Specifies whether authorization is required for a cache invalidation
  /// request. The PATCH path for this setting is
  /// <code>/{method_setting_key}/caching/requireAuthorizationForCacheControl</code>,
  /// and the value is a Boolean.
  @_s.JsonKey(name: 'requireAuthorizationForCacheControl')
  final bool requireAuthorizationForCacheControl;

  /// Specifies the throttling burst limit. The PATCH path for this setting is
  /// <code>/{method_setting_key}/throttling/burstLimit</code>, and the value is
  /// an integer.
  @_s.JsonKey(name: 'throttlingBurstLimit')
  final int throttlingBurstLimit;

  /// Specifies the throttling rate limit. The PATCH path for this setting is
  /// <code>/{method_setting_key}/throttling/rateLimit</code>, and the value is a
  /// double.
  @_s.JsonKey(name: 'throttlingRateLimit')
  final double throttlingRateLimit;

  /// Specifies how to handle unauthorized requests for cache invalidation. The
  /// PATCH path for this setting is
  /// <code>/{method_setting_key}/caching/unauthorizedCacheControlHeaderStrategy</code>,
  /// and the available values are <code>FAIL_WITH_403</code>,
  /// <code>SUCCEED_WITH_RESPONSE_HEADER</code>,
  /// <code>SUCCEED_WITHOUT_RESPONSE_HEADER</code>.
  @_s.JsonKey(name: 'unauthorizedCacheControlHeaderStrategy')
  final UnauthorizedCacheControlHeaderStrategy
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
  factory MethodSetting.fromJson(Map<String, dynamic> json) =>
      _$MethodSettingFromJson(json);
}

/// Represents a summary of a <a>Method</a> resource, given a particular date
/// and time.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MethodSnapshot {
  /// Specifies whether the method requires a valid <a>ApiKey</a>.
  @_s.JsonKey(name: 'apiKeyRequired')
  final bool apiKeyRequired;

  /// The method's authorization type. Valid values are <code>NONE</code> for open
  /// access, <code>AWS_IAM</code> for using AWS IAM permissions,
  /// <code>CUSTOM</code> for using a custom authorizer, or
  /// <code>COGNITO_USER_POOLS</code> for using a Cognito user pool.
  @_s.JsonKey(name: 'authorizationType')
  final String authorizationType;

  MethodSnapshot({
    this.apiKeyRequired,
    this.authorizationType,
  });
  factory MethodSnapshot.fromJson(Map<String, dynamic> json) =>
      _$MethodSnapshotFromJson(json);
}

/// Represents the data structure of a method's request or response payload.
/// <div class="remarks">
/// A request model defines the data structure of the client-supplied request
/// payload. A response model defines the data structure of the response payload
/// returned by the back end. Although not required, models are useful for
/// mapping payloads between the front end and back end.
///
/// A model is used for generating an API's SDK, validating the input request
/// body, and creating a skeletal mapping template.
/// </div> <div class="seeAlso"> <a>Method</a>, <a>MethodResponse</a>, <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html">Models
/// and Mappings</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Model {
  /// The content-type for the model.
  @_s.JsonKey(name: 'contentType')
  final String contentType;

  /// The description of the model.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The identifier for the model resource.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of the model. Must be an alphanumeric string.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The schema for the model. For <code>application/json</code> models, this
  /// should be <a href="https://tools.ietf.org/html/draft-zyp-json-schema-04"
  /// target="_blank">JSON schema draft 4</a> model. Do not include "\*/"
  /// characters in the description of any properties because such "\*/"
  /// characters may be interpreted as the closing marker for comments in some
  /// languages, such as Java or JavaScript, causing the installation of your
  /// API's SDK generated by API Gateway to fail.
  @_s.JsonKey(name: 'schema')
  final String schema;

  Model({
    this.contentType,
    this.description,
    this.id,
    this.name,
    this.schema,
  });
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
}

/// Represents a collection of <a>Model</a> resources.
/// <div class="seeAlso"> <a>Method</a>, <a>MethodResponse</a>, <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html">Models
/// and Mappings</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Models {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<Model> items;
  @_s.JsonKey(name: 'position')
  final String position;

  Models({
    this.items,
    this.position,
  });
  factory Models.fromJson(Map<String, dynamic> json) => _$ModelsFromJson(json);
}

/// If specified, API Gateway performs two-way authentication between the client
/// and the server. Clients must present a trusted certificate to access your
/// custom domain name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MutualTlsAuthentication {
  /// An Amazon S3 URL that specifies the truststore for mutual TLS
  /// authentication, for example <code>s3://bucket-name/key-name</code>. The
  /// truststore can contain certificates from public or private certificate
  /// authorities. To update the truststore, upload a new version to S3, and then
  /// update your custom domain name to use the new version. To update the
  /// truststore, you must have permissions to access the S3 object.
  @_s.JsonKey(name: 'truststoreUri')
  final String truststoreUri;

  /// The version of the S3 object that contains your truststore. To specify a
  /// version, you must have versioning enabled for the S3 bucket.
  @_s.JsonKey(name: 'truststoreVersion')
  final String truststoreVersion;

  /// A list of warnings that API Gateway returns while processing your
  /// truststore. Invalid certificates produce warnings. Mutual TLS is still
  /// enabled, but some clients might not be able to access your API. To resolve
  /// warnings, upload a new truststore to S3, and then update you domain name to
  /// use the new version.
  @_s.JsonKey(name: 'truststoreWarnings')
  final List<String> truststoreWarnings;

  MutualTlsAuthentication({
    this.truststoreUri,
    this.truststoreVersion,
    this.truststoreWarnings,
  });
  factory MutualTlsAuthentication.fromJson(Map<String, dynamic> json) =>
      _$MutualTlsAuthenticationFromJson(json);
}

/// If specified, API Gateway performs two-way authentication between the client
/// and the server. Clients must present a trusted certificate to access your
/// custom domain name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MutualTlsAuthenticationInput {
  /// An Amazon S3 resource ARN that specifies the truststore for mutual TLS
  /// authentication, for example, <code>s3://bucket-name/key-name</code>. The
  /// truststore can contain certificates from public or private certificate
  /// authorities. To update the truststore, upload a new version to S3, and then
  /// update your custom domain name to use the new version. To update the
  /// truststore, you must have permissions to access the S3 object.
  @_s.JsonKey(name: 'truststoreUri')
  final String truststoreUri;

  /// The version of the S3 object that contains your truststore. To specify a
  /// version, you must have versioning enabled for the S3 bucket.
  @_s.JsonKey(name: 'truststoreVersion')
  final String truststoreVersion;

  MutualTlsAuthenticationInput({
    this.truststoreUri,
    this.truststoreVersion,
  });
  Map<String, dynamic> toJson() => _$MutualTlsAuthenticationInputToJson(this);
}

enum Op {
  @_s.JsonValue('add')
  add,
  @_s.JsonValue('remove')
  remove,
  @_s.JsonValue('replace')
  replace,
  @_s.JsonValue('move')
  move,
  @_s.JsonValue('copy')
  copy,
  @_s.JsonValue('test')
  test,
}

/// A single patch operation to apply to the specified resource. Please refer to
/// http://tools.ietf.org/html/rfc6902#section-4 for an explanation of how each
/// operation is used.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PatchOperation {
  /// The <code>copy</code> update operation's source as identified by a
  /// <code>JSON-Pointer</code> value referencing the location within the targeted
  /// resource to copy the value from. For example, to promote a canary
  /// deployment, you copy the canary deployment ID to the affiliated deployment
  /// ID by calling a PATCH request on a <a>Stage</a> resource with
  /// <code>"op":"copy"</code>, <code>"from":"/canarySettings/deploymentId"</code>
  /// and <code>"path":"/deploymentId"</code>.
  @_s.JsonKey(name: 'from')
  final String from;

  /// An update operation to be performed with this PATCH request. The valid value
  /// can be <code>add</code>, <code>remove</code>, <code>replace</code> or
  /// <code>copy</code>. Not all valid operations are supported for a given
  /// resource. Support of the operations depends on specific operational
  /// contexts. Attempts to apply an unsupported operation on a resource will
  /// return an error message.
  @_s.JsonKey(name: 'op')
  final Op op;

  /// The <code>op</code> operation's target, as identified by a <a
  /// href="https://tools.ietf.org/html/draft-ietf-appsawg-json-pointer-08">JSON
  /// Pointer</a> value that references a location within the targeted resource.
  /// For example, if the target resource has an updateable property of
  /// <code>{"name":"value"}</code>, the path for this property is
  /// <code>/name</code>. If the <code>name</code> property value is a JSON object
  /// (e.g., <code>{"name": {"child/name": "child-value"}}</code>), the path for
  /// the <code>child/name</code> property will be <code>/name/child~1name</code>.
  /// Any slash ("/") character appearing in path names must be escaped with "~1",
  /// as shown in the example above. Each <code>op</code> operation can have only
  /// one <code>path</code> associated with it.
  @_s.JsonKey(name: 'path')
  final String path;

  /// The new target value of the update operation. It is applicable for the
  /// <code>add</code> or <code>replace</code> operation. When using AWS CLI to
  /// update a property of a JSON value, enclose the JSON object with a pair of
  /// single quotes in a Linux shell, e.g., '{"a": ...}'. In a Windows shell, see
  /// <a
  /// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json">Using
  /// JSON for Parameters</a>.
  @_s.JsonKey(name: 'value')
  final String value;

  PatchOperation({
    this.from,
    this.op,
    this.path,
    this.value,
  });
  Map<String, dynamic> toJson() => _$PatchOperationToJson(this);
}

enum PutMode {
  @_s.JsonValue('merge')
  merge,
  @_s.JsonValue('overwrite')
  overwrite,
}

extension on PutMode {
  String toValue() {
    switch (this) {
      case PutMode.merge:
        return 'merge';
      case PutMode.overwrite:
        return 'overwrite';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum QuotaPeriodType {
  @_s.JsonValue('DAY')
  day,
  @_s.JsonValue('WEEK')
  week,
  @_s.JsonValue('MONTH')
  month,
}

/// Quotas configured for a usage plan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class QuotaSettings {
  /// The maximum number of requests that can be made in a given time period.
  @_s.JsonKey(name: 'limit')
  final int limit;

  /// The day that a time period starts. For example, with a time period of
  /// <code>WEEK</code>, an offset of <code>0</code> starts on Sunday, and an
  /// offset of <code>1</code> starts on Monday.
  @_s.JsonKey(name: 'offset')
  final int offset;

  /// The time period in which the limit applies. Valid values are "DAY", "WEEK"
  /// or "MONTH".
  @_s.JsonKey(name: 'period')
  final QuotaPeriodType period;

  QuotaSettings({
    this.limit,
    this.offset,
    this.period,
  });
  factory QuotaSettings.fromJson(Map<String, dynamic> json) =>
      _$QuotaSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$QuotaSettingsToJson(this);
}

/// A set of validation rules for incoming <a>Method</a> requests.
/// <div class="remarks">
/// In OpenAPI, a <a>RequestValidator</a> of an API is defined by the <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions.html#api-gateway-swagger-extensions-request-validators.requestValidator.html">x-amazon-apigateway-request-validators.requestValidator</a>
/// object. It the referenced using the <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions.html#api-gateway-swagger-extensions-request-validator">x-amazon-apigateway-request-validator</a>
/// property.
/// </div> <div class="seeAlso"><a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-method-request-validation.html">Enable
/// Basic Request Validation in API Gateway</a></div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequestValidator {
  /// The identifier of this <a>RequestValidator</a>.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of this <a>RequestValidator</a>
  @_s.JsonKey(name: 'name')
  final String name;

  /// A Boolean flag to indicate whether to validate a request body according to
  /// the configured <a>Model</a> schema.
  @_s.JsonKey(name: 'validateRequestBody')
  final bool validateRequestBody;

  /// A Boolean flag to indicate whether to validate request parameters
  /// (<code>true</code>) or not (<code>false</code>).
  @_s.JsonKey(name: 'validateRequestParameters')
  final bool validateRequestParameters;

  RequestValidator({
    this.id,
    this.name,
    this.validateRequestBody,
    this.validateRequestParameters,
  });
  factory RequestValidator.fromJson(Map<String, dynamic> json) =>
      _$RequestValidatorFromJson(json);
}

/// A collection of <a>RequestValidator</a> resources of a given <a>RestApi</a>.
/// <div class="remarks">
/// In OpenAPI, the <a>RequestValidators</a> of an API is defined by the <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions.html#api-gateway-swagger-extensions-request-validators.html">x-amazon-apigateway-request-validators</a>
/// extension.
/// </div> <div class="seeAlso"><a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-method-request-validation.html">Enable
/// Basic Request Validation in API Gateway</a></div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequestValidators {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<RequestValidator> items;
  @_s.JsonKey(name: 'position')
  final String position;

  RequestValidators({
    this.items,
    this.position,
  });
  factory RequestValidators.fromJson(Map<String, dynamic> json) =>
      _$RequestValidatorsFromJson(json);
}

/// Represents an API resource.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Create
/// an API</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Resource {
  /// The resource's identifier.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The parent resource's identifier.
  @_s.JsonKey(name: 'parentId')
  final String parentId;

  /// The full path for this resource.
  @_s.JsonKey(name: 'path')
  final String path;

  /// The last path segment for this resource.
  @_s.JsonKey(name: 'pathPart')
  final String pathPart;

  /// Gets an API resource's method of a given HTTP verb.
  /// <div class="remarks">
  /// The resource methods are a map of methods indexed by methods' HTTP verbs
  /// enabled on the resource. This method map is included in the <code>200
  /// OK</code> response of the <code>GET
  /// /restapis/{restapi_id}/resources/{resource_id}</code> or <code>GET
  /// /restapis/{restapi_id}/resources/{resource_id}?embed=methods</code> request.
  /// <h4>Example: Get the GET method of an API resource</h4> <h5>Request</h5>
  /// <pre><code>GET /restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET
  /// HTTP/1.1 Content-Type: application/json Host:
  /// apigateway.us-east-1.amazonaws.com X-Amz-Date: 20170223T031827Z
  /// Authorization: AWS4-HMAC-SHA256
  /// Credential={access_key_ID}/20170223/us-east-1/apigateway/aws4_request,
  /// SignedHeaders=content-type;host;x-amz-date,
  /// Signature={sig4_hash}</code></pre> <h5>Response</h5> <pre><code>{ "_links":
  /// { "curies": [ { "href":
  /// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-{rel}.html",
  /// "name": "integration", "templated": true }, { "href":
  /// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-integration-response-{rel}.html",
  /// "name": "integrationresponse", "templated": true }, { "href":
  /// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-{rel}.html",
  /// "name": "method", "templated": true }, { "href":
  /// "https://docs.aws.amazon.com/apigateway/latest/developerguide/restapi-method-response-{rel}.html",
  /// "name": "methodresponse", "templated": true } ], "self": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET", "name": "GET",
  /// "title": "GET" }, "integration:put": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
  /// "method:delete": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET" },
  /// "method:integration": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
  /// "method:responses": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
  /// "name": "200", "title": "200" }, "method:update": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET" },
  /// "methodresponse:put": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/{status_code}",
  /// "templated": true } }, "apiKeyRequired": false, "authorizationType": "NONE",
  /// "httpMethod": "GET", "_embedded": { "method:integration": { "_links": {
  /// "self": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
  /// "integration:delete": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
  /// "integration:responses": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
  /// "name": "200", "title": "200" }, "integration:update": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration" },
  /// "integrationresponse:put": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/{status_code}",
  /// "templated": true } }, "cacheKeyParameters": [], "cacheNamespace":
  /// "3kzxbg5sa2", "credentials":
  /// "arn:aws:iam::123456789012:role/apigAwsProxyRole", "httpMethod": "POST",
  /// "passthroughBehavior": "WHEN_NO_MATCH", "requestParameters": {
  /// "integration.request.header.Content-Type": "'application/x-amz-json-1.1'" },
  /// "requestTemplates": { "application/json": "{\n}" }, "type": "AWS", "uri":
  /// "arn:aws:apigateway:us-east-1:kinesis:action/ListStreams", "_embedded": {
  /// "integration:responses": { "_links": { "self": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200",
  /// "name": "200", "title": "200" }, "integrationresponse:delete": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
  /// }, "integrationresponse:update": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/integration/responses/200"
  /// } }, "responseParameters": { "method.response.header.Content-Type":
  /// "'application/xml'" }, "responseTemplates": { "application/json":
  /// "$util.urlDecode(\"%3CkinesisStreams%3E#foreach($stream in
  /// $input.path('$.StreamNames'))%3Cstream%3E%3Cname%3E$stream%3C/name%3E%3C/stream%3E#end%3C/kinesisStreams%3E\")\n"
  /// }, "statusCode": "200" } } }, "method:responses": { "_links": { "self": {
  /// "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200",
  /// "name": "200", "title": "200" }, "methodresponse:delete": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200" },
  /// "methodresponse:update": { "href":
  /// "/restapis/fugvjdxtri/resources/3kzxbg5sa2/methods/GET/responses/200" } },
  /// "responseModels": { "application/json": "Empty" }, "responseParameters": {
  /// "method.response.header.Content-Type": false }, "statusCode": "200" } }
  /// }</code></pre>
  /// If the <code>OPTIONS</code> is enabled on the resource, you can follow the
  /// example here to get that method. Just replace the <code>GET</code> of the
  /// last path segment in the request URL with <code>OPTIONS</code>.
  /// </div> <div class="seeAlso"> </div>
  @_s.JsonKey(name: 'resourceMethods')
  final Map<String, Method> resourceMethods;

  Resource({
    this.id,
    this.parentId,
    this.path,
    this.pathPart,
    this.resourceMethods,
  });
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

/// Represents a collection of <a>Resource</a> resources.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Create
/// an API</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Resources {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<Resource> items;
  @_s.JsonKey(name: 'position')
  final String position;

  Resources({
    this.items,
    this.position,
  });
  factory Resources.fromJson(Map<String, dynamic> json) =>
      _$ResourcesFromJson(json);
}

/// Represents a REST API.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Create
/// an API</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestApi {
  /// The source of the API key for metering requests according to a usage plan.
  /// Valid values are:
  /// <ul>
  /// <li><code>HEADER</code> to read the API key from the <code>X-API-Key</code>
  /// header of a request. </li>
  /// <li><code>AUTHORIZER</code> to read the API key from the
  /// <code>UsageIdentifierKey</code> from a custom authorizer.</li>
  /// </ul>
  @_s.JsonKey(name: 'apiKeySource')
  final ApiKeySourceType apiKeySource;

  /// The list of binary media types supported by the <a>RestApi</a>. By default,
  /// the <a>RestApi</a> supports only UTF-8-encoded text payloads.
  @_s.JsonKey(name: 'binaryMediaTypes')
  final List<String> binaryMediaTypes;

  /// The timestamp when the API was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The API's description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies whether clients can invoke your API by using the default
  /// <code>execute-api</code> endpoint. By default, clients can invoke your API
  /// with the default https://{api_id}.execute-api.{region}.amazonaws.com
  /// endpoint. To require that clients use a custom domain name to invoke your
  /// API, disable the default endpoint.
  @_s.JsonKey(name: 'disableExecuteApiEndpoint')
  final bool disableExecuteApiEndpoint;

  /// The endpoint configuration of this <a>RestApi</a> showing the endpoint types
  /// of the API.
  @_s.JsonKey(name: 'endpointConfiguration')
  final EndpointConfiguration endpointConfiguration;

  /// The API's identifier. This identifier is unique across all of your APIs in
  /// API Gateway.
  @_s.JsonKey(name: 'id')
  final String id;

  /// A nullable integer that is used to enable compression (with non-negative
  /// between 0 and 10485760 (10M) bytes, inclusive) or disable compression (with
  /// a null value) on an API. When compression is enabled, compression or
  /// decompression is not applied on the payload if the payload size is smaller
  /// than this value. Setting it to zero allows compression for any payload size.
  @_s.JsonKey(name: 'minimumCompressionSize')
  final int minimumCompressionSize;

  /// The API's name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A stringified JSON policy document that applies to this RestApi regardless
  /// of the caller and <a>Method</a> configuration.
  @_s.JsonKey(name: 'policy')
  final String policy;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// A version identifier for the API.
  @_s.JsonKey(name: 'version')
  final String version;

  /// The warning messages reported when <code>failonwarnings</code> is turned on
  /// during API import.
  @_s.JsonKey(name: 'warnings')
  final List<String> warnings;

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
    this.tags,
    this.version,
    this.warnings,
  });
  factory RestApi.fromJson(Map<String, dynamic> json) =>
      _$RestApiFromJson(json);
}

/// Contains references to your APIs and links that guide you in how to interact
/// with your collection. A collection offers a paginated view of your APIs.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-create-api.html">Create
/// an API</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestApis {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<RestApi> items;
  @_s.JsonKey(name: 'position')
  final String position;

  RestApis({
    this.items,
    this.position,
  });
  factory RestApis.fromJson(Map<String, dynamic> json) =>
      _$RestApisFromJson(json);
}

/// A configuration property of an SDK type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SdkConfigurationProperty {
  /// The default value of an <a>SdkType</a> configuration property.
  @_s.JsonKey(name: 'defaultValue')
  final String defaultValue;

  /// The description of an <a>SdkType</a> configuration property.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The user-friendly name of an <a>SdkType</a> configuration property.
  @_s.JsonKey(name: 'friendlyName')
  final String friendlyName;

  /// The name of a an <a>SdkType</a> configuration property.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A boolean flag of an <a>SdkType</a> configuration property to indicate if
  /// the associated SDK configuration property is required (<code>true</code>) or
  /// not (<code>false</code>).
  @_s.JsonKey(name: 'required')
  final bool required;

  SdkConfigurationProperty({
    this.defaultValue,
    this.description,
    this.friendlyName,
    this.name,
    this.required,
  });
  factory SdkConfigurationProperty.fromJson(Map<String, dynamic> json) =>
      _$SdkConfigurationPropertyFromJson(json);
}

/// The binary blob response to <a>GetSdk</a>, which contains the generated SDK.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SdkResponse {
  /// The binary blob response to <a>GetSdk</a>, which contains the generated SDK.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'body')
  final Uint8List body;

  /// The content-disposition header value in the HTTP response.
  @_s.JsonKey(name: 'Content-Disposition')
  final String contentDisposition;

  /// The content-type header value in the HTTP response.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  SdkResponse({
    this.body,
    this.contentDisposition,
    this.contentType,
  });
  factory SdkResponse.fromJson(Map<String, dynamic> json) =>
      _$SdkResponseFromJson(json);
}

/// A type of SDK that API Gateway can generate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SdkType {
  /// A list of configuration properties of an <a>SdkType</a>.
  @_s.JsonKey(name: 'configurationProperties')
  final List<SdkConfigurationProperty> configurationProperties;

  /// The description of an <a>SdkType</a>.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The user-friendly name of an <a>SdkType</a> instance.
  @_s.JsonKey(name: 'friendlyName')
  final String friendlyName;

  /// The identifier of an <a>SdkType</a> instance.
  @_s.JsonKey(name: 'id')
  final String id;

  SdkType({
    this.configurationProperties,
    this.description,
    this.friendlyName,
    this.id,
  });
  factory SdkType.fromJson(Map<String, dynamic> json) =>
      _$SdkTypeFromJson(json);
}

/// The collection of <a>SdkType</a> instances.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SdkTypes {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<SdkType> items;
  @_s.JsonKey(name: 'position')
  final String position;

  SdkTypes({
    this.items,
    this.position,
  });
  factory SdkTypes.fromJson(Map<String, dynamic> json) =>
      _$SdkTypesFromJson(json);
}

enum SecurityPolicy {
  @_s.JsonValue('TLS_1_0')
  tls_1_0,
  @_s.JsonValue('TLS_1_2')
  tls_1_2,
}

extension on SecurityPolicy {
  String toValue() {
    switch (this) {
      case SecurityPolicy.tls_1_0:
        return 'TLS_1_0';
      case SecurityPolicy.tls_1_2:
        return 'TLS_1_2';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents a unique identifier for a version of a deployed <a>RestApi</a>
/// that is callable by users.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-deploy-api.html">Deploy
/// an API</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Stage {
  /// Settings for logging access in this stage.
  @_s.JsonKey(name: 'accessLogSettings')
  final AccessLogSettings accessLogSettings;

  /// Specifies whether a cache cluster is enabled for the stage.
  @_s.JsonKey(name: 'cacheClusterEnabled')
  final bool cacheClusterEnabled;

  /// The size of the cache cluster for the stage, if enabled.
  @_s.JsonKey(name: 'cacheClusterSize')
  final CacheClusterSize cacheClusterSize;

  /// The status of the cache cluster for the stage, if enabled.
  @_s.JsonKey(name: 'cacheClusterStatus')
  final CacheClusterStatus cacheClusterStatus;

  /// Settings for the canary deployment in this stage.
  @_s.JsonKey(name: 'canarySettings')
  final CanarySettings canarySettings;

  /// The identifier of a client certificate for an API stage.
  @_s.JsonKey(name: 'clientCertificateId')
  final String clientCertificateId;

  /// The timestamp when the stage was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The identifier of the <a>Deployment</a> that the stage points to.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The stage's description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The version of the associated API documentation.
  @_s.JsonKey(name: 'documentationVersion')
  final String documentationVersion;

  /// The timestamp when the stage last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// A map that defines the method settings for a <a>Stage</a> resource. Keys
  /// (designated as <code>/{method_setting_key</code> below) are method paths
  /// defined as <code>{resource_path}/{http_method}</code> for an individual
  /// method override, or <code>/\*/\*</code> for overriding all methods in the
  /// stage.
  @_s.JsonKey(name: 'methodSettings')
  final Map<String, MethodSetting> methodSettings;

  /// The name of the stage is the first path segment in the Uniform Resource
  /// Identifier (URI) of a call to API Gateway. Stage names can only contain
  /// alphanumeric characters, hyphens, and underscores. Maximum length is 128
  /// characters.
  @_s.JsonKey(name: 'stageName')
  final String stageName;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Specifies whether active tracing with X-ray is enabled for the <a>Stage</a>.
  @_s.JsonKey(name: 'tracingEnabled')
  final bool tracingEnabled;

  /// A map that defines the stage variables for a <a>Stage</a> resource. Variable
  /// names can have alphanumeric and underscore characters, and the values must
  /// match <code>[A-Za-z0-9-._~:/?#&amp;=,]+</code>.
  @_s.JsonKey(name: 'variables')
  final Map<String, String> variables;

  /// The ARN of the WebAcl associated with the <a>Stage</a>.
  @_s.JsonKey(name: 'webAclArn')
  final String webAclArn;

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
  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);
}

/// A reference to a unique stage identified in the format
/// <code>{restApiId}/{stage}</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StageKey {
  /// The string identifier of the associated <a>RestApi</a>.
  @_s.JsonKey(name: 'restApiId')
  final String restApiId;

  /// The stage name associated with the stage key.
  @_s.JsonKey(name: 'stageName')
  final String stageName;

  StageKey({
    this.restApiId,
    this.stageName,
  });
  Map<String, dynamic> toJson() => _$StageKeyToJson(this);
}

/// A list of <a>Stage</a> resources that are associated with the <a>ApiKey</a>
/// resource.
/// <div class="seeAlso"><a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/stages.html">Deploying
/// API in Stages</a></div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Stages {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<Stage> item;

  Stages({
    this.item,
  });
  factory Stages.fromJson(Map<String, dynamic> json) => _$StagesFromJson(json);
}

/// The collection of tags. Each tag element is associated with a given
/// resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Tags {
  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  Tags({
    this.tags,
  });
  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
}

/// Represents a mapping template used to transform a payload.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html#models-mappings-mappings">Mapping
/// Templates</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Template {
  /// The Apache <a
  /// href="https://velocity.apache.org/engine/devel/vtl-reference.html"
  /// target="_blank">Velocity Template Language (VTL)</a> template content used
  /// for the template resource.
  @_s.JsonKey(name: 'value')
  final String value;

  Template({
    this.value,
  });
  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);
}

/// Represents the response of the test invoke request for a custom
/// <a>Authorizer</a>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestInvokeAuthorizerResponse {
  @_s.JsonKey(name: 'authorization')
  final Map<String, List<String>> authorization;

  /// The <a
  /// href="https://openid.net/specs/openid-connect-core-1_0.html#StandardClaims">open
  /// identity claims</a>, with any supported custom attributes, returned from the
  /// Cognito Your User Pool configured for the API.
  @_s.JsonKey(name: 'claims')
  final Map<String, String> claims;

  /// The HTTP status code that the client would have received. Value is 0 if the
  /// authorizer succeeded.
  @_s.JsonKey(name: 'clientStatus')
  final int clientStatus;

  /// The execution latency of the test authorizer request.
  @_s.JsonKey(name: 'latency')
  final int latency;

  /// The API Gateway execution log for the test authorizer request.
  @_s.JsonKey(name: 'log')
  final String log;

  /// The JSON policy document returned by the <a>Authorizer</a>
  @_s.JsonKey(name: 'policy')
  final String policy;

  /// The principal identity returned by the <a>Authorizer</a>
  @_s.JsonKey(name: 'principalId')
  final String principalId;

  TestInvokeAuthorizerResponse({
    this.authorization,
    this.claims,
    this.clientStatus,
    this.latency,
    this.log,
    this.policy,
    this.principalId,
  });
  factory TestInvokeAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$TestInvokeAuthorizerResponseFromJson(json);
}

/// Represents the response of the test invoke request in the HTTP method.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-test-method.html#how-to-test-method-console">Test
/// API using the API Gateway console</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestInvokeMethodResponse {
  /// The body of the HTTP response.
  @_s.JsonKey(name: 'body')
  final String body;

  /// The headers of the HTTP response.
  @_s.JsonKey(name: 'headers')
  final Map<String, String> headers;

  /// The execution latency of the test invoke request.
  @_s.JsonKey(name: 'latency')
  final int latency;

  /// The API Gateway execution log for the test invoke request.
  @_s.JsonKey(name: 'log')
  final String log;

  /// The headers of the HTTP response as a map from string to list of values.
  @_s.JsonKey(name: 'multiValueHeaders')
  final Map<String, List<String>> multiValueHeaders;

  /// The HTTP status code.
  @_s.JsonKey(name: 'status')
  final int status;

  TestInvokeMethodResponse({
    this.body,
    this.headers,
    this.latency,
    this.log,
    this.multiValueHeaders,
    this.status,
  });
  factory TestInvokeMethodResponse.fromJson(Map<String, dynamic> json) =>
      _$TestInvokeMethodResponseFromJson(json);
}

/// The API request rate limits.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ThrottleSettings {
  /// The API request burst limit, the maximum rate limit over a time ranging from
  /// one to a few seconds, depending upon whether the underlying token bucket is
  /// at its full capacity.
  @_s.JsonKey(name: 'burstLimit')
  final int burstLimit;

  /// The API request steady-state rate limit.
  @_s.JsonKey(name: 'rateLimit')
  final double rateLimit;

  ThrottleSettings({
    this.burstLimit,
    this.rateLimit,
  });
  factory ThrottleSettings.fromJson(Map<String, dynamic> json) =>
      _$ThrottleSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ThrottleSettingsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TlsConfig {
  /// Specifies whether or not API Gateway skips verification that the certificate
  /// for an integration endpoint is issued by a <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-supported-certificate-authorities-for-http-endpoints.html">supported
  /// certificate authority</a>. This isn’t recommended, but it enables you to use
  /// certificates that are signed by private certificate authorities, or
  /// certificates that are self-signed. If enabled, API Gateway still performs
  /// basic certificate validation, which includes checking the certificate's
  /// expiration date, hostname, and presence of a root certificate authority.
  /// Supported only for <code>HTTP</code> and <code>HTTP_PROXY</code>
  /// integrations.
  @_s.JsonKey(name: 'insecureSkipVerification')
  final bool insecureSkipVerification;

  TlsConfig({
    this.insecureSkipVerification,
  });
  factory TlsConfig.fromJson(Map<String, dynamic> json) =>
      _$TlsConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TlsConfigToJson(this);
}

enum UnauthorizedCacheControlHeaderStrategy {
  @_s.JsonValue('FAIL_WITH_403')
  failWith_403,
  @_s.JsonValue('SUCCEED_WITH_RESPONSE_HEADER')
  succeedWithResponseHeader,
  @_s.JsonValue('SUCCEED_WITHOUT_RESPONSE_HEADER')
  succeedWithoutResponseHeader,
}

/// Represents the usage data of a usage plan.
/// <div class="remarks"/> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html">Create
/// and Use Usage Plans</a>, <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-create-usage-plans-with-console.html#api-gateway-usage-plan-manage-usage">Manage
/// Usage in a Usage Plan</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Usage {
  /// The ending date of the usage data.
  @_s.JsonKey(name: 'endDate')
  final String endDate;

  /// The usage data, as daily logs of used and remaining quotas, over the
  /// specified time interval indexed over the API keys in a usage plan. For
  /// example, <code>{..., "values" : { "{api_key}" : [ [0, 100], [10, 90], [100,
  /// 10]]}</code>, where <code>{api_key}</code> stands for an API key value and
  /// the daily log entry is of the format <code>[used quota, remaining
  /// quota]</code>.
  @_s.JsonKey(name: 'values')
  final Map<String, List<List<int>>> items;
  @_s.JsonKey(name: 'position')
  final String position;

  /// The starting date of the usage data.
  @_s.JsonKey(name: 'startDate')
  final String startDate;

  /// The plan Id associated with this usage data.
  @_s.JsonKey(name: 'usagePlanId')
  final String usagePlanId;

  Usage({
    this.endDate,
    this.items,
    this.position,
    this.startDate,
    this.usagePlanId,
  });
  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
}

/// Represents a usage plan than can specify who can assess associated API
/// stages with specified request limits and quotas.
/// <div class="remarks">
/// In a usage plan, you associate an API by specifying the API's Id and a stage
/// name of the specified API. You add plan customers by adding API keys to the
/// plan.
/// </div> <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html">Create
/// and Use Usage Plans</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsagePlan {
  /// The associated API stages of a usage plan.
  @_s.JsonKey(name: 'apiStages')
  final List<ApiStage> apiStages;

  /// The description of a usage plan.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The identifier of a <a>UsagePlan</a> resource.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of a usage plan.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The AWS Markeplace product identifier to associate with the usage plan as a
  /// SaaS product on AWS Marketplace.
  @_s.JsonKey(name: 'productCode')
  final String productCode;

  /// The maximum number of permitted requests per a given unit time interval.
  @_s.JsonKey(name: 'quota')
  final QuotaSettings quota;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The request throttle limits of a usage plan.
  @_s.JsonKey(name: 'throttle')
  final ThrottleSettings throttle;

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
  factory UsagePlan.fromJson(Map<String, dynamic> json) =>
      _$UsagePlanFromJson(json);
}

/// Represents a usage plan key to identify a plan customer.
/// <div class="remarks">
/// To associate an API stage with a selected API key in a usage plan, you must
/// create a UsagePlanKey resource to represent the selected <a>ApiKey</a>.
/// </div>" <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html">Create
/// and Use Usage Plans</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsagePlanKey {
  /// The Id of a usage plan key.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name of a usage plan key.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of a usage plan key. Currently, the valid key type is
  /// <code>API_KEY</code>.
  @_s.JsonKey(name: 'type')
  final String type;

  /// The value of a usage plan key.
  @_s.JsonKey(name: 'value')
  final String value;

  UsagePlanKey({
    this.id,
    this.name,
    this.type,
    this.value,
  });
  factory UsagePlanKey.fromJson(Map<String, dynamic> json) =>
      _$UsagePlanKeyFromJson(json);
}

/// Represents the collection of usage plan keys added to usage plans for the
/// associated API keys and, possibly, other types of keys.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html">Create
/// and Use Usage Plans</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsagePlanKeys {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<UsagePlanKey> items;
  @_s.JsonKey(name: 'position')
  final String position;

  UsagePlanKeys({
    this.items,
    this.position,
  });
  factory UsagePlanKeys.fromJson(Map<String, dynamic> json) =>
      _$UsagePlanKeysFromJson(json);
}

/// Represents a collection of usage plans for an AWS account.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-usage-plans.html">Create
/// and Use Usage Plans</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsagePlans {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<UsagePlan> items;
  @_s.JsonKey(name: 'position')
  final String position;

  UsagePlans({
    this.items,
    this.position,
  });
  factory UsagePlans.fromJson(Map<String, dynamic> json) =>
      _$UsagePlansFromJson(json);
}

/// An API Gateway VPC link for a <a>RestApi</a> to access resources in an
/// Amazon Virtual Private Cloud (VPC).
/// <div class="remarks">
///
/// To enable access to a resource in an Amazon Virtual Private Cloud through
/// Amazon API Gateway, you, as an API developer, create a <a>VpcLink</a>
/// resource targeted for one or more network load balancers of the VPC and then
/// integrate an API method with a private integration that uses the
/// <a>VpcLink</a>. The private integration has an integration type of
/// <code>HTTP</code> or <code>HTTP_PROXY</code> and has a connection type of
/// <code>VPC_LINK</code>. The integration uses the <code>connectionId</code>
/// property to identify the <a>VpcLink</a> used.
///
/// </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcLink {
  /// The description of the VPC link.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The identifier of the <a>VpcLink</a>. It is used in an <a>Integration</a> to
  /// reference this <a>VpcLink</a>.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name used to label and identify the VPC link.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of the VPC link. The valid values are <code>AVAILABLE</code>,
  /// <code>PENDING</code>, <code>DELETING</code>, or <code>FAILED</code>.
  /// Deploying an API will wait if the status is <code>PENDING</code> and will
  /// fail if the status is <code>DELETING</code>.
  @_s.JsonKey(name: 'status')
  final VpcLinkStatus status;

  /// A description about the VPC link status.
  @_s.JsonKey(name: 'statusMessage')
  final String statusMessage;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The ARN of the network load balancer of the VPC targeted by the VPC link.
  /// The network load balancer must be owned by the same AWS account of the API
  /// owner.
  @_s.JsonKey(name: 'targetArns')
  final List<String> targetArns;

  VpcLink({
    this.description,
    this.id,
    this.name,
    this.status,
    this.statusMessage,
    this.tags,
    this.targetArns,
  });
  factory VpcLink.fromJson(Map<String, dynamic> json) =>
      _$VpcLinkFromJson(json);
}

enum VpcLinkStatus {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
}

/// The collection of VPC links under the caller's account in a region.
/// <div class="seeAlso"> <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-with-private-integration.html">Getting
/// Started with Private Integrations</a>, <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-private-integration.html">Set
/// up Private Integrations</a> </div>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcLinks {
  /// The current page of elements from this collection.
  @_s.JsonKey(name: 'item')
  final List<VpcLink> items;
  @_s.JsonKey(name: 'position')
  final String position;

  VpcLinks({
    this.items,
    this.position,
  });
  factory VpcLinks.fromJson(Map<String, dynamic> json) =>
      _$VpcLinksFromJson(json);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String type, String message})
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
