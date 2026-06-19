// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// Parameter [ipAddressType] :
  /// The IP address types that can invoke the API.
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
    IpAddressType? ipAddressType,
    String? routeKey,
    String? routeSelectionExpression,
    Map<String, String>? tags,
    String? target,
    String? version,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'protocolType': protocolType.value,
      if (apiKeySelectionExpression != null)
        'apiKeySelectionExpression': apiKeySelectionExpression,
      if (corsConfiguration != null) 'corsConfiguration': corsConfiguration,
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (disableExecuteApiEndpoint != null)
        'disableExecuteApiEndpoint': disableExecuteApiEndpoint,
      if (disableSchemaValidation != null)
        'disableSchemaValidation': disableSchemaValidation,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// /2015-03-31/functions/\[FunctionARN\]/invocations. Supported only for
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
      'authorizerType': authorizerType.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// Parameter [routingMode] :
  /// The routing mode.
  ///
  /// Parameter [tags] :
  /// The collection of tags associated with a domain name.
  Future<CreateDomainNameResponse> createDomainName({
    required String domainName,
    List<DomainNameConfiguration>? domainNameConfigurations,
    MutualTlsAuthenticationInput? mutualTlsAuthentication,
    RoutingMode? routingMode,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'domainName': domainName,
      if (domainNameConfigurations != null)
        'domainNameConfigurations': domainNameConfigurations,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
      if (routingMode != null) 'routingMode': routingMode.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// HTTP APIs. Supported values for Lambda proxy integrations are 1.0 and 2.0.
  /// For all other integrations, 1.0 is the only supported value. To learn
  /// more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-lambda.html">Working
  /// with AWS Lambda proxy integrations for HTTP APIs</a>.
  ///
  /// Parameter [requestParameters] :
  /// For WebSocket APIs, a key-value map specifying request parameters that are
  /// passed from the method request to the backend. The key is an integration
  /// request parameter name and the associated value is a method request
  /// parameter value or static value that must be enclosed within single quotes
  /// and pre-encoded as required by the backend. The method request parameter
  /// value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where <replaceable>{location}</replaceable> is querystring, path, or
  /// header; and <replaceable>{name}</replaceable> must be a valid and unique
  /// method request parameter name.
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
      'integrationType': integrationType.value,
      if (connectionId != null) 'connectionId': connectionId,
      if (connectionType != null) 'connectionType': connectionType.value,
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.value,
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (integrationMethod != null) 'integrationMethod': integrationMethod,
      if (integrationSubtype != null) 'integrationSubtype': integrationSubtype,
      if (integrationUri != null) 'integrationUri': integrationUri,
      if (passthroughBehavior != null)
        'passthroughBehavior': passthroughBehavior.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
        'contentHandlingStrategy': contentHandlingStrategy.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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

  /// Creates a portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [authorization] :
  /// The authentication configuration for the portal.
  ///
  /// Parameter [endpointConfiguration] :
  /// The domain configuration for the portal. Use a default domain provided by
  /// API Gateway or provide a fully-qualified domain name that you own.
  ///
  /// Parameter [portalContent] :
  /// The content of the portal.
  ///
  /// Parameter [includedPortalProductArns] :
  /// The ARNs of the portal products included in the portal.
  ///
  /// Parameter [logoUri] :
  /// The URI for the portal logo image that is displayed in the portal header.
  ///
  /// Parameter [rumAppMonitorName] :
  /// The name of the Amazon CloudWatch RUM app monitor for the portal.
  ///
  /// Parameter [tags] :
  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  Future<CreatePortalResponse> createPortal({
    required Authorization authorization,
    required EndpointConfigurationRequest endpointConfiguration,
    required PortalContent portalContent,
    List<String>? includedPortalProductArns,
    String? logoUri,
    String? rumAppMonitorName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'authorization': authorization,
      'endpointConfiguration': endpointConfiguration,
      'portalContent': portalContent,
      if (includedPortalProductArns != null)
        'includedPortalProductArns': includedPortalProductArns,
      if (logoUri != null) 'logoUri': logoUri,
      if (rumAppMonitorName != null) 'rumAppMonitorName': rumAppMonitorName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/portals',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePortalResponse.fromJson(response);
  }

  /// Creates a new portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [displayName] :
  /// The name of the portal product as it appears in a published portal.
  ///
  /// Parameter [description] :
  /// A description of the portal product.
  ///
  /// Parameter [tags] :
  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  Future<CreatePortalProductResponse> createPortalProduct({
    required String displayName,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'displayName': displayName,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/portalproducts',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePortalProductResponse.fromJson(response);
  }

  /// Creates a new product page for a portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [displayContent] :
  /// The content of the product page.
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  Future<CreateProductPageResponse> createProductPage({
    required DisplayContent displayContent,
    required String portalProductId,
  }) async {
    final $payload = <String, dynamic>{
      'displayContent': displayContent,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/productpages',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProductPageResponse.fromJson(response);
  }

  /// Creates a product REST endpoint page for a portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  ///
  /// Parameter [restEndpointIdentifier] :
  /// The REST endpoint identifier.
  ///
  /// Parameter [displayContent] :
  /// The content of the product REST endpoint page.
  ///
  /// Parameter [tryItState] :
  /// The try it state of the product REST endpoint page.
  Future<CreateProductRestEndpointPageResponse> createProductRestEndpointPage({
    required String portalProductId,
    required RestEndpointIdentifier restEndpointIdentifier,
    EndpointDisplayContent? displayContent,
    TryItState? tryItState,
  }) async {
    final $payload = <String, dynamic>{
      'restEndpointIdentifier': restEndpointIdentifier,
      if (displayContent != null) 'displayContent': displayContent,
      if (tryItState != null) 'tryItState': tryItState.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/productrestendpointpages',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProductRestEndpointPageResponse.fromJson(response);
  }

  /// Creates a Route for an API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
        'authorizationType': authorizationType.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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

  /// Creates a RoutingRule.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [actions] :
  /// Represents a routing rule action. The only supported action is invokeApi.
  ///
  /// Parameter [conditions] :
  /// Represents a condition. Conditions can contain up to two matchHeaders
  /// conditions and one matchBasePaths conditions. API Gateway evaluates header
  /// conditions and base path conditions together. You can only use AND between
  /// header and base path conditions.
  ///
  /// Parameter [domainName] :
  /// The domain name.
  ///
  /// Parameter [priority] :
  /// Represents the priority of the routing rule.
  ///
  /// Parameter [domainNameId] :
  /// The domain name ID.
  Future<CreateRoutingRuleResponse> createRoutingRule({
    required List<RoutingRuleAction> actions,
    required List<RoutingRuleCondition> conditions,
    required String domainName,
    required int priority,
    String? domainNameId,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      1,
      1000000,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (domainNameId != null) 'domainNameId': [domainNameId],
    };
    final $payload = <String, dynamic>{
      'actions': actions,
      'conditions': conditions,
      'priority': priority,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName)}/routingrules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateRoutingRuleResponse.fromJson(response);
  }

  /// Creates a Stage for an API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// \[A-Za-z0-9-._~:/?#&amp;=,\]+.
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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

  /// Deletes a portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalId] :
  /// The portal identifier.
  Future<void> deletePortal({
    required String portalId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/portals/${Uri.encodeComponent(portalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  Future<void> deletePortalProduct({
    required String portalProductId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the sharing policy for a portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  Future<void> deletePortalProductSharingPolicy({
    required String portalProductId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/sharingpolicy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a product page of a portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  ///
  /// Parameter [productPageId] :
  /// The portal product identifier.
  Future<void> deleteProductPage({
    required String portalProductId,
    required String productPageId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/productpages/${Uri.encodeComponent(productPageId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a product REST endpoint page.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  ///
  /// Parameter [productRestEndpointPageId] :
  /// The product REST endpoint identifier.
  Future<void> deleteProductRestEndpointPage({
    required String portalProductId,
    required String productRestEndpointPageId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/productrestendpointpages/${Uri.encodeComponent(productRestEndpointPageId)}',
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

  /// Deletes a routing rule.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The domain name.
  ///
  /// Parameter [routingRuleId] :
  /// The routing rule ID.
  ///
  /// Parameter [domainNameId] :
  /// The domain name ID.
  Future<void> deleteRoutingRule({
    required String domainName,
    required String routingRuleId,
    String? domainNameId,
  }) async {
    final $query = <String, List<String>>{
      if (domainNameId != null) 'domainNameId': [domainNameId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName)}/routingrules/${Uri.encodeComponent(routingRuleId)}',
      queryParams: $query,
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

  /// Deletes the publication of a portal portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalId] :
  /// The portal identifier.
  Future<void> disablePortal({
    required String portalId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2/portals/${Uri.encodeComponent(portalId)}/publish',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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

  /// Gets the Models for an API.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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

  /// Gets a portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalId] :
  /// The portal identifier.
  Future<GetPortalResponse> getPortal({
    required String portalId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/portals/${Uri.encodeComponent(portalId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPortalResponse.fromJson(response);
  }

  /// Gets a portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  ///
  /// Parameter [resourceOwnerAccountId] :
  /// The account ID of the resource owner of the portal product.
  Future<GetPortalProductResponse> getPortalProduct({
    required String portalProductId,
    String? resourceOwnerAccountId,
  }) async {
    final $query = <String, List<String>>{
      if (resourceOwnerAccountId != null)
        'resourceOwnerAccountId': [resourceOwnerAccountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPortalProductResponse.fromJson(response);
  }

  /// Gets the sharing policy for a portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  Future<GetPortalProductSharingPolicyResponse> getPortalProductSharingPolicy({
    required String portalProductId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/sharingpolicy',
      exceptionFnMap: _exceptionFns,
    );
    return GetPortalProductSharingPolicyResponse.fromJson(response);
  }

  /// Gets a product page of a portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  ///
  /// Parameter [productPageId] :
  /// The portal product identifier.
  ///
  /// Parameter [resourceOwnerAccountId] :
  /// The account ID of the resource owner of the portal product.
  Future<GetProductPageResponse> getProductPage({
    required String portalProductId,
    required String productPageId,
    String? resourceOwnerAccountId,
  }) async {
    final $query = <String, List<String>>{
      if (resourceOwnerAccountId != null)
        'resourceOwnerAccountId': [resourceOwnerAccountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/productpages/${Uri.encodeComponent(productPageId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetProductPageResponse.fromJson(response);
  }

  /// Gets a product REST endpoint page.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  ///
  /// Parameter [productRestEndpointPageId] :
  /// The product REST endpoint identifier.
  ///
  /// Parameter [includeRawDisplayContent] :
  /// The query parameter to include raw display content.
  ///
  /// Parameter [resourceOwnerAccountId] :
  /// The account ID of the resource owner of the portal product.
  Future<GetProductRestEndpointPageResponse> getProductRestEndpointPage({
    required String portalProductId,
    required String productRestEndpointPageId,
    String? includeRawDisplayContent,
    String? resourceOwnerAccountId,
  }) async {
    final $query = <String, List<String>>{
      if (includeRawDisplayContent != null)
        'includeRawDisplayContent': [includeRawDisplayContent],
      if (resourceOwnerAccountId != null)
        'resourceOwnerAccountId': [resourceOwnerAccountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/productrestendpointpages/${Uri.encodeComponent(productRestEndpointPageId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetProductRestEndpointPageResponse.fromJson(response);
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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

  /// Gets a routing rule.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The domain name.
  ///
  /// Parameter [routingRuleId] :
  /// The routing rule ID.
  ///
  /// Parameter [domainNameId] :
  /// The domain name ID.
  Future<GetRoutingRuleResponse> getRoutingRule({
    required String domainName,
    required String routingRuleId,
    String? domainNameId,
  }) async {
    final $query = <String, List<String>>{
      if (domainNameId != null) 'domainNameId': [domainNameId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName)}/routingrules/${Uri.encodeComponent(routingRuleId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRoutingRuleResponse.fromJson(response);
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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

  /// Lists portal products.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  ///
  /// Parameter [resourceOwner] :
  /// The resource owner of the portal product.
  Future<ListPortalProductsResponse> listPortalProducts({
    String? maxResults,
    String? nextToken,
    String? resourceOwner,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceOwner != null) 'resourceOwner': [resourceOwner],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/portalproducts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPortalProductsResponse.fromJson(response);
  }

  /// Lists portals.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<ListPortalsResponse> listPortals({
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
      requestUri: '/v2/portals',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPortalsResponse.fromJson(response);
  }

  /// Lists the product pages for a portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  ///
  /// Parameter [resourceOwnerAccountId] :
  /// The account ID of the resource owner of the portal product.
  Future<ListProductPagesResponse> listProductPages({
    required String portalProductId,
    String? maxResults,
    String? nextToken,
    String? resourceOwnerAccountId,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceOwnerAccountId != null)
        'resourceOwnerAccountId': [resourceOwnerAccountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/productpages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProductPagesResponse.fromJson(response);
  }

  /// Lists the product REST endpoint pages of a portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  ///
  /// Parameter [resourceOwnerAccountId] :
  /// The account ID of the resource owner of the portal product.
  Future<ListProductRestEndpointPagesResponse> listProductRestEndpointPages({
    required String portalProductId,
    String? maxResults,
    String? nextToken,
    String? resourceOwnerAccountId,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceOwnerAccountId != null)
        'resourceOwnerAccountId': [resourceOwnerAccountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/productrestendpointpages',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProductRestEndpointPagesResponse.fromJson(response);
  }

  /// Lists routing rules.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [domainName] :
  /// The domain name.
  ///
  /// Parameter [domainNameId] :
  /// The domain name ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of elements to be returned for this resource.
  ///
  /// Parameter [nextToken] :
  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  Future<ListRoutingRulesResponse> listRoutingRules({
    required String domainName,
    String? domainNameId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (domainNameId != null) 'domainNameId': [domainNameId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName)}/routingrules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRoutingRulesResponse.fromJson(response);
  }

  /// Creates a portal preview.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalId] :
  /// The portal identifier.
  Future<void> previewPortal({
    required String portalId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v2/portals/${Uri.encodeComponent(portalId)}/preview',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Publishes a portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalId] :
  /// The portal identifier.
  ///
  /// Parameter [description] :
  /// The description of the portal. When the portal is published, this
  /// description becomes the last published description.
  Future<void> publishPortal({
    required String portalId,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/portals/${Uri.encodeComponent(portalId)}/publish',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the sharing policy for a portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [policyDocument] :
  /// The product sharing policy.
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  Future<void> putPortalProductSharingPolicy({
    required String policyDocument,
    required String portalProductId,
  }) async {
    final $payload = <String, dynamic>{
      'policyDocument': policyDocument,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/sharingpolicy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a routing rule.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [actions] :
  /// The routing rule action.
  ///
  /// Parameter [conditions] :
  /// The routing rule condition.
  ///
  /// Parameter [domainName] :
  /// The domain name.
  ///
  /// Parameter [priority] :
  /// The routing rule priority.
  ///
  /// Parameter [routingRuleId] :
  /// The routing rule ID.
  ///
  /// Parameter [domainNameId] :
  /// The domain name ID.
  Future<PutRoutingRuleResponse> putRoutingRule({
    required List<RoutingRuleAction> actions,
    required List<RoutingRuleCondition> conditions,
    required String domainName,
    required int priority,
    required String routingRuleId,
    String? domainNameId,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      1,
      1000000,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (domainNameId != null) 'domainNameId': [domainNameId],
    };
    final $payload = <String, dynamic>{
      'actions': actions,
      'conditions': conditions,
      'priority': priority,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName)}/routingrules/${Uri.encodeComponent(routingRuleId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutRoutingRuleResponse.fromJson(response);
  }

  /// Puts an Api resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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

  /// Creates a new Tag resource to represent a tag.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// Parameter [ipAddressType] :
  /// The IP address types that can invoke your API or domain name.
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
    IpAddressType? ipAddressType,
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
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// /2015-03-31/functions/\[FunctionARN\]/invocations. Supported only for
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
      if (authorizerType != null) 'authorizerType': authorizerType.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// Parameter [routingMode] :
  /// The routing mode.
  Future<UpdateDomainNameResponse> updateDomainName({
    required String domainName,
    List<DomainNameConfiguration>? domainNameConfigurations,
    MutualTlsAuthenticationInput? mutualTlsAuthentication,
    RoutingMode? routingMode,
  }) async {
    final $payload = <String, dynamic>{
      if (domainNameConfigurations != null)
        'domainNameConfigurations': domainNameConfigurations,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
      if (routingMode != null) 'routingMode': routingMode.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
  /// HTTP APIs. Supported values for Lambda proxy integrations are 1.0 and 2.0.
  /// For all other integrations, 1.0 is the only supported value. To learn
  /// more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-lambda.html">Working
  /// with AWS Lambda proxy integrations for HTTP APIs</a>.
  ///
  /// Parameter [requestParameters] :
  /// For WebSocket APIs, a key-value map specifying request parameters that are
  /// passed from the method request to the backend. The key is an integration
  /// request parameter name and the associated value is a method request
  /// parameter value or static value that must be enclosed within single quotes
  /// and pre-encoded as required by the backend. The method request parameter
  /// value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where <replaceable>{location}</replaceable> is querystring, path, or
  /// header; and <replaceable>{name}</replaceable> must be a valid and unique
  /// method request parameter name.
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
      if (connectionType != null) 'connectionType': connectionType.value,
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.value,
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (integrationMethod != null) 'integrationMethod': integrationMethod,
      if (integrationSubtype != null) 'integrationSubtype': integrationSubtype,
      if (integrationType != null) 'integrationType': integrationType.value,
      if (integrationUri != null) 'integrationUri': integrationUri,
      if (passthroughBehavior != null)
        'passthroughBehavior': passthroughBehavior.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
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
  /// the pattern of method.response.header.<replaceable>{name}</replaceable> ,
  /// where name is a valid and unique header name. The mapped non-static value
  /// must match the pattern of
  /// integration.response.header.<replaceable>{name}</replaceable> or
  /// integration.response.body.<replaceable>{JSON-expression}</replaceable> ,
  /// where <replaceable>{name}</replaceable> is a valid and unique response
  /// header name and <replaceable>{JSON-expression}</replaceable> is a valid
  /// JSON expression without the $ prefix.
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
        'contentHandlingStrategy': contentHandlingStrategy.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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

  /// Updates a portal.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalId] :
  /// The portal identifier.
  ///
  /// Parameter [authorization] :
  /// The authorization of the portal.
  ///
  /// Parameter [endpointConfiguration] :
  /// Represents an endpoint configuration.
  ///
  /// Parameter [includedPortalProductArns] :
  /// The ARNs of the portal products included in the portal.
  ///
  /// Parameter [logoUri] :
  /// The logo URI.
  ///
  /// Parameter [portalContent] :
  /// Contains the content that is visible to portal consumers including the
  /// themes, display names, and description.
  ///
  /// Parameter [rumAppMonitorName] :
  /// The CloudWatch RUM app monitor name.
  Future<UpdatePortalResponse> updatePortal({
    required String portalId,
    Authorization? authorization,
    EndpointConfigurationRequest? endpointConfiguration,
    List<String>? includedPortalProductArns,
    String? logoUri,
    PortalContent? portalContent,
    String? rumAppMonitorName,
  }) async {
    final $payload = <String, dynamic>{
      if (authorization != null) 'authorization': authorization,
      if (endpointConfiguration != null)
        'endpointConfiguration': endpointConfiguration,
      if (includedPortalProductArns != null)
        'includedPortalProductArns': includedPortalProductArns,
      if (logoUri != null) 'logoUri': logoUri,
      if (portalContent != null) 'portalContent': portalContent,
      if (rumAppMonitorName != null) 'rumAppMonitorName': rumAppMonitorName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v2/portals/${Uri.encodeComponent(portalId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePortalResponse.fromJson(response);
  }

  /// Updates the portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  ///
  /// Parameter [description] :
  /// The description.
  ///
  /// Parameter [displayName] :
  /// The displayName.
  ///
  /// Parameter [displayOrder] :
  /// The display order.
  Future<UpdatePortalProductResponse> updatePortalProduct({
    required String portalProductId,
    String? description,
    String? displayName,
    DisplayOrder? displayOrder,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (displayOrder != null) 'displayOrder': displayOrder,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePortalProductResponse.fromJson(response);
  }

  /// Updates a product page of a portal product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  ///
  /// Parameter [productPageId] :
  /// The portal product identifier.
  ///
  /// Parameter [displayContent] :
  /// The content of the product page.
  Future<UpdateProductPageResponse> updateProductPage({
    required String portalProductId,
    required String productPageId,
    DisplayContent? displayContent,
  }) async {
    final $payload = <String, dynamic>{
      if (displayContent != null) 'displayContent': displayContent,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/productpages/${Uri.encodeComponent(productPageId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProductPageResponse.fromJson(response);
  }

  /// Updates a product REST endpoint page.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [portalProductId] :
  /// The portal product identifier.
  ///
  /// Parameter [productRestEndpointPageId] :
  /// The product REST endpoint identifier.
  ///
  /// Parameter [displayContent] :
  /// The display content.
  ///
  /// Parameter [tryItState] :
  /// The try it state of a product REST endpoint page.
  Future<UpdateProductRestEndpointPageResponse> updateProductRestEndpointPage({
    required String portalProductId,
    required String productRestEndpointPageId,
    EndpointDisplayContent? displayContent,
    TryItState? tryItState,
  }) async {
    final $payload = <String, dynamic>{
      if (displayContent != null) 'displayContent': displayContent,
      if (tryItState != null) 'tryItState': tryItState.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/portalproducts/${Uri.encodeComponent(portalProductId)}/productrestendpointpages/${Uri.encodeComponent(productRestEndpointPageId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProductRestEndpointPageResponse.fromJson(response);
  }

  /// Updates a Route.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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
        'authorizationType': authorizationType.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
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
  /// \[A-Za-z0-9-._~:/?#&amp;=,\]+.
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
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
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

/// @nodoc
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

  /// The IP address types that can invoke the API.
  final IpAddressType? ipAddressType;

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
    this.ipAddressType,
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ipAddressType:
          (json['ipAddressType'] as String?)?.let(IpAddressType.fromString),
      name: json['name'] as String?,
      protocolType:
          (json['protocolType'] as String?)?.let(ProtocolType.fromString),
      routeSelectionExpression: json['routeSelectionExpression'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.nonNulls
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
    final ipAddressType = this.ipAddressType;
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
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (name != null) 'name': name,
      if (protocolType != null) 'protocolType': protocolType.value,
      if (routeSelectionExpression != null)
        'routeSelectionExpression': routeSelectionExpression,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

/// @nodoc
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

/// @nodoc
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
  /// /2015-03-31/functions/\[FunctionARN\]/invocations. Supported only for
  /// REQUEST authorizers.
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
      authorizerType:
          (json['authorizerType'] as String?)?.let(AuthorizerType.fromString),
      authorizerUri: json['authorizerUri'] as String?,
      enableSimpleResponses: json['enableSimpleResponses'] as bool?,
      identitySource: (json['identitySource'] as List?)
          ?.nonNulls
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
      if (authorizerType != null) 'authorizerType': authorizerType.value,
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

/// @nodoc
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
      deploymentStatus: (json['deploymentStatus'] as String?)
          ?.let(DeploymentStatus.fromString),
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
      if (deploymentStatus != null) 'deploymentStatus': deploymentStatus.value,
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class CreateDomainNameResponse {
  /// The API mapping selection expression.
  final String? apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String? domainName;
  final String? domainNameArn;

  /// The domain name configurations.
  final List<DomainNameConfiguration>? domainNameConfigurations;

  /// The mutual TLS authentication configuration for a custom domain name.
  final MutualTlsAuthentication? mutualTlsAuthentication;

  /// The routing mode.
  final RoutingMode? routingMode;

  /// The collection of tags associated with a domain name.
  final Map<String, String>? tags;

  CreateDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameArn,
    this.domainNameConfigurations,
    this.mutualTlsAuthentication,
    this.routingMode,
    this.tags,
  });

  factory CreateDomainNameResponse.fromJson(Map<String, dynamic> json) {
    return CreateDomainNameResponse(
      apiMappingSelectionExpression:
          json['apiMappingSelectionExpression'] as String?,
      domainName: json['domainName'] as String?,
      domainNameArn: json['domainNameArn'] as String?,
      domainNameConfigurations: (json['domainNameConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              DomainNameConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      mutualTlsAuthentication: json['mutualTlsAuthentication'] != null
          ? MutualTlsAuthentication.fromJson(
              json['mutualTlsAuthentication'] as Map<String, dynamic>)
          : null,
      routingMode:
          (json['routingMode'] as String?)?.let(RoutingMode.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final apiMappingSelectionExpression = this.apiMappingSelectionExpression;
    final domainName = this.domainName;
    final domainNameArn = this.domainNameArn;
    final domainNameConfigurations = this.domainNameConfigurations;
    final mutualTlsAuthentication = this.mutualTlsAuthentication;
    final routingMode = this.routingMode;
    final tags = this.tags;
    return {
      if (apiMappingSelectionExpression != null)
        'apiMappingSelectionExpression': apiMappingSelectionExpression,
      if (domainName != null) 'domainName': domainName,
      if (domainNameArn != null) 'domainNameArn': domainNameArn,
      if (domainNameConfigurations != null)
        'domainNameConfigurations': domainNameConfigurations,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
      if (routingMode != null) 'routingMode': routingMode.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
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
  /// HTTP APIs. Supported values for Lambda proxy integrations are 1.0 and 2.0.
  /// For all other integrations, 1.0 is the only supported value. To learn more,
  /// see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-lambda.html">Working
  /// with AWS Lambda proxy integrations for HTTP APIs</a>.
  final String? payloadFormatVersion;

  /// For WebSocket APIs, a key-value map specifying request parameters that are
  /// passed from the method request to the backend. The key is an integration
  /// request parameter name and the associated value is a method request
  /// parameter value or static value that must be enclosed within single quotes
  /// and pre-encoded as required by the backend. The method request parameter
  /// value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where <replaceable>{location}</replaceable> is querystring, path, or
  /// header; and <replaceable>{name}</replaceable> must be a valid and unique
  /// method request parameter name.
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
      connectionType:
          (json['connectionType'] as String?)?.let(ConnectionType.fromString),
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.let(ContentHandlingStrategy.fromString),
      credentialsArn: json['credentialsArn'] as String?,
      description: json['description'] as String?,
      integrationId: json['integrationId'] as String?,
      integrationMethod: json['integrationMethod'] as String?,
      integrationResponseSelectionExpression:
          json['integrationResponseSelectionExpression'] as String?,
      integrationSubtype: json['integrationSubtype'] as String?,
      integrationType:
          (json['integrationType'] as String?)?.let(IntegrationType.fromString),
      integrationUri: json['integrationUri'] as String?,
      passthroughBehavior: (json['passthroughBehavior'] as String?)
          ?.let(PassthroughBehavior.fromString),
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
      if (connectionType != null) 'connectionType': connectionType.value,
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.value,
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (integrationId != null) 'integrationId': integrationId,
      if (integrationMethod != null) 'integrationMethod': integrationMethod,
      if (integrationResponseSelectionExpression != null)
        'integrationResponseSelectionExpression':
            integrationResponseSelectionExpression,
      if (integrationSubtype != null) 'integrationSubtype': integrationSubtype,
      if (integrationType != null) 'integrationType': integrationType.value,
      if (integrationUri != null) 'integrationUri': integrationUri,
      if (passthroughBehavior != null)
        'passthroughBehavior': passthroughBehavior.value,
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

/// @nodoc
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
          ?.let(ContentHandlingStrategy.fromString),
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
        'contentHandlingStrategy': contentHandlingStrategy.value,
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

/// @nodoc
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

/// @nodoc
class CreatePortalResponse {
  /// The authorization for the portal. Supports Cognito-based user authentication
  /// or no authentication.
  final Authorization? authorization;

  /// The endpoint configuration.
  final EndpointConfigurationResponse? endpointConfiguration;

  /// The ARNs of the portal products included in the portal.
  final List<String>? includedPortalProductArns;

  /// The timestamp when the portal configuration was last modified.
  final DateTime? lastModified;

  /// The timestamp when the portal was last published.
  final DateTime? lastPublished;

  /// A user-written description of the changes made in the last published version
  /// of the portal.
  final String? lastPublishedDescription;

  /// The ARN of the portal.
  final String? portalArn;

  /// The name, description, and theme for the portal.
  final PortalContent? portalContent;

  /// The portal identifier.
  final String? portalId;

  /// The current publishing status of the portal.
  final PublishStatus? publishStatus;

  /// The name of the Amazon CloudWatch RUM app monitor.
  final String? rumAppMonitorName;

  /// Error information for failed portal operations. Contains details about any
  /// issues encountered during portal creation or publishing.
  final StatusException? statusException;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  CreatePortalResponse({
    this.authorization,
    this.endpointConfiguration,
    this.includedPortalProductArns,
    this.lastModified,
    this.lastPublished,
    this.lastPublishedDescription,
    this.portalArn,
    this.portalContent,
    this.portalId,
    this.publishStatus,
    this.rumAppMonitorName,
    this.statusException,
    this.tags,
  });

  factory CreatePortalResponse.fromJson(Map<String, dynamic> json) {
    return CreatePortalResponse(
      authorization: json['authorization'] != null
          ? Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>)
          : null,
      endpointConfiguration: json['endpointConfiguration'] != null
          ? EndpointConfigurationResponse.fromJson(
              json['endpointConfiguration'] as Map<String, dynamic>)
          : null,
      includedPortalProductArns: (json['includedPortalProductArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      lastModified: timeStampFromJson(json['lastModified']),
      lastPublished: timeStampFromJson(json['lastPublished']),
      lastPublishedDescription: json['lastPublishedDescription'] as String?,
      portalArn: json['portalArn'] as String?,
      portalContent: json['portalContent'] != null
          ? PortalContent.fromJson(
              json['portalContent'] as Map<String, dynamic>)
          : null,
      portalId: json['portalId'] as String?,
      publishStatus:
          (json['publishStatus'] as String?)?.let(PublishStatus.fromString),
      rumAppMonitorName: json['rumAppMonitorName'] as String?,
      statusException: json['statusException'] != null
          ? StatusException.fromJson(
              json['statusException'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final authorization = this.authorization;
    final endpointConfiguration = this.endpointConfiguration;
    final includedPortalProductArns = this.includedPortalProductArns;
    final lastModified = this.lastModified;
    final lastPublished = this.lastPublished;
    final lastPublishedDescription = this.lastPublishedDescription;
    final portalArn = this.portalArn;
    final portalContent = this.portalContent;
    final portalId = this.portalId;
    final publishStatus = this.publishStatus;
    final rumAppMonitorName = this.rumAppMonitorName;
    final statusException = this.statusException;
    final tags = this.tags;
    return {
      if (authorization != null) 'authorization': authorization,
      if (endpointConfiguration != null)
        'endpointConfiguration': endpointConfiguration,
      if (includedPortalProductArns != null)
        'includedPortalProductArns': includedPortalProductArns,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (lastPublished != null) 'lastPublished': iso8601ToJson(lastPublished),
      if (lastPublishedDescription != null)
        'lastPublishedDescription': lastPublishedDescription,
      if (portalArn != null) 'portalArn': portalArn,
      if (portalContent != null) 'portalContent': portalContent,
      if (portalId != null) 'portalId': portalId,
      if (publishStatus != null) 'publishStatus': publishStatus.value,
      if (rumAppMonitorName != null) 'rumAppMonitorName': rumAppMonitorName,
      if (statusException != null) 'statusException': statusException,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class CreatePortalProductResponse {
  /// A description of the portal product.
  final String? description;

  /// The display name for the portal product.
  final String? displayName;

  /// The visual ordering of the product pages and product REST endpoint pages in
  /// a published portal.
  final DisplayOrder? displayOrder;

  /// The timestamp when the portal product was last modified.
  final DateTime? lastModified;

  /// The ARN of the portal product.
  final String? portalProductArn;

  /// The portal product identifier.
  final String? portalProductId;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  CreatePortalProductResponse({
    this.description,
    this.displayName,
    this.displayOrder,
    this.lastModified,
    this.portalProductArn,
    this.portalProductId,
    this.tags,
  });

  factory CreatePortalProductResponse.fromJson(Map<String, dynamic> json) {
    return CreatePortalProductResponse(
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      displayOrder: json['displayOrder'] != null
          ? DisplayOrder.fromJson(json['displayOrder'] as Map<String, dynamic>)
          : null,
      lastModified: timeStampFromJson(json['lastModified']),
      portalProductArn: json['portalProductArn'] as String?,
      portalProductId: json['portalProductId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final displayOrder = this.displayOrder;
    final lastModified = this.lastModified;
    final portalProductArn = this.portalProductArn;
    final portalProductId = this.portalProductId;
    final tags = this.tags;
    return {
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (displayOrder != null) 'displayOrder': displayOrder,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (portalProductArn != null) 'portalProductArn': portalProductArn,
      if (portalProductId != null) 'portalProductId': portalProductId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class CreateProductPageResponse {
  /// The content of the product page.
  final DisplayContent? displayContent;

  /// The timestamp when the product page was last modified.
  final DateTime? lastModified;

  /// The ARN of the product page.
  final String? productPageArn;

  /// The product page identifier.
  final String? productPageId;

  CreateProductPageResponse({
    this.displayContent,
    this.lastModified,
    this.productPageArn,
    this.productPageId,
  });

  factory CreateProductPageResponse.fromJson(Map<String, dynamic> json) {
    return CreateProductPageResponse(
      displayContent: json['displayContent'] != null
          ? DisplayContent.fromJson(
              json['displayContent'] as Map<String, dynamic>)
          : null,
      lastModified: timeStampFromJson(json['lastModified']),
      productPageArn: json['productPageArn'] as String?,
      productPageId: json['productPageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayContent = this.displayContent;
    final lastModified = this.lastModified;
    final productPageArn = this.productPageArn;
    final productPageId = this.productPageId;
    return {
      if (displayContent != null) 'displayContent': displayContent,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (productPageArn != null) 'productPageArn': productPageArn,
      if (productPageId != null) 'productPageId': productPageId,
    };
  }
}

/// @nodoc
class CreateProductRestEndpointPageResponse {
  /// The display content.
  final EndpointDisplayContentResponse? displayContent;

  /// The timestamp when the product REST endpoint page was last modified.
  final DateTime? lastModified;

  /// The ARN of the product REST endpoint page.
  final String? productRestEndpointPageArn;

  /// The product REST endpoint page identifier.
  final String? productRestEndpointPageId;

  /// The REST endpoint identifier.
  final RestEndpointIdentifier? restEndpointIdentifier;

  /// The status.
  final Status? status;

  /// The status exception information.
  final StatusException? statusException;

  /// The try it state.
  final TryItState? tryItState;

  CreateProductRestEndpointPageResponse({
    this.displayContent,
    this.lastModified,
    this.productRestEndpointPageArn,
    this.productRestEndpointPageId,
    this.restEndpointIdentifier,
    this.status,
    this.statusException,
    this.tryItState,
  });

  factory CreateProductRestEndpointPageResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateProductRestEndpointPageResponse(
      displayContent: json['displayContent'] != null
          ? EndpointDisplayContentResponse.fromJson(
              json['displayContent'] as Map<String, dynamic>)
          : null,
      lastModified: timeStampFromJson(json['lastModified']),
      productRestEndpointPageArn: json['productRestEndpointPageArn'] as String?,
      productRestEndpointPageId: json['productRestEndpointPageId'] as String?,
      restEndpointIdentifier: json['restEndpointIdentifier'] != null
          ? RestEndpointIdentifier.fromJson(
              json['restEndpointIdentifier'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(Status.fromString),
      statusException: json['statusException'] != null
          ? StatusException.fromJson(
              json['statusException'] as Map<String, dynamic>)
          : null,
      tryItState: (json['tryItState'] as String?)?.let(TryItState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final displayContent = this.displayContent;
    final lastModified = this.lastModified;
    final productRestEndpointPageArn = this.productRestEndpointPageArn;
    final productRestEndpointPageId = this.productRestEndpointPageId;
    final restEndpointIdentifier = this.restEndpointIdentifier;
    final status = this.status;
    final statusException = this.statusException;
    final tryItState = this.tryItState;
    return {
      if (displayContent != null) 'displayContent': displayContent,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (productRestEndpointPageArn != null)
        'productRestEndpointPageArn': productRestEndpointPageArn,
      if (productRestEndpointPageId != null)
        'productRestEndpointPageId': productRestEndpointPageId,
      if (restEndpointIdentifier != null)
        'restEndpointIdentifier': restEndpointIdentifier,
      if (status != null) 'status': status.value,
      if (statusException != null) 'statusException': statusException,
      if (tryItState != null) 'tryItState': tryItState.value,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      authorizationType: (json['authorizationType'] as String?)
          ?.let(AuthorizationType.fromString),
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
        'authorizationType': authorizationType.value,
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

/// @nodoc
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

/// @nodoc
class CreateRoutingRuleResponse {
  /// Represents a routing rule action. The only supported action is invokeApi.
  final List<RoutingRuleAction>? actions;

  /// Represents a condition. Conditions can contain up to two matchHeaders
  /// conditions and one matchBasePaths conditions. API Gateway evaluates header
  /// conditions and base path conditions together. You can only use AND between
  /// header and base path conditions.
  final List<RoutingRuleCondition>? conditions;

  /// Represents the priority of the routing rule.
  final int? priority;

  /// The ARN of the domain name.
  final String? routingRuleArn;

  /// The routing rule ID.
  final String? routingRuleId;

  CreateRoutingRuleResponse({
    this.actions,
    this.conditions,
    this.priority,
    this.routingRuleArn,
    this.routingRuleId,
  });

  factory CreateRoutingRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateRoutingRuleResponse(
      actions: (json['actions'] as List?)
          ?.nonNulls
          .map((e) => RoutingRuleAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditions: (json['conditions'] as List?)
          ?.nonNulls
          .map((e) => RoutingRuleCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      priority: json['priority'] as int?,
      routingRuleArn: json['routingRuleArn'] as String?,
      routingRuleId: json['routingRuleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final conditions = this.conditions;
    final priority = this.priority;
    final routingRuleArn = this.routingRuleArn;
    final routingRuleId = this.routingRuleId;
    return {
      if (actions != null) 'actions': actions,
      if (conditions != null) 'conditions': conditions,
      if (priority != null) 'priority': priority,
      if (routingRuleArn != null) 'routingRuleArn': routingRuleArn,
      if (routingRuleId != null) 'routingRuleId': routingRuleId,
    };
  }
}

/// @nodoc
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
  /// \[A-Za-z0-9-._~:/?#&amp;=,\]+.
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

/// @nodoc
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcLinkId: json['vpcLinkId'] as String?,
      vpcLinkStatus:
          (json['vpcLinkStatus'] as String?)?.let(VpcLinkStatus.fromString),
      vpcLinkStatusMessage: json['vpcLinkStatusMessage'] as String?,
      vpcLinkVersion:
          (json['vpcLinkVersion'] as String?)?.let(VpcLinkVersion.fromString),
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
      if (vpcLinkStatus != null) 'vpcLinkStatus': vpcLinkStatus.value,
      if (vpcLinkStatusMessage != null)
        'vpcLinkStatusMessage': vpcLinkStatusMessage,
      if (vpcLinkVersion != null) 'vpcLinkVersion': vpcLinkVersion.value,
    };
  }
}

/// @nodoc
class DeleteVpcLinkResponse {
  DeleteVpcLinkResponse();

  factory DeleteVpcLinkResponse.fromJson(Map<String, dynamic> _) {
    return DeleteVpcLinkResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
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

  /// The IP address types that can invoke the API.
  final IpAddressType? ipAddressType;

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
    this.ipAddressType,
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ipAddressType:
          (json['ipAddressType'] as String?)?.let(IpAddressType.fromString),
      name: json['name'] as String?,
      protocolType:
          (json['protocolType'] as String?)?.let(ProtocolType.fromString),
      routeSelectionExpression: json['routeSelectionExpression'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.nonNulls
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
    final ipAddressType = this.ipAddressType;
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
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (name != null) 'name': name,
      if (protocolType != null) 'protocolType': protocolType.value,
      if (routeSelectionExpression != null)
        'routeSelectionExpression': routeSelectionExpression,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
  /// /2015-03-31/functions/\[FunctionARN\]/invocations. Supported only for
  /// REQUEST authorizers.
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
      authorizerType:
          (json['authorizerType'] as String?)?.let(AuthorizerType.fromString),
      authorizerUri: json['authorizerUri'] as String?,
      enableSimpleResponses: json['enableSimpleResponses'] as bool?,
      identitySource: (json['identitySource'] as List?)
          ?.nonNulls
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
      if (authorizerType != null) 'authorizerType': authorizerType.value,
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
      deploymentStatus: (json['deploymentStatus'] as String?)
          ?.let(DeploymentStatus.fromString),
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
      if (deploymentStatus != null) 'deploymentStatus': deploymentStatus.value,
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class GetDomainNameResponse {
  /// The API mapping selection expression.
  final String? apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String? domainName;

  /// The ARN of the DomainName resource.
  final String? domainNameArn;

  /// The domain name configurations.
  final List<DomainNameConfiguration>? domainNameConfigurations;

  /// The mutual TLS authentication configuration for a custom domain name.
  final MutualTlsAuthentication? mutualTlsAuthentication;

  /// The routing mode.
  final RoutingMode? routingMode;

  /// The collection of tags associated with a domain name.
  final Map<String, String>? tags;

  GetDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameArn,
    this.domainNameConfigurations,
    this.mutualTlsAuthentication,
    this.routingMode,
    this.tags,
  });

  factory GetDomainNameResponse.fromJson(Map<String, dynamic> json) {
    return GetDomainNameResponse(
      apiMappingSelectionExpression:
          json['apiMappingSelectionExpression'] as String?,
      domainName: json['domainName'] as String?,
      domainNameArn: json['domainNameArn'] as String?,
      domainNameConfigurations: (json['domainNameConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              DomainNameConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      mutualTlsAuthentication: json['mutualTlsAuthentication'] != null
          ? MutualTlsAuthentication.fromJson(
              json['mutualTlsAuthentication'] as Map<String, dynamic>)
          : null,
      routingMode:
          (json['routingMode'] as String?)?.let(RoutingMode.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final apiMappingSelectionExpression = this.apiMappingSelectionExpression;
    final domainName = this.domainName;
    final domainNameArn = this.domainNameArn;
    final domainNameConfigurations = this.domainNameConfigurations;
    final mutualTlsAuthentication = this.mutualTlsAuthentication;
    final routingMode = this.routingMode;
    final tags = this.tags;
    return {
      if (apiMappingSelectionExpression != null)
        'apiMappingSelectionExpression': apiMappingSelectionExpression,
      if (domainName != null) 'domainName': domainName,
      if (domainNameArn != null) 'domainNameArn': domainNameArn,
      if (domainNameConfigurations != null)
        'domainNameConfigurations': domainNameConfigurations,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
      if (routingMode != null) 'routingMode': routingMode.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
  /// HTTP APIs. Supported values for Lambda proxy integrations are 1.0 and 2.0.
  /// For all other integrations, 1.0 is the only supported value. To learn more,
  /// see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-lambda.html">Working
  /// with AWS Lambda proxy integrations for HTTP APIs</a>.
  final String? payloadFormatVersion;

  /// For WebSocket APIs, a key-value map specifying request parameters that are
  /// passed from the method request to the backend. The key is an integration
  /// request parameter name and the associated value is a method request
  /// parameter value or static value that must be enclosed within single quotes
  /// and pre-encoded as required by the backend. The method request parameter
  /// value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where <replaceable>{location}</replaceable> is querystring, path, or
  /// header; and <replaceable>{name}</replaceable> must be a valid and unique
  /// method request parameter name.
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
      connectionType:
          (json['connectionType'] as String?)?.let(ConnectionType.fromString),
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.let(ContentHandlingStrategy.fromString),
      credentialsArn: json['credentialsArn'] as String?,
      description: json['description'] as String?,
      integrationId: json['integrationId'] as String?,
      integrationMethod: json['integrationMethod'] as String?,
      integrationResponseSelectionExpression:
          json['integrationResponseSelectionExpression'] as String?,
      integrationSubtype: json['integrationSubtype'] as String?,
      integrationType:
          (json['integrationType'] as String?)?.let(IntegrationType.fromString),
      integrationUri: json['integrationUri'] as String?,
      passthroughBehavior: (json['passthroughBehavior'] as String?)
          ?.let(PassthroughBehavior.fromString),
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
      if (connectionType != null) 'connectionType': connectionType.value,
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.value,
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (integrationId != null) 'integrationId': integrationId,
      if (integrationMethod != null) 'integrationMethod': integrationMethod,
      if (integrationResponseSelectionExpression != null)
        'integrationResponseSelectionExpression':
            integrationResponseSelectionExpression,
      if (integrationSubtype != null) 'integrationSubtype': integrationSubtype,
      if (integrationType != null) 'integrationType': integrationType.value,
      if (integrationUri != null) 'integrationUri': integrationUri,
      if (passthroughBehavior != null)
        'passthroughBehavior': passthroughBehavior.value,
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

/// @nodoc
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
          ?.let(ContentHandlingStrategy.fromString),
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
        'contentHandlingStrategy': contentHandlingStrategy.value,
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
class GetPortalResponse {
  /// The authorization for the portal.
  final Authorization? authorization;

  /// The endpoint configuration.
  final EndpointConfigurationResponse? endpointConfiguration;

  /// The ARNs of the portal products included in the portal.
  final List<String>? includedPortalProductArns;

  /// The timestamp when the portal was last modified.
  final DateTime? lastModified;

  /// The timestamp when the portal was last published.
  final DateTime? lastPublished;

  /// The publish description used when the portal was last published.
  final String? lastPublishedDescription;

  /// The ARN of the portal.
  final String? portalArn;

  /// Contains the content that is visible to portal consumers including the
  /// themes, display names, and description.
  final PortalContent? portalContent;

  /// The portal identifier.
  final String? portalId;

  /// Represents the preview endpoint and the any possible error messages during
  /// preview generation.
  final Preview? preview;

  /// The publish status of a portal.
  final PublishStatus? publishStatus;

  /// The CloudWatch RUM app monitor name.
  final String? rumAppMonitorName;

  /// The status exception information.
  final StatusException? statusException;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  GetPortalResponse({
    this.authorization,
    this.endpointConfiguration,
    this.includedPortalProductArns,
    this.lastModified,
    this.lastPublished,
    this.lastPublishedDescription,
    this.portalArn,
    this.portalContent,
    this.portalId,
    this.preview,
    this.publishStatus,
    this.rumAppMonitorName,
    this.statusException,
    this.tags,
  });

  factory GetPortalResponse.fromJson(Map<String, dynamic> json) {
    return GetPortalResponse(
      authorization: json['authorization'] != null
          ? Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>)
          : null,
      endpointConfiguration: json['endpointConfiguration'] != null
          ? EndpointConfigurationResponse.fromJson(
              json['endpointConfiguration'] as Map<String, dynamic>)
          : null,
      includedPortalProductArns: (json['includedPortalProductArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      lastModified: timeStampFromJson(json['lastModified']),
      lastPublished: timeStampFromJson(json['lastPublished']),
      lastPublishedDescription: json['lastPublishedDescription'] as String?,
      portalArn: json['portalArn'] as String?,
      portalContent: json['portalContent'] != null
          ? PortalContent.fromJson(
              json['portalContent'] as Map<String, dynamic>)
          : null,
      portalId: json['portalId'] as String?,
      preview: json['preview'] != null
          ? Preview.fromJson(json['preview'] as Map<String, dynamic>)
          : null,
      publishStatus:
          (json['publishStatus'] as String?)?.let(PublishStatus.fromString),
      rumAppMonitorName: json['rumAppMonitorName'] as String?,
      statusException: json['statusException'] != null
          ? StatusException.fromJson(
              json['statusException'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final authorization = this.authorization;
    final endpointConfiguration = this.endpointConfiguration;
    final includedPortalProductArns = this.includedPortalProductArns;
    final lastModified = this.lastModified;
    final lastPublished = this.lastPublished;
    final lastPublishedDescription = this.lastPublishedDescription;
    final portalArn = this.portalArn;
    final portalContent = this.portalContent;
    final portalId = this.portalId;
    final preview = this.preview;
    final publishStatus = this.publishStatus;
    final rumAppMonitorName = this.rumAppMonitorName;
    final statusException = this.statusException;
    final tags = this.tags;
    return {
      if (authorization != null) 'authorization': authorization,
      if (endpointConfiguration != null)
        'endpointConfiguration': endpointConfiguration,
      if (includedPortalProductArns != null)
        'includedPortalProductArns': includedPortalProductArns,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (lastPublished != null) 'lastPublished': iso8601ToJson(lastPublished),
      if (lastPublishedDescription != null)
        'lastPublishedDescription': lastPublishedDescription,
      if (portalArn != null) 'portalArn': portalArn,
      if (portalContent != null) 'portalContent': portalContent,
      if (portalId != null) 'portalId': portalId,
      if (preview != null) 'preview': preview,
      if (publishStatus != null) 'publishStatus': publishStatus.value,
      if (rumAppMonitorName != null) 'rumAppMonitorName': rumAppMonitorName,
      if (statusException != null) 'statusException': statusException,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetPortalProductResponse {
  /// The description of a portal product.
  final String? description;

  /// The display name.
  final String? displayName;

  /// The display order.
  final DisplayOrder? displayOrder;

  /// The timestamp when the portal product was last modified.
  final DateTime? lastModified;

  /// The ARN of the portal product.
  final String? portalProductArn;

  /// The portal product identifier.
  final String? portalProductId;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  GetPortalProductResponse({
    this.description,
    this.displayName,
    this.displayOrder,
    this.lastModified,
    this.portalProductArn,
    this.portalProductId,
    this.tags,
  });

  factory GetPortalProductResponse.fromJson(Map<String, dynamic> json) {
    return GetPortalProductResponse(
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      displayOrder: json['displayOrder'] != null
          ? DisplayOrder.fromJson(json['displayOrder'] as Map<String, dynamic>)
          : null,
      lastModified: timeStampFromJson(json['lastModified']),
      portalProductArn: json['portalProductArn'] as String?,
      portalProductId: json['portalProductId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final displayOrder = this.displayOrder;
    final lastModified = this.lastModified;
    final portalProductArn = this.portalProductArn;
    final portalProductId = this.portalProductId;
    final tags = this.tags;
    return {
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (displayOrder != null) 'displayOrder': displayOrder,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (portalProductArn != null) 'portalProductArn': portalProductArn,
      if (portalProductId != null) 'portalProductId': portalProductId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetPortalProductSharingPolicyResponse {
  /// The product sharing policy.
  final String? policyDocument;

  /// The portal product identifier.
  final String? portalProductId;

  GetPortalProductSharingPolicyResponse({
    this.policyDocument,
    this.portalProductId,
  });

  factory GetPortalProductSharingPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return GetPortalProductSharingPolicyResponse(
      policyDocument: json['policyDocument'] as String?,
      portalProductId: json['portalProductId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyDocument = this.policyDocument;
    final portalProductId = this.portalProductId;
    return {
      if (policyDocument != null) 'policyDocument': policyDocument,
      if (portalProductId != null) 'portalProductId': portalProductId,
    };
  }
}

/// @nodoc
class GetProductPageResponse {
  /// The content of the product page.
  final DisplayContent? displayContent;

  /// The timestamp when the product page was last modified.
  final DateTime? lastModified;

  /// The ARN of the product page.
  final String? productPageArn;

  /// The product page identifier.
  final String? productPageId;

  GetProductPageResponse({
    this.displayContent,
    this.lastModified,
    this.productPageArn,
    this.productPageId,
  });

  factory GetProductPageResponse.fromJson(Map<String, dynamic> json) {
    return GetProductPageResponse(
      displayContent: json['displayContent'] != null
          ? DisplayContent.fromJson(
              json['displayContent'] as Map<String, dynamic>)
          : null,
      lastModified: timeStampFromJson(json['lastModified']),
      productPageArn: json['productPageArn'] as String?,
      productPageId: json['productPageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayContent = this.displayContent;
    final lastModified = this.lastModified;
    final productPageArn = this.productPageArn;
    final productPageId = this.productPageId;
    return {
      if (displayContent != null) 'displayContent': displayContent,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (productPageArn != null) 'productPageArn': productPageArn,
      if (productPageId != null) 'productPageId': productPageId,
    };
  }
}

/// @nodoc
class GetProductRestEndpointPageResponse {
  /// The content of the product REST endpoint page.
  final EndpointDisplayContentResponse? displayContent;

  /// The timestamp when the product REST endpoint page was last modified.
  final DateTime? lastModified;

  /// The ARN of the product REST endpoint page.
  final String? productRestEndpointPageArn;

  /// The product REST endpoint page identifier.
  final String? productRestEndpointPageId;

  /// The raw display content of the product REST endpoint page.
  final String? rawDisplayContent;

  /// The REST endpoint identifier.
  final RestEndpointIdentifier? restEndpointIdentifier;

  /// The status of the product REST endpoint page.
  final Status? status;

  /// The status exception information.
  final StatusException? statusException;

  /// The try it state.
  final TryItState? tryItState;

  GetProductRestEndpointPageResponse({
    this.displayContent,
    this.lastModified,
    this.productRestEndpointPageArn,
    this.productRestEndpointPageId,
    this.rawDisplayContent,
    this.restEndpointIdentifier,
    this.status,
    this.statusException,
    this.tryItState,
  });

  factory GetProductRestEndpointPageResponse.fromJson(
      Map<String, dynamic> json) {
    return GetProductRestEndpointPageResponse(
      displayContent: json['displayContent'] != null
          ? EndpointDisplayContentResponse.fromJson(
              json['displayContent'] as Map<String, dynamic>)
          : null,
      lastModified: timeStampFromJson(json['lastModified']),
      productRestEndpointPageArn: json['productRestEndpointPageArn'] as String?,
      productRestEndpointPageId: json['productRestEndpointPageId'] as String?,
      rawDisplayContent: json['rawDisplayContent'] as String?,
      restEndpointIdentifier: json['restEndpointIdentifier'] != null
          ? RestEndpointIdentifier.fromJson(
              json['restEndpointIdentifier'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(Status.fromString),
      statusException: json['statusException'] != null
          ? StatusException.fromJson(
              json['statusException'] as Map<String, dynamic>)
          : null,
      tryItState: (json['tryItState'] as String?)?.let(TryItState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final displayContent = this.displayContent;
    final lastModified = this.lastModified;
    final productRestEndpointPageArn = this.productRestEndpointPageArn;
    final productRestEndpointPageId = this.productRestEndpointPageId;
    final rawDisplayContent = this.rawDisplayContent;
    final restEndpointIdentifier = this.restEndpointIdentifier;
    final status = this.status;
    final statusException = this.statusException;
    final tryItState = this.tryItState;
    return {
      if (displayContent != null) 'displayContent': displayContent,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (productRestEndpointPageArn != null)
        'productRestEndpointPageArn': productRestEndpointPageArn,
      if (productRestEndpointPageId != null)
        'productRestEndpointPageId': productRestEndpointPageId,
      if (rawDisplayContent != null) 'rawDisplayContent': rawDisplayContent,
      if (restEndpointIdentifier != null)
        'restEndpointIdentifier': restEndpointIdentifier,
      if (status != null) 'status': status.value,
      if (statusException != null) 'statusException': statusException,
      if (tryItState != null) 'tryItState': tryItState.value,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      authorizationType: (json['authorizationType'] as String?)
          ?.let(AuthorizationType.fromString),
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
        'authorizationType': authorizationType.value,
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

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class GetRoutingRuleResponse {
  /// The resulting action based on matching a routing rules condition. Only
  /// InvokeApi is supported.
  final List<RoutingRuleAction>? actions;

  /// The conditions of the routing rule.
  final List<RoutingRuleCondition>? conditions;

  /// The order in which API Gateway evaluates a rule. Priority is evaluated from
  /// the lowest value to the highest value.
  final int? priority;

  /// The routing rule ARN.
  final String? routingRuleArn;

  /// The routing rule ID.
  final String? routingRuleId;

  GetRoutingRuleResponse({
    this.actions,
    this.conditions,
    this.priority,
    this.routingRuleArn,
    this.routingRuleId,
  });

  factory GetRoutingRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetRoutingRuleResponse(
      actions: (json['actions'] as List?)
          ?.nonNulls
          .map((e) => RoutingRuleAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditions: (json['conditions'] as List?)
          ?.nonNulls
          .map((e) => RoutingRuleCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      priority: json['priority'] as int?,
      routingRuleArn: json['routingRuleArn'] as String?,
      routingRuleId: json['routingRuleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final conditions = this.conditions;
    final priority = this.priority;
    final routingRuleArn = this.routingRuleArn;
    final routingRuleId = this.routingRuleId;
    return {
      if (actions != null) 'actions': actions,
      if (conditions != null) 'conditions': conditions,
      if (priority != null) 'priority': priority,
      if (routingRuleArn != null) 'routingRuleArn': routingRuleArn,
      if (routingRuleId != null) 'routingRuleId': routingRuleId,
    };
  }
}

/// @nodoc
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
  /// \[A-Za-z0-9-._~:/?#&amp;=,\]+.
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcLinkId: json['vpcLinkId'] as String?,
      vpcLinkStatus:
          (json['vpcLinkStatus'] as String?)?.let(VpcLinkStatus.fromString),
      vpcLinkStatusMessage: json['vpcLinkStatusMessage'] as String?,
      vpcLinkVersion:
          (json['vpcLinkVersion'] as String?)?.let(VpcLinkVersion.fromString),
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
      if (vpcLinkStatus != null) 'vpcLinkStatus': vpcLinkStatus.value,
      if (vpcLinkStatusMessage != null)
        'vpcLinkStatusMessage': vpcLinkStatusMessage,
      if (vpcLinkVersion != null) 'vpcLinkVersion': vpcLinkVersion.value,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

  /// The IP address types that can invoke the API.
  final IpAddressType? ipAddressType;

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
    this.ipAddressType,
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ipAddressType:
          (json['ipAddressType'] as String?)?.let(IpAddressType.fromString),
      name: json['name'] as String?,
      protocolType:
          (json['protocolType'] as String?)?.let(ProtocolType.fromString),
      routeSelectionExpression: json['routeSelectionExpression'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.nonNulls
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
    final ipAddressType = this.ipAddressType;
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
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (name != null) 'name': name,
      if (protocolType != null) 'protocolType': protocolType.value,
      if (routeSelectionExpression != null)
        'routeSelectionExpression': routeSelectionExpression,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

/// @nodoc
class ListPortalProductsResponse {
  /// The elements from this collection.
  final List<PortalProductSummary>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  ListPortalProductsResponse({
    this.items,
    this.nextToken,
  });

  factory ListPortalProductsResponse.fromJson(Map<String, dynamic> json) {
    return ListPortalProductsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => PortalProductSummary.fromJson(e as Map<String, dynamic>))
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

/// @nodoc
class ListPortalsResponse {
  /// The elements from this collection.
  final List<PortalSummary>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  ListPortalsResponse({
    this.items,
    this.nextToken,
  });

  factory ListPortalsResponse.fromJson(Map<String, dynamic> json) {
    return ListPortalsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => PortalSummary.fromJson(e as Map<String, dynamic>))
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

/// @nodoc
class ListProductPagesResponse {
  /// The elements from this collection.
  final List<ProductPageSummaryNoBody>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  ListProductPagesResponse({
    this.items,
    this.nextToken,
  });

  factory ListProductPagesResponse.fromJson(Map<String, dynamic> json) {
    return ListProductPagesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              ProductPageSummaryNoBody.fromJson(e as Map<String, dynamic>))
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

/// @nodoc
class ListProductRestEndpointPagesResponse {
  /// The elements from this collection.
  final List<ProductRestEndpointPageSummaryNoBody>? items;

  /// The next page of elements from this collection. Not valid for the last
  /// element of the collection.
  final String? nextToken;

  ListProductRestEndpointPagesResponse({
    this.items,
    this.nextToken,
  });

  factory ListProductRestEndpointPagesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListProductRestEndpointPagesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ProductRestEndpointPageSummaryNoBody.fromJson(
              e as Map<String, dynamic>))
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

/// @nodoc
class ListRoutingRulesResponse {
  final String? nextToken;

  /// The routing rules.
  final List<RoutingRule>? routingRules;

  ListRoutingRulesResponse({
    this.nextToken,
    this.routingRules,
  });

  factory ListRoutingRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListRoutingRulesResponse(
      nextToken: json['nextToken'] as String?,
      routingRules: (json['routingRules'] as List?)
          ?.nonNulls
          .map((e) => RoutingRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final routingRules = this.routingRules;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (routingRules != null) 'routingRules': routingRules,
    };
  }
}

/// @nodoc
class PreviewPortalResponse {
  PreviewPortalResponse();

  factory PreviewPortalResponse.fromJson(Map<String, dynamic> _) {
    return PreviewPortalResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class PublishPortalResponse {
  PublishPortalResponse();

  factory PublishPortalResponse.fromJson(Map<String, dynamic> _) {
    return PublishPortalResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class PutPortalProductSharingPolicyResponse {
  PutPortalProductSharingPolicyResponse();

  factory PutPortalProductSharingPolicyResponse.fromJson(
      Map<String, dynamic> _) {
    return PutPortalProductSharingPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class PutRoutingRuleResponse {
  /// The routing rule action.
  final List<RoutingRuleAction>? actions;

  /// The conditions of the routing rule.
  final List<RoutingRuleCondition>? conditions;

  /// The routing rule priority.
  final int? priority;

  /// The routing rule ARN.
  final String? routingRuleArn;

  /// The routing rule ID.
  final String? routingRuleId;

  PutRoutingRuleResponse({
    this.actions,
    this.conditions,
    this.priority,
    this.routingRuleArn,
    this.routingRuleId,
  });

  factory PutRoutingRuleResponse.fromJson(Map<String, dynamic> json) {
    return PutRoutingRuleResponse(
      actions: (json['actions'] as List?)
          ?.nonNulls
          .map((e) => RoutingRuleAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditions: (json['conditions'] as List?)
          ?.nonNulls
          .map((e) => RoutingRuleCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      priority: json['priority'] as int?,
      routingRuleArn: json['routingRuleArn'] as String?,
      routingRuleId: json['routingRuleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final conditions = this.conditions;
    final priority = this.priority;
    final routingRuleArn = this.routingRuleArn;
    final routingRuleId = this.routingRuleId;
    return {
      if (actions != null) 'actions': actions,
      if (conditions != null) 'conditions': conditions,
      if (priority != null) 'priority': priority,
      if (routingRuleArn != null) 'routingRuleArn': routingRuleArn,
      if (routingRuleId != null) 'routingRuleId': routingRuleId,
    };
  }
}

/// @nodoc
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

  /// The IP address types that can invoke the API.
  final IpAddressType? ipAddressType;

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
    this.ipAddressType,
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ipAddressType:
          (json['ipAddressType'] as String?)?.let(IpAddressType.fromString),
      name: json['name'] as String?,
      protocolType:
          (json['protocolType'] as String?)?.let(ProtocolType.fromString),
      routeSelectionExpression: json['routeSelectionExpression'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.nonNulls
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
    final ipAddressType = this.ipAddressType;
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
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (name != null) 'name': name,
      if (protocolType != null) 'protocolType': protocolType.value,
      if (routeSelectionExpression != null)
        'routeSelectionExpression': routeSelectionExpression,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

  /// The IP address types that can invoke the API.
  final IpAddressType? ipAddressType;

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
    this.ipAddressType,
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ipAddressType:
          (json['ipAddressType'] as String?)?.let(IpAddressType.fromString),
      name: json['name'] as String?,
      protocolType:
          (json['protocolType'] as String?)?.let(ProtocolType.fromString),
      routeSelectionExpression: json['routeSelectionExpression'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.nonNulls
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
    final ipAddressType = this.ipAddressType;
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
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (name != null) 'name': name,
      if (protocolType != null) 'protocolType': protocolType.value,
      if (routeSelectionExpression != null)
        'routeSelectionExpression': routeSelectionExpression,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

/// @nodoc
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

/// @nodoc
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
  /// /2015-03-31/functions/\[FunctionARN\]/invocations. Supported only for
  /// REQUEST authorizers.
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
      authorizerType:
          (json['authorizerType'] as String?)?.let(AuthorizerType.fromString),
      authorizerUri: json['authorizerUri'] as String?,
      enableSimpleResponses: json['enableSimpleResponses'] as bool?,
      identitySource: (json['identitySource'] as List?)
          ?.nonNulls
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
      if (authorizerType != null) 'authorizerType': authorizerType.value,
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

/// @nodoc
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
      deploymentStatus: (json['deploymentStatus'] as String?)
          ?.let(DeploymentStatus.fromString),
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
      if (deploymentStatus != null) 'deploymentStatus': deploymentStatus.value,
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class UpdateDomainNameResponse {
  /// The API mapping selection expression.
  final String? apiMappingSelectionExpression;

  /// The name of the DomainName resource.
  final String? domainName;

  /// The ARN of the DomainName resource.
  final String? domainNameArn;

  /// The domain name configurations.
  final List<DomainNameConfiguration>? domainNameConfigurations;

  /// The mutual TLS authentication configuration for a custom domain name.
  final MutualTlsAuthentication? mutualTlsAuthentication;

  /// The routing mode.
  final RoutingMode? routingMode;

  /// The collection of tags associated with a domain name.
  final Map<String, String>? tags;

  UpdateDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameArn,
    this.domainNameConfigurations,
    this.mutualTlsAuthentication,
    this.routingMode,
    this.tags,
  });

  factory UpdateDomainNameResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDomainNameResponse(
      apiMappingSelectionExpression:
          json['apiMappingSelectionExpression'] as String?,
      domainName: json['domainName'] as String?,
      domainNameArn: json['domainNameArn'] as String?,
      domainNameConfigurations: (json['domainNameConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              DomainNameConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      mutualTlsAuthentication: json['mutualTlsAuthentication'] != null
          ? MutualTlsAuthentication.fromJson(
              json['mutualTlsAuthentication'] as Map<String, dynamic>)
          : null,
      routingMode:
          (json['routingMode'] as String?)?.let(RoutingMode.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final apiMappingSelectionExpression = this.apiMappingSelectionExpression;
    final domainName = this.domainName;
    final domainNameArn = this.domainNameArn;
    final domainNameConfigurations = this.domainNameConfigurations;
    final mutualTlsAuthentication = this.mutualTlsAuthentication;
    final routingMode = this.routingMode;
    final tags = this.tags;
    return {
      if (apiMappingSelectionExpression != null)
        'apiMappingSelectionExpression': apiMappingSelectionExpression,
      if (domainName != null) 'domainName': domainName,
      if (domainNameArn != null) 'domainNameArn': domainNameArn,
      if (domainNameConfigurations != null)
        'domainNameConfigurations': domainNameConfigurations,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
      if (routingMode != null) 'routingMode': routingMode.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
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
  /// HTTP APIs. Supported values for Lambda proxy integrations are 1.0 and 2.0.
  /// For all other integrations, 1.0 is the only supported value. To learn more,
  /// see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-lambda.html">Working
  /// with AWS Lambda proxy integrations for HTTP APIs</a>.
  final String? payloadFormatVersion;

  /// For WebSocket APIs, a key-value map specifying request parameters that are
  /// passed from the method request to the backend. The key is an integration
  /// request parameter name and the associated value is a method request
  /// parameter value or static value that must be enclosed within single quotes
  /// and pre-encoded as required by the backend. The method request parameter
  /// value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where <replaceable>{location}</replaceable> is querystring, path, or
  /// header; and <replaceable>{name}</replaceable> must be a valid and unique
  /// method request parameter name.
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
      connectionType:
          (json['connectionType'] as String?)?.let(ConnectionType.fromString),
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.let(ContentHandlingStrategy.fromString),
      credentialsArn: json['credentialsArn'] as String?,
      description: json['description'] as String?,
      integrationId: json['integrationId'] as String?,
      integrationMethod: json['integrationMethod'] as String?,
      integrationResponseSelectionExpression:
          json['integrationResponseSelectionExpression'] as String?,
      integrationSubtype: json['integrationSubtype'] as String?,
      integrationType:
          (json['integrationType'] as String?)?.let(IntegrationType.fromString),
      integrationUri: json['integrationUri'] as String?,
      passthroughBehavior: (json['passthroughBehavior'] as String?)
          ?.let(PassthroughBehavior.fromString),
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
      if (connectionType != null) 'connectionType': connectionType.value,
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.value,
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (integrationId != null) 'integrationId': integrationId,
      if (integrationMethod != null) 'integrationMethod': integrationMethod,
      if (integrationResponseSelectionExpression != null)
        'integrationResponseSelectionExpression':
            integrationResponseSelectionExpression,
      if (integrationSubtype != null) 'integrationSubtype': integrationSubtype,
      if (integrationType != null) 'integrationType': integrationType.value,
      if (integrationUri != null) 'integrationUri': integrationUri,
      if (passthroughBehavior != null)
        'passthroughBehavior': passthroughBehavior.value,
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

/// @nodoc
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
          ?.let(ContentHandlingStrategy.fromString),
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
        'contentHandlingStrategy': contentHandlingStrategy.value,
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

/// @nodoc
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

/// @nodoc
class UpdatePortalResponse {
  /// The authorization for the portal.
  final Authorization? authorization;

  /// The endpoint configuration.
  final EndpointConfigurationResponse? endpointConfiguration;

  /// The ARNs of the portal products included in the portal.
  final List<String>? includedPortalProductArns;

  /// The timestamp when the portal was last modified.
  final DateTime? lastModified;

  /// The timestamp when the portal was last published.
  final DateTime? lastPublished;

  /// The description associated with the last time the portal was published.
  final String? lastPublishedDescription;

  /// The ARN of the portal.
  final String? portalArn;

  /// Contains the content that is visible to portal consumers including the
  /// themes, display names, and description.
  final PortalContent? portalContent;

  /// The portal identifier.
  final String? portalId;

  /// Represents the preview endpoint and the any possible error messages during
  /// preview generation.
  final Preview? preview;

  /// The publishStatus.
  final PublishStatus? publishStatus;

  /// The CloudWatch RUM app monitor name.
  final String? rumAppMonitorName;

  /// The status exception information.
  final StatusException? statusException;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  UpdatePortalResponse({
    this.authorization,
    this.endpointConfiguration,
    this.includedPortalProductArns,
    this.lastModified,
    this.lastPublished,
    this.lastPublishedDescription,
    this.portalArn,
    this.portalContent,
    this.portalId,
    this.preview,
    this.publishStatus,
    this.rumAppMonitorName,
    this.statusException,
    this.tags,
  });

  factory UpdatePortalResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePortalResponse(
      authorization: json['authorization'] != null
          ? Authorization.fromJson(
              json['authorization'] as Map<String, dynamic>)
          : null,
      endpointConfiguration: json['endpointConfiguration'] != null
          ? EndpointConfigurationResponse.fromJson(
              json['endpointConfiguration'] as Map<String, dynamic>)
          : null,
      includedPortalProductArns: (json['includedPortalProductArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      lastModified: timeStampFromJson(json['lastModified']),
      lastPublished: timeStampFromJson(json['lastPublished']),
      lastPublishedDescription: json['lastPublishedDescription'] as String?,
      portalArn: json['portalArn'] as String?,
      portalContent: json['portalContent'] != null
          ? PortalContent.fromJson(
              json['portalContent'] as Map<String, dynamic>)
          : null,
      portalId: json['portalId'] as String?,
      preview: json['preview'] != null
          ? Preview.fromJson(json['preview'] as Map<String, dynamic>)
          : null,
      publishStatus:
          (json['publishStatus'] as String?)?.let(PublishStatus.fromString),
      rumAppMonitorName: json['rumAppMonitorName'] as String?,
      statusException: json['statusException'] != null
          ? StatusException.fromJson(
              json['statusException'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final authorization = this.authorization;
    final endpointConfiguration = this.endpointConfiguration;
    final includedPortalProductArns = this.includedPortalProductArns;
    final lastModified = this.lastModified;
    final lastPublished = this.lastPublished;
    final lastPublishedDescription = this.lastPublishedDescription;
    final portalArn = this.portalArn;
    final portalContent = this.portalContent;
    final portalId = this.portalId;
    final preview = this.preview;
    final publishStatus = this.publishStatus;
    final rumAppMonitorName = this.rumAppMonitorName;
    final statusException = this.statusException;
    final tags = this.tags;
    return {
      if (authorization != null) 'authorization': authorization,
      if (endpointConfiguration != null)
        'endpointConfiguration': endpointConfiguration,
      if (includedPortalProductArns != null)
        'includedPortalProductArns': includedPortalProductArns,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (lastPublished != null) 'lastPublished': iso8601ToJson(lastPublished),
      if (lastPublishedDescription != null)
        'lastPublishedDescription': lastPublishedDescription,
      if (portalArn != null) 'portalArn': portalArn,
      if (portalContent != null) 'portalContent': portalContent,
      if (portalId != null) 'portalId': portalId,
      if (preview != null) 'preview': preview,
      if (publishStatus != null) 'publishStatus': publishStatus.value,
      if (rumAppMonitorName != null) 'rumAppMonitorName': rumAppMonitorName,
      if (statusException != null) 'statusException': statusException,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class UpdatePortalProductResponse {
  /// The description of the portal product.
  final String? description;

  /// The display name of a portal product.
  final String? displayName;

  /// The display order that the portal products will appear in a portal.
  final DisplayOrder? displayOrder;

  /// The timestamp when the portal product was last modified.
  final DateTime? lastModified;

  /// The ARN of the portal product.
  final String? portalProductArn;

  /// The portal product identifier.
  final String? portalProductId;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  UpdatePortalProductResponse({
    this.description,
    this.displayName,
    this.displayOrder,
    this.lastModified,
    this.portalProductArn,
    this.portalProductId,
    this.tags,
  });

  factory UpdatePortalProductResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePortalProductResponse(
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      displayOrder: json['displayOrder'] != null
          ? DisplayOrder.fromJson(json['displayOrder'] as Map<String, dynamic>)
          : null,
      lastModified: timeStampFromJson(json['lastModified']),
      portalProductArn: json['portalProductArn'] as String?,
      portalProductId: json['portalProductId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final displayOrder = this.displayOrder;
    final lastModified = this.lastModified;
    final portalProductArn = this.portalProductArn;
    final portalProductId = this.portalProductId;
    final tags = this.tags;
    return {
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (displayOrder != null) 'displayOrder': displayOrder,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (portalProductArn != null) 'portalProductArn': portalProductArn,
      if (portalProductId != null) 'portalProductId': portalProductId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class UpdateProductPageResponse {
  /// The content of the product page.
  final DisplayContent? displayContent;

  /// The timestamp when the product page was last modified.
  final DateTime? lastModified;

  /// The ARN of the product page.
  final String? productPageArn;

  /// The product page identifier.
  final String? productPageId;

  UpdateProductPageResponse({
    this.displayContent,
    this.lastModified,
    this.productPageArn,
    this.productPageId,
  });

  factory UpdateProductPageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProductPageResponse(
      displayContent: json['displayContent'] != null
          ? DisplayContent.fromJson(
              json['displayContent'] as Map<String, dynamic>)
          : null,
      lastModified: timeStampFromJson(json['lastModified']),
      productPageArn: json['productPageArn'] as String?,
      productPageId: json['productPageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayContent = this.displayContent;
    final lastModified = this.lastModified;
    final productPageArn = this.productPageArn;
    final productPageId = this.productPageId;
    return {
      if (displayContent != null) 'displayContent': displayContent,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (productPageArn != null) 'productPageArn': productPageArn,
      if (productPageId != null) 'productPageId': productPageId,
    };
  }
}

/// @nodoc
class UpdateProductRestEndpointPageResponse {
  /// The content of the product REST endpoint page.
  final EndpointDisplayContentResponse? displayContent;

  /// The timestamp when the product REST endpoint page was last modified.
  final DateTime? lastModified;

  /// The ARN of the product REST endpoint page.
  final String? productRestEndpointPageArn;

  /// The product REST endpoint page identifier.
  final String? productRestEndpointPageId;

  /// The REST endpoint identifier.
  final RestEndpointIdentifier? restEndpointIdentifier;

  /// The status.
  final Status? status;

  /// The status exception information.
  final StatusException? statusException;

  /// The try it state of a product REST endpoint page.
  final TryItState? tryItState;

  UpdateProductRestEndpointPageResponse({
    this.displayContent,
    this.lastModified,
    this.productRestEndpointPageArn,
    this.productRestEndpointPageId,
    this.restEndpointIdentifier,
    this.status,
    this.statusException,
    this.tryItState,
  });

  factory UpdateProductRestEndpointPageResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateProductRestEndpointPageResponse(
      displayContent: json['displayContent'] != null
          ? EndpointDisplayContentResponse.fromJson(
              json['displayContent'] as Map<String, dynamic>)
          : null,
      lastModified: timeStampFromJson(json['lastModified']),
      productRestEndpointPageArn: json['productRestEndpointPageArn'] as String?,
      productRestEndpointPageId: json['productRestEndpointPageId'] as String?,
      restEndpointIdentifier: json['restEndpointIdentifier'] != null
          ? RestEndpointIdentifier.fromJson(
              json['restEndpointIdentifier'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(Status.fromString),
      statusException: json['statusException'] != null
          ? StatusException.fromJson(
              json['statusException'] as Map<String, dynamic>)
          : null,
      tryItState: (json['tryItState'] as String?)?.let(TryItState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final displayContent = this.displayContent;
    final lastModified = this.lastModified;
    final productRestEndpointPageArn = this.productRestEndpointPageArn;
    final productRestEndpointPageId = this.productRestEndpointPageId;
    final restEndpointIdentifier = this.restEndpointIdentifier;
    final status = this.status;
    final statusException = this.statusException;
    final tryItState = this.tryItState;
    return {
      if (displayContent != null) 'displayContent': displayContent,
      if (lastModified != null) 'lastModified': iso8601ToJson(lastModified),
      if (productRestEndpointPageArn != null)
        'productRestEndpointPageArn': productRestEndpointPageArn,
      if (productRestEndpointPageId != null)
        'productRestEndpointPageId': productRestEndpointPageId,
      if (restEndpointIdentifier != null)
        'restEndpointIdentifier': restEndpointIdentifier,
      if (status != null) 'status': status.value,
      if (statusException != null) 'statusException': statusException,
      if (tryItState != null) 'tryItState': tryItState.value,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      authorizationType: (json['authorizationType'] as String?)
          ?.let(AuthorizationType.fromString),
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
        'authorizationType': authorizationType.value,
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

/// @nodoc
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

/// @nodoc
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
  /// \[A-Za-z0-9-._~:/?#&amp;=,\]+.
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

/// @nodoc
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcLinkId: json['vpcLinkId'] as String?,
      vpcLinkStatus:
          (json['vpcLinkStatus'] as String?)?.let(VpcLinkStatus.fromString),
      vpcLinkStatusMessage: json['vpcLinkStatusMessage'] as String?,
      vpcLinkVersion:
          (json['vpcLinkVersion'] as String?)?.let(VpcLinkVersion.fromString),
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
      if (vpcLinkStatus != null) 'vpcLinkStatus': vpcLinkStatus.value,
      if (vpcLinkStatusMessage != null)
        'vpcLinkStatusMessage': vpcLinkStatusMessage,
      if (vpcLinkVersion != null) 'vpcLinkVersion': vpcLinkVersion.value,
    };
  }
}

/// The status of the VPC link.
///
/// @nodoc
class VpcLinkStatus {
  static const pending = VpcLinkStatus._('PENDING');
  static const available = VpcLinkStatus._('AVAILABLE');
  static const deleting = VpcLinkStatus._('DELETING');
  static const failed = VpcLinkStatus._('FAILED');
  static const inactive = VpcLinkStatus._('INACTIVE');

  final String value;

  const VpcLinkStatus._(this.value);

  static const values = [pending, available, deleting, failed, inactive];

  static VpcLinkStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VpcLinkStatus._(value));

  @override
  bool operator ==(other) => other is VpcLinkStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The version of the VPC link.
///
/// @nodoc
class VpcLinkVersion {
  static const v2 = VpcLinkVersion._('V2');

  final String value;

  const VpcLinkVersion._(this.value);

  static const values = [v2];

  static VpcLinkVersion fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VpcLinkVersion._(value));

  @override
  bool operator ==(other) => other is VpcLinkVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Settings for logging access in a stage.
///
/// @nodoc
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

/// Represents a collection of route settings.
///
/// @nodoc
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
      loggingLevel:
          (json['loggingLevel'] as String?)?.let(LoggingLevel.fromString),
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
      if (loggingLevel != null) 'loggingLevel': loggingLevel.value,
      if (throttlingBurstLimit != null)
        'throttlingBurstLimit': throttlingBurstLimit,
      if (throttlingRateLimit != null)
        'throttlingRateLimit': throttlingRateLimit,
    };
  }
}

/// The logging level.
///
/// @nodoc
class LoggingLevel {
  static const error = LoggingLevel._('ERROR');
  static const info = LoggingLevel._('INFO');
  static const off = LoggingLevel._('OFF');

  final String value;

  const LoggingLevel._(this.value);

  static const values = [error, info, off];

  static LoggingLevel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LoggingLevel._(value));

  @override
  bool operator ==(other) => other is LoggingLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Validation constraints imposed on parameters of a request (path, query
/// string, headers).
///
/// @nodoc
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

/// The authorization type. For WebSocket APIs, valid values are NONE for open
/// access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda
/// authorizer. For HTTP APIs, valid values are NONE for open access, JWT for
/// using JSON Web Tokens, AWS_IAM for using AWS IAM permissions, and CUSTOM for
/// using a Lambda authorizer.
///
/// @nodoc
class AuthorizationType {
  static const none = AuthorizationType._('NONE');
  static const awsIam = AuthorizationType._('AWS_IAM');
  static const custom = AuthorizationType._('CUSTOM');
  static const jwt = AuthorizationType._('JWT');

  final String value;

  const AuthorizationType._(this.value);

  static const values = [none, awsIam, custom, jwt];

  static AuthorizationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AuthorizationType._(value));

  @override
  bool operator ==(other) => other is AuthorizationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The product REST endpoint page.
///
/// @nodoc
class EndpointDisplayContentResponse {
  /// The URL to invoke your REST API.
  final String endpoint;

  /// The API documentation.
  final String? body;

  /// The operation name.
  final String? operationName;

  EndpointDisplayContentResponse({
    required this.endpoint,
    this.body,
    this.operationName,
  });

  factory EndpointDisplayContentResponse.fromJson(Map<String, dynamic> json) {
    return EndpointDisplayContentResponse(
      endpoint: (json['endpoint'] as String?) ?? '',
      body: json['body'] as String?,
      operationName: json['operationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final body = this.body;
    final operationName = this.operationName;
    return {
      'endpoint': endpoint,
      if (body != null) 'body': body,
      if (operationName != null) 'operationName': operationName,
    };
  }
}

/// The REST API endpoint identifier.
///
/// @nodoc
class RestEndpointIdentifier {
  /// The identifier parts of the REST endpoint identifier.
  final IdentifierParts? identifierParts;

  RestEndpointIdentifier({
    this.identifierParts,
  });

  factory RestEndpointIdentifier.fromJson(Map<String, dynamic> json) {
    return RestEndpointIdentifier(
      identifierParts: json['identifierParts'] != null
          ? IdentifierParts.fromJson(
              json['identifierParts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final identifierParts = this.identifierParts;
    return {
      if (identifierParts != null) 'identifierParts': identifierParts,
    };
  }
}

/// The status.
///
/// @nodoc
class Status {
  static const available = Status._('AVAILABLE');
  static const inProgress = Status._('IN_PROGRESS');
  static const failed = Status._('FAILED');

  final String value;

  const Status._(this.value);

  static const values = [available, inProgress, failed];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a StatusException.
///
/// @nodoc
class StatusException {
  /// The exception.
  final String? exception;

  /// The error message.
  final String? message;

  StatusException({
    this.exception,
    this.message,
  });

  factory StatusException.fromJson(Map<String, dynamic> json) {
    return StatusException(
      exception: json['exception'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exception = this.exception;
    final message = this.message;
    return {
      if (exception != null) 'exception': exception,
      if (message != null) 'message': message,
    };
  }
}

/// Represents the try it state for a product REST endpoint page.
///
/// @nodoc
class TryItState {
  static const enabled = TryItState._('ENABLED');
  static const disabled = TryItState._('DISABLED');

  final String value;

  const TryItState._(this.value);

  static const values = [enabled, disabled];

  static TryItState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TryItState._(value));

  @override
  bool operator ==(other) => other is TryItState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The identifier parts of a product REST endpoint.
///
/// @nodoc
class IdentifierParts {
  /// The method of the product REST endpoint.
  final String method;

  /// The path of the product REST endpoint.
  final String path;

  /// The REST API ID of the product REST endpoint.
  final String restApiId;

  /// The stage of the product REST endpoint.
  final String stage;

  IdentifierParts({
    required this.method,
    required this.path,
    required this.restApiId,
    required this.stage,
  });

  factory IdentifierParts.fromJson(Map<String, dynamic> json) {
    return IdentifierParts(
      method: (json['method'] as String?) ?? '',
      path: (json['path'] as String?) ?? '',
      restApiId: (json['restApiId'] as String?) ?? '',
      stage: (json['stage'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final method = this.method;
    final path = this.path;
    final restApiId = this.restApiId;
    final stage = this.stage;
    return {
      'method': method,
      'path': path,
      'restApiId': restApiId,
      'stage': stage,
    };
  }
}

/// Represents the endpoint display content.
///
/// @nodoc
class EndpointDisplayContent {
  /// If your product REST endpoint contains no overrides, the none object is
  /// returned.
  final None? none;

  /// The overrides for endpoint display content.
  final DisplayContentOverrides? overrides;

  EndpointDisplayContent({
    this.none,
    this.overrides,
  });

  Map<String, dynamic> toJson() {
    final none = this.none;
    final overrides = this.overrides;
    return {
      if (none != null) 'none': none,
      if (overrides != null) 'overrides': overrides,
    };
  }
}

/// The none option.
///
/// @nodoc
class None {
  None();

  factory None.fromJson(Map<String, dynamic> _) {
    return None();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains any values that override the default configuration generated from
/// API Gateway.
///
/// @nodoc
class DisplayContentOverrides {
  /// By default, this is the documentation of your REST API from API Gateway. You
  /// can provide custom documentation to override this value.
  final String? body;

  /// The URL for your REST API. By default, API Gateway uses the default execute
  /// API endpoint. You can provide a custom domain to override this value.
  final String? endpoint;

  /// The operation name of the product REST endpoint.
  final String? operationName;

  DisplayContentOverrides({
    this.body,
    this.endpoint,
    this.operationName,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final endpoint = this.endpoint;
    final operationName = this.operationName;
    return {
      if (body != null) 'body': body,
      if (endpoint != null) 'endpoint': endpoint,
      if (operationName != null) 'operationName': operationName,
    };
  }
}

/// The content of the product page.
///
/// @nodoc
class DisplayContent {
  /// The body.
  final String body;

  /// The title.
  final String title;

  DisplayContent({
    required this.body,
    required this.title,
  });

  factory DisplayContent.fromJson(Map<String, dynamic> json) {
    return DisplayContent(
      body: (json['body'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final title = this.title;
    return {
      'body': body,
      'title': title,
    };
  }
}

/// The display order.
///
/// @nodoc
class DisplayOrder {
  /// Represents a list of sections which include section name and list of product
  /// REST endpoints for a product.
  final List<Section>? contents;

  /// The ARN of the overview page.
  final String? overviewPageArn;

  /// The product page ARNs.
  final List<String>? productPageArns;

  DisplayOrder({
    this.contents,
    this.overviewPageArn,
    this.productPageArns,
  });

  factory DisplayOrder.fromJson(Map<String, dynamic> json) {
    return DisplayOrder(
      contents: (json['contents'] as List?)
          ?.nonNulls
          .map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
      overviewPageArn: json['overviewPageArn'] as String?,
      productPageArns: (json['productPageArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final contents = this.contents;
    final overviewPageArn = this.overviewPageArn;
    final productPageArns = this.productPageArns;
    return {
      if (contents != null) 'contents': contents,
      if (overviewPageArn != null) 'overviewPageArn': overviewPageArn,
      if (productPageArns != null) 'productPageArns': productPageArns,
    };
  }
}

/// Contains the section name and list of product REST endpoints for a product.
///
/// @nodoc
class Section {
  /// The ARNs of the product REST endpoint pages in a portal product.
  final List<String> productRestEndpointPageArns;

  /// The section name.
  final String sectionName;

  Section({
    required this.productRestEndpointPageArns,
    required this.sectionName,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      productRestEndpointPageArns:
          ((json['productRestEndpointPageArns'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      sectionName: (json['sectionName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final productRestEndpointPageArns = this.productRestEndpointPageArns;
    final sectionName = this.sectionName;
    return {
      'productRestEndpointPageArns': productRestEndpointPageArns,
      'sectionName': sectionName,
    };
  }
}

/// Represents an authorization configuration for a portal.
///
/// @nodoc
class Authorization {
  /// The Amazon Cognito configuration.
  final CognitoConfig? cognitoConfig;

  /// Provide no authorization for your portal. This makes your portal publicly
  /// accesible on the web.
  final None? none;

  Authorization({
    this.cognitoConfig,
    this.none,
  });

  factory Authorization.fromJson(Map<String, dynamic> json) {
    return Authorization(
      cognitoConfig: json['cognitoConfig'] != null
          ? CognitoConfig.fromJson(
              json['cognitoConfig'] as Map<String, dynamic>)
          : null,
      none: json['none'] != null
          ? None.fromJson(json['none'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cognitoConfig = this.cognitoConfig;
    final none = this.none;
    return {
      if (cognitoConfig != null) 'cognitoConfig': cognitoConfig,
      if (none != null) 'none': none,
    };
  }
}

/// Represents an endpoint configuration.
///
/// @nodoc
class EndpointConfigurationResponse {
  /// The portal default domain name. This domain name is generated and managed by
  /// API Gateway.
  final String portalDefaultDomainName;

  /// The portal domain hosted zone identifier.
  final String portalDomainHostedZoneId;

  /// The ARN of the ACM certificate.
  final String? certificateArn;

  /// The domain name.
  final String? domainName;

  EndpointConfigurationResponse({
    required this.portalDefaultDomainName,
    required this.portalDomainHostedZoneId,
    this.certificateArn,
    this.domainName,
  });

  factory EndpointConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return EndpointConfigurationResponse(
      portalDefaultDomainName:
          (json['portalDefaultDomainName'] as String?) ?? '',
      portalDomainHostedZoneId:
          (json['portalDomainHostedZoneId'] as String?) ?? '',
      certificateArn: json['certificateArn'] as String?,
      domainName: json['domainName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final portalDefaultDomainName = this.portalDefaultDomainName;
    final portalDomainHostedZoneId = this.portalDomainHostedZoneId;
    final certificateArn = this.certificateArn;
    final domainName = this.domainName;
    return {
      'portalDefaultDomainName': portalDefaultDomainName,
      'portalDomainHostedZoneId': portalDomainHostedZoneId,
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (domainName != null) 'domainName': domainName,
    };
  }
}

/// Contains the content that is visible to portal consumers including the
/// themes, display names, and description.
///
/// @nodoc
class PortalContent {
  /// The display name for the portal.
  final String displayName;

  /// The theme for the portal.
  final PortalTheme theme;

  /// A description of the portal.
  final String? description;

  PortalContent({
    required this.displayName,
    required this.theme,
    this.description,
  });

  factory PortalContent.fromJson(Map<String, dynamic> json) {
    return PortalContent(
      displayName: (json['displayName'] as String?) ?? '',
      theme: PortalTheme.fromJson((json['theme'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final theme = this.theme;
    final description = this.description;
    return {
      'displayName': displayName,
      'theme': theme,
      if (description != null) 'description': description,
    };
  }
}

/// Contains the preview status and preview URL.
///
/// @nodoc
class Preview {
  /// The status of the preview.
  final PreviewStatus previewStatus;

  /// The URL of the preview.
  final String? previewUrl;

  /// The status exception information.
  final StatusException? statusException;

  Preview({
    required this.previewStatus,
    this.previewUrl,
    this.statusException,
  });

  factory Preview.fromJson(Map<String, dynamic> json) {
    return Preview(
      previewStatus:
          PreviewStatus.fromString((json['previewStatus'] as String?) ?? ''),
      previewUrl: json['previewUrl'] as String?,
      statusException: json['statusException'] != null
          ? StatusException.fromJson(
              json['statusException'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final previewStatus = this.previewStatus;
    final previewUrl = this.previewUrl;
    final statusException = this.statusException;
    return {
      'previewStatus': previewStatus.value,
      if (previewUrl != null) 'previewUrl': previewUrl,
      if (statusException != null) 'statusException': statusException,
    };
  }
}

/// Represents a publish status.
///
/// @nodoc
class PublishStatus {
  static const published = PublishStatus._('PUBLISHED');
  static const publishInProgress = PublishStatus._('PUBLISH_IN_PROGRESS');
  static const publishFailed = PublishStatus._('PUBLISH_FAILED');
  static const disableInProgress = PublishStatus._('DISABLE_IN_PROGRESS');
  static const disableFailed = PublishStatus._('DISABLE_FAILED');
  static const disabled = PublishStatus._('DISABLED');

  final String value;

  const PublishStatus._(this.value);

  static const values = [
    published,
    publishInProgress,
    publishFailed,
    disableInProgress,
    disableFailed,
    disabled
  ];

  static PublishStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PublishStatus._(value));

  @override
  bool operator ==(other) => other is PublishStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the preview status.
///
/// @nodoc
class PreviewStatus {
  static const previewInProgress = PreviewStatus._('PREVIEW_IN_PROGRESS');
  static const previewFailed = PreviewStatus._('PREVIEW_FAILED');
  static const previewReady = PreviewStatus._('PREVIEW_READY');

  final String value;

  const PreviewStatus._(this.value);

  static const values = [previewInProgress, previewFailed, previewReady];

  static PreviewStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PreviewStatus._(value));

  @override
  bool operator ==(other) => other is PreviewStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the theme for a portal.
///
/// @nodoc
class PortalTheme {
  /// Defines custom color values.
  final CustomColors customColors;

  /// The timestamp when the logo was last uploaded.
  final DateTime? logoLastUploaded;

  PortalTheme({
    required this.customColors,
    this.logoLastUploaded,
  });

  factory PortalTheme.fromJson(Map<String, dynamic> json) {
    return PortalTheme(
      customColors: CustomColors.fromJson(
          (json['customColors'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      logoLastUploaded: timeStampFromJson(json['logoLastUploaded']),
    );
  }

  Map<String, dynamic> toJson() {
    final customColors = this.customColors;
    final logoLastUploaded = this.logoLastUploaded;
    return {
      'customColors': customColors,
      if (logoLastUploaded != null)
        'logoLastUploaded': iso8601ToJson(logoLastUploaded),
    };
  }
}

/// Represents custom colors for a published portal.
///
/// @nodoc
class CustomColors {
  /// Represents the accent color.
  final String accentColor;

  /// Represents the background color.
  final String backgroundColor;

  /// The errorValidationColor.
  final String errorValidationColor;

  /// Represents the header color.
  final String headerColor;

  /// Represents the navigation color.
  final String navigationColor;

  /// Represents the text color.
  final String textColor;

  CustomColors({
    required this.accentColor,
    required this.backgroundColor,
    required this.errorValidationColor,
    required this.headerColor,
    required this.navigationColor,
    required this.textColor,
  });

  factory CustomColors.fromJson(Map<String, dynamic> json) {
    return CustomColors(
      accentColor: (json['accentColor'] as String?) ?? '',
      backgroundColor: (json['backgroundColor'] as String?) ?? '',
      errorValidationColor: (json['errorValidationColor'] as String?) ?? '',
      headerColor: (json['headerColor'] as String?) ?? '',
      navigationColor: (json['navigationColor'] as String?) ?? '',
      textColor: (json['textColor'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accentColor = this.accentColor;
    final backgroundColor = this.backgroundColor;
    final errorValidationColor = this.errorValidationColor;
    final headerColor = this.headerColor;
    final navigationColor = this.navigationColor;
    final textColor = this.textColor;
    return {
      'accentColor': accentColor,
      'backgroundColor': backgroundColor,
      'errorValidationColor': errorValidationColor,
      'headerColor': headerColor,
      'navigationColor': navigationColor,
      'textColor': textColor,
    };
  }
}

/// The configuration for using Amazon Cognito user pools to control access to
/// your portal.
///
/// @nodoc
class CognitoConfig {
  /// The app client ID.
  final String appClientId;

  /// The user pool ARN.
  final String userPoolArn;

  /// The user pool domain.
  final String userPoolDomain;

  CognitoConfig({
    required this.appClientId,
    required this.userPoolArn,
    required this.userPoolDomain,
  });

  factory CognitoConfig.fromJson(Map<String, dynamic> json) {
    return CognitoConfig(
      appClientId: (json['appClientId'] as String?) ?? '',
      userPoolArn: (json['userPoolArn'] as String?) ?? '',
      userPoolDomain: (json['userPoolDomain'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final appClientId = this.appClientId;
    final userPoolArn = this.userPoolArn;
    final userPoolDomain = this.userPoolDomain;
    return {
      'appClientId': appClientId,
      'userPoolArn': userPoolArn,
      'userPoolDomain': userPoolDomain,
    };
  }
}

/// Represents an endpoint configuration.
///
/// @nodoc
class EndpointConfigurationRequest {
  /// Represents a domain name and certificate for a portal.
  final ACMManaged? acmManaged;

  /// Use the default portal domain name that is generated and managed by API
  /// Gateway.
  final None? none;

  EndpointConfigurationRequest({
    this.acmManaged,
    this.none,
  });

  Map<String, dynamic> toJson() {
    final acmManaged = this.acmManaged;
    final none = this.none;
    return {
      if (acmManaged != null) 'acmManaged': acmManaged,
      if (none != null) 'none': none,
    };
  }
}

/// Represents a domain name and certificate for a portal.
///
/// @nodoc
class ACMManaged {
  /// The certificate ARN.
  final String certificateArn;

  /// The domain name.
  final String domainName;

  ACMManaged({
    required this.certificateArn,
    required this.domainName,
  });

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final domainName = this.domainName;
    return {
      'certificateArn': certificateArn,
      'domainName': domainName,
    };
  }
}

/// Specifies how to handle response payload content type conversions. Supported
/// only for WebSocket APIs.
///
/// @nodoc
class ContentHandlingStrategy {
  static const convertToBinary = ContentHandlingStrategy._('CONVERT_TO_BINARY');
  static const convertToText = ContentHandlingStrategy._('CONVERT_TO_TEXT');

  final String value;

  const ContentHandlingStrategy._(this.value);

  static const values = [convertToBinary, convertToText];

  static ContentHandlingStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContentHandlingStrategy._(value));

  @override
  bool operator ==(other) =>
      other is ContentHandlingStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a connection type.
///
/// @nodoc
class ConnectionType {
  static const internet = ConnectionType._('INTERNET');
  static const vpcLink = ConnectionType._('VPC_LINK');

  final String value;

  const ConnectionType._(this.value);

  static const values = [internet, vpcLink];

  static ConnectionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectionType._(value));

  @override
  bool operator ==(other) => other is ConnectionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an API method integration type.
///
/// @nodoc
class IntegrationType {
  static const aws = IntegrationType._('AWS');
  static const http = IntegrationType._('HTTP');
  static const mock = IntegrationType._('MOCK');
  static const httpProxy = IntegrationType._('HTTP_PROXY');
  static const awsProxy = IntegrationType._('AWS_PROXY');

  final String value;

  const IntegrationType._(this.value);

  static const values = [aws, http, mock, httpProxy, awsProxy];

  static IntegrationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IntegrationType._(value));

  @override
  bool operator ==(other) => other is IntegrationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents passthrough behavior for an integration response. Supported only
/// for WebSocket APIs.
///
/// @nodoc
class PassthroughBehavior {
  static const whenNoMatch = PassthroughBehavior._('WHEN_NO_MATCH');
  static const never = PassthroughBehavior._('NEVER');
  static const whenNoTemplates = PassthroughBehavior._('WHEN_NO_TEMPLATES');

  final String value;

  const PassthroughBehavior._(this.value);

  static const values = [whenNoMatch, never, whenNoTemplates];

  static PassthroughBehavior fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PassthroughBehavior._(value));

  @override
  bool operator ==(other) =>
      other is PassthroughBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The TLS configuration for a private integration. If you specify a TLS
/// configuration, private integration traffic uses the HTTPS protocol.
/// Supported only for HTTP APIs.
///
/// @nodoc
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
///
/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class RoutingMode {
  static const apiMappingOnly = RoutingMode._('API_MAPPING_ONLY');
  static const routingRuleOnly = RoutingMode._('ROUTING_RULE_ONLY');
  static const routingRuleThenApiMapping =
      RoutingMode._('ROUTING_RULE_THEN_API_MAPPING');

  final String value;

  const RoutingMode._(this.value);

  static const values = [
    apiMappingOnly,
    routingRuleOnly,
    routingRuleThenApiMapping
  ];

  static RoutingMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RoutingMode._(value));

  @override
  bool operator ==(other) => other is RoutingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The domain name configuration.
///
/// @nodoc
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

  /// The IP address types that can invoke the domain name. Use ipv4 to allow only
  /// IPv4 addresses to invoke your domain name, or use dualstack to allow both
  /// IPv4 and IPv6 addresses to invoke your domain name.
  final IpAddressType? ipAddressType;

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
    this.ipAddressType,
    this.ownershipVerificationCertificateArn,
    this.securityPolicy,
  });

  factory DomainNameConfiguration.fromJson(Map<String, dynamic> json) {
    return DomainNameConfiguration(
      apiGatewayDomainName: json['apiGatewayDomainName'] as String?,
      certificateArn: json['certificateArn'] as String?,
      certificateName: json['certificateName'] as String?,
      certificateUploadDate: timeStampFromJson(json['certificateUploadDate']),
      domainNameStatus: (json['domainNameStatus'] as String?)
          ?.let(DomainNameStatus.fromString),
      domainNameStatusMessage: json['domainNameStatusMessage'] as String?,
      endpointType:
          (json['endpointType'] as String?)?.let(EndpointType.fromString),
      hostedZoneId: json['hostedZoneId'] as String?,
      ipAddressType:
          (json['ipAddressType'] as String?)?.let(IpAddressType.fromString),
      ownershipVerificationCertificateArn:
          json['ownershipVerificationCertificateArn'] as String?,
      securityPolicy:
          (json['securityPolicy'] as String?)?.let(SecurityPolicy.fromString),
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
    final ipAddressType = this.ipAddressType;
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
      if (domainNameStatus != null) 'domainNameStatus': domainNameStatus.value,
      if (domainNameStatusMessage != null)
        'domainNameStatusMessage': domainNameStatusMessage,
      if (endpointType != null) 'endpointType': endpointType.value,
      if (hostedZoneId != null) 'hostedZoneId': hostedZoneId,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (ownershipVerificationCertificateArn != null)
        'ownershipVerificationCertificateArn':
            ownershipVerificationCertificateArn,
      if (securityPolicy != null) 'securityPolicy': securityPolicy.value,
    };
  }
}

/// The status of the domain name migration. The valid values are AVAILABLE,
/// UPDATING, PENDING_CERTIFICATE_REIMPORT, and PENDING_OWNERSHIP_VERIFICATION.
/// If the status is UPDATING, the domain cannot be modified further until the
/// existing operation is complete. If it is AVAILABLE, the domain can be
/// updated.
///
/// @nodoc
class DomainNameStatus {
  static const available = DomainNameStatus._('AVAILABLE');
  static const updating = DomainNameStatus._('UPDATING');
  static const pendingCertificateReimport =
      DomainNameStatus._('PENDING_CERTIFICATE_REIMPORT');
  static const pendingOwnershipVerification =
      DomainNameStatus._('PENDING_OWNERSHIP_VERIFICATION');

  final String value;

  const DomainNameStatus._(this.value);

  static const values = [
    available,
    updating,
    pendingCertificateReimport,
    pendingOwnershipVerification
  ];

  static DomainNameStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DomainNameStatus._(value));

  @override
  bool operator ==(other) => other is DomainNameStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an endpoint type.
///
/// @nodoc
class EndpointType {
  static const regional = EndpointType._('REGIONAL');
  static const edge = EndpointType._('EDGE');

  final String value;

  const EndpointType._(this.value);

  static const values = [regional, edge];

  static EndpointType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EndpointType._(value));

  @override
  bool operator ==(other) => other is EndpointType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The IP address types that can invoke your API or domain name.
///
/// @nodoc
class IpAddressType {
  static const ipv4 = IpAddressType._('ipv4');
  static const dualstack = IpAddressType._('dualstack');

  final String value;

  const IpAddressType._(this.value);

  static const values = [ipv4, dualstack];

  static IpAddressType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IpAddressType._(value));

  @override
  bool operator ==(other) => other is IpAddressType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Transport Layer Security (TLS) version of the security policy for this
/// domain name. The valid values are TLS_1_0 and TLS_1_2.
///
/// @nodoc
class SecurityPolicy {
  static const tls_1_0 = SecurityPolicy._('TLS_1_0');
  static const tls_1_2 = SecurityPolicy._('TLS_1_2');

  final String value;

  const SecurityPolicy._(this.value);

  static const values = [tls_1_0, tls_1_2];

  static SecurityPolicy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SecurityPolicy._(value));

  @override
  bool operator ==(other) => other is SecurityPolicy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
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

/// Represents a deployment status.
///
/// @nodoc
class DeploymentStatus {
  static const pending = DeploymentStatus._('PENDING');
  static const failed = DeploymentStatus._('FAILED');
  static const deployed = DeploymentStatus._('DEPLOYED');

  final String value;

  const DeploymentStatus._(this.value);

  static const values = [pending, failed, deployed];

  static DeploymentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeploymentStatus._(value));

  @override
  bool operator ==(other) => other is DeploymentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The authorizer type. Specify REQUEST for a Lambda function using incoming
/// request parameters. Specify JWT to use JSON Web Tokens (supported only for
/// HTTP APIs).
///
/// @nodoc
class AuthorizerType {
  static const request = AuthorizerType._('REQUEST');
  static const jwt = AuthorizerType._('JWT');

  final String value;

  const AuthorizerType._(this.value);

  static const values = [request, jwt];

  static AuthorizerType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AuthorizerType._(value));

  @override
  bool operator ==(other) => other is AuthorizerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the configuration of a JWT authorizer. Required for the JWT
/// authorizer type. Supported only for HTTP APIs.
///
/// @nodoc
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
          ?.nonNulls
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

/// Represents a CORS configuration. Supported only for HTTP APIs. See <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-cors.html">Configuring
/// CORS</a> for more information.
///
/// @nodoc
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowMethods: (json['allowMethods'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      allowOrigins: (json['allowOrigins'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      exposeHeaders: (json['exposeHeaders'] as List?)
          ?.nonNulls
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

/// Represents a protocol type.
///
/// @nodoc
class ProtocolType {
  static const websocket = ProtocolType._('WEBSOCKET');
  static const http = ProtocolType._('HTTP');

  final String value;

  const ProtocolType._(this.value);

  static const values = [websocket, http];

  static ProtocolType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ProtocolType._(value));

  @override
  bool operator ==(other) => other is ProtocolType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a routing rule condition.
///
/// @nodoc
class RoutingRuleCondition {
  /// The base path to be matched.
  final RoutingRuleMatchBasePaths? matchBasePaths;

  /// The headers to be matched.
  final RoutingRuleMatchHeaders? matchHeaders;

  RoutingRuleCondition({
    this.matchBasePaths,
    this.matchHeaders,
  });

  factory RoutingRuleCondition.fromJson(Map<String, dynamic> json) {
    return RoutingRuleCondition(
      matchBasePaths: json['matchBasePaths'] != null
          ? RoutingRuleMatchBasePaths.fromJson(
              json['matchBasePaths'] as Map<String, dynamic>)
          : null,
      matchHeaders: json['matchHeaders'] != null
          ? RoutingRuleMatchHeaders.fromJson(
              json['matchHeaders'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final matchBasePaths = this.matchBasePaths;
    final matchHeaders = this.matchHeaders;
    return {
      if (matchBasePaths != null) 'matchBasePaths': matchBasePaths,
      if (matchHeaders != null) 'matchHeaders': matchHeaders,
    };
  }
}

/// Represents a MatchBasePaths condition.
///
/// @nodoc
class RoutingRuleMatchBasePaths {
  /// The string of the case sensitive base path to be matched.
  final List<String> anyOf;

  RoutingRuleMatchBasePaths({
    required this.anyOf,
  });

  factory RoutingRuleMatchBasePaths.fromJson(Map<String, dynamic> json) {
    return RoutingRuleMatchBasePaths(
      anyOf: ((json['anyOf'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final anyOf = this.anyOf;
    return {
      'anyOf': anyOf,
    };
  }
}

/// Represents a MatchHeaders condition.
///
/// @nodoc
class RoutingRuleMatchHeaders {
  /// The header name and header value glob to be matched. The matchHeaders
  /// condition is matched if any of the header name and header value globs are
  /// matched.
  final List<RoutingRuleMatchHeaderValue> anyOf;

  RoutingRuleMatchHeaders({
    required this.anyOf,
  });

  factory RoutingRuleMatchHeaders.fromJson(Map<String, dynamic> json) {
    return RoutingRuleMatchHeaders(
      anyOf: ((json['anyOf'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RoutingRuleMatchHeaderValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final anyOf = this.anyOf;
    return {
      'anyOf': anyOf,
    };
  }
}

/// Represents a MatchHeaderValue.
///
/// @nodoc
class RoutingRuleMatchHeaderValue {
  final String header;
  final String valueGlob;

  RoutingRuleMatchHeaderValue({
    required this.header,
    required this.valueGlob,
  });

  factory RoutingRuleMatchHeaderValue.fromJson(Map<String, dynamic> json) {
    return RoutingRuleMatchHeaderValue(
      header: (json['header'] as String?) ?? '',
      valueGlob: (json['valueGlob'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final header = this.header;
    final valueGlob = this.valueGlob;
    return {
      'header': header,
      'valueGlob': valueGlob,
    };
  }
}

/// The routing rule action.
///
/// @nodoc
class RoutingRuleAction {
  final RoutingRuleActionInvokeApi invokeApi;

  RoutingRuleAction({
    required this.invokeApi,
  });

  factory RoutingRuleAction.fromJson(Map<String, dynamic> json) {
    return RoutingRuleAction(
      invokeApi: RoutingRuleActionInvokeApi.fromJson(
          (json['invokeApi'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final invokeApi = this.invokeApi;
    return {
      'invokeApi': invokeApi,
    };
  }
}

/// Represents an InvokeApi action.
///
/// @nodoc
class RoutingRuleActionInvokeApi {
  final String apiId;
  final String stage;

  /// The strip base path setting.
  final bool? stripBasePath;

  RoutingRuleActionInvokeApi({
    required this.apiId,
    required this.stage,
    this.stripBasePath,
  });

  factory RoutingRuleActionInvokeApi.fromJson(Map<String, dynamic> json) {
    return RoutingRuleActionInvokeApi(
      apiId: (json['apiId'] as String?) ?? '',
      stage: (json['stage'] as String?) ?? '',
      stripBasePath: json['stripBasePath'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiId = this.apiId;
    final stage = this.stage;
    final stripBasePath = this.stripBasePath;
    return {
      'apiId': apiId,
      'stage': stage,
      if (stripBasePath != null) 'stripBasePath': stripBasePath,
    };
  }
}

/// Represents a routing rule.
///
/// @nodoc
class RoutingRule {
  /// The routing rule action.
  final List<RoutingRuleAction>? actions;

  /// The routing rule condition.
  final List<RoutingRuleCondition>? conditions;

  /// The routing rule priority.
  final int? priority;

  /// The routing rule ARN.
  final String? routingRuleArn;

  /// The routing rule ID.
  final String? routingRuleId;

  RoutingRule({
    this.actions,
    this.conditions,
    this.priority,
    this.routingRuleArn,
    this.routingRuleId,
  });

  factory RoutingRule.fromJson(Map<String, dynamic> json) {
    return RoutingRule(
      actions: (json['actions'] as List?)
          ?.nonNulls
          .map((e) => RoutingRuleAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditions: (json['conditions'] as List?)
          ?.nonNulls
          .map((e) => RoutingRuleCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      priority: json['priority'] as int?,
      routingRuleArn: json['routingRuleArn'] as String?,
      routingRuleId: json['routingRuleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final conditions = this.conditions;
    final priority = this.priority;
    final routingRuleArn = this.routingRuleArn;
    final routingRuleId = this.routingRuleId;
    return {
      if (actions != null) 'actions': actions,
      if (conditions != null) 'conditions': conditions,
      if (priority != null) 'priority': priority,
      if (routingRuleArn != null) 'routingRuleArn': routingRuleArn,
      if (routingRuleId != null) 'routingRuleId': routingRuleId,
    };
  }
}

/// A summary of a product REST endpoint page, without providing the page
/// content.
///
/// @nodoc
class ProductRestEndpointPageSummaryNoBody {
  /// The endpoint of the product REST endpoint page.
  final String endpoint;

  /// The timestamp when the product REST endpoint page was last modified.
  final DateTime lastModified;

  /// The ARN of the product REST endpoint page.
  final String productRestEndpointPageArn;

  /// The product REST endpoint page identifier.
  final String productRestEndpointPageId;

  /// The REST endpoint identifier.
  final RestEndpointIdentifier restEndpointIdentifier;

  /// The status.
  final Status status;

  /// The try it state of a product REST endpoint page.
  final TryItState tryItState;

  /// The operation name of the product REST endpoint.
  final String? operationName;

  /// The status exception information.
  final StatusException? statusException;

  ProductRestEndpointPageSummaryNoBody({
    required this.endpoint,
    required this.lastModified,
    required this.productRestEndpointPageArn,
    required this.productRestEndpointPageId,
    required this.restEndpointIdentifier,
    required this.status,
    required this.tryItState,
    this.operationName,
    this.statusException,
  });

  factory ProductRestEndpointPageSummaryNoBody.fromJson(
      Map<String, dynamic> json) {
    return ProductRestEndpointPageSummaryNoBody(
      endpoint: (json['endpoint'] as String?) ?? '',
      lastModified: nonNullableTimeStampFromJson(json['lastModified'] ?? 0),
      productRestEndpointPageArn:
          (json['productRestEndpointPageArn'] as String?) ?? '',
      productRestEndpointPageId:
          (json['productRestEndpointPageId'] as String?) ?? '',
      restEndpointIdentifier: RestEndpointIdentifier.fromJson(
          (json['restEndpointIdentifier'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: Status.fromString((json['status'] as String?) ?? ''),
      tryItState: TryItState.fromString((json['tryItState'] as String?) ?? ''),
      operationName: json['operationName'] as String?,
      statusException: json['statusException'] != null
          ? StatusException.fromJson(
              json['statusException'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final lastModified = this.lastModified;
    final productRestEndpointPageArn = this.productRestEndpointPageArn;
    final productRestEndpointPageId = this.productRestEndpointPageId;
    final restEndpointIdentifier = this.restEndpointIdentifier;
    final status = this.status;
    final tryItState = this.tryItState;
    final operationName = this.operationName;
    final statusException = this.statusException;
    return {
      'endpoint': endpoint,
      'lastModified': iso8601ToJson(lastModified),
      'productRestEndpointPageArn': productRestEndpointPageArn,
      'productRestEndpointPageId': productRestEndpointPageId,
      'restEndpointIdentifier': restEndpointIdentifier,
      'status': status.value,
      'tryItState': tryItState.value,
      if (operationName != null) 'operationName': operationName,
      if (statusException != null) 'statusException': statusException,
    };
  }
}

/// Represents a product page summary without listing any page content.
///
/// @nodoc
class ProductPageSummaryNoBody {
  /// The timestamp when the product page was last modified.
  final DateTime lastModified;

  /// The page title.
  final String pageTitle;

  /// The ARN of the product page.
  final String productPageArn;

  /// The product page identifier.
  final String productPageId;

  ProductPageSummaryNoBody({
    required this.lastModified,
    required this.pageTitle,
    required this.productPageArn,
    required this.productPageId,
  });

  factory ProductPageSummaryNoBody.fromJson(Map<String, dynamic> json) {
    return ProductPageSummaryNoBody(
      lastModified: nonNullableTimeStampFromJson(json['lastModified'] ?? 0),
      pageTitle: (json['pageTitle'] as String?) ?? '',
      productPageArn: (json['productPageArn'] as String?) ?? '',
      productPageId: (json['productPageId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final lastModified = this.lastModified;
    final pageTitle = this.pageTitle;
    final productPageArn = this.productPageArn;
    final productPageId = this.productPageId;
    return {
      'lastModified': iso8601ToJson(lastModified),
      'pageTitle': pageTitle,
      'productPageArn': productPageArn,
      'productPageId': productPageId,
    };
  }
}

/// Represents a portal summary.
///
/// @nodoc
class PortalSummary {
  /// The authorization of the portal.
  final Authorization authorization;

  /// The endpoint configuration of the portal.
  final EndpointConfigurationResponse endpointConfiguration;

  /// The ARNs of the portal products included in the portal.
  final List<String> includedPortalProductArns;

  /// The timestamp when the portal was last modified.
  final DateTime lastModified;

  /// The ARN of the portal.
  final String portalArn;

  /// Contains the content that is visible to portal consumers including the
  /// themes, display names, and description.
  final PortalContent portalContent;

  /// The portal identifier.
  final String portalId;

  /// The timestamp when the portal was last published.
  final DateTime? lastPublished;

  /// The description of the portal the last time it was published.
  final String? lastPublishedDescription;

  /// Represents the preview endpoint and the any possible error messages during
  /// preview generation.
  final Preview? preview;

  /// The publish status.
  final PublishStatus? publishStatus;

  /// The CloudWatch RUM app monitor name.
  final String? rumAppMonitorName;

  /// The status exception information.
  final StatusException? statusException;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  PortalSummary({
    required this.authorization,
    required this.endpointConfiguration,
    required this.includedPortalProductArns,
    required this.lastModified,
    required this.portalArn,
    required this.portalContent,
    required this.portalId,
    this.lastPublished,
    this.lastPublishedDescription,
    this.preview,
    this.publishStatus,
    this.rumAppMonitorName,
    this.statusException,
    this.tags,
  });

  factory PortalSummary.fromJson(Map<String, dynamic> json) {
    return PortalSummary(
      authorization: Authorization.fromJson(
          (json['authorization'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      endpointConfiguration: EndpointConfigurationResponse.fromJson(
          (json['endpointConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      includedPortalProductArns:
          ((json['includedPortalProductArns'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      lastModified: nonNullableTimeStampFromJson(json['lastModified'] ?? 0),
      portalArn: (json['portalArn'] as String?) ?? '',
      portalContent: PortalContent.fromJson(
          (json['portalContent'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      portalId: (json['portalId'] as String?) ?? '',
      lastPublished: timeStampFromJson(json['lastPublished']),
      lastPublishedDescription: json['lastPublishedDescription'] as String?,
      preview: json['preview'] != null
          ? Preview.fromJson(json['preview'] as Map<String, dynamic>)
          : null,
      publishStatus:
          (json['publishStatus'] as String?)?.let(PublishStatus.fromString),
      rumAppMonitorName: json['rumAppMonitorName'] as String?,
      statusException: json['statusException'] != null
          ? StatusException.fromJson(
              json['statusException'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final authorization = this.authorization;
    final endpointConfiguration = this.endpointConfiguration;
    final includedPortalProductArns = this.includedPortalProductArns;
    final lastModified = this.lastModified;
    final portalArn = this.portalArn;
    final portalContent = this.portalContent;
    final portalId = this.portalId;
    final lastPublished = this.lastPublished;
    final lastPublishedDescription = this.lastPublishedDescription;
    final preview = this.preview;
    final publishStatus = this.publishStatus;
    final rumAppMonitorName = this.rumAppMonitorName;
    final statusException = this.statusException;
    final tags = this.tags;
    return {
      'authorization': authorization,
      'endpointConfiguration': endpointConfiguration,
      'includedPortalProductArns': includedPortalProductArns,
      'lastModified': iso8601ToJson(lastModified),
      'portalArn': portalArn,
      'portalContent': portalContent,
      'portalId': portalId,
      if (lastPublished != null) 'lastPublished': iso8601ToJson(lastPublished),
      if (lastPublishedDescription != null)
        'lastPublishedDescription': lastPublishedDescription,
      if (preview != null) 'preview': preview,
      if (publishStatus != null) 'publishStatus': publishStatus.value,
      if (rumAppMonitorName != null) 'rumAppMonitorName': rumAppMonitorName,
      if (statusException != null) 'statusException': statusException,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents a portal product.
///
/// @nodoc
class PortalProductSummary {
  /// The description.
  final String description;

  /// The display name of a portal product.
  final String displayName;

  /// The timestamp when the portal product was last modified.
  final DateTime lastModified;

  /// The ARN of a portal product.
  final String portalProductArn;

  /// The portal product identifier.
  final String portalProductId;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  final Map<String, String>? tags;

  PortalProductSummary({
    required this.description,
    required this.displayName,
    required this.lastModified,
    required this.portalProductArn,
    required this.portalProductId,
    this.tags,
  });

  factory PortalProductSummary.fromJson(Map<String, dynamic> json) {
    return PortalProductSummary(
      description: (json['description'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      lastModified: nonNullableTimeStampFromJson(json['lastModified'] ?? 0),
      portalProductArn: (json['portalProductArn'] as String?) ?? '',
      portalProductId: (json['portalProductId'] as String?) ?? '',
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final lastModified = this.lastModified;
    final portalProductArn = this.portalProductArn;
    final portalProductId = this.portalProductId;
    final tags = this.tags;
    return {
      'description': description,
      'displayName': displayName,
      'lastModified': iso8601ToJson(lastModified),
      'portalProductArn': portalProductArn,
      'portalProductId': portalProductId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Represents a VPC link.
///
/// @nodoc
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
      name: (json['name'] as String?) ?? '',
      securityGroupIds: ((json['securityGroupIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      vpcLinkId: (json['vpcLinkId'] as String?) ?? '',
      createdDate: timeStampFromJson(json['createdDate']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcLinkStatus:
          (json['vpcLinkStatus'] as String?)?.let(VpcLinkStatus.fromString),
      vpcLinkStatusMessage: json['vpcLinkStatusMessage'] as String?,
      vpcLinkVersion:
          (json['vpcLinkVersion'] as String?)?.let(VpcLinkVersion.fromString),
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
      if (vpcLinkStatus != null) 'vpcLinkStatus': vpcLinkStatus.value,
      if (vpcLinkStatusMessage != null)
        'vpcLinkStatusMessage': vpcLinkStatusMessage,
      if (vpcLinkVersion != null) 'vpcLinkVersion': vpcLinkVersion.value,
    };
  }
}

/// Represents an API stage.
///
/// @nodoc
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
  /// \[A-Za-z0-9-._~:/?#&amp;=,\]+.
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
      stageName: (json['stageName'] as String?) ?? '',
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

/// Represents a route.
///
/// @nodoc
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
      routeKey: (json['routeKey'] as String?) ?? '',
      apiGatewayManaged: json['apiGatewayManaged'] as bool?,
      apiKeyRequired: json['apiKeyRequired'] as bool?,
      authorizationScopes: (json['authorizationScopes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      authorizationType: (json['authorizationType'] as String?)
          ?.let(AuthorizationType.fromString),
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
        'authorizationType': authorizationType.value,
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
///
/// @nodoc
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
      routeResponseKey: (json['routeResponseKey'] as String?) ?? '',
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

/// Represents a data model for an API. Supported only for WebSocket APIs. See
/// <a
/// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/models-mappings.html">Create
/// Models and Mapping Templates for Request and Response Mappings</a>.
///
/// @nodoc
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
      name: (json['name'] as String?) ?? '',
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

/// Represents an integration.
///
/// @nodoc
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
  /// HTTP APIs. Supported values for Lambda proxy integrations are 1.0 and 2.0.
  /// For all other integrations, 1.0 is the only supported value. To learn more,
  /// see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-develop-integrations-lambda.html">Working
  /// with AWS Lambda proxy integrations for HTTP APIs</a>.
  final String? payloadFormatVersion;

  /// For WebSocket APIs, a key-value map specifying request parameters that are
  /// passed from the method request to the backend. The key is an integration
  /// request parameter name and the associated value is a method request
  /// parameter value or static value that must be enclosed within single quotes
  /// and pre-encoded as required by the backend. The method request parameter
  /// value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where <replaceable>{location}</replaceable> is querystring, path, or
  /// header; and <replaceable>{name}</replaceable> must be a valid and unique
  /// method request parameter name.
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
      connectionType:
          (json['connectionType'] as String?)?.let(ConnectionType.fromString),
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.let(ContentHandlingStrategy.fromString),
      credentialsArn: json['credentialsArn'] as String?,
      description: json['description'] as String?,
      integrationId: json['integrationId'] as String?,
      integrationMethod: json['integrationMethod'] as String?,
      integrationResponseSelectionExpression:
          json['integrationResponseSelectionExpression'] as String?,
      integrationSubtype: json['integrationSubtype'] as String?,
      integrationType:
          (json['integrationType'] as String?)?.let(IntegrationType.fromString),
      integrationUri: json['integrationUri'] as String?,
      passthroughBehavior: (json['passthroughBehavior'] as String?)
          ?.let(PassthroughBehavior.fromString),
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
      if (connectionType != null) 'connectionType': connectionType.value,
      if (contentHandlingStrategy != null)
        'contentHandlingStrategy': contentHandlingStrategy.value,
      if (credentialsArn != null) 'credentialsArn': credentialsArn,
      if (description != null) 'description': description,
      if (integrationId != null) 'integrationId': integrationId,
      if (integrationMethod != null) 'integrationMethod': integrationMethod,
      if (integrationResponseSelectionExpression != null)
        'integrationResponseSelectionExpression':
            integrationResponseSelectionExpression,
      if (integrationSubtype != null) 'integrationSubtype': integrationSubtype,
      if (integrationType != null) 'integrationType': integrationType.value,
      if (integrationUri != null) 'integrationUri': integrationUri,
      if (passthroughBehavior != null)
        'passthroughBehavior': passthroughBehavior.value,
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
///
/// @nodoc
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
      integrationResponseKey: (json['integrationResponseKey'] as String?) ?? '',
      contentHandlingStrategy: (json['contentHandlingStrategy'] as String?)
          ?.let(ContentHandlingStrategy.fromString),
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
        'contentHandlingStrategy': contentHandlingStrategy.value,
      if (integrationResponseId != null)
        'integrationResponseId': integrationResponseId,
      if (responseParameters != null) 'responseParameters': responseParameters,
      if (responseTemplates != null) 'responseTemplates': responseTemplates,
      if (templateSelectionExpression != null)
        'templateSelectionExpression': templateSelectionExpression,
    };
  }
}

/// Represents a domain name.
///
/// @nodoc
class DomainName {
  /// The name of the DomainName resource.
  final String domainName;

  /// The API mapping selection expression.
  final String? apiMappingSelectionExpression;
  final String? domainNameArn;

  /// The domain name configurations.
  final List<DomainNameConfiguration>? domainNameConfigurations;

  /// The mutual TLS authentication configuration for a custom domain name.
  final MutualTlsAuthentication? mutualTlsAuthentication;

  /// The routing mode.
  final RoutingMode? routingMode;

  /// The collection of tags associated with a domain name.
  final Map<String, String>? tags;

  DomainName({
    required this.domainName,
    this.apiMappingSelectionExpression,
    this.domainNameArn,
    this.domainNameConfigurations,
    this.mutualTlsAuthentication,
    this.routingMode,
    this.tags,
  });

  factory DomainName.fromJson(Map<String, dynamic> json) {
    return DomainName(
      domainName: (json['domainName'] as String?) ?? '',
      apiMappingSelectionExpression:
          json['apiMappingSelectionExpression'] as String?,
      domainNameArn: json['domainNameArn'] as String?,
      domainNameConfigurations: (json['domainNameConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              DomainNameConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      mutualTlsAuthentication: json['mutualTlsAuthentication'] != null
          ? MutualTlsAuthentication.fromJson(
              json['mutualTlsAuthentication'] as Map<String, dynamic>)
          : null,
      routingMode:
          (json['routingMode'] as String?)?.let(RoutingMode.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final apiMappingSelectionExpression = this.apiMappingSelectionExpression;
    final domainNameArn = this.domainNameArn;
    final domainNameConfigurations = this.domainNameConfigurations;
    final mutualTlsAuthentication = this.mutualTlsAuthentication;
    final routingMode = this.routingMode;
    final tags = this.tags;
    return {
      'domainName': domainName,
      if (apiMappingSelectionExpression != null)
        'apiMappingSelectionExpression': apiMappingSelectionExpression,
      if (domainNameArn != null) 'domainNameArn': domainNameArn,
      if (domainNameConfigurations != null)
        'domainNameConfigurations': domainNameConfigurations,
      if (mutualTlsAuthentication != null)
        'mutualTlsAuthentication': mutualTlsAuthentication,
      if (routingMode != null) 'routingMode': routingMode.value,
      if (tags != null) 'tags': tags,
    };
  }
}

/// An immutable representation of an API that can be called by users. A
/// Deployment must be associated with a Stage for it to be callable over the
/// internet.
///
/// @nodoc
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
      deploymentStatus: (json['deploymentStatus'] as String?)
          ?.let(DeploymentStatus.fromString),
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
      if (deploymentStatus != null) 'deploymentStatus': deploymentStatus.value,
      if (deploymentStatusMessage != null)
        'deploymentStatusMessage': deploymentStatusMessage,
      if (description != null) 'description': description,
    };
  }
}

/// Represents an authorizer.
///
/// @nodoc
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
  /// /2015-03-31/functions/\[FunctionARN\]/invocations. Supported only for
  /// REQUEST authorizers.
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
      name: (json['name'] as String?) ?? '',
      authorizerCredentialsArn: json['authorizerCredentialsArn'] as String?,
      authorizerId: json['authorizerId'] as String?,
      authorizerPayloadFormatVersion:
          json['authorizerPayloadFormatVersion'] as String?,
      authorizerResultTtlInSeconds:
          json['authorizerResultTtlInSeconds'] as int?,
      authorizerType:
          (json['authorizerType'] as String?)?.let(AuthorizerType.fromString),
      authorizerUri: json['authorizerUri'] as String?,
      enableSimpleResponses: json['enableSimpleResponses'] as bool?,
      identitySource: (json['identitySource'] as List?)
          ?.nonNulls
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
      if (authorizerType != null) 'authorizerType': authorizerType.value,
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

/// Represents an API.
///
/// @nodoc
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

  /// The IP address types that can invoke the API.
  final IpAddressType? ipAddressType;

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
    this.ipAddressType,
    this.tags,
    this.version,
    this.warnings,
  });

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      name: (json['name'] as String?) ?? '',
      protocolType:
          ProtocolType.fromString((json['protocolType'] as String?) ?? ''),
      routeSelectionExpression:
          (json['routeSelectionExpression'] as String?) ?? '',
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ipAddressType:
          (json['ipAddressType'] as String?)?.let(IpAddressType.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
      warnings: (json['warnings'] as List?)
          ?.nonNulls
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
    final ipAddressType = this.ipAddressType;
    final tags = this.tags;
    final version = this.version;
    final warnings = this.warnings;
    return {
      'name': name,
      'protocolType': protocolType.value,
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
      if (ipAddressType != null) 'ipAddressType': ipAddressType.value,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
      if (warnings != null) 'warnings': warnings,
    };
  }
}

/// Represents an API mapping.
///
/// @nodoc
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
      apiId: (json['apiId'] as String?) ?? '',
      stage: (json['stage'] as String?) ?? '',
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

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

/// @nodoc
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
