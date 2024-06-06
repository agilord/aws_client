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

/// Amazon API Gateway V2
class ApiGatewayV2 {
  final _s.RestJsonProtocol _protocol;
  ApiGatewayV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'apigateway',
            signingName: 'apigateway',
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
    required String name,
    required ProtocolType protocolType,
    String? apiKeySelectionExpression,
    Cors? corsConfiguration,
    String? credentialsArn,
    String? description,
    bool? disableExecuteApiEndpoint,
    bool? disableSchemaValidation,
    String? routeKey,
    String? routeSelectionExpression,
    Map<String, String>? tags,
    String? target,
    String? version,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'protocolType': protocolType.toValue(),
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
    required String apiId,
    required String domainName,
    required String stage,
    String? apiMappingKey,
  }) async {
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
    required String apiId,
    required AuthorizerType authorizerType,
    required List<String> identitySource,
    required String name,
    String? authorizerCredentialsArn,
    String? authorizerPayloadFormatVersion,
    int? authorizerResultTtlInSeconds,
    String? authorizerUri,
    bool? enableSimpleResponses,
    String? identityValidationExpression,
    JWTConfiguration? jwtConfiguration,
  }) async {
    _s.validateNumRange(
      'authorizerResultTtlInSeconds',
      authorizerResultTtlInSeconds,
      0,
      3600,
    );
    final $payload = <String, dynamic>{
      'authorizerType': authorizerType.toValue(),
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
    required String apiId,
    String? description,
    String? stageName,
  }) async {
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
    required String domainName,
    List<DomainNameConfiguration>? domainNameConfigurations,
    MutualTlsAuthenticationInput? mutualTlsAuthentication,
    Map<String, String>? tags,
  }) async {
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
    required String apiId,
    required IntegrationType integrationType,
    String? connectionId,
    ConnectionType? connectionType,
    ContentHandlingStrategy? contentHandlingStrategy,
    String? credentialsArn,
    String? description,
    String? integrationMethod,
    String? integrationSubtype,
    String? integrationUri,
    PassthroughBehavior? passthroughBehavior,
    String? payloadFormatVersion,
    Map<String, String>? requestParameters,
    Map<String, String>? requestTemplates,
    Map<String, Map<String, String>>? responseParameters,
    String? templateSelectionExpression,
    int? timeoutInMillis,
    TlsConfigInput? tlsConfig,
  }) async {
    _s.validateNumRange(
      'timeoutInMillis',
      timeoutInMillis,
      50,
      30000,
    );
    final $payload = <String, dynamic>{
      'integrationType': integrationType.toValue(),
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
    required String apiId,
    required String integrationId,
    required String integrationResponseKey,
    ContentHandlingStrategy? contentHandlingStrategy,
    Map<String, String>? responseParameters,
    Map<String, String>? responseTemplates,
    String? templateSelectionExpression,
  }) async {
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
    required String apiId,
    required String name,
    required String schema,
    String? contentType,
    String? description,
  }) async {
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
    required String apiId,
    required String routeKey,
    bool? apiKeyRequired,
    List<String>? authorizationScopes,
    AuthorizationType? authorizationType,
    String? authorizerId,
    String? modelSelectionExpression,
    String? operationName,
    Map<String, String>? requestModels,
    Map<String, ParameterConstraints>? requestParameters,
    String? routeResponseSelectionExpression,
    String? target,
  }) async {
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
    required String apiId,
    required String routeId,
    required String routeResponseKey,
    String? modelSelectionExpression,
    Map<String, String>? responseModels,
    Map<String, ParameterConstraints>? responseParameters,
  }) async {
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
    required String apiId,
    required String stageName,
    AccessLogSettings? accessLogSettings,
    bool? autoDeploy,
    String? clientCertificateId,
    RouteSettings? defaultRouteSettings,
    String? deploymentId,
    String? description,
    Map<String, RouteSettings>? routeSettings,
    Map<String, String>? stageVariables,
    Map<String, String>? tags,
  }) async {
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
    required String name,
    required List<String> subnetIds,
    List<String>? securityGroupIds,
    Map<String, String>? tags,
  }) async {
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
    required String apiId,
    required String stageName,
  }) async {
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
    required String apiId,
  }) async {
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
    required String apiMappingId,
    required String domainName,
  }) async {
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
    required String apiId,
    required String authorizerId,
  }) async {
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
    required String apiId,
  }) async {
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
    required String apiId,
    required String deploymentId,
  }) async {
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
    required String domainName,
  }) async {
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
    required String apiId,
    required String integrationId,
  }) async {
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
    required String apiId,
    required String integrationId,
    required String integrationResponseId,
  }) async {
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
    required String apiId,
    required String modelId,
  }) async {
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
    required String apiId,
    required String routeId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId)}/routes/${Uri.encodeComponent(routeId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a route request parameter. Supported only for WebSocket APIs.
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
    required String apiId,
    required String requestParameterKey,
    required String routeId,
  }) async {
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
    required String apiId,
    required String routeId,
    required String routeResponseId,
  }) async {
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
    required String apiId,
    required String routeKey,
    required String stageName,
  }) async {
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
    required String apiId,
    required String stageName,
  }) async {
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
    required String vpcLinkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/vpclinks/${Uri.encodeComponent(vpcLinkId)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String apiId,
    required String outputType,
    required String specification,
    String? exportVersion,
    bool? includeExtensions,
    String? stageName,
  }) async {
    final $query = <String, List<String>>{
      'outputType': [outputType],
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
    required String apiId,
    required String stageName,
  }) async {
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
    required String apiId,
  }) async {
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
    required String apiMappingId,
    required String domainName,
  }) async {
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
    required String domainName,
    String? maxResults,
    String? nextToken,
  }) async {
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
    String? maxResults,
    String? nextToken,
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
    required String apiId,
    required String authorizerId,
  }) async {
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
    required String apiId,
    String? maxResults,
    String? nextToken,
  }) async {
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
    required String apiId,
    required String deploymentId,
  }) async {
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
    required String apiId,
    String? maxResults,
    String? nextToken,
  }) async {
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
    required String domainName,
  }) async {
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
    String? maxResults,
    String? nextToken,
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
    required String apiId,
    required String integrationId,
  }) async {
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
    required String apiId,
    required String integrationId,
    required String integrationResponseId,
  }) async {
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
    required String apiId,
    required String integrationId,
    String? maxResults,
    String? nextToken,
  }) async {
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
    required String apiId,
    String? maxResults,
    String? nextToken,
  }) async {
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
    required String apiId,
    required String modelId,
  }) async {
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
    required String apiId,
    required String modelId,
  }) async {
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
    required String apiId,
    String? maxResults,
    String? nextToken,
  }) async {
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
    required String apiId,
    required String routeId,
  }) async {
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
    required String apiId,
    required String routeId,
    required String routeResponseId,
  }) async {
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
    required String apiId,
    required String routeId,
    String? maxResults,
    String? nextToken,
  }) async {
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
    required String apiId,
    String? maxResults,
    String? nextToken,
  }) async {
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
    required String apiId,
    required String stageName,
  }) async {
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
    required String apiId,
    String? maxResults,
    String? nextToken,
  }) async {
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
    required String resourceArn,
  }) async {
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
    required String vpcLinkId,
  }) async {
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
    String? maxResults,
    String? nextToken,
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
    required String body,
    String? basepath,
    bool? failOnWarnings,
  }) async {
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
    required String apiId,
    required String body,
    String? basepath,
    bool? failOnWarnings,
  }) async {
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
    required String resourceArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
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
    required String apiId,
    String? apiKeySelectionExpression,
    Cors? corsConfiguration,
    String? credentialsArn,
    String? description,
    bool? disableExecuteApiEndpoint,
    bool? disableSchemaValidation,
    String? name,
    String? routeKey,
    String? routeSelectionExpression,
    String? target,
    String? version,
  }) async {
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
    required String apiId,
    required String apiMappingId,
    required String domainName,
    String? apiMappingKey,
    String? stage,
  }) async {
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
    required String apiId,
    required String authorizerId,
    String? authorizerCredentialsArn,
    String? authorizerPayloadFormatVersion,
    int? authorizerResultTtlInSeconds,
    AuthorizerType? authorizerType,
    String? authorizerUri,
    bool? enableSimpleResponses,
    List<String>? identitySource,
    String? identityValidationExpression,
    JWTConfiguration? jwtConfiguration,
    String? name,
  }) async {
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
    required String apiId,
    required String deploymentId,
    String? description,
  }) async {
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
    required String domainName,
    List<DomainNameConfiguration>? domainNameConfigurations,
    MutualTlsAuthenticationInput? mutualTlsAuthentication,
  }) async {
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
  Future<UpdateIntegrationResult> updateIntegration({
    required String apiId,
    required String integrationId,
    String? connectionId,
    ConnectionType? connectionType,
    ContentHandlingStrategy? contentHandlingStrategy,
    String? credentialsArn,
    String? description,
    String? integrationMethod,
    String? integrationSubtype,
    IntegrationType? integrationType,
    String? integrationUri,
    PassthroughBehavior? passthroughBehavior,
    String? payloadFormatVersion,
    Map<String, String>? requestParameters,
    Map<String, String>? requestTemplates,
    Map<String, Map<String, String>>? responseParameters,
    String? templateSelectionExpression,
    int? timeoutInMillis,
    TlsConfigInput? tlsConfig,
  }) async {
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
    required String apiId,
    required String integrationId,
    required String integrationResponseId,
    ContentHandlingStrategy? contentHandlingStrategy,
    String? integrationResponseKey,
    Map<String, String>? responseParameters,
    Map<String, String>? responseTemplates,
    String? templateSelectionExpression,
  }) async {
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
    required String apiId,
    required String modelId,
    String? contentType,
    String? description,
    String? name,
    String? schema,
  }) async {
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
    required String apiId,
    required String routeId,
    bool? apiKeyRequired,
    List<String>? authorizationScopes,
    AuthorizationType? authorizationType,
    String? authorizerId,
    String? modelSelectionExpression,
    String? operationName,
    Map<String, String>? requestModels,
    Map<String, ParameterConstraints>? requestParameters,
    String? routeKey,
    String? routeResponseSelectionExpression,
    String? target,
  }) async {
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
    required String apiId,
    required String routeId,
    required String routeResponseId,
    String? modelSelectionExpression,
    Map<String, String>? responseModels,
    Map<String, ParameterConstraints>? responseParameters,
    String? routeResponseKey,
  }) async {
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
    required String apiId,
    required String stageName,
    AccessLogSettings? accessLogSettings,
    bool? autoDeploy,
    String? clientCertificateId,
    RouteSettings? defaultRouteSettings,
    String? deploymentId,
    String? description,
    Map<String, RouteSettings>? routeSettings,
    Map<String, String>? stageVariables,
  }) async {
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
    required String vpcLinkId,
    String? name,
  }) async {
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
class AccessLogSettings {
  /// The ARN of the CloudWatch Logs log group to receive access logs.
  final String? destinationArn;

  /// A single line format of the access logs of data, as specified by selected
  /// $context variables. The format must include at least $context.requestId.
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

  Map<String, dynamic> toJson() {
    final destinationArn = this.destinationArn;
    final format = this.format;
    return {
      if (destinationArn != null) 'destinationArn': destinationArn,
      if (format != null) 'format': format,
    };
  }
}

/// Represents an API.
class Api {
  /// The name of the API.
  final String name;

  /// The API protocol.
  final ProtocolType protocolType;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  final String routeSelectionExpression;

  /// The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com.
  /// The stage name is typically appended to this URI to form a complete path to
  /// a deployed API stage.
  final String? apiEndpoint;

  /// Specifies whether an API is managed by API Gateway. You can't update or
  /// delete a managed API by using API Gateway. A managed API can be deleted only
  /// through the tooling or service that created it.
  final bool? apiGatewayManaged;

  /// The API ID.
  final String? apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  final String? apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  final Cors? corsConfiguration;

  /// The timestamp when the API was created.
  final DateTime? createdDate;

  /// The description of the API.
  final String? description;

  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  final bool? disableExecuteApiEndpoint;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  final bool? disableSchemaValidation;

  /// The validation information during API import. This may include particular
  /// properties of your OpenAPI definition which are ignored during import.
  /// Supported only for HTTP APIs.
  final List<String>? importInfo;

  /// A collection of tags associated with the API.
  final Map<String, String>? tags;

  /// A version identifier for the API.
  final String? version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  final List<String>? warnings;

  Api({
    required this.name,
    required this.protocolType,
    required this.routeSelectionExpression,
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

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      name: json['name'] as String,
      protocolType: (json['protocolType'] as String).toProtocolType(),
      routeSelectionExpression: json['routeSelectionExpression'] as String,
      apiEndpoint: json['apiEndpoint'] as String?,
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      apiId: json['apiId'] as String?,
      apiKeySelectionExpression: json['apiKeySelectionExpression'] as String?,
      corsConfiguration: json['corsConfiguration'] != null
          ? Cors.fromJson(json['corsConfiguration'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool?,
      disableSchemaValidation: json['disableSchemaValidation'] as bool?,
      importInfo: (json['importInfo'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final protocolType = this.protocolType;
    final routeSelectionExpression = this.routeSelectionExpression;
    final apiEndpoint = this.apiEndpoint;
    final apiGatewayManaged = this.apiGatewayManaged;
    final apiId = this.apiId;
    final apiKeySelectionExpression = this.apiKeySelectionExpression;
    final corsConfiguration = this.corsConfiguration;
    final createdDate = this.createdDate;
    final description = this.description;
    final disableExecuteApiEndpoint = this.disableExecuteApiEndpoint;
    final disableSchemaValidation = this.disableSchemaValidation;
    final importInfo = this.importInfo;
    final tags = this.tags;
    final version = this.version;
    final warnings = this.warnings;
    return {
      'name': name,
      'protocolType': protocolType.toValue(),
      'routeSelectionExpression': routeSelectionExpression,
      if (apiEndpoint != null) 'apiEndpoint': apiEndpoint,
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (apiId != null) 'apiId': apiId,
      if (apiKeySelectionExpression != null)
        'apiKeySelectionExpression': apiKeySelectionExpression,
      if (corsConfiguration != null) 'corsConfiguration': corsConfiguration,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (description != null) 'description': description,
      if (disableExecuteApiEndpoint != null)
        'disableExecuteApiEndpoint': disableExecuteApiEndpoint,
      if (disableSchemaValidation != null)
        'disableSchemaValidation': disableSchemaValidation,
      if (importInfo != null) 'importInfo': importInfo,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

/// Represents an API mapping.
class ApiMapping {
  /// The API identifier.
  final String apiId;

  /// The API stage.
  final String stage;

  /// The API mapping identifier.
  final String? apiMappingId;

  /// The API mapping key.
  final String? apiMappingKey;

  ApiMapping({
    required this.apiId,
    required this.stage,
    this.apiMappingId,
    this.apiMappingKey,
  });

  factory ApiMapping.fromJson(Map<String, dynamic> json) {
    return ApiMapping(
      apiId: json['apiId'] as String,
      stage: json['stage'] as String,
      apiMappingId: json['apiMappingId'] as String?,
      apiMappingKey: json['apiMappingKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiId = this.apiId;
    final stage = this.stage;
    final apiMappingId = this.apiMappingId;
    final apiMappingKey = this.apiMappingKey;
    return {
      'apiId': apiId,
      'stage': stage,
      if (apiMappingId != null) 'apiMappingId': apiMappingId,
      if (apiMappingKey != null) 'apiMappingKey': apiMappingKey,
    };
  }
}

/// The authorization type. For WebSocket APIs, valid values are NONE for open
/// access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda
/// authorizer. For HTTP APIs, valid values are NONE for open access, JWT for
/// using JSON Web Tokens, AWS_IAM for using AWS IAM permissions, and CUSTOM for
/// using a Lambda authorizer.
enum AuthorizationType {
  none,
  awsIam,
  custom,
  jwt,
}

extension AuthorizationTypeValueExtension on AuthorizationType {
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
  }
}

extension AuthorizationTypeFromString on String {
  AuthorizationType toAuthorizationType() {
    switch (this) {
      case 'NONE':
        return AuthorizationType.none;
      case 'AWS_IAM':
        return AuthorizationType.awsIam;
      case 'CUSTOM':
        return AuthorizationType.custom;
      case 'JWT':
        return AuthorizationType.jwt;
    }
    throw Exception('$this is not known in enum AuthorizationType');
  }
}

/// Represents an authorizer.
class Authorizer {
  /// The name of the authorizer.
  final String name;

  /// Specifies the required credentials as an IAM role for API Gateway to invoke
  /// the authorizer. To specify an IAM role for API Gateway to assume, use the
  /// role's Amazon Resource Name (ARN). To use resource-based permissions on the
  /// Lambda function, don't specify this parameter. Supported only for REQUEST
  /// authorizers.
  final String? authorizerCredentialsArn;

  /// The authorizer identifier.
  final String? authorizerId;

  /// Specifies the format of the payload sent to an HTTP API Lambda authorizer.
  /// Required for HTTP API Lambda authorizers. Supported values are 1.0 and 2.0.
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  final String? authorizerPayloadFormatVersion;

  /// The time to live (TTL) for cached authorizer results, in seconds. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway caches authorizer responses. The maximum value is 3600, or 1 hour.
  /// Supported only for HTTP API Lambda authorizers.
  final int? authorizerResultTtlInSeconds;

  /// The authorizer type. Specify REQUEST for a Lambda function using incoming
  /// request parameters. Specify JWT to use JSON Web Tokens (supported only for
  /// HTTP APIs).
  final AuthorizerType? authorizerType;

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
  final String? authorizerUri;

  /// Specifies whether a Lambda authorizer returns a response in a simple format.
  /// If enabled, the Lambda authorizer can return a boolean value instead of an
  /// IAM policy. Supported only for HTTP APIs. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>
  final bool? enableSimpleResponses;

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
  final List<String>? identitySource;

  /// The validation expression does not apply to the REQUEST authorizer.
  final String? identityValidationExpression;

  /// Represents the configuration of a JWT authorizer. Required for the JWT
  /// authorizer type. Supported only for HTTP APIs.
  final JWTConfiguration? jwtConfiguration;

  Authorizer({
    required this.name,
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

  factory Authorizer.fromJson(Map<String, dynamic> json) {
    return Authorizer(
      name: json['name'] as String,
      authorizerCredentialsArn: json['authorizerCredentialsArn'] as String?,
      authorizerId: json['authorizerId'] as String?,
      authorizerPayloadFormatVersion:
          json['authorizerPayloadFormatVersion'] as String?,
      authorizerResultTtlInSeconds:
          json['authorizerResultTtlInSeconds'] as int?,
      authorizerType: (json['authorizerType'] as String?)?.toAuthorizerType(),
      authorizerUri: json['authorizerUri'] as String?,
      enableSimpleResponses: json['enableSimpleResponses'] as bool?,
      identitySource: (json['identitySource'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      identityValidationExpression:
          json['identityValidationExpression'] as String?,
      jwtConfiguration: json['jwtConfiguration'] != null
          ? JWTConfiguration.fromJson(
              json['jwtConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final authorizerCredentialsArn = this.authorizerCredentialsArn;
    final authorizerId = this.authorizerId;
    final authorizerPayloadFormatVersion = this.authorizerPayloadFormatVersion;
    final authorizerResultTtlInSeconds = this.authorizerResultTtlInSeconds;
    final authorizerType = this.authorizerType;
    final authorizerUri = this.authorizerUri;
    final enableSimpleResponses = this.enableSimpleResponses;
    final identitySource = this.identitySource;
    final identityValidationExpression = this.identityValidationExpression;
    final jwtConfiguration = this.jwtConfiguration;
    return {
      'name': name,
      if (authorizerCredentialsArn != null)
        'authorizerCredentialsArn': authorizerCredentialsArn,
      if (authorizerId != null) 'authorizerId': authorizerId,
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
    };
  }
}

/// The authorizer type. Specify REQUEST for a Lambda function using incoming
/// request parameters. Specify JWT to use JSON Web Tokens (supported only for
/// HTTP APIs).
enum AuthorizerType {
  request,
  jwt,
}

extension AuthorizerTypeValueExtension on AuthorizerType {
  String toValue() {
    switch (this) {
      case AuthorizerType.request:
        return 'REQUEST';
      case AuthorizerType.jwt:
        return 'JWT';
    }
  }
}

extension AuthorizerTypeFromString on String {
  AuthorizerType toAuthorizerType() {
    switch (this) {
      case 'REQUEST':
        return AuthorizerType.request;
      case 'JWT':
        return AuthorizerType.jwt;
    }
    throw Exception('$this is not known in enum AuthorizerType');
  }
}

/// Represents a connection type.
enum ConnectionType {
  internet,
  vpcLink,
}

extension ConnectionTypeValueExtension on ConnectionType {
  String toValue() {
    switch (this) {
      case ConnectionType.internet:
        return 'INTERNET';
      case ConnectionType.vpcLink:
        return 'VPC_LINK';
    }
  }
}

extension ConnectionTypeFromString on String {
  ConnectionType toConnectionType() {
    switch (this) {
      case 'INTERNET':
        return ConnectionType.internet;
      case 'VPC_LINK':
        return ConnectionType.vpcLink;
    }
    throw Exception('$this is not known in enum ConnectionType');
  }
}

/// Specifies how to handle response payload content type conversions. Supported
/// only for WebSocket APIs.
enum ContentHandlingStrategy {
  convertToBinary,
  convertToText,
}

extension ContentHandlingStrategyValueExtension on ContentHandlingStrategy {
  String toValue() {
    switch (this) {
      case ContentHandlingStrategy.convertToBinary:
        return 'CONVERT_TO_BINARY';
      case ContentHandlingStrategy.convertToText:
        return 'CONVERT_TO_TEXT';
    }
  }
}

extension ContentHandlingStrategyFromString on String {
  ContentHandlingStrategy toContentHandlingStrategy() {
    switch (this) {
      case 'CONVERT_TO_BINARY':
        return ContentHandlingStrategy.convertToBinary;
      case 'CONVERT_TO_TEXT':
        return ContentHandlingStrategy.convertToText;
    }
    throw Exception('$this is not known in enum ContentHandlingStrategy');
  }
}

/// Represents a CORS configuration. Supported only for HTTP APIs. See <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-cors.html">Configuring
/// CORS</a> for more information.
class Cors {
  /// Specifies whether credentials are included in the CORS request. Supported
  /// only for HTTP APIs.
  final bool? allowCredentials;

  /// Represents a collection of allowed headers. Supported only for HTTP APIs.
  final List<String>? allowHeaders;

  /// Represents a collection of allowed HTTP methods. Supported only for HTTP
  /// APIs.
  final List<String>? allowMethods;

  /// Represents a collection of allowed origins. Supported only for HTTP APIs.
  final List<String>? allowOrigins;

  /// Represents a collection of exposed headers. Supported only for HTTP APIs.
  final List<String>? exposeHeaders;

  /// The number of seconds that the browser should cache preflight request
  /// results. Supported only for HTTP APIs.
  final int? maxAge;

  Cors({
    this.allowCredentials,
    this.allowHeaders,
    this.allowMethods,
    this.allowOrigins,
    this.exposeHeaders,
    this.maxAge,
  });

  factory Cors.fromJson(Map<String, dynamic> json) {
    return Cors(
      allowCredentials: json['allowCredentials'] as bool?,
      allowHeaders: (json['allowHeaders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowMethods: (json['allowMethods'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowOrigins: (json['allowOrigins'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      exposeHeaders: (json['exposeHeaders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      maxAge: json['maxAge'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowCredentials = this.allowCredentials;
    final allowHeaders = this.allowHeaders;
    final allowMethods = this.allowMethods;
    final allowOrigins = this.allowOrigins;
    final exposeHeaders = this.exposeHeaders;
    final maxAge = this.maxAge;
    return {
      if (allowCredentials != null) 'allowCredentials': allowCredentials,
      if (allowHeaders != null) 'allowHeaders': allowHeaders,
      if (allowMethods != null) 'allowMethods': allowMethods,
      if (allowOrigins != null) 'allowOrigins': allowOrigins,
      if (exposeHeaders != null) 'exposeHeaders': exposeHeaders,
      if (maxAge != null) 'maxAge': maxAge,
    };
  }
}

class CreateApiMappingResponse {
  /// The API identifier.
  final String? apiId;

  /// The API mapping identifier.
  final String? apiMappingId;

  /// The API mapping key.
  final String? apiMappingKey;

  /// The API stage.
  final String? stage;

  CreateApiMappingResponse({
    this.apiId,
    this.apiMappingId,
    this.apiMappingKey,
    this.stage,
  });

  factory CreateApiMappingResponse.fromJson(Map<String, dynamic> json) {
    return CreateApiMappingResponse(
      apiId: json['apiId'] as String?,
      apiMappingId: json['apiMappingId'] as String?,
      apiMappingKey: json['apiMappingKey'] as String?,
      stage: json['stage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiId = this.apiId;
    final apiMappingId = this.apiMappingId;
    final apiMappingKey = this.apiMappingKey;
    final stage = this.stage;
    return {
      if (apiId != null) 'apiId': apiId,
      if (apiMappingId != null) 'apiMappingId': apiMappingId,
      if (apiMappingKey != null) 'apiMappingKey': apiMappingKey,
      if (stage != null) 'stage': stage,
    };
  }
}

class CreateApiResponse {
  /// The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com.
  /// The stage name is typically appended to this URI to form a complete path to
  /// a deployed API stage.
  final String? apiEndpoint;

  /// Specifies whether an API is managed by API Gateway. You can't update or
  /// delete a managed API by using API Gateway. A managed API can be deleted only
  /// through the tooling or service that created it.
  final bool? apiGatewayManaged;

  /// The API ID.
  final String? apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  final String? apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  final Cors? corsConfiguration;

  /// The timestamp when the API was created.
  final DateTime? createdDate;

  /// The description of the API.
  final String? description;

  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  final bool? disableExecuteApiEndpoint;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  final bool? disableSchemaValidation;

  /// The validation information during API import. This may include particular
  /// properties of your OpenAPI definition which are ignored during import.
  /// Supported only for HTTP APIs.
  final List<String>? importInfo;

  /// The name of the API.
  final String? name;

  /// The API protocol.
  final ProtocolType? protocolType;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  final String? routeSelectionExpression;

  /// A collection of tags associated with the API.
  final Map<String, String>? tags;

  /// A version identifier for the API.
  final String? version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  final List<String>? warnings;

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

  factory CreateApiResponse.fromJson(Map<String, dynamic> json) {
    return CreateApiResponse(
      apiEndpoint: json['apiEndpoint'] as String?,
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      apiId: json['apiId'] as String?,
      apiKeySelectionExpression: json['apiKeySelectionExpression'] as String?,
      corsConfiguration: json['corsConfiguration'] != null
          ? Cors.fromJson(json['corsConfiguration'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool?,
      disableSchemaValidation: json['disableSchemaValidation'] as bool?,
      importInfo: (json['importInfo'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      protocolType: (json['protocolType'] as String?)?.toProtocolType(),
      routeSelectionExpression: json['routeSelectionExpression'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final apiEndpoint = this.apiEndpoint;
    final apiGatewayManaged = this.apiGatewayManaged;
    final apiId = this.apiId;
    final apiKeySelectionExpression = this.apiKeySelectionExpression;
    final corsConfiguration = this.corsConfiguration;
    final createdDate = this.createdDate;
    final description = this.description;
    final disableExecuteApiEndpoint = this.disableExecuteApiEndpoint;
    final disableSchemaValidation = this.disableSchemaValidation;
    final importInfo = this.importInfo;
    final name = this.name;
    final protocolType = this.protocolType;
    final routeSelectionExpression = this.routeSelectionExpression;
    final tags = this.tags;
    final version = this.version;
    final warnings = this.warnings;
    return {
      if (apiEndpoint != null) 'apiEndpoint': apiEndpoint,
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (apiId != null) 'apiId': apiId,
      if (apiKeySelectionExpression != null)
        'apiKeySelectionExpression': apiKeySelectionExpression,
      if (corsConfiguration != null) 'corsConfiguration': corsConfiguration,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (description != null) 'description': description,
      if (disableExecuteApiEndpoint != null)
        'disableExecuteApiEndpoint': disableExecuteApiEndpoint,
      if (disableSchemaValidation != null)
        'disableSchemaValidation': disableSchemaValidation,
      if (importInfo != null) 'importInfo': importInfo,
      if (name != null) 'name': name,
      if (protocolType != null) 'protocolType': protocolType.toValue(),
      if (routeSelectionExpression != null)
        'routeSelectionExpression': routeSelectionExpression,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

class CreateAuthorizerResponse {
  /// Specifies the required credentials as an IAM role for API Gateway to invoke
  /// the authorizer. To specify an IAM role for API Gateway to assume, use the
  /// role's Amazon Resource Name (ARN). To use resource-based permissions on the
  /// Lambda function, don't specify this parameter. Supported only for REQUEST
  /// authorizers.
  final String? authorizerCredentialsArn;

  /// The authorizer identifier.
  final String? authorizerId;

  /// Specifies the format of the payload sent to an HTTP API Lambda authorizer.
  /// Required for HTTP API Lambda authorizers. Supported values are 1.0 and 2.0.
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  final String? authorizerPayloadFormatVersion;

  /// The time to live (TTL) for cached authorizer results, in seconds. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway caches authorizer responses. The maximum value is 3600, or 1 hour.
  /// Supported only for HTTP API Lambda authorizers.
  final int? authorizerResultTtlInSeconds;

  /// The authorizer type. Specify REQUEST for a Lambda function using incoming
  /// request parameters. Specify JWT to use JSON Web Tokens (supported only for
  /// HTTP APIs).
  final AuthorizerType? authorizerType;

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
  final String? authorizerUri;

  /// Specifies whether a Lambda authorizer returns a response in a simple format.
  /// If enabled, the Lambda authorizer can return a boolean value instead of an
  /// IAM policy. Supported only for HTTP APIs. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>
  final bool? enableSimpleResponses;

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
  final List<String>? identitySource;

  /// The validation expression does not apply to the REQUEST authorizer.
  final String? identityValidationExpression;

  /// Represents the configuration of a JWT authorizer. Required for the JWT
  /// authorizer type. Supported only for HTTP APIs.
  final JWTConfiguration? jwtConfiguration;

  /// The name of the authorizer.
  final String? name;

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

  factory CreateAuthorizerResponse.fromJson(Map<String, dynamic> json) {
    return CreateAuthorizerResponse(
      authorizerCredentialsArn: json['authorizerCredentialsArn'] as String?,
      authorizerId: json['authorizerId'] as String?,
      authorizerPayloadFormatVersion:
          json['authorizerPayloadFormatVersion'] as String?,
      authorizerResultTtlInSeconds:
          json['authorizerResultTtlInSeconds'] as int?,
      authorizerType: (json['authorizerType'] as String?)?.toAuthorizerType(),
      authorizerUri: json['authorizerUri'] as String?,
      enableSimpleResponses: json['enableSimpleResponses'] as bool?,
      identitySource: (json['identitySource'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      identityValidationExpression:
          json['identityValidationExpression'] as String?,
      jwtConfiguration: json['jwtConfiguration'] != null
          ? JWTConfiguration.fromJson(
              json['jwtConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizerCredentialsArn = this.authorizerCredentialsArn;
    final authorizerId = this.authorizerId;
    final authorizerPayloadFormatVersion = this.authorizerPayloadFormatVersion;
    final authorizerResultTtlInSeconds = this.authorizerResultTtlInSeconds;
    final authorizerType = this.authorizerType;
    final authorizerUri = this.authorizerUri;
    final enableSimpleResponses = this.enableSimpleResponses;
    final identitySource = this.identitySource;
    final identityValidationExpression = this.identityValidationExpression;
    final jwtConfiguration = this.jwtConfiguration;
    final name = this.name;
    return {
      if (authorizerCredentialsArn != null)
        'authorizerCredentialsArn': authorizerCredentialsArn,
      if (authorizerId != null) 'authorizerId': authorizerId,
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
  }
}

class CreateDeploymentResponse {
  /// Specifies whether a deployment was automatically released.
  final bool? autoDeployed;

  /// The date and time when the Deployment resource was created.
  final DateTime? createdDate;

  /// The identifier for the deployment.
  final String? deploymentId;

  /// The status of the deployment: PENDING, FAILED, or SUCCEEDED.
  final DeploymentStatus? deploymentStatus;

  /// May contain additional feedback on the status of an API deployment.
  final String? deploymentStatusMessage;

  /// The description for the deployment.
  final String? description;

  CreateDeploymentResponse({
    this.autoDeployed,
    this.createdDate,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentStatusMessage,
    this.description,
  });

  factory CreateDeploymentResponse.fromJson(Map<String, dynamic> json) {
    return CreateDeploymentResponse(
      autoDeployed: json['autoDeployed'] as bool?,
      createdDate: timeStampFromJson(json['createdDate']),
      deploymentId: json['deploymentId'] as String?,
      deploymentStatus:
          (json['deploymentStatus'] as String?)?.toDeploymentStatus(),
      deploymentStatusMessage: json['deploymentStatusMessage'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoDeployed = this.autoDeployed;
    final createdDate = this.createdDate;
    final deploymentId = this.deploymentId;
    final deploymentStatus = this.deploymentStatus;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    final description = this.description;
    return {
      if (autoDeployed != null) 'autoDeployed': autoDeployed,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (deploymentStatus != null)
        'deploymentStatus': deploymentStatus.toValue(),
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (description != null) 'description': description,
    };
  }
}

class CreateDomainNameResponse {
  /// The API mapping selection expression.
  final String? apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String? domainName;

  /// The domain name configurations.
  final List<DomainNameConfiguration>? domainNameConfigurations;

  /// The mutual TLS authentication configuration for a custom domain name.
  final MutualTlsAuthentication? mutualTlsAuthentication;

  /// The collection of tags associated with a domain name.
  final Map<String, String>? tags;

  CreateDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.mutualTlsAuthentication,
    this.tags,
  });

  factory CreateDomainNameResponse.fromJson(Map<String, dynamic> json) {
    return CreateDomainNameResponse(
      apiMappingSelectionExpression:
          json['apiMappingSelectionExpression'] as String?,
      domainName: json['domainName'] as String?,
      domainNameConfigurations: (json['domainNameConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DomainNameConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      mutualTlsAuthentication: json['mutualTlsAuthentication'] != null
          ? MutualTlsAuthentication.fromJson(
              json['mutualTlsAuthentication'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final apiMappingSelectionExpression = this.apiMappingSelectionExpression;
    final domainName = this.domainName;
    final domainNameConfigurations = this.domainNameConfigurations;
    final mutualTlsAuthentication = this.mutualTlsAuthentication;
    final tags = this.tags;
    return {
      if (apiMappingSelectionExpression != null)
        'apiMappingSelectionExpression': apiMappingSelectionExpression,
      if (domainName != null) 'domainName': domainName,
      if (domainNameConfigurations != null)
        'domainNameConfigurations': domainNameConfigurations,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateIntegrationResult {
  /// Specifies whether an integration is managed by API Gateway. If you created
  /// an API using using quick create, the resulting integration is managed by API
  /// Gateway. You can update a managed integration, but you can't delete it.
  final bool? apiGatewayManaged;

  /// The ID of the VPC link for a private integration. Supported only for HTTP
  /// APIs.
  final String? connectionId;

  /// The type of the network connection to the integration endpoint. Specify
  /// INTERNET for connections through the public routable internet or VPC_LINK
  /// for private connections between API Gateway and resources in a VPC. The
  /// default value is INTERNET.
  final ConnectionType? connectionType;

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
  final ContentHandlingStrategy? contentHandlingStrategy;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on supported
  /// AWS services, specify null.
  final String? credentialsArn;

  /// Represents the description of an integration.
  final String? description;

  /// Represents the identifier of an integration.
  final String? integrationId;

  /// Specifies the integration's HTTP method type.
  final String? integrationMethod;

  /// The integration response selection expression for the integration. Supported
  /// only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions">Integration
  /// Response Selection Expressions</a>.
  final String? integrationResponseSelectionExpression;

  /// Supported only for HTTP API AWS_PROXY integrations. Specifies the AWS
  /// service action to invoke. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services-reference.html">Integration
  /// subtype reference</a>.
  final String? integrationSubtype;

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
  final IntegrationType? integrationType;

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
  final String? integrationUri;

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
  final PassthroughBehavior? passthroughBehavior;

  /// Specifies the format of the payload sent to an integration. Required for
  /// HTTP APIs.
  final String? payloadFormatVersion;

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
  /// For HTTP API integrations, without a specified integrationSubtype request
  /// parameters are a key-value map specifying how to transform HTTP requests
  /// before sending them to backend integrations. The key should follow the
  /// pattern &lt;action&gt;:&lt;header|querystring|path&gt;.&lt;location&gt;. The
  /// action can be append, overwrite or remove. For values, you can provide
  /// static values, or map request data, stage variables, or context variables
  /// that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  final Map<String, String>? requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  final Map<String, String>? requestTemplates;

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
  final Map<String, Map<String, String>>? responseParameters;

  /// The template selection expression for the integration. Supported only for
  /// WebSocket APIs.
  final String? templateSelectionExpression;

  /// Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and
  /// between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29
  /// seconds for WebSocket APIs and 30 seconds for HTTP APIs.
  final int? timeoutInMillis;

  /// The TLS configuration for a private integration. If you specify a TLS
  /// configuration, private integration traffic uses the HTTPS protocol.
  /// Supported only for HTTP APIs.
  final TlsConfig? tlsConfig;

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

  factory CreateIntegrationResult.fromJson(Map<String, dynamic> json) {
    return CreateIntegrationResult(
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      connectionId: json['connectionId'] as String?,
      connectionType: (json['connectionType'] as String?)?.toConnectionType(),
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.toContentHandlingStrategy(),
      credentialsArn: json['credentialsArn'] as String?,
      description: json['description'] as String?,
      integrationId: json['integrationId'] as String?,
      integrationMethod: json['integrationMethod'] as String?,
      integrationResponseSelectionExpression:
          json['integrationResponseSelectionExpression'] as String?,
      integrationSubtype: json['integrationSubtype'] as String?,
      integrationType:
          (json['integrationType'] as String?)?.toIntegrationType(),
      integrationUri: json['integrationUri'] as String?,
      passthroughBehavior:
          (json['passthroughBehavior'] as String?)?.toPassthroughBehavior(),
      payloadFormatVersion: json['payloadFormatVersion'] as String?,
      requestParameters: (json['requestParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      requestTemplates: (json['requestTemplates'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))),
      templateSelectionExpression:
          json['templateSelectionExpression'] as String?,
      timeoutInMillis: json['timeoutInMillis'] as int?,
      tlsConfig: json['tlsConfig'] != null
          ? TlsConfig.fromJson(json['tlsConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayManaged = this.apiGatewayManaged;
    final connectionId = this.connectionId;
    final connectionType = this.connectionType;
    final contentHandlingStrategy = this.contentHandlingStrategy;
    final credentialsArn = this.credentialsArn;
    final description = this.description;
    final integrationId = this.integrationId;
    final integrationMethod = this.integrationMethod;
    final integrationResponseSelectionExpression =
        this.integrationResponseSelectionExpression;
    final integrationSubtype = this.integrationSubtype;
    final integrationType = this.integrationType;
    final integrationUri = this.integrationUri;
    final passthroughBehavior = this.passthroughBehavior;
    final payloadFormatVersion = this.payloadFormatVersion;
    final requestParameters = this.requestParameters;
    final requestTemplates = this.requestTemplates;
    final responseParameters = this.responseParameters;
    final templateSelectionExpression = this.templateSelectionExpression;
    final timeoutInMillis = this.timeoutInMillis;
    final tlsConfig = this.tlsConfig;
    return {
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (connectionId != null) 'connectionId': connectionId,
      if (connectionType != null) 'connectionType': connectionType.toValue(),
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.toValue(),
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (integrationId != null) 'integrationId': integrationId,
      if (integrationMethod != null) 'integrationMethod': integrationMethod,
      if (integrationResponseSelectionExpression != null)
        'integrationResponseSelectionExpression':
            integrationResponseSelectionExpression,
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
  }
}

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
  final ContentHandlingStrategy? contentHandlingStrategy;

  /// The integration response ID.
  final String? integrationResponseId;

  /// The integration response key.
  final String? integrationResponseKey;

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
  final Map<String, String>? responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are represented
  /// as a key/value map, with a content-type as the key and a template as the
  /// value.
  final Map<String, String>? responseTemplates;

  /// The template selection expressions for the integration response.
  final String? templateSelectionExpression;

  CreateIntegrationResponseResponse({
    this.contentHandlingStrategy,
    this.integrationResponseId,
    this.integrationResponseKey,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });

  factory CreateIntegrationResponseResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateIntegrationResponseResponse(
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.toContentHandlingStrategy(),
      integrationResponseId: json['integrationResponseId'] as String?,
      integrationResponseKey: json['integrationResponseKey'] as String?,
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseTemplates: (json['responseTemplates'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templateSelectionExpression:
          json['templateSelectionExpression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentHandlingStrategy = this.contentHandlingStrategy;
    final integrationResponseId = this.integrationResponseId;
    final integrationResponseKey = this.integrationResponseKey;
    final responseParameters = this.responseParameters;
    final responseTemplates = this.responseTemplates;
    final templateSelectionExpression = this.templateSelectionExpression;
    return {
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.toValue(),
      if (integrationResponseId != null)
        'integrationResponseId': integrationResponseId,
      if (integrationResponseKey != null)
        'integrationResponseKey': integrationResponseKey,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (responseTemplates != null) 'responseTemplates': responseTemplates,
      if (templateSelectionExpression != null)
        'templateSelectionExpression': templateSelectionExpression,
    };
  }
}

class CreateModelResponse {
  /// The content-type for the model, for example, "application/json".
  final String? contentType;

  /// The description of the model.
  final String? description;

  /// The model identifier.
  final String? modelId;

  /// The name of the model. Must be alphanumeric.
  final String? name;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  final String? schema;

  CreateModelResponse({
    this.contentType,
    this.description,
    this.modelId,
    this.name,
    this.schema,
  });

  factory CreateModelResponse.fromJson(Map<String, dynamic> json) {
    return CreateModelResponse(
      contentType: json['contentType'] as String?,
      description: json['description'] as String?,
      modelId: json['modelId'] as String?,
      name: json['name'] as String?,
      schema: json['schema'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final description = this.description;
    final modelId = this.modelId;
    final name = this.name;
    final schema = this.schema;
    return {
      if (contentType != null) 'contentType': contentType,
      if (description != null) 'description': description,
      if (modelId != null) 'modelId': modelId,
      if (name != null) 'name': name,
      if (schema != null) 'schema': schema,
    };
  }
}

class CreateRouteResult {
  /// Specifies whether a route is managed by API Gateway. If you created an API
  /// using quick create, the $default route is managed by API Gateway. You can't
  /// modify the $default route key.
  final bool? apiGatewayManaged;

  /// Specifies whether an API key is required for this route. Supported only for
  /// WebSocket APIs.
  final bool? apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a JWT authorizer to authorize the method invocation. The authorization
  /// works by matching the route scopes against the scopes parsed from the access
  /// token in the incoming request. The method invocation is authorized if any
  /// route scope matches a claimed scope in the access token. Otherwise, the
  /// invocation is not authorized. When the route scope is configured, the client
  /// must provide an access token instead of an identity token for authorization
  /// purposes.
  final List<String>? authorizationScopes;

  /// The authorization type for the route. For WebSocket APIs, valid values are
  /// NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for
  /// using a Lambda authorizer For HTTP APIs, valid values are NONE for open
  /// access, JWT for using JSON Web Tokens, AWS_IAM for using AWS IAM
  /// permissions, and CUSTOM for using a Lambda authorizer.
  final AuthorizationType? authorizationType;

  /// The identifier of the Authorizer resource to be associated with this route.
  /// The authorizer identifier is generated by API Gateway when you created the
  /// authorizer.
  final String? authorizerId;

  /// The model selection expression for the route. Supported only for WebSocket
  /// APIs.
  final String? modelSelectionExpression;

  /// The operation name for the route.
  final String? operationName;

  /// The request models for the route. Supported only for WebSocket APIs.
  final Map<String, String>? requestModels;

  /// The request parameters for the route. Supported only for WebSocket APIs.
  final Map<String, ParameterConstraints>? requestParameters;

  /// The route ID.
  final String? routeId;

  /// The route key for the route.
  final String? routeKey;

  /// The route response selection expression for the route. Supported only for
  /// WebSocket APIs.
  final String? routeResponseSelectionExpression;

  /// The target for the route.
  final String? target;

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

  factory CreateRouteResult.fromJson(Map<String, dynamic> json) {
    return CreateRouteResult(
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      apiKeyRequired: json['apiKeyRequired'] as bool?,
      authorizationScopes: (json['authorizationScopes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      authorizationType:
          (json['authorizationType'] as String?)?.toAuthorizationType(),
      authorizerId: json['authorizerId'] as String?,
      modelSelectionExpression: json['modelSelectionExpression'] as String?,
      operationName: json['operationName'] as String?,
      requestModels: (json['requestModels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      requestParameters: (json['requestParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, ParameterConstraints.fromJson(e as Map<String, dynamic>))),
      routeId: json['routeId'] as String?,
      routeKey: json['routeKey'] as String?,
      routeResponseSelectionExpression:
          json['routeResponseSelectionExpression'] as String?,
      target: json['target'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayManaged = this.apiGatewayManaged;
    final apiKeyRequired = this.apiKeyRequired;
    final authorizationScopes = this.authorizationScopes;
    final authorizationType = this.authorizationType;
    final authorizerId = this.authorizerId;
    final modelSelectionExpression = this.modelSelectionExpression;
    final operationName = this.operationName;
    final requestModels = this.requestModels;
    final requestParameters = this.requestParameters;
    final routeId = this.routeId;
    final routeKey = this.routeKey;
    final routeResponseSelectionExpression =
        this.routeResponseSelectionExpression;
    final target = this.target;
    return {
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
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
      if (routeId != null) 'routeId': routeId,
      if (routeKey != null) 'routeKey': routeKey,
      if (routeResponseSelectionExpression != null)
        'routeResponseSelectionExpression': routeResponseSelectionExpression,
      if (target != null) 'target': target,
    };
  }
}

class CreateRouteResponseResponse {
  /// Represents the model selection expression of a route response. Supported
  /// only for WebSocket APIs.
  final String? modelSelectionExpression;

  /// Represents the response models of a route response.
  final Map<String, String>? responseModels;

  /// Represents the response parameters of a route response.
  final Map<String, ParameterConstraints>? responseParameters;

  /// Represents the identifier of a route response.
  final String? routeResponseId;

  /// Represents the route response key of a route response.
  final String? routeResponseKey;

  CreateRouteResponseResponse({
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseId,
    this.routeResponseKey,
  });

  factory CreateRouteResponseResponse.fromJson(Map<String, dynamic> json) {
    return CreateRouteResponseResponse(
      modelSelectionExpression: json['modelSelectionExpression'] as String?,
      responseModels: (json['responseModels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, ParameterConstraints.fromJson(e as Map<String, dynamic>))),
      routeResponseId: json['routeResponseId'] as String?,
      routeResponseKey: json['routeResponseKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelSelectionExpression = this.modelSelectionExpression;
    final responseModels = this.responseModels;
    final responseParameters = this.responseParameters;
    final routeResponseId = this.routeResponseId;
    final routeResponseKey = this.routeResponseKey;
    return {
      if (modelSelectionExpression != null)
        'modelSelectionExpression': modelSelectionExpression,
      if (responseModels != null) 'responseModels': responseModels,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (routeResponseId != null) 'routeResponseId': routeResponseId,
      if (routeResponseKey != null) 'routeResponseKey': routeResponseKey,
    };
  }
}

class CreateStageResponse {
  /// Settings for logging access in this stage.
  final AccessLogSettings? accessLogSettings;

  /// Specifies whether a stage is managed by API Gateway. If you created an API
  /// using quick create, the $default stage is managed by API Gateway. You can't
  /// modify the $default stage.
  final bool? apiGatewayManaged;

  /// Specifies whether updates to an API automatically trigger a new deployment.
  /// The default value is false.
  final bool? autoDeploy;

  /// The identifier of a client certificate for a Stage. Supported only for
  /// WebSocket APIs.
  final String? clientCertificateId;

  /// The timestamp when the stage was created.
  final DateTime? createdDate;

  /// Default route settings for the stage.
  final RouteSettings? defaultRouteSettings;

  /// The identifier of the Deployment that the Stage is associated with. Can't be
  /// updated if autoDeploy is enabled.
  final String? deploymentId;

  /// The description of the stage.
  final String? description;

  /// Describes the status of the last deployment of a stage. Supported only for
  /// stages with autoDeploy enabled.
  final String? lastDeploymentStatusMessage;

  /// The timestamp when the stage was last updated.
  final DateTime? lastUpdatedDate;

  /// Route settings for the stage, by routeKey.
  final Map<String, RouteSettings>? routeSettings;

  /// The name of the stage.
  final String? stageName;

  /// A map that defines the stage variables for a stage resource. Variable names
  /// can have alphanumeric and underscore characters, and the values must match
  /// [A-Za-z0-9-._~:/?#&amp;=,]+.
  final Map<String, String>? stageVariables;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

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

  factory CreateStageResponse.fromJson(Map<String, dynamic> json) {
    return CreateStageResponse(
      accessLogSettings: json['accessLogSettings'] != null
          ? AccessLogSettings.fromJson(
              json['accessLogSettings'] as Map<String, dynamic>)
          : null,
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      autoDeploy: json['autoDeploy'] as bool?,
      clientCertificateId: json['clientCertificateId'] as String?,
      createdDate: timeStampFromJson(json['createdDate']),
      defaultRouteSettings: json['defaultRouteSettings'] != null
          ? RouteSettings.fromJson(
              json['defaultRouteSettings'] as Map<String, dynamic>)
          : null,
      deploymentId: json['deploymentId'] as String?,
      description: json['description'] as String?,
      lastDeploymentStatusMessage:
          json['lastDeploymentStatusMessage'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      routeSettings: (json['routeSettings'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, RouteSettings.fromJson(e as Map<String, dynamic>))),
      stageName: json['stageName'] as String?,
      stageVariables: (json['stageVariables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final accessLogSettings = this.accessLogSettings;
    final apiGatewayManaged = this.apiGatewayManaged;
    final autoDeploy = this.autoDeploy;
    final clientCertificateId = this.clientCertificateId;
    final createdDate = this.createdDate;
    final defaultRouteSettings = this.defaultRouteSettings;
    final deploymentId = this.deploymentId;
    final description = this.description;
    final lastDeploymentStatusMessage = this.lastDeploymentStatusMessage;
    final lastUpdatedDate = this.lastUpdatedDate;
    final routeSettings = this.routeSettings;
    final stageName = this.stageName;
    final stageVariables = this.stageVariables;
    final tags = this.tags;
    return {
      if (accessLogSettings != null) 'accessLogSettings': accessLogSettings,
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (autoDeploy != null) 'autoDeploy': autoDeploy,
      if (clientCertificateId != null)
        'clientCertificateId': clientCertificateId,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (defaultRouteSettings != null)
        'defaultRouteSettings': defaultRouteSettings,
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (description != null) 'description': description,
      if (lastDeploymentStatusMessage != null)
        'lastDeploymentStatusMessage': lastDeploymentStatusMessage,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      if (routeSettings != null) 'routeSettings': routeSettings,
      if (stageName != null) 'stageName': stageName,
      if (stageVariables != null) 'stageVariables': stageVariables,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateVpcLinkResponse {
  /// The timestamp when the VPC link was created.
  final DateTime? createdDate;

  /// The name of the VPC link.
  final String? name;

  /// A list of security group IDs for the VPC link.
  final List<String>? securityGroupIds;

  /// A list of subnet IDs to include in the VPC link.
  final List<String>? subnetIds;

  /// Tags for the VPC link.
  final Map<String, String>? tags;

  /// The ID of the VPC link.
  final String? vpcLinkId;

  /// The status of the VPC link.
  final VpcLinkStatus? vpcLinkStatus;

  /// A message summarizing the cause of the status of the VPC link.
  final String? vpcLinkStatusMessage;

  /// The version of the VPC link.
  final VpcLinkVersion? vpcLinkVersion;

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

  factory CreateVpcLinkResponse.fromJson(Map<String, dynamic> json) {
    return CreateVpcLinkResponse(
      createdDate: timeStampFromJson(json['createdDate']),
      name: json['name'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcLinkId: json['vpcLinkId'] as String?,
      vpcLinkStatus: (json['vpcLinkStatus'] as String?)?.toVpcLinkStatus(),
      vpcLinkStatusMessage: json['vpcLinkStatusMessage'] as String?,
      vpcLinkVersion: (json['vpcLinkVersion'] as String?)?.toVpcLinkVersion(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final name = this.name;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final tags = this.tags;
    final vpcLinkId = this.vpcLinkId;
    final vpcLinkStatus = this.vpcLinkStatus;
    final vpcLinkStatusMessage = this.vpcLinkStatusMessage;
    final vpcLinkVersion = this.vpcLinkVersion;
    return {
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (name != null) 'name': name,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (tags != null) 'tags': tags,
      if (vpcLinkId != null) 'vpcLinkId': vpcLinkId,
      if (vpcLinkStatus != null) 'vpcLinkStatus': vpcLinkStatus.toValue(),
      if (vpcLinkStatusMessage != null)
        'vpcLinkStatusMessage': vpcLinkStatusMessage,
      if (vpcLinkVersion != null) 'vpcLinkVersion': vpcLinkVersion.toValue(),
    };
  }
}

class DeleteVpcLinkResponse {
  DeleteVpcLinkResponse();

  factory DeleteVpcLinkResponse.fromJson(Map<String, dynamic> _) {
    return DeleteVpcLinkResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An immutable representation of an API that can be called by users. A
/// Deployment must be associated with a Stage for it to be callable over the
/// internet.
class Deployment {
  /// Specifies whether a deployment was automatically released.
  final bool? autoDeployed;

  /// The date and time when the Deployment resource was created.
  final DateTime? createdDate;

  /// The identifier for the deployment.
  final String? deploymentId;

  /// The status of the deployment: PENDING, FAILED, or SUCCEEDED.
  final DeploymentStatus? deploymentStatus;

  /// May contain additional feedback on the status of an API deployment.
  final String? deploymentStatusMessage;

  /// The description for the deployment.
  final String? description;

  Deployment({
    this.autoDeployed,
    this.createdDate,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentStatusMessage,
    this.description,
  });

  factory Deployment.fromJson(Map<String, dynamic> json) {
    return Deployment(
      autoDeployed: json['autoDeployed'] as bool?,
      createdDate: timeStampFromJson(json['createdDate']),
      deploymentId: json['deploymentId'] as String?,
      deploymentStatus:
          (json['deploymentStatus'] as String?)?.toDeploymentStatus(),
      deploymentStatusMessage: json['deploymentStatusMessage'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoDeployed = this.autoDeployed;
    final createdDate = this.createdDate;
    final deploymentId = this.deploymentId;
    final deploymentStatus = this.deploymentStatus;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    final description = this.description;
    return {
      if (autoDeployed != null) 'autoDeployed': autoDeployed,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (deploymentStatus != null)
        'deploymentStatus': deploymentStatus.toValue(),
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (description != null) 'description': description,
    };
  }
}

/// Represents a deployment status.
enum DeploymentStatus {
  pending,
  failed,
  deployed,
}

extension DeploymentStatusValueExtension on DeploymentStatus {
  String toValue() {
    switch (this) {
      case DeploymentStatus.pending:
        return 'PENDING';
      case DeploymentStatus.failed:
        return 'FAILED';
      case DeploymentStatus.deployed:
        return 'DEPLOYED';
    }
  }
}

extension DeploymentStatusFromString on String {
  DeploymentStatus toDeploymentStatus() {
    switch (this) {
      case 'PENDING':
        return DeploymentStatus.pending;
      case 'FAILED':
        return DeploymentStatus.failed;
      case 'DEPLOYED':
        return DeploymentStatus.deployed;
    }
    throw Exception('$this is not known in enum DeploymentStatus');
  }
}

/// Represents a domain name.
class DomainName {
  /// The name of the DomainName resource.
  final String domainName;

  /// The API mapping selection expression.
  final String? apiMappingSelectionExpression;

  /// The domain name configurations.
  final List<DomainNameConfiguration>? domainNameConfigurations;

  /// The mutual TLS authentication configuration for a custom domain name.
  final MutualTlsAuthentication? mutualTlsAuthentication;

  /// The collection of tags associated with a domain name.
  final Map<String, String>? tags;

  DomainName({
    required this.domainName,
    this.apiMappingSelectionExpression,
    this.domainNameConfigurations,
    this.mutualTlsAuthentication,
    this.tags,
  });

  factory DomainName.fromJson(Map<String, dynamic> json) {
    return DomainName(
      domainName: json['domainName'] as String,
      apiMappingSelectionExpression:
          json['apiMappingSelectionExpression'] as String?,
      domainNameConfigurations: (json['domainNameConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DomainNameConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      mutualTlsAuthentication: json['mutualTlsAuthentication'] != null
          ? MutualTlsAuthentication.fromJson(
              json['mutualTlsAuthentication'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final apiMappingSelectionExpression = this.apiMappingSelectionExpression;
    final domainNameConfigurations = this.domainNameConfigurations;
    final mutualTlsAuthentication = this.mutualTlsAuthentication;
    final tags = this.tags;
    return {
      'domainName': domainName,
      if (apiMappingSelectionExpression != null)
        'apiMappingSelectionExpression': apiMappingSelectionExpression,
      if (domainNameConfigurations != null)
        'domainNameConfigurations': domainNameConfigurations,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The domain name configuration.
class DomainNameConfiguration {
  /// A domain name for the API.
  final String? apiGatewayDomainName;

  /// An AWS-managed certificate that will be used by the edge-optimized endpoint
  /// for this domain name. AWS Certificate Manager is the only supported source.
  final String? certificateArn;

  /// The user-friendly name of the certificate that will be used by the
  /// edge-optimized endpoint for this domain name.
  final String? certificateName;

  /// The timestamp when the certificate that was used by edge-optimized endpoint
  /// for this domain name was uploaded.
  final DateTime? certificateUploadDate;

  /// The status of the domain name migration. The valid values are AVAILABLE,
  /// UPDATING, PENDING_CERTIFICATE_REIMPORT, and PENDING_OWNERSHIP_VERIFICATION.
  /// If the status is UPDATING, the domain cannot be modified further until the
  /// existing operation is complete. If it is AVAILABLE, the domain can be
  /// updated.
  final DomainNameStatus? domainNameStatus;

  /// An optional text message containing detailed information about status of the
  /// domain name migration.
  final String? domainNameStatusMessage;

  /// The endpoint type.
  final EndpointType? endpointType;

  /// The Amazon Route 53 Hosted Zone ID of the endpoint.
  final String? hostedZoneId;

  /// The ARN of the public certificate issued by ACM to validate ownership of
  /// your custom domain. Only required when configuring mutual TLS and using an
  /// ACM imported or private CA certificate ARN as the regionalCertificateArn
  final String? ownershipVerificationCertificateArn;

  /// The Transport Layer Security (TLS) version of the security policy for this
  /// domain name. The valid values are TLS_1_0 and TLS_1_2.
  final SecurityPolicy? securityPolicy;

  DomainNameConfiguration({
    this.apiGatewayDomainName,
    this.certificateArn,
    this.certificateName,
    this.certificateUploadDate,
    this.domainNameStatus,
    this.domainNameStatusMessage,
    this.endpointType,
    this.hostedZoneId,
    this.ownershipVerificationCertificateArn,
    this.securityPolicy,
  });

  factory DomainNameConfiguration.fromJson(Map<String, dynamic> json) {
    return DomainNameConfiguration(
      apiGatewayDomainName: json['apiGatewayDomainName'] as String?,
      certificateArn: json['certificateArn'] as String?,
      certificateName: json['certificateName'] as String?,
      certificateUploadDate: timeStampFromJson(json['certificateUploadDate']),
      domainNameStatus:
          (json['domainNameStatus'] as String?)?.toDomainNameStatus(),
      domainNameStatusMessage: json['domainNameStatusMessage'] as String?,
      endpointType: (json['endpointType'] as String?)?.toEndpointType(),
      hostedZoneId: json['hostedZoneId'] as String?,
      ownershipVerificationCertificateArn:
          json['ownershipVerificationCertificateArn'] as String?,
      securityPolicy: (json['securityPolicy'] as String?)?.toSecurityPolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayDomainName = this.apiGatewayDomainName;
    final certificateArn = this.certificateArn;
    final certificateName = this.certificateName;
    final certificateUploadDate = this.certificateUploadDate;
    final domainNameStatus = this.domainNameStatus;
    final domainNameStatusMessage = this.domainNameStatusMessage;
    final endpointType = this.endpointType;
    final hostedZoneId = this.hostedZoneId;
    final ownershipVerificationCertificateArn =
        this.ownershipVerificationCertificateArn;
    final securityPolicy = this.securityPolicy;
    return {
      if (apiGatewayDomainName != null)
        'apiGatewayDomainName': apiGatewayDomainName,
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (certificateName != null) 'certificateName': certificateName,
      if (certificateUploadDate != null)
        'certificateUploadDate': iso8601ToJson(certificateUploadDate),
      if (domainNameStatus != null)
        'domainNameStatus': domainNameStatus.toValue(),
      if (domainNameStatusMessage != null)
        'domainNameStatusMessage': domainNameStatusMessage,
      if (endpointType != null) 'endpointType': endpointType.toValue(),
      if (hostedZoneId != null) 'hostedZoneId': hostedZoneId,
      if (ownershipVerificationCertificateArn != null)
        'ownershipVerificationCertificateArn':
            ownershipVerificationCertificateArn,
      if (securityPolicy != null) 'securityPolicy': securityPolicy.toValue(),
    };
  }
}

/// The status of the domain name migration. The valid values are AVAILABLE,
/// UPDATING, PENDING_CERTIFICATE_REIMPORT, and PENDING_OWNERSHIP_VERIFICATION.
/// If the status is UPDATING, the domain cannot be modified further until the
/// existing operation is complete. If it is AVAILABLE, the domain can be
/// updated.
enum DomainNameStatus {
  available,
  updating,
  pendingCertificateReimport,
  pendingOwnershipVerification,
}

extension DomainNameStatusValueExtension on DomainNameStatus {
  String toValue() {
    switch (this) {
      case DomainNameStatus.available:
        return 'AVAILABLE';
      case DomainNameStatus.updating:
        return 'UPDATING';
      case DomainNameStatus.pendingCertificateReimport:
        return 'PENDING_CERTIFICATE_REIMPORT';
      case DomainNameStatus.pendingOwnershipVerification:
        return 'PENDING_OWNERSHIP_VERIFICATION';
    }
  }
}

extension DomainNameStatusFromString on String {
  DomainNameStatus toDomainNameStatus() {
    switch (this) {
      case 'AVAILABLE':
        return DomainNameStatus.available;
      case 'UPDATING':
        return DomainNameStatus.updating;
      case 'PENDING_CERTIFICATE_REIMPORT':
        return DomainNameStatus.pendingCertificateReimport;
      case 'PENDING_OWNERSHIP_VERIFICATION':
        return DomainNameStatus.pendingOwnershipVerification;
    }
    throw Exception('$this is not known in enum DomainNameStatus');
  }
}

/// Represents an endpoint type.
enum EndpointType {
  regional,
  edge,
}

extension EndpointTypeValueExtension on EndpointType {
  String toValue() {
    switch (this) {
      case EndpointType.regional:
        return 'REGIONAL';
      case EndpointType.edge:
        return 'EDGE';
    }
  }
}

extension EndpointTypeFromString on String {
  EndpointType toEndpointType() {
    switch (this) {
      case 'REGIONAL':
        return EndpointType.regional;
      case 'EDGE':
        return EndpointType.edge;
    }
    throw Exception('$this is not known in enum EndpointType');
  }
}

class ExportApiResponse {
  final Uint8List? body;

  ExportApiResponse({
    this.body,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    return {
      if (body != null) 'body': base64Encode(body),
    };
  }
}

class GetApiMappingResponse {
  /// The API identifier.
  final String? apiId;

  /// The API mapping identifier.
  final String? apiMappingId;

  /// The API mapping key.
  final String? apiMappingKey;

  /// The API stage.
  final String? stage;

  GetApiMappingResponse({
    this.apiId,
    this.apiMappingId,
    this.apiMappingKey,
    this.stage,
  });

  factory GetApiMappingResponse.fromJson(Map<String, dynamic> json) {
    return GetApiMappingResponse(
      apiId: json['apiId'] as String?,
      apiMappingId: json['apiMappingId'] as String?,
      apiMappingKey: json['apiMappingKey'] as String?,
      stage: json['stage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiId = this.apiId;
    final apiMappingId = this.apiMappingId;
    final apiMappingKey = this.apiMappingKey;
    final stage = this.stage;
    return {
      if (apiId != null) 'apiId': apiId,
      if (apiMappingId != null) 'apiMappingId': apiMappingId,
      if (apiMappingKey != null) 'apiMappingKey': apiMappingKey,
      if (stage != null) 'stage': stage,
    };
  }
}

class GetApiMappingsResponse {
  /// The elements from this collection.
  final List<ApiMapping>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  GetApiMappingsResponse({
    this.items,
    this.nextToken,
  });

  factory GetApiMappingsResponse.fromJson(Map<String, dynamic> json) {
    return GetApiMappingsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => ApiMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetApiResponse {
  /// The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com.
  /// The stage name is typically appended to this URI to form a complete path to
  /// a deployed API stage.
  final String? apiEndpoint;

  /// Specifies whether an API is managed by API Gateway. You can't update or
  /// delete a managed API by using API Gateway. A managed API can be deleted only
  /// through the tooling or service that created it.
  final bool? apiGatewayManaged;

  /// The API ID.
  final String? apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  final String? apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  final Cors? corsConfiguration;

  /// The timestamp when the API was created.
  final DateTime? createdDate;

  /// The description of the API.
  final String? description;

  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  final bool? disableExecuteApiEndpoint;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  final bool? disableSchemaValidation;

  /// The validation information during API import. This may include particular
  /// properties of your OpenAPI definition which are ignored during import.
  /// Supported only for HTTP APIs.
  final List<String>? importInfo;

  /// The name of the API.
  final String? name;

  /// The API protocol.
  final ProtocolType? protocolType;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  final String? routeSelectionExpression;

  /// A collection of tags associated with the API.
  final Map<String, String>? tags;

  /// A version identifier for the API.
  final String? version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  final List<String>? warnings;

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

  factory GetApiResponse.fromJson(Map<String, dynamic> json) {
    return GetApiResponse(
      apiEndpoint: json['apiEndpoint'] as String?,
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      apiId: json['apiId'] as String?,
      apiKeySelectionExpression: json['apiKeySelectionExpression'] as String?,
      corsConfiguration: json['corsConfiguration'] != null
          ? Cors.fromJson(json['corsConfiguration'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool?,
      disableSchemaValidation: json['disableSchemaValidation'] as bool?,
      importInfo: (json['importInfo'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      protocolType: (json['protocolType'] as String?)?.toProtocolType(),
      routeSelectionExpression: json['routeSelectionExpression'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final apiEndpoint = this.apiEndpoint;
    final apiGatewayManaged = this.apiGatewayManaged;
    final apiId = this.apiId;
    final apiKeySelectionExpression = this.apiKeySelectionExpression;
    final corsConfiguration = this.corsConfiguration;
    final createdDate = this.createdDate;
    final description = this.description;
    final disableExecuteApiEndpoint = this.disableExecuteApiEndpoint;
    final disableSchemaValidation = this.disableSchemaValidation;
    final importInfo = this.importInfo;
    final name = this.name;
    final protocolType = this.protocolType;
    final routeSelectionExpression = this.routeSelectionExpression;
    final tags = this.tags;
    final version = this.version;
    final warnings = this.warnings;
    return {
      if (apiEndpoint != null) 'apiEndpoint': apiEndpoint,
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (apiId != null) 'apiId': apiId,
      if (apiKeySelectionExpression != null)
        'apiKeySelectionExpression': apiKeySelectionExpression,
      if (corsConfiguration != null) 'corsConfiguration': corsConfiguration,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (description != null) 'description': description,
      if (disableExecuteApiEndpoint != null)
        'disableExecuteApiEndpoint': disableExecuteApiEndpoint,
      if (disableSchemaValidation != null)
        'disableSchemaValidation': disableSchemaValidation,
      if (importInfo != null) 'importInfo': importInfo,
      if (name != null) 'name': name,
      if (protocolType != null) 'protocolType': protocolType.toValue(),
      if (routeSelectionExpression != null)
        'routeSelectionExpression': routeSelectionExpression,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

class GetApisResponse {
  /// The elements from this collection.
  final List<Api>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  GetApisResponse({
    this.items,
    this.nextToken,
  });

  factory GetApisResponse.fromJson(Map<String, dynamic> json) {
    return GetApisResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => Api.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetAuthorizerResponse {
  /// Specifies the required credentials as an IAM role for API Gateway to invoke
  /// the authorizer. To specify an IAM role for API Gateway to assume, use the
  /// role's Amazon Resource Name (ARN). To use resource-based permissions on the
  /// Lambda function, don't specify this parameter. Supported only for REQUEST
  /// authorizers.
  final String? authorizerCredentialsArn;

  /// The authorizer identifier.
  final String? authorizerId;

  /// Specifies the format of the payload sent to an HTTP API Lambda authorizer.
  /// Required for HTTP API Lambda authorizers. Supported values are 1.0 and 2.0.
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  final String? authorizerPayloadFormatVersion;

  /// The time to live (TTL) for cached authorizer results, in seconds. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway caches authorizer responses. The maximum value is 3600, or 1 hour.
  /// Supported only for HTTP API Lambda authorizers.
  final int? authorizerResultTtlInSeconds;

  /// The authorizer type. Specify REQUEST for a Lambda function using incoming
  /// request parameters. Specify JWT to use JSON Web Tokens (supported only for
  /// HTTP APIs).
  final AuthorizerType? authorizerType;

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
  final String? authorizerUri;

  /// Specifies whether a Lambda authorizer returns a response in a simple format.
  /// If enabled, the Lambda authorizer can return a boolean value instead of an
  /// IAM policy. Supported only for HTTP APIs. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>
  final bool? enableSimpleResponses;

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
  final List<String>? identitySource;

  /// The validation expression does not apply to the REQUEST authorizer.
  final String? identityValidationExpression;

  /// Represents the configuration of a JWT authorizer. Required for the JWT
  /// authorizer type. Supported only for HTTP APIs.
  final JWTConfiguration? jwtConfiguration;

  /// The name of the authorizer.
  final String? name;

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

  factory GetAuthorizerResponse.fromJson(Map<String, dynamic> json) {
    return GetAuthorizerResponse(
      authorizerCredentialsArn: json['authorizerCredentialsArn'] as String?,
      authorizerId: json['authorizerId'] as String?,
      authorizerPayloadFormatVersion:
          json['authorizerPayloadFormatVersion'] as String?,
      authorizerResultTtlInSeconds:
          json['authorizerResultTtlInSeconds'] as int?,
      authorizerType: (json['authorizerType'] as String?)?.toAuthorizerType(),
      authorizerUri: json['authorizerUri'] as String?,
      enableSimpleResponses: json['enableSimpleResponses'] as bool?,
      identitySource: (json['identitySource'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      identityValidationExpression:
          json['identityValidationExpression'] as String?,
      jwtConfiguration: json['jwtConfiguration'] != null
          ? JWTConfiguration.fromJson(
              json['jwtConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizerCredentialsArn = this.authorizerCredentialsArn;
    final authorizerId = this.authorizerId;
    final authorizerPayloadFormatVersion = this.authorizerPayloadFormatVersion;
    final authorizerResultTtlInSeconds = this.authorizerResultTtlInSeconds;
    final authorizerType = this.authorizerType;
    final authorizerUri = this.authorizerUri;
    final enableSimpleResponses = this.enableSimpleResponses;
    final identitySource = this.identitySource;
    final identityValidationExpression = this.identityValidationExpression;
    final jwtConfiguration = this.jwtConfiguration;
    final name = this.name;
    return {
      if (authorizerCredentialsArn != null)
        'authorizerCredentialsArn': authorizerCredentialsArn,
      if (authorizerId != null) 'authorizerId': authorizerId,
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
  }
}

class GetAuthorizersResponse {
  /// The elements from this collection.
  final List<Authorizer>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  GetAuthorizersResponse({
    this.items,
    this.nextToken,
  });

  factory GetAuthorizersResponse.fromJson(Map<String, dynamic> json) {
    return GetAuthorizersResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => Authorizer.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetDeploymentResponse {
  /// Specifies whether a deployment was automatically released.
  final bool? autoDeployed;

  /// The date and time when the Deployment resource was created.
  final DateTime? createdDate;

  /// The identifier for the deployment.
  final String? deploymentId;

  /// The status of the deployment: PENDING, FAILED, or SUCCEEDED.
  final DeploymentStatus? deploymentStatus;

  /// May contain additional feedback on the status of an API deployment.
  final String? deploymentStatusMessage;

  /// The description for the deployment.
  final String? description;

  GetDeploymentResponse({
    this.autoDeployed,
    this.createdDate,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentStatusMessage,
    this.description,
  });

  factory GetDeploymentResponse.fromJson(Map<String, dynamic> json) {
    return GetDeploymentResponse(
      autoDeployed: json['autoDeployed'] as bool?,
      createdDate: timeStampFromJson(json['createdDate']),
      deploymentId: json['deploymentId'] as String?,
      deploymentStatus:
          (json['deploymentStatus'] as String?)?.toDeploymentStatus(),
      deploymentStatusMessage: json['deploymentStatusMessage'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoDeployed = this.autoDeployed;
    final createdDate = this.createdDate;
    final deploymentId = this.deploymentId;
    final deploymentStatus = this.deploymentStatus;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    final description = this.description;
    return {
      if (autoDeployed != null) 'autoDeployed': autoDeployed,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (deploymentStatus != null)
        'deploymentStatus': deploymentStatus.toValue(),
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (description != null) 'description': description,
    };
  }
}

class GetDeploymentsResponse {
  /// The elements from this collection.
  final List<Deployment>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  GetDeploymentsResponse({
    this.items,
    this.nextToken,
  });

  factory GetDeploymentsResponse.fromJson(Map<String, dynamic> json) {
    return GetDeploymentsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => Deployment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetDomainNameResponse {
  /// The API mapping selection expression.
  final String? apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String? domainName;

  /// The domain name configurations.
  final List<DomainNameConfiguration>? domainNameConfigurations;

  /// The mutual TLS authentication configuration for a custom domain name.
  final MutualTlsAuthentication? mutualTlsAuthentication;

  /// The collection of tags associated with a domain name.
  final Map<String, String>? tags;

  GetDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.mutualTlsAuthentication,
    this.tags,
  });

  factory GetDomainNameResponse.fromJson(Map<String, dynamic> json) {
    return GetDomainNameResponse(
      apiMappingSelectionExpression:
          json['apiMappingSelectionExpression'] as String?,
      domainName: json['domainName'] as String?,
      domainNameConfigurations: (json['domainNameConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DomainNameConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      mutualTlsAuthentication: json['mutualTlsAuthentication'] != null
          ? MutualTlsAuthentication.fromJson(
              json['mutualTlsAuthentication'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final apiMappingSelectionExpression = this.apiMappingSelectionExpression;
    final domainName = this.domainName;
    final domainNameConfigurations = this.domainNameConfigurations;
    final mutualTlsAuthentication = this.mutualTlsAuthentication;
    final tags = this.tags;
    return {
      if (apiMappingSelectionExpression != null)
        'apiMappingSelectionExpression': apiMappingSelectionExpression,
      if (domainName != null) 'domainName': domainName,
      if (domainNameConfigurations != null)
        'domainNameConfigurations': domainNameConfigurations,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetDomainNamesResponse {
  /// The elements from this collection.
  final List<DomainName>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  GetDomainNamesResponse({
    this.items,
    this.nextToken,
  });

  factory GetDomainNamesResponse.fromJson(Map<String, dynamic> json) {
    return GetDomainNamesResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => DomainName.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetIntegrationResult {
  /// Specifies whether an integration is managed by API Gateway. If you created
  /// an API using using quick create, the resulting integration is managed by API
  /// Gateway. You can update a managed integration, but you can't delete it.
  final bool? apiGatewayManaged;

  /// The ID of the VPC link for a private integration. Supported only for HTTP
  /// APIs.
  final String? connectionId;

  /// The type of the network connection to the integration endpoint. Specify
  /// INTERNET for connections through the public routable internet or VPC_LINK
  /// for private connections between API Gateway and resources in a VPC. The
  /// default value is INTERNET.
  final ConnectionType? connectionType;

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
  final ContentHandlingStrategy? contentHandlingStrategy;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on supported
  /// AWS services, specify null.
  final String? credentialsArn;

  /// Represents the description of an integration.
  final String? description;

  /// Represents the identifier of an integration.
  final String? integrationId;

  /// Specifies the integration's HTTP method type.
  final String? integrationMethod;

  /// The integration response selection expression for the integration. Supported
  /// only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions">Integration
  /// Response Selection Expressions</a>.
  final String? integrationResponseSelectionExpression;

  /// Supported only for HTTP API AWS_PROXY integrations. Specifies the AWS
  /// service action to invoke. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services-reference.html">Integration
  /// subtype reference</a>.
  final String? integrationSubtype;

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
  final IntegrationType? integrationType;

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
  final String? integrationUri;

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
  final PassthroughBehavior? passthroughBehavior;

  /// Specifies the format of the payload sent to an integration. Required for
  /// HTTP APIs.
  final String? payloadFormatVersion;

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
  /// For HTTP API integrations, without a specified integrationSubtype request
  /// parameters are a key-value map specifying how to transform HTTP requests
  /// before sending them to backend integrations. The key should follow the
  /// pattern &lt;action&gt;:&lt;header|querystring|path&gt;.&lt;location&gt;. The
  /// action can be append, overwrite or remove. For values, you can provide
  /// static values, or map request data, stage variables, or context variables
  /// that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  final Map<String, String>? requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  final Map<String, String>? requestTemplates;

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
  final Map<String, Map<String, String>>? responseParameters;

  /// The template selection expression for the integration. Supported only for
  /// WebSocket APIs.
  final String? templateSelectionExpression;

  /// Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and
  /// between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29
  /// seconds for WebSocket APIs and 30 seconds for HTTP APIs.
  final int? timeoutInMillis;

  /// The TLS configuration for a private integration. If you specify a TLS
  /// configuration, private integration traffic uses the HTTPS protocol.
  /// Supported only for HTTP APIs.
  final TlsConfig? tlsConfig;

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

  factory GetIntegrationResult.fromJson(Map<String, dynamic> json) {
    return GetIntegrationResult(
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      connectionId: json['connectionId'] as String?,
      connectionType: (json['connectionType'] as String?)?.toConnectionType(),
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.toContentHandlingStrategy(),
      credentialsArn: json['credentialsArn'] as String?,
      description: json['description'] as String?,
      integrationId: json['integrationId'] as String?,
      integrationMethod: json['integrationMethod'] as String?,
      integrationResponseSelectionExpression:
          json['integrationResponseSelectionExpression'] as String?,
      integrationSubtype: json['integrationSubtype'] as String?,
      integrationType:
          (json['integrationType'] as String?)?.toIntegrationType(),
      integrationUri: json['integrationUri'] as String?,
      passthroughBehavior:
          (json['passthroughBehavior'] as String?)?.toPassthroughBehavior(),
      payloadFormatVersion: json['payloadFormatVersion'] as String?,
      requestParameters: (json['requestParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      requestTemplates: (json['requestTemplates'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))),
      templateSelectionExpression:
          json['templateSelectionExpression'] as String?,
      timeoutInMillis: json['timeoutInMillis'] as int?,
      tlsConfig: json['tlsConfig'] != null
          ? TlsConfig.fromJson(json['tlsConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayManaged = this.apiGatewayManaged;
    final connectionId = this.connectionId;
    final connectionType = this.connectionType;
    final contentHandlingStrategy = this.contentHandlingStrategy;
    final credentialsArn = this.credentialsArn;
    final description = this.description;
    final integrationId = this.integrationId;
    final integrationMethod = this.integrationMethod;
    final integrationResponseSelectionExpression =
        this.integrationResponseSelectionExpression;
    final integrationSubtype = this.integrationSubtype;
    final integrationType = this.integrationType;
    final integrationUri = this.integrationUri;
    final passthroughBehavior = this.passthroughBehavior;
    final payloadFormatVersion = this.payloadFormatVersion;
    final requestParameters = this.requestParameters;
    final requestTemplates = this.requestTemplates;
    final responseParameters = this.responseParameters;
    final templateSelectionExpression = this.templateSelectionExpression;
    final timeoutInMillis = this.timeoutInMillis;
    final tlsConfig = this.tlsConfig;
    return {
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (connectionId != null) 'connectionId': connectionId,
      if (connectionType != null) 'connectionType': connectionType.toValue(),
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.toValue(),
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (integrationId != null) 'integrationId': integrationId,
      if (integrationMethod != null) 'integrationMethod': integrationMethod,
      if (integrationResponseSelectionExpression != null)
        'integrationResponseSelectionExpression':
            integrationResponseSelectionExpression,
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
  }
}

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
  final ContentHandlingStrategy? contentHandlingStrategy;

  /// The integration response ID.
  final String? integrationResponseId;

  /// The integration response key.
  final String? integrationResponseKey;

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
  final Map<String, String>? responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are represented
  /// as a key/value map, with a content-type as the key and a template as the
  /// value.
  final Map<String, String>? responseTemplates;

  /// The template selection expressions for the integration response.
  final String? templateSelectionExpression;

  GetIntegrationResponseResponse({
    this.contentHandlingStrategy,
    this.integrationResponseId,
    this.integrationResponseKey,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });

  factory GetIntegrationResponseResponse.fromJson(Map<String, dynamic> json) {
    return GetIntegrationResponseResponse(
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.toContentHandlingStrategy(),
      integrationResponseId: json['integrationResponseId'] as String?,
      integrationResponseKey: json['integrationResponseKey'] as String?,
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseTemplates: (json['responseTemplates'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templateSelectionExpression:
          json['templateSelectionExpression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentHandlingStrategy = this.contentHandlingStrategy;
    final integrationResponseId = this.integrationResponseId;
    final integrationResponseKey = this.integrationResponseKey;
    final responseParameters = this.responseParameters;
    final responseTemplates = this.responseTemplates;
    final templateSelectionExpression = this.templateSelectionExpression;
    return {
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.toValue(),
      if (integrationResponseId != null)
        'integrationResponseId': integrationResponseId,
      if (integrationResponseKey != null)
        'integrationResponseKey': integrationResponseKey,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (responseTemplates != null) 'responseTemplates': responseTemplates,
      if (templateSelectionExpression != null)
        'templateSelectionExpression': templateSelectionExpression,
    };
  }
}

class GetIntegrationResponsesResponse {
  /// The elements from this collection.
  final List<IntegrationResponse>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  GetIntegrationResponsesResponse({
    this.items,
    this.nextToken,
  });

  factory GetIntegrationResponsesResponse.fromJson(Map<String, dynamic> json) {
    return GetIntegrationResponsesResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => IntegrationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetIntegrationsResponse {
  /// The elements from this collection.
  final List<Integration>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  GetIntegrationsResponse({
    this.items,
    this.nextToken,
  });

  factory GetIntegrationsResponse.fromJson(Map<String, dynamic> json) {
    return GetIntegrationsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => Integration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetModelResponse {
  /// The content-type for the model, for example, "application/json".
  final String? contentType;

  /// The description of the model.
  final String? description;

  /// The model identifier.
  final String? modelId;

  /// The name of the model. Must be alphanumeric.
  final String? name;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  final String? schema;

  GetModelResponse({
    this.contentType,
    this.description,
    this.modelId,
    this.name,
    this.schema,
  });

  factory GetModelResponse.fromJson(Map<String, dynamic> json) {
    return GetModelResponse(
      contentType: json['contentType'] as String?,
      description: json['description'] as String?,
      modelId: json['modelId'] as String?,
      name: json['name'] as String?,
      schema: json['schema'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final description = this.description;
    final modelId = this.modelId;
    final name = this.name;
    final schema = this.schema;
    return {
      if (contentType != null) 'contentType': contentType,
      if (description != null) 'description': description,
      if (modelId != null) 'modelId': modelId,
      if (name != null) 'name': name,
      if (schema != null) 'schema': schema,
    };
  }
}

class GetModelTemplateResponse {
  /// The template value.
  final String? value;

  GetModelTemplateResponse({
    this.value,
  });

  factory GetModelTemplateResponse.fromJson(Map<String, dynamic> json) {
    return GetModelTemplateResponse(
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      if (value != null) 'value': value,
    };
  }
}

class GetModelsResponse {
  /// The elements from this collection.
  final List<Model>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  GetModelsResponse({
    this.items,
    this.nextToken,
  });

  factory GetModelsResponse.fromJson(Map<String, dynamic> json) {
    return GetModelsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetRouteResult {
  /// Specifies whether a route is managed by API Gateway. If you created an API
  /// using quick create, the $default route is managed by API Gateway. You can't
  /// modify the $default route key.
  final bool? apiGatewayManaged;

  /// Specifies whether an API key is required for this route. Supported only for
  /// WebSocket APIs.
  final bool? apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a JWT authorizer to authorize the method invocation. The authorization
  /// works by matching the route scopes against the scopes parsed from the access
  /// token in the incoming request. The method invocation is authorized if any
  /// route scope matches a claimed scope in the access token. Otherwise, the
  /// invocation is not authorized. When the route scope is configured, the client
  /// must provide an access token instead of an identity token for authorization
  /// purposes.
  final List<String>? authorizationScopes;

  /// The authorization type for the route. For WebSocket APIs, valid values are
  /// NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for
  /// using a Lambda authorizer For HTTP APIs, valid values are NONE for open
  /// access, JWT for using JSON Web Tokens, AWS_IAM for using AWS IAM
  /// permissions, and CUSTOM for using a Lambda authorizer.
  final AuthorizationType? authorizationType;

  /// The identifier of the Authorizer resource to be associated with this route.
  /// The authorizer identifier is generated by API Gateway when you created the
  /// authorizer.
  final String? authorizerId;

  /// The model selection expression for the route. Supported only for WebSocket
  /// APIs.
  final String? modelSelectionExpression;

  /// The operation name for the route.
  final String? operationName;

  /// The request models for the route. Supported only for WebSocket APIs.
  final Map<String, String>? requestModels;

  /// The request parameters for the route. Supported only for WebSocket APIs.
  final Map<String, ParameterConstraints>? requestParameters;

  /// The route ID.
  final String? routeId;

  /// The route key for the route.
  final String? routeKey;

  /// The route response selection expression for the route. Supported only for
  /// WebSocket APIs.
  final String? routeResponseSelectionExpression;

  /// The target for the route.
  final String? target;

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

  factory GetRouteResult.fromJson(Map<String, dynamic> json) {
    return GetRouteResult(
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      apiKeyRequired: json['apiKeyRequired'] as bool?,
      authorizationScopes: (json['authorizationScopes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      authorizationType:
          (json['authorizationType'] as String?)?.toAuthorizationType(),
      authorizerId: json['authorizerId'] as String?,
      modelSelectionExpression: json['modelSelectionExpression'] as String?,
      operationName: json['operationName'] as String?,
      requestModels: (json['requestModels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      requestParameters: (json['requestParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, ParameterConstraints.fromJson(e as Map<String, dynamic>))),
      routeId: json['routeId'] as String?,
      routeKey: json['routeKey'] as String?,
      routeResponseSelectionExpression:
          json['routeResponseSelectionExpression'] as String?,
      target: json['target'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayManaged = this.apiGatewayManaged;
    final apiKeyRequired = this.apiKeyRequired;
    final authorizationScopes = this.authorizationScopes;
    final authorizationType = this.authorizationType;
    final authorizerId = this.authorizerId;
    final modelSelectionExpression = this.modelSelectionExpression;
    final operationName = this.operationName;
    final requestModels = this.requestModels;
    final requestParameters = this.requestParameters;
    final routeId = this.routeId;
    final routeKey = this.routeKey;
    final routeResponseSelectionExpression =
        this.routeResponseSelectionExpression;
    final target = this.target;
    return {
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
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
      if (routeId != null) 'routeId': routeId,
      if (routeKey != null) 'routeKey': routeKey,
      if (routeResponseSelectionExpression != null)
        'routeResponseSelectionExpression': routeResponseSelectionExpression,
      if (target != null) 'target': target,
    };
  }
}

class GetRouteResponseResponse {
  /// Represents the model selection expression of a route response. Supported
  /// only for WebSocket APIs.
  final String? modelSelectionExpression;

  /// Represents the response models of a route response.
  final Map<String, String>? responseModels;

  /// Represents the response parameters of a route response.
  final Map<String, ParameterConstraints>? responseParameters;

  /// Represents the identifier of a route response.
  final String? routeResponseId;

  /// Represents the route response key of a route response.
  final String? routeResponseKey;

  GetRouteResponseResponse({
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseId,
    this.routeResponseKey,
  });

  factory GetRouteResponseResponse.fromJson(Map<String, dynamic> json) {
    return GetRouteResponseResponse(
      modelSelectionExpression: json['modelSelectionExpression'] as String?,
      responseModels: (json['responseModels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, ParameterConstraints.fromJson(e as Map<String, dynamic>))),
      routeResponseId: json['routeResponseId'] as String?,
      routeResponseKey: json['routeResponseKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelSelectionExpression = this.modelSelectionExpression;
    final responseModels = this.responseModels;
    final responseParameters = this.responseParameters;
    final routeResponseId = this.routeResponseId;
    final routeResponseKey = this.routeResponseKey;
    return {
      if (modelSelectionExpression != null)
        'modelSelectionExpression': modelSelectionExpression,
      if (responseModels != null) 'responseModels': responseModels,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (routeResponseId != null) 'routeResponseId': routeResponseId,
      if (routeResponseKey != null) 'routeResponseKey': routeResponseKey,
    };
  }
}

class GetRouteResponsesResponse {
  /// The elements from this collection.
  final List<RouteResponse>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  GetRouteResponsesResponse({
    this.items,
    this.nextToken,
  });

  factory GetRouteResponsesResponse.fromJson(Map<String, dynamic> json) {
    return GetRouteResponsesResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => RouteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetRoutesResponse {
  /// The elements from this collection.
  final List<Route>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  GetRoutesResponse({
    this.items,
    this.nextToken,
  });

  factory GetRoutesResponse.fromJson(Map<String, dynamic> json) {
    return GetRoutesResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => Route.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetStageResponse {
  /// Settings for logging access in this stage.
  final AccessLogSettings? accessLogSettings;

  /// Specifies whether a stage is managed by API Gateway. If you created an API
  /// using quick create, the $default stage is managed by API Gateway. You can't
  /// modify the $default stage.
  final bool? apiGatewayManaged;

  /// Specifies whether updates to an API automatically trigger a new deployment.
  /// The default value is false.
  final bool? autoDeploy;

  /// The identifier of a client certificate for a Stage. Supported only for
  /// WebSocket APIs.
  final String? clientCertificateId;

  /// The timestamp when the stage was created.
  final DateTime? createdDate;

  /// Default route settings for the stage.
  final RouteSettings? defaultRouteSettings;

  /// The identifier of the Deployment that the Stage is associated with. Can't be
  /// updated if autoDeploy is enabled.
  final String? deploymentId;

  /// The description of the stage.
  final String? description;

  /// Describes the status of the last deployment of a stage. Supported only for
  /// stages with autoDeploy enabled.
  final String? lastDeploymentStatusMessage;

  /// The timestamp when the stage was last updated.
  final DateTime? lastUpdatedDate;

  /// Route settings for the stage, by routeKey.
  final Map<String, RouteSettings>? routeSettings;

  /// The name of the stage.
  final String? stageName;

  /// A map that defines the stage variables for a stage resource. Variable names
  /// can have alphanumeric and underscore characters, and the values must match
  /// [A-Za-z0-9-._~:/?#&amp;=,]+.
  final Map<String, String>? stageVariables;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

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

  factory GetStageResponse.fromJson(Map<String, dynamic> json) {
    return GetStageResponse(
      accessLogSettings: json['accessLogSettings'] != null
          ? AccessLogSettings.fromJson(
              json['accessLogSettings'] as Map<String, dynamic>)
          : null,
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      autoDeploy: json['autoDeploy'] as bool?,
      clientCertificateId: json['clientCertificateId'] as String?,
      createdDate: timeStampFromJson(json['createdDate']),
      defaultRouteSettings: json['defaultRouteSettings'] != null
          ? RouteSettings.fromJson(
              json['defaultRouteSettings'] as Map<String, dynamic>)
          : null,
      deploymentId: json['deploymentId'] as String?,
      description: json['description'] as String?,
      lastDeploymentStatusMessage:
          json['lastDeploymentStatusMessage'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      routeSettings: (json['routeSettings'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, RouteSettings.fromJson(e as Map<String, dynamic>))),
      stageName: json['stageName'] as String?,
      stageVariables: (json['stageVariables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final accessLogSettings = this.accessLogSettings;
    final apiGatewayManaged = this.apiGatewayManaged;
    final autoDeploy = this.autoDeploy;
    final clientCertificateId = this.clientCertificateId;
    final createdDate = this.createdDate;
    final defaultRouteSettings = this.defaultRouteSettings;
    final deploymentId = this.deploymentId;
    final description = this.description;
    final lastDeploymentStatusMessage = this.lastDeploymentStatusMessage;
    final lastUpdatedDate = this.lastUpdatedDate;
    final routeSettings = this.routeSettings;
    final stageName = this.stageName;
    final stageVariables = this.stageVariables;
    final tags = this.tags;
    return {
      if (accessLogSettings != null) 'accessLogSettings': accessLogSettings,
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (autoDeploy != null) 'autoDeploy': autoDeploy,
      if (clientCertificateId != null)
        'clientCertificateId': clientCertificateId,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (defaultRouteSettings != null)
        'defaultRouteSettings': defaultRouteSettings,
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (description != null) 'description': description,
      if (lastDeploymentStatusMessage != null)
        'lastDeploymentStatusMessage': lastDeploymentStatusMessage,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      if (routeSettings != null) 'routeSettings': routeSettings,
      if (stageName != null) 'stageName': stageName,
      if (stageVariables != null) 'stageVariables': stageVariables,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetStagesResponse {
  /// The elements from this collection.
  final List<Stage>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  GetStagesResponse({
    this.items,
    this.nextToken,
  });

  factory GetStagesResponse.fromJson(Map<String, dynamic> json) {
    return GetStagesResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => Stage.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetTagsResponse {
  final Map<String, String>? tags;

  GetTagsResponse({
    this.tags,
  });

  factory GetTagsResponse.fromJson(Map<String, dynamic> json) {
    return GetTagsResponse(
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

class GetVpcLinkResponse {
  /// The timestamp when the VPC link was created.
  final DateTime? createdDate;

  /// The name of the VPC link.
  final String? name;

  /// A list of security group IDs for the VPC link.
  final List<String>? securityGroupIds;

  /// A list of subnet IDs to include in the VPC link.
  final List<String>? subnetIds;

  /// Tags for the VPC link.
  final Map<String, String>? tags;

  /// The ID of the VPC link.
  final String? vpcLinkId;

  /// The status of the VPC link.
  final VpcLinkStatus? vpcLinkStatus;

  /// A message summarizing the cause of the status of the VPC link.
  final String? vpcLinkStatusMessage;

  /// The version of the VPC link.
  final VpcLinkVersion? vpcLinkVersion;

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

  factory GetVpcLinkResponse.fromJson(Map<String, dynamic> json) {
    return GetVpcLinkResponse(
      createdDate: timeStampFromJson(json['createdDate']),
      name: json['name'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcLinkId: json['vpcLinkId'] as String?,
      vpcLinkStatus: (json['vpcLinkStatus'] as String?)?.toVpcLinkStatus(),
      vpcLinkStatusMessage: json['vpcLinkStatusMessage'] as String?,
      vpcLinkVersion: (json['vpcLinkVersion'] as String?)?.toVpcLinkVersion(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final name = this.name;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final tags = this.tags;
    final vpcLinkId = this.vpcLinkId;
    final vpcLinkStatus = this.vpcLinkStatus;
    final vpcLinkStatusMessage = this.vpcLinkStatusMessage;
    final vpcLinkVersion = this.vpcLinkVersion;
    return {
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (name != null) 'name': name,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (tags != null) 'tags': tags,
      if (vpcLinkId != null) 'vpcLinkId': vpcLinkId,
      if (vpcLinkStatus != null) 'vpcLinkStatus': vpcLinkStatus.toValue(),
      if (vpcLinkStatusMessage != null)
        'vpcLinkStatusMessage': vpcLinkStatusMessage,
      if (vpcLinkVersion != null) 'vpcLinkVersion': vpcLinkVersion.toValue(),
    };
  }
}

class GetVpcLinksResponse {
  /// A collection of VPC links.
  final List<VpcLink>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  GetVpcLinksResponse({
    this.items,
    this.nextToken,
  });

  factory GetVpcLinksResponse.fromJson(Map<String, dynamic> json) {
    return GetVpcLinksResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => VpcLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ImportApiResponse {
  /// The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com.
  /// The stage name is typically appended to this URI to form a complete path to
  /// a deployed API stage.
  final String? apiEndpoint;

  /// Specifies whether an API is managed by API Gateway. You can't update or
  /// delete a managed API by using API Gateway. A managed API can be deleted only
  /// through the tooling or service that created it.
  final bool? apiGatewayManaged;

  /// The API ID.
  final String? apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  final String? apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  final Cors? corsConfiguration;

  /// The timestamp when the API was created.
  final DateTime? createdDate;

  /// The description of the API.
  final String? description;

  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  final bool? disableExecuteApiEndpoint;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  final bool? disableSchemaValidation;

  /// The validation information during API import. This may include particular
  /// properties of your OpenAPI definition which are ignored during import.
  /// Supported only for HTTP APIs.
  final List<String>? importInfo;

  /// The name of the API.
  final String? name;

  /// The API protocol.
  final ProtocolType? protocolType;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  final String? routeSelectionExpression;

  /// A collection of tags associated with the API.
  final Map<String, String>? tags;

  /// A version identifier for the API.
  final String? version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  final List<String>? warnings;

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

  factory ImportApiResponse.fromJson(Map<String, dynamic> json) {
    return ImportApiResponse(
      apiEndpoint: json['apiEndpoint'] as String?,
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      apiId: json['apiId'] as String?,
      apiKeySelectionExpression: json['apiKeySelectionExpression'] as String?,
      corsConfiguration: json['corsConfiguration'] != null
          ? Cors.fromJson(json['corsConfiguration'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool?,
      disableSchemaValidation: json['disableSchemaValidation'] as bool?,
      importInfo: (json['importInfo'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      protocolType: (json['protocolType'] as String?)?.toProtocolType(),
      routeSelectionExpression: json['routeSelectionExpression'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final apiEndpoint = this.apiEndpoint;
    final apiGatewayManaged = this.apiGatewayManaged;
    final apiId = this.apiId;
    final apiKeySelectionExpression = this.apiKeySelectionExpression;
    final corsConfiguration = this.corsConfiguration;
    final createdDate = this.createdDate;
    final description = this.description;
    final disableExecuteApiEndpoint = this.disableExecuteApiEndpoint;
    final disableSchemaValidation = this.disableSchemaValidation;
    final importInfo = this.importInfo;
    final name = this.name;
    final protocolType = this.protocolType;
    final routeSelectionExpression = this.routeSelectionExpression;
    final tags = this.tags;
    final version = this.version;
    final warnings = this.warnings;
    return {
      if (apiEndpoint != null) 'apiEndpoint': apiEndpoint,
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (apiId != null) 'apiId': apiId,
      if (apiKeySelectionExpression != null)
        'apiKeySelectionExpression': apiKeySelectionExpression,
      if (corsConfiguration != null) 'corsConfiguration': corsConfiguration,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (description != null) 'description': description,
      if (disableExecuteApiEndpoint != null)
        'disableExecuteApiEndpoint': disableExecuteApiEndpoint,
      if (disableSchemaValidation != null)
        'disableSchemaValidation': disableSchemaValidation,
      if (importInfo != null) 'importInfo': importInfo,
      if (name != null) 'name': name,
      if (protocolType != null) 'protocolType': protocolType.toValue(),
      if (routeSelectionExpression != null)
        'routeSelectionExpression': routeSelectionExpression,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

/// Represents an integration.
class Integration {
  /// Specifies whether an integration is managed by API Gateway. If you created
  /// an API using using quick create, the resulting integration is managed by API
  /// Gateway. You can update a managed integration, but you can't delete it.
  final bool? apiGatewayManaged;

  /// The ID of the VPC link for a private integration. Supported only for HTTP
  /// APIs.
  final String? connectionId;

  /// The type of the network connection to the integration endpoint. Specify
  /// INTERNET for connections through the public routable internet or VPC_LINK
  /// for private connections between API Gateway and resources in a VPC. The
  /// default value is INTERNET.
  final ConnectionType? connectionType;

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
  final ContentHandlingStrategy? contentHandlingStrategy;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on supported
  /// AWS services, specify null.
  final String? credentialsArn;

  /// Represents the description of an integration.
  final String? description;

  /// Represents the identifier of an integration.
  final String? integrationId;

  /// Specifies the integration's HTTP method type.
  final String? integrationMethod;

  /// The integration response selection expression for the integration. Supported
  /// only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions">Integration
  /// Response Selection Expressions</a>.
  final String? integrationResponseSelectionExpression;

  /// Supported only for HTTP API AWS_PROXY integrations. Specifies the AWS
  /// service action to invoke. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services-reference.html">Integration
  /// subtype reference</a>.
  final String? integrationSubtype;

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
  final IntegrationType? integrationType;

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
  final String? integrationUri;

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
  final PassthroughBehavior? passthroughBehavior;

  /// Specifies the format of the payload sent to an integration. Required for
  /// HTTP APIs.
  final String? payloadFormatVersion;

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
  /// For HTTP API integrations, without a specified integrationSubtype request
  /// parameters are a key-value map specifying how to transform HTTP requests
  /// before sending them to backend integrations. The key should follow the
  /// pattern &lt;action&gt;:&lt;header|querystring|path&gt;.&lt;location&gt;. The
  /// action can be append, overwrite or remove. For values, you can provide
  /// static values, or map request data, stage variables, or context variables
  /// that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  final Map<String, String>? requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  final Map<String, String>? requestTemplates;

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
  final Map<String, Map<String, String>>? responseParameters;

  /// The template selection expression for the integration. Supported only for
  /// WebSocket APIs.
  final String? templateSelectionExpression;

  /// Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and
  /// between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29
  /// seconds for WebSocket APIs and 30 seconds for HTTP APIs.
  final int? timeoutInMillis;

  /// The TLS configuration for a private integration. If you specify a TLS
  /// configuration, private integration traffic uses the HTTPS protocol.
  /// Supported only for HTTP APIs.
  final TlsConfig? tlsConfig;

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

  factory Integration.fromJson(Map<String, dynamic> json) {
    return Integration(
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      connectionId: json['connectionId'] as String?,
      connectionType: (json['connectionType'] as String?)?.toConnectionType(),
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.toContentHandlingStrategy(),
      credentialsArn: json['credentialsArn'] as String?,
      description: json['description'] as String?,
      integrationId: json['integrationId'] as String?,
      integrationMethod: json['integrationMethod'] as String?,
      integrationResponseSelectionExpression:
          json['integrationResponseSelectionExpression'] as String?,
      integrationSubtype: json['integrationSubtype'] as String?,
      integrationType:
          (json['integrationType'] as String?)?.toIntegrationType(),
      integrationUri: json['integrationUri'] as String?,
      passthroughBehavior:
          (json['passthroughBehavior'] as String?)?.toPassthroughBehavior(),
      payloadFormatVersion: json['payloadFormatVersion'] as String?,
      requestParameters: (json['requestParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      requestTemplates: (json['requestTemplates'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))),
      templateSelectionExpression:
          json['templateSelectionExpression'] as String?,
      timeoutInMillis: json['timeoutInMillis'] as int?,
      tlsConfig: json['tlsConfig'] != null
          ? TlsConfig.fromJson(json['tlsConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayManaged = this.apiGatewayManaged;
    final connectionId = this.connectionId;
    final connectionType = this.connectionType;
    final contentHandlingStrategy = this.contentHandlingStrategy;
    final credentialsArn = this.credentialsArn;
    final description = this.description;
    final integrationId = this.integrationId;
    final integrationMethod = this.integrationMethod;
    final integrationResponseSelectionExpression =
        this.integrationResponseSelectionExpression;
    final integrationSubtype = this.integrationSubtype;
    final integrationType = this.integrationType;
    final integrationUri = this.integrationUri;
    final passthroughBehavior = this.passthroughBehavior;
    final payloadFormatVersion = this.payloadFormatVersion;
    final requestParameters = this.requestParameters;
    final requestTemplates = this.requestTemplates;
    final responseParameters = this.responseParameters;
    final templateSelectionExpression = this.templateSelectionExpression;
    final timeoutInMillis = this.timeoutInMillis;
    final tlsConfig = this.tlsConfig;
    return {
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (connectionId != null) 'connectionId': connectionId,
      if (connectionType != null) 'connectionType': connectionType.toValue(),
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.toValue(),
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (integrationId != null) 'integrationId': integrationId,
      if (integrationMethod != null) 'integrationMethod': integrationMethod,
      if (integrationResponseSelectionExpression != null)
        'integrationResponseSelectionExpression':
            integrationResponseSelectionExpression,
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
  }
}

/// Represents an integration response.
class IntegrationResponse {
  /// The integration response key.
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
  final ContentHandlingStrategy? contentHandlingStrategy;

  /// The integration response ID.
  final String? integrationResponseId;

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
  final Map<String, String>? responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are represented
  /// as a key/value map, with a content-type as the key and a template as the
  /// value.
  final Map<String, String>? responseTemplates;

  /// The template selection expressions for the integration response.
  final String? templateSelectionExpression;

  IntegrationResponse({
    required this.integrationResponseKey,
    this.contentHandlingStrategy,
    this.integrationResponseId,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });

  factory IntegrationResponse.fromJson(Map<String, dynamic> json) {
    return IntegrationResponse(
      integrationResponseKey: json['integrationResponseKey'] as String,
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.toContentHandlingStrategy(),
      integrationResponseId: json['integrationResponseId'] as String?,
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseTemplates: (json['responseTemplates'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templateSelectionExpression:
          json['templateSelectionExpression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final integrationResponseKey = this.integrationResponseKey;
    final contentHandlingStrategy = this.contentHandlingStrategy;
    final integrationResponseId = this.integrationResponseId;
    final responseParameters = this.responseParameters;
    final responseTemplates = this.responseTemplates;
    final templateSelectionExpression = this.templateSelectionExpression;
    return {
      'integrationResponseKey': integrationResponseKey,
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.toValue(),
      if (integrationResponseId != null)
        'integrationResponseId': integrationResponseId,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (responseTemplates != null) 'responseTemplates': responseTemplates,
      if (templateSelectionExpression != null)
        'templateSelectionExpression': templateSelectionExpression,
    };
  }
}

/// Represents an API method integration type.
enum IntegrationType {
  aws,
  http,
  mock,
  httpProxy,
  awsProxy,
}

extension IntegrationTypeValueExtension on IntegrationType {
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
  }
}

extension IntegrationTypeFromString on String {
  IntegrationType toIntegrationType() {
    switch (this) {
      case 'AWS':
        return IntegrationType.aws;
      case 'HTTP':
        return IntegrationType.http;
      case 'MOCK':
        return IntegrationType.mock;
      case 'HTTP_PROXY':
        return IntegrationType.httpProxy;
      case 'AWS_PROXY':
        return IntegrationType.awsProxy;
    }
    throw Exception('$this is not known in enum IntegrationType');
  }
}

/// Represents the configuration of a JWT authorizer. Required for the JWT
/// authorizer type. Supported only for HTTP APIs.
class JWTConfiguration {
  /// A list of the intended recipients of the JWT. A valid JWT must provide an
  /// aud that matches at least one entry in this list. See <a
  /// href="https://tools.ietf.org/html/rfc7519#section-4.1.3">RFC 7519</a>.
  /// Supported only for HTTP APIs.
  final List<String>? audience;

  /// The base domain of the identity provider that issues JSON Web Tokens. For
  /// example, an Amazon Cognito user pool has the following format:
  /// https://cognito-idp.<replaceable>{region}</replaceable>.amazonaws.com/<replaceable>{userPoolId}</replaceable>
  /// . Required for the JWT authorizer type. Supported only for HTTP APIs.
  final String? issuer;

  JWTConfiguration({
    this.audience,
    this.issuer,
  });

  factory JWTConfiguration.fromJson(Map<String, dynamic> json) {
    return JWTConfiguration(
      audience: (json['audience'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      issuer: json['issuer'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audience = this.audience;
    final issuer = this.issuer;
    return {
      if (audience != null) 'audience': audience,
      if (issuer != null) 'issuer': issuer,
    };
  }
}

/// The logging level.
enum LoggingLevel {
  error,
  info,
  off,
}

extension LoggingLevelValueExtension on LoggingLevel {
  String toValue() {
    switch (this) {
      case LoggingLevel.error:
        return 'ERROR';
      case LoggingLevel.info:
        return 'INFO';
      case LoggingLevel.off:
        return 'OFF';
    }
  }
}

extension LoggingLevelFromString on String {
  LoggingLevel toLoggingLevel() {
    switch (this) {
      case 'ERROR':
        return LoggingLevel.error;
      case 'INFO':
        return LoggingLevel.info;
      case 'OFF':
        return LoggingLevel.off;
    }
    throw Exception('$this is not known in enum LoggingLevel');
  }
}

/// Represents a data model for an API. Supported only for WebSocket APIs. See
/// <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html">Create
/// Models and Mapping Templates for Request and Response Mappings</a>.
class Model {
  /// The name of the model. Must be alphanumeric.
  final String name;

  /// The content-type for the model, for example, "application/json".
  final String? contentType;

  /// The description of the model.
  final String? description;

  /// The model identifier.
  final String? modelId;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  final String? schema;

  Model({
    required this.name,
    this.contentType,
    this.description,
    this.modelId,
    this.schema,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      name: json['name'] as String,
      contentType: json['contentType'] as String?,
      description: json['description'] as String?,
      modelId: json['modelId'] as String?,
      schema: json['schema'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final contentType = this.contentType;
    final description = this.description;
    final modelId = this.modelId;
    final schema = this.schema;
    return {
      'name': name,
      if (contentType != null) 'contentType': contentType,
      if (description != null) 'description': description,
      if (modelId != null) 'modelId': modelId,
      if (schema != null) 'schema': schema,
    };
  }
}

class MutualTlsAuthentication {
  /// An Amazon S3 URL that specifies the truststore for mutual TLS
  /// authentication, for example,
  /// s3://<replaceable>bucket-name</replaceable>/<replaceable>key-name</replaceable>.
  /// The truststore can contain certificates from public or private certificate
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final truststoreUri = this.truststoreUri;
    final truststoreVersion = this.truststoreVersion;
    final truststoreWarnings = this.truststoreWarnings;
    return {
      if (truststoreUri != null) 'truststoreUri': truststoreUri,
      if (truststoreVersion != null) 'truststoreVersion': truststoreVersion,
      if (truststoreWarnings != null) 'truststoreWarnings': truststoreWarnings,
    };
  }
}

class MutualTlsAuthenticationInput {
  /// An Amazon S3 URL that specifies the truststore for mutual TLS
  /// authentication, for example,
  /// s3://<replaceable>bucket-name</replaceable>/<replaceable>key-name</replaceable>.
  /// The truststore can contain certificates from public or private certificate
  /// authorities. To update the truststore, upload a new version to S3, and then
  /// update your custom domain name to use the new version. To update the
  /// truststore, you must have permissions to access the S3 object.
  final String? truststoreUri;

  /// The version of the S3 object that contains your truststore. To specify a
  /// version, you must have versioning enabled for the S3 bucket.
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

/// Validation constraints imposed on parameters of a request (path, query
/// string, headers).
class ParameterConstraints {
  /// Whether or not the parameter is required.
  final bool? required;

  ParameterConstraints({
    this.required,
  });

  factory ParameterConstraints.fromJson(Map<String, dynamic> json) {
    return ParameterConstraints(
      required: json['required'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final required = this.required;
    return {
      if (required != null) 'required': required,
    };
  }
}

/// Represents passthrough behavior for an integration response. Supported only
/// for WebSocket APIs.
enum PassthroughBehavior {
  whenNoMatch,
  never,
  whenNoTemplates,
}

extension PassthroughBehaviorValueExtension on PassthroughBehavior {
  String toValue() {
    switch (this) {
      case PassthroughBehavior.whenNoMatch:
        return 'WHEN_NO_MATCH';
      case PassthroughBehavior.never:
        return 'NEVER';
      case PassthroughBehavior.whenNoTemplates:
        return 'WHEN_NO_TEMPLATES';
    }
  }
}

extension PassthroughBehaviorFromString on String {
  PassthroughBehavior toPassthroughBehavior() {
    switch (this) {
      case 'WHEN_NO_MATCH':
        return PassthroughBehavior.whenNoMatch;
      case 'NEVER':
        return PassthroughBehavior.never;
      case 'WHEN_NO_TEMPLATES':
        return PassthroughBehavior.whenNoTemplates;
    }
    throw Exception('$this is not known in enum PassthroughBehavior');
  }
}

/// Represents a protocol type.
enum ProtocolType {
  websocket,
  http,
}

extension ProtocolTypeValueExtension on ProtocolType {
  String toValue() {
    switch (this) {
      case ProtocolType.websocket:
        return 'WEBSOCKET';
      case ProtocolType.http:
        return 'HTTP';
    }
  }
}

extension ProtocolTypeFromString on String {
  ProtocolType toProtocolType() {
    switch (this) {
      case 'WEBSOCKET':
        return ProtocolType.websocket;
      case 'HTTP':
        return ProtocolType.http;
    }
    throw Exception('$this is not known in enum ProtocolType');
  }
}

class ReimportApiResponse {
  /// The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com.
  /// The stage name is typically appended to this URI to form a complete path to
  /// a deployed API stage.
  final String? apiEndpoint;

  /// Specifies whether an API is managed by API Gateway. You can't update or
  /// delete a managed API by using API Gateway. A managed API can be deleted only
  /// through the tooling or service that created it.
  final bool? apiGatewayManaged;

  /// The API ID.
  final String? apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  final String? apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  final Cors? corsConfiguration;

  /// The timestamp when the API was created.
  final DateTime? createdDate;

  /// The description of the API.
  final String? description;

  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  final bool? disableExecuteApiEndpoint;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  final bool? disableSchemaValidation;

  /// The validation information during API import. This may include particular
  /// properties of your OpenAPI definition which are ignored during import.
  /// Supported only for HTTP APIs.
  final List<String>? importInfo;

  /// The name of the API.
  final String? name;

  /// The API protocol.
  final ProtocolType? protocolType;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  final String? routeSelectionExpression;

  /// A collection of tags associated with the API.
  final Map<String, String>? tags;

  /// A version identifier for the API.
  final String? version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  final List<String>? warnings;

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

  factory ReimportApiResponse.fromJson(Map<String, dynamic> json) {
    return ReimportApiResponse(
      apiEndpoint: json['apiEndpoint'] as String?,
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      apiId: json['apiId'] as String?,
      apiKeySelectionExpression: json['apiKeySelectionExpression'] as String?,
      corsConfiguration: json['corsConfiguration'] != null
          ? Cors.fromJson(json['corsConfiguration'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool?,
      disableSchemaValidation: json['disableSchemaValidation'] as bool?,
      importInfo: (json['importInfo'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      protocolType: (json['protocolType'] as String?)?.toProtocolType(),
      routeSelectionExpression: json['routeSelectionExpression'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final apiEndpoint = this.apiEndpoint;
    final apiGatewayManaged = this.apiGatewayManaged;
    final apiId = this.apiId;
    final apiKeySelectionExpression = this.apiKeySelectionExpression;
    final corsConfiguration = this.corsConfiguration;
    final createdDate = this.createdDate;
    final description = this.description;
    final disableExecuteApiEndpoint = this.disableExecuteApiEndpoint;
    final disableSchemaValidation = this.disableSchemaValidation;
    final importInfo = this.importInfo;
    final name = this.name;
    final protocolType = this.protocolType;
    final routeSelectionExpression = this.routeSelectionExpression;
    final tags = this.tags;
    final version = this.version;
    final warnings = this.warnings;
    return {
      if (apiEndpoint != null) 'apiEndpoint': apiEndpoint,
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (apiId != null) 'apiId': apiId,
      if (apiKeySelectionExpression != null)
        'apiKeySelectionExpression': apiKeySelectionExpression,
      if (corsConfiguration != null) 'corsConfiguration': corsConfiguration,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (description != null) 'description': description,
      if (disableExecuteApiEndpoint != null)
        'disableExecuteApiEndpoint': disableExecuteApiEndpoint,
      if (disableSchemaValidation != null)
        'disableSchemaValidation': disableSchemaValidation,
      if (importInfo != null) 'importInfo': importInfo,
      if (name != null) 'name': name,
      if (protocolType != null) 'protocolType': protocolType.toValue(),
      if (routeSelectionExpression != null)
        'routeSelectionExpression': routeSelectionExpression,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

/// Represents a route.
class Route {
  /// The route key for the route.
  final String routeKey;

  /// Specifies whether a route is managed by API Gateway. If you created an API
  /// using quick create, the $default route is managed by API Gateway. You can't
  /// modify the $default route key.
  final bool? apiGatewayManaged;

  /// Specifies whether an API key is required for this route. Supported only for
  /// WebSocket APIs.
  final bool? apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a JWT authorizer to authorize the method invocation. The authorization
  /// works by matching the route scopes against the scopes parsed from the access
  /// token in the incoming request. The method invocation is authorized if any
  /// route scope matches a claimed scope in the access token. Otherwise, the
  /// invocation is not authorized. When the route scope is configured, the client
  /// must provide an access token instead of an identity token for authorization
  /// purposes.
  final List<String>? authorizationScopes;

  /// The authorization type for the route. For WebSocket APIs, valid values are
  /// NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for
  /// using a Lambda authorizer For HTTP APIs, valid values are NONE for open
  /// access, JWT for using JSON Web Tokens, AWS_IAM for using AWS IAM
  /// permissions, and CUSTOM for using a Lambda authorizer.
  final AuthorizationType? authorizationType;

  /// The identifier of the Authorizer resource to be associated with this route.
  /// The authorizer identifier is generated by API Gateway when you created the
  /// authorizer.
  final String? authorizerId;

  /// The model selection expression for the route. Supported only for WebSocket
  /// APIs.
  final String? modelSelectionExpression;

  /// The operation name for the route.
  final String? operationName;

  /// The request models for the route. Supported only for WebSocket APIs.
  final Map<String, String>? requestModels;

  /// The request parameters for the route. Supported only for WebSocket APIs.
  final Map<String, ParameterConstraints>? requestParameters;

  /// The route ID.
  final String? routeId;

  /// The route response selection expression for the route. Supported only for
  /// WebSocket APIs.
  final String? routeResponseSelectionExpression;

  /// The target for the route.
  final String? target;

  Route({
    required this.routeKey,
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

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      routeKey: json['routeKey'] as String,
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      apiKeyRequired: json['apiKeyRequired'] as bool?,
      authorizationScopes: (json['authorizationScopes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      authorizationType:
          (json['authorizationType'] as String?)?.toAuthorizationType(),
      authorizerId: json['authorizerId'] as String?,
      modelSelectionExpression: json['modelSelectionExpression'] as String?,
      operationName: json['operationName'] as String?,
      requestModels: (json['requestModels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      requestParameters: (json['requestParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, ParameterConstraints.fromJson(e as Map<String, dynamic>))),
      routeId: json['routeId'] as String?,
      routeResponseSelectionExpression:
          json['routeResponseSelectionExpression'] as String?,
      target: json['target'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routeKey = this.routeKey;
    final apiGatewayManaged = this.apiGatewayManaged;
    final apiKeyRequired = this.apiKeyRequired;
    final authorizationScopes = this.authorizationScopes;
    final authorizationType = this.authorizationType;
    final authorizerId = this.authorizerId;
    final modelSelectionExpression = this.modelSelectionExpression;
    final operationName = this.operationName;
    final requestModels = this.requestModels;
    final requestParameters = this.requestParameters;
    final routeId = this.routeId;
    final routeResponseSelectionExpression =
        this.routeResponseSelectionExpression;
    final target = this.target;
    return {
      'routeKey': routeKey,
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
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
      if (routeId != null) 'routeId': routeId,
      if (routeResponseSelectionExpression != null)
        'routeResponseSelectionExpression': routeResponseSelectionExpression,
      if (target != null) 'target': target,
    };
  }
}

/// Represents a route response.
class RouteResponse {
  /// Represents the route response key of a route response.
  final String routeResponseKey;

  /// Represents the model selection expression of a route response. Supported
  /// only for WebSocket APIs.
  final String? modelSelectionExpression;

  /// Represents the response models of a route response.
  final Map<String, String>? responseModels;

  /// Represents the response parameters of a route response.
  final Map<String, ParameterConstraints>? responseParameters;

  /// Represents the identifier of a route response.
  final String? routeResponseId;

  RouteResponse({
    required this.routeResponseKey,
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseId,
  });

  factory RouteResponse.fromJson(Map<String, dynamic> json) {
    return RouteResponse(
      routeResponseKey: json['routeResponseKey'] as String,
      modelSelectionExpression: json['modelSelectionExpression'] as String?,
      responseModels: (json['responseModels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, ParameterConstraints.fromJson(e as Map<String, dynamic>))),
      routeResponseId: json['routeResponseId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routeResponseKey = this.routeResponseKey;
    final modelSelectionExpression = this.modelSelectionExpression;
    final responseModels = this.responseModels;
    final responseParameters = this.responseParameters;
    final routeResponseId = this.routeResponseId;
    return {
      'routeResponseKey': routeResponseKey,
      if (modelSelectionExpression != null)
        'modelSelectionExpression': modelSelectionExpression,
      if (responseModels != null) 'responseModels': responseModels,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (routeResponseId != null) 'routeResponseId': routeResponseId,
    };
  }
}

/// Represents a collection of route settings.
class RouteSettings {
  /// Specifies whether (true) or not (false) data trace logging is enabled for
  /// this route. This property affects the log entries pushed to Amazon
  /// CloudWatch Logs. Supported only for WebSocket APIs.
  final bool? dataTraceEnabled;

  /// Specifies whether detailed metrics are enabled.
  final bool? detailedMetricsEnabled;

  /// Specifies the logging level for this route: INFO, ERROR, or OFF. This
  /// property affects the log entries pushed to Amazon CloudWatch Logs. Supported
  /// only for WebSocket APIs.
  final LoggingLevel? loggingLevel;

  /// Specifies the throttling burst limit.
  final int? throttlingBurstLimit;

  /// Specifies the throttling rate limit.
  final double? throttlingRateLimit;

  RouteSettings({
    this.dataTraceEnabled,
    this.detailedMetricsEnabled,
    this.loggingLevel,
    this.throttlingBurstLimit,
    this.throttlingRateLimit,
  });

  factory RouteSettings.fromJson(Map<String, dynamic> json) {
    return RouteSettings(
      dataTraceEnabled: json['dataTraceEnabled'] as bool?,
      detailedMetricsEnabled: json['detailedMetricsEnabled'] as bool?,
      loggingLevel: (json['loggingLevel'] as String?)?.toLoggingLevel(),
      throttlingBurstLimit: json['throttlingBurstLimit'] as int?,
      throttlingRateLimit: json['throttlingRateLimit'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataTraceEnabled = this.dataTraceEnabled;
    final detailedMetricsEnabled = this.detailedMetricsEnabled;
    final loggingLevel = this.loggingLevel;
    final throttlingBurstLimit = this.throttlingBurstLimit;
    final throttlingRateLimit = this.throttlingRateLimit;
    return {
      if (dataTraceEnabled != null) 'dataTraceEnabled': dataTraceEnabled,
      if (detailedMetricsEnabled != null)
        'detailedMetricsEnabled': detailedMetricsEnabled,
      if (loggingLevel != null) 'loggingLevel': loggingLevel.toValue(),
      if (throttlingBurstLimit != null)
        'throttlingBurstLimit': throttlingBurstLimit,
      if (throttlingRateLimit != null)
        'throttlingRateLimit': throttlingRateLimit,
    };
  }
}

/// The Transport Layer Security (TLS) version of the security policy for this
/// domain name. The valid values are TLS_1_0 and TLS_1_2.
enum SecurityPolicy {
  tls_1_0,
  tls_1_2,
}

extension SecurityPolicyValueExtension on SecurityPolicy {
  String toValue() {
    switch (this) {
      case SecurityPolicy.tls_1_0:
        return 'TLS_1_0';
      case SecurityPolicy.tls_1_2:
        return 'TLS_1_2';
    }
  }
}

extension SecurityPolicyFromString on String {
  SecurityPolicy toSecurityPolicy() {
    switch (this) {
      case 'TLS_1_0':
        return SecurityPolicy.tls_1_0;
      case 'TLS_1_2':
        return SecurityPolicy.tls_1_2;
    }
    throw Exception('$this is not known in enum SecurityPolicy');
  }
}

/// Represents an API stage.
class Stage {
  /// The name of the stage.
  final String stageName;

  /// Settings for logging access in this stage.
  final AccessLogSettings? accessLogSettings;

  /// Specifies whether a stage is managed by API Gateway. If you created an API
  /// using quick create, the $default stage is managed by API Gateway. You can't
  /// modify the $default stage.
  final bool? apiGatewayManaged;

  /// Specifies whether updates to an API automatically trigger a new deployment.
  /// The default value is false.
  final bool? autoDeploy;

  /// The identifier of a client certificate for a Stage. Supported only for
  /// WebSocket APIs.
  final String? clientCertificateId;

  /// The timestamp when the stage was created.
  final DateTime? createdDate;

  /// Default route settings for the stage.
  final RouteSettings? defaultRouteSettings;

  /// The identifier of the Deployment that the Stage is associated with. Can't be
  /// updated if autoDeploy is enabled.
  final String? deploymentId;

  /// The description of the stage.
  final String? description;

  /// Describes the status of the last deployment of a stage. Supported only for
  /// stages with autoDeploy enabled.
  final String? lastDeploymentStatusMessage;

  /// The timestamp when the stage was last updated.
  final DateTime? lastUpdatedDate;

  /// Route settings for the stage, by routeKey.
  final Map<String, RouteSettings>? routeSettings;

  /// A map that defines the stage variables for a stage resource. Variable names
  /// can have alphanumeric and underscore characters, and the values must match
  /// [A-Za-z0-9-._~:/?#&amp;=,]+.
  final Map<String, String>? stageVariables;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  Stage({
    required this.stageName,
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

  factory Stage.fromJson(Map<String, dynamic> json) {
    return Stage(
      stageName: json['stageName'] as String,
      accessLogSettings: json['accessLogSettings'] != null
          ? AccessLogSettings.fromJson(
              json['accessLogSettings'] as Map<String, dynamic>)
          : null,
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      autoDeploy: json['autoDeploy'] as bool?,
      clientCertificateId: json['clientCertificateId'] as String?,
      createdDate: timeStampFromJson(json['createdDate']),
      defaultRouteSettings: json['defaultRouteSettings'] != null
          ? RouteSettings.fromJson(
              json['defaultRouteSettings'] as Map<String, dynamic>)
          : null,
      deploymentId: json['deploymentId'] as String?,
      description: json['description'] as String?,
      lastDeploymentStatusMessage:
          json['lastDeploymentStatusMessage'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      routeSettings: (json['routeSettings'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, RouteSettings.fromJson(e as Map<String, dynamic>))),
      stageVariables: (json['stageVariables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final stageName = this.stageName;
    final accessLogSettings = this.accessLogSettings;
    final apiGatewayManaged = this.apiGatewayManaged;
    final autoDeploy = this.autoDeploy;
    final clientCertificateId = this.clientCertificateId;
    final createdDate = this.createdDate;
    final defaultRouteSettings = this.defaultRouteSettings;
    final deploymentId = this.deploymentId;
    final description = this.description;
    final lastDeploymentStatusMessage = this.lastDeploymentStatusMessage;
    final lastUpdatedDate = this.lastUpdatedDate;
    final routeSettings = this.routeSettings;
    final stageVariables = this.stageVariables;
    final tags = this.tags;
    return {
      'stageName': stageName,
      if (accessLogSettings != null) 'accessLogSettings': accessLogSettings,
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (autoDeploy != null) 'autoDeploy': autoDeploy,
      if (clientCertificateId != null)
        'clientCertificateId': clientCertificateId,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (defaultRouteSettings != null)
        'defaultRouteSettings': defaultRouteSettings,
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (description != null) 'description': description,
      if (lastDeploymentStatusMessage != null)
        'lastDeploymentStatusMessage': lastDeploymentStatusMessage,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      if (routeSettings != null) 'routeSettings': routeSettings,
      if (stageVariables != null) 'stageVariables': stageVariables,
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

/// The TLS configuration for a private integration. If you specify a TLS
/// configuration, private integration traffic uses the HTTPS protocol.
/// Supported only for HTTP APIs.
class TlsConfig {
  /// If you specify a server name, API Gateway uses it to verify the hostname on
  /// the integration's certificate. The server name is also included in the TLS
  /// handshake to support Server Name Indication (SNI) or virtual hosting.
  final String? serverNameToVerify;

  TlsConfig({
    this.serverNameToVerify,
  });

  factory TlsConfig.fromJson(Map<String, dynamic> json) {
    return TlsConfig(
      serverNameToVerify: json['serverNameToVerify'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serverNameToVerify = this.serverNameToVerify;
    return {
      if (serverNameToVerify != null) 'serverNameToVerify': serverNameToVerify,
    };
  }
}

/// The TLS configuration for a private integration. If you specify a TLS
/// configuration, private integration traffic uses the HTTPS protocol.
/// Supported only for HTTP APIs.
class TlsConfigInput {
  /// If you specify a server name, API Gateway uses it to verify the hostname on
  /// the integration's certificate. The server name is also included in the TLS
  /// handshake to support Server Name Indication (SNI) or virtual hosting.
  final String? serverNameToVerify;

  TlsConfigInput({
    this.serverNameToVerify,
  });

  Map<String, dynamic> toJson() {
    final serverNameToVerify = this.serverNameToVerify;
    return {
      if (serverNameToVerify != null) 'serverNameToVerify': serverNameToVerify,
    };
  }
}

class UpdateApiMappingResponse {
  /// The API identifier.
  final String? apiId;

  /// The API mapping identifier.
  final String? apiMappingId;

  /// The API mapping key.
  final String? apiMappingKey;

  /// The API stage.
  final String? stage;

  UpdateApiMappingResponse({
    this.apiId,
    this.apiMappingId,
    this.apiMappingKey,
    this.stage,
  });

  factory UpdateApiMappingResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApiMappingResponse(
      apiId: json['apiId'] as String?,
      apiMappingId: json['apiMappingId'] as String?,
      apiMappingKey: json['apiMappingKey'] as String?,
      stage: json['stage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiId = this.apiId;
    final apiMappingId = this.apiMappingId;
    final apiMappingKey = this.apiMappingKey;
    final stage = this.stage;
    return {
      if (apiId != null) 'apiId': apiId,
      if (apiMappingId != null) 'apiMappingId': apiMappingId,
      if (apiMappingKey != null) 'apiMappingKey': apiMappingKey,
      if (stage != null) 'stage': stage,
    };
  }
}

class UpdateApiResponse {
  /// The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com.
  /// The stage name is typically appended to this URI to form a complete path to
  /// a deployed API stage.
  final String? apiEndpoint;

  /// Specifies whether an API is managed by API Gateway. You can't update or
  /// delete a managed API by using API Gateway. A managed API can be deleted only
  /// through the tooling or service that created it.
  final bool? apiGatewayManaged;

  /// The API ID.
  final String? apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  final String? apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  final Cors? corsConfiguration;

  /// The timestamp when the API was created.
  final DateTime? createdDate;

  /// The description of the API.
  final String? description;

  /// Specifies whether clients can invoke your API by using the default
  /// execute-api endpoint. By default, clients can invoke your API with the
  /// default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To
  /// require that clients use a custom domain name to invoke your API, disable
  /// the default endpoint.
  final bool? disableExecuteApiEndpoint;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  final bool? disableSchemaValidation;

  /// The validation information during API import. This may include particular
  /// properties of your OpenAPI definition which are ignored during import.
  /// Supported only for HTTP APIs.
  final List<String>? importInfo;

  /// The name of the API.
  final String? name;

  /// The API protocol.
  final ProtocolType? protocolType;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  final String? routeSelectionExpression;

  /// A collection of tags associated with the API.
  final Map<String, String>? tags;

  /// A version identifier for the API.
  final String? version;

  /// The warning messages reported when failonwarnings is turned on during API
  /// import.
  final List<String>? warnings;

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

  factory UpdateApiResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApiResponse(
      apiEndpoint: json['apiEndpoint'] as String?,
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      apiId: json['apiId'] as String?,
      apiKeySelectionExpression: json['apiKeySelectionExpression'] as String?,
      corsConfiguration: json['corsConfiguration'] != null
          ? Cors.fromJson(json['corsConfiguration'] as Map<String, dynamic>)
          : null,
      createdDate: timeStampFromJson(json['createdDate']),
      description: json['description'] as String?,
      disableExecuteApiEndpoint: json['disableExecuteApiEndpoint'] as bool?,
      disableSchemaValidation: json['disableSchemaValidation'] as bool?,
      importInfo: (json['importInfo'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      protocolType: (json['protocolType'] as String?)?.toProtocolType(),
      routeSelectionExpression: json['routeSelectionExpression'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final apiEndpoint = this.apiEndpoint;
    final apiGatewayManaged = this.apiGatewayManaged;
    final apiId = this.apiId;
    final apiKeySelectionExpression = this.apiKeySelectionExpression;
    final corsConfiguration = this.corsConfiguration;
    final createdDate = this.createdDate;
    final description = this.description;
    final disableExecuteApiEndpoint = this.disableExecuteApiEndpoint;
    final disableSchemaValidation = this.disableSchemaValidation;
    final importInfo = this.importInfo;
    final name = this.name;
    final protocolType = this.protocolType;
    final routeSelectionExpression = this.routeSelectionExpression;
    final tags = this.tags;
    final version = this.version;
    final warnings = this.warnings;
    return {
      if (apiEndpoint != null) 'apiEndpoint': apiEndpoint,
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (apiId != null) 'apiId': apiId,
      if (apiKeySelectionExpression != null)
        'apiKeySelectionExpression': apiKeySelectionExpression,
      if (corsConfiguration != null) 'corsConfiguration': corsConfiguration,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (description != null) 'description': description,
      if (disableExecuteApiEndpoint != null)
        'disableExecuteApiEndpoint': disableExecuteApiEndpoint,
      if (disableSchemaValidation != null)
        'disableSchemaValidation': disableSchemaValidation,
      if (importInfo != null) 'importInfo': importInfo,
      if (name != null) 'name': name,
      if (protocolType != null) 'protocolType': protocolType.toValue(),
      if (routeSelectionExpression != null)
        'routeSelectionExpression': routeSelectionExpression,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

class UpdateAuthorizerResponse {
  /// Specifies the required credentials as an IAM role for API Gateway to invoke
  /// the authorizer. To specify an IAM role for API Gateway to assume, use the
  /// role's Amazon Resource Name (ARN). To use resource-based permissions on the
  /// Lambda function, don't specify this parameter. Supported only for REQUEST
  /// authorizers.
  final String? authorizerCredentialsArn;

  /// The authorizer identifier.
  final String? authorizerId;

  /// Specifies the format of the payload sent to an HTTP API Lambda authorizer.
  /// Required for HTTP API Lambda authorizers. Supported values are 1.0 and 2.0.
  /// To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>.
  final String? authorizerPayloadFormatVersion;

  /// The time to live (TTL) for cached authorizer results, in seconds. If it
  /// equals 0, authorization caching is disabled. If it is greater than 0, API
  /// Gateway caches authorizer responses. The maximum value is 3600, or 1 hour.
  /// Supported only for HTTP API Lambda authorizers.
  final int? authorizerResultTtlInSeconds;

  /// The authorizer type. Specify REQUEST for a Lambda function using incoming
  /// request parameters. Specify JWT to use JSON Web Tokens (supported only for
  /// HTTP APIs).
  final AuthorizerType? authorizerType;

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
  final String? authorizerUri;

  /// Specifies whether a Lambda authorizer returns a response in a simple format.
  /// If enabled, the Lambda authorizer can return a boolean value instead of an
  /// IAM policy. Supported only for HTTP APIs. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-lambda-authorizer.html">Working
  /// with AWS Lambda authorizers for HTTP APIs</a>
  final bool? enableSimpleResponses;

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
  final List<String>? identitySource;

  /// The validation expression does not apply to the REQUEST authorizer.
  final String? identityValidationExpression;

  /// Represents the configuration of a JWT authorizer. Required for the JWT
  /// authorizer type. Supported only for HTTP APIs.
  final JWTConfiguration? jwtConfiguration;

  /// The name of the authorizer.
  final String? name;

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

  factory UpdateAuthorizerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAuthorizerResponse(
      authorizerCredentialsArn: json['authorizerCredentialsArn'] as String?,
      authorizerId: json['authorizerId'] as String?,
      authorizerPayloadFormatVersion:
          json['authorizerPayloadFormatVersion'] as String?,
      authorizerResultTtlInSeconds:
          json['authorizerResultTtlInSeconds'] as int?,
      authorizerType: (json['authorizerType'] as String?)?.toAuthorizerType(),
      authorizerUri: json['authorizerUri'] as String?,
      enableSimpleResponses: json['enableSimpleResponses'] as bool?,
      identitySource: (json['identitySource'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      identityValidationExpression:
          json['identityValidationExpression'] as String?,
      jwtConfiguration: json['jwtConfiguration'] != null
          ? JWTConfiguration.fromJson(
              json['jwtConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizerCredentialsArn = this.authorizerCredentialsArn;
    final authorizerId = this.authorizerId;
    final authorizerPayloadFormatVersion = this.authorizerPayloadFormatVersion;
    final authorizerResultTtlInSeconds = this.authorizerResultTtlInSeconds;
    final authorizerType = this.authorizerType;
    final authorizerUri = this.authorizerUri;
    final enableSimpleResponses = this.enableSimpleResponses;
    final identitySource = this.identitySource;
    final identityValidationExpression = this.identityValidationExpression;
    final jwtConfiguration = this.jwtConfiguration;
    final name = this.name;
    return {
      if (authorizerCredentialsArn != null)
        'authorizerCredentialsArn': authorizerCredentialsArn,
      if (authorizerId != null) 'authorizerId': authorizerId,
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
  }
}

class UpdateDeploymentResponse {
  /// Specifies whether a deployment was automatically released.
  final bool? autoDeployed;

  /// The date and time when the Deployment resource was created.
  final DateTime? createdDate;

  /// The identifier for the deployment.
  final String? deploymentId;

  /// The status of the deployment: PENDING, FAILED, or SUCCEEDED.
  final DeploymentStatus? deploymentStatus;

  /// May contain additional feedback on the status of an API deployment.
  final String? deploymentStatusMessage;

  /// The description for the deployment.
  final String? description;

  UpdateDeploymentResponse({
    this.autoDeployed,
    this.createdDate,
    this.deploymentId,
    this.deploymentStatus,
    this.deploymentStatusMessage,
    this.description,
  });

  factory UpdateDeploymentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDeploymentResponse(
      autoDeployed: json['autoDeployed'] as bool?,
      createdDate: timeStampFromJson(json['createdDate']),
      deploymentId: json['deploymentId'] as String?,
      deploymentStatus:
          (json['deploymentStatus'] as String?)?.toDeploymentStatus(),
      deploymentStatusMessage: json['deploymentStatusMessage'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoDeployed = this.autoDeployed;
    final createdDate = this.createdDate;
    final deploymentId = this.deploymentId;
    final deploymentStatus = this.deploymentStatus;
    final deploymentStatusMessage = this.deploymentStatusMessage;
    final description = this.description;
    return {
      if (autoDeployed != null) 'autoDeployed': autoDeployed,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (deploymentStatus != null)
        'deploymentStatus': deploymentStatus.toValue(),
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (description != null) 'description': description,
    };
  }
}

class UpdateDomainNameResponse {
  /// The API mapping selection expression.
  final String? apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String? domainName;

  /// The domain name configurations.
  final List<DomainNameConfiguration>? domainNameConfigurations;

  /// The mutual TLS authentication configuration for a custom domain name.
  final MutualTlsAuthentication? mutualTlsAuthentication;

  /// The collection of tags associated with a domain name.
  final Map<String, String>? tags;

  UpdateDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.mutualTlsAuthentication,
    this.tags,
  });

  factory UpdateDomainNameResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDomainNameResponse(
      apiMappingSelectionExpression:
          json['apiMappingSelectionExpression'] as String?,
      domainName: json['domainName'] as String?,
      domainNameConfigurations: (json['domainNameConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DomainNameConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      mutualTlsAuthentication: json['mutualTlsAuthentication'] != null
          ? MutualTlsAuthentication.fromJson(
              json['mutualTlsAuthentication'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final apiMappingSelectionExpression = this.apiMappingSelectionExpression;
    final domainName = this.domainName;
    final domainNameConfigurations = this.domainNameConfigurations;
    final mutualTlsAuthentication = this.mutualTlsAuthentication;
    final tags = this.tags;
    return {
      if (apiMappingSelectionExpression != null)
        'apiMappingSelectionExpression': apiMappingSelectionExpression,
      if (domainName != null) 'domainName': domainName,
      if (domainNameConfigurations != null)
        'domainNameConfigurations': domainNameConfigurations,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
      if (tags != null) 'tags': tags,
    };
  }
}

class UpdateIntegrationResult {
  /// Specifies whether an integration is managed by API Gateway. If you created
  /// an API using using quick create, the resulting integration is managed by API
  /// Gateway. You can update a managed integration, but you can't delete it.
  final bool? apiGatewayManaged;

  /// The ID of the VPC link for a private integration. Supported only for HTTP
  /// APIs.
  final String? connectionId;

  /// The type of the network connection to the integration endpoint. Specify
  /// INTERNET for connections through the public routable internet or VPC_LINK
  /// for private connections between API Gateway and resources in a VPC. The
  /// default value is INTERNET.
  final ConnectionType? connectionType;

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
  final ContentHandlingStrategy? contentHandlingStrategy;

  /// Specifies the credentials required for the integration, if any. For AWS
  /// integrations, three options are available. To specify an IAM Role for API
  /// Gateway to assume, use the role's Amazon Resource Name (ARN). To require
  /// that the caller's identity be passed through from the request, specify the
  /// string arn:aws:iam::*:user/*. To use resource-based permissions on supported
  /// AWS services, specify null.
  final String? credentialsArn;

  /// Represents the description of an integration.
  final String? description;

  /// Represents the identifier of an integration.
  final String? integrationId;

  /// Specifies the integration's HTTP method type.
  final String? integrationMethod;

  /// The integration response selection expression for the integration. Supported
  /// only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-integration-response-selection-expressions">Integration
  /// Response Selection Expressions</a>.
  final String? integrationResponseSelectionExpression;

  /// Supported only for HTTP API AWS_PROXY integrations. Specifies the AWS
  /// service action to invoke. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-aws-services-reference.html">Integration
  /// subtype reference</a>.
  final String? integrationSubtype;

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
  final IntegrationType? integrationType;

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
  final String? integrationUri;

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
  final PassthroughBehavior? passthroughBehavior;

  /// Specifies the format of the payload sent to an integration. Required for
  /// HTTP APIs.
  final String? payloadFormatVersion;

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
  /// For HTTP API integrations, without a specified integrationSubtype request
  /// parameters are a key-value map specifying how to transform HTTP requests
  /// before sending them to backend integrations. The key should follow the
  /// pattern &lt;action&gt;:&lt;header|querystring|path&gt;.&lt;location&gt;. The
  /// action can be append, overwrite or remove. For values, you can provide
  /// static values, or map request data, stage variables, or context variables
  /// that are evaluated at runtime. To learn more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-parameter-mapping.html">Transforming
  /// API requests and responses</a>.
  final Map<String, String>? requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  final Map<String, String>? requestTemplates;

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
  final Map<String, Map<String, String>>? responseParameters;

  /// The template selection expression for the integration. Supported only for
  /// WebSocket APIs.
  final String? templateSelectionExpression;

  /// Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and
  /// between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29
  /// seconds for WebSocket APIs and 30 seconds for HTTP APIs.
  final int? timeoutInMillis;

  /// The TLS configuration for a private integration. If you specify a TLS
  /// configuration, private integration traffic uses the HTTPS protocol.
  /// Supported only for HTTP APIs.
  final TlsConfig? tlsConfig;

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

  factory UpdateIntegrationResult.fromJson(Map<String, dynamic> json) {
    return UpdateIntegrationResult(
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      connectionId: json['connectionId'] as String?,
      connectionType: (json['connectionType'] as String?)?.toConnectionType(),
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.toContentHandlingStrategy(),
      credentialsArn: json['credentialsArn'] as String?,
      description: json['description'] as String?,
      integrationId: json['integrationId'] as String?,
      integrationMethod: json['integrationMethod'] as String?,
      integrationResponseSelectionExpression:
          json['integrationResponseSelectionExpression'] as String?,
      integrationSubtype: json['integrationSubtype'] as String?,
      integrationType:
          (json['integrationType'] as String?)?.toIntegrationType(),
      integrationUri: json['integrationUri'] as String?,
      passthroughBehavior:
          (json['passthroughBehavior'] as String?)?.toPassthroughBehavior(),
      payloadFormatVersion: json['payloadFormatVersion'] as String?,
      requestParameters: (json['requestParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      requestTemplates: (json['requestTemplates'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k,
              (e as Map<String, dynamic>)
                  .map((k, e) => MapEntry(k, e as String)))),
      templateSelectionExpression:
          json['templateSelectionExpression'] as String?,
      timeoutInMillis: json['timeoutInMillis'] as int?,
      tlsConfig: json['tlsConfig'] != null
          ? TlsConfig.fromJson(json['tlsConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayManaged = this.apiGatewayManaged;
    final connectionId = this.connectionId;
    final connectionType = this.connectionType;
    final contentHandlingStrategy = this.contentHandlingStrategy;
    final credentialsArn = this.credentialsArn;
    final description = this.description;
    final integrationId = this.integrationId;
    final integrationMethod = this.integrationMethod;
    final integrationResponseSelectionExpression =
        this.integrationResponseSelectionExpression;
    final integrationSubtype = this.integrationSubtype;
    final integrationType = this.integrationType;
    final integrationUri = this.integrationUri;
    final passthroughBehavior = this.passthroughBehavior;
    final payloadFormatVersion = this.payloadFormatVersion;
    final requestParameters = this.requestParameters;
    final requestTemplates = this.requestTemplates;
    final responseParameters = this.responseParameters;
    final templateSelectionExpression = this.templateSelectionExpression;
    final timeoutInMillis = this.timeoutInMillis;
    final tlsConfig = this.tlsConfig;
    return {
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (connectionId != null) 'connectionId': connectionId,
      if (connectionType != null) 'connectionType': connectionType.toValue(),
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.toValue(),
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (integrationId != null) 'integrationId': integrationId,
      if (integrationMethod != null) 'integrationMethod': integrationMethod,
      if (integrationResponseSelectionExpression != null)
        'integrationResponseSelectionExpression':
            integrationResponseSelectionExpression,
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
  }
}

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
  final ContentHandlingStrategy? contentHandlingStrategy;

  /// The integration response ID.
  final String? integrationResponseId;

  /// The integration response key.
  final String? integrationResponseKey;

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
  final Map<String, String>? responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are represented
  /// as a key/value map, with a content-type as the key and a template as the
  /// value.
  final Map<String, String>? responseTemplates;

  /// The template selection expressions for the integration response.
  final String? templateSelectionExpression;

  UpdateIntegrationResponseResponse({
    this.contentHandlingStrategy,
    this.integrationResponseId,
    this.integrationResponseKey,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });

  factory UpdateIntegrationResponseResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateIntegrationResponseResponse(
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.toContentHandlingStrategy(),
      integrationResponseId: json['integrationResponseId'] as String?,
      integrationResponseKey: json['integrationResponseKey'] as String?,
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseTemplates: (json['responseTemplates'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templateSelectionExpression:
          json['templateSelectionExpression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentHandlingStrategy = this.contentHandlingStrategy;
    final integrationResponseId = this.integrationResponseId;
    final integrationResponseKey = this.integrationResponseKey;
    final responseParameters = this.responseParameters;
    final responseTemplates = this.responseTemplates;
    final templateSelectionExpression = this.templateSelectionExpression;
    return {
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.toValue(),
      if (integrationResponseId != null)
        'integrationResponseId': integrationResponseId,
      if (integrationResponseKey != null)
        'integrationResponseKey': integrationResponseKey,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (responseTemplates != null) 'responseTemplates': responseTemplates,
      if (templateSelectionExpression != null)
        'templateSelectionExpression': templateSelectionExpression,
    };
  }
}

class UpdateModelResponse {
  /// The content-type for the model, for example, "application/json".
  final String? contentType;

  /// The description of the model.
  final String? description;

  /// The model identifier.
  final String? modelId;

  /// The name of the model. Must be alphanumeric.
  final String? name;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  final String? schema;

  UpdateModelResponse({
    this.contentType,
    this.description,
    this.modelId,
    this.name,
    this.schema,
  });

  factory UpdateModelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateModelResponse(
      contentType: json['contentType'] as String?,
      description: json['description'] as String?,
      modelId: json['modelId'] as String?,
      name: json['name'] as String?,
      schema: json['schema'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final description = this.description;
    final modelId = this.modelId;
    final name = this.name;
    final schema = this.schema;
    return {
      if (contentType != null) 'contentType': contentType,
      if (description != null) 'description': description,
      if (modelId != null) 'modelId': modelId,
      if (name != null) 'name': name,
      if (schema != null) 'schema': schema,
    };
  }
}

class UpdateRouteResult {
  /// Specifies whether a route is managed by API Gateway. If you created an API
  /// using quick create, the $default route is managed by API Gateway. You can't
  /// modify the $default route key.
  final bool? apiGatewayManaged;

  /// Specifies whether an API key is required for this route. Supported only for
  /// WebSocket APIs.
  final bool? apiKeyRequired;

  /// A list of authorization scopes configured on a route. The scopes are used
  /// with a JWT authorizer to authorize the method invocation. The authorization
  /// works by matching the route scopes against the scopes parsed from the access
  /// token in the incoming request. The method invocation is authorized if any
  /// route scope matches a claimed scope in the access token. Otherwise, the
  /// invocation is not authorized. When the route scope is configured, the client
  /// must provide an access token instead of an identity token for authorization
  /// purposes.
  final List<String>? authorizationScopes;

  /// The authorization type for the route. For WebSocket APIs, valid values are
  /// NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for
  /// using a Lambda authorizer For HTTP APIs, valid values are NONE for open
  /// access, JWT for using JSON Web Tokens, AWS_IAM for using AWS IAM
  /// permissions, and CUSTOM for using a Lambda authorizer.
  final AuthorizationType? authorizationType;

  /// The identifier of the Authorizer resource to be associated with this route.
  /// The authorizer identifier is generated by API Gateway when you created the
  /// authorizer.
  final String? authorizerId;

  /// The model selection expression for the route. Supported only for WebSocket
  /// APIs.
  final String? modelSelectionExpression;

  /// The operation name for the route.
  final String? operationName;

  /// The request models for the route. Supported only for WebSocket APIs.
  final Map<String, String>? requestModels;

  /// The request parameters for the route. Supported only for WebSocket APIs.
  final Map<String, ParameterConstraints>? requestParameters;

  /// The route ID.
  final String? routeId;

  /// The route key for the route.
  final String? routeKey;

  /// The route response selection expression for the route. Supported only for
  /// WebSocket APIs.
  final String? routeResponseSelectionExpression;

  /// The target for the route.
  final String? target;

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

  factory UpdateRouteResult.fromJson(Map<String, dynamic> json) {
    return UpdateRouteResult(
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      apiKeyRequired: json['apiKeyRequired'] as bool?,
      authorizationScopes: (json['authorizationScopes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      authorizationType:
          (json['authorizationType'] as String?)?.toAuthorizationType(),
      authorizerId: json['authorizerId'] as String?,
      modelSelectionExpression: json['modelSelectionExpression'] as String?,
      operationName: json['operationName'] as String?,
      requestModels: (json['requestModels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      requestParameters: (json['requestParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, ParameterConstraints.fromJson(e as Map<String, dynamic>))),
      routeId: json['routeId'] as String?,
      routeKey: json['routeKey'] as String?,
      routeResponseSelectionExpression:
          json['routeResponseSelectionExpression'] as String?,
      target: json['target'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayManaged = this.apiGatewayManaged;
    final apiKeyRequired = this.apiKeyRequired;
    final authorizationScopes = this.authorizationScopes;
    final authorizationType = this.authorizationType;
    final authorizerId = this.authorizerId;
    final modelSelectionExpression = this.modelSelectionExpression;
    final operationName = this.operationName;
    final requestModels = this.requestModels;
    final requestParameters = this.requestParameters;
    final routeId = this.routeId;
    final routeKey = this.routeKey;
    final routeResponseSelectionExpression =
        this.routeResponseSelectionExpression;
    final target = this.target;
    return {
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
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
      if (routeId != null) 'routeId': routeId,
      if (routeKey != null) 'routeKey': routeKey,
      if (routeResponseSelectionExpression != null)
        'routeResponseSelectionExpression': routeResponseSelectionExpression,
      if (target != null) 'target': target,
    };
  }
}

class UpdateRouteResponseResponse {
  /// Represents the model selection expression of a route response. Supported
  /// only for WebSocket APIs.
  final String? modelSelectionExpression;

  /// Represents the response models of a route response.
  final Map<String, String>? responseModels;

  /// Represents the response parameters of a route response.
  final Map<String, ParameterConstraints>? responseParameters;

  /// Represents the identifier of a route response.
  final String? routeResponseId;

  /// Represents the route response key of a route response.
  final String? routeResponseKey;

  UpdateRouteResponseResponse({
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseId,
    this.routeResponseKey,
  });

  factory UpdateRouteResponseResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRouteResponseResponse(
      modelSelectionExpression: json['modelSelectionExpression'] as String?,
      responseModels: (json['responseModels'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      responseParameters: (json['responseParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, ParameterConstraints.fromJson(e as Map<String, dynamic>))),
      routeResponseId: json['routeResponseId'] as String?,
      routeResponseKey: json['routeResponseKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelSelectionExpression = this.modelSelectionExpression;
    final responseModels = this.responseModels;
    final responseParameters = this.responseParameters;
    final routeResponseId = this.routeResponseId;
    final routeResponseKey = this.routeResponseKey;
    return {
      if (modelSelectionExpression != null)
        'modelSelectionExpression': modelSelectionExpression,
      if (responseModels != null) 'responseModels': responseModels,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (routeResponseId != null) 'routeResponseId': routeResponseId,
      if (routeResponseKey != null) 'routeResponseKey': routeResponseKey,
    };
  }
}

class UpdateStageResponse {
  /// Settings for logging access in this stage.
  final AccessLogSettings? accessLogSettings;

  /// Specifies whether a stage is managed by API Gateway. If you created an API
  /// using quick create, the $default stage is managed by API Gateway. You can't
  /// modify the $default stage.
  final bool? apiGatewayManaged;

  /// Specifies whether updates to an API automatically trigger a new deployment.
  /// The default value is false.
  final bool? autoDeploy;

  /// The identifier of a client certificate for a Stage. Supported only for
  /// WebSocket APIs.
  final String? clientCertificateId;

  /// The timestamp when the stage was created.
  final DateTime? createdDate;

  /// Default route settings for the stage.
  final RouteSettings? defaultRouteSettings;

  /// The identifier of the Deployment that the Stage is associated with. Can't be
  /// updated if autoDeploy is enabled.
  final String? deploymentId;

  /// The description of the stage.
  final String? description;

  /// Describes the status of the last deployment of a stage. Supported only for
  /// stages with autoDeploy enabled.
  final String? lastDeploymentStatusMessage;

  /// The timestamp when the stage was last updated.
  final DateTime? lastUpdatedDate;

  /// Route settings for the stage, by routeKey.
  final Map<String, RouteSettings>? routeSettings;

  /// The name of the stage.
  final String? stageName;

  /// A map that defines the stage variables for a stage resource. Variable names
  /// can have alphanumeric and underscore characters, and the values must match
  /// [A-Za-z0-9-._~:/?#&amp;=,]+.
  final Map<String, String>? stageVariables;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

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

  factory UpdateStageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateStageResponse(
      accessLogSettings: json['accessLogSettings'] != null
          ? AccessLogSettings.fromJson(
              json['accessLogSettings'] as Map<String, dynamic>)
          : null,
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      autoDeploy: json['autoDeploy'] as bool?,
      clientCertificateId: json['clientCertificateId'] as String?,
      createdDate: timeStampFromJson(json['createdDate']),
      defaultRouteSettings: json['defaultRouteSettings'] != null
          ? RouteSettings.fromJson(
              json['defaultRouteSettings'] as Map<String, dynamic>)
          : null,
      deploymentId: json['deploymentId'] as String?,
      description: json['description'] as String?,
      lastDeploymentStatusMessage:
          json['lastDeploymentStatusMessage'] as String?,
      lastUpdatedDate: timeStampFromJson(json['lastUpdatedDate']),
      routeSettings: (json['routeSettings'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, RouteSettings.fromJson(e as Map<String, dynamic>))),
      stageName: json['stageName'] as String?,
      stageVariables: (json['stageVariables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final accessLogSettings = this.accessLogSettings;
    final apiGatewayManaged = this.apiGatewayManaged;
    final autoDeploy = this.autoDeploy;
    final clientCertificateId = this.clientCertificateId;
    final createdDate = this.createdDate;
    final defaultRouteSettings = this.defaultRouteSettings;
    final deploymentId = this.deploymentId;
    final description = this.description;
    final lastDeploymentStatusMessage = this.lastDeploymentStatusMessage;
    final lastUpdatedDate = this.lastUpdatedDate;
    final routeSettings = this.routeSettings;
    final stageName = this.stageName;
    final stageVariables = this.stageVariables;
    final tags = this.tags;
    return {
      if (accessLogSettings != null) 'accessLogSettings': accessLogSettings,
      if (apiGatewayManaged != null) 'apiGatewayManaged': apiGatewayManaged,
      if (autoDeploy != null) 'autoDeploy': autoDeploy,
      if (clientCertificateId != null)
        'clientCertificateId': clientCertificateId,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (defaultRouteSettings != null)
        'defaultRouteSettings': defaultRouteSettings,
      if (deploymentId != null) 'deploymentId': deploymentId,
      if (description != null) 'description': description,
      if (lastDeploymentStatusMessage != null)
        'lastDeploymentStatusMessage': lastDeploymentStatusMessage,
      if (lastUpdatedDate != null)
        'lastUpdatedDate': iso8601ToJson(lastUpdatedDate),
      if (routeSettings != null) 'routeSettings': routeSettings,
      if (stageName != null) 'stageName': stageName,
      if (stageVariables != null) 'stageVariables': stageVariables,
      if (tags != null) 'tags': tags,
    };
  }
}

class UpdateVpcLinkResponse {
  /// The timestamp when the VPC link was created.
  final DateTime? createdDate;

  /// The name of the VPC link.
  final String? name;

  /// A list of security group IDs for the VPC link.
  final List<String>? securityGroupIds;

  /// A list of subnet IDs to include in the VPC link.
  final List<String>? subnetIds;

  /// Tags for the VPC link.
  final Map<String, String>? tags;

  /// The ID of the VPC link.
  final String? vpcLinkId;

  /// The status of the VPC link.
  final VpcLinkStatus? vpcLinkStatus;

  /// A message summarizing the cause of the status of the VPC link.
  final String? vpcLinkStatusMessage;

  /// The version of the VPC link.
  final VpcLinkVersion? vpcLinkVersion;

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

  factory UpdateVpcLinkResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVpcLinkResponse(
      createdDate: timeStampFromJson(json['createdDate']),
      name: json['name'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcLinkId: json['vpcLinkId'] as String?,
      vpcLinkStatus: (json['vpcLinkStatus'] as String?)?.toVpcLinkStatus(),
      vpcLinkStatusMessage: json['vpcLinkStatusMessage'] as String?,
      vpcLinkVersion: (json['vpcLinkVersion'] as String?)?.toVpcLinkVersion(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final name = this.name;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final tags = this.tags;
    final vpcLinkId = this.vpcLinkId;
    final vpcLinkStatus = this.vpcLinkStatus;
    final vpcLinkStatusMessage = this.vpcLinkStatusMessage;
    final vpcLinkVersion = this.vpcLinkVersion;
    return {
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (name != null) 'name': name,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (tags != null) 'tags': tags,
      if (vpcLinkId != null) 'vpcLinkId': vpcLinkId,
      if (vpcLinkStatus != null) 'vpcLinkStatus': vpcLinkStatus.toValue(),
      if (vpcLinkStatusMessage != null)
        'vpcLinkStatusMessage': vpcLinkStatusMessage,
      if (vpcLinkVersion != null) 'vpcLinkVersion': vpcLinkVersion.toValue(),
    };
  }
}

/// Represents a VPC link.
class VpcLink {
  /// The name of the VPC link.
  final String name;

  /// A list of security group IDs for the VPC link.
  final List<String> securityGroupIds;

  /// A list of subnet IDs to include in the VPC link.
  final List<String> subnetIds;

  /// The ID of the VPC link.
  final String vpcLinkId;

  /// The timestamp when the VPC link was created.
  final DateTime? createdDate;

  /// Tags for the VPC link.
  final Map<String, String>? tags;

  /// The status of the VPC link.
  final VpcLinkStatus? vpcLinkStatus;

  /// A message summarizing the cause of the status of the VPC link.
  final String? vpcLinkStatusMessage;

  /// The version of the VPC link.
  final VpcLinkVersion? vpcLinkVersion;

  VpcLink({
    required this.name,
    required this.securityGroupIds,
    required this.subnetIds,
    required this.vpcLinkId,
    this.createdDate,
    this.tags,
    this.vpcLinkStatus,
    this.vpcLinkStatusMessage,
    this.vpcLinkVersion,
  });

  factory VpcLink.fromJson(Map<String, dynamic> json) {
    return VpcLink(
      name: json['name'] as String,
      securityGroupIds: (json['securityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcLinkId: json['vpcLinkId'] as String,
      createdDate: timeStampFromJson(json['createdDate']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcLinkStatus: (json['vpcLinkStatus'] as String?)?.toVpcLinkStatus(),
      vpcLinkStatusMessage: json['vpcLinkStatusMessage'] as String?,
      vpcLinkVersion: (json['vpcLinkVersion'] as String?)?.toVpcLinkVersion(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcLinkId = this.vpcLinkId;
    final createdDate = this.createdDate;
    final tags = this.tags;
    final vpcLinkStatus = this.vpcLinkStatus;
    final vpcLinkStatusMessage = this.vpcLinkStatusMessage;
    final vpcLinkVersion = this.vpcLinkVersion;
    return {
      'name': name,
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
      'vpcLinkId': vpcLinkId,
      if (createdDate != null) 'createdDate': iso8601ToJson(createdDate),
      if (tags != null) 'tags': tags,
      if (vpcLinkStatus != null) 'vpcLinkStatus': vpcLinkStatus.toValue(),
      if (vpcLinkStatusMessage != null)
        'vpcLinkStatusMessage': vpcLinkStatusMessage,
      if (vpcLinkVersion != null) 'vpcLinkVersion': vpcLinkVersion.toValue(),
    };
  }
}

/// The status of the VPC link.
enum VpcLinkStatus {
  pending,
  available,
  deleting,
  failed,
  inactive,
}

extension VpcLinkStatusValueExtension on VpcLinkStatus {
  String toValue() {
    switch (this) {
      case VpcLinkStatus.pending:
        return 'PENDING';
      case VpcLinkStatus.available:
        return 'AVAILABLE';
      case VpcLinkStatus.deleting:
        return 'DELETING';
      case VpcLinkStatus.failed:
        return 'FAILED';
      case VpcLinkStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension VpcLinkStatusFromString on String {
  VpcLinkStatus toVpcLinkStatus() {
    switch (this) {
      case 'PENDING':
        return VpcLinkStatus.pending;
      case 'AVAILABLE':
        return VpcLinkStatus.available;
      case 'DELETING':
        return VpcLinkStatus.deleting;
      case 'FAILED':
        return VpcLinkStatus.failed;
      case 'INACTIVE':
        return VpcLinkStatus.inactive;
    }
    throw Exception('$this is not known in enum VpcLinkStatus');
  }
}

/// The version of the VPC link.
enum VpcLinkVersion {
  v2,
}

extension VpcLinkVersionValueExtension on VpcLinkVersion {
  String toValue() {
    switch (this) {
      case VpcLinkVersion.v2:
        return 'V2';
    }
  }
}

extension VpcLinkVersionFromString on String {
  VpcLinkVersion toVpcLinkVersion() {
    switch (this) {
      case 'V2':
        return VpcLinkVersion.v2;
    }
    throw Exception('$this is not known in enum VpcLinkVersion');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
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
