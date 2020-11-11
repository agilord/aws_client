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
        Uint8ListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'apigatewayv2-2018-11-29.g.dart';

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
          service: 'apigateway',
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
    bool disableSchemaValidation,
    String routeKey,
    String routeSelectionExpression,
    Map<String, String> tags,
    String target,
    String version,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(protocolType, 'protocolType');
    final $payload = CreateApiRequest(
      name: name,
      protocolType: protocolType,
      apiKeySelectionExpression: apiKeySelectionExpression,
      corsConfiguration: corsConfiguration,
      credentialsArn: credentialsArn,
      description: description,
      disableSchemaValidation: disableSchemaValidation,
      routeKey: routeKey,
      routeSelectionExpression: routeSelectionExpression,
      tags: tags,
      target: target,
      version: version,
    );
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
    final $payload = CreateApiMappingRequest(
      apiId: apiId,
      domainName: domainName,
      stage: stage,
      apiMappingKey: apiMappingKey,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName.toString())}/apimappings',
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
  /// The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda
  /// function using incoming request parameters. For HTTP APIs, specify JWT to
  /// use JSON Web Tokens.
  ///
  /// Parameter [identitySource] :
  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. Currently,
  /// the identity source can be headers, query string parameters, stage
  /// variables, and context parameters. For example, if an Auth header and a
  /// Name query string parameter are defined as identity sources, this value is
  /// route.request.header.Auth, route.request.querystring.Name. These
  /// parameters will be used to perform runtime validation for Lambda-based
  /// authorizers by verifying all of the identity-related request parameters
  /// are present in the request, not null, and non-empty. Only when this is
  /// true does the authorizer invoke the authorizer Lambda function. Otherwise,
  /// it returns a 401 Unauthorized response without calling the Lambda
  /// function.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT )from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// "$request.header.Authorization".
  ///
  /// Parameter [name] :
  /// The name of the authorizer.
  ///
  /// Parameter [authorizerCredentialsArn] :
  /// Specifies the required credentials as an IAM role for API Gateway to
  /// invoke the authorizer. To specify an IAM role for API Gateway to assume,
  /// use the role's Amazon Resource Name (ARN). To use resource-based
  /// permissions on the Lambda function, specify null. Supported only for
  /// REQUEST authorizers.
  ///
  /// Parameter [authorizerResultTtlInSeconds] :
  /// Authorizer caching is not currently supported. Don't specify this value
  /// for authorizers.
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
    int authorizerResultTtlInSeconds,
    String authorizerUri,
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
    final $payload = CreateAuthorizerRequest(
      apiId: apiId,
      authorizerType: authorizerType,
      identitySource: identitySource,
      name: name,
      authorizerCredentialsArn: authorizerCredentialsArn,
      authorizerResultTtlInSeconds: authorizerResultTtlInSeconds,
      authorizerUri: authorizerUri,
      identityValidationExpression: identityValidationExpression,
      jwtConfiguration: jwtConfiguration,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/authorizers',
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
    final $payload = CreateDeploymentRequest(
      apiId: apiId,
      description: description,
      stageName: stageName,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/deployments',
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
  /// Parameter [tags] :
  /// The collection of tags associated with a domain name.
  Future<CreateDomainNameResponse> createDomainName({
    @_s.required String domainName,
    List<DomainNameConfiguration> domainNameConfigurations,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    final $payload = CreateDomainNameRequest(
      domainName: domainName,
      domainNameConfigurations: domainNameConfigurations,
      tags: tags,
    );
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
  /// AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is.
  /// This integration is also referred to as Lambda proxy integration.
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
  /// A key-value map specifying request parameters that are passed from the
  /// method request to the backend. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or
  /// static value that must be enclosed within single quotes and pre-encoded as
  /// required by the backend. The method request parameter value must match the
  /// pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name. Supported only
  /// for WebSocket APIs.
  ///
  /// Parameter [requestTemplates] :
  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
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
    String integrationUri,
    PassthroughBehavior passthroughBehavior,
    String payloadFormatVersion,
    Map<String, String> requestParameters,
    Map<String, String> requestTemplates,
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
    final $payload = CreateIntegrationRequest(
      apiId: apiId,
      integrationType: integrationType,
      connectionId: connectionId,
      connectionType: connectionType,
      contentHandlingStrategy: contentHandlingStrategy,
      credentialsArn: credentialsArn,
      description: description,
      integrationMethod: integrationMethod,
      integrationUri: integrationUri,
      passthroughBehavior: passthroughBehavior,
      payloadFormatVersion: payloadFormatVersion,
      requestParameters: requestParameters,
      requestTemplates: requestTemplates,
      templateSelectionExpression: templateSelectionExpression,
      timeoutInMillis: timeoutInMillis,
      tlsConfig: tlsConfig,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/integrations',
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
    final $payload = CreateIntegrationResponseRequest(
      apiId: apiId,
      integrationId: integrationId,
      integrationResponseKey: integrationResponseKey,
      contentHandlingStrategy: contentHandlingStrategy,
      responseParameters: responseParameters,
      responseTemplates: responseTemplates,
      templateSelectionExpression: templateSelectionExpression,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/integrations/${Uri.encodeComponent(integrationId.toString())}/integrationresponses',
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
    final $payload = CreateModelRequest(
      apiId: apiId,
      name: name,
      schema: schema,
      contentType: contentType,
      description: description,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId.toString())}/models',
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
  /// open access, or JWT for using JSON Web Tokens.
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
    final $payload = CreateRouteRequest(
      apiId: apiId,
      routeKey: routeKey,
      apiKeyRequired: apiKeyRequired,
      authorizationScopes: authorizationScopes,
      authorizationType: authorizationType,
      authorizerId: authorizerId,
      modelSelectionExpression: modelSelectionExpression,
      operationName: operationName,
      requestModels: requestModels,
      requestParameters: requestParameters,
      routeResponseSelectionExpression: routeResponseSelectionExpression,
      target: target,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId.toString())}/routes',
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
    final $payload = CreateRouteResponseRequest(
      apiId: apiId,
      routeId: routeId,
      routeResponseKey: routeResponseKey,
      modelSelectionExpression: modelSelectionExpression,
      responseModels: responseModels,
      responseParameters: responseParameters,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/routes/${Uri.encodeComponent(routeId.toString())}/routeresponses',
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
    final $payload = CreateStageRequest(
      apiId: apiId,
      stageName: stageName,
      accessLogSettings: accessLogSettings,
      autoDeploy: autoDeploy,
      clientCertificateId: clientCertificateId,
      defaultRouteSettings: defaultRouteSettings,
      deploymentId: deploymentId,
      description: description,
      routeSettings: routeSettings,
      stageVariables: stageVariables,
      tags: tags,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId.toString())}/stages',
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
    final $payload = CreateVpcLinkRequest(
      name: name,
      subnetIds: subnetIds,
      securityGroupIds: securityGroupIds,
      tags: tags,
    );
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
    final $payload = DeleteAccessLogSettingsRequest(
      apiId: apiId,
      stageName: stageName,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/stages/${Uri.encodeComponent(stageName.toString())}/accesslogsettings',
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
    final $payload = DeleteApiRequest(
      apiId: apiId,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId.toString())}',
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
    final $payload = DeleteApiMappingRequest(
      apiMappingId: apiMappingId,
      domainName: domainName,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName.toString())}/apimappings/${Uri.encodeComponent(apiMappingId.toString())}',
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
    final $payload = DeleteAuthorizerRequest(
      apiId: apiId,
      authorizerId: authorizerId,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/authorizers/${Uri.encodeComponent(authorizerId.toString())}',
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
    final $payload = DeleteCorsConfigurationRequest(
      apiId: apiId,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId.toString())}/cors',
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
    final $payload = DeleteDeploymentRequest(
      apiId: apiId,
      deploymentId: deploymentId,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/deployments/${Uri.encodeComponent(deploymentId.toString())}',
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
    final $payload = DeleteDomainNameRequest(
      domainName: domainName,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName.toString())}',
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
    final $payload = DeleteIntegrationRequest(
      apiId: apiId,
      integrationId: integrationId,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/integrations/${Uri.encodeComponent(integrationId.toString())}',
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
    final $payload = DeleteIntegrationResponseRequest(
      apiId: apiId,
      integrationId: integrationId,
      integrationResponseId: integrationResponseId,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/integrations/${Uri.encodeComponent(integrationId.toString())}/integrationresponses/${Uri.encodeComponent(integrationResponseId.toString())}',
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
    final $payload = DeleteModelRequest(
      apiId: apiId,
      modelId: modelId,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/models/${Uri.encodeComponent(modelId.toString())}',
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
    final $payload = DeleteRouteRequest(
      apiId: apiId,
      routeId: routeId,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/routes/${Uri.encodeComponent(routeId.toString())}',
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
    final $payload = DeleteRouteRequestParameterRequest(
      apiId: apiId,
      requestParameterKey: requestParameterKey,
      routeId: routeId,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/routes/${Uri.encodeComponent(routeId.toString())}/requestparameters/${Uri.encodeComponent(requestParameterKey.toString())}',
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
    final $payload = DeleteRouteResponseRequest(
      apiId: apiId,
      routeId: routeId,
      routeResponseId: routeResponseId,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/routes/${Uri.encodeComponent(routeId.toString())}/routeresponses/${Uri.encodeComponent(routeResponseId.toString())}',
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
    final $payload = DeleteRouteSettingsRequest(
      apiId: apiId,
      routeKey: routeKey,
      stageName: stageName,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/stages/${Uri.encodeComponent(stageName.toString())}/routesettings/${Uri.encodeComponent(routeKey.toString())}',
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
    final $payload = DeleteStageRequest(
      apiId: apiId,
      stageName: stageName,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/stages/${Uri.encodeComponent(stageName.toString())}',
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
    final $payload = DeleteVpcLinkRequest(
      vpcLinkId: vpcLinkId,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/v2/vpclinks/${Uri.encodeComponent(vpcLinkId.toString())}',
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
    var _query = '';
    _query = '?${[
      if (outputType != null) _s.toQueryParam('outputType', outputType),
      if (exportVersion != null)
        _s.toQueryParam('exportVersion', exportVersion),
      if (includeExtensions != null)
        _s.toQueryParam('includeExtensions', includeExtensions),
      if (stageName != null) _s.toQueryParam('stageName', stageName),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/exports/${Uri.encodeComponent(specification.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ExportApiResponse.fromJson({...response, 'body': response});
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
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId.toString())}',
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
          '/v2/domainnames/${Uri.encodeComponent(domainName.toString())}/apimappings/${Uri.encodeComponent(apiMappingId.toString())}',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName.toString())}/apimappings$_query',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/apis$_query',
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
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/authorizers/${Uri.encodeComponent(authorizerId.toString())}',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/authorizers$_query',
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
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/deployments/${Uri.encodeComponent(deploymentId.toString())}',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/deployments$_query',
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
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName.toString())}',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/domainnames$_query',
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
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/integrations/${Uri.encodeComponent(integrationId.toString())}',
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
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/integrations/${Uri.encodeComponent(integrationId.toString())}/integrationresponses/${Uri.encodeComponent(integrationResponseId.toString())}',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/integrations/${Uri.encodeComponent(integrationId.toString())}/integrationresponses$_query',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/integrations$_query',
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
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/models/${Uri.encodeComponent(modelId.toString())}',
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
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/models/${Uri.encodeComponent(modelId.toString())}/template',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/models$_query',
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
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/routes/${Uri.encodeComponent(routeId.toString())}',
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
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/routes/${Uri.encodeComponent(routeId.toString())}/routeresponses/${Uri.encodeComponent(routeResponseId.toString())}',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/routes/${Uri.encodeComponent(routeId.toString())}/routeresponses$_query',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/routes$_query',
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
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/stages/${Uri.encodeComponent(stageName.toString())}',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/stages$_query',
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
      requestUri: '/v2/tags/${Uri.encodeComponent(resourceArn.toString())}',
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
      requestUri: '/v2/vpclinks/${Uri.encodeComponent(vpcLinkId.toString())}',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2/vpclinks$_query',
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
    var _query = '';
    _query = '?${[
      if (basepath != null) _s.toQueryParam('basepath', basepath),
      if (failOnWarnings != null)
        _s.toQueryParam('failOnWarnings', failOnWarnings),
    ].where((e) => e != null).join('&')}';
    final $payload = ImportApiRequest(
      body: body,
      basepath: basepath,
      failOnWarnings: failOnWarnings,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/apis$_query',
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
    var _query = '';
    _query = '?${[
      if (basepath != null) _s.toQueryParam('basepath', basepath),
      if (failOnWarnings != null)
        _s.toQueryParam('failOnWarnings', failOnWarnings),
    ].where((e) => e != null).join('&')}';
    final $payload = ReimportApiRequest(
      apiId: apiId,
      body: body,
      basepath: basepath,
      failOnWarnings: failOnWarnings,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId.toString())}$_query',
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
    final $payload = TagResourceRequest(
      resourceArn: resourceArn,
      tags: tags,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2/tags/${Uri.encodeComponent(resourceArn.toString())}',
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
    var _query = '';
    _query = '?${[
      if (tagKeys != null) _s.toQueryParam('tagKeys', tagKeys),
    ].where((e) => e != null).join('&')}';
    final $payload = UntagResourceRequest(
      resourceArn: resourceArn,
      tagKeys: tagKeys,
    );
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v2/tags/${Uri.encodeComponent(resourceArn.toString())}$_query',
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
  /// services, specify null. Currently, this property is not used for HTTP
  /// integrations. If provided, this value replaces the credentials associated
  /// with the quick create integration. Supported only for HTTP APIs.
  ///
  /// Parameter [description] :
  /// The description of the API.
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
    bool disableSchemaValidation,
    String name,
    String routeKey,
    String routeSelectionExpression,
    String target,
    String version,
  }) async {
    ArgumentError.checkNotNull(apiId, 'apiId');
    final $payload = UpdateApiRequest(
      apiId: apiId,
      apiKeySelectionExpression: apiKeySelectionExpression,
      corsConfiguration: corsConfiguration,
      credentialsArn: credentialsArn,
      description: description,
      disableSchemaValidation: disableSchemaValidation,
      name: name,
      routeKey: routeKey,
      routeSelectionExpression: routeSelectionExpression,
      target: target,
      version: version,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v2/apis/${Uri.encodeComponent(apiId.toString())}',
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
    final $payload = UpdateApiMappingRequest(
      apiId: apiId,
      apiMappingId: apiMappingId,
      domainName: domainName,
      apiMappingKey: apiMappingKey,
      stage: stage,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName.toString())}/apimappings/${Uri.encodeComponent(apiMappingId.toString())}',
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
  /// permissions on the Lambda function, specify null.
  ///
  /// Parameter [authorizerResultTtlInSeconds] :
  /// Authorizer caching is not currently supported. Don't specify this value
  /// for authorizers.
  ///
  /// Parameter [authorizerType] :
  /// The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda
  /// function using incoming request parameters. For HTTP APIs, specify JWT to
  /// use JSON Web Tokens.
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
  /// Parameter [identitySource] :
  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. Currently,
  /// the identity source can be headers, query string parameters, stage
  /// variables, and context parameters. For example, if an Auth header and a
  /// Name query string parameter are defined as identity sources, this value is
  /// route.request.header.Auth, route.request.querystring.Name. These
  /// parameters will be used to perform runtime validation for Lambda-based
  /// authorizers by verifying all of the identity-related request parameters
  /// are present in the request, not null, and non-empty. Only when this is
  /// true does the authorizer invoke the authorizer Lambda function. Otherwise,
  /// it returns a 401 Unauthorized response without calling the Lambda
  /// function.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT) from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// "$request.header.Authorization".
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
    int authorizerResultTtlInSeconds,
    AuthorizerType authorizerType,
    String authorizerUri,
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
    final $payload = UpdateAuthorizerRequest(
      apiId: apiId,
      authorizerId: authorizerId,
      authorizerCredentialsArn: authorizerCredentialsArn,
      authorizerResultTtlInSeconds: authorizerResultTtlInSeconds,
      authorizerType: authorizerType,
      authorizerUri: authorizerUri,
      identitySource: identitySource,
      identityValidationExpression: identityValidationExpression,
      jwtConfiguration: jwtConfiguration,
      name: name,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/authorizers/${Uri.encodeComponent(authorizerId.toString())}',
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
    final $payload = UpdateDeploymentRequest(
      apiId: apiId,
      deploymentId: deploymentId,
      description: description,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/deployments/${Uri.encodeComponent(deploymentId.toString())}',
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
  Future<UpdateDomainNameResponse> updateDomainName({
    @_s.required String domainName,
    List<DomainNameConfiguration> domainNameConfigurations,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
    final $payload = UpdateDomainNameRequest(
      domainName: domainName,
      domainNameConfigurations: domainNameConfigurations,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/domainnames/${Uri.encodeComponent(domainName.toString())}',
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
  /// Parameter [integrationType] :
  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service
  /// action, including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is.
  /// This integration is also referred to as Lambda proxy integration.
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
  /// A key-value map specifying request parameters that are passed from the
  /// method request to the backend. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or
  /// static value that must be enclosed within single quotes and pre-encoded as
  /// required by the backend. The method request parameter value must match the
  /// pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name. Supported only
  /// for WebSocket APIs.
  ///
  /// Parameter [requestTemplates] :
  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
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
    IntegrationType integrationType,
    String integrationUri,
    PassthroughBehavior passthroughBehavior,
    String payloadFormatVersion,
    Map<String, String> requestParameters,
    Map<String, String> requestTemplates,
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
    final $payload = UpdateIntegrationRequest(
      apiId: apiId,
      integrationId: integrationId,
      connectionId: connectionId,
      connectionType: connectionType,
      contentHandlingStrategy: contentHandlingStrategy,
      credentialsArn: credentialsArn,
      description: description,
      integrationMethod: integrationMethod,
      integrationType: integrationType,
      integrationUri: integrationUri,
      passthroughBehavior: passthroughBehavior,
      payloadFormatVersion: payloadFormatVersion,
      requestParameters: requestParameters,
      requestTemplates: requestTemplates,
      templateSelectionExpression: templateSelectionExpression,
      timeoutInMillis: timeoutInMillis,
      tlsConfig: tlsConfig,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/integrations/${Uri.encodeComponent(integrationId.toString())}',
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
    final $payload = UpdateIntegrationResponseRequest(
      apiId: apiId,
      integrationId: integrationId,
      integrationResponseId: integrationResponseId,
      contentHandlingStrategy: contentHandlingStrategy,
      integrationResponseKey: integrationResponseKey,
      responseParameters: responseParameters,
      responseTemplates: responseTemplates,
      templateSelectionExpression: templateSelectionExpression,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/integrations/${Uri.encodeComponent(integrationId.toString())}/integrationresponses/${Uri.encodeComponent(integrationResponseId.toString())}',
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
    final $payload = UpdateModelRequest(
      apiId: apiId,
      modelId: modelId,
      contentType: contentType,
      description: description,
      name: name,
      schema: schema,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/models/${Uri.encodeComponent(modelId.toString())}',
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
  /// open access, or JWT for using JSON Web Tokens.
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
    final $payload = UpdateRouteRequest(
      apiId: apiId,
      routeId: routeId,
      apiKeyRequired: apiKeyRequired,
      authorizationScopes: authorizationScopes,
      authorizationType: authorizationType,
      authorizerId: authorizerId,
      modelSelectionExpression: modelSelectionExpression,
      operationName: operationName,
      requestModels: requestModels,
      requestParameters: requestParameters,
      routeKey: routeKey,
      routeResponseSelectionExpression: routeResponseSelectionExpression,
      target: target,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/routes/${Uri.encodeComponent(routeId.toString())}',
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
    final $payload = UpdateRouteResponseRequest(
      apiId: apiId,
      routeId: routeId,
      routeResponseId: routeResponseId,
      modelSelectionExpression: modelSelectionExpression,
      responseModels: responseModels,
      responseParameters: responseParameters,
      routeResponseKey: routeResponseKey,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/routes/${Uri.encodeComponent(routeId.toString())}/routeresponses/${Uri.encodeComponent(routeResponseId.toString())}',
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
  /// The stage name. Stage names can only contain alphanumeric characters,
  /// hyphens, and underscores. Maximum length is 128 characters.
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
    final $payload = UpdateStageRequest(
      apiId: apiId,
      stageName: stageName,
      accessLogSettings: accessLogSettings,
      autoDeploy: autoDeploy,
      clientCertificateId: clientCertificateId,
      defaultRouteSettings: defaultRouteSettings,
      deploymentId: deploymentId,
      description: description,
      routeSettings: routeSettings,
      stageVariables: stageVariables,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/v2/apis/${Uri.encodeComponent(apiId.toString())}/stages/${Uri.encodeComponent(stageName.toString())}',
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
    final $payload = UpdateVpcLinkRequest(
      vpcLinkId: vpcLinkId,
      name: name,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/v2/vpclinks/${Uri.encodeComponent(vpcLinkId.toString())}',
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime createdDate;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

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
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
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
/// authorizer. For HTTP APIs, valid values are NONE for open access, or JWT for
/// using JSON Web Tokens.
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
  /// Lambda function, specify null. Supported only for REQUEST authorizers.
  @_s.JsonKey(name: 'authorizerCredentialsArn')
  final String authorizerCredentialsArn;

  /// The authorizer identifier.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// Authorizer caching is not currently supported. Don't specify this value for
  /// authorizers.
  @_s.JsonKey(name: 'authorizerResultTtlInSeconds')
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda
  /// function using incoming request parameters. For HTTP APIs, specify JWT to
  /// use JSON Web Tokens.
  @_s.JsonKey(name: 'authorizerType')
  final AuthorizerType authorizerType;

  /// The authorizer's Uniform Resource Identifier (URI). ForREQUEST authorizers,
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

  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. Currently, the
  /// identity source can be headers, query string parameters, stage variables,
  /// and context parameters. For example, if an Auth header and a Name query
  /// string parameter are defined as identity sources, this value is
  /// route.request.header.Auth, route.request.querystring.Name. These parameters
  /// will be used to perform runtime validation for Lambda-based authorizers by
  /// verifying all of the identity-related request parameters are present in the
  /// request, not null, and non-empty. Only when this is true does the authorizer
  /// invoke the authorizer Lambda function. Otherwise, it returns a 401
  /// Unauthorized response without calling the Lambda function.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT) from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// "$request.header.Authorization".
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
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
    this.identitySource,
    this.identityValidationExpression,
    this.jwtConfiguration,
  });
  factory Authorizer.fromJson(Map<String, dynamic> json) =>
      _$AuthorizerFromJson(json);
}

/// The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda
/// function using incoming request parameters. For HTTP APIs, specify JWT to
/// use JSON Web Tokens.
enum AuthorizerType {
  @_s.JsonValue('REQUEST')
  request,
  @_s.JsonValue('JWT')
  jwt,
}

/// Represents a connection type.
enum ConnectionType {
  @_s.JsonValue('INTERNET')
  internet,
  @_s.JsonValue('VPC_LINK')
  vpcLink,
}

/// Specifies how to handle response payload content type conversions. Supported
/// only for WebSocket APIs.
enum ContentHandlingStrategy {
  @_s.JsonValue('CONVERT_TO_BINARY')
  convertToBinary,
  @_s.JsonValue('CONVERT_TO_TEXT')
  convertToText,
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

/// Creates a new ApiMapping resource to represent an API mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateApiMappingRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// The domain name.
  @_s.JsonKey(name: 'domainName', ignore: true)
  final String domainName;

  /// The API stage.
  @_s.JsonKey(name: 'stage')
  final String stage;

  /// The API mapping key.
  @_s.JsonKey(name: 'apiMappingKey')
  final String apiMappingKey;

  CreateApiMappingRequest({
    @_s.required this.apiId,
    @_s.required this.domainName,
    @_s.required this.stage,
    this.apiMappingKey,
  });
  Map<String, dynamic> toJson() => _$CreateApiMappingRequestToJson(this);
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

/// Creates a new Api resource to represent an API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateApiRequest {
  /// The name of the API.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The API protocol.
  @_s.JsonKey(name: 'protocolType')
  final ProtocolType protocolType;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  @_s.JsonKey(name: 'apiKeySelectionExpression')
  final String apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-cors.html">Configuring
  /// CORS</a> for more information.
  @_s.JsonKey(name: 'corsConfiguration')
  final Cors corsConfiguration;

  /// This property is part of quick create. It specifies the credentials required
  /// for the integration, if any. For a Lambda integration, three options are
  /// available. To specify an IAM Role for API Gateway to assume, use the role's
  /// Amazon Resource Name (ARN). To require that the caller's identity be passed
  /// through from the request, specify arn:aws:iam::*:user/*. To use
  /// resource-based permissions on supported AWS services, specify null.
  /// Currently, this property is not used for HTTP integrations. Supported only
  /// for HTTP APIs.
  @_s.JsonKey(name: 'credentialsArn')
  final String credentialsArn;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'disableSchemaValidation')
  final bool disableSchemaValidation;

  /// This property is part of quick create. If you don't specify a routeKey, a
  /// default route of $default is created. The $default route acts as a catch-all
  /// for any request made to your API, for a particular stage. The $default route
  /// key can't be modified. You can add routes after creating the API, and you
  /// can update the route keys of additional routes. Supported only for HTTP
  /// APIs.
  @_s.JsonKey(name: 'routeKey')
  final String routeKey;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  @_s.JsonKey(name: 'routeSelectionExpression')
  final String routeSelectionExpression;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// This property is part of quick create. Quick create produces an API with an
  /// integration, a default catch-all route, and a default stage which is
  /// configured to automatically deploy changes. For HTTP integrations, specify a
  /// fully qualified URL. For Lambda integrations, specify a function ARN. The
  /// type of the integration will be HTTP_PROXY or AWS_PROXY, respectively.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'target')
  final String target;

  /// A version identifier for the API.
  @_s.JsonKey(name: 'version')
  final String version;

  CreateApiRequest({
    @_s.required this.name,
    @_s.required this.protocolType,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.credentialsArn,
    this.description,
    this.disableSchemaValidation,
    this.routeKey,
    this.routeSelectionExpression,
    this.tags,
    this.target,
    this.version,
  });
  Map<String, dynamic> toJson() => _$CreateApiRequestToJson(this);
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime createdDate;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

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
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
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

/// Creates a new Authorizer resource to represent an authorizer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateAuthorizerRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda
  /// function using incoming request parameters. For HTTP APIs, specify JWT to
  /// use JSON Web Tokens.
  @_s.JsonKey(name: 'authorizerType')
  final AuthorizerType authorizerType;

  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. Currently, the
  /// identity source can be headers, query string parameters, stage variables,
  /// and context parameters. For example, if an Auth header and a Name query
  /// string parameter are defined as identity sources, this value is
  /// route.request.header.Auth, route.request.querystring.Name. These parameters
  /// will be used to perform runtime validation for Lambda-based authorizers by
  /// verifying all of the identity-related request parameters are present in the
  /// request, not null, and non-empty. Only when this is true does the authorizer
  /// invoke the authorizer Lambda function. Otherwise, it returns a 401
  /// Unauthorized response without calling the Lambda function.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT )from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// "$request.header.Authorization".
  @_s.JsonKey(name: 'identitySource')
  final List<String> identitySource;

  /// The name of the authorizer.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Specifies the required credentials as an IAM role for API Gateway to invoke
  /// the authorizer. To specify an IAM role for API Gateway to assume, use the
  /// role's Amazon Resource Name (ARN). To use resource-based permissions on the
  /// Lambda function, specify null. Supported only for REQUEST authorizers.
  @_s.JsonKey(name: 'authorizerCredentialsArn')
  final String authorizerCredentialsArn;

  /// Authorizer caching is not currently supported. Don't specify this value for
  /// authorizers.
  @_s.JsonKey(name: 'authorizerResultTtlInSeconds')
  final int authorizerResultTtlInSeconds;

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

  /// This parameter is not used.
  @_s.JsonKey(name: 'identityValidationExpression')
  final String identityValidationExpression;

  /// Represents the configuration of a JWT authorizer. Required for the JWT
  /// authorizer type. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'jwtConfiguration')
  final JWTConfiguration jwtConfiguration;

  CreateAuthorizerRequest({
    @_s.required this.apiId,
    @_s.required this.authorizerType,
    @_s.required this.identitySource,
    @_s.required this.name,
    this.authorizerCredentialsArn,
    this.authorizerResultTtlInSeconds,
    this.authorizerUri,
    this.identityValidationExpression,
    this.jwtConfiguration,
  });
  Map<String, dynamic> toJson() => _$CreateAuthorizerRequestToJson(this);
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
  /// Lambda function, specify null. Supported only for REQUEST authorizers.
  @_s.JsonKey(name: 'authorizerCredentialsArn')
  final String authorizerCredentialsArn;

  /// The authorizer identifier.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// Authorizer caching is not currently supported. Don't specify this value for
  /// authorizers.
  @_s.JsonKey(name: 'authorizerResultTtlInSeconds')
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda
  /// function using incoming request parameters. For HTTP APIs, specify JWT to
  /// use JSON Web Tokens.
  @_s.JsonKey(name: 'authorizerType')
  final AuthorizerType authorizerType;

  /// The authorizer's Uniform Resource Identifier (URI). ForREQUEST authorizers,
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

  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. Currently, the
  /// identity source can be headers, query string parameters, stage variables,
  /// and context parameters. For example, if an Auth header and a Name query
  /// string parameter are defined as identity sources, this value is
  /// route.request.header.Auth, route.request.querystring.Name. These parameters
  /// will be used to perform runtime validation for Lambda-based authorizers by
  /// verifying all of the identity-related request parameters are present in the
  /// request, not null, and non-empty. Only when this is true does the authorizer
  /// invoke the authorizer Lambda function. Otherwise, it returns a 401
  /// Unauthorized response without calling the Lambda function.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT) from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// "$request.header.Authorization".
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
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
    this.identitySource,
    this.identityValidationExpression,
    this.jwtConfiguration,
    this.name,
  });
  factory CreateAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAuthorizerResponseFromJson(json);
}

/// Creates a new Deployment resource to represent a deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateDeploymentRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The description for the deployment resource.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The name of the Stage resource for the Deployment resource to create.
  @_s.JsonKey(name: 'stageName')
  final String stageName;

  CreateDeploymentRequest({
    @_s.required this.apiId,
    this.description,
    this.stageName,
  });
  Map<String, dynamic> toJson() => _$CreateDeploymentRequestToJson(this);
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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

/// Creates a new DomainName resource to represent a domain name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateDomainNameRequest {
  /// The domain name.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The domain name configurations.
  @_s.JsonKey(name: 'domainNameConfigurations')
  final List<DomainNameConfiguration> domainNameConfigurations;

  /// The collection of tags associated with a domain name.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateDomainNameRequest({
    @_s.required this.domainName,
    this.domainNameConfigurations,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateDomainNameRequestToJson(this);
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

  /// The collection of tags associated with a domain name.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.tags,
  });
  factory CreateDomainNameResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDomainNameResponseFromJson(json);
}

/// Creates a new Integration resource to represent an integration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateIntegrationRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service action,
  /// including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is. This
  /// integration is also referred to as Lambda proxy integration.
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
  @_s.JsonKey(name: 'integrationType')
  final IntegrationType integrationType;

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

  /// The description of the integration.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies the integration's HTTP method type.
  @_s.JsonKey(name: 'integrationMethod')
  final String integrationMethod;

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

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the backend. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or static
  /// value that must be enclosed within single quotes and pre-encoded as required
  /// by the backend. The method request parameter value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestTemplates')
  final Map<String, String> requestTemplates;

  /// The template selection expression for the integration.
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
  final TlsConfigInput tlsConfig;

  CreateIntegrationRequest({
    @_s.required this.apiId,
    @_s.required this.integrationType,
    this.connectionId,
    this.connectionType,
    this.contentHandlingStrategy,
    this.credentialsArn,
    this.description,
    this.integrationMethod,
    this.integrationUri,
    this.passthroughBehavior,
    this.payloadFormatVersion,
    this.requestParameters,
    this.requestTemplates,
    this.templateSelectionExpression,
    this.timeoutInMillis,
    this.tlsConfig,
  });
  Map<String, dynamic> toJson() => _$CreateIntegrationRequestToJson(this);
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

  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service action,
  /// including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is. This
  /// integration is also referred to as Lambda proxy integration.
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

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the backend. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or static
  /// value that must be enclosed within single quotes and pre-encoded as required
  /// by the backend. The method request parameter value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestTemplates')
  final Map<String, String> requestTemplates;

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
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.payloadFormatVersion,
    this.requestParameters,
    this.requestTemplates,
    this.templateSelectionExpression,
    this.timeoutInMillis,
    this.tlsConfig,
  });
  factory CreateIntegrationResult.fromJson(Map<String, dynamic> json) =>
      _$CreateIntegrationResultFromJson(json);
}

/// Creates a new IntegrationResponse resource to represent an integration
/// response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateIntegrationResponseRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The integration ID.
  @_s.JsonKey(name: 'integrationId', ignore: true)
  final String integrationId;

  /// The integration response key.
  @_s.JsonKey(name: 'integrationResponseKey')
  final String integrationResponseKey;

  /// Specifies how to handle response payload content type conversions. Supported
  /// values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following
  /// behaviors:
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

  /// A key-value map specifying response parameters that are passed to the method
  /// response from the backend. The key is a method response header parameter
  /// name and the mapped value is an integration response header value, a static
  /// value enclosed within a pair of single quotes, or a JSON expression from the
  /// integration response body. The mapping key must match the pattern of
  /// method.response.header.{name}, where {name} is a valid and unique header
  /// name. The mapped non-static value must match the pattern of
  /// integration.response.header.{name} or
  /// integration.response.body.{JSON-expression}, where {name} is a valid and
  /// unique response header name and {JSON-expression} is a valid JSON expression
  /// without the $ prefix.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, String> responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are represented
  /// as a key/value map, with a content-type as the key and a template as the
  /// value.
  @_s.JsonKey(name: 'responseTemplates')
  final Map<String, String> responseTemplates;

  /// The template selection expression for the integration response. Supported
  /// only for WebSocket APIs.
  @_s.JsonKey(name: 'templateSelectionExpression')
  final String templateSelectionExpression;

  CreateIntegrationResponseRequest({
    @_s.required this.apiId,
    @_s.required this.integrationId,
    @_s.required this.integrationResponseKey,
    this.contentHandlingStrategy,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });
  Map<String, dynamic> toJson() =>
      _$CreateIntegrationResponseRequestToJson(this);
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

/// Creates a new Model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateModelRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The name of the model. Must be alphanumeric.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  @_s.JsonKey(name: 'schema')
  final String schema;

  /// The content-type for the model, for example, "application/json".
  @_s.JsonKey(name: 'contentType')
  final String contentType;

  /// The description of the model.
  @_s.JsonKey(name: 'description')
  final String description;

  CreateModelRequest({
    @_s.required this.apiId,
    @_s.required this.name,
    @_s.required this.schema,
    this.contentType,
    this.description,
  });
  Map<String, dynamic> toJson() => _$CreateModelRequestToJson(this);
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

/// Creates a new Route resource to represent a route.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateRouteRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The route key for the route.
  @_s.JsonKey(name: 'routeKey')
  final String routeKey;

  /// Specifies whether an API key is required for the route. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'apiKeyRequired')
  final bool apiKeyRequired;

  /// The authorization scopes supported by this route.
  @_s.JsonKey(name: 'authorizationScopes')
  final List<String> authorizationScopes;

  /// The authorization type for the route. For WebSocket APIs, valid values are
  /// NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for
  /// using a Lambda authorizer For HTTP APIs, valid values are NONE for open
  /// access, or JWT for using JSON Web Tokens.
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

  /// The route response selection expression for the route. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'routeResponseSelectionExpression')
  final String routeResponseSelectionExpression;

  /// The target for the route.
  @_s.JsonKey(name: 'target')
  final String target;

  CreateRouteRequest({
    @_s.required this.apiId,
    @_s.required this.routeKey,
    this.apiKeyRequired,
    this.authorizationScopes,
    this.authorizationType,
    this.authorizerId,
    this.modelSelectionExpression,
    this.operationName,
    this.requestModels,
    this.requestParameters,
    this.routeResponseSelectionExpression,
    this.target,
  });
  Map<String, dynamic> toJson() => _$CreateRouteRequestToJson(this);
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
  /// access, or JWT for using JSON Web Tokens.
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

/// Creates a new RouteResponse resource to represent a route response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateRouteResponseRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The route ID.
  @_s.JsonKey(name: 'routeId', ignore: true)
  final String routeId;

  /// The route response key.
  @_s.JsonKey(name: 'routeResponseKey')
  final String routeResponseKey;

  /// The model selection expression for the route response. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'modelSelectionExpression')
  final String modelSelectionExpression;

  /// The response models for the route response.
  @_s.JsonKey(name: 'responseModels')
  final Map<String, String> responseModels;

  /// The route response parameters.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, ParameterConstraints> responseParameters;

  CreateRouteResponseRequest({
    @_s.required this.apiId,
    @_s.required this.routeId,
    @_s.required this.routeResponseKey,
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
  });
  Map<String, dynamic> toJson() => _$CreateRouteResponseRequestToJson(this);
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

/// Creates a new Stage resource to represent a stage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateStageRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The name of the stage.
  @_s.JsonKey(name: 'stageName')
  final String stageName;

  /// Settings for logging access in this stage.
  @_s.JsonKey(name: 'accessLogSettings')
  final AccessLogSettings accessLogSettings;

  /// Specifies whether updates to an API automatically trigger a new deployment.
  /// The default value is false.
  @_s.JsonKey(name: 'autoDeploy')
  final bool autoDeploy;

  /// The identifier of a client certificate for a Stage. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'clientCertificateId')
  final String clientCertificateId;

  /// The default route settings for the stage.
  @_s.JsonKey(name: 'defaultRouteSettings')
  final RouteSettings defaultRouteSettings;

  /// The deployment identifier of the API stage.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The description for the API stage.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Route settings for the stage, by routeKey.
  @_s.JsonKey(name: 'routeSettings')
  final Map<String, RouteSettings> routeSettings;

  /// A map that defines the stage variables for a Stage. Variable names can have
  /// alphanumeric and underscore characters, and the values must match
  /// [A-Za-z0-9-._~:/?#&amp;=,]+.
  @_s.JsonKey(name: 'stageVariables')
  final Map<String, String> stageVariables;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateStageRequest({
    @_s.required this.apiId,
    @_s.required this.stageName,
    this.accessLogSettings,
    this.autoDeploy,
    this.clientCertificateId,
    this.defaultRouteSettings,
    this.deploymentId,
    this.description,
    this.routeSettings,
    this.stageVariables,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateStageRequestToJson(this);
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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
  @_s.JsonKey(
      name: 'lastUpdatedDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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

/// Creates a VPC link
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateVpcLinkRequest {
  /// The name of the VPC link.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of subnet IDs to include in the VPC link.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  /// A list of security group IDs for the VPC link.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// A list of tags.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateVpcLinkRequest({
    @_s.required this.name,
    @_s.required this.subnetIds,
    this.securityGroupIds,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateVpcLinkRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVpcLinkResponse {
  /// The timestamp when the VPC link was created.
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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
    createFactory: false,
    createToJson: true)
class DeleteAccessLogSettingsRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The stage name. Stage names can only contain alphanumeric characters,
  /// hyphens, and underscores. Maximum length is 128 characters.
  @_s.JsonKey(name: 'stageName', ignore: true)
  final String stageName;

  DeleteAccessLogSettingsRequest({
    @_s.required this.apiId,
    @_s.required this.stageName,
  });
  Map<String, dynamic> toJson() => _$DeleteAccessLogSettingsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteApiMappingRequest {
  /// The API mapping identifier.
  @_s.JsonKey(name: 'apiMappingId', ignore: true)
  final String apiMappingId;

  /// The domain name.
  @_s.JsonKey(name: 'domainName', ignore: true)
  final String domainName;

  DeleteApiMappingRequest({
    @_s.required this.apiMappingId,
    @_s.required this.domainName,
  });
  Map<String, dynamic> toJson() => _$DeleteApiMappingRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteApiRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  DeleteApiRequest({
    @_s.required this.apiId,
  });
  Map<String, dynamic> toJson() => _$DeleteApiRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteAuthorizerRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The authorizer identifier.
  @_s.JsonKey(name: 'authorizerId', ignore: true)
  final String authorizerId;

  DeleteAuthorizerRequest({
    @_s.required this.apiId,
    @_s.required this.authorizerId,
  });
  Map<String, dynamic> toJson() => _$DeleteAuthorizerRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteCorsConfigurationRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  DeleteCorsConfigurationRequest({
    @_s.required this.apiId,
  });
  Map<String, dynamic> toJson() => _$DeleteCorsConfigurationRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteDeploymentRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The deployment ID.
  @_s.JsonKey(name: 'deploymentId', ignore: true)
  final String deploymentId;

  DeleteDeploymentRequest({
    @_s.required this.apiId,
    @_s.required this.deploymentId,
  });
  Map<String, dynamic> toJson() => _$DeleteDeploymentRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteDomainNameRequest {
  /// The domain name.
  @_s.JsonKey(name: 'domainName', ignore: true)
  final String domainName;

  DeleteDomainNameRequest({
    @_s.required this.domainName,
  });
  Map<String, dynamic> toJson() => _$DeleteDomainNameRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteIntegrationRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The integration ID.
  @_s.JsonKey(name: 'integrationId', ignore: true)
  final String integrationId;

  DeleteIntegrationRequest({
    @_s.required this.apiId,
    @_s.required this.integrationId,
  });
  Map<String, dynamic> toJson() => _$DeleteIntegrationRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteIntegrationResponseRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The integration ID.
  @_s.JsonKey(name: 'integrationId', ignore: true)
  final String integrationId;

  /// The integration response ID.
  @_s.JsonKey(name: 'integrationResponseId', ignore: true)
  final String integrationResponseId;

  DeleteIntegrationResponseRequest({
    @_s.required this.apiId,
    @_s.required this.integrationId,
    @_s.required this.integrationResponseId,
  });
  Map<String, dynamic> toJson() =>
      _$DeleteIntegrationResponseRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteModelRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The model ID.
  @_s.JsonKey(name: 'modelId', ignore: true)
  final String modelId;

  DeleteModelRequest({
    @_s.required this.apiId,
    @_s.required this.modelId,
  });
  Map<String, dynamic> toJson() => _$DeleteModelRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteRouteRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The route ID.
  @_s.JsonKey(name: 'routeId', ignore: true)
  final String routeId;

  DeleteRouteRequest({
    @_s.required this.apiId,
    @_s.required this.routeId,
  });
  Map<String, dynamic> toJson() => _$DeleteRouteRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteRouteRequestParameterRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The route request parameter key.
  @_s.JsonKey(name: 'requestParameterKey', ignore: true)
  final String requestParameterKey;

  /// The route ID.
  @_s.JsonKey(name: 'routeId', ignore: true)
  final String routeId;

  DeleteRouteRequestParameterRequest({
    @_s.required this.apiId,
    @_s.required this.requestParameterKey,
    @_s.required this.routeId,
  });
  Map<String, dynamic> toJson() =>
      _$DeleteRouteRequestParameterRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteRouteResponseRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The route ID.
  @_s.JsonKey(name: 'routeId', ignore: true)
  final String routeId;

  /// The route response ID.
  @_s.JsonKey(name: 'routeResponseId', ignore: true)
  final String routeResponseId;

  DeleteRouteResponseRequest({
    @_s.required this.apiId,
    @_s.required this.routeId,
    @_s.required this.routeResponseId,
  });
  Map<String, dynamic> toJson() => _$DeleteRouteResponseRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteRouteSettingsRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The route key.
  @_s.JsonKey(name: 'routeKey', ignore: true)
  final String routeKey;

  /// The stage name. Stage names can only contain alphanumeric characters,
  /// hyphens, and underscores. Maximum length is 128 characters.
  @_s.JsonKey(name: 'stageName', ignore: true)
  final String stageName;

  DeleteRouteSettingsRequest({
    @_s.required this.apiId,
    @_s.required this.routeKey,
    @_s.required this.stageName,
  });
  Map<String, dynamic> toJson() => _$DeleteRouteSettingsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteStageRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The stage name. Stage names can only contain alphanumeric characters,
  /// hyphens, and underscores. Maximum length is 128 characters.
  @_s.JsonKey(name: 'stageName', ignore: true)
  final String stageName;

  DeleteStageRequest({
    @_s.required this.apiId,
    @_s.required this.stageName,
  });
  Map<String, dynamic> toJson() => _$DeleteStageRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteVpcLinkRequest {
  /// The ID of the VPC link.
  @_s.JsonKey(name: 'vpcLinkId', ignore: true)
  final String vpcLinkId;

  DeleteVpcLinkRequest({
    @_s.required this.vpcLinkId,
  });
  Map<String, dynamic> toJson() => _$DeleteVpcLinkRequestToJson(this);
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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

  /// The collection of tags associated with a domain name.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DomainName({
    @_s.required this.domainName,
    this.apiMappingSelectionExpression,
    this.domainNameConfigurations,
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
  @_s.JsonKey(
      name: 'certificateUploadDate',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime createdDate;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

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
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
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
  /// Lambda function, specify null. Supported only for REQUEST authorizers.
  @_s.JsonKey(name: 'authorizerCredentialsArn')
  final String authorizerCredentialsArn;

  /// The authorizer identifier.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// Authorizer caching is not currently supported. Don't specify this value for
  /// authorizers.
  @_s.JsonKey(name: 'authorizerResultTtlInSeconds')
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda
  /// function using incoming request parameters. For HTTP APIs, specify JWT to
  /// use JSON Web Tokens.
  @_s.JsonKey(name: 'authorizerType')
  final AuthorizerType authorizerType;

  /// The authorizer's Uniform Resource Identifier (URI). ForREQUEST authorizers,
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

  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. Currently, the
  /// identity source can be headers, query string parameters, stage variables,
  /// and context parameters. For example, if an Auth header and a Name query
  /// string parameter are defined as identity sources, this value is
  /// route.request.header.Auth, route.request.querystring.Name. These parameters
  /// will be used to perform runtime validation for Lambda-based authorizers by
  /// verifying all of the identity-related request parameters are present in the
  /// request, not null, and non-empty. Only when this is true does the authorizer
  /// invoke the authorizer Lambda function. Otherwise, it returns a 401
  /// Unauthorized response without calling the Lambda function.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT) from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// "$request.header.Authorization".
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
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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

  /// The collection of tags associated with a domain name.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
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

  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service action,
  /// including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is. This
  /// integration is also referred to as Lambda proxy integration.
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

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the backend. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or static
  /// value that must be enclosed within single quotes and pre-encoded as required
  /// by the backend. The method request parameter value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestTemplates')
  final Map<String, String> requestTemplates;

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
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.payloadFormatVersion,
    this.requestParameters,
    this.requestTemplates,
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
  /// access, or JWT for using JSON Web Tokens.
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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
  @_s.JsonKey(
      name: 'lastUpdatedDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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

///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ImportApiRequest {
  /// The OpenAPI definition. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'body')
  final String body;

  /// Specifies how to interpret the base path of the API during import. Valid
  /// values are ignore, prepend, and split. The default value is ignore. To learn
  /// more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-import-api-basePath.html">Set
  /// the OpenAPI basePath Property</a>. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'basepath', ignore: true)
  final String basepath;

  /// Specifies whether to rollback the API creation when a warning is
  /// encountered. By default, API creation continues if a warning is encountered.
  @_s.JsonKey(name: 'failOnWarnings', ignore: true)
  final bool failOnWarnings;

  ImportApiRequest({
    @_s.required this.body,
    this.basepath,
    this.failOnWarnings,
  });
  Map<String, dynamic> toJson() => _$ImportApiRequestToJson(this);
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime createdDate;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

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
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
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

  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service action,
  /// including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is. This
  /// integration is also referred to as Lambda proxy integration.
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

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the backend. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or static
  /// value that must be enclosed within single quotes and pre-encoded as required
  /// by the backend. The method request parameter value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestTemplates')
  final Map<String, String> requestTemplates;

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
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.payloadFormatVersion,
    this.requestParameters,
    this.requestTemplates,
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

/// Represents a protocol type.
enum ProtocolType {
  @_s.JsonValue('WEBSOCKET')
  websocket,
  @_s.JsonValue('HTTP')
  http,
}

///
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReimportApiRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The OpenAPI definition. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'body')
  final String body;

  /// Specifies how to interpret the base path of the API during import. Valid
  /// values are ignore, prepend, and split. The default value is ignore. To learn
  /// more, see <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-import-api-basePath.html">Set
  /// the OpenAPI basePath Property</a>. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'basepath', ignore: true)
  final String basepath;

  /// Specifies whether to rollback the API creation when a warning is
  /// encountered. By default, API creation continues if a warning is encountered.
  @_s.JsonKey(name: 'failOnWarnings', ignore: true)
  final bool failOnWarnings;

  ReimportApiRequest({
    @_s.required this.apiId,
    @_s.required this.body,
    this.basepath,
    this.failOnWarnings,
  });
  Map<String, dynamic> toJson() => _$ReimportApiRequestToJson(this);
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime createdDate;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

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
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
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
  /// access, or JWT for using JSON Web Tokens.
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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
  @_s.JsonKey(
      name: 'lastUpdatedDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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

/// Creates a new Tag resource to represent a tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TagResourceRequest {
  /// The resource ARN for the tag.
  @_s.JsonKey(name: 'resource-arn', ignore: true)
  final String resourceArn;

  /// The collection of tags. Each tag element is associated with a given
  /// resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  TagResourceRequest({
    @_s.required this.resourceArn,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$TagResourceRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class UntagResourceRequest {
  /// The resource ARN for the tag.
  @_s.JsonKey(name: 'resource-arn', ignore: true)
  final String resourceArn;

  /// The Tag keys to delete
  @_s.JsonKey(name: 'tagKeys', ignore: true)
  final List<String> tagKeys;

  UntagResourceRequest({
    @_s.required this.resourceArn,
    @_s.required this.tagKeys,
  });
  Map<String, dynamic> toJson() => _$UntagResourceRequestToJson(this);
}

/// Updates an ApiMapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateApiMappingRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId')
  final String apiId;

  /// The API mapping identifier.
  @_s.JsonKey(name: 'apiMappingId', ignore: true)
  final String apiMappingId;

  /// The domain name.
  @_s.JsonKey(name: 'domainName', ignore: true)
  final String domainName;

  /// The API mapping key.
  @_s.JsonKey(name: 'apiMappingKey')
  final String apiMappingKey;

  /// The API stage.
  @_s.JsonKey(name: 'stage')
  final String stage;

  UpdateApiMappingRequest({
    @_s.required this.apiId,
    @_s.required this.apiMappingId,
    @_s.required this.domainName,
    this.apiMappingKey,
    this.stage,
  });
  Map<String, dynamic> toJson() => _$UpdateApiMappingRequestToJson(this);
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

/// Updates an Api.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateApiRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// An API key selection expression. Supported only for WebSocket APIs. See <a
  /// href="https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-websocket-api-selection-expressions.html#apigateway-websocket-api-apikey-selection-expressions">API
  /// Key Selection Expressions</a>.
  @_s.JsonKey(name: 'apiKeySelectionExpression')
  final String apiKeySelectionExpression;

  /// A CORS configuration. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'corsConfiguration')
  final Cors corsConfiguration;

  /// This property is part of quick create. It specifies the credentials required
  /// for the integration, if any. For a Lambda integration, three options are
  /// available. To specify an IAM Role for API Gateway to assume, use the role's
  /// Amazon Resource Name (ARN). To require that the caller's identity be passed
  /// through from the request, specify arn:aws:iam::*:user/*. To use
  /// resource-based permissions on supported AWS services, specify null.
  /// Currently, this property is not used for HTTP integrations. If provided,
  /// this value replaces the credentials associated with the quick create
  /// integration. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'credentialsArn')
  final String credentialsArn;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Avoid validating models when creating a deployment. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'disableSchemaValidation')
  final bool disableSchemaValidation;

  /// The name of the API.
  @_s.JsonKey(name: 'name')
  final String name;

  /// This property is part of quick create. If not specified, the route created
  /// using quick create is kept. Otherwise, this value replaces the route key of
  /// the quick create route. Additional routes may still be added after the API
  /// is updated. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'routeKey')
  final String routeKey;

  /// The route selection expression for the API. For HTTP APIs, the
  /// routeSelectionExpression must be ${request.method} ${request.path}. If not
  /// provided, this will be the default for HTTP APIs. This property is required
  /// for WebSocket APIs.
  @_s.JsonKey(name: 'routeSelectionExpression')
  final String routeSelectionExpression;

  /// This property is part of quick create. For HTTP integrations, specify a
  /// fully qualified URL. For Lambda integrations, specify a function ARN. The
  /// type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. The
  /// value provided updates the integration URI and integration type. You can
  /// update a quick-created target, but you can't remove it from an API.
  /// Supported only for HTTP APIs.
  @_s.JsonKey(name: 'target')
  final String target;

  /// A version identifier for the API.
  @_s.JsonKey(name: 'version')
  final String version;

  UpdateApiRequest({
    @_s.required this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.credentialsArn,
    this.description,
    this.disableSchemaValidation,
    this.name,
    this.routeKey,
    this.routeSelectionExpression,
    this.target,
    this.version,
  });
  Map<String, dynamic> toJson() => _$UpdateApiRequestToJson(this);
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime createdDate;

  /// The description of the API.
  @_s.JsonKey(name: 'description')
  final String description;

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
    this.apiId,
    this.apiKeySelectionExpression,
    this.corsConfiguration,
    this.createdDate,
    this.description,
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

/// Updates an Authorizer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateAuthorizerRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The authorizer identifier.
  @_s.JsonKey(name: 'authorizerId', ignore: true)
  final String authorizerId;

  /// Specifies the required credentials as an IAM role for API Gateway to invoke
  /// the authorizer. To specify an IAM role for API Gateway to assume, use the
  /// role's Amazon Resource Name (ARN). To use resource-based permissions on the
  /// Lambda function, specify null.
  @_s.JsonKey(name: 'authorizerCredentialsArn')
  final String authorizerCredentialsArn;

  /// Authorizer caching is not currently supported. Don't specify this value for
  /// authorizers.
  @_s.JsonKey(name: 'authorizerResultTtlInSeconds')
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda
  /// function using incoming request parameters. For HTTP APIs, specify JWT to
  /// use JSON Web Tokens.
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

  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. Currently, the
  /// identity source can be headers, query string parameters, stage variables,
  /// and context parameters. For example, if an Auth header and a Name query
  /// string parameter are defined as identity sources, this value is
  /// route.request.header.Auth, route.request.querystring.Name. These parameters
  /// will be used to perform runtime validation for Lambda-based authorizers by
  /// verifying all of the identity-related request parameters are present in the
  /// request, not null, and non-empty. Only when this is true does the authorizer
  /// invoke the authorizer Lambda function. Otherwise, it returns a 401
  /// Unauthorized response without calling the Lambda function.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT) from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// "$request.header.Authorization".
  @_s.JsonKey(name: 'identitySource')
  final List<String> identitySource;

  /// This parameter is not used.
  @_s.JsonKey(name: 'identityValidationExpression')
  final String identityValidationExpression;

  /// Represents the configuration of a JWT authorizer. Required for the JWT
  /// authorizer type. Supported only for HTTP APIs.
  @_s.JsonKey(name: 'jwtConfiguration')
  final JWTConfiguration jwtConfiguration;

  /// The name of the authorizer.
  @_s.JsonKey(name: 'name')
  final String name;

  UpdateAuthorizerRequest({
    @_s.required this.apiId,
    @_s.required this.authorizerId,
    this.authorizerCredentialsArn,
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
    this.identitySource,
    this.identityValidationExpression,
    this.jwtConfiguration,
    this.name,
  });
  Map<String, dynamic> toJson() => _$UpdateAuthorizerRequestToJson(this);
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
  /// Lambda function, specify null. Supported only for REQUEST authorizers.
  @_s.JsonKey(name: 'authorizerCredentialsArn')
  final String authorizerCredentialsArn;

  /// The authorizer identifier.
  @_s.JsonKey(name: 'authorizerId')
  final String authorizerId;

  /// Authorizer caching is not currently supported. Don't specify this value for
  /// authorizers.
  @_s.JsonKey(name: 'authorizerResultTtlInSeconds')
  final int authorizerResultTtlInSeconds;

  /// The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda
  /// function using incoming request parameters. For HTTP APIs, specify JWT to
  /// use JSON Web Tokens.
  @_s.JsonKey(name: 'authorizerType')
  final AuthorizerType authorizerType;

  /// The authorizer's Uniform Resource Identifier (URI). ForREQUEST authorizers,
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

  /// The identity source for which authorization is requested.
  ///
  /// For a REQUEST authorizer, this is optional. The value is a set of one or
  /// more mapping expressions of the specified request parameters. Currently, the
  /// identity source can be headers, query string parameters, stage variables,
  /// and context parameters. For example, if an Auth header and a Name query
  /// string parameter are defined as identity sources, this value is
  /// route.request.header.Auth, route.request.querystring.Name. These parameters
  /// will be used to perform runtime validation for Lambda-based authorizers by
  /// verifying all of the identity-related request parameters are present in the
  /// request, not null, and non-empty. Only when this is true does the authorizer
  /// invoke the authorizer Lambda function. Otherwise, it returns a 401
  /// Unauthorized response without calling the Lambda function.
  ///
  /// For JWT, a single entry that specifies where to extract the JSON Web Token
  /// (JWT) from inbound requests. Currently only header-based and query
  /// parameter-based selections are supported, for example
  /// "$request.header.Authorization".
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
    this.authorizerResultTtlInSeconds,
    this.authorizerType,
    this.authorizerUri,
    this.identitySource,
    this.identityValidationExpression,
    this.jwtConfiguration,
    this.name,
  });
  factory UpdateAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAuthorizerResponseFromJson(json);
}

/// Updates a Deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateDeploymentRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The deployment ID.
  @_s.JsonKey(name: 'deploymentId', ignore: true)
  final String deploymentId;

  /// The description for the deployment resource.
  @_s.JsonKey(name: 'description')
  final String description;

  UpdateDeploymentRequest({
    @_s.required this.apiId,
    @_s.required this.deploymentId,
    this.description,
  });
  Map<String, dynamic> toJson() => _$UpdateDeploymentRequestToJson(this);
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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

/// Updates a DomainName.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateDomainNameRequest {
  /// The domain name.
  @_s.JsonKey(name: 'domainName', ignore: true)
  final String domainName;

  /// The domain name configurations.
  @_s.JsonKey(name: 'domainNameConfigurations')
  final List<DomainNameConfiguration> domainNameConfigurations;

  UpdateDomainNameRequest({
    @_s.required this.domainName,
    this.domainNameConfigurations,
  });
  Map<String, dynamic> toJson() => _$UpdateDomainNameRequestToJson(this);
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

  /// The collection of tags associated with a domain name.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  UpdateDomainNameResponse({
    this.apiMappingSelectionExpression,
    this.domainName,
    this.domainNameConfigurations,
    this.tags,
  });
  factory UpdateDomainNameResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDomainNameResponseFromJson(json);
}

/// Updates an Integration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateIntegrationRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The integration ID.
  @_s.JsonKey(name: 'integrationId', ignore: true)
  final String integrationId;

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

  /// The description of the integration
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies the integration's HTTP method type.
  @_s.JsonKey(name: 'integrationMethod')
  final String integrationMethod;

  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service action,
  /// including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is. This
  /// integration is also referred to as Lambda proxy integration.
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

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the backend. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or static
  /// value that must be enclosed within single quotes and pre-encoded as required
  /// by the backend. The method request parameter value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestTemplates')
  final Map<String, String> requestTemplates;

  /// The template selection expression for the integration.
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
  final TlsConfigInput tlsConfig;

  UpdateIntegrationRequest({
    @_s.required this.apiId,
    @_s.required this.integrationId,
    this.connectionId,
    this.connectionType,
    this.contentHandlingStrategy,
    this.credentialsArn,
    this.description,
    this.integrationMethod,
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.payloadFormatVersion,
    this.requestParameters,
    this.requestTemplates,
    this.templateSelectionExpression,
    this.timeoutInMillis,
    this.tlsConfig,
  });
  Map<String, dynamic> toJson() => _$UpdateIntegrationRequestToJson(this);
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

  /// The integration type of an integration. One of the following:
  ///
  /// AWS: for integrating the route or method request with an AWS service action,
  /// including the Lambda function-invoking action. With the Lambda
  /// function-invoking action, this is referred to as the Lambda custom
  /// integration. With any other AWS service action, this is known as AWS
  /// integration. Supported only for WebSocket APIs.
  ///
  /// AWS_PROXY: for integrating the route or method request with the Lambda
  /// function-invoking action with the client request passed through as-is. This
  /// integration is also referred to as Lambda proxy integration.
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

  /// A key-value map specifying request parameters that are passed from the
  /// method request to the backend. The key is an integration request parameter
  /// name and the associated value is a method request parameter value or static
  /// value that must be enclosed within single quotes and pre-encoded as required
  /// by the backend. The method request parameter value must match the pattern of
  /// method.request.<replaceable>{location}</replaceable>.<replaceable>{name}</replaceable>
  /// , where
  /// <replaceable>{location}</replaceable>
  /// is querystring, path, or header; and
  /// <replaceable>{name}</replaceable>
  /// must be a valid and unique method request parameter name. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'requestParameters')
  final Map<String, String> requestParameters;

  /// Represents a map of Velocity templates that are applied on the request
  /// payload based on the value of the Content-Type header sent by the client.
  /// The content type value is the key in this map, and the template (as a
  /// String) is the value. Supported only for WebSocket APIs.
  @_s.JsonKey(name: 'requestTemplates')
  final Map<String, String> requestTemplates;

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
    this.integrationType,
    this.integrationUri,
    this.passthroughBehavior,
    this.payloadFormatVersion,
    this.requestParameters,
    this.requestTemplates,
    this.templateSelectionExpression,
    this.timeoutInMillis,
    this.tlsConfig,
  });
  factory UpdateIntegrationResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateIntegrationResultFromJson(json);
}

/// Updates an IntegrationResponses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateIntegrationResponseRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The integration ID.
  @_s.JsonKey(name: 'integrationId', ignore: true)
  final String integrationId;

  /// The integration response ID.
  @_s.JsonKey(name: 'integrationResponseId', ignore: true)
  final String integrationResponseId;

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

  /// The integration response key.
  @_s.JsonKey(name: 'integrationResponseKey')
  final String integrationResponseKey;

  /// A key-value map specifying response parameters that are passed to the method
  /// response from the backend. The key is a method response header parameter
  /// name and the mapped value is an integration response header value, a static
  /// value enclosed within a pair of single quotes, or a JSON expression from the
  /// integration response body. The mapping key must match the pattern of
  /// method.response.header.<replaceable>{name}</replaceable>
  /// , where name is a valid and unique header name. The mapped non-static value
  /// must match the pattern of
  /// integration.response.header.<replaceable>{name}</replaceable>
  /// or integration.response.body.<replaceable>{JSON-expression}</replaceable>
  /// , where
  /// <replaceable>{name}</replaceable>
  /// is a valid and unique response header name and
  /// <replaceable>{JSON-expression}</replaceable>
  /// is a valid JSON expression without the $ prefix.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, String> responseParameters;

  /// The collection of response templates for the integration response as a
  /// string-to-string map of key-value pairs. Response templates are represented
  /// as a key/value map, with a content-type as the key and a template as the
  /// value.
  @_s.JsonKey(name: 'responseTemplates')
  final Map<String, String> responseTemplates;

  /// The template selection expression for the integration response. Supported
  /// only for WebSocket APIs.
  @_s.JsonKey(name: 'templateSelectionExpression')
  final String templateSelectionExpression;

  UpdateIntegrationResponseRequest({
    @_s.required this.apiId,
    @_s.required this.integrationId,
    @_s.required this.integrationResponseId,
    this.contentHandlingStrategy,
    this.integrationResponseKey,
    this.responseParameters,
    this.responseTemplates,
    this.templateSelectionExpression,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateIntegrationResponseRequestToJson(this);
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

/// Updates a Model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateModelRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The model ID.
  @_s.JsonKey(name: 'modelId', ignore: true)
  final String modelId;

  /// The content-type for the model, for example, "application/json".
  @_s.JsonKey(name: 'contentType')
  final String contentType;

  /// The description of the model.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The name of the model.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The schema for the model. For application/json models, this should be JSON
  /// schema draft 4 model.
  @_s.JsonKey(name: 'schema')
  final String schema;

  UpdateModelRequest({
    @_s.required this.apiId,
    @_s.required this.modelId,
    this.contentType,
    this.description,
    this.name,
    this.schema,
  });
  Map<String, dynamic> toJson() => _$UpdateModelRequestToJson(this);
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

/// Updates a Route.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateRouteRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The route ID.
  @_s.JsonKey(name: 'routeId', ignore: true)
  final String routeId;

  /// Specifies whether an API key is required for the route. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'apiKeyRequired')
  final bool apiKeyRequired;

  /// The authorization scopes supported by this route.
  @_s.JsonKey(name: 'authorizationScopes')
  final List<String> authorizationScopes;

  /// The authorization type for the route. For WebSocket APIs, valid values are
  /// NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for
  /// using a Lambda authorizer For HTTP APIs, valid values are NONE for open
  /// access, or JWT for using JSON Web Tokens.
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

  UpdateRouteRequest({
    @_s.required this.apiId,
    @_s.required this.routeId,
    this.apiKeyRequired,
    this.authorizationScopes,
    this.authorizationType,
    this.authorizerId,
    this.modelSelectionExpression,
    this.operationName,
    this.requestModels,
    this.requestParameters,
    this.routeKey,
    this.routeResponseSelectionExpression,
    this.target,
  });
  Map<String, dynamic> toJson() => _$UpdateRouteRequestToJson(this);
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
  /// access, or JWT for using JSON Web Tokens.
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

/// Updates a RouteResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateRouteResponseRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The route ID.
  @_s.JsonKey(name: 'routeId', ignore: true)
  final String routeId;

  /// The route response ID.
  @_s.JsonKey(name: 'routeResponseId', ignore: true)
  final String routeResponseId;

  /// The model selection expression for the route response. Supported only for
  /// WebSocket APIs.
  @_s.JsonKey(name: 'modelSelectionExpression')
  final String modelSelectionExpression;

  /// The response models for the route response.
  @_s.JsonKey(name: 'responseModels')
  final Map<String, String> responseModels;

  /// The route response parameters.
  @_s.JsonKey(name: 'responseParameters')
  final Map<String, ParameterConstraints> responseParameters;

  /// The route response key.
  @_s.JsonKey(name: 'routeResponseKey')
  final String routeResponseKey;

  UpdateRouteResponseRequest({
    @_s.required this.apiId,
    @_s.required this.routeId,
    @_s.required this.routeResponseId,
    this.modelSelectionExpression,
    this.responseModels,
    this.responseParameters,
    this.routeResponseKey,
  });
  Map<String, dynamic> toJson() => _$UpdateRouteResponseRequestToJson(this);
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

/// Updates a Stage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateStageRequest {
  /// The API identifier.
  @_s.JsonKey(name: 'apiId', ignore: true)
  final String apiId;

  /// The stage name. Stage names can only contain alphanumeric characters,
  /// hyphens, and underscores. Maximum length is 128 characters.
  @_s.JsonKey(name: 'stageName', ignore: true)
  final String stageName;

  /// Settings for logging access in this stage.
  @_s.JsonKey(name: 'accessLogSettings')
  final AccessLogSettings accessLogSettings;

  /// Specifies whether updates to an API automatically trigger a new deployment.
  /// The default value is false.
  @_s.JsonKey(name: 'autoDeploy')
  final bool autoDeploy;

  /// The identifier of a client certificate for a Stage.
  @_s.JsonKey(name: 'clientCertificateId')
  final String clientCertificateId;

  /// The default route settings for the stage.
  @_s.JsonKey(name: 'defaultRouteSettings')
  final RouteSettings defaultRouteSettings;

  /// The deployment identifier for the API stage. Can't be updated if autoDeploy
  /// is enabled.
  @_s.JsonKey(name: 'deploymentId')
  final String deploymentId;

  /// The description for the API stage.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Route settings for the stage.
  @_s.JsonKey(name: 'routeSettings')
  final Map<String, RouteSettings> routeSettings;

  /// A map that defines the stage variables for a Stage. Variable names can have
  /// alphanumeric and underscore characters, and the values must match
  /// [A-Za-z0-9-._~:/?#&amp;=,]+.
  @_s.JsonKey(name: 'stageVariables')
  final Map<String, String> stageVariables;

  UpdateStageRequest({
    @_s.required this.apiId,
    @_s.required this.stageName,
    this.accessLogSettings,
    this.autoDeploy,
    this.clientCertificateId,
    this.defaultRouteSettings,
    this.deploymentId,
    this.description,
    this.routeSettings,
    this.stageVariables,
  });
  Map<String, dynamic> toJson() => _$UpdateStageRequestToJson(this);
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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
  @_s.JsonKey(
      name: 'lastUpdatedDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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

/// Updates a VPC link.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateVpcLinkRequest {
  /// The ID of the VPC link.
  @_s.JsonKey(name: 'vpcLinkId', ignore: true)
  final String vpcLinkId;

  /// The name of the VPC link.
  @_s.JsonKey(name: 'name')
  final String name;

  UpdateVpcLinkRequest({
    @_s.required this.vpcLinkId,
    this.name,
  });
  Map<String, dynamic> toJson() => _$UpdateVpcLinkRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVpcLinkResponse {
  /// The timestamp when the VPC link was created.
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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
  @_s.JsonKey(
      name: 'createdDate', fromJson: iso8601FromJson, toJson: iso8601ToJson)
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
