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

part '2018-11-29.g.dart';

/// Amazon API Gateway V2
class ApiGatewayV2 {
  final _s.RestJsonProtocol _protocol;
  ApiGatewayV2({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'apigateway',
            signingName: 'apigateway',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates an Api resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the API.
  ///
  /// Parameter [protocolType] :
  /// The API protocol.
  ///
  /// Parameter [apiKeySelectionExpression] :
  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  ///
  /// Parameter [corsConfiguration] :
  /// A CORS configuration. Supported only for HTTP APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-cors.html">Configuring
  /// CORS</a> for more information.
  ///
  /// Parameter [credentialsArn] :
  /// This property is part of quick create. It specifies the credentials
  /// required for the integration, if any. For a Lambda integration, three
  /// options are available. To specify an IAM Role for API Gateway to assume,
  /// use the role's Amazon Resource Name (ARN). To require that the caller's
  /// identity be passed through from the request, specify
  /// arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS
  /// services, specify null. Currently, this property is not used for HTTP
  /// integrations. Supported only for HTTP APIs.
  ///
  /// Parameter [description] :
  /// The description of the API.
  ///
  /// Parameter [disableExecuteApiEndpoint] :
  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  ///
  /// Parameter [disableSchemaValidation] :
  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  ///
  /// Parameter [routeKey] :
  /// This property is part of quick create. If you don't specify a routeKey, a
  /// default route of $default is created. The $default route acts as a
  /// catch-all for any request made to your API, for a particular stage. The
  /// $default route key can't be modified. You can add routes after creating
  /// the API, and you can update the route keys of additional routes. Supported
  /// only for HTTP APIs.
  ///
  /// Parameter [routeSelectionExpression] :
  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is
  /// required for WebSocket APIs.
  ///
  /// Parameter [tags] :
  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  ///
  /// Parameter [target] :
  /// This property is part of quick create. Quick create produces an API with
  /// an integration, a default catch-all route, and a default stage which is
  /// configured to automatically deploy changes. For HTTP integrations, specify
  /// a fully qualified URL. For Lambda integrations, specify a function ARN.
  /// The type of the integration will be HTTP_PROXY or AWS_PROXY, respectively.
  /// Supported only for HTTP APIs.
  ///
  /// Parameter [version] :
  /// A version identifier for the API.
  Future<CreateApiResponse> createApi({
    @_s.required String name,
    @_s.required ProtocolType protocolType,
    String apiKeySelectionExpression,
    Cors corsConfiguration,
    String credentialsArn,
    String description,
    bool disableExecuteApiEndpoint,
    bool disableSchemaValidation,
    String routeKey,
    String routeSelectionExpression,
    Map<String, String> tags,
    String target,
    String version,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(protocolType, 'protocolType');
    final $payload = <String, dynamic>{
      'name': name,
      'protocolType': protocolType?.toValue() ?? '',
      if (apiKeySelectionExpression != null)
        'apiKeySelectionExpression': apiKeySelectionExpression,
      if (corsConfiguration != null) 'corsConfiguration': corsConfiguration,
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (disableExecuteApiEndpoint != null)
        'disableExecuteApiEndpoint': disableExecuteApiEndpoint,
      if (disableSchemaValidation != null)
        'disableSchemaValidation': disableSchemaValidation,
      if (routeKey != null) 'routeKey': routeKey,
      if (routeSelectionExpression != null)
        'routeSelectionExpression': routeSelectionExpression,
      if (tags != null) 'tags': tags,
      if (target != null) 'target': target,
      if (version != null) 'version': version,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/apis',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApiResponse.fromJson(response);
  }

  /// Creates an API mapping.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [domainName] :
  /// The domain name.
  ///
  /// Parameter [stage] :
  /// The API stage.
  ///
  /// Parameter [apiMappingKey] :
  /// The API mapping key.
  Future<CreateApiMappingResponse> createApiMapping({
    @_s.required String apiId,
    @_s.required String domainName,
    @_s.required String stage,
    String apiMappingKey,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(domainName, 'domainName');
    ArgumentError.checkNotNull(stage, 'stage');
    final $payload = <String, dynamic>{
      'apiId': apiId,
      'stage': stage,
      if (apiMappingKey != null) 'apiMappingKey': apiMappingKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName)}/apimappings',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApiMappingResponse.fromJson(response);
  }

  /// Creates an Authorizer for an API.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [authorizerType] :
  /// The authorizer type. Specify REQUEST for a Lambda function using incoming
  /// request parameters. Specify JWT to use JSON Web Tokens (supported only for
  /// HTTP APIs).
  ///
  /// Parameter [identitySource] :
  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. The identity
  /// source can be headers, query string parameters, stage variables, and
  /// context parameters. For example, if an Auth header and a Name query string
  /// parameter are defined as identity sources, this value is
  /// route.request.header.Auth, route.request.querystring.Name for WebSocket
  /// APIs. For HTTP APIs, use selection expressions prefixed with $, for
  /// example, $request.header.Auth, $request.querystring.Name. These parameters
  /// are used to perform runtime validation for Lambda-based authorizers by
  /// verifying all of the identity-related request parameters are present in
  /// the request, not null, and non-empty. Only when this is true does the
  /// authorizer invoke the authorizer Lambda function. Otherwise, it returns a
  /// 401 Unauthorized response without calling the Lambda function. For HTTP
  /// APIs, identity sources are also used as the cache key when caching is
  /// enabled. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT) from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// $request.header.Authorization.
  ///
  /// Parameter [name] :
  /// The name of the authorizer.
  ///
  /// Parameter [authorizerCredentialsArn] :
  /// Specifies the required credentials as an IAM role for API Gateway to
  /// invoke the authorizer. To specify an IAM role for API Gateway to assume,
  /// use the role's Amazon Resource Name (ARN). To use resource-based
  /// permissions on the Lambda function, don't specify this parameter.
  /// Supported only for REQUEST authorizers.
  ///
  /// Parameter [authorizerPayloadFormatVersion] :
  /// Specifies the format of the payload sent to an HTTP API Lambda authorizer.
  /// Required for HTTP API Lambda authorizers. Supported values are 1.0 and
  /// 2.0. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  ///
  /// Parameter [authorizerResultTtlInSeconds] :
  /// The time to live (TTL) for cached authorizer results, in seconds. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway caches authorizer responses. The maximum value is 3600, or 1 hour.
  /// Supported only for HTTP API Lambda authorizers.
  ///
  /// Parameter [authorizerUri] :
  /// The authorizer's Uniform Resource Identifier (URI). For REQUEST
  /// authorizers, this must be a well-formed Lambda function URI, for example,
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>
  /// , where <replaceable></replaceable>{region} is the same as the region
  /// hosting the Lambda function, path indicates that the remaining substring
  /// in the URI should be treated as the path to the resource, including the
  /// initial /. For Lambda functions, this is usually of the form
  /// /2015-03-31/functions/[FunctionARN]/invocations. Supported only for
  /// REQUEST authorizers.
  ///
  /// Parameter [enableSimpleResponses] :
  /// Specifies whether a Lambda authorizer returns a response in a simple
  /// format. By default, a Lambda authorizer must return an IAM policy. If
  /// enabled, the Lambda authorizer can return a boolean value instead of an
  /// IAM policy. Supported only for HTTP APIs. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>
  ///
  /// Parameter [identityValidationExpression] :
  /// This parameter is not used.
  ///
  /// Parameter [jwtConfiguration] :
  /// Represents the configuration of a JWT authorizer. Required for the JWT
  /// authorizer type. Supported only for HTTP APIs.
  Future<CreateAuthorizerResponse> createAuthorizer({
    @_s.required String apiId,
    @_s.required AuthorizerType authorizerType,
    @_s.required List<String> identitySource,
    @_s.required String name,
    String authorizerCredentialsArn,
    String authorizerPayloadFormatVersion,
    int authorizerResultTtlInSeconds,
    String authorizerUri,
    bool enableSimpleResponses,
    String identityValidationExpression,
    JWTConfiguration jwtConfiguration,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(authorizerType, 'authorizerType');
    ArgumentError.checkNotNull(identitySource, 'identitySource');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateNumRange(
      'authorizerResultTtlInSeconds',
      authorizerResultTtlInSeconds,
      0,
      3600,
    );
    final $payload = <String, dynamic>{
      'authorizerType': authorizerType?.toValue() ?? '',
      'identitySource': identitySource,
      'name': name,
      if (authorizerCredentialsArn != null)
        'authorizerCredentialsArn': authorizerCredentialsArn,
      if (authorizerPayloadFormatVersion != null)
        'authorizerPayloadFormatVersion': authorizerPayloadFormatVersion,
      if (authorizerResultTtlInSeconds != null)
        'authorizerResultTtlInSeconds': authorizerResultTtlInSeconds,
      if (authorizerUri != null) 'authorizerUri': authorizerUri,
      if (enableSimpleResponses != null)
        'enableSimpleResponses': enableSimpleResponses,
      if (identityValidationExpression != null)
        'identityValidationExpression': identityValidationExpression,
      if (jwtConfiguration != null) 'jwtConfiguration': jwtConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/authorizers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAuthorizerResponse.fromJson(response);
  }

  /// Creates a Deployment for an API.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [description] :
  /// The description for the deployment resource.
  ///
  /// Parameter [stageName] :
  /// The name of the Stage resource for the Deployment resource to create.
  Future<CreateDeploymentResponse> createDeployment({
    @_s.required String apiId,
    String description,
    String stageName,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (stageName != null) 'stageName': stageName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/deployments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDeploymentResponse.fromJson(response);
  }

  /// Creates a domain name.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domainName] :
  /// The domain name.
  ///
  /// Parameter [domainNameConfigurations] :
  /// The domain name configurations.
  ///
  /// Parameter [mutualTlsAuthentication] :
  /// The mutual TLS authentication configuration for a custom domain name.
  ///
  /// Parameter [tags] :
  /// The collection of tags associated with a domain name.
  Future<CreateDomainNameResponse> createDomainName({
    @_s.required String domainName,
    List<DomainNameConfiguration> domainNameConfigurations,
    MutualTlsAuthenticationInput mutualTlsAuthentication,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    final $payload = <String, dynamic>{
      'domainName': domainName,
      if (domainNameConfigurations != null)
        'domainNameConfigurations': domainNameConfigurations,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/domainnames',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDomainNameResponse.fromJson(response);
  }

  /// Creates an Integration.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [integrationType] :
  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service
  /// action, including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with a Lambda
  /// function or other AWS service action. This integration is also referred to
  /// as a Lambda proxy integration.
  ///
  /// HTTP: for integrating the route or method request with an HTTP endpoint.
  /// This integration is also referred to as the HTTP custom integration.
  /// Supported only for WebSocket APIs.
  ///
  /// HTTP_PROXY: for integrating the route or method request with an HTTP
  /// endpoint, with the client request passed through as-is. This is also
  /// referred to as HTTP proxy integration. For HTTP API private integrations,
  /// use an HTTP_PROXY integration.
  ///
  /// MOCK: for integrating the route or method request with API Gateway as a
  /// "loopback" endpoint without invoking any backend. Supported only for
  /// WebSocket APIs.
  ///
  /// Parameter [connectionId] :
  /// The ID of the VPC link for a private integration. Supported only for HTTP
  /// APIs.
  ///
  /// Parameter [connectionType] :
  /// The type of the network connection to the integration endpoint. Specify
  /// INTERNET for connections through the public routable internet or VPC_LINK
  /// for private connections between API Gateway and resources in a VPC. The
  /// default value is INTERNET.
  ///
  /// Parameter [contentHandlingStrategy] :
  /// Supported only for WebSocket APIs. Specifies how to handle response
  /// payload content type conversions. Supported values are CONVERT_TO_BINARY
  /// and CONVERT_TO_TEXT, with the following behaviors:
  ///
  /// CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  /// CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  ///
  /// Parameter [credentialsArn] :
  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on
  /// supported AWS services, specify null.
  ///
  /// Parameter [description] :
  /// The description of the integration.
  ///
  /// Parameter [integrationMethod] :
  /// Specifies the integration's HTTP method type.
  ///
  /// Parameter [integrationSubtype] :
  /// Supported only for HTTP API AWS_PROXY integrations. Specifies the AWS
  /// service action to invoke. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services-reference.html">Integration
  /// subtype reference</a>.
  ///
  /// Parameter [integrationUri] :
  /// For a Lambda integration, specify the URI of a Lambda function.
  ///
  /// For an HTTP integration, specify a fully-qualified URL.
  ///
  /// For an HTTP API private integration, specify the ARN of an Application
  /// Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map
  /// service. If you specify the ARN of an AWS Cloud Map service, API Gateway
  /// uses DiscoverInstances to identify resources. You can use query parameters
  /// to target specific resources. To learn more, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>.
  /// For private integrations, all resources must be owned by the same AWS
  /// account.
  ///
  /// Parameter [passthroughBehavior] :
  /// Specifies the pass-through behavior for incoming requests based on the
  /// Content-Type header in the request, and the available mapping templates
  /// specified as the requestTemplates property on the Integration resource.
  /// There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
  /// Supported only for WebSocket APIs.
  ///
  /// WHEN_NO_MATCH passes the request body for unmapped content types through
  /// to the integration backend without transformation.
  ///
  /// NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  /// WHEN_NO_TEMPLATES allows pass-through when the integration has no content
  /// types mapped to templates. However, if there is at least one content type
  /// defined, unmapped content types will be rejected with the same HTTP 415
  /// Unsupported Media Type response.
  ///
  /// Parameter [payloadFormatVersion] :
  /// Specifies the format of the payload sent to an integration. Required for
  /// HTTP APIs.
  ///
  /// Parameter [requestParameters] :
  /// For WebSocket APIs, a key-value map specifying request parameters that are
  /// passed from the method request to the backend. The key is an integration
  /// request parameter name and the associated value is a method request
  /// parameter value or static value that must be enclosed within single quotes
  /// and pre-encoded as required by the backend. The method request parameter
  /// value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name.
  ///
  /// For HTTP API integrations with a specified integrationSubtype, request
  /// parameters are a key-value map specifying parameters that are passed to
  /// AWS_PROXY integrations. You can provide static values, or map request
  /// data, stage variables, or context variables that are evaluated at runtime.
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services.html">Working
  /// with AWS service integrations for HTTP APIs</a>.
  ///
  /// For HTTP API integrations without a specified integrationSubtype request
  /// parameters are a key-value map specifying how to transform HTTP requests
  /// before sending them to the backend. The key should follow the pattern
  /// &lt;action&gt;:&lt;header|querystring|path&gt;.&lt;location&gt; where
  /// action can be append, overwrite or remove. For values, you can provide
  /// static values, or map request data, stage variables, or context variables
  /// that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  ///
  /// Parameter [requestTemplates] :
  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  ///
  /// Parameter [responseParameters] :
  /// Supported only for HTTP APIs. You use response parameters to transform the
  /// HTTP response from a backend integration before returning the response to
  /// clients. Specify a key-value map from a selection key to response
  /// parameters. The selection key must be a valid HTTP status code within the
  /// range of 200-599. Response parameters are a key-value map. The key must
  /// match pattern &lt;action&gt;:&lt;header&gt;.&lt;location&gt; or
  /// overwrite.statuscode. The action can be append, overwrite or remove. The
  /// value can be a static value, or map to response data, stage variables, or
  /// context variables that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  ///
  /// Parameter [templateSelectionExpression] :
  /// The template selection expression for the integration.
  ///
  /// Parameter [timeoutInMillis] :
  /// Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and
  /// between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is
  /// 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs.
  ///
  /// Parameter [tlsConfig] :
  /// The TLS configuration for a private integration. If you specify a TLS
  /// configuration, private integration traffic uses the HTTPS protocol.
  /// Supported only for HTTP APIs.
  Future<CreateIntegrationResult> createIntegration({
    @_s.required String apiId,
    @_s.required IntegrationType integrationType,
    String connectionId,
    ConnectionType connectionType,
    ContentHandlingStrategy contentHandlingStrategy,
    String credentialsArn,
    String description,
    String integrationMethod,
    String integrationSubtype,
    String integrationUri,
    PassthroughBehavior passthroughBehavior,
    String payloadFormatVersion,
    Map<String, String> requestParameters,
    Map<String, String> requestTemplates,
    Map<String, Map<String, String>> responseParameters,
    String templateSelectionExpression,
    int timeoutInMillis,
    TlsConfigInput tlsConfig,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(integrationType, 'integrationType');
    _s.validateNumRange(
      'timeoutInMillis',
      timeoutInMillis,
      50,
      30000,
    );
    final $payload = <String, dynamic>{
      'integrationType': integrationType?.toValue() ?? '',
      if (connectionId != null) 'connectionId': connectionId,
      if (connectionType != null) 'connectionType': connectionType.toValue(),
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.toValue(),
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (integrationMethod != null) 'integrationMethod': integrationMethod,
      if (integrationSubtype != null) 'integrationSubtype': integrationSubtype,
      if (integrationUri != null) 'integrationUri': integrationUri,
      if (passthroughBehavior != null)
        'passthroughBehavior': passthroughBehavior.toValue(),
      if (payloadFormatVersion != null)
        'payloadFormatVersion': payloadFormatVersion,
      if (requestParameters != null) 'requestParameters': requestParameters,
      if (requestTemplates != null) 'requestTemplates': requestTemplates,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (templateSelectionExpression != null)
        'templateSelectionExpression': templateSelectionExpression,
      if (timeoutInMillis != null) 'timeoutInMillis': timeoutInMillis,
      if (tlsConfig != null) 'tlsConfig': tlsConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/integrations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIntegrationResult.fromJson(response);
  }

  /// Creates an IntegrationResponses.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [integrationId] :
  /// The integration ID.
  ///
  /// Parameter [integrationResponseKey] :
  /// The integration response key.
  ///
  /// Parameter [contentHandlingStrategy] :
  /// Specifies how to handle response payload content type conversions.
  /// Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the
  /// following behaviors:
  ///
  /// CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  /// CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  ///
  /// Parameter [responseParameters] :
  /// A key-value map specifying response parameters that are passed to the
  /// method response from the backend. The key is a method response header
  /// parameter name and the mapped value is an integration response header
  /// value, a static value enclosed within a pair of single quotes, or a JSON
  /// expression from the integration response body. The mapping key must match
  /// the pattern of method.response.header.{name}, where {name} is a valid and
  /// unique header name. The mapped non-static value must match the pattern of
  /// integration.response.header.{name} or
  /// integration.response.body.{JSON-expression}, where {name} is a valid and
  /// unique response header name and {JSON-expression} is a valid JSON
  /// expression without the $ prefix.
  ///
  /// Parameter [responseTemplates] :
  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are
  /// represented as a key/value map, with a content-type as the key and a
  /// template as the value.
  ///
  /// Parameter [templateSelectionExpression] :
  /// The template selection expression for the integration response. Supported
  /// only for WebSocket APIs.
  Future<CreateIntegrationResponseResponse> createIntegrationResponse({
    @_s.required String apiId,
    @_s.required String integrationId,
    @_s.required String integrationResponseKey,
    ContentHandlingStrategy contentHandlingStrategy,
    Map<String, String> responseParameters,
    Map<String, String> responseTemplates,
    String templateSelectionExpression,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(integrationId, 'integrationId');
    ArgumentError.checkNotNull(
        integrationResponseKey, 'integrationResponseKey');
    final $payload = <String, dynamic>{
      'integrationResponseKey': integrationResponseKey,
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.toValue(),
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (responseTemplates != null) 'responseTemplates': responseTemplates,
      if (templateSelectionExpression != null)
        'templateSelectionExpression': templateSelectionExpression,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/integrations/${Uri.encodeComponent(integrationId)}/integrationresponses',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIntegrationResponseResponse.fromJson(response);
  }

  /// Creates a Model for an API.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [name] :
  /// The name of the model. Must be alphanumeric.
  ///
  /// Parameter [schema] :
  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  ///
  /// Parameter [contentType] :
  /// The content-type for the model, for example, "application/json".
  ///
  /// Parameter [description] :
  /// The description of the model.
  Future<CreateModelResponse> createModel({
    @_s.required String apiId,
    @_s.required String name,
    @_s.required String schema,
    String contentType,
    String description,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(schema, 'schema');
    final $payload = <String, dynamic>{
      'name': name,
      'schema': schema,
      if (contentType != null) 'contentType': contentType,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/models',
      exceptionFnMap: _exceptionFns,
    );
    return CreateModelResponse.fromJson(response);
  }

  /// Creates a Route for an API.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [routeKey] :
  /// The route key for the route.
  ///
  /// Parameter [apiKeyRequired] :
  /// Specifies whether an API key is required for the route. Supported only for
  /// WebSocket APIs.
  ///
  /// Parameter [authorizationScopes] :
  /// The authorization scopes supported by this route.
  ///
  /// Parameter [authorizationType] :
  /// The authorization type for the route. For WebSocket APIs, valid values are
  /// NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM
  /// for using a Lambda authorizer For HTTP APIs, valid values are NONE for
  /// open access, JWT for using JSON Web Tokens, AWS_IAM for using AWS IAM
  /// permissions, and CUSTOM for using a Lambda authorizer.
  ///
  /// Parameter [authorizerId] :
  /// The identifier of the Authorizer resource to be associated with this
  /// route. The authorizer identifier is generated by API Gateway when you
  /// created the authorizer.
  ///
  /// Parameter [modelSelectionExpression] :
  /// The model selection expression for the route. Supported only for WebSocket
  /// APIs.
  ///
  /// Parameter [operationName] :
  /// The operation name for the route.
  ///
  /// Parameter [requestModels] :
  /// The request models for the route. Supported only for WebSocket APIs.
  ///
  /// Parameter [requestParameters] :
  /// The request parameters for the route. Supported only for WebSocket APIs.
  ///
  /// Parameter [routeResponseSelectionExpression] :
  /// The route response selection expression for the route. Supported only for
  /// WebSocket APIs.
  ///
  /// Parameter [target] :
  /// The target for the route.
  Future<CreateRouteResult> createRoute({
    @_s.required String apiId,
    @_s.required String routeKey,
    bool apiKeyRequired,
    List<String> authorizationScopes,
    AuthorizationType authorizationType,
    String authorizerId,
    String modelSelectionExpression,
    String operationName,
    Map<String, String> requestModels,
    Map<String, ParameterConstraints> requestParameters,
    String routeResponseSelectionExpression,
    String target,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(routeKey, 'routeKey');
    final $payload = <String, dynamic>{
      'routeKey': routeKey,
      if (apiKeyRequired != null) 'apiKeyRequired': apiKeyRequired,
      if (authorizationScopes != null)
        'authorizationScopes': authorizationScopes,
      if (authorizationType != null)
        'authorizationType': authorizationType.toValue(),
      if (authorizerId != null) 'authorizerId': authorizerId,
      if (modelSelectionExpression != null)
        'modelSelectionExpression': modelSelectionExpression,
      if (operationName != null) 'operationName': operationName,
      if (requestModels != null) 'requestModels': requestModels,
      if (requestParameters != null) 'requestParameters': requestParameters,
      if (routeResponseSelectionExpression != null)
        'routeResponseSelectionExpression': routeResponseSelectionExpression,
      if (target != null) 'target': target,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/routes',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRouteResult.fromJson(response);
  }

  /// Creates a RouteResponse for a Route.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [routeId] :
  /// The route ID.
  ///
  /// Parameter [routeResponseKey] :
  /// The route response key.
  ///
  /// Parameter [modelSelectionExpression] :
  /// The model selection expression for the route response. Supported only for
  /// WebSocket APIs.
  ///
  /// Parameter [responseModels] :
  /// The response models for the route response.
  ///
  /// Parameter [responseParameters] :
  /// The route response parameters.
  Future<CreateRouteResponseResponse> createRouteResponse({
    @_s.required String apiId,
    @_s.required String routeId,
    @_s.required String routeResponseKey,
    String modelSelectionExpression,
    Map<String, String> responseModels,
    Map<String, ParameterConstraints> responseParameters,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(routeId, 'routeId');
    ArgumentError.checkNotNull(routeResponseKey, 'routeResponseKey');
    final $payload = <String, dynamic>{
      'routeResponseKey': routeResponseKey,
      if (modelSelectionExpression != null)
        'modelSelectionExpression': modelSelectionExpression,
      if (responseModels != null) 'responseModels': responseModels,
      if (responseParameters != null) 'responseParameters': responseParameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/routes/${Uri.encodeComponent(routeId)}/routeresponses',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRouteResponseResponse.fromJson(response);
  }

  /// Creates a Stage for an API.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [stageName] :
  /// The name of the stage.
  ///
  /// Parameter [accessLogSettings] :
  /// Settings for logging access in this stage.
  ///
  /// Parameter [autoDeploy] :
  /// Specifies whether updates to an API automatically trigger a new
  /// deployment. The default value is false.
  ///
  /// Parameter [clientCertificateId] :
  /// The identifier of a client certificate for a Stage. Supported only for
  /// WebSocket APIs.
  ///
  /// Parameter [defaultRouteSettings] :
  /// The default route settings for the stage.
  ///
  /// Parameter [deploymentId] :
  /// The deployment identifier of the API stage.
  ///
  /// Parameter [description] :
  /// The description for the API stage.
  ///
  /// Parameter [routeSettings] :
  /// Route settings for the stage, by routeKey.
  ///
  /// Parameter [stageVariables] :
  /// A map that defines the stage variables for a Stage. Variable names can
  /// have alphanumeric and underscore characters, and the values must match
  /// [A-Za-z0-9-._~:/?#&amp;=,]+.
  ///
  /// Parameter [tags] :
  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  Future<CreateStageResponse> createStage({
    @_s.required String apiId,
    @_s.required String stageName,
    AccessLogSettings accessLogSettings,
    bool autoDeploy,
    String clientCertificateId,
    RouteSettings defaultRouteSettings,
    String deploymentId,
    String description,
    Map<String, RouteSettings> routeSettings,
    Map<String, String> stageVariables,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
    final $payload = <String, dynamic>{
      'stageName': stageName,
      if (accessLogSettings != null) 'accessLogSettings': accessLogSettings,
      if (autoDeploy != null) 'autoDeploy': autoDeploy,
      if (clientCertificateId != null)
        'clientCertificateId': clientCertificateId,
      if (defaultRouteSettings != null)
        'defaultRouteSettings': defaultRouteSettings,
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (description != null) 'description': description,
      if (routeSettings != null) 'routeSettings': routeSettings,
      if (stageVariables != null) 'stageVariables': stageVariables,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/stages',
      exceptionFnMap: _exceptionFns,
    );
    return CreateStageResponse.fromJson(response);
  }

  /// Creates a VPC link.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the VPC link.
  ///
  /// Parameter [subnetIds] :
  /// A list of subnet IDs to include in the VPC link.
  ///
  /// Parameter [securityGroupIds] :
  /// A list of security group IDs for the VPC link.
  ///
  /// Parameter [tags] :
  /// A list of tags.
  Future<CreateVpcLinkResponse> createVpcLink({
    @_s.required String name,
    @_s.required List<String> subnetIds,
    List<String> securityGroupIds,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    final $payload = <String, dynamic>{
      'name': name,
      'subnetIds': subnetIds,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/vpclinks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVpcLinkResponse.fromJson(response);
  }

  /// Deletes the AccessLogSettings for a Stage. To disable access logging for a
  /// Stage, delete its AccessLogSettings.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [stageName] :
  /// The stage name. Stage names can only contain alphanumeric characters,
  /// hyphens, and underscores. Maximum length is 128 characters.
  Future<void> deleteAccessLogSettings({
    @_s.required String apiId,
    @_s.required String stageName,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/stages/${Uri.encodeComponent(stageName)}/accesslogsettings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Api resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  Future<void> deleteApi({
    @_s.required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an API mapping.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [apiMappingId] :
  /// The API mapping identifier.
  ///
  /// Parameter [domainName] :
  /// The domain name.
  Future<void> deleteApiMapping({
    @_s.required String apiMappingId,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(apiMappingId, 'apiMappingId');
    ArgumentError.checkNotNull(domainName, 'domainName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName)}/apimappings/${Uri.encodeComponent(apiMappingId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Authorizer.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [authorizerId] :
  /// The authorizer identifier.
  Future<void> deleteAuthorizer({
    @_s.required String apiId,
    @_s.required String authorizerId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(authorizerId, 'authorizerId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/authorizers/${Uri.encodeComponent(authorizerId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a CORS configuration.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  Future<void> deleteCorsConfiguration({
    @_s.required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/cors',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Deployment.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [deploymentId] :
  /// The deployment ID.
  Future<void> deleteDeployment({
    @_s.required String apiId,
    @_s.required String deploymentId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/deployments/${Uri.encodeComponent(deploymentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a domain name.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The domain name.
  Future<void> deleteDomainName({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/domainnames/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Integration.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [integrationId] :
  /// The integration ID.
  Future<void> deleteIntegration({
    @_s.required String apiId,
    @_s.required String integrationId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(integrationId, 'integrationId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/integrations/${Uri.encodeComponent(integrationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an IntegrationResponses.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [integrationId] :
  /// The integration ID.
  ///
  /// Parameter [integrationResponseId] :
  /// The integration response ID.
  Future<void> deleteIntegrationResponse({
    @_s.required String apiId,
    @_s.required String integrationId,
    @_s.required String integrationResponseId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(integrationId, 'integrationId');
    ArgumentError.checkNotNull(integrationResponseId, 'integrationResponseId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/integrations/${Uri.encodeComponent(integrationId)}/integrationresponses/${Uri.encodeComponent(integrationResponseId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Model.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [modelId] :
  /// The model ID.
  Future<void> deleteModel({
    @_s.required String apiId,
    @_s.required String modelId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(modelId, 'modelId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/models/${Uri.encodeComponent(modelId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Route.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [routeId] :
  /// The route ID.
  Future<void> deleteRoute({
    @_s.required String apiId,
    @_s.required String routeId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(routeId, 'routeId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/routes/${Uri.encodeComponent(routeId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a route request parameter.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [requestParameterKey] :
  /// The route request parameter key.
  ///
  /// Parameter [routeId] :
  /// The route ID.
  Future<void> deleteRouteRequestParameter({
    @_s.required String apiId,
    @_s.required String requestParameterKey,
    @_s.required String routeId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(requestParameterKey, 'requestParameterKey');
    ArgumentError.checkNotNull(routeId, 'routeId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/routes/${Uri.encodeComponent(routeId)}/requestparameters/${Uri.encodeComponent(requestParameterKey)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a RouteResponse.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [routeId] :
  /// The route ID.
  ///
  /// Parameter [routeResponseId] :
  /// The route response ID.
  Future<void> deleteRouteResponse({
    @_s.required String apiId,
    @_s.required String routeId,
    @_s.required String routeResponseId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(routeId, 'routeId');
    ArgumentError.checkNotNull(routeResponseId, 'routeResponseId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/routes/${Uri.encodeComponent(routeId)}/routeresponses/${Uri.encodeComponent(routeResponseId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the RouteSettings for a stage.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [routeKey] :
  /// The route key.
  ///
  /// Parameter [stageName] :
  /// The stage name. Stage names can only contain alphanumeric characters,
  /// hyphens, and underscores. Maximum length is 128 characters.
  Future<void> deleteRouteSettings({
    @_s.required String apiId,
    @_s.required String routeKey,
    @_s.required String stageName,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(routeKey, 'routeKey');
    ArgumentError.checkNotNull(stageName, 'stageName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/stages/${Uri.encodeComponent(stageName)}/routesettings/${Uri.encodeComponent(routeKey)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a Stage.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [stageName] :
  /// The stage name. Stage names can only contain alphanumeric characters,
  /// hyphens, and underscores. Maximum length is 128 characters.
  Future<void> deleteStage({
    @_s.required String apiId,
    @_s.required String stageName,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/stages/${Uri.encodeComponent(stageName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a VPC link.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [vpcLinkId] :
  /// The ID of the VPC link.
  Future<void> deleteVpcLink({
    @_s.required String vpcLinkId,
  }) async {
    ArgumentError.checkNotNull(vpcLinkId, 'vpcLinkId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/vpclinks/${Uri.encodeComponent(vpcLinkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteVpcLinkResponse.fromJson(response);
  }

  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [outputType] :
  /// The output type of the exported definition file. Valid values are JSON and
  /// YAML.
  ///
  /// Parameter [specification] :
  /// The version of the API specification to use. OAS30, for OpenAPI 3.0, is
  /// the only supported value.
  ///
  /// Parameter [exportVersion] :
  /// The version of the API Gateway export algorithm. API Gateway uses the
  /// latest version by default. Currently, the only supported version is 1.0.
  ///
  /// Parameter [includeExtensions] :
  /// Specifies whether to include <a
  /// href="https://docs.aws.amazon.com//apigateway/latest/developerguide/api-gateway-swagger-extensions.html">API
  /// Gateway extensions</a> in the exported API definition. API Gateway
  /// extensions are included by default.
  ///
  /// Parameter [stageName] :
  /// The name of the API stage to export. If you don't specify this property, a
  /// representation of the latest API configuration is exported.
  Future<ExportApiResponse> exportApi({
    @_s.required String apiId,
    @_s.required String outputType,
    @_s.required String specification,
    String exportVersion,
    bool includeExtensions,
    String stageName,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(outputType, 'outputType');
    ArgumentError.checkNotNull(specification, 'specification');
    final $query = <String, List<String>>{
      if (outputType != null) 'outputType': [outputType],
      if (exportVersion != null) 'exportVersion': [exportVersion],
      if (includeExtensions != null)
        'includeExtensions': [includeExtensions.toString()],
      if (stageName != null) 'stageName': [stageName],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/exports/${Uri.encodeComponent(specification)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ExportApiResponse(
      body: await response.stream.toBytes(),
    );
  }

  /// Resets all authorizer cache entries on a stage. Supported only for HTTP
  /// APIs.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [stageName] :
  /// The stage name. Stage names can contain only alphanumeric characters,
  /// hyphens, and underscores, or be $default. Maximum length is 128
  /// characters.
  Future<void> resetAuthorizersCache({
    @_s.required String apiId,
    @_s.required String stageName,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/stages/${Uri.encodeComponent(stageName)}/cache/authorizers',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets an Api resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  Future<GetApiResponse> getApi({
    @_s.required String apiId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApiResponse.fromJson(response);
  }

  /// Gets an API mapping.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [apiMappingId] :
  /// The API mapping identifier.
  ///
  /// Parameter [domainName] :
  /// The domain name.
  Future<GetApiMappingResponse> getApiMapping({
    @_s.required String apiMappingId,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(apiMappingId, 'apiMappingId');
    ArgumentError.checkNotNull(domainName, 'domainName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName)}/apimappings/${Uri.encodeComponent(apiMappingId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApiMappingResponse.fromJson(response);
  }

  /// Gets API mappings.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [domainName] :
  /// The domain name.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<GetApiMappingsResponse> getApiMappings({
    @_s.required String domainName,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName)}/apimappings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetApiMappingsResponse.fromJson(response);
  }

  /// Gets a collection of Api resources.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<GetApisResponse> getApis({
    String maxResults,
    String nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/apis',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetApisResponse.fromJson(response);
  }

  /// Gets an Authorizer.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [authorizerId] :
  /// The authorizer identifier.
  Future<GetAuthorizerResponse> getAuthorizer({
    @_s.required String apiId,
    @_s.required String authorizerId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(authorizerId, 'authorizerId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/authorizers/${Uri.encodeComponent(authorizerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAuthorizerResponse.fromJson(response);
  }

  /// Gets the Authorizers for an API.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<GetAuthorizersResponse> getAuthorizers({
    @_s.required String apiId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/authorizers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAuthorizersResponse.fromJson(response);
  }

  /// Gets a Deployment.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [deploymentId] :
  /// The deployment ID.
  Future<GetDeploymentResponse> getDeployment({
    @_s.required String apiId,
    @_s.required String deploymentId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/deployments/${Uri.encodeComponent(deploymentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeploymentResponse.fromJson(response);
  }

  /// Gets the Deployments for an API.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<GetDeploymentsResponse> getDeployments({
    @_s.required String apiId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/deployments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDeploymentsResponse.fromJson(response);
  }

  /// Gets a domain name.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The domain name.
  Future<GetDomainNameResponse> getDomainName({
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/domainnames/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainNameResponse.fromJson(response);
  }

  /// Gets the domain names for an AWS account.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<GetDomainNamesResponse> getDomainNames({
    String maxResults,
    String nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/domainnames',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDomainNamesResponse.fromJson(response);
  }

  /// Gets an Integration.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [integrationId] :
  /// The integration ID.
  Future<GetIntegrationResult> getIntegration({
    @_s.required String apiId,
    @_s.required String integrationId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(integrationId, 'integrationId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/integrations/${Uri.encodeComponent(integrationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIntegrationResult.fromJson(response);
  }

  /// Gets an IntegrationResponses.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [integrationId] :
  /// The integration ID.
  ///
  /// Parameter [integrationResponseId] :
  /// The integration response ID.
  Future<GetIntegrationResponseResponse> getIntegrationResponse({
    @_s.required String apiId,
    @_s.required String integrationId,
    @_s.required String integrationResponseId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(integrationId, 'integrationId');
    ArgumentError.checkNotNull(integrationResponseId, 'integrationResponseId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/integrations/${Uri.encodeComponent(integrationId)}/integrationresponses/${Uri.encodeComponent(integrationResponseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIntegrationResponseResponse.fromJson(response);
  }

  /// Gets the IntegrationResponses for an Integration.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [integrationId] :
  /// The integration ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<GetIntegrationResponsesResponse> getIntegrationResponses({
    @_s.required String apiId,
    @_s.required String integrationId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(integrationId, 'integrationId');
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/integrations/${Uri.encodeComponent(integrationId)}/integrationresponses',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetIntegrationResponsesResponse.fromJson(response);
  }

  /// Gets the Integrations for an API.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<GetIntegrationsResponse> getIntegrations({
    @_s.required String apiId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/integrations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetIntegrationsResponse.fromJson(response);
  }

  /// Gets a Model.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [modelId] :
  /// The model ID.
  Future<GetModelResponse> getModel({
    @_s.required String apiId,
    @_s.required String modelId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(modelId, 'modelId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/models/${Uri.encodeComponent(modelId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetModelResponse.fromJson(response);
  }

  /// Gets a model template.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [modelId] :
  /// The model ID.
  Future<GetModelTemplateResponse> getModelTemplate({
    @_s.required String apiId,
    @_s.required String modelId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(modelId, 'modelId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/models/${Uri.encodeComponent(modelId)}/template',
      exceptionFnMap: _exceptionFns,
    );
    return GetModelTemplateResponse.fromJson(response);
  }

  /// Gets the Models for an API.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<GetModelsResponse> getModels({
    @_s.required String apiId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetModelsResponse.fromJson(response);
  }

  /// Gets a Route.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [routeId] :
  /// The route ID.
  Future<GetRouteResult> getRoute({
    @_s.required String apiId,
    @_s.required String routeId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(routeId, 'routeId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/routes/${Uri.encodeComponent(routeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRouteResult.fromJson(response);
  }

  /// Gets a RouteResponse.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [routeId] :
  /// The route ID.
  ///
  /// Parameter [routeResponseId] :
  /// The route response ID.
  Future<GetRouteResponseResponse> getRouteResponse({
    @_s.required String apiId,
    @_s.required String routeId,
    @_s.required String routeResponseId,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(routeId, 'routeId');
    ArgumentError.checkNotNull(routeResponseId, 'routeResponseId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/routes/${Uri.encodeComponent(routeId)}/routeresponses/${Uri.encodeComponent(routeResponseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRouteResponseResponse.fromJson(response);
  }

  /// Gets the RouteResponses for a Route.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [routeId] :
  /// The route ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<GetRouteResponsesResponse> getRouteResponses({
    @_s.required String apiId,
    @_s.required String routeId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(routeId, 'routeId');
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/routes/${Uri.encodeComponent(routeId)}/routeresponses',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRouteResponsesResponse.fromJson(response);
  }

  /// Gets the Routes for an API.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<GetRoutesResponse> getRoutes({
    @_s.required String apiId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/routes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRoutesResponse.fromJson(response);
  }

  /// Gets a Stage.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [stageName] :
  /// The stage name. Stage names can only contain alphanumeric characters,
  /// hyphens, and underscores. Maximum length is 128 characters.
  Future<GetStageResponse> getStage({
    @_s.required String apiId,
    @_s.required String stageName,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/stages/${Uri.encodeComponent(stageName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStageResponse.fromJson(response);
  }

  /// Gets the Stages for an API.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<GetStagesResponse> getStages({
    @_s.required String apiId,
    String maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}/stages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetStagesResponse.fromJson(response);
  }

  /// Gets a collection of Tag resources.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The resource ARN for the tag.
  Future<GetTagsResponse> getTags({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTagsResponse.fromJson(response);
  }

  /// Gets a VPC link.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [vpcLinkId] :
  /// The ID of the VPC link.
  Future<GetVpcLinkResponse> getVpcLink({
    @_s.required String vpcLinkId,
  }) async {
    ArgumentError.checkNotNull(vpcLinkId, 'vpcLinkId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/vpclinks/${Uri.encodeComponent(vpcLinkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVpcLinkResponse.fromJson(response);
  }

  /// Gets a collection of VPC links.
  ///
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<GetVpcLinksResponse> getVpcLinks({
    String maxResults,
    String nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/vpclinks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetVpcLinksResponse.fromJson(response);
  }

  /// Imports an API.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [body] :
  /// The OpenAPI definition. Supported only for HTTP APIs.
  ///
  /// Parameter [basepath] :
  /// Specifies how to interpret the base path of the API during import. Valid
  /// values are ignore, prepend, and split. The default value is ignore. To
  /// learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-import-api-basePath.html">Set
  /// the OpenAPI basePath Property</a>. Supported only for HTTP APIs.
  ///
  /// Parameter [failOnWarnings] :
  /// Specifies whether to rollback the API creation when a warning is
  /// encountered. By default, API creation continues if a warning is
  /// encountered.
  Future<ImportApiResponse> importApi({
    @_s.required String body,
    String basepath,
    bool failOnWarnings,
  }) async {
    ArgumentError.checkNotNull(body, 'body');
    final $query = <String, List<String>>{
      if (basepath != null) 'basepath': [basepath],
      if (failOnWarnings != null) 'failOnWarnings': [failOnWarnings.toString()],
    };
    final $payload = <String, dynamic>{
      'body': body,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/apis',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ImportApiResponse.fromJson(response);
  }

  /// Puts an Api resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [body] :
  /// The OpenAPI definition. Supported only for HTTP APIs.
  ///
  /// Parameter [basepath] :
  /// Specifies how to interpret the base path of the API during import. Valid
  /// values are ignore, prepend, and split. The default value is ignore. To
  /// learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-import-api-basePath.html">Set
  /// the OpenAPI basePath Property</a>. Supported only for HTTP APIs.
  ///
  /// Parameter [failOnWarnings] :
  /// Specifies whether to rollback the API creation when a warning is
  /// encountered. By default, API creation continues if a warning is
  /// encountered.
  Future<ReimportApiResponse> reimportApi({
    @_s.required String apiId,
    @_s.required String body,
    String basepath,
    bool failOnWarnings,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(body, 'body');
    final $query = <String, List<String>>{
      if (basepath != null) 'basepath': [basepath],
      if (failOnWarnings != null) 'failOnWarnings': [failOnWarnings.toString()],
    };
    final $payload = <String, dynamic>{
      'body': body,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ReimportApiResponse.fromJson(response);
  }

  /// Creates a new Tag resource to represent a tag.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The resource ARN for the tag.
  ///
  /// Parameter [tags] :
  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  Future<void> tagResource({
    @_s.required String resourceArn,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Deletes a Tag.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The resource ARN for the tag.
  ///
  /// Parameter [tagKeys] :
  /// The Tag keys to delete
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
      requestUri: '/v2/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an Api resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [apiKeySelectionExpression] :
  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  ///
  /// Parameter [corsConfiguration] :
  /// A CORS configuration. Supported only for HTTP APIs.
  ///
  /// Parameter [credentialsArn] :
  /// This property is part of quick create. It specifies the credentials
  /// required for the integration, if any. For a Lambda integration, three
  /// options are available. To specify an IAM Role for API Gateway to assume,
  /// use the role's Amazon Resource Name (ARN). To require that the caller's
  /// identity be passed through from the request, specify
  /// arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS
  /// services, don't specify this parameter. Currently, this property is not
  /// used for HTTP integrations. If provided, this value replaces the
  /// credentials associated with the quick create integration. Supported only
  /// for HTTP APIs.
  ///
  /// Parameter [description] :
  /// The description of the API.
  ///
  /// Parameter [disableExecuteApiEndpoint] :
  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  ///
  /// Parameter [disableSchemaValidation] :
  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  ///
  /// Parameter [name] :
  /// The name of the API.
  ///
  /// Parameter [routeKey] :
  /// This property is part of quick create. If not specified, the route created
  /// using quick create is kept. Otherwise, this value replaces the route key
  /// of the quick create route. Additional routes may still be added after the
  /// API is updated. Supported only for HTTP APIs.
  ///
  /// Parameter [routeSelectionExpression] :
  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is
  /// required for WebSocket APIs.
  ///
  /// Parameter [target] :
  /// This property is part of quick create. For HTTP integrations, specify a
  /// fully qualified URL. For Lambda integrations, specify a function ARN. The
  /// type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. The
  /// value provided updates the integration URI and integration type. You can
  /// update a quick-created target, but you can't remove it from an API.
  /// Supported only for HTTP APIs.
  ///
  /// Parameter [version] :
  /// A version identifier for the API.
  Future<UpdateApiResponse> updateApi({
    @_s.required String apiId,
    String apiKeySelectionExpression,
    Cors corsConfiguration,
    String credentialsArn,
    String description,
    bool disableExecuteApiEndpoint,
    bool disableSchemaValidation,
    String name,
    String routeKey,
    String routeSelectionExpression,
    String target,
    String version,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $payload = <String, dynamic>{
      if (apiKeySelectionExpression != null)
        'apiKeySelectionExpression': apiKeySelectionExpression,
      if (corsConfiguration != null) 'corsConfiguration': corsConfiguration,
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (disableExecuteApiEndpoint != null)
        'disableExecuteApiEndpoint': disableExecuteApiEndpoint,
      if (disableSchemaValidation != null)
        'disableSchemaValidation': disableSchemaValidation,
      if (name != null) 'name': name,
      if (routeKey != null) 'routeKey': routeKey,
      if (routeSelectionExpression != null)
        'routeSelectionExpression': routeSelectionExpression,
      if (target != null) 'target': target,
      if (version != null) 'version': version,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApiResponse.fromJson(response);
  }

  /// The API mapping.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [apiMappingId] :
  /// The API mapping identifier.
  ///
  /// Parameter [domainName] :
  /// The domain name.
  ///
  /// Parameter [apiMappingKey] :
  /// The API mapping key.
  ///
  /// Parameter [stage] :
  /// The API stage.
  Future<UpdateApiMappingResponse> updateApiMapping({
    @_s.required String apiId,
    @_s.required String apiMappingId,
    @_s.required String domainName,
    String apiMappingKey,
    String stage,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(apiMappingId, 'apiMappingId');
    ArgumentError.checkNotNull(domainName, 'domainName');
    final $payload = <String, dynamic>{
      'apiId': apiId,
      if (apiMappingKey != null) 'apiMappingKey': apiMappingKey,
      if (stage != null) 'stage': stage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName)}/apimappings/${Uri.encodeComponent(apiMappingId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApiMappingResponse.fromJson(response);
  }

  /// Updates an Authorizer.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [authorizerId] :
  /// The authorizer identifier.
  ///
  /// Parameter [authorizerCredentialsArn] :
  /// Specifies the required credentials as an IAM role for API Gateway to
  /// invoke the authorizer. To specify an IAM role for API Gateway to assume,
  /// use the role's Amazon Resource Name (ARN). To use resource-based
  /// permissions on the Lambda function, don't specify this parameter.
  ///
  /// Parameter [authorizerPayloadFormatVersion] :
  /// Specifies the format of the payload sent to an HTTP API Lambda authorizer.
  /// Required for HTTP API Lambda authorizers. Supported values are 1.0 and
  /// 2.0. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  ///
  /// Parameter [authorizerResultTtlInSeconds] :
  /// The time to live (TTL) for cached authorizer results, in seconds. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway caches authorizer responses. The maximum value is 3600, or 1 hour.
  /// Supported only for HTTP API Lambda authorizers.
  ///
  /// Parameter [authorizerType] :
  /// The authorizer type. Specify REQUEST for a Lambda function using incoming
  /// request parameters. Specify JWT to use JSON Web Tokens (supported only for
  /// HTTP APIs).
  ///
  /// Parameter [authorizerUri] :
  /// The authorizer's Uniform Resource Identifier (URI). For REQUEST
  /// authorizers, this must be a well-formed Lambda function URI, for example,
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>
  /// , where <replaceable></replaceable>{region} is the same as the region
  /// hosting the Lambda function, path indicates that the remaining substring
  /// in the URI should be treated as the path to the resource, including the
  /// initial /. For Lambda functions, this is usually of the form
  /// /2015-03-31/functions/[FunctionARN]/invocations. Supported only for
  /// REQUEST authorizers.
  ///
  /// Parameter [enableSimpleResponses] :
  /// Specifies whether a Lambda authorizer returns a response in a simple
  /// format. By default, a Lambda authorizer must return an IAM policy. If
  /// enabled, the Lambda authorizer can return a boolean value instead of an
  /// IAM policy. Supported only for HTTP APIs. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>
  ///
  /// Parameter [identitySource] :
  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. The identity
  /// source can be headers, query string parameters, stage variables, and
  /// context parameters. For example, if an Auth header and a Name query string
  /// parameter are defined as identity sources, this value is
  /// route.request.header.Auth, route.request.querystring.Name for WebSocket
  /// APIs. For HTTP APIs, use selection expressions prefixed with $, for
  /// example, $request.header.Auth, $request.querystring.Name. These parameters
  /// are used to perform runtime validation for Lambda-based authorizers by
  /// verifying all of the identity-related request parameters are present in
  /// the request, not null, and non-empty. Only when this is true does the
  /// authorizer invoke the authorizer Lambda function. Otherwise, it returns a
  /// 401 Unauthorized response without calling the Lambda function. For HTTP
  /// APIs, identity sources are also used as the cache key when caching is
  /// enabled. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT) from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// $request.header.Authorization.
  ///
  /// Parameter [identityValidationExpression] :
  /// This parameter is not used.
  ///
  /// Parameter [jwtConfiguration] :
  /// Represents the configuration of a JWT authorizer. Required for the JWT
  /// authorizer type. Supported only for HTTP APIs.
  ///
  /// Parameter [name] :
  /// The name of the authorizer.
  Future<UpdateAuthorizerResponse> updateAuthorizer({
    @_s.required String apiId,
    @_s.required String authorizerId,
    String authorizerCredentialsArn,
    String authorizerPayloadFormatVersion,
    int authorizerResultTtlInSeconds,
    AuthorizerType authorizerType,
    String authorizerUri,
    bool enableSimpleResponses,
    List<String> identitySource,
    String identityValidationExpression,
    JWTConfiguration jwtConfiguration,
    String name,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(authorizerId, 'authorizerId');
    _s.validateNumRange(
      'authorizerResultTtlInSeconds',
      authorizerResultTtlInSeconds,
      0,
      3600,
    );
    final $payload = <String, dynamic>{
      if (authorizerCredentialsArn != null)
        'authorizerCredentialsArn': authorizerCredentialsArn,
      if (authorizerPayloadFormatVersion != null)
        'authorizerPayloadFormatVersion': authorizerPayloadFormatVersion,
      if (authorizerResultTtlInSeconds != null)
        'authorizerResultTtlInSeconds': authorizerResultTtlInSeconds,
      if (authorizerType != null) 'authorizerType': authorizerType.toValue(),
      if (authorizerUri != null) 'authorizerUri': authorizerUri,
      if (enableSimpleResponses != null)
        'enableSimpleResponses': enableSimpleResponses,
      if (identitySource != null) 'identitySource': identitySource,
      if (identityValidationExpression != null)
        'identityValidationExpression': identityValidationExpression,
      if (jwtConfiguration != null) 'jwtConfiguration': jwtConfiguration,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/authorizers/${Uri.encodeComponent(authorizerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAuthorizerResponse.fromJson(response);
  }

  /// Updates a Deployment.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [deploymentId] :
  /// The deployment ID.
  ///
  /// Parameter [description] :
  /// The description for the deployment resource.
  Future<UpdateDeploymentResponse> updateDeployment({
    @_s.required String apiId,
    @_s.required String deploymentId,
    String description,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(deploymentId, 'deploymentId');
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/deployments/${Uri.encodeComponent(deploymentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDeploymentResponse.fromJson(response);
  }

  /// Updates a domain name.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [domainName] :
  /// The domain name.
  ///
  /// Parameter [domainNameConfigurations] :
  /// The domain name configurations.
  ///
  /// Parameter [mutualTlsAuthentication] :
  /// The mutual TLS authentication configuration for a custom domain name.
  Future<UpdateDomainNameResponse> updateDomainName({
    @_s.required String domainName,
    List<DomainNameConfiguration> domainNameConfigurations,
    MutualTlsAuthenticationInput mutualTlsAuthentication,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    final $payload = <String, dynamic>{
      if (domainNameConfigurations != null)
        'domainNameConfigurations': domainNameConfigurations,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v2/domainnames/${Uri.encodeComponent(domainName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDomainNameResponse.fromJson(response);
  }

  /// Updates an Integration.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [integrationId] :
  /// The integration ID.
  ///
  /// Parameter [connectionId] :
  /// The ID of the VPC link for a private integration. Supported only for HTTP
  /// APIs.
  ///
  /// Parameter [connectionType] :
  /// The type of the network connection to the integration endpoint. Specify
  /// INTERNET for connections through the public routable internet or VPC_LINK
  /// for private connections between API Gateway and resources in a VPC. The
  /// default value is INTERNET.
  ///
  /// Parameter [contentHandlingStrategy] :
  /// Supported only for WebSocket APIs. Specifies how to handle response
  /// payload content type conversions. Supported values are CONVERT_TO_BINARY
  /// and CONVERT_TO_TEXT, with the following behaviors:
  ///
  /// CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  /// CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  ///
  /// Parameter [credentialsArn] :
  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on
  /// supported AWS services, specify null.
  ///
  /// Parameter [description] :
  /// The description of the integration
  ///
  /// Parameter [integrationMethod] :
  /// Specifies the integration's HTTP method type.
  ///
  /// Parameter [integrationSubtype] :
  /// Supported only for HTTP API AWS_PROXY integrations. Specifies the AWS
  /// service action to invoke. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services-reference.html">Integration
  /// subtype reference</a>.
  ///
  /// Parameter [integrationType] :
  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service
  /// action, including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with a Lambda
  /// function or other AWS service action. This integration is also referred to
  /// as a Lambda proxy integration.
  ///
  /// HTTP: for integrating the route or method request with an HTTP endpoint.
  /// This integration is also referred to as the HTTP custom integration.
  /// Supported only for WebSocket APIs.
  ///
  /// HTTP_PROXY: for integrating the route or method request with an HTTP
  /// endpoint, with the client request passed through as-is. This is also
  /// referred to as HTTP proxy integration. For HTTP API private integrations,
  /// use an HTTP_PROXY integration.
  ///
  /// MOCK: for integrating the route or method request with API Gateway as a
  /// "loopback" endpoint without invoking any backend. Supported only for
  /// WebSocket APIs.
  ///
  /// Parameter [integrationUri] :
  /// For a Lambda integration, specify the URI of a Lambda function.
  ///
  /// For an HTTP integration, specify a fully-qualified URL.
  ///
  /// For an HTTP API private integration, specify the ARN of an Application
  /// Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map
  /// service. If you specify the ARN of an AWS Cloud Map service, API Gateway
  /// uses DiscoverInstances to identify resources. You can use query parameters
  /// to target specific resources. To learn more, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>.
  /// For private integrations, all resources must be owned by the same AWS
  /// account.
  ///
  /// Parameter [passthroughBehavior] :
  /// Specifies the pass-through behavior for incoming requests based on the
  /// Content-Type header in the request, and the available mapping templates
  /// specified as the requestTemplates property on the Integration resource.
  /// There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
  /// Supported only for WebSocket APIs.
  ///
  /// WHEN_NO_MATCH passes the request body for unmapped content types through
  /// to the integration backend without transformation.
  ///
  /// NEVER rejects unmapped content types with an HTTP 415 Unsupported Media
  /// Type response.
  ///
  /// WHEN_NO_TEMPLATES allows pass-through when the integration has no content
  /// types mapped to templates. However, if there is at least one content type
  /// defined, unmapped content types will be rejected with the same HTTP 415
  /// Unsupported Media Type response.
  ///
  /// Parameter [payloadFormatVersion] :
  /// Specifies the format of the payload sent to an integration. Required for
  /// HTTP APIs.
  ///
  /// Parameter [requestParameters] :
  /// For WebSocket APIs, a key-value map specifying request parameters that are
  /// passed from the method request to the backend. The key is an integration
  /// request parameter name and the associated value is a method request
  /// parameter value or static value that must be enclosed within single quotes
  /// and pre-encoded as required by the backend. The method request parameter
  /// value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name.
  ///
  /// For HTTP API integrations with a specified integrationSubtype, request
  /// parameters are a key-value map specifying parameters that are passed to
  /// AWS_PROXY integrations. You can provide static values, or map request
  /// data, stage variables, or context variables that are evaluated at runtime.
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services.html">Working
  /// with AWS service integrations for HTTP APIs</a>.
  ///
  /// For HTTP API integrations, without a specified integrationSubtype request
  /// parameters are a key-value map specifying how to transform HTTP requests
  /// before sending them to the backend. The key should follow the pattern
  /// &lt;action&gt;:&lt;header|querystring|path&gt;.&lt;location&gt; where
  /// action can be append, overwrite or remove. For values, you can provide
  /// static values, or map request data, stage variables, or context variables
  /// that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.">Transforming
  /// API requests and responses</a>.
  ///
  /// Parameter [requestTemplates] :
  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  ///
  /// Parameter [responseParameters] :
  /// Supported only for HTTP APIs. You use response parameters to transform the
  /// HTTP response from a backend integration before returning the response to
  /// clients. Specify a key-value map from a selection key to response
  /// parameters. The selection key must be a valid HTTP status code within the
  /// range of 200-599. Response parameters are a key-value map. The key must
  /// match pattern &lt;action&gt;:&lt;header&gt;.&lt;location&gt; or
  /// overwrite.statuscode. The action can be append, overwrite or remove. The
  /// value can be a static value, or map to response data, stage variables, or
  /// context variables that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  ///
  /// Parameter [templateSelectionExpression] :
  /// The template selection expression for the integration.
  ///
  /// Parameter [timeoutInMillis] :
  /// Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and
  /// between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is
  /// 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs.
  ///
  /// Parameter [tlsConfig] :
  /// The TLS configuration for a private integration. If you specify a TLS
  /// configuration, private integration traffic uses the HTTPS protocol.
  /// Supported only for HTTP APIs.
  Future<UpdateIntegrationResult> updateIntegration({
    @_s.required String apiId,
    @_s.required String integrationId,
    String connectionId,
    ConnectionType connectionType,
    ContentHandlingStrategy contentHandlingStrategy,
    String credentialsArn,
    String description,
    String integrationMethod,
    String integrationSubtype,
    IntegrationType integrationType,
    String integrationUri,
    PassthroughBehavior passthroughBehavior,
    String payloadFormatVersion,
    Map<String, String> requestParameters,
    Map<String, String> requestTemplates,
    Map<String, Map<String, String>> responseParameters,
    String templateSelectionExpression,
    int timeoutInMillis,
    TlsConfigInput tlsConfig,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(integrationId, 'integrationId');
    _s.validateNumRange(
      'timeoutInMillis',
      timeoutInMillis,
      50,
      30000,
    );
    final $payload = <String, dynamic>{
      if (connectionId != null) 'connectionId': connectionId,
      if (connectionType != null) 'connectionType': connectionType.toValue(),
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.toValue(),
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (integrationMethod != null) 'integrationMethod': integrationMethod,
      if (integrationSubtype != null) 'integrationSubtype': integrationSubtype,
      if (integrationType != null) 'integrationType': integrationType.toValue(),
      if (integrationUri != null) 'integrationUri': integrationUri,
      if (passthroughBehavior != null)
        'passthroughBehavior': passthroughBehavior.toValue(),
      if (payloadFormatVersion != null)
        'payloadFormatVersion': payloadFormatVersion,
      if (requestParameters != null) 'requestParameters': requestParameters,
      if (requestTemplates != null) 'requestTemplates': requestTemplates,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (templateSelectionExpression != null)
        'templateSelectionExpression': templateSelectionExpression,
      if (timeoutInMillis != null) 'timeoutInMillis': timeoutInMillis,
      if (tlsConfig != null) 'tlsConfig': tlsConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/integrations/${Uri.encodeComponent(integrationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIntegrationResult.fromJson(response);
  }

  /// Updates an IntegrationResponses.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [integrationId] :
  /// The integration ID.
  ///
  /// Parameter [integrationResponseId] :
  /// The integration response ID.
  ///
  /// Parameter [contentHandlingStrategy] :
  /// Supported only for WebSocket APIs. Specifies how to handle response
  /// payload content type conversions. Supported values are CONVERT_TO_BINARY
  /// and CONVERT_TO_TEXT, with the following behaviors:
  ///
  /// CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded
  /// string to the corresponding binary blob.
  ///
  /// CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed
  /// through from the integration response to the route response or method
  /// response without modification.
  ///
  /// Parameter [integrationResponseKey] :
  /// The integration response key.
  ///
  /// Parameter [responseParameters] :
  /// A key-value map specifying response parameters that are passed to the
  /// method response from the backend. The key is a method response header
  /// parameter name and the mapped value is an integration response header
  /// value, a static value enclosed within a pair of single quotes, or a JSON
  /// expression from the integration response body. The mapping key must match
  /// the pattern of method.response.header.<replaceable>{name}</replaceable>
  /// , where name is a valid and unique header name. The mapped non-static
  /// value must match the pattern of
  /// integration.response.header.<replaceable>{name}</replaceable>
  /// or integration.response.body.<replaceable>{JSON-expression}</replaceable>
  /// , where
  /// <replaceable>{name}</replaceable>
  /// is a valid and unique response header name and
  /// <replaceable>{JSON-expression}</replaceable>
  /// is a valid JSON expression without the $ prefix.
  ///
  /// Parameter [responseTemplates] :
  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are
  /// represented as a key/value map, with a content-type as the key and a
  /// template as the value.
  ///
  /// Parameter [templateSelectionExpression] :
  /// The template selection expression for the integration response. Supported
  /// only for WebSocket APIs.
  Future<UpdateIntegrationResponseResponse> updateIntegrationResponse({
    @_s.required String apiId,
    @_s.required String integrationId,
    @_s.required String integrationResponseId,
    ContentHandlingStrategy contentHandlingStrategy,
    String integrationResponseKey,
    Map<String, String> responseParameters,
    Map<String, String> responseTemplates,
    String templateSelectionExpression,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(integrationId, 'integrationId');
    ArgumentError.checkNotNull(integrationResponseId, 'integrationResponseId');
    final $payload = <String, dynamic>{
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.toValue(),
      if (integrationResponseKey != null)
        'integrationResponseKey': integrationResponseKey,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (responseTemplates != null) 'responseTemplates': responseTemplates,
      if (templateSelectionExpression != null)
        'templateSelectionExpression': templateSelectionExpression,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/integrations/${Uri.encodeComponent(integrationId)}/integrationresponses/${Uri.encodeComponent(integrationResponseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIntegrationResponseResponse.fromJson(response);
  }

  /// Updates a Model.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [modelId] :
  /// The model ID.
  ///
  /// Parameter [contentType] :
  /// The content-type for the model, for example, "application/json".
  ///
  /// Parameter [description] :
  /// The description of the model.
  ///
  /// Parameter [name] :
  /// The name of the model.
  ///
  /// Parameter [schema] :
  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  Future<UpdateModelResponse> updateModel({
    @_s.required String apiId,
    @_s.required String modelId,
    String contentType,
    String description,
    String name,
    String schema,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(modelId, 'modelId');
    final $payload = <String, dynamic>{
      if (contentType != null) 'contentType': contentType,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (schema != null) 'schema': schema,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/models/${Uri.encodeComponent(modelId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateModelResponse.fromJson(response);
  }

  /// Updates a Route.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [routeId] :
  /// The route ID.
  ///
  /// Parameter [apiKeyRequired] :
  /// Specifies whether an API key is required for the route. Supported only for
  /// WebSocket APIs.
  ///
  /// Parameter [authorizationScopes] :
  /// The authorization scopes supported by this route.
  ///
  /// Parameter [authorizationType] :
  /// The authorization type for the route. For WebSocket APIs, valid values are
  /// NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM
  /// for using a Lambda authorizer For HTTP APIs, valid values are NONE for
  /// open access, JWT for using JSON Web Tokens, AWS_IAM for using AWS IAM
  /// permissions, and CUSTOM for using a Lambda authorizer.
  ///
  /// Parameter [authorizerId] :
  /// The identifier of the Authorizer resource to be associated with this
  /// route. The authorizer identifier is generated by API Gateway when you
  /// created the authorizer.
  ///
  /// Parameter [modelSelectionExpression] :
  /// The model selection expression for the route. Supported only for WebSocket
  /// APIs.
  ///
  /// Parameter [operationName] :
  /// The operation name for the route.
  ///
  /// Parameter [requestModels] :
  /// The request models for the route. Supported only for WebSocket APIs.
  ///
  /// Parameter [requestParameters] :
  /// The request parameters for the route. Supported only for WebSocket APIs.
  ///
  /// Parameter [routeKey] :
  /// The route key for the route.
  ///
  /// Parameter [routeResponseSelectionExpression] :
  /// The route response selection expression for the route. Supported only for
  /// WebSocket APIs.
  ///
  /// Parameter [target] :
  /// The target for the route.
  Future<UpdateRouteResult> updateRoute({
    @_s.required String apiId,
    @_s.required String routeId,
    bool apiKeyRequired,
    List<String> authorizationScopes,
    AuthorizationType authorizationType,
    String authorizerId,
    String modelSelectionExpression,
    String operationName,
    Map<String, String> requestModels,
    Map<String, ParameterConstraints> requestParameters,
    String routeKey,
    String routeResponseSelectionExpression,
    String target,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(routeId, 'routeId');
    final $payload = <String, dynamic>{
      if (apiKeyRequired != null) 'apiKeyRequired': apiKeyRequired,
      if (authorizationScopes != null)
        'authorizationScopes': authorizationScopes,
      if (authorizationType != null)
        'authorizationType': authorizationType.toValue(),
      if (authorizerId != null) 'authorizerId': authorizerId,
      if (modelSelectionExpression != null)
        'modelSelectionExpression': modelSelectionExpression,
      if (operationName != null) 'operationName': operationName,
      if (requestModels != null) 'requestModels': requestModels,
      if (requestParameters != null) 'requestParameters': requestParameters,
      if (routeKey != null) 'routeKey': routeKey,
      if (routeResponseSelectionExpression != null)
        'routeResponseSelectionExpression': routeResponseSelectionExpression,
      if (target != null) 'target': target,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/routes/${Uri.encodeComponent(routeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRouteResult.fromJson(response);
  }

  /// Updates a RouteResponse.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [routeId] :
  /// The route ID.
  ///
  /// Parameter [routeResponseId] :
  /// The route response ID.
  ///
  /// Parameter [modelSelectionExpression] :
  /// The model selection expression for the route response. Supported only for
  /// WebSocket APIs.
  ///
  /// Parameter [responseModels] :
  /// The response models for the route response.
  ///
  /// Parameter [responseParameters] :
  /// The route response parameters.
  ///
  /// Parameter [routeResponseKey] :
  /// The route response key.
  Future<UpdateRouteResponseResponse> updateRouteResponse({
    @_s.required String apiId,
    @_s.required String routeId,
    @_s.required String routeResponseId,
    String modelSelectionExpression,
    Map<String, String> responseModels,
    Map<String, ParameterConstraints> responseParameters,
    String routeResponseKey,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(routeId, 'routeId');
    ArgumentError.checkNotNull(routeResponseId, 'routeResponseId');
    final $payload = <String, dynamic>{
      if (modelSelectionExpression != null)
        'modelSelectionExpression': modelSelectionExpression,
      if (responseModels != null) 'responseModels': responseModels,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (routeResponseKey != null) 'routeResponseKey': routeResponseKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/routes/${Uri.encodeComponent(routeId)}/routeresponses/${Uri.encodeComponent(routeResponseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRouteResponseResponse.fromJson(response);
  }

  /// Updates a Stage.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  ///
  /// Parameter [apiId] :
  /// The API identifier.
  ///
  /// Parameter [stageName] :
  /// The stage name. Stage names can contain only alphanumeric characters,
  /// hyphens, and underscores, or be $default. Maximum length is 128
  /// characters.
  ///
  /// Parameter [accessLogSettings] :
  /// Settings for logging access in this stage.
  ///
  /// Parameter [autoDeploy] :
  /// Specifies whether updates to an API automatically trigger a new
  /// deployment. The default value is false.
  ///
  /// Parameter [clientCertificateId] :
  /// The identifier of a client certificate for a Stage.
  ///
  /// Parameter [defaultRouteSettings] :
  /// The default route settings for the stage.
  ///
  /// Parameter [deploymentId] :
  /// The deployment identifier for the API stage. Can't be updated if
  /// autoDeploy is enabled.
  ///
  /// Parameter [description] :
  /// The description for the API stage.
  ///
  /// Parameter [routeSettings] :
  /// Route settings for the stage.
  ///
  /// Parameter [stageVariables] :
  /// A map that defines the stage variables for a Stage. Variable names can
  /// have alphanumeric and underscore characters, and the values must match
  /// [A-Za-z0-9-._~:/?#&amp;=,]+.
  Future<UpdateStageResponse> updateStage({
    @_s.required String apiId,
    @_s.required String stageName,
    AccessLogSettings accessLogSettings,
    bool autoDeploy,
    String clientCertificateId,
    RouteSettings defaultRouteSettings,
    String deploymentId,
    String description,
    Map<String, RouteSettings> routeSettings,
    Map<String, String> stageVariables,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    ArgumentError.checkNotNull(stageName, 'stageName');
    final $payload = <String, dynamic>{
      if (accessLogSettings != null) 'accessLogSettings': accessLogSettings,
      if (autoDeploy != null) 'autoDeploy': autoDeploy,
      if (clientCertificateId != null)
        'clientCertificateId': clientCertificateId,
      if (defaultRouteSettings != null)
        'defaultRouteSettings': defaultRouteSettings,
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (description != null) 'description': description,
      if (routeSettings != null) 'routeSettings': routeSettings,
      if (stageVariables != null) 'stageVariables': stageVariables,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/stages/${Uri.encodeComponent(stageName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStageResponse.fromJson(response);
  }

  /// Updates a VPC link.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [vpcLinkId] :
  /// The ID of the VPC link.
  ///
  /// Parameter [name] :
  /// The name of the VPC link.
  Future<UpdateVpcLinkResponse> updateVpcLink({
    @_s.required String vpcLinkId,
    String name,
  }) async {
    ArgumentError.checkNotNull(vpcLinkId, 'vpcLinkId');
    final $payload = <String, dynamic>{
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v2/vpclinks/${Uri.encodeComponent(vpcLinkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVpcLinkResponse.fromJson(response);
  }
}

/// Settings for logging access in a stage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccessLogSettings {
  /// The ARN of the CloudWatch Logs log group to receive access logs.
  @_s.JsonKey(name: 'destinationArn')
  final String destinationArn;

  /// A single line format of the access logs of data, as specified by selected
  /// $context variables. The format must include at least $context.requestId.
  @_s.JsonKey(name: 'format')
  final String format;

  AccessLogSettings({
    this.destinationArn,
    this.format,
  });
  factory AccessLogSettings.fromJson(Map<String, dynamic> json) =>
      _$AccessLogSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AccessLogSettingsToJson(this);
}

/// Represents an API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Api {
  /// The name of the API.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The API protocol.
  @_s.JsonKey(name: 'protocolType')
  final ProtocolType protocolType;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  @_s.JsonKey(name: 'routeSelectionExpression')
  final String routeSelectionExpression;

  /// The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com.
  /// The stage name is typically appended to this URI to form a complete path to
  /// a deployed API stage.
  @_s.JsonKey(name: 'apiEndpoint')
  final String apiEndpoint;

  /// Specifies whether an API is managed by API Gateway. You can't update or
  /// delete a managed API by using API Gateway. A managed API can be deleted only
  /// through the tooling or service that created it.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// The API ID.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  @_s.JsonKey(name: 'apiKeySelectionExpression')
  final String apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'corsConfiguration')
  final Cors corsConfiguration;

  /// The timestamp when the API was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  @_s.JsonKey(name: 'disableExecuteApiEndpoint')
  final bool disableExecuteApiEndpoint;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'disableSchemaValidation')
  final bool disableSchemaValidation;

  /// The validation information during API import. This may include particular
  /// properties of your OpenAPI definition which are ignored during import.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'importInfo')
  final List<String> importInfo;

  /// A collection of tags associated with the API.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// A version identifier for the API.
  @_s.JsonKey(name: 'version')
  final String version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  @_s.JsonKey(name: 'warnings')
  final List<String> warnings;

  Api({
    @_s.required this.name,
    @_s.required this.protocolType,
    @_s.required this.routeSelectionExpression,
    this.apiEndpoint,
    this.apiGatewayManaged,
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
    this.disableExecuteApiEndpoint,
    this.disableSchemaValidation,
    this.importInfo,
    this.tags,
    this.version,
    this.warnings,
  });
  factory Api.fromJson(Map<String, dynamic> json) => _$ApiFromJson(json);
}

/// Represents an API mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApiMapping {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// The API stage.
  @_s.JsonKey(name: 'stage')
  final String stage;

  /// The API mapping identifier.
  @_s.JsonKey(name: 'apiMappingId')
  final String apiMappingId;

  /// The API mapping key.
  @_s.JsonKey(name: 'apiMappingKey')
  final String apiMappingKey;

  ApiMapping({
    @_s.required this.apiId,
    @_s.required this.stage,
    this.apiMappingId,
    this.apiMappingKey,
  });
  factory ApiMapping.fromJson(Map<String, dynamic> json) =>
      _$ApiMappingFromJson(json);
}

/// The authorization type. For WebSocket APIs, valid values are NONE for open
/// access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda
/// authorizer. For HTTP APIs, valid values are NONE for open access, JWT for
/// using JSON Web Tokens, AWS_IAM for using AWS IAM permissions, and CUSTOM for
/// using a Lambda authorizer.
enum AuthorizationType {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('AWS_IAM')
  awsIam,
  @_s.JsonValue('CUSTOM')
  custom,
  @_s.JsonValue('JWT')
  jwt,
}

extension on AuthorizationType {
  String toValue() {
    switch (this) {
      case AuthorizationType.none:
        return 'NONE';
      case AuthorizationType.awsIam:
        return 'AWS_IAM';
      case AuthorizationType.custom:
        return 'CUSTOM';
      case AuthorizationType.jwt:
        return 'JWT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents an authorizer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Authorizer {
  /// The name of the authorizer.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Specifies the required credentials as an IAM role for API Gateway to invoke
  /// the authorizer. To specify an IAM role for API Gateway to assume, use the
  /// role's Amazon Resource Name (ARN). To use resource-based permissions on the
  /// Lambda function, don't specify this parameter. Supported only for REQUEST
  /// authorizers.
  @_s.JsonKey(name: 'authorizerCredentialsArn')
  final String authorizerCredentialsArn;

  /// The authorizer identifier.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// Specifies the format of the payload sent to an HTTP API Lambda authorizer.
  /// Required for HTTP API Lambda authorizers. Supported values are 1.0 and 2.0.
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  @_s.JsonKey(name: 'authorizerPayloadFormatVersion')
  final String authorizerPayloadFormatVersion;

  /// The time to live (TTL) for cached authorizer results, in seconds. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway caches authorizer responses. The maximum value is 3600, or 1 hour.
  /// Supported only for HTTP API Lambda authorizers.
  @_s.JsonKey(name: 'authorizerResultTtlInSeconds')
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. Specify REQUEST for a Lambda function using incoming
  /// request parameters. Specify JWT to use JSON Web Tokens (supported only for
  /// HTTP APIs).
  @_s.JsonKey(name: 'authorizerType')
  final AuthorizerType authorizerType;

  /// The authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers,
  /// this must be a well-formed Lambda function URI, for example,
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>
  /// , where <replaceable></replaceable>{region} is the same as the region
  /// hosting the Lambda function, path indicates that the remaining substring in
  /// the URI should be treated as the path to the resource, including the initial
  /// /. For Lambda functions, this is usually of the form
  /// /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST
  /// authorizers.
  @_s.JsonKey(name: 'authorizerUri')
  final String authorizerUri;

  /// Specifies whether a Lambda authorizer returns a response in a simple format.
  /// If enabled, the Lambda authorizer can return a boolean value instead of an
  /// IAM policy. Supported only for HTTP APIs. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>
  @_s.JsonKey(name: 'enableSimpleResponses')
  final bool enableSimpleResponses;

  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. The identity
  /// source can be headers, query string parameters, stage variables, and context
  /// parameters. For example, if an Auth header and a Name query string parameter
  /// are defined as identity sources, this value is route.request.header.Auth,
  /// route.request.querystring.Name for WebSocket APIs. For HTTP APIs, use
  /// selection expressions prefixed with $, for example, $request.header.Auth,
  /// $request.querystring.Name. These parameters are used to perform runtime
  /// validation for Lambda-based authorizers by verifying all of the
  /// identity-related request parameters are present in the request, not null,
  /// and non-empty. Only when this is true does the authorizer invoke the
  /// authorizer Lambda function. Otherwise, it returns a 401 Unauthorized
  /// response without calling the Lambda function. For HTTP APIs, identity
  /// sources are also used as the cache key when caching is enabled. To learn
  /// more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT) from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// $request.header.Authorization.
  @_s.JsonKey(name: 'identitySource')
  final List<String> identitySource;

  /// The validation expression does not apply to the REQUEST authorizer.
  @_s.JsonKey(name: 'identityValidationExpression')
  final String identityValidationExpression;

  /// Represents the configuration of a JWT authorizer. Required for the JWT
  /// authorizer type. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'jwtConfiguration')
  final JWTConfiguration jwtConfiguration;

  Authorizer({
    @_s.required this.name,
    this.authorizerCredentialsArn,
    this.authorizerId,
    this.authorizerPayloadFormatVersion,
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
    this.enableSimpleResponses,
    this.identitySource,
    this.identityValidationExpression,
    this.jwtConfiguration,
  });
  factory Authorizer.fromJson(Map<String, dynamic> json) =>
      _$AuthorizerFromJson(json);
}

/// The authorizer type. Specify REQUEST for a Lambda function using incoming
/// request parameters. Specify JWT to use JSON Web Tokens (supported only for
/// HTTP APIs).
enum AuthorizerType {
  @_s.JsonValue('REQUEST')
  request,
  @_s.JsonValue('JWT')
  jwt,
}

extension on AuthorizerType {
  String toValue() {
    switch (this) {
      case AuthorizerType.request:
        return 'REQUEST';
      case AuthorizerType.jwt:
        return 'JWT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents a connection type.
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

/// Specifies how to handle response payload content type conversions. Supported
/// only for WebSocket APIs.
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

/// Represents a CORS configuration. Supported only for HTTP APIs. See <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-cors.html">Configuring
/// CORS</a> for more information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Cors {
  /// Specifies whether credentials are included in the CORS request. Supported
  /// only for HTTP APIs.
  @_s.JsonKey(name: 'allowCredentials')
  final bool allowCredentials;

  /// Represents a collection of allowed headers. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'allowHeaders')
  final List<String> allowHeaders;

  /// Represents a collection of allowed HTTP methods. Supported only for HTTP
  /// APIs.
  @_s.JsonKey(name: 'allowMethods')
  final List<String> allowMethods;

  /// Represents a collection of allowed origins. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'allowOrigins')
  final List<String> allowOrigins;

  /// Represents a collection of exposed headers. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'exposeHeaders')
  final List<String> exposeHeaders;

  /// The number of seconds that the browser should cache preflight request
  /// results. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'maxAge')
  final int maxAge;

  Cors({
    this.allowCredentials,
    this.allowHeaders,
    this.allowMethods,
    this.allowOrigins,
    this.exposeHeaders,
    this.maxAge,
  });
  factory Cors.fromJson(Map<String, dynamic> json) => _$CorsFromJson(json);

  Map<String, dynamic> toJson() => _$CorsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApiMappingResponse {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// The API mapping identifier.
  @_s.JsonKey(name: 'apiMappingId')
  final String apiMappingId;

  /// The API mapping key.
  @_s.JsonKey(name: 'apiMappingKey')
  final String apiMappingKey;

  /// The API stage.
  @_s.JsonKey(name: 'stage')
  final String stage;

  CreateApiMappingResponse({
    this.apiId,
    this.apiMappingId,
    this.apiMappingKey,
    this.stage,
  });
  factory CreateApiMappingResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateApiMappingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateApiResponse {
  /// The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com.
  /// The stage name is typically appended to this URI to form a complete path to
  /// a deployed API stage.
  @_s.JsonKey(name: 'apiEndpoint')
  final String apiEndpoint;

  /// Specifies whether an API is managed by API Gateway. You can't update or
  /// delete a managed API by using API Gateway. A managed API can be deleted only
  /// through the tooling or service that created it.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// The API ID.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  @_s.JsonKey(name: 'apiKeySelectionExpression')
  final String apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'corsConfiguration')
  final Cors corsConfiguration;

  /// The timestamp when the API was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  @_s.JsonKey(name: 'disableExecuteApiEndpoint')
  final bool disableExecuteApiEndpoint;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'disableSchemaValidation')
  final bool disableSchemaValidation;

  /// The validation information during API import. This may include particular
  /// properties of your OpenAPI definition which are ignored during import.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'importInfo')
  final List<String> importInfo;

  /// The name of the API.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The API protocol.
  @_s.JsonKey(name: 'protocolType')
  final ProtocolType protocolType;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  @_s.JsonKey(name: 'routeSelectionExpression')
  final String routeSelectionExpression;

  /// A collection of tags associated with the API.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// A version identifier for the API.
  @_s.JsonKey(name: 'version')
  final String version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  @_s.JsonKey(name: 'warnings')
  final List<String> warnings;

  CreateApiResponse({
    this.apiEndpoint,
    this.apiGatewayManaged,
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
    this.disableExecuteApiEndpoint,
    this.disableSchemaValidation,
    this.importInfo,
    this.name,
    this.protocolType,
    this.routeSelectionExpression,
    this.tags,
    this.version,
    this.warnings,
  });
  factory CreateApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateApiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAuthorizerResponse {
  /// Specifies the required credentials as an IAM role for API Gateway to invoke
  /// the authorizer. To specify an IAM role for API Gateway to assume, use the
  /// role's Amazon Resource Name (ARN). To use resource-based permissions on the
  /// Lambda function, don't specify this parameter. Supported only for REQUEST
  /// authorizers.
  @_s.JsonKey(name: 'authorizerCredentialsArn')
  final String authorizerCredentialsArn;

  /// The authorizer identifier.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// Specifies the format of the payload sent to an HTTP API Lambda authorizer.
  /// Required for HTTP API Lambda authorizers. Supported values are 1.0 and 2.0.
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  @_s.JsonKey(name: 'authorizerPayloadFormatVersion')
  final String authorizerPayloadFormatVersion;

  /// The time to live (TTL) for cached authorizer results, in seconds. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway caches authorizer responses. The maximum value is 3600, or 1 hour.
  /// Supported only for HTTP API Lambda authorizers.
  @_s.JsonKey(name: 'authorizerResultTtlInSeconds')
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. Specify REQUEST for a Lambda function using incoming
  /// request parameters. Specify JWT to use JSON Web Tokens (supported only for
  /// HTTP APIs).
  @_s.JsonKey(name: 'authorizerType')
  final AuthorizerType authorizerType;

  /// The authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers,
  /// this must be a well-formed Lambda function URI, for example,
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>
  /// , where <replaceable></replaceable>{region} is the same as the region
  /// hosting the Lambda function, path indicates that the remaining substring in
  /// the URI should be treated as the path to the resource, including the initial
  /// /. For Lambda functions, this is usually of the form
  /// /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST
  /// authorizers.
  @_s.JsonKey(name: 'authorizerUri')
  final String authorizerUri;

  /// Specifies whether a Lambda authorizer returns a response in a simple format.
  /// If enabled, the Lambda authorizer can return a boolean value instead of an
  /// IAM policy. Supported only for HTTP APIs. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>
  @_s.JsonKey(name: 'enableSimpleResponses')
  final bool enableSimpleResponses;

  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. The identity
  /// source can be headers, query string parameters, stage variables, and context
  /// parameters. For example, if an Auth header and a Name query string parameter
  /// are defined as identity sources, this value is route.request.header.Auth,
  /// route.request.querystring.Name for WebSocket APIs. For HTTP APIs, use
  /// selection expressions prefixed with $, for example, $request.header.Auth,
  /// $request.querystring.Name. These parameters are used to perform runtime
  /// validation for Lambda-based authorizers by verifying all of the
  /// identity-related request parameters are present in the request, not null,
  /// and non-empty. Only when this is true does the authorizer invoke the
  /// authorizer Lambda function. Otherwise, it returns a 401 Unauthorized
  /// response without calling the Lambda function. For HTTP APIs, identity
  /// sources are also used as the cache key when caching is enabled. To learn
  /// more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT) from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// $request.header.Authorization.
  @_s.JsonKey(name: 'identitySource')
  final List<String> identitySource;

  /// The validation expression does not apply to the REQUEST authorizer.
  @_s.JsonKey(name: 'identityValidationExpression')
  final String identityValidationExpression;

  /// Represents the configuration of a JWT authorizer. Required for the JWT
  /// authorizer type. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'jwtConfiguration')
  final JWTConfiguration jwtConfiguration;

  /// The name of the authorizer.
  @_s.JsonKey(name: 'name')
  final String name;

  CreateAuthorizerResponse({
    this.authorizerCredentialsArn,
    this.authorizerId,
    this.authorizerPayloadFormatVersion,
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
    this.enableSimpleResponses,
    this.identitySource,
    this.identityValidationExpression,
    this.jwtConfiguration,
    this.name,
  });
  factory CreateAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAuthorizerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeploymentResponse {
  /// Specifies whether a deployment was automatically released.
  @_s.JsonKey(name: 'autoDeployed')
  final bool autoDeployed;

  /// The date and time when the Deployment resource was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The identifier for the deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The status of the deployment: PENDING, FAILED, or SUCCEEDED.
  @_s.JsonKey(name: 'deploymentStatus')
  final DeploymentStatus deploymentStatus;

  /// May contain additional feedback on the status of an API deployment.
  @_s.JsonKey(name: 'deploymentStatusMessage')
  final String deploymentStatusMessage;

  /// The description for the deployment.
  @_s.JsonKey(name: 'description')
  final String description;

  CreateDeploymentResponse({
    this.autoDeployed,
    this.createdDate,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentStatusMessage,
    this.description,
  });
  factory CreateDeploymentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDeploymentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDomainNameResponse {
  /// The API mapping selection expression.
  @_s.JsonKey(name: 'apiMappingSelectionExpression')
  final String apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The domain name configurations.
  @_s.JsonKey(name: 'domainNameConfigurations')
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The mutual TLS authentication configuration for a custom domain name.
  @_s.JsonKey(name: 'mutualTlsAuthentication')
  final MutualTlsAuthentication mutualTlsAuthentication;

  /// The collection of tags associated with a domain name.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.mutualTlsAuthentication,
    this.tags,
  });
  factory CreateDomainNameResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDomainNameResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateIntegrationResult {
  /// Specifies whether an integration is managed by API Gateway. If you created
  /// an API using using quick create, the resulting integration is managed by API
  /// Gateway. You can update a managed integration, but you can't delete it.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// The ID of the VPC link for a private integration. Supported only for HTTP
  /// APIs.
  @_s.JsonKey(name: 'connectionId')
  final String connectionId;

  /// The type of the network connection to the integration endpoint. Specify
  /// INTERNET for connections through the public routable internet or VPC_LINK
  /// for private connections between API Gateway and resources in a VPC. The
  /// default value is INTERNET.
  @_s.JsonKey(name: 'connectionType')
  final ConnectionType connectionType;

  /// Supported only for WebSocket APIs. Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT_TO_BINARY and
  /// CONVERT_TO_TEXT, with the following behaviors:
  ///
  /// CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string
  /// to the corresponding binary blob.
  ///
  /// CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed through
  /// from the integration response to the route response or method response
  /// without modification.
  @_s.JsonKey(name: 'contentHandlingStrategy')
  final ContentHandlingStrategy contentHandlingStrategy;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on supported
  /// AWS services, specify null.
  @_s.JsonKey(name: 'credentialsArn')
  final String credentialsArn;

  /// Represents the description of an integration.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Represents the identifier of an integration.
  @_s.JsonKey(name: 'integrationId')
  final String integrationId;

  /// Specifies the integration's HTTP method type.
  @_s.JsonKey(name: 'integrationMethod')
  final String integrationMethod;

  /// The integration response selection expression for the integration. Supported
  /// only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions">Integration
  /// Response Selection Expressions</a>.
  @_s.JsonKey(name: 'integrationResponseSelectionExpression')
  final String integrationResponseSelectionExpression;

  /// Supported only for HTTP API AWS_PROXY integrations. Specifies the AWS
  /// service action to invoke. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services-reference.html">Integration
  /// subtype reference</a>.
  @_s.JsonKey(name: 'integrationSubtype')
  final String integrationSubtype;

  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service action,
  /// including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with a Lambda
  /// function or other AWS service action. This integration is also referred to
  /// as a Lambda proxy integration.
  ///
  /// HTTP: for integrating the route or method request with an HTTP endpoint.
  /// This integration is also referred to as the HTTP custom integration.
  /// Supported only for WebSocket APIs.
  ///
  /// HTTP_PROXY: for integrating the route or method request with an HTTP
  /// endpoint, with the client request passed through as-is. This is also
  /// referred to as HTTP proxy integration.
  ///
  /// MOCK: for integrating the route or method request with API Gateway as a
  /// "loopback" endpoint without invoking any backend. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'integrationType')
  final IntegrationType integrationType;

  /// For a Lambda integration, specify the URI of a Lambda function.
  ///
  /// For an HTTP integration, specify a fully-qualified URL.
  ///
  /// For an HTTP API private integration, specify the ARN of an Application Load
  /// Balancer listener, Network Load Balancer listener, or AWS Cloud Map service.
  /// If you specify the ARN of an AWS Cloud Map service, API Gateway uses
  /// DiscoverInstances to identify resources. You can use query parameters to
  /// target specific resources. To learn more, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>.
  /// For private integrations, all resources must be owned by the same AWS
  /// account.
  @_s.JsonKey(name: 'integrationUri')
  final String integrationUri;

  /// Specifies the pass-through behavior for incoming requests based on the
  /// Content-Type header in the request, and the available mapping templates
  /// specified as the requestTemplates property on the Integration resource.
  /// There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
  /// Supported only for WebSocket APIs.
  ///
  /// WHEN_NO_MATCH passes the request body for unmapped content types through to
  /// the integration backend without transformation.
  ///
  /// NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type
  /// response.
  ///
  /// WHEN_NO_TEMPLATES allows pass-through when the integration has no content
  /// types mapped to templates. However, if there is at least one content type
  /// defined, unmapped content types will be rejected with the same HTTP 415
  /// Unsupported Media Type response.
  @_s.JsonKey(name: 'passthroughBehavior')
  final PassthroughBehavior passthroughBehavior;

  /// Specifies the format of the payload sent to an integration. Required for
  /// HTTP APIs.
  @_s.JsonKey(name: 'payloadFormatVersion')
  final String payloadFormatVersion;

  /// For WebSocket APIs, a key-value map specifying request parameters that are
  /// passed from the method request to the backend. The key is an integration
  /// request parameter name and the associated value is a method request
  /// parameter value or static value that must be enclosed within single quotes
  /// and pre-encoded as required by the backend. The method request parameter
  /// value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name.
  ///
  /// For HTTP API integrations with a specified integrationSubtype, request
  /// parameters are a key-value map specifying parameters that are passed to
  /// AWS_PROXY integrations. You can provide static values, or map request data,
  /// stage variables, or context variables that are evaluated at runtime. To
  /// learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services.html">Working
  /// with AWS service integrations for HTTP APIs</a>.
  ///
  /// For HTTP API itegrations, without a specified integrationSubtype request
  /// parameters are a key-value map specifying how to transform HTTP requests
  /// before sending them to backend integrations. The key should follow the
  /// pattern &lt;action&gt;:&lt;header|querystring|path&gt;.&lt;location&gt;. The
  /// action can be append, overwrite or remove. For values, you can provide
  /// static values, or map request data, stage variables, or context variables
  /// that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestTemplates')
  final Map<String, String> requestTemplates;

  /// Supported only for HTTP APIs. You use response parameters to transform the
  /// HTTP response from a backend integration before returning the response to
  /// clients. Specify a key-value map from a selection key to response
  /// parameters. The selection key must be a valid HTTP status code within the
  /// range of 200-599. Response parameters are a key-value map. The key must
  /// match pattern &lt;action&gt;:&lt;header&gt;.&lt;location&gt; or
  /// overwrite.statuscode. The action can be append, overwrite or remove. The
  /// value can be a static value, or map to response data, stage variables, or
  /// context variables that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, Map<String, String>> responseParameters;

  /// The template selection expression for the integration. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'templateSelectionExpression')
  final String templateSelectionExpression;

  /// Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and
  /// between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29
  /// seconds for WebSocket APIs and 30 seconds for HTTP APIs.
  @_s.JsonKey(name: 'timeoutInMillis')
  final int timeoutInMillis;

  /// The TLS configuration for a private integration. If you specify a TLS
  /// configuration, private integration traffic uses the HTTPS protocol.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'tlsConfig')
  final TlsConfig tlsConfig;

  CreateIntegrationResult({
    this.apiGatewayManaged,
    this.connectionId,
    this.connectionType,
    this.contentHandlingStrategy,
    this.credentialsArn,
    this.description,
    this.integrationId,
    this.integrationMethod,
    this.integrationResponseSelectionExpression,
    this.integrationSubtype,
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.payloadFormatVersion,
    this.requestParameters,
    this.requestTemplates,
    this.responseParameters,
    this.templateSelectionExpression,
    this.timeoutInMillis,
    this.tlsConfig,
  });
  factory CreateIntegrationResult.fromJson(Map<String, dynamic> json) =>
      _$CreateIntegrationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateIntegrationResponseResponse {
  /// Supported only for WebSocket APIs. Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT_TO_BINARY and
  /// CONVERT_TO_TEXT, with the following behaviors:
  ///
  /// CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string
  /// to the corresponding binary blob.
  ///
  /// CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed through
  /// from the integration response to the route response or method response
  /// without modification.
  @_s.JsonKey(name: 'contentHandlingStrategy')
  final ContentHandlingStrategy contentHandlingStrategy;

  /// The integration response ID.
  @_s.JsonKey(name: 'integrationResponseId')
  final String integrationResponseId;

  /// The integration response key.
  @_s.JsonKey(name: 'integrationResponseKey')
  final String integrationResponseKey;

  /// A key-value map specifying response parameters that are passed to the method
  /// response from the backend. The key is a method response header parameter
  /// name and the mapped value is an integration response header value, a static
  /// value enclosed within a pair of single quotes, or a JSON expression from the
  /// integration response body. The mapping key must match the pattern of
  /// method.response.header.{name}, where name is a valid and unique header name.
  /// The mapped non-static value must match the pattern of
  /// integration.response.header.{name} or
  /// integration.response.body.{JSON-expression}, where name is a valid and
  /// unique response header name and JSON-expression is a valid JSON expression
  /// without the $ prefix.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, String> responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are represented
  /// as a key/value map, with a content-type as the key and a template as the
  /// value.
  @_s.JsonKey(name: 'responseTemplates')
  final Map<String, String> responseTemplates;

  /// The template selection expressions for the integration response.
  @_s.JsonKey(name: 'templateSelectionExpression')
  final String templateSelectionExpression;

  CreateIntegrationResponseResponse({
    this.contentHandlingStrategy,
    this.integrationResponseId,
    this.integrationResponseKey,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });
  factory CreateIntegrationResponseResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateIntegrationResponseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateModelResponse {
  /// The content-type for the model, for example, "application/json".
  @_s.JsonKey(name: 'contentType')
  final String contentType;

  /// The description of the model.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The model identifier.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The name of the model. Must be alphanumeric.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  @_s.JsonKey(name: 'schema')
  final String schema;

  CreateModelResponse({
    this.contentType,
    this.description,
    this.modelId,
    this.name,
    this.schema,
  });
  factory CreateModelResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRouteResult {
  /// Specifies whether a route is managed by API Gateway. If you created an API
  /// using quick create, the $default route is managed by API Gateway. You can't
  /// modify the $default route key.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// Specifies whether an API key is required for this route. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'apiKeyRequired')
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a JWT authorizer to authorize the method invocation. The authorization
  /// works by matching the route scopes against the scopes parsed from the access
  /// token in the incoming request. The method invocation is authorized if any
  /// route scope matches a claimed scope in the access token. Otherwise, the
  /// invocation is not authorized. When the route scope is configured, the client
  /// must provide an access token instead of an identity token for authorization
  /// purposes.
  @_s.JsonKey(name: 'authorizationScopes')
  final List<String> authorizationScopes;

  /// The authorization type for the route. For WebSocket APIs, valid values are
  /// NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for
  /// using a Lambda authorizer For HTTP APIs, valid values are NONE for open
  /// access, JWT for using JSON Web Tokens, AWS_IAM for using AWS IAM
  /// permissions, and CUSTOM for using a Lambda authorizer.
  @_s.JsonKey(name: 'authorizationType')
  final AuthorizationType authorizationType;

  /// The identifier of the Authorizer resource to be associated with this route.
  /// The authorizer identifier is generated by API Gateway when you created the
  /// authorizer.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// The model selection expression for the route. Supported only for WebSocket
  /// APIs.
  @_s.JsonKey(name: 'modelSelectionExpression')
  final String modelSelectionExpression;

  /// The operation name for the route.
  @_s.JsonKey(name: 'operationName')
  final String operationName;

  /// The request models for the route. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestModels')
  final Map<String, String> requestModels;

  /// The request parameters for the route. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, ParameterConstraints> requestParameters;

  /// The route ID.
  @_s.JsonKey(name: 'routeId')
  final String routeId;

  /// The route key for the route.
  @_s.JsonKey(name: 'routeKey')
  final String routeKey;

  /// The route response selection expression for the route. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'routeResponseSelectionExpression')
  final String routeResponseSelectionExpression;

  /// The target for the route.
  @_s.JsonKey(name: 'target')
  final String target;

  CreateRouteResult({
    this.apiGatewayManaged,
    this.apiKeyRequired,
    this.authorizationScopes,
    this.authorizationType,
    this.authorizerId,
    this.modelSelectionExpression,
    this.operationName,
    this.requestModels,
    this.requestParameters,
    this.routeId,
    this.routeKey,
    this.routeResponseSelectionExpression,
    this.target,
  });
  factory CreateRouteResult.fromJson(Map<String, dynamic> json) =>
      _$CreateRouteResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRouteResponseResponse {
  /// Represents the model selection expression of a route response. Supported
  /// only for WebSocket APIs.
  @_s.JsonKey(name: 'modelSelectionExpression')
  final String modelSelectionExpression;

  /// Represents the response models of a route response.
  @_s.JsonKey(name: 'responseModels')
  final Map<String, String> responseModels;

  /// Represents the response parameters of a route response.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, ParameterConstraints> responseParameters;

  /// Represents the identifier of a route response.
  @_s.JsonKey(name: 'routeResponseId')
  final String routeResponseId;

  /// Represents the route response key of a route response.
  @_s.JsonKey(name: 'routeResponseKey')
  final String routeResponseKey;

  CreateRouteResponseResponse({
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseId,
    this.routeResponseKey,
  });
  factory CreateRouteResponseResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRouteResponseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateStageResponse {
  /// Settings for logging access in this stage.
  @_s.JsonKey(name: 'accessLogSettings')
  final AccessLogSettings accessLogSettings;

  /// Specifies whether a stage is managed by API Gateway. If you created an API
  /// using quick create, the $default stage is managed by API Gateway. You can't
  /// modify the $default stage.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// Specifies whether updates to an API automatically trigger a new deployment.
  /// The default value is false.
  @_s.JsonKey(name: 'autoDeploy')
  final bool autoDeploy;

  /// The identifier of a client certificate for a Stage. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'clientCertificateId')
  final String clientCertificateId;

  /// The timestamp when the stage was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// Default route settings for the stage.
  @_s.JsonKey(name: 'defaultRouteSettings')
  final RouteSettings defaultRouteSettings;

  /// The identifier of the Deployment that the Stage is associated with. Can't be
  /// updated if autoDeploy is enabled.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The description of the stage.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Describes the status of the last deployment of a stage. Supported only for
  /// stages with autoDeploy enabled.
  @_s.JsonKey(name: 'lastDeploymentStatusMessage')
  final String lastDeploymentStatusMessage;

  /// The timestamp when the stage was last updated.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// Route settings for the stage, by routeKey.
  @_s.JsonKey(name: 'routeSettings')
  final Map<String, RouteSettings> routeSettings;

  /// The name of the stage.
  @_s.JsonKey(name: 'stageName')
  final String stageName;

  /// A map that defines the stage variables for a stage resource. Variable names
  /// can have alphanumeric and underscore characters, and the values must match
  /// [A-Za-z0-9-._~:/?#&amp;=,]+.
  @_s.JsonKey(name: 'stageVariables')
  final Map<String, String> stageVariables;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateStageResponse({
    this.accessLogSettings,
    this.apiGatewayManaged,
    this.autoDeploy,
    this.clientCertificateId,
    this.createdDate,
    this.defaultRouteSettings,
    this.deploymentId,
    this.description,
    this.lastDeploymentStatusMessage,
    this.lastUpdatedDate,
    this.routeSettings,
    this.stageName,
    this.stageVariables,
    this.tags,
  });
  factory CreateStageResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateStageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVpcLinkResponse {
  /// The timestamp when the VPC link was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The name of the VPC link.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of security group IDs for the VPC link.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// A list of subnet IDs to include in the VPC link.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  /// Tags for the VPC link.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The ID of the VPC link.
  @_s.JsonKey(name: 'vpcLinkId')
  final String vpcLinkId;

  /// The status of the VPC link.
  @_s.JsonKey(name: 'vpcLinkStatus')
  final VpcLinkStatus vpcLinkStatus;

  /// A message summarizing the cause of the status of the VPC link.
  @_s.JsonKey(name: 'vpcLinkStatusMessage')
  final String vpcLinkStatusMessage;

  /// The version of the VPC link.
  @_s.JsonKey(name: 'vpcLinkVersion')
  final VpcLinkVersion vpcLinkVersion;

  CreateVpcLinkResponse({
    this.createdDate,
    this.name,
    this.securityGroupIds,
    this.subnetIds,
    this.tags,
    this.vpcLinkId,
    this.vpcLinkStatus,
    this.vpcLinkStatusMessage,
    this.vpcLinkVersion,
  });
  factory CreateVpcLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateVpcLinkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVpcLinkResponse {
  DeleteVpcLinkResponse();
  factory DeleteVpcLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteVpcLinkResponseFromJson(json);
}

/// An immutable representation of an API that can be called by users. A
/// Deployment must be associated with a Stage for it to be callable over the
/// internet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Deployment {
  /// Specifies whether a deployment was automatically released.
  @_s.JsonKey(name: 'autoDeployed')
  final bool autoDeployed;

  /// The date and time when the Deployment resource was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The identifier for the deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The status of the deployment: PENDING, FAILED, or SUCCEEDED.
  @_s.JsonKey(name: 'deploymentStatus')
  final DeploymentStatus deploymentStatus;

  /// May contain additional feedback on the status of an API deployment.
  @_s.JsonKey(name: 'deploymentStatusMessage')
  final String deploymentStatusMessage;

  /// The description for the deployment.
  @_s.JsonKey(name: 'description')
  final String description;

  Deployment({
    this.autoDeployed,
    this.createdDate,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentStatusMessage,
    this.description,
  });
  factory Deployment.fromJson(Map<String, dynamic> json) =>
      _$DeploymentFromJson(json);
}

/// Represents a deployment status.
enum DeploymentStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('DEPLOYED')
  deployed,
}

/// Represents a domain name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainName {
  /// The name of the DomainName resource.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The API mapping selection expression.
  @_s.JsonKey(name: 'apiMappingSelectionExpression')
  final String apiMappingSelectionExpression;

  /// The domain name configurations.
  @_s.JsonKey(name: 'domainNameConfigurations')
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The mutual TLS authentication configuration for a custom domain name.
  @_s.JsonKey(name: 'mutualTlsAuthentication')
  final MutualTlsAuthentication mutualTlsAuthentication;

  /// The collection of tags associated with a domain name.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DomainName({
    @_s.required this.domainName,
    this.apiMappingSelectionExpression,
    this.domainNameConfigurations,
    this.mutualTlsAuthentication,
    this.tags,
  });
  factory DomainName.fromJson(Map<String, dynamic> json) =>
      _$DomainNameFromJson(json);
}

/// The domain name configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DomainNameConfiguration {
  /// A domain name for the API.
  @_s.JsonKey(name: 'apiGatewayDomainName')
  final String apiGatewayDomainName;

  /// An AWS-managed certificate that will be used by the edge-optimized endpoint
  /// for this domain name. AWS Certificate Manager is the only supported source.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The user-friendly name of the certificate that will be used by the
  /// edge-optimized endpoint for this domain name.
  @_s.JsonKey(name: 'certificateName')
  final String certificateName;

  /// The timestamp when the certificate that was used by edge-optimized endpoint
  /// for this domain name was uploaded.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'certificateUploadDate')
  final DateTime certificateUploadDate;

  /// The status of the domain name migration. The valid values are AVAILABLE and
  /// UPDATING. If the status is UPDATING, the domain cannot be modified further
  /// until the existing operation is complete. If it is AVAILABLE, the domain can
  /// be updated.
  @_s.JsonKey(name: 'domainNameStatus')
  final DomainNameStatus domainNameStatus;

  /// An optional text message containing detailed information about status of the
  /// domain name migration.
  @_s.JsonKey(name: 'domainNameStatusMessage')
  final String domainNameStatusMessage;

  /// The endpoint type.
  @_s.JsonKey(name: 'endpointType')
  final EndpointType endpointType;

  /// The Amazon Route 53 Hosted Zone ID of the endpoint.
  @_s.JsonKey(name: 'hostedZoneId')
  final String hostedZoneId;

  /// The Transport Layer Security (TLS) version of the security policy for this
  /// domain name. The valid values are TLS_1_0 and TLS_1_2.
  @_s.JsonKey(name: 'securityPolicy')
  final SecurityPolicy securityPolicy;

  DomainNameConfiguration({
    this.apiGatewayDomainName,
    this.certificateArn,
    this.certificateName,
    this.certificateUploadDate,
    this.domainNameStatus,
    this.domainNameStatusMessage,
    this.endpointType,
    this.hostedZoneId,
    this.securityPolicy,
  });
  factory DomainNameConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DomainNameConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$DomainNameConfigurationToJson(this);
}

/// The status of the domain name migration. The valid values are AVAILABLE and
/// UPDATING. If the status is UPDATING, the domain cannot be modified further
/// until the existing operation is complete. If it is AVAILABLE, the domain can
/// be updated.
enum DomainNameStatus {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('UPDATING')
  updating,
}

/// Represents an endpoint type.
enum EndpointType {
  @_s.JsonValue('REGIONAL')
  regional,
  @_s.JsonValue('EDGE')
  edge,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportApiResponse {
  @Uint8ListConverter()
  @_s.JsonKey(name: 'body')
  final Uint8List body;

  ExportApiResponse({
    this.body,
  });
  factory ExportApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ExportApiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApiMappingResponse {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// The API mapping identifier.
  @_s.JsonKey(name: 'apiMappingId')
  final String apiMappingId;

  /// The API mapping key.
  @_s.JsonKey(name: 'apiMappingKey')
  final String apiMappingKey;

  /// The API stage.
  @_s.JsonKey(name: 'stage')
  final String stage;

  GetApiMappingResponse({
    this.apiId,
    this.apiMappingId,
    this.apiMappingKey,
    this.stage,
  });
  factory GetApiMappingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetApiMappingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApiMappingsResponse {
  /// The elements from this collection.
  @_s.JsonKey(name: 'items')
  final List<ApiMapping> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetApiMappingsResponse({
    this.items,
    this.nextToken,
  });
  factory GetApiMappingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetApiMappingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApiResponse {
  /// The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com.
  /// The stage name is typically appended to this URI to form a complete path to
  /// a deployed API stage.
  @_s.JsonKey(name: 'apiEndpoint')
  final String apiEndpoint;

  /// Specifies whether an API is managed by API Gateway. You can't update or
  /// delete a managed API by using API Gateway. A managed API can be deleted only
  /// through the tooling or service that created it.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// The API ID.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  @_s.JsonKey(name: 'apiKeySelectionExpression')
  final String apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'corsConfiguration')
  final Cors corsConfiguration;

  /// The timestamp when the API was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  @_s.JsonKey(name: 'disableExecuteApiEndpoint')
  final bool disableExecuteApiEndpoint;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'disableSchemaValidation')
  final bool disableSchemaValidation;

  /// The validation information during API import. This may include particular
  /// properties of your OpenAPI definition which are ignored during import.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'importInfo')
  final List<String> importInfo;

  /// The name of the API.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The API protocol.
  @_s.JsonKey(name: 'protocolType')
  final ProtocolType protocolType;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  @_s.JsonKey(name: 'routeSelectionExpression')
  final String routeSelectionExpression;

  /// A collection of tags associated with the API.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// A version identifier for the API.
  @_s.JsonKey(name: 'version')
  final String version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  @_s.JsonKey(name: 'warnings')
  final List<String> warnings;

  GetApiResponse({
    this.apiEndpoint,
    this.apiGatewayManaged,
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
    this.disableExecuteApiEndpoint,
    this.disableSchemaValidation,
    this.importInfo,
    this.name,
    this.protocolType,
    this.routeSelectionExpression,
    this.tags,
    this.version,
    this.warnings,
  });
  factory GetApiResponse.fromJson(Map<String, dynamic> json) =>
      _$GetApiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApisResponse {
  /// The elements from this collection.
  @_s.JsonKey(name: 'items')
  final List<Api> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetApisResponse({
    this.items,
    this.nextToken,
  });
  factory GetApisResponse.fromJson(Map<String, dynamic> json) =>
      _$GetApisResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAuthorizerResponse {
  /// Specifies the required credentials as an IAM role for API Gateway to invoke
  /// the authorizer. To specify an IAM role for API Gateway to assume, use the
  /// role's Amazon Resource Name (ARN). To use resource-based permissions on the
  /// Lambda function, don't specify this parameter. Supported only for REQUEST
  /// authorizers.
  @_s.JsonKey(name: 'authorizerCredentialsArn')
  final String authorizerCredentialsArn;

  /// The authorizer identifier.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// Specifies the format of the payload sent to an HTTP API Lambda authorizer.
  /// Required for HTTP API Lambda authorizers. Supported values are 1.0 and 2.0.
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  @_s.JsonKey(name: 'authorizerPayloadFormatVersion')
  final String authorizerPayloadFormatVersion;

  /// The time to live (TTL) for cached authorizer results, in seconds. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway caches authorizer responses. The maximum value is 3600, or 1 hour.
  /// Supported only for HTTP API Lambda authorizers.
  @_s.JsonKey(name: 'authorizerResultTtlInSeconds')
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. Specify REQUEST for a Lambda function using incoming
  /// request parameters. Specify JWT to use JSON Web Tokens (supported only for
  /// HTTP APIs).
  @_s.JsonKey(name: 'authorizerType')
  final AuthorizerType authorizerType;

  /// The authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers,
  /// this must be a well-formed Lambda function URI, for example,
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>
  /// , where <replaceable></replaceable>{region} is the same as the region
  /// hosting the Lambda function, path indicates that the remaining substring in
  /// the URI should be treated as the path to the resource, including the initial
  /// /. For Lambda functions, this is usually of the form
  /// /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST
  /// authorizers.
  @_s.JsonKey(name: 'authorizerUri')
  final String authorizerUri;

  /// Specifies whether a Lambda authorizer returns a response in a simple format.
  /// If enabled, the Lambda authorizer can return a boolean value instead of an
  /// IAM policy. Supported only for HTTP APIs. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>
  @_s.JsonKey(name: 'enableSimpleResponses')
  final bool enableSimpleResponses;

  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. The identity
  /// source can be headers, query string parameters, stage variables, and context
  /// parameters. For example, if an Auth header and a Name query string parameter
  /// are defined as identity sources, this value is route.request.header.Auth,
  /// route.request.querystring.Name for WebSocket APIs. For HTTP APIs, use
  /// selection expressions prefixed with $, for example, $request.header.Auth,
  /// $request.querystring.Name. These parameters are used to perform runtime
  /// validation for Lambda-based authorizers by verifying all of the
  /// identity-related request parameters are present in the request, not null,
  /// and non-empty. Only when this is true does the authorizer invoke the
  /// authorizer Lambda function. Otherwise, it returns a 401 Unauthorized
  /// response without calling the Lambda function. For HTTP APIs, identity
  /// sources are also used as the cache key when caching is enabled. To learn
  /// more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT) from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// $request.header.Authorization.
  @_s.JsonKey(name: 'identitySource')
  final List<String> identitySource;

  /// The validation expression does not apply to the REQUEST authorizer.
  @_s.JsonKey(name: 'identityValidationExpression')
  final String identityValidationExpression;

  /// Represents the configuration of a JWT authorizer. Required for the JWT
  /// authorizer type. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'jwtConfiguration')
  final JWTConfiguration jwtConfiguration;

  /// The name of the authorizer.
  @_s.JsonKey(name: 'name')
  final String name;

  GetAuthorizerResponse({
    this.authorizerCredentialsArn,
    this.authorizerId,
    this.authorizerPayloadFormatVersion,
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
    this.enableSimpleResponses,
    this.identitySource,
    this.identityValidationExpression,
    this.jwtConfiguration,
    this.name,
  });
  factory GetAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAuthorizerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAuthorizersResponse {
  /// The elements from this collection.
  @_s.JsonKey(name: 'items')
  final List<Authorizer> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetAuthorizersResponse({
    this.items,
    this.nextToken,
  });
  factory GetAuthorizersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAuthorizersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeploymentResponse {
  /// Specifies whether a deployment was automatically released.
  @_s.JsonKey(name: 'autoDeployed')
  final bool autoDeployed;

  /// The date and time when the Deployment resource was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The identifier for the deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The status of the deployment: PENDING, FAILED, or SUCCEEDED.
  @_s.JsonKey(name: 'deploymentStatus')
  final DeploymentStatus deploymentStatus;

  /// May contain additional feedback on the status of an API deployment.
  @_s.JsonKey(name: 'deploymentStatusMessage')
  final String deploymentStatusMessage;

  /// The description for the deployment.
  @_s.JsonKey(name: 'description')
  final String description;

  GetDeploymentResponse({
    this.autoDeployed,
    this.createdDate,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentStatusMessage,
    this.description,
  });
  factory GetDeploymentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDeploymentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDeploymentsResponse {
  /// The elements from this collection.
  @_s.JsonKey(name: 'items')
  final List<Deployment> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetDeploymentsResponse({
    this.items,
    this.nextToken,
  });
  factory GetDeploymentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDeploymentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDomainNameResponse {
  /// The API mapping selection expression.
  @_s.JsonKey(name: 'apiMappingSelectionExpression')
  final String apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The domain name configurations.
  @_s.JsonKey(name: 'domainNameConfigurations')
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The mutual TLS authentication configuration for a custom domain name.
  @_s.JsonKey(name: 'mutualTlsAuthentication')
  final MutualTlsAuthentication mutualTlsAuthentication;

  /// The collection of tags associated with a domain name.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.mutualTlsAuthentication,
    this.tags,
  });
  factory GetDomainNameResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDomainNameResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDomainNamesResponse {
  /// The elements from this collection.
  @_s.JsonKey(name: 'items')
  final List<DomainName> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetDomainNamesResponse({
    this.items,
    this.nextToken,
  });
  factory GetDomainNamesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDomainNamesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIntegrationResult {
  /// Specifies whether an integration is managed by API Gateway. If you created
  /// an API using using quick create, the resulting integration is managed by API
  /// Gateway. You can update a managed integration, but you can't delete it.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// The ID of the VPC link for a private integration. Supported only for HTTP
  /// APIs.
  @_s.JsonKey(name: 'connectionId')
  final String connectionId;

  /// The type of the network connection to the integration endpoint. Specify
  /// INTERNET for connections through the public routable internet or VPC_LINK
  /// for private connections between API Gateway and resources in a VPC. The
  /// default value is INTERNET.
  @_s.JsonKey(name: 'connectionType')
  final ConnectionType connectionType;

  /// Supported only for WebSocket APIs. Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT_TO_BINARY and
  /// CONVERT_TO_TEXT, with the following behaviors:
  ///
  /// CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string
  /// to the corresponding binary blob.
  ///
  /// CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed through
  /// from the integration response to the route response or method response
  /// without modification.
  @_s.JsonKey(name: 'contentHandlingStrategy')
  final ContentHandlingStrategy contentHandlingStrategy;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on supported
  /// AWS services, specify null.
  @_s.JsonKey(name: 'credentialsArn')
  final String credentialsArn;

  /// Represents the description of an integration.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Represents the identifier of an integration.
  @_s.JsonKey(name: 'integrationId')
  final String integrationId;

  /// Specifies the integration's HTTP method type.
  @_s.JsonKey(name: 'integrationMethod')
  final String integrationMethod;

  /// The integration response selection expression for the integration. Supported
  /// only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions">Integration
  /// Response Selection Expressions</a>.
  @_s.JsonKey(name: 'integrationResponseSelectionExpression')
  final String integrationResponseSelectionExpression;

  /// Supported only for HTTP API AWS_PROXY integrations. Specifies the AWS
  /// service action to invoke. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services-reference.html">Integration
  /// subtype reference</a>.
  @_s.JsonKey(name: 'integrationSubtype')
  final String integrationSubtype;

  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service action,
  /// including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with a Lambda
  /// function or other AWS service action. This integration is also referred to
  /// as a Lambda proxy integration.
  ///
  /// HTTP: for integrating the route or method request with an HTTP endpoint.
  /// This integration is also referred to as the HTTP custom integration.
  /// Supported only for WebSocket APIs.
  ///
  /// HTTP_PROXY: for integrating the route or method request with an HTTP
  /// endpoint, with the client request passed through as-is. This is also
  /// referred to as HTTP proxy integration.
  ///
  /// MOCK: for integrating the route or method request with API Gateway as a
  /// "loopback" endpoint without invoking any backend. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'integrationType')
  final IntegrationType integrationType;

  /// For a Lambda integration, specify the URI of a Lambda function.
  ///
  /// For an HTTP integration, specify a fully-qualified URL.
  ///
  /// For an HTTP API private integration, specify the ARN of an Application Load
  /// Balancer listener, Network Load Balancer listener, or AWS Cloud Map service.
  /// If you specify the ARN of an AWS Cloud Map service, API Gateway uses
  /// DiscoverInstances to identify resources. You can use query parameters to
  /// target specific resources. To learn more, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>.
  /// For private integrations, all resources must be owned by the same AWS
  /// account.
  @_s.JsonKey(name: 'integrationUri')
  final String integrationUri;

  /// Specifies the pass-through behavior for incoming requests based on the
  /// Content-Type header in the request, and the available mapping templates
  /// specified as the requestTemplates property on the Integration resource.
  /// There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
  /// Supported only for WebSocket APIs.
  ///
  /// WHEN_NO_MATCH passes the request body for unmapped content types through to
  /// the integration backend without transformation.
  ///
  /// NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type
  /// response.
  ///
  /// WHEN_NO_TEMPLATES allows pass-through when the integration has no content
  /// types mapped to templates. However, if there is at least one content type
  /// defined, unmapped content types will be rejected with the same HTTP 415
  /// Unsupported Media Type response.
  @_s.JsonKey(name: 'passthroughBehavior')
  final PassthroughBehavior passthroughBehavior;

  /// Specifies the format of the payload sent to an integration. Required for
  /// HTTP APIs.
  @_s.JsonKey(name: 'payloadFormatVersion')
  final String payloadFormatVersion;

  /// For WebSocket APIs, a key-value map specifying request parameters that are
  /// passed from the method request to the backend. The key is an integration
  /// request parameter name and the associated value is a method request
  /// parameter value or static value that must be enclosed within single quotes
  /// and pre-encoded as required by the backend. The method request parameter
  /// value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name.
  ///
  /// For HTTP API integrations with a specified integrationSubtype, request
  /// parameters are a key-value map specifying parameters that are passed to
  /// AWS_PROXY integrations. You can provide static values, or map request data,
  /// stage variables, or context variables that are evaluated at runtime. To
  /// learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services.html">Working
  /// with AWS service integrations for HTTP APIs</a>.
  ///
  /// For HTTP API itegrations, without a specified integrationSubtype request
  /// parameters are a key-value map specifying how to transform HTTP requests
  /// before sending them to backend integrations. The key should follow the
  /// pattern &lt;action&gt;:&lt;header|querystring|path&gt;.&lt;location&gt;. The
  /// action can be append, overwrite or remove. For values, you can provide
  /// static values, or map request data, stage variables, or context variables
  /// that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestTemplates')
  final Map<String, String> requestTemplates;

  /// Supported only for HTTP APIs. You use response parameters to transform the
  /// HTTP response from a backend integration before returning the response to
  /// clients. Specify a key-value map from a selection key to response
  /// parameters. The selection key must be a valid HTTP status code within the
  /// range of 200-599. Response parameters are a key-value map. The key must
  /// match pattern &lt;action&gt;:&lt;header&gt;.&lt;location&gt; or
  /// overwrite.statuscode. The action can be append, overwrite or remove. The
  /// value can be a static value, or map to response data, stage variables, or
  /// context variables that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, Map<String, String>> responseParameters;

  /// The template selection expression for the integration. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'templateSelectionExpression')
  final String templateSelectionExpression;

  /// Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and
  /// between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29
  /// seconds for WebSocket APIs and 30 seconds for HTTP APIs.
  @_s.JsonKey(name: 'timeoutInMillis')
  final int timeoutInMillis;

  /// The TLS configuration for a private integration. If you specify a TLS
  /// configuration, private integration traffic uses the HTTPS protocol.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'tlsConfig')
  final TlsConfig tlsConfig;

  GetIntegrationResult({
    this.apiGatewayManaged,
    this.connectionId,
    this.connectionType,
    this.contentHandlingStrategy,
    this.credentialsArn,
    this.description,
    this.integrationId,
    this.integrationMethod,
    this.integrationResponseSelectionExpression,
    this.integrationSubtype,
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.payloadFormatVersion,
    this.requestParameters,
    this.requestTemplates,
    this.responseParameters,
    this.templateSelectionExpression,
    this.timeoutInMillis,
    this.tlsConfig,
  });
  factory GetIntegrationResult.fromJson(Map<String, dynamic> json) =>
      _$GetIntegrationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIntegrationResponseResponse {
  /// Supported only for WebSocket APIs. Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT_TO_BINARY and
  /// CONVERT_TO_TEXT, with the following behaviors:
  ///
  /// CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string
  /// to the corresponding binary blob.
  ///
  /// CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed through
  /// from the integration response to the route response or method response
  /// without modification.
  @_s.JsonKey(name: 'contentHandlingStrategy')
  final ContentHandlingStrategy contentHandlingStrategy;

  /// The integration response ID.
  @_s.JsonKey(name: 'integrationResponseId')
  final String integrationResponseId;

  /// The integration response key.
  @_s.JsonKey(name: 'integrationResponseKey')
  final String integrationResponseKey;

  /// A key-value map specifying response parameters that are passed to the method
  /// response from the backend. The key is a method response header parameter
  /// name and the mapped value is an integration response header value, a static
  /// value enclosed within a pair of single quotes, or a JSON expression from the
  /// integration response body. The mapping key must match the pattern of
  /// method.response.header.{name}, where name is a valid and unique header name.
  /// The mapped non-static value must match the pattern of
  /// integration.response.header.{name} or
  /// integration.response.body.{JSON-expression}, where name is a valid and
  /// unique response header name and JSON-expression is a valid JSON expression
  /// without the $ prefix.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, String> responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are represented
  /// as a key/value map, with a content-type as the key and a template as the
  /// value.
  @_s.JsonKey(name: 'responseTemplates')
  final Map<String, String> responseTemplates;

  /// The template selection expressions for the integration response.
  @_s.JsonKey(name: 'templateSelectionExpression')
  final String templateSelectionExpression;

  GetIntegrationResponseResponse({
    this.contentHandlingStrategy,
    this.integrationResponseId,
    this.integrationResponseKey,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });
  factory GetIntegrationResponseResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIntegrationResponseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIntegrationResponsesResponse {
  /// The elements from this collection.
  @_s.JsonKey(name: 'items')
  final List<IntegrationResponse> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetIntegrationResponsesResponse({
    this.items,
    this.nextToken,
  });
  factory GetIntegrationResponsesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIntegrationResponsesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIntegrationsResponse {
  /// The elements from this collection.
  @_s.JsonKey(name: 'items')
  final List<Integration> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetIntegrationsResponse({
    this.items,
    this.nextToken,
  });
  factory GetIntegrationsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIntegrationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetModelResponse {
  /// The content-type for the model, for example, "application/json".
  @_s.JsonKey(name: 'contentType')
  final String contentType;

  /// The description of the model.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The model identifier.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The name of the model. Must be alphanumeric.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  @_s.JsonKey(name: 'schema')
  final String schema;

  GetModelResponse({
    this.contentType,
    this.description,
    this.modelId,
    this.name,
    this.schema,
  });
  factory GetModelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetModelTemplateResponse {
  /// The template value.
  @_s.JsonKey(name: 'value')
  final String value;

  GetModelTemplateResponse({
    this.value,
  });
  factory GetModelTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetModelTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetModelsResponse {
  /// The elements from this collection.
  @_s.JsonKey(name: 'items')
  final List<Model> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetModelsResponse({
    this.items,
    this.nextToken,
  });
  factory GetModelsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetModelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRouteResult {
  /// Specifies whether a route is managed by API Gateway. If you created an API
  /// using quick create, the $default route is managed by API Gateway. You can't
  /// modify the $default route key.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// Specifies whether an API key is required for this route. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'apiKeyRequired')
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a JWT authorizer to authorize the method invocation. The authorization
  /// works by matching the route scopes against the scopes parsed from the access
  /// token in the incoming request. The method invocation is authorized if any
  /// route scope matches a claimed scope in the access token. Otherwise, the
  /// invocation is not authorized. When the route scope is configured, the client
  /// must provide an access token instead of an identity token for authorization
  /// purposes.
  @_s.JsonKey(name: 'authorizationScopes')
  final List<String> authorizationScopes;

  /// The authorization type for the route. For WebSocket APIs, valid values are
  /// NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for
  /// using a Lambda authorizer For HTTP APIs, valid values are NONE for open
  /// access, JWT for using JSON Web Tokens, AWS_IAM for using AWS IAM
  /// permissions, and CUSTOM for using a Lambda authorizer.
  @_s.JsonKey(name: 'authorizationType')
  final AuthorizationType authorizationType;

  /// The identifier of the Authorizer resource to be associated with this route.
  /// The authorizer identifier is generated by API Gateway when you created the
  /// authorizer.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// The model selection expression for the route. Supported only for WebSocket
  /// APIs.
  @_s.JsonKey(name: 'modelSelectionExpression')
  final String modelSelectionExpression;

  /// The operation name for the route.
  @_s.JsonKey(name: 'operationName')
  final String operationName;

  /// The request models for the route. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestModels')
  final Map<String, String> requestModels;

  /// The request parameters for the route. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, ParameterConstraints> requestParameters;

  /// The route ID.
  @_s.JsonKey(name: 'routeId')
  final String routeId;

  /// The route key for the route.
  @_s.JsonKey(name: 'routeKey')
  final String routeKey;

  /// The route response selection expression for the route. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'routeResponseSelectionExpression')
  final String routeResponseSelectionExpression;

  /// The target for the route.
  @_s.JsonKey(name: 'target')
  final String target;

  GetRouteResult({
    this.apiGatewayManaged,
    this.apiKeyRequired,
    this.authorizationScopes,
    this.authorizationType,
    this.authorizerId,
    this.modelSelectionExpression,
    this.operationName,
    this.requestModels,
    this.requestParameters,
    this.routeId,
    this.routeKey,
    this.routeResponseSelectionExpression,
    this.target,
  });
  factory GetRouteResult.fromJson(Map<String, dynamic> json) =>
      _$GetRouteResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRouteResponseResponse {
  /// Represents the model selection expression of a route response. Supported
  /// only for WebSocket APIs.
  @_s.JsonKey(name: 'modelSelectionExpression')
  final String modelSelectionExpression;

  /// Represents the response models of a route response.
  @_s.JsonKey(name: 'responseModels')
  final Map<String, String> responseModels;

  /// Represents the response parameters of a route response.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, ParameterConstraints> responseParameters;

  /// Represents the identifier of a route response.
  @_s.JsonKey(name: 'routeResponseId')
  final String routeResponseId;

  /// Represents the route response key of a route response.
  @_s.JsonKey(name: 'routeResponseKey')
  final String routeResponseKey;

  GetRouteResponseResponse({
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseId,
    this.routeResponseKey,
  });
  factory GetRouteResponseResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRouteResponseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRouteResponsesResponse {
  /// The elements from this collection.
  @_s.JsonKey(name: 'items')
  final List<RouteResponse> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetRouteResponsesResponse({
    this.items,
    this.nextToken,
  });
  factory GetRouteResponsesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRouteResponsesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRoutesResponse {
  /// The elements from this collection.
  @_s.JsonKey(name: 'items')
  final List<Route> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetRoutesResponse({
    this.items,
    this.nextToken,
  });
  factory GetRoutesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRoutesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetStageResponse {
  /// Settings for logging access in this stage.
  @_s.JsonKey(name: 'accessLogSettings')
  final AccessLogSettings accessLogSettings;

  /// Specifies whether a stage is managed by API Gateway. If you created an API
  /// using quick create, the $default stage is managed by API Gateway. You can't
  /// modify the $default stage.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// Specifies whether updates to an API automatically trigger a new deployment.
  /// The default value is false.
  @_s.JsonKey(name: 'autoDeploy')
  final bool autoDeploy;

  /// The identifier of a client certificate for a Stage. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'clientCertificateId')
  final String clientCertificateId;

  /// The timestamp when the stage was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// Default route settings for the stage.
  @_s.JsonKey(name: 'defaultRouteSettings')
  final RouteSettings defaultRouteSettings;

  /// The identifier of the Deployment that the Stage is associated with. Can't be
  /// updated if autoDeploy is enabled.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The description of the stage.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Describes the status of the last deployment of a stage. Supported only for
  /// stages with autoDeploy enabled.
  @_s.JsonKey(name: 'lastDeploymentStatusMessage')
  final String lastDeploymentStatusMessage;

  /// The timestamp when the stage was last updated.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// Route settings for the stage, by routeKey.
  @_s.JsonKey(name: 'routeSettings')
  final Map<String, RouteSettings> routeSettings;

  /// The name of the stage.
  @_s.JsonKey(name: 'stageName')
  final String stageName;

  /// A map that defines the stage variables for a stage resource. Variable names
  /// can have alphanumeric and underscore characters, and the values must match
  /// [A-Za-z0-9-._~:/?#&amp;=,]+.
  @_s.JsonKey(name: 'stageVariables')
  final Map<String, String> stageVariables;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetStageResponse({
    this.accessLogSettings,
    this.apiGatewayManaged,
    this.autoDeploy,
    this.clientCertificateId,
    this.createdDate,
    this.defaultRouteSettings,
    this.deploymentId,
    this.description,
    this.lastDeploymentStatusMessage,
    this.lastUpdatedDate,
    this.routeSettings,
    this.stageName,
    this.stageVariables,
    this.tags,
  });
  factory GetStageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetStagesResponse {
  /// The elements from this collection.
  @_s.JsonKey(name: 'items')
  final List<Stage> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetStagesResponse({
    this.items,
    this.nextToken,
  });
  factory GetStagesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStagesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTagsResponse {
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetTagsResponse({
    this.tags,
  });
  factory GetTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTagsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVpcLinkResponse {
  /// The timestamp when the VPC link was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The name of the VPC link.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of security group IDs for the VPC link.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// A list of subnet IDs to include in the VPC link.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  /// Tags for the VPC link.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The ID of the VPC link.
  @_s.JsonKey(name: 'vpcLinkId')
  final String vpcLinkId;

  /// The status of the VPC link.
  @_s.JsonKey(name: 'vpcLinkStatus')
  final VpcLinkStatus vpcLinkStatus;

  /// A message summarizing the cause of the status of the VPC link.
  @_s.JsonKey(name: 'vpcLinkStatusMessage')
  final String vpcLinkStatusMessage;

  /// The version of the VPC link.
  @_s.JsonKey(name: 'vpcLinkVersion')
  final VpcLinkVersion vpcLinkVersion;

  GetVpcLinkResponse({
    this.createdDate,
    this.name,
    this.securityGroupIds,
    this.subnetIds,
    this.tags,
    this.vpcLinkId,
    this.vpcLinkStatus,
    this.vpcLinkStatusMessage,
    this.vpcLinkVersion,
  });
  factory GetVpcLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVpcLinkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVpcLinksResponse {
  /// A collection of VPC links.
  @_s.JsonKey(name: 'items')
  final List<VpcLink> items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetVpcLinksResponse({
    this.items,
    this.nextToken,
  });
  factory GetVpcLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVpcLinksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportApiResponse {
  /// The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com.
  /// The stage name is typically appended to this URI to form a complete path to
  /// a deployed API stage.
  @_s.JsonKey(name: 'apiEndpoint')
  final String apiEndpoint;

  /// Specifies whether an API is managed by API Gateway. You can't update or
  /// delete a managed API by using API Gateway. A managed API can be deleted only
  /// through the tooling or service that created it.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// The API ID.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  @_s.JsonKey(name: 'apiKeySelectionExpression')
  final String apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'corsConfiguration')
  final Cors corsConfiguration;

  /// The timestamp when the API was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  @_s.JsonKey(name: 'disableExecuteApiEndpoint')
  final bool disableExecuteApiEndpoint;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'disableSchemaValidation')
  final bool disableSchemaValidation;

  /// The validation information during API import. This may include particular
  /// properties of your OpenAPI definition which are ignored during import.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'importInfo')
  final List<String> importInfo;

  /// The name of the API.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The API protocol.
  @_s.JsonKey(name: 'protocolType')
  final ProtocolType protocolType;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  @_s.JsonKey(name: 'routeSelectionExpression')
  final String routeSelectionExpression;

  /// A collection of tags associated with the API.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// A version identifier for the API.
  @_s.JsonKey(name: 'version')
  final String version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  @_s.JsonKey(name: 'warnings')
  final List<String> warnings;

  ImportApiResponse({
    this.apiEndpoint,
    this.apiGatewayManaged,
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
    this.disableExecuteApiEndpoint,
    this.disableSchemaValidation,
    this.importInfo,
    this.name,
    this.protocolType,
    this.routeSelectionExpression,
    this.tags,
    this.version,
    this.warnings,
  });
  factory ImportApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportApiResponseFromJson(json);
}

/// Represents an integration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Integration {
  /// Specifies whether an integration is managed by API Gateway. If you created
  /// an API using using quick create, the resulting integration is managed by API
  /// Gateway. You can update a managed integration, but you can't delete it.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// The ID of the VPC link for a private integration. Supported only for HTTP
  /// APIs.
  @_s.JsonKey(name: 'connectionId')
  final String connectionId;

  /// The type of the network connection to the integration endpoint. Specify
  /// INTERNET for connections through the public routable internet or VPC_LINK
  /// for private connections between API Gateway and resources in a VPC. The
  /// default value is INTERNET.
  @_s.JsonKey(name: 'connectionType')
  final ConnectionType connectionType;

  /// Supported only for WebSocket APIs. Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT_TO_BINARY and
  /// CONVERT_TO_TEXT, with the following behaviors:
  ///
  /// CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string
  /// to the corresponding binary blob.
  ///
  /// CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed through
  /// from the integration response to the route response or method response
  /// without modification.
  @_s.JsonKey(name: 'contentHandlingStrategy')
  final ContentHandlingStrategy contentHandlingStrategy;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on supported
  /// AWS services, specify null.
  @_s.JsonKey(name: 'credentialsArn')
  final String credentialsArn;

  /// Represents the description of an integration.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Represents the identifier of an integration.
  @_s.JsonKey(name: 'integrationId')
  final String integrationId;

  /// Specifies the integration's HTTP method type.
  @_s.JsonKey(name: 'integrationMethod')
  final String integrationMethod;

  /// The integration response selection expression for the integration. Supported
  /// only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions">Integration
  /// Response Selection Expressions</a>.
  @_s.JsonKey(name: 'integrationResponseSelectionExpression')
  final String integrationResponseSelectionExpression;

  /// Supported only for HTTP API AWS_PROXY integrations. Specifies the AWS
  /// service action to invoke. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services-reference.html">Integration
  /// subtype reference</a>.
  @_s.JsonKey(name: 'integrationSubtype')
  final String integrationSubtype;

  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service action,
  /// including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with a Lambda
  /// function or other AWS service action. This integration is also referred to
  /// as a Lambda proxy integration.
  ///
  /// HTTP: for integrating the route or method request with an HTTP endpoint.
  /// This integration is also referred to as the HTTP custom integration.
  /// Supported only for WebSocket APIs.
  ///
  /// HTTP_PROXY: for integrating the route or method request with an HTTP
  /// endpoint, with the client request passed through as-is. This is also
  /// referred to as HTTP proxy integration.
  ///
  /// MOCK: for integrating the route or method request with API Gateway as a
  /// "loopback" endpoint without invoking any backend. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'integrationType')
  final IntegrationType integrationType;

  /// For a Lambda integration, specify the URI of a Lambda function.
  ///
  /// For an HTTP integration, specify a fully-qualified URL.
  ///
  /// For an HTTP API private integration, specify the ARN of an Application Load
  /// Balancer listener, Network Load Balancer listener, or AWS Cloud Map service.
  /// If you specify the ARN of an AWS Cloud Map service, API Gateway uses
  /// DiscoverInstances to identify resources. You can use query parameters to
  /// target specific resources. To learn more, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>.
  /// For private integrations, all resources must be owned by the same AWS
  /// account.
  @_s.JsonKey(name: 'integrationUri')
  final String integrationUri;

  /// Specifies the pass-through behavior for incoming requests based on the
  /// Content-Type header in the request, and the available mapping templates
  /// specified as the requestTemplates property on the Integration resource.
  /// There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
  /// Supported only for WebSocket APIs.
  ///
  /// WHEN_NO_MATCH passes the request body for unmapped content types through to
  /// the integration backend without transformation.
  ///
  /// NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type
  /// response.
  ///
  /// WHEN_NO_TEMPLATES allows pass-through when the integration has no content
  /// types mapped to templates. However, if there is at least one content type
  /// defined, unmapped content types will be rejected with the same HTTP 415
  /// Unsupported Media Type response.
  @_s.JsonKey(name: 'passthroughBehavior')
  final PassthroughBehavior passthroughBehavior;

  /// Specifies the format of the payload sent to an integration. Required for
  /// HTTP APIs.
  @_s.JsonKey(name: 'payloadFormatVersion')
  final String payloadFormatVersion;

  /// For WebSocket APIs, a key-value map specifying request parameters that are
  /// passed from the method request to the backend. The key is an integration
  /// request parameter name and the associated value is a method request
  /// parameter value or static value that must be enclosed within single quotes
  /// and pre-encoded as required by the backend. The method request parameter
  /// value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name.
  ///
  /// For HTTP API integrations with a specified integrationSubtype, request
  /// parameters are a key-value map specifying parameters that are passed to
  /// AWS_PROXY integrations. You can provide static values, or map request data,
  /// stage variables, or context variables that are evaluated at runtime. To
  /// learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services.html">Working
  /// with AWS service integrations for HTTP APIs</a>.
  ///
  /// For HTTP API itegrations, without a specified integrationSubtype request
  /// parameters are a key-value map specifying how to transform HTTP requests
  /// before sending them to backend integrations. The key should follow the
  /// pattern &lt;action&gt;:&lt;header|querystring|path&gt;.&lt;location&gt;. The
  /// action can be append, overwrite or remove. For values, you can provide
  /// static values, or map request data, stage variables, or context variables
  /// that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestTemplates')
  final Map<String, String> requestTemplates;

  /// Supported only for HTTP APIs. You use response parameters to transform the
  /// HTTP response from a backend integration before returning the response to
  /// clients. Specify a key-value map from a selection key to response
  /// parameters. The selection key must be a valid HTTP status code within the
  /// range of 200-599. Response parameters are a key-value map. The key must
  /// match pattern &lt;action&gt;:&lt;header&gt;.&lt;location&gt; or
  /// overwrite.statuscode. The action can be append, overwrite or remove. The
  /// value can be a static value, or map to response data, stage variables, or
  /// context variables that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, Map<String, String>> responseParameters;

  /// The template selection expression for the integration. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'templateSelectionExpression')
  final String templateSelectionExpression;

  /// Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and
  /// between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29
  /// seconds for WebSocket APIs and 30 seconds for HTTP APIs.
  @_s.JsonKey(name: 'timeoutInMillis')
  final int timeoutInMillis;

  /// The TLS configuration for a private integration. If you specify a TLS
  /// configuration, private integration traffic uses the HTTPS protocol.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'tlsConfig')
  final TlsConfig tlsConfig;

  Integration({
    this.apiGatewayManaged,
    this.connectionId,
    this.connectionType,
    this.contentHandlingStrategy,
    this.credentialsArn,
    this.description,
    this.integrationId,
    this.integrationMethod,
    this.integrationResponseSelectionExpression,
    this.integrationSubtype,
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.payloadFormatVersion,
    this.requestParameters,
    this.requestTemplates,
    this.responseParameters,
    this.templateSelectionExpression,
    this.timeoutInMillis,
    this.tlsConfig,
  });
  factory Integration.fromJson(Map<String, dynamic> json) =>
      _$IntegrationFromJson(json);
}

/// Represents an integration response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IntegrationResponse {
  /// The integration response key.
  @_s.JsonKey(name: 'integrationResponseKey')
  final String integrationResponseKey;

  /// Supported only for WebSocket APIs. Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT_TO_BINARY and
  /// CONVERT_TO_TEXT, with the following behaviors:
  ///
  /// CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string
  /// to the corresponding binary blob.
  ///
  /// CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed through
  /// from the integration response to the route response or method response
  /// without modification.
  @_s.JsonKey(name: 'contentHandlingStrategy')
  final ContentHandlingStrategy contentHandlingStrategy;

  /// The integration response ID.
  @_s.JsonKey(name: 'integrationResponseId')
  final String integrationResponseId;

  /// A key-value map specifying response parameters that are passed to the method
  /// response from the backend. The key is a method response header parameter
  /// name and the mapped value is an integration response header value, a static
  /// value enclosed within a pair of single quotes, or a JSON expression from the
  /// integration response body. The mapping key must match the pattern of
  /// method.response.header.{name}, where name is a valid and unique header name.
  /// The mapped non-static value must match the pattern of
  /// integration.response.header.{name} or
  /// integration.response.body.{JSON-expression}, where name is a valid and
  /// unique response header name and JSON-expression is a valid JSON expression
  /// without the $ prefix.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, String> responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are represented
  /// as a key/value map, with a content-type as the key and a template as the
  /// value.
  @_s.JsonKey(name: 'responseTemplates')
  final Map<String, String> responseTemplates;

  /// The template selection expressions for the integration response.
  @_s.JsonKey(name: 'templateSelectionExpression')
  final String templateSelectionExpression;

  IntegrationResponse({
    @_s.required this.integrationResponseKey,
    this.contentHandlingStrategy,
    this.integrationResponseId,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });
  factory IntegrationResponse.fromJson(Map<String, dynamic> json) =>
      _$IntegrationResponseFromJson(json);
}

/// Represents an API method integration type.
enum IntegrationType {
  @_s.JsonValue('AWS')
  aws,
  @_s.JsonValue('HTTP')
  http,
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
      case IntegrationType.aws:
        return 'AWS';
      case IntegrationType.http:
        return 'HTTP';
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

/// Represents the configuration of a JWT authorizer. Required for the JWT
/// authorizer type. Supported only for HTTP APIs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JWTConfiguration {
  /// A list of the intended recipients of the JWT. A valid JWT must provide an
  /// aud that matches at least one entry in this list. See <a
  /// href="https://tools.ietf.org/html/rfc7519#section-4.1.3">RFC 7519</a>.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'audience')
  final List<String> audience;

  /// The base domain of the identity provider that issues JSON Web Tokens. For
  /// example, an Amazon Cognito user pool has the following format:
  /// https://cognito-idp.<replaceable>{region}</replaceable>.amazonaws.com/<replaceable>{userPoolId}</replaceable>
  /// . Required for the JWT authorizer type. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'issuer')
  final String issuer;

  JWTConfiguration({
    this.audience,
    this.issuer,
  });
  factory JWTConfiguration.fromJson(Map<String, dynamic> json) =>
      _$JWTConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$JWTConfigurationToJson(this);
}

/// The logging level.
enum LoggingLevel {
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('INFO')
  info,
  @_s.JsonValue('OFF')
  off,
}

/// Represents a data model for an API. Supported only for WebSocket APIs. See
/// <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html">Create
/// Models and Mapping Templates for Request and Response Mappings</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Model {
  /// The name of the model. Must be alphanumeric.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The content-type for the model, for example, "application/json".
  @_s.JsonKey(name: 'contentType')
  final String contentType;

  /// The description of the model.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The model identifier.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  @_s.JsonKey(name: 'schema')
  final String schema;

  Model({
    @_s.required this.name,
    this.contentType,
    this.description,
    this.modelId,
    this.schema,
  });
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MutualTlsAuthentication {
  /// An Amazon S3 URL that specifies the truststore for mutual TLS
  /// authentication, for example,
  /// s3://<replaceable>bucket-name</replaceable>/<replaceable>key-name</replaceable>.
  /// The truststore can contain certificates from public or private certificate
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MutualTlsAuthenticationInput {
  /// An Amazon S3 URL that specifies the truststore for mutual TLS
  /// authentication, for example,
  /// s3://<replaceable>bucket-name</replaceable>/<replaceable>key-name</replaceable>.
  /// The truststore can contain certificates from public or private certificate
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

/// Validation constraints imposed on parameters of a request (path, query
/// string, headers).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ParameterConstraints {
  /// Whether or not the parameter is required.
  @_s.JsonKey(name: 'required')
  final bool required;

  ParameterConstraints({
    this.required,
  });
  factory ParameterConstraints.fromJson(Map<String, dynamic> json) =>
      _$ParameterConstraintsFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterConstraintsToJson(this);
}

/// Represents passthrough behavior for an integration response. Supported only
/// for WebSocket APIs.
enum PassthroughBehavior {
  @_s.JsonValue('WHEN_NO_MATCH')
  whenNoMatch,
  @_s.JsonValue('NEVER')
  never,
  @_s.JsonValue('WHEN_NO_TEMPLATES')
  whenNoTemplates,
}

extension on PassthroughBehavior {
  String toValue() {
    switch (this) {
      case PassthroughBehavior.whenNoMatch:
        return 'WHEN_NO_MATCH';
      case PassthroughBehavior.never:
        return 'NEVER';
      case PassthroughBehavior.whenNoTemplates:
        return 'WHEN_NO_TEMPLATES';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents a protocol type.
enum ProtocolType {
  @_s.JsonValue('WEBSOCKET')
  websocket,
  @_s.JsonValue('HTTP')
  http,
}

extension on ProtocolType {
  String toValue() {
    switch (this) {
      case ProtocolType.websocket:
        return 'WEBSOCKET';
      case ProtocolType.http:
        return 'HTTP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReimportApiResponse {
  /// The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com.
  /// The stage name is typically appended to this URI to form a complete path to
  /// a deployed API stage.
  @_s.JsonKey(name: 'apiEndpoint')
  final String apiEndpoint;

  /// Specifies whether an API is managed by API Gateway. You can't update or
  /// delete a managed API by using API Gateway. A managed API can be deleted only
  /// through the tooling or service that created it.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// The API ID.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  @_s.JsonKey(name: 'apiKeySelectionExpression')
  final String apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'corsConfiguration')
  final Cors corsConfiguration;

  /// The timestamp when the API was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  @_s.JsonKey(name: 'disableExecuteApiEndpoint')
  final bool disableExecuteApiEndpoint;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'disableSchemaValidation')
  final bool disableSchemaValidation;

  /// The validation information during API import. This may include particular
  /// properties of your OpenAPI definition which are ignored during import.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'importInfo')
  final List<String> importInfo;

  /// The name of the API.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The API protocol.
  @_s.JsonKey(name: 'protocolType')
  final ProtocolType protocolType;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  @_s.JsonKey(name: 'routeSelectionExpression')
  final String routeSelectionExpression;

  /// A collection of tags associated with the API.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// A version identifier for the API.
  @_s.JsonKey(name: 'version')
  final String version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  @_s.JsonKey(name: 'warnings')
  final List<String> warnings;

  ReimportApiResponse({
    this.apiEndpoint,
    this.apiGatewayManaged,
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
    this.disableExecuteApiEndpoint,
    this.disableSchemaValidation,
    this.importInfo,
    this.name,
    this.protocolType,
    this.routeSelectionExpression,
    this.tags,
    this.version,
    this.warnings,
  });
  factory ReimportApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ReimportApiResponseFromJson(json);
}

/// Represents a route.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Route {
  /// The route key for the route.
  @_s.JsonKey(name: 'routeKey')
  final String routeKey;

  /// Specifies whether a route is managed by API Gateway. If you created an API
  /// using quick create, the $default route is managed by API Gateway. You can't
  /// modify the $default route key.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// Specifies whether an API key is required for this route. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'apiKeyRequired')
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a JWT authorizer to authorize the method invocation. The authorization
  /// works by matching the route scopes against the scopes parsed from the access
  /// token in the incoming request. The method invocation is authorized if any
  /// route scope matches a claimed scope in the access token. Otherwise, the
  /// invocation is not authorized. When the route scope is configured, the client
  /// must provide an access token instead of an identity token for authorization
  /// purposes.
  @_s.JsonKey(name: 'authorizationScopes')
  final List<String> authorizationScopes;

  /// The authorization type for the route. For WebSocket APIs, valid values are
  /// NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for
  /// using a Lambda authorizer For HTTP APIs, valid values are NONE for open
  /// access, JWT for using JSON Web Tokens, AWS_IAM for using AWS IAM
  /// permissions, and CUSTOM for using a Lambda authorizer.
  @_s.JsonKey(name: 'authorizationType')
  final AuthorizationType authorizationType;

  /// The identifier of the Authorizer resource to be associated with this route.
  /// The authorizer identifier is generated by API Gateway when you created the
  /// authorizer.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// The model selection expression for the route. Supported only for WebSocket
  /// APIs.
  @_s.JsonKey(name: 'modelSelectionExpression')
  final String modelSelectionExpression;

  /// The operation name for the route.
  @_s.JsonKey(name: 'operationName')
  final String operationName;

  /// The request models for the route. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestModels')
  final Map<String, String> requestModels;

  /// The request parameters for the route. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, ParameterConstraints> requestParameters;

  /// The route ID.
  @_s.JsonKey(name: 'routeId')
  final String routeId;

  /// The route response selection expression for the route. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'routeResponseSelectionExpression')
  final String routeResponseSelectionExpression;

  /// The target for the route.
  @_s.JsonKey(name: 'target')
  final String target;

  Route({
    @_s.required this.routeKey,
    this.apiGatewayManaged,
    this.apiKeyRequired,
    this.authorizationScopes,
    this.authorizationType,
    this.authorizerId,
    this.modelSelectionExpression,
    this.operationName,
    this.requestModels,
    this.requestParameters,
    this.routeId,
    this.routeResponseSelectionExpression,
    this.target,
  });
  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}

/// Represents a route response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RouteResponse {
  /// Represents the route response key of a route response.
  @_s.JsonKey(name: 'routeResponseKey')
  final String routeResponseKey;

  /// Represents the model selection expression of a route response. Supported
  /// only for WebSocket APIs.
  @_s.JsonKey(name: 'modelSelectionExpression')
  final String modelSelectionExpression;

  /// Represents the response models of a route response.
  @_s.JsonKey(name: 'responseModels')
  final Map<String, String> responseModels;

  /// Represents the response parameters of a route response.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, ParameterConstraints> responseParameters;

  /// Represents the identifier of a route response.
  @_s.JsonKey(name: 'routeResponseId')
  final String routeResponseId;

  RouteResponse({
    @_s.required this.routeResponseKey,
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseId,
  });
  factory RouteResponse.fromJson(Map<String, dynamic> json) =>
      _$RouteResponseFromJson(json);
}

/// Represents a collection of route settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RouteSettings {
  /// Specifies whether (true) or not (false) data trace logging is enabled for
  /// this route. This property affects the log entries pushed to Amazon
  /// CloudWatch Logs. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'dataTraceEnabled')
  final bool dataTraceEnabled;

  /// Specifies whether detailed metrics are enabled.
  @_s.JsonKey(name: 'detailedMetricsEnabled')
  final bool detailedMetricsEnabled;

  /// Specifies the logging level for this route: INFO, ERROR, or OFF. This
  /// property affects the log entries pushed to Amazon CloudWatch Logs. Supported
  /// only for WebSocket APIs.
  @_s.JsonKey(name: 'loggingLevel')
  final LoggingLevel loggingLevel;

  /// Specifies the throttling burst limit.
  @_s.JsonKey(name: 'throttlingBurstLimit')
  final int throttlingBurstLimit;

  /// Specifies the throttling rate limit.
  @_s.JsonKey(name: 'throttlingRateLimit')
  final double throttlingRateLimit;

  RouteSettings({
    this.dataTraceEnabled,
    this.detailedMetricsEnabled,
    this.loggingLevel,
    this.throttlingBurstLimit,
    this.throttlingRateLimit,
  });
  factory RouteSettings.fromJson(Map<String, dynamic> json) =>
      _$RouteSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$RouteSettingsToJson(this);
}

/// The Transport Layer Security (TLS) version of the security policy for this
/// domain name. The valid values are TLS_1_0 and TLS_1_2.
enum SecurityPolicy {
  @_s.JsonValue('TLS_1_0')
  tls_1_0,
  @_s.JsonValue('TLS_1_2')
  tls_1_2,
}

/// Represents an API stage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Stage {
  /// The name of the stage.
  @_s.JsonKey(name: 'stageName')
  final String stageName;

  /// Settings for logging access in this stage.
  @_s.JsonKey(name: 'accessLogSettings')
  final AccessLogSettings accessLogSettings;

  /// Specifies whether a stage is managed by API Gateway. If you created an API
  /// using quick create, the $default stage is managed by API Gateway. You can't
  /// modify the $default stage.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// Specifies whether updates to an API automatically trigger a new deployment.
  /// The default value is false.
  @_s.JsonKey(name: 'autoDeploy')
  final bool autoDeploy;

  /// The identifier of a client certificate for a Stage. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'clientCertificateId')
  final String clientCertificateId;

  /// The timestamp when the stage was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// Default route settings for the stage.
  @_s.JsonKey(name: 'defaultRouteSettings')
  final RouteSettings defaultRouteSettings;

  /// The identifier of the Deployment that the Stage is associated with. Can't be
  /// updated if autoDeploy is enabled.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The description of the stage.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Describes the status of the last deployment of a stage. Supported only for
  /// stages with autoDeploy enabled.
  @_s.JsonKey(name: 'lastDeploymentStatusMessage')
  final String lastDeploymentStatusMessage;

  /// The timestamp when the stage was last updated.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// Route settings for the stage, by routeKey.
  @_s.JsonKey(name: 'routeSettings')
  final Map<String, RouteSettings> routeSettings;

  /// A map that defines the stage variables for a stage resource. Variable names
  /// can have alphanumeric and underscore characters, and the values must match
  /// [A-Za-z0-9-._~:/?#&amp;=,]+.
  @_s.JsonKey(name: 'stageVariables')
  final Map<String, String> stageVariables;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  Stage({
    @_s.required this.stageName,
    this.accessLogSettings,
    this.apiGatewayManaged,
    this.autoDeploy,
    this.clientCertificateId,
    this.createdDate,
    this.defaultRouteSettings,
    this.deploymentId,
    this.description,
    this.lastDeploymentStatusMessage,
    this.lastUpdatedDate,
    this.routeSettings,
    this.stageVariables,
    this.tags,
  });
  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// The TLS configuration for a private integration. If you specify a TLS
/// configuration, private integration traffic uses the HTTPS protocol.
/// Supported only for HTTP APIs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TlsConfig {
  /// If you specify a server name, API Gateway uses it to verify the hostname on
  /// the integration's certificate. The server name is also included in the TLS
  /// handshake to support Server Name Indication (SNI) or virtual hosting.
  @_s.JsonKey(name: 'serverNameToVerify')
  final String serverNameToVerify;

  TlsConfig({
    this.serverNameToVerify,
  });
  factory TlsConfig.fromJson(Map<String, dynamic> json) =>
      _$TlsConfigFromJson(json);
}

/// The TLS configuration for a private integration. If you specify a TLS
/// configuration, private integration traffic uses the HTTPS protocol.
/// Supported only for HTTP APIs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TlsConfigInput {
  /// If you specify a server name, API Gateway uses it to verify the hostname on
  /// the integration's certificate. The server name is also included in the TLS
  /// handshake to support Server Name Indication (SNI) or virtual hosting.
  @_s.JsonKey(name: 'serverNameToVerify')
  final String serverNameToVerify;

  TlsConfigInput({
    this.serverNameToVerify,
  });
  Map<String, dynamic> toJson() => _$TlsConfigInputToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApiMappingResponse {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// The API mapping identifier.
  @_s.JsonKey(name: 'apiMappingId')
  final String apiMappingId;

  /// The API mapping key.
  @_s.JsonKey(name: 'apiMappingKey')
  final String apiMappingKey;

  /// The API stage.
  @_s.JsonKey(name: 'stage')
  final String stage;

  UpdateApiMappingResponse({
    this.apiId,
    this.apiMappingId,
    this.apiMappingKey,
    this.stage,
  });
  factory UpdateApiMappingResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateApiMappingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApiResponse {
  /// The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com.
  /// The stage name is typically appended to this URI to form a complete path to
  /// a deployed API stage.
  @_s.JsonKey(name: 'apiEndpoint')
  final String apiEndpoint;

  /// Specifies whether an API is managed by API Gateway. You can't update or
  /// delete a managed API by using API Gateway. A managed API can be deleted only
  /// through the tooling or service that created it.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// The API ID.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  @_s.JsonKey(name: 'apiKeySelectionExpression')
  final String apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'corsConfiguration')
  final Cors corsConfiguration;

  /// The timestamp when the API was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  @_s.JsonKey(name: 'disableExecuteApiEndpoint')
  final bool disableExecuteApiEndpoint;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'disableSchemaValidation')
  final bool disableSchemaValidation;

  /// The validation information during API import. This may include particular
  /// properties of your OpenAPI definition which are ignored during import.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'importInfo')
  final List<String> importInfo;

  /// The name of the API.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The API protocol.
  @_s.JsonKey(name: 'protocolType')
  final ProtocolType protocolType;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  @_s.JsonKey(name: 'routeSelectionExpression')
  final String routeSelectionExpression;

  /// A collection of tags associated with the API.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// A version identifier for the API.
  @_s.JsonKey(name: 'version')
  final String version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  @_s.JsonKey(name: 'warnings')
  final List<String> warnings;

  UpdateApiResponse({
    this.apiEndpoint,
    this.apiGatewayManaged,
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
    this.disableExecuteApiEndpoint,
    this.disableSchemaValidation,
    this.importInfo,
    this.name,
    this.protocolType,
    this.routeSelectionExpression,
    this.tags,
    this.version,
    this.warnings,
  });
  factory UpdateApiResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateApiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAuthorizerResponse {
  /// Specifies the required credentials as an IAM role for API Gateway to invoke
  /// the authorizer. To specify an IAM role for API Gateway to assume, use the
  /// role's Amazon Resource Name (ARN). To use resource-based permissions on the
  /// Lambda function, don't specify this parameter. Supported only for REQUEST
  /// authorizers.
  @_s.JsonKey(name: 'authorizerCredentialsArn')
  final String authorizerCredentialsArn;

  /// The authorizer identifier.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// Specifies the format of the payload sent to an HTTP API Lambda authorizer.
  /// Required for HTTP API Lambda authorizers. Supported values are 1.0 and 2.0.
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  @_s.JsonKey(name: 'authorizerPayloadFormatVersion')
  final String authorizerPayloadFormatVersion;

  /// The time to live (TTL) for cached authorizer results, in seconds. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway caches authorizer responses. The maximum value is 3600, or 1 hour.
  /// Supported only for HTTP API Lambda authorizers.
  @_s.JsonKey(name: 'authorizerResultTtlInSeconds')
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. Specify REQUEST for a Lambda function using incoming
  /// request parameters. Specify JWT to use JSON Web Tokens (supported only for
  /// HTTP APIs).
  @_s.JsonKey(name: 'authorizerType')
  final AuthorizerType authorizerType;

  /// The authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers,
  /// this must be a well-formed Lambda function URI, for example,
  /// arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:<replaceable>{account_id}</replaceable>:function:<replaceable>{lambda_function_name}</replaceable>/invocations.
  /// In general, the URI has this form:
  /// arn:aws:apigateway:<replaceable>{region}</replaceable>:lambda:path/<replaceable>{service_api}</replaceable>
  /// , where <replaceable></replaceable>{region} is the same as the region
  /// hosting the Lambda function, path indicates that the remaining substring in
  /// the URI should be treated as the path to the resource, including the initial
  /// /. For Lambda functions, this is usually of the form
  /// /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST
  /// authorizers.
  @_s.JsonKey(name: 'authorizerUri')
  final String authorizerUri;

  /// Specifies whether a Lambda authorizer returns a response in a simple format.
  /// If enabled, the Lambda authorizer can return a boolean value instead of an
  /// IAM policy. Supported only for HTTP APIs. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>
  @_s.JsonKey(name: 'enableSimpleResponses')
  final bool enableSimpleResponses;

  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. The identity
  /// source can be headers, query string parameters, stage variables, and context
  /// parameters. For example, if an Auth header and a Name query string parameter
  /// are defined as identity sources, this value is route.request.header.Auth,
  /// route.request.querystring.Name for WebSocket APIs. For HTTP APIs, use
  /// selection expressions prefixed with $, for example, $request.header.Auth,
  /// $request.querystring.Name. These parameters are used to perform runtime
  /// validation for Lambda-based authorizers by verifying all of the
  /// identity-related request parameters are present in the request, not null,
  /// and non-empty. Only when this is true does the authorizer invoke the
  /// authorizer Lambda function. Otherwise, it returns a 401 Unauthorized
  /// response without calling the Lambda function. For HTTP APIs, identity
  /// sources are also used as the cache key when caching is enabled. To learn
  /// more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT) from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// $request.header.Authorization.
  @_s.JsonKey(name: 'identitySource')
  final List<String> identitySource;

  /// The validation expression does not apply to the REQUEST authorizer.
  @_s.JsonKey(name: 'identityValidationExpression')
  final String identityValidationExpression;

  /// Represents the configuration of a JWT authorizer. Required for the JWT
  /// authorizer type. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'jwtConfiguration')
  final JWTConfiguration jwtConfiguration;

  /// The name of the authorizer.
  @_s.JsonKey(name: 'name')
  final String name;

  UpdateAuthorizerResponse({
    this.authorizerCredentialsArn,
    this.authorizerId,
    this.authorizerPayloadFormatVersion,
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
    this.enableSimpleResponses,
    this.identitySource,
    this.identityValidationExpression,
    this.jwtConfiguration,
    this.name,
  });
  factory UpdateAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAuthorizerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDeploymentResponse {
  /// Specifies whether a deployment was automatically released.
  @_s.JsonKey(name: 'autoDeployed')
  final bool autoDeployed;

  /// The date and time when the Deployment resource was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The identifier for the deployment.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The status of the deployment: PENDING, FAILED, or SUCCEEDED.
  @_s.JsonKey(name: 'deploymentStatus')
  final DeploymentStatus deploymentStatus;

  /// May contain additional feedback on the status of an API deployment.
  @_s.JsonKey(name: 'deploymentStatusMessage')
  final String deploymentStatusMessage;

  /// The description for the deployment.
  @_s.JsonKey(name: 'description')
  final String description;

  UpdateDeploymentResponse({
    this.autoDeployed,
    this.createdDate,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentStatusMessage,
    this.description,
  });
  factory UpdateDeploymentResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeploymentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDomainNameResponse {
  /// The API mapping selection expression.
  @_s.JsonKey(name: 'apiMappingSelectionExpression')
  final String apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The domain name configurations.
  @_s.JsonKey(name: 'domainNameConfigurations')
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The mutual TLS authentication configuration for a custom domain name.
  @_s.JsonKey(name: 'mutualTlsAuthentication')
  final MutualTlsAuthentication mutualTlsAuthentication;

  /// The collection of tags associated with a domain name.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  UpdateDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.mutualTlsAuthentication,
    this.tags,
  });
  factory UpdateDomainNameResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDomainNameResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateIntegrationResult {
  /// Specifies whether an integration is managed by API Gateway. If you created
  /// an API using using quick create, the resulting integration is managed by API
  /// Gateway. You can update a managed integration, but you can't delete it.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// The ID of the VPC link for a private integration. Supported only for HTTP
  /// APIs.
  @_s.JsonKey(name: 'connectionId')
  final String connectionId;

  /// The type of the network connection to the integration endpoint. Specify
  /// INTERNET for connections through the public routable internet or VPC_LINK
  /// for private connections between API Gateway and resources in a VPC. The
  /// default value is INTERNET.
  @_s.JsonKey(name: 'connectionType')
  final ConnectionType connectionType;

  /// Supported only for WebSocket APIs. Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT_TO_BINARY and
  /// CONVERT_TO_TEXT, with the following behaviors:
  ///
  /// CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string
  /// to the corresponding binary blob.
  ///
  /// CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed through
  /// from the integration response to the route response or method response
  /// without modification.
  @_s.JsonKey(name: 'contentHandlingStrategy')
  final ContentHandlingStrategy contentHandlingStrategy;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on supported
  /// AWS services, specify null.
  @_s.JsonKey(name: 'credentialsArn')
  final String credentialsArn;

  /// Represents the description of an integration.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Represents the identifier of an integration.
  @_s.JsonKey(name: 'integrationId')
  final String integrationId;

  /// Specifies the integration's HTTP method type.
  @_s.JsonKey(name: 'integrationMethod')
  final String integrationMethod;

  /// The integration response selection expression for the integration. Supported
  /// only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions">Integration
  /// Response Selection Expressions</a>.
  @_s.JsonKey(name: 'integrationResponseSelectionExpression')
  final String integrationResponseSelectionExpression;

  /// Supported only for HTTP API AWS_PROXY integrations. Specifies the AWS
  /// service action to invoke. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services-reference.html">Integration
  /// subtype reference</a>.
  @_s.JsonKey(name: 'integrationSubtype')
  final String integrationSubtype;

  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service action,
  /// including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with a Lambda
  /// function or other AWS service action. This integration is also referred to
  /// as a Lambda proxy integration.
  ///
  /// HTTP: for integrating the route or method request with an HTTP endpoint.
  /// This integration is also referred to as the HTTP custom integration.
  /// Supported only for WebSocket APIs.
  ///
  /// HTTP_PROXY: for integrating the route or method request with an HTTP
  /// endpoint, with the client request passed through as-is. This is also
  /// referred to as HTTP proxy integration.
  ///
  /// MOCK: for integrating the route or method request with API Gateway as a
  /// "loopback" endpoint without invoking any backend. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'integrationType')
  final IntegrationType integrationType;

  /// For a Lambda integration, specify the URI of a Lambda function.
  ///
  /// For an HTTP integration, specify a fully-qualified URL.
  ///
  /// For an HTTP API private integration, specify the ARN of an Application Load
  /// Balancer listener, Network Load Balancer listener, or AWS Cloud Map service.
  /// If you specify the ARN of an AWS Cloud Map service, API Gateway uses
  /// DiscoverInstances to identify resources. You can use query parameters to
  /// target specific resources. To learn more, see <a
  /// href="https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html">DiscoverInstances</a>.
  /// For private integrations, all resources must be owned by the same AWS
  /// account.
  @_s.JsonKey(name: 'integrationUri')
  final String integrationUri;

  /// Specifies the pass-through behavior for incoming requests based on the
  /// Content-Type header in the request, and the available mapping templates
  /// specified as the requestTemplates property on the Integration resource.
  /// There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
  /// Supported only for WebSocket APIs.
  ///
  /// WHEN_NO_MATCH passes the request body for unmapped content types through to
  /// the integration backend without transformation.
  ///
  /// NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type
  /// response.
  ///
  /// WHEN_NO_TEMPLATES allows pass-through when the integration has no content
  /// types mapped to templates. However, if there is at least one content type
  /// defined, unmapped content types will be rejected with the same HTTP 415
  /// Unsupported Media Type response.
  @_s.JsonKey(name: 'passthroughBehavior')
  final PassthroughBehavior passthroughBehavior;

  /// Specifies the format of the payload sent to an integration. Required for
  /// HTTP APIs.
  @_s.JsonKey(name: 'payloadFormatVersion')
  final String payloadFormatVersion;

  /// For WebSocket APIs, a key-value map specifying request parameters that are
  /// passed from the method request to the backend. The key is an integration
  /// request parameter name and the associated value is a method request
  /// parameter value or static value that must be enclosed within single quotes
  /// and pre-encoded as required by the backend. The method request parameter
  /// value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name.
  ///
  /// For HTTP API integrations with a specified integrationSubtype, request
  /// parameters are a key-value map specifying parameters that are passed to
  /// AWS_PROXY integrations. You can provide static values, or map request data,
  /// stage variables, or context variables that are evaluated at runtime. To
  /// learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services.html">Working
  /// with AWS service integrations for HTTP APIs</a>.
  ///
  /// For HTTP API itegrations, without a specified integrationSubtype request
  /// parameters are a key-value map specifying how to transform HTTP requests
  /// before sending them to backend integrations. The key should follow the
  /// pattern &lt;action&gt;:&lt;header|querystring|path&gt;.&lt;location&gt;. The
  /// action can be append, overwrite or remove. For values, you can provide
  /// static values, or map request data, stage variables, or context variables
  /// that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestTemplates')
  final Map<String, String> requestTemplates;

  /// Supported only for HTTP APIs. You use response parameters to transform the
  /// HTTP response from a backend integration before returning the response to
  /// clients. Specify a key-value map from a selection key to response
  /// parameters. The selection key must be a valid HTTP status code within the
  /// range of 200-599. Response parameters are a key-value map. The key must
  /// match pattern &lt;action&gt;:&lt;header&gt;.&lt;location&gt; or
  /// overwrite.statuscode. The action can be append, overwrite or remove. The
  /// value can be a static value, or map to response data, stage variables, or
  /// context variables that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, Map<String, String>> responseParameters;

  /// The template selection expression for the integration. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'templateSelectionExpression')
  final String templateSelectionExpression;

  /// Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and
  /// between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29
  /// seconds for WebSocket APIs and 30 seconds for HTTP APIs.
  @_s.JsonKey(name: 'timeoutInMillis')
  final int timeoutInMillis;

  /// The TLS configuration for a private integration. If you specify a TLS
  /// configuration, private integration traffic uses the HTTPS protocol.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'tlsConfig')
  final TlsConfig tlsConfig;

  UpdateIntegrationResult({
    this.apiGatewayManaged,
    this.connectionId,
    this.connectionType,
    this.contentHandlingStrategy,
    this.credentialsArn,
    this.description,
    this.integrationId,
    this.integrationMethod,
    this.integrationResponseSelectionExpression,
    this.integrationSubtype,
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.payloadFormatVersion,
    this.requestParameters,
    this.requestTemplates,
    this.responseParameters,
    this.templateSelectionExpression,
    this.timeoutInMillis,
    this.tlsConfig,
  });
  factory UpdateIntegrationResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateIntegrationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateIntegrationResponseResponse {
  /// Supported only for WebSocket APIs. Specifies how to handle response payload
  /// content type conversions. Supported values are CONVERT_TO_BINARY and
  /// CONVERT_TO_TEXT, with the following behaviors:
  ///
  /// CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string
  /// to the corresponding binary blob.
  ///
  /// CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
  /// Base64-encoded string.
  ///
  /// If this property is not defined, the response payload will be passed through
  /// from the integration response to the route response or method response
  /// without modification.
  @_s.JsonKey(name: 'contentHandlingStrategy')
  final ContentHandlingStrategy contentHandlingStrategy;

  /// The integration response ID.
  @_s.JsonKey(name: 'integrationResponseId')
  final String integrationResponseId;

  /// The integration response key.
  @_s.JsonKey(name: 'integrationResponseKey')
  final String integrationResponseKey;

  /// A key-value map specifying response parameters that are passed to the method
  /// response from the backend. The key is a method response header parameter
  /// name and the mapped value is an integration response header value, a static
  /// value enclosed within a pair of single quotes, or a JSON expression from the
  /// integration response body. The mapping key must match the pattern of
  /// method.response.header.{name}, where name is a valid and unique header name.
  /// The mapped non-static value must match the pattern of
  /// integration.response.header.{name} or
  /// integration.response.body.{JSON-expression}, where name is a valid and
  /// unique response header name and JSON-expression is a valid JSON expression
  /// without the $ prefix.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, String> responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are represented
  /// as a key/value map, with a content-type as the key and a template as the
  /// value.
  @_s.JsonKey(name: 'responseTemplates')
  final Map<String, String> responseTemplates;

  /// The template selection expressions for the integration response.
  @_s.JsonKey(name: 'templateSelectionExpression')
  final String templateSelectionExpression;

  UpdateIntegrationResponseResponse({
    this.contentHandlingStrategy,
    this.integrationResponseId,
    this.integrationResponseKey,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });
  factory UpdateIntegrationResponseResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateIntegrationResponseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateModelResponse {
  /// The content-type for the model, for example, "application/json".
  @_s.JsonKey(name: 'contentType')
  final String contentType;

  /// The description of the model.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The model identifier.
  @_s.JsonKey(name: 'modelId')
  final String modelId;

  /// The name of the model. Must be alphanumeric.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  @_s.JsonKey(name: 'schema')
  final String schema;

  UpdateModelResponse({
    this.contentType,
    this.description,
    this.modelId,
    this.name,
    this.schema,
  });
  factory UpdateModelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateModelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRouteResult {
  /// Specifies whether a route is managed by API Gateway. If you created an API
  /// using quick create, the $default route is managed by API Gateway. You can't
  /// modify the $default route key.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// Specifies whether an API key is required for this route. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'apiKeyRequired')
  final bool apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a JWT authorizer to authorize the method invocation. The authorization
  /// works by matching the route scopes against the scopes parsed from the access
  /// token in the incoming request. The method invocation is authorized if any
  /// route scope matches a claimed scope in the access token. Otherwise, the
  /// invocation is not authorized. When the route scope is configured, the client
  /// must provide an access token instead of an identity token for authorization
  /// purposes.
  @_s.JsonKey(name: 'authorizationScopes')
  final List<String> authorizationScopes;

  /// The authorization type for the route. For WebSocket APIs, valid values are
  /// NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for
  /// using a Lambda authorizer For HTTP APIs, valid values are NONE for open
  /// access, JWT for using JSON Web Tokens, AWS_IAM for using AWS IAM
  /// permissions, and CUSTOM for using a Lambda authorizer.
  @_s.JsonKey(name: 'authorizationType')
  final AuthorizationType authorizationType;

  /// The identifier of the Authorizer resource to be associated with this route.
  /// The authorizer identifier is generated by API Gateway when you created the
  /// authorizer.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// The model selection expression for the route. Supported only for WebSocket
  /// APIs.
  @_s.JsonKey(name: 'modelSelectionExpression')
  final String modelSelectionExpression;

  /// The operation name for the route.
  @_s.JsonKey(name: 'operationName')
  final String operationName;

  /// The request models for the route. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestModels')
  final Map<String, String> requestModels;

  /// The request parameters for the route. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, ParameterConstraints> requestParameters;

  /// The route ID.
  @_s.JsonKey(name: 'routeId')
  final String routeId;

  /// The route key for the route.
  @_s.JsonKey(name: 'routeKey')
  final String routeKey;

  /// The route response selection expression for the route. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'routeResponseSelectionExpression')
  final String routeResponseSelectionExpression;

  /// The target for the route.
  @_s.JsonKey(name: 'target')
  final String target;

  UpdateRouteResult({
    this.apiGatewayManaged,
    this.apiKeyRequired,
    this.authorizationScopes,
    this.authorizationType,
    this.authorizerId,
    this.modelSelectionExpression,
    this.operationName,
    this.requestModels,
    this.requestParameters,
    this.routeId,
    this.routeKey,
    this.routeResponseSelectionExpression,
    this.target,
  });
  factory UpdateRouteResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateRouteResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRouteResponseResponse {
  /// Represents the model selection expression of a route response. Supported
  /// only for WebSocket APIs.
  @_s.JsonKey(name: 'modelSelectionExpression')
  final String modelSelectionExpression;

  /// Represents the response models of a route response.
  @_s.JsonKey(name: 'responseModels')
  final Map<String, String> responseModels;

  /// Represents the response parameters of a route response.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, ParameterConstraints> responseParameters;

  /// Represents the identifier of a route response.
  @_s.JsonKey(name: 'routeResponseId')
  final String routeResponseId;

  /// Represents the route response key of a route response.
  @_s.JsonKey(name: 'routeResponseKey')
  final String routeResponseKey;

  UpdateRouteResponseResponse({
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseId,
    this.routeResponseKey,
  });
  factory UpdateRouteResponseResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRouteResponseResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateStageResponse {
  /// Settings for logging access in this stage.
  @_s.JsonKey(name: 'accessLogSettings')
  final AccessLogSettings accessLogSettings;

  /// Specifies whether a stage is managed by API Gateway. If you created an API
  /// using quick create, the $default stage is managed by API Gateway. You can't
  /// modify the $default stage.
  @_s.JsonKey(name: 'apiGatewayManaged')
  final bool apiGatewayManaged;

  /// Specifies whether updates to an API automatically trigger a new deployment.
  /// The default value is false.
  @_s.JsonKey(name: 'autoDeploy')
  final bool autoDeploy;

  /// The identifier of a client certificate for a Stage. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'clientCertificateId')
  final String clientCertificateId;

  /// The timestamp when the stage was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// Default route settings for the stage.
  @_s.JsonKey(name: 'defaultRouteSettings')
  final RouteSettings defaultRouteSettings;

  /// The identifier of the Deployment that the Stage is associated with. Can't be
  /// updated if autoDeploy is enabled.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The description of the stage.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Describes the status of the last deployment of a stage. Supported only for
  /// stages with autoDeploy enabled.
  @_s.JsonKey(name: 'lastDeploymentStatusMessage')
  final String lastDeploymentStatusMessage;

  /// The timestamp when the stage was last updated.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDate')
  final DateTime lastUpdatedDate;

  /// Route settings for the stage, by routeKey.
  @_s.JsonKey(name: 'routeSettings')
  final Map<String, RouteSettings> routeSettings;

  /// The name of the stage.
  @_s.JsonKey(name: 'stageName')
  final String stageName;

  /// A map that defines the stage variables for a stage resource. Variable names
  /// can have alphanumeric and underscore characters, and the values must match
  /// [A-Za-z0-9-._~:/?#&amp;=,]+.
  @_s.JsonKey(name: 'stageVariables')
  final Map<String, String> stageVariables;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  UpdateStageResponse({
    this.accessLogSettings,
    this.apiGatewayManaged,
    this.autoDeploy,
    this.clientCertificateId,
    this.createdDate,
    this.defaultRouteSettings,
    this.deploymentId,
    this.description,
    this.lastDeploymentStatusMessage,
    this.lastUpdatedDate,
    this.routeSettings,
    this.stageName,
    this.stageVariables,
    this.tags,
  });
  factory UpdateStageResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateStageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVpcLinkResponse {
  /// The timestamp when the VPC link was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// The name of the VPC link.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of security group IDs for the VPC link.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// A list of subnet IDs to include in the VPC link.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  /// Tags for the VPC link.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The ID of the VPC link.
  @_s.JsonKey(name: 'vpcLinkId')
  final String vpcLinkId;

  /// The status of the VPC link.
  @_s.JsonKey(name: 'vpcLinkStatus')
  final VpcLinkStatus vpcLinkStatus;

  /// A message summarizing the cause of the status of the VPC link.
  @_s.JsonKey(name: 'vpcLinkStatusMessage')
  final String vpcLinkStatusMessage;

  /// The version of the VPC link.
  @_s.JsonKey(name: 'vpcLinkVersion')
  final VpcLinkVersion vpcLinkVersion;

  UpdateVpcLinkResponse({
    this.createdDate,
    this.name,
    this.securityGroupIds,
    this.subnetIds,
    this.tags,
    this.vpcLinkId,
    this.vpcLinkStatus,
    this.vpcLinkStatusMessage,
    this.vpcLinkVersion,
  });
  factory UpdateVpcLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateVpcLinkResponseFromJson(json);
}

/// Represents a VPC link.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcLink {
  /// The name of the VPC link.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of security group IDs for the VPC link.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// A list of subnet IDs to include in the VPC link.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  /// The ID of the VPC link.
  @_s.JsonKey(name: 'vpcLinkId')
  final String vpcLinkId;

  /// The timestamp when the VPC link was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdDate')
  final DateTime createdDate;

  /// Tags for the VPC link.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The status of the VPC link.
  @_s.JsonKey(name: 'vpcLinkStatus')
  final VpcLinkStatus vpcLinkStatus;

  /// A message summarizing the cause of the status of the VPC link.
  @_s.JsonKey(name: 'vpcLinkStatusMessage')
  final String vpcLinkStatusMessage;

  /// The version of the VPC link.
  @_s.JsonKey(name: 'vpcLinkVersion')
  final VpcLinkVersion vpcLinkVersion;

  VpcLink({
    @_s.required this.name,
    @_s.required this.securityGroupIds,
    @_s.required this.subnetIds,
    @_s.required this.vpcLinkId,
    this.createdDate,
    this.tags,
    this.vpcLinkStatus,
    this.vpcLinkStatusMessage,
    this.vpcLinkVersion,
  });
  factory VpcLink.fromJson(Map<String, dynamic> json) =>
      _$VpcLinkFromJson(json);
}

/// The status of the VPC link.
enum VpcLinkStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('INACTIVE')
  inactive,
}

/// The version of the VPC link.
enum VpcLinkVersion {
  @_s.JsonValue('V2')
  v2,
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
