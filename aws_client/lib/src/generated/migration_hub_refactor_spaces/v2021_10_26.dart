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

/// This API reference provides descriptions, syntax, and other details about
/// each of the actions and data types for Amazon Web Services Migration Hub
/// Refactor Spaces (Refactor Spaces). The topic for each action shows the API
/// request parameters and the response. Alternatively, you can use one of the
/// Amazon Web Services SDKs to access an API that is tailored to the
/// programming language or platform that you're using. For more information,
/// see <a href="https://aws.amazon.com/tools/#SDKs">Amazon Web Services
/// SDKs</a>.
class MigrationHubRefactorSpaces {
  final _s.RestJsonProtocol _protocol;
  MigrationHubRefactorSpaces({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'refactor-spaces',
            signingName: 'refactor-spaces',
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

  /// Creates an Amazon Web Services Migration Hub Refactor Spaces application.
  /// The account that owns the environment also owns the applications created
  /// inside the environment, regardless of the account that creates the
  /// application. Refactor Spaces provisions an Amazon API Gateway, API Gateway
  /// VPC link, and Network Load Balancer for the application proxy inside your
  /// account.
  ///
  /// In environments created with a <a
  /// href="https://docs.aws.amazon.com/migrationhub-refactor-spaces/latest/APIReference/API_CreateEnvironment.html#migrationhubrefactorspaces-CreateEnvironment-request-NetworkFabricType">CreateEnvironment:NetworkFabricType</a>
  /// of <code>NONE</code> you need to configure <a
  /// href="https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/amazon-vpc-to-amazon-vpc-connectivity-options.html">
  /// VPC to VPC connectivity</a> between your service VPC and the application
  /// proxy VPC to route traffic through the application proxy to a service with
  /// a private URL endpoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/migrationhub-refactor-spaces/latest/userguide/getting-started-create-application.html">
  /// Create an application</a> in the <i>Refactor Spaces User Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [environmentIdentifier] :
  /// The unique identifier of the environment.
  ///
  /// Parameter [name] :
  /// The name to use for the application.
  ///
  /// Parameter [proxyType] :
  /// The proxy type of the proxy created within the application.
  ///
  /// Parameter [vpcId] :
  /// The ID of the virtual private cloud (VPC).
  ///
  /// Parameter [apiGatewayProxy] :
  /// A wrapper object holding the API Gateway endpoint type and stage name for
  /// the proxy.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the application. A tag is a label that you assign to
  /// an Amazon Web Services resource. Each tag consists of a key-value pair.
  Future<CreateApplicationResponse> createApplication({
    required String environmentIdentifier,
    required String name,
    required ProxyType proxyType,
    required String vpcId,
    ApiGatewayProxyInput? apiGatewayProxy,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'ProxyType': proxyType.toValue(),
      'VpcId': vpcId,
      if (apiGatewayProxy != null) 'ApiGatewayProxy': apiGatewayProxy,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApplicationResponse.fromJson(response);
  }

  /// Creates an Amazon Web Services Migration Hub Refactor Spaces environment.
  /// The caller owns the environment resource, and all Refactor Spaces
  /// applications, services, and routes created within the environment. They
  /// are referred to as the <i>environment owner</i>. The environment owner has
  /// cross-account visibility and control of Refactor Spaces resources that are
  /// added to the environment by other accounts that the environment is shared
  /// with.
  ///
  /// When creating an environment with a <a
  /// href="https://docs.aws.amazon.com/migrationhub-refactor-spaces/latest/APIReference/API_CreateEnvironment.html#migrationhubrefactorspaces-CreateEnvironment-request-NetworkFabricType">CreateEnvironment:NetworkFabricType</a>
  /// of <code>TRANSIT_GATEWAY</code>, Refactor Spaces provisions a transit
  /// gateway to enable services in VPCs to communicate directly across
  /// accounts. If <a
  /// href="https://docs.aws.amazon.com/migrationhub-refactor-spaces/latest/APIReference/API_CreateEnvironment.html#migrationhubrefactorspaces-CreateEnvironment-request-NetworkFabricType">CreateEnvironment:NetworkFabricType</a>
  /// is <code>NONE</code>, Refactor Spaces does not create a transit gateway
  /// and you must use your network infrastructure to route traffic to services
  /// with private URL endpoints.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the environment.
  ///
  /// Parameter [networkFabricType] :
  /// The network fabric type of the environment.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// The description of the environment.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the environment. A tag is a label that you assign to
  /// an Amazon Web Services resource. Each tag consists of a key-value pair.
  Future<CreateEnvironmentResponse> createEnvironment({
    required String name,
    required NetworkFabricType networkFabricType,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'NetworkFabricType': networkFabricType.toValue(),
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/environments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEnvironmentResponse.fromJson(response);
  }

  /// Creates an Amazon Web Services Migration Hub Refactor Spaces route. The
  /// account owner of the service resource is always the environment owner,
  /// regardless of which account creates the route. Routes target a service in
  /// the application. If an application does not have any routes, then the
  /// first route must be created as a <code>DEFAULT</code>
  /// <code>RouteType</code>.
  ///
  /// When created, the default route defaults to an active state so state is
  /// not a required input. However, like all other state values the state of
  /// the default route can be updated after creation, but only when all other
  /// routes are also inactive. Conversely, no route can be active without the
  /// default route also being active.
  ///
  /// When you create a route, Refactor Spaces configures the Amazon API Gateway
  /// to send traffic to the target service as follows:
  ///
  /// <ul>
  /// <li>
  /// <b>URL Endpoints</b>
  ///
  /// If the service has a URL endpoint, and the endpoint resolves to a private
  /// IP address, Refactor Spaces routes traffic using the API Gateway VPC link.
  /// If a service endpoint resolves to a public IP address, Refactor Spaces
  /// routes traffic over the public internet. Services can have HTTP or HTTPS
  /// URL endpoints. For HTTPS URLs, publicly-signed certificates are supported.
  /// Private Certificate Authorities (CAs) are permitted only if the CA's
  /// domain is also publicly resolvable.
  ///
  /// Refactor Spaces automatically resolves the public Domain Name System (DNS)
  /// names that are set in <code>CreateService:UrlEndpoint </code>when you
  /// create a service. The DNS names resolve when the DNS time-to-live (TTL)
  /// expires, or every 60 seconds for TTLs less than 60 seconds. This periodic
  /// DNS resolution ensures that the route configuration remains up-to-date.
  /// <p/>
  /// <b>One-time health check</b>
  ///
  /// A one-time health check is performed on the service when either the route
  /// is updated from inactive to active, or when it is created with an active
  /// state. If the health check fails, the route transitions the route state to
  /// <code>FAILED</code>, an error code of
  /// <code>SERVICE_ENDPOINT_HEALTH_CHECK_FAILURE</code> is provided, and no
  /// traffic is sent to the service.
  ///
  /// For private URLs, a target group is created on the Network Load Balancer
  /// and the load balancer target group runs default target health checks. By
  /// default, the health check is run against the service endpoint URL.
  /// Optionally, the health check can be performed against a different
  /// protocol, port, and/or path using the <a
  /// href="https://docs.aws.amazon.com/migrationhub-refactor-spaces/latest/APIReference/API_CreateService.html#migrationhubrefactorspaces-CreateService-request-UrlEndpoint">CreateService:UrlEndpoint</a>
  /// parameter. All other health check settings for the load balancer use the
  /// default values described in the <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/target-group-health-checks.html">Health
  /// checks for your target groups</a> in the <i>Elastic Load Balancing
  /// guide</i>. The health check is considered successful if at least one
  /// target within the target group transitions to a healthy state.
  /// <p/> </li>
  /// <li>
  /// <b>Lambda function endpoints</b>
  ///
  /// If the service has an Lambda function endpoint, then Refactor Spaces
  /// configures the Lambda function's resource policy to allow the
  /// application's API Gateway to invoke the function.
  ///
  /// The Lambda function state is checked. If the function is not active, the
  /// function configuration is updated so that Lambda resources are
  /// provisioned. If the Lambda state is <code>Failed</code>, then the route
  /// creation fails. For more information, see the <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/API_GetFunctionConfiguration.html#SSS-GetFunctionConfiguration-response-State">GetFunctionConfiguration's
  /// State response parameter</a> in the <i>Lambda Developer Guide</i>.
  ///
  /// A check is performed to determine that a Lambda function with the
  /// specified ARN exists. If it does not exist, the health check fails. For
  /// public URLs, a connection is opened to the public endpoint. If the URL is
  /// not reachable, the health check fails.
  /// </li>
  /// </ul>
  /// <b>Environments without a network bridge</b>
  ///
  /// When you create environments without a network bridge (<a
  /// href="https://docs.aws.amazon.com/migrationhub-refactor-spaces/latest/APIReference/API_CreateEnvironment.html#migrationhubrefactorspaces-CreateEnvironment-request-NetworkFabricType">CreateEnvironment:NetworkFabricType</a>
  /// is <code>NONE)</code> and you use your own networking infrastructure, you
  /// need to configure <a
  /// href="https://docs.aws.amazon.com/whitepapers/latest/aws-vpc-connectivity-options/amazon-vpc-to-amazon-vpc-connectivity-options.html">VPC
  /// to VPC connectivity</a> between your network and the application proxy
  /// VPC. Route creation from the application proxy to service endpoints will
  /// fail if your network is not configured to connect to the application proxy
  /// VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/migrationhub-refactor-spaces/latest/userguide/getting-started-create-role.html">
  /// Create a route</a> in the <i>Refactor Spaces User Guide</i>.
  /// <p/>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [applicationIdentifier] :
  /// The ID of the application within which the route is being created.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment in which the route is created.
  ///
  /// Parameter [routeType] :
  /// The route type of the route. <code>DEFAULT</code> indicates that all
  /// traffic that does not match another route is forwarded to the default
  /// route. Applications must have a default route before any other routes can
  /// be created. <code>URI_PATH</code> indicates a route that is based on a URI
  /// path.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID of the service in which the route is created. Traffic that matches
  /// this route is forwarded to this service.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [defaultRoute] :
  /// Configuration for the default route type.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the route. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key-value pair..
  ///
  /// Parameter [uriPathRoute] :
  /// The configuration for the URI path route type.
  Future<CreateRouteResponse> createRoute({
    required String applicationIdentifier,
    required String environmentIdentifier,
    required RouteType routeType,
    required String serviceIdentifier,
    String? clientToken,
    DefaultRouteInput? defaultRoute,
    Map<String, String>? tags,
    UriPathRouteInput? uriPathRoute,
  }) async {
    final $payload = <String, dynamic>{
      'RouteType': routeType.toValue(),
      'ServiceIdentifier': serviceIdentifier,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (defaultRoute != null) 'DefaultRoute': defaultRoute,
      if (tags != null) 'Tags': tags,
      if (uriPathRoute != null) 'UriPathRoute': uriPathRoute,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications/${Uri.encodeComponent(applicationIdentifier)}/routes',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRouteResponse.fromJson(response);
  }

  /// Creates an Amazon Web Services Migration Hub Refactor Spaces service. The
  /// account owner of the service is always the environment owner, regardless
  /// of which account in the environment creates the service. Services have
  /// either a URL endpoint in a virtual private cloud (VPC), or a Lambda
  /// function endpoint.
  /// <important>
  /// If an Amazon Web Services resource is launched in a service VPC, and you
  /// want it to be accessible to all of an environment’s services with VPCs and
  /// routes, apply the <code>RefactorSpacesSecurityGroup</code> to the
  /// resource. Alternatively, to add more cross-account constraints, apply your
  /// own security group.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [applicationIdentifier] :
  /// The ID of the application which the service is created.
  ///
  /// Parameter [endpointType] :
  /// The type of endpoint to use for the service. The type can be a URL in a
  /// VPC or an Lambda function.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment in which the service is created.
  ///
  /// Parameter [name] :
  /// The name of the service.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// The description of the service.
  ///
  /// Parameter [lambdaEndpoint] :
  /// The configuration for the Lambda endpoint type.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the service. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key-value pair..
  ///
  /// Parameter [urlEndpoint] :
  /// The configuration for the URL endpoint type. When creating a route to a
  /// service, Refactor Spaces automatically resolves the address in the
  /// <code>UrlEndpointInput</code> object URL when the Domain Name System (DNS)
  /// time-to-live (TTL) expires, or every 60 seconds for TTLs less than 60
  /// seconds.
  ///
  /// Parameter [vpcId] :
  /// The ID of the VPC.
  Future<CreateServiceResponse> createService({
    required String applicationIdentifier,
    required ServiceEndpointType endpointType,
    required String environmentIdentifier,
    required String name,
    String? clientToken,
    String? description,
    LambdaEndpointInput? lambdaEndpoint,
    Map<String, String>? tags,
    UrlEndpointInput? urlEndpoint,
    String? vpcId,
  }) async {
    final $payload = <String, dynamic>{
      'EndpointType': endpointType.toValue(),
      'Name': name,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (lambdaEndpoint != null) 'LambdaEndpoint': lambdaEndpoint,
      if (tags != null) 'Tags': tags,
      if (urlEndpoint != null) 'UrlEndpoint': urlEndpoint,
      if (vpcId != null) 'VpcId': vpcId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications/${Uri.encodeComponent(applicationIdentifier)}/services',
      exceptionFnMap: _exceptionFns,
    );
    return CreateServiceResponse.fromJson(response);
  }

  /// Deletes an Amazon Web Services Migration Hub Refactor Spaces application.
  /// Before you can delete an application, you must first delete any services
  /// or routes within the application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [applicationIdentifier] :
  /// The ID of the application.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment.
  Future<DeleteApplicationResponse> deleteApplication({
    required String applicationIdentifier,
    required String environmentIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications/${Uri.encodeComponent(applicationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteApplicationResponse.fromJson(response);
  }

  /// Deletes an Amazon Web Services Migration Hub Refactor Spaces environment.
  /// Before you can delete an environment, you must first delete any
  /// applications and services within the environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment.
  Future<DeleteEnvironmentResponse> deleteEnvironment({
    required String environmentIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/environments/${Uri.encodeComponent(environmentIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteEnvironmentResponse.fromJson(response);
  }

  /// Deletes the resource policy set for the environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [identifier] :
  /// Amazon Resource Name (ARN) of the resource associated with the policy.
  Future<void> deleteResourcePolicy({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/resourcepolicy/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Amazon Web Services Migration Hub Refactor Spaces route.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [applicationIdentifier] :
  /// The ID of the application to delete the route from.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment to delete the route from.
  ///
  /// Parameter [routeIdentifier] :
  /// The ID of the route to delete.
  Future<DeleteRouteResponse> deleteRoute({
    required String applicationIdentifier,
    required String environmentIdentifier,
    required String routeIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications/${Uri.encodeComponent(applicationIdentifier)}/routes/${Uri.encodeComponent(routeIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRouteResponse.fromJson(response);
  }

  /// Deletes an Amazon Web Services Migration Hub Refactor Spaces service.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [applicationIdentifier] :
  /// Deletes a Refactor Spaces service.
  /// <note>
  /// The <code>RefactorSpacesSecurityGroup</code> security group must be
  /// removed from all Amazon Web Services resources in the virtual private
  /// cloud (VPC) prior to deleting a service with a URL endpoint in a VPC.
  /// </note>
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment that the service is in.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID of the service to delete.
  Future<DeleteServiceResponse> deleteService({
    required String applicationIdentifier,
    required String environmentIdentifier,
    required String serviceIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications/${Uri.encodeComponent(applicationIdentifier)}/services/${Uri.encodeComponent(serviceIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteServiceResponse.fromJson(response);
  }

  /// Gets an Amazon Web Services Migration Hub Refactor Spaces application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [applicationIdentifier] :
  /// The ID of the application.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment.
  Future<GetApplicationResponse> getApplication({
    required String applicationIdentifier,
    required String environmentIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications/${Uri.encodeComponent(applicationIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationResponse.fromJson(response);
  }

  /// Gets an Amazon Web Services Migration Hub Refactor Spaces environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment.
  Future<GetEnvironmentResponse> getEnvironment({
    required String environmentIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/environments/${Uri.encodeComponent(environmentIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnvironmentResponse.fromJson(response);
  }

  /// Gets the resource-based permission policy that is set for the given
  /// environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [identifier] :
  /// The Amazon Resource Name (ARN) of the resource associated with the policy.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resourcepolicy/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePolicyResponse.fromJson(response);
  }

  /// Gets an Amazon Web Services Migration Hub Refactor Spaces route.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [applicationIdentifier] :
  /// The ID of the application.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment.
  ///
  /// Parameter [routeIdentifier] :
  /// The ID of the route.
  Future<GetRouteResponse> getRoute({
    required String applicationIdentifier,
    required String environmentIdentifier,
    required String routeIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications/${Uri.encodeComponent(applicationIdentifier)}/routes/${Uri.encodeComponent(routeIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRouteResponse.fromJson(response);
  }

  /// Gets an Amazon Web Services Migration Hub Refactor Spaces service.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [applicationIdentifier] :
  /// The ID of the application.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment.
  ///
  /// Parameter [serviceIdentifier] :
  /// The ID of the service.
  Future<GetServiceResponse> getService({
    required String applicationIdentifier,
    required String environmentIdentifier,
    required String serviceIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications/${Uri.encodeComponent(applicationIdentifier)}/services/${Uri.encodeComponent(serviceIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceResponse.fromJson(response);
  }

  /// Lists all the Amazon Web Services Migration Hub Refactor Spaces
  /// applications within an environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListApplicationsResponse> listApplications({
    required String environmentIdentifier,
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationsResponse.fromJson(response);
  }

  /// Lists all Amazon Web Services Migration Hub Refactor Spaces service
  /// virtual private clouds (VPCs) that are part of the environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListEnvironmentVpcsResponse> listEnvironmentVpcs({
    required String environmentIdentifier,
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/vpcs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnvironmentVpcsResponse.fromJson(response);
  }

  /// Lists Amazon Web Services Migration Hub Refactor Spaces environments owned
  /// by a caller account or shared with the caller account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListEnvironmentsResponse> listEnvironments({
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/environments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnvironmentsResponse.fromJson(response);
  }

  /// Lists all the Amazon Web Services Migration Hub Refactor Spaces routes
  /// within an application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [applicationIdentifier] :
  /// The ID of the application.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListRoutesResponse> listRoutes({
    required String applicationIdentifier,
    required String environmentIdentifier,
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications/${Uri.encodeComponent(applicationIdentifier)}/routes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRoutesResponse.fromJson(response);
  }

  /// Lists all the Amazon Web Services Migration Hub Refactor Spaces services
  /// within an application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [applicationIdentifier] :
  /// The ID of the application.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListServicesResponse> listServices({
    required String applicationIdentifier,
    required String environmentIdentifier,
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications/${Uri.encodeComponent(applicationIdentifier)}/services',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListServicesResponse.fromJson(response);
  }

  /// Lists the tags of a resource. The caller account must be the same as the
  /// resource’s <code>OwnerAccountId</code>. Listing tags in other accounts is
  /// not supported.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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

  /// Attaches a resource-based permission policy to the Amazon Web Services
  /// Migration Hub Refactor Spaces environment. The policy must contain the
  /// same actions and condition statements as the
  /// <code>arn:aws:ram::aws:permission/AWSRAMDefaultPermissionRefactorSpacesEnvironment</code>
  /// permission in Resource Access Manager. The policy must not contain new
  /// lines or blank lines.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [InvalidResourcePolicyException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [policy] :
  /// A JSON-formatted string for an Amazon Web Services resource-based policy.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which the policy is
  /// being attached.
  Future<void> putResourcePolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'Policy': policy,
      'ResourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/resourcepolicy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the tags of a given resource. Tags are metadata which can be used
  /// to manage a resource. To tag a resource, the caller account must be the
  /// same as the resource’s <code>OwnerAccountId</code>. Tagging resources in
  /// other accounts is not supported.
  /// <note>
  /// Amazon Web Services Migration Hub Refactor Spaces does not propagate tags
  /// to orchestrated resources, such as an environment’s transit gateway.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The new or modified tags for the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds to or modifies the tags of the given resource. Tags are metadata
  /// which can be used to manage a resource. To untag a resource, the caller
  /// account must be the same as the resource’s <code>OwnerAccountId</code>.
  /// Untagging resources across accounts is not supported.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The list of keys of the tags to be removed from the resource.
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

  /// Updates an Amazon Web Services Migration Hub Refactor Spaces route.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [activationState] :
  /// If set to <code>ACTIVE</code>, traffic is forwarded to this route’s
  /// service after the route is updated.
  ///
  /// Parameter [applicationIdentifier] :
  /// The ID of the application within which the route is being updated.
  ///
  /// Parameter [environmentIdentifier] :
  /// The ID of the environment in which the route is being updated.
  ///
  /// Parameter [routeIdentifier] :
  /// The unique identifier of the route to update.
  Future<UpdateRouteResponse> updateRoute({
    required RouteActivationState activationState,
    required String applicationIdentifier,
    required String environmentIdentifier,
    required String routeIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'ActivationState': activationState.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/environments/${Uri.encodeComponent(environmentIdentifier)}/applications/${Uri.encodeComponent(applicationIdentifier)}/routes/${Uri.encodeComponent(routeIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRouteResponse.fromJson(response);
  }
}

enum ApiGatewayEndpointType {
  regional,
  private,
}

extension ApiGatewayEndpointTypeValueExtension on ApiGatewayEndpointType {
  String toValue() {
    switch (this) {
      case ApiGatewayEndpointType.regional:
        return 'REGIONAL';
      case ApiGatewayEndpointType.private:
        return 'PRIVATE';
    }
  }
}

extension ApiGatewayEndpointTypeFromString on String {
  ApiGatewayEndpointType toApiGatewayEndpointType() {
    switch (this) {
      case 'REGIONAL':
        return ApiGatewayEndpointType.regional;
      case 'PRIVATE':
        return ApiGatewayEndpointType.private;
    }
    throw Exception('$this is not known in enum ApiGatewayEndpointType');
  }
}

/// A wrapper object holding the Amazon API Gateway proxy configuration.
class ApiGatewayProxyConfig {
  /// The resource ID of the API Gateway for the proxy.
  final String? apiGatewayId;

  /// The type of API Gateway endpoint created.
  final ApiGatewayEndpointType? endpointType;

  /// The Amazon Resource Name (ARN) of the Network Load Balancer configured by
  /// the API Gateway proxy.
  final String? nlbArn;

  /// The name of the Network Load Balancer that is configured by the API Gateway
  /// proxy.
  final String? nlbName;

  /// The endpoint URL of the API Gateway proxy.
  final String? proxyUrl;

  /// The name of the API Gateway stage. The name defaults to <code>prod</code>.
  final String? stageName;

  /// The <code>VpcLink</code> ID of the API Gateway proxy.
  final String? vpcLinkId;

  ApiGatewayProxyConfig({
    this.apiGatewayId,
    this.endpointType,
    this.nlbArn,
    this.nlbName,
    this.proxyUrl,
    this.stageName,
    this.vpcLinkId,
  });

  factory ApiGatewayProxyConfig.fromJson(Map<String, dynamic> json) {
    return ApiGatewayProxyConfig(
      apiGatewayId: json['ApiGatewayId'] as String?,
      endpointType:
          (json['EndpointType'] as String?)?.toApiGatewayEndpointType(),
      nlbArn: json['NlbArn'] as String?,
      nlbName: json['NlbName'] as String?,
      proxyUrl: json['ProxyUrl'] as String?,
      stageName: json['StageName'] as String?,
      vpcLinkId: json['VpcLinkId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayId = this.apiGatewayId;
    final endpointType = this.endpointType;
    final nlbArn = this.nlbArn;
    final nlbName = this.nlbName;
    final proxyUrl = this.proxyUrl;
    final stageName = this.stageName;
    final vpcLinkId = this.vpcLinkId;
    return {
      if (apiGatewayId != null) 'ApiGatewayId': apiGatewayId,
      if (endpointType != null) 'EndpointType': endpointType.toValue(),
      if (nlbArn != null) 'NlbArn': nlbArn,
      if (nlbName != null) 'NlbName': nlbName,
      if (proxyUrl != null) 'ProxyUrl': proxyUrl,
      if (stageName != null) 'StageName': stageName,
      if (vpcLinkId != null) 'VpcLinkId': vpcLinkId,
    };
  }
}

/// A wrapper object holding the Amazon API Gateway endpoint input.
class ApiGatewayProxyInput {
  /// The type of endpoint to use for the API Gateway proxy. If no value is
  /// specified in the request, the value is set to <code>REGIONAL</code> by
  /// default.
  ///
  /// If the value is set to <code>PRIVATE</code> in the request, this creates a
  /// private API endpoint that is isolated from the public internet. The private
  /// endpoint can only be accessed by using Amazon Virtual Private Cloud (Amazon
  /// VPC) interface endpoints for the Amazon API Gateway that has been granted
  /// access. For more information about creating a private connection with
  /// Refactor Spaces and interface endpoint (Amazon Web Services PrivateLink)
  /// availability, see <a
  /// href="https://docs.aws.amazon.com/migrationhub-refactor-spaces/latest/userguide/vpc-interface-endpoints.html">Access
  /// Refactor Spaces using an interface endpoint (Amazon Web Services
  /// PrivateLink)</a>.
  final ApiGatewayEndpointType? endpointType;

  /// The name of the API Gateway stage. The name defaults to <code>prod</code>.
  final String? stageName;

  ApiGatewayProxyInput({
    this.endpointType,
    this.stageName,
  });

  factory ApiGatewayProxyInput.fromJson(Map<String, dynamic> json) {
    return ApiGatewayProxyInput(
      endpointType:
          (json['EndpointType'] as String?)?.toApiGatewayEndpointType(),
      stageName: json['StageName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpointType = this.endpointType;
    final stageName = this.stageName;
    return {
      if (endpointType != null) 'EndpointType': endpointType.toValue(),
      if (stageName != null) 'StageName': stageName,
    };
  }
}

/// A wrapper object holding the Amazon API Gateway proxy summary.
class ApiGatewayProxySummary {
  /// The resource ID of the API Gateway for the proxy.
  final String? apiGatewayId;

  /// The type of API Gateway endpoint created.
  final ApiGatewayEndpointType? endpointType;

  /// The Amazon Resource Name (ARN) of the Network Load Balancer configured by
  /// the API Gateway proxy.
  final String? nlbArn;

  /// The name of the Network Load Balancer that is configured by the API Gateway
  /// proxy.
  final String? nlbName;

  /// The endpoint URL of the API Gateway proxy.
  final String? proxyUrl;

  /// The name of the API Gateway stage. The name defaults to <code>prod</code>.
  final String? stageName;

  /// The <code>VpcLink</code> ID of the API Gateway proxy.
  final String? vpcLinkId;

  ApiGatewayProxySummary({
    this.apiGatewayId,
    this.endpointType,
    this.nlbArn,
    this.nlbName,
    this.proxyUrl,
    this.stageName,
    this.vpcLinkId,
  });

  factory ApiGatewayProxySummary.fromJson(Map<String, dynamic> json) {
    return ApiGatewayProxySummary(
      apiGatewayId: json['ApiGatewayId'] as String?,
      endpointType:
          (json['EndpointType'] as String?)?.toApiGatewayEndpointType(),
      nlbArn: json['NlbArn'] as String?,
      nlbName: json['NlbName'] as String?,
      proxyUrl: json['ProxyUrl'] as String?,
      stageName: json['StageName'] as String?,
      vpcLinkId: json['VpcLinkId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayId = this.apiGatewayId;
    final endpointType = this.endpointType;
    final nlbArn = this.nlbArn;
    final nlbName = this.nlbName;
    final proxyUrl = this.proxyUrl;
    final stageName = this.stageName;
    final vpcLinkId = this.vpcLinkId;
    return {
      if (apiGatewayId != null) 'ApiGatewayId': apiGatewayId,
      if (endpointType != null) 'EndpointType': endpointType.toValue(),
      if (nlbArn != null) 'NlbArn': nlbArn,
      if (nlbName != null) 'NlbName': nlbName,
      if (proxyUrl != null) 'ProxyUrl': proxyUrl,
      if (stageName != null) 'StageName': stageName,
      if (vpcLinkId != null) 'VpcLinkId': vpcLinkId,
    };
  }
}

enum ApplicationState {
  creating,
  active,
  deleting,
  failed,
  updating,
}

extension ApplicationStateValueExtension on ApplicationState {
  String toValue() {
    switch (this) {
      case ApplicationState.creating:
        return 'CREATING';
      case ApplicationState.active:
        return 'ACTIVE';
      case ApplicationState.deleting:
        return 'DELETING';
      case ApplicationState.failed:
        return 'FAILED';
      case ApplicationState.updating:
        return 'UPDATING';
    }
  }
}

extension ApplicationStateFromString on String {
  ApplicationState toApplicationState() {
    switch (this) {
      case 'CREATING':
        return ApplicationState.creating;
      case 'ACTIVE':
        return ApplicationState.active;
      case 'DELETING':
        return ApplicationState.deleting;
      case 'FAILED':
        return ApplicationState.failed;
      case 'UPDATING':
        return ApplicationState.updating;
    }
    throw Exception('$this is not known in enum ApplicationState');
  }
}

/// The list of <code>ApplicationSummary</code> objects.
class ApplicationSummary {
  /// The endpoint URL of the Amazon API Gateway proxy.
  final ApiGatewayProxySummary? apiGatewayProxy;

  /// The unique identifier of the application.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the application.
  final String? arn;

  /// The Amazon Web Services account ID of the application creator.
  final String? createdByAccountId;

  /// A timestamp that indicates when the application is created.
  final DateTime? createdTime;

  /// The unique identifier of the environment.
  final String? environmentId;

  /// Any error associated with the application resource.
  final ErrorResponse? error;

  /// A timestamp that indicates when the application was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the application.
  final String? name;

  /// The Amazon Web Services account ID of the application owner (which is always
  /// the same as the environment owner account ID).
  final String? ownerAccountId;

  /// The proxy type of the proxy created within the application.
  final ProxyType? proxyType;

  /// The current state of the application.
  final ApplicationState? state;

  /// The tags assigned to the application.
  final Map<String, String>? tags;

  /// The ID of the virtual private cloud (VPC).
  final String? vpcId;

  ApplicationSummary({
    this.apiGatewayProxy,
    this.applicationId,
    this.arn,
    this.createdByAccountId,
    this.createdTime,
    this.environmentId,
    this.error,
    this.lastUpdatedTime,
    this.name,
    this.ownerAccountId,
    this.proxyType,
    this.state,
    this.tags,
    this.vpcId,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      apiGatewayProxy: json['ApiGatewayProxy'] != null
          ? ApiGatewayProxySummary.fromJson(
              json['ApiGatewayProxy'] as Map<String, dynamic>)
          : null,
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      createdByAccountId: json['CreatedByAccountId'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      environmentId: json['EnvironmentId'] as String?,
      error: json['Error'] != null
          ? ErrorResponse.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      proxyType: (json['ProxyType'] as String?)?.toProxyType(),
      state: (json['State'] as String?)?.toApplicationState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayProxy = this.apiGatewayProxy;
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdByAccountId = this.createdByAccountId;
    final createdTime = this.createdTime;
    final environmentId = this.environmentId;
    final error = this.error;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final proxyType = this.proxyType;
    final state = this.state;
    final tags = this.tags;
    final vpcId = this.vpcId;
    return {
      if (apiGatewayProxy != null) 'ApiGatewayProxy': apiGatewayProxy,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (createdByAccountId != null) 'CreatedByAccountId': createdByAccountId,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (error != null) 'Error': error,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (proxyType != null) 'ProxyType': proxyType.toValue(),
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

class CreateApplicationResponse {
  /// A wrapper object holding the API Gateway endpoint type and stage name for
  /// the proxy.
  final ApiGatewayProxyInput? apiGatewayProxy;

  /// The unique identifier of the application.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is
  /// <code>arn:aws:refactor-spaces:<i>region</i>:<i>account-id</i>:<i>resource-type/resource-id</i>
  /// </code>. For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The Amazon Web Services account ID of application creator.
  final String? createdByAccountId;

  /// A timestamp that indicates when the application is created.
  final DateTime? createdTime;

  /// The ID of the environment in which the application is created.
  final String? environmentId;

  /// A timestamp that indicates when the application was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the application.
  final String? name;

  /// The Amazon Web Services account ID of the application owner (which is always
  /// the same as the environment owner account ID).
  final String? ownerAccountId;

  /// The proxy type of the proxy created within the application.
  final ProxyType? proxyType;

  /// The current state of the application.
  final ApplicationState? state;

  /// The tags assigned to the application. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key-value pair.
  final Map<String, String>? tags;

  /// The ID of the Amazon VPC.
  final String? vpcId;

  CreateApplicationResponse({
    this.apiGatewayProxy,
    this.applicationId,
    this.arn,
    this.createdByAccountId,
    this.createdTime,
    this.environmentId,
    this.lastUpdatedTime,
    this.name,
    this.ownerAccountId,
    this.proxyType,
    this.state,
    this.tags,
    this.vpcId,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      apiGatewayProxy: json['ApiGatewayProxy'] != null
          ? ApiGatewayProxyInput.fromJson(
              json['ApiGatewayProxy'] as Map<String, dynamic>)
          : null,
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      createdByAccountId: json['CreatedByAccountId'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      environmentId: json['EnvironmentId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      proxyType: (json['ProxyType'] as String?)?.toProxyType(),
      state: (json['State'] as String?)?.toApplicationState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayProxy = this.apiGatewayProxy;
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdByAccountId = this.createdByAccountId;
    final createdTime = this.createdTime;
    final environmentId = this.environmentId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final proxyType = this.proxyType;
    final state = this.state;
    final tags = this.tags;
    final vpcId = this.vpcId;
    return {
      if (apiGatewayProxy != null) 'ApiGatewayProxy': apiGatewayProxy,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (createdByAccountId != null) 'CreatedByAccountId': createdByAccountId,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (proxyType != null) 'ProxyType': proxyType.toValue(),
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

class CreateEnvironmentResponse {
  /// The Amazon Resource Name (ARN) of the environment.
  final String? arn;

  /// A timestamp that indicates when the environment is created.
  final DateTime? createdTime;

  /// A description of the environment.
  final String? description;

  /// The unique identifier of the environment.
  final String? environmentId;

  /// A timestamp that indicates when the environment was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the environment.
  final String? name;

  /// The network fabric type of the environment.
  final NetworkFabricType? networkFabricType;

  /// The Amazon Web Services account ID of environment owner.
  final String? ownerAccountId;

  /// The current state of the environment.
  final EnvironmentState? state;

  /// The tags assigned to the created environment. A tag is a label that you
  /// assign to an Amazon Web Services resource. Each tag consists of a key-value
  /// pair..
  final Map<String, String>? tags;

  CreateEnvironmentResponse({
    this.arn,
    this.createdTime,
    this.description,
    this.environmentId,
    this.lastUpdatedTime,
    this.name,
    this.networkFabricType,
    this.ownerAccountId,
    this.state,
    this.tags,
  });

  factory CreateEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentResponse(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      environmentId: json['EnvironmentId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      networkFabricType:
          (json['NetworkFabricType'] as String?)?.toNetworkFabricType(),
      ownerAccountId: json['OwnerAccountId'] as String?,
      state: (json['State'] as String?)?.toEnvironmentState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final environmentId = this.environmentId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final networkFabricType = this.networkFabricType;
    final ownerAccountId = this.ownerAccountId;
    final state = this.state;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (networkFabricType != null)
        'NetworkFabricType': networkFabricType.toValue(),
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateRouteResponse {
  /// The ID of the application in which the route is created.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the route. The format for this ARN is
  /// <code>arn:aws:refactor-spaces:<i>region</i>:<i>account-id</i>:<i>resource-type/resource-id</i>
  /// </code>. For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The Amazon Web Services account ID of the route creator.
  final String? createdByAccountId;

  /// A timestamp that indicates when the route is created.
  final DateTime? createdTime;

  /// A timestamp that indicates when the route was last updated.
  final DateTime? lastUpdatedTime;

  /// The Amazon Web Services account ID of the route owner.
  final String? ownerAccountId;

  /// The unique identifier of the route.
  final String? routeId;

  /// The route type of the route.
  final RouteType? routeType;

  /// The ID of service in which the route is created. Traffic that matches this
  /// route is forwarded to this service.
  final String? serviceId;

  /// The current state of the route. Activation state only allows
  /// <code>ACTIVE</code> or <code>INACTIVE</code> as user inputs.
  /// <code>FAILED</code> is a route state that is system generated.
  final RouteState? state;

  /// The tags assigned to the created route. A tag is a label that you assign to
  /// an Amazon Web Services resource. Each tag consists of a key-value pair.
  final Map<String, String>? tags;

  /// Configuration for the URI path route type.
  final UriPathRouteInput? uriPathRoute;

  CreateRouteResponse({
    this.applicationId,
    this.arn,
    this.createdByAccountId,
    this.createdTime,
    this.lastUpdatedTime,
    this.ownerAccountId,
    this.routeId,
    this.routeType,
    this.serviceId,
    this.state,
    this.tags,
    this.uriPathRoute,
  });

  factory CreateRouteResponse.fromJson(Map<String, dynamic> json) {
    return CreateRouteResponse(
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      createdByAccountId: json['CreatedByAccountId'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      ownerAccountId: json['OwnerAccountId'] as String?,
      routeId: json['RouteId'] as String?,
      routeType: (json['RouteType'] as String?)?.toRouteType(),
      serviceId: json['ServiceId'] as String?,
      state: (json['State'] as String?)?.toRouteState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uriPathRoute: json['UriPathRoute'] != null
          ? UriPathRouteInput.fromJson(
              json['UriPathRoute'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdByAccountId = this.createdByAccountId;
    final createdTime = this.createdTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final ownerAccountId = this.ownerAccountId;
    final routeId = this.routeId;
    final routeType = this.routeType;
    final serviceId = this.serviceId;
    final state = this.state;
    final tags = this.tags;
    final uriPathRoute = this.uriPathRoute;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (createdByAccountId != null) 'CreatedByAccountId': createdByAccountId,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (routeId != null) 'RouteId': routeId,
      if (routeType != null) 'RouteType': routeType.toValue(),
      if (serviceId != null) 'ServiceId': serviceId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (uriPathRoute != null) 'UriPathRoute': uriPathRoute,
    };
  }
}

class CreateServiceResponse {
  /// The ID of the application that the created service belongs to.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the service.
  final String? arn;

  /// The Amazon Web Services account ID of the service creator.
  final String? createdByAccountId;

  /// A timestamp that indicates when the service is created.
  final DateTime? createdTime;

  /// The description of the created service.
  final String? description;

  /// The endpoint type of the service.
  final ServiceEndpointType? endpointType;

  /// The unique identifier of the environment.
  final String? environmentId;

  /// The configuration for the Lambda endpoint type.
  final LambdaEndpointInput? lambdaEndpoint;

  /// A timestamp that indicates when the service was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the service.
  final String? name;

  /// The Amazon Web Services account ID of the service owner.
  final String? ownerAccountId;

  /// The unique identifier of the service.
  final String? serviceId;

  /// The current state of the service.
  final ServiceState? state;

  /// The tags assigned to the created service. A tag is a label that you assign
  /// to an Amazon Web Services resource. Each tag consists of a key-value pair..
  final Map<String, String>? tags;

  /// The configuration for the URL endpoint type.
  final UrlEndpointInput? urlEndpoint;

  /// The ID of the VPC.
  final String? vpcId;

  CreateServiceResponse({
    this.applicationId,
    this.arn,
    this.createdByAccountId,
    this.createdTime,
    this.description,
    this.endpointType,
    this.environmentId,
    this.lambdaEndpoint,
    this.lastUpdatedTime,
    this.name,
    this.ownerAccountId,
    this.serviceId,
    this.state,
    this.tags,
    this.urlEndpoint,
    this.vpcId,
  });

  factory CreateServiceResponse.fromJson(Map<String, dynamic> json) {
    return CreateServiceResponse(
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      createdByAccountId: json['CreatedByAccountId'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      endpointType: (json['EndpointType'] as String?)?.toServiceEndpointType(),
      environmentId: json['EnvironmentId'] as String?,
      lambdaEndpoint: json['LambdaEndpoint'] != null
          ? LambdaEndpointInput.fromJson(
              json['LambdaEndpoint'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      serviceId: json['ServiceId'] as String?,
      state: (json['State'] as String?)?.toServiceState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      urlEndpoint: json['UrlEndpoint'] != null
          ? UrlEndpointInput.fromJson(
              json['UrlEndpoint'] as Map<String, dynamic>)
          : null,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdByAccountId = this.createdByAccountId;
    final createdTime = this.createdTime;
    final description = this.description;
    final endpointType = this.endpointType;
    final environmentId = this.environmentId;
    final lambdaEndpoint = this.lambdaEndpoint;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final serviceId = this.serviceId;
    final state = this.state;
    final tags = this.tags;
    final urlEndpoint = this.urlEndpoint;
    final vpcId = this.vpcId;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (createdByAccountId != null) 'CreatedByAccountId': createdByAccountId,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (endpointType != null) 'EndpointType': endpointType.toValue(),
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (lambdaEndpoint != null) 'LambdaEndpoint': lambdaEndpoint,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (serviceId != null) 'ServiceId': serviceId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (urlEndpoint != null) 'UrlEndpoint': urlEndpoint,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// The configuration for the default route type.
class DefaultRouteInput {
  /// If set to <code>ACTIVE</code>, traffic is forwarded to this route’s service
  /// after the route is created.
  final RouteActivationState? activationState;

  DefaultRouteInput({
    this.activationState,
  });

  Map<String, dynamic> toJson() {
    final activationState = this.activationState;
    return {
      if (activationState != null) 'ActivationState': activationState.toValue(),
    };
  }
}

class DeleteApplicationResponse {
  /// The ID of the application.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the application.
  final String? arn;

  /// The unique identifier of the application’s environment.
  final String? environmentId;

  /// A timestamp that indicates when the environment was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the application.
  final String? name;

  /// The current state of the application.
  final ApplicationState? state;

  DeleteApplicationResponse({
    this.applicationId,
    this.arn,
    this.environmentId,
    this.lastUpdatedTime,
    this.name,
    this.state,
  });

  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> json) {
    return DeleteApplicationResponse(
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      environmentId: json['EnvironmentId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toApplicationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final environmentId = this.environmentId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final state = this.state;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

class DeleteEnvironmentResponse {
  /// The Amazon Resource Name (ARN) of the environment.
  final String? arn;

  /// The unique identifier of the environment.
  final String? environmentId;

  /// A timestamp that indicates when the environment was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the environment.
  final String? name;

  /// The current state of the environment.
  final EnvironmentState? state;

  DeleteEnvironmentResponse({
    this.arn,
    this.environmentId,
    this.lastUpdatedTime,
    this.name,
    this.state,
  });

  factory DeleteEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return DeleteEnvironmentResponse(
      arn: json['Arn'] as String?,
      environmentId: json['EnvironmentId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toEnvironmentState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final environmentId = this.environmentId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final state = this.state;
    return {
      if (arn != null) 'Arn': arn,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRouteResponse {
  /// The ID of the application that the route belongs to.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the route.
  final String? arn;

  /// A timestamp that indicates when the route was last updated.
  final DateTime? lastUpdatedTime;

  /// The ID of the route to delete.
  final String? routeId;

  /// The ID of the service that the route belongs to.
  final String? serviceId;

  /// The current state of the route.
  final RouteState? state;

  DeleteRouteResponse({
    this.applicationId,
    this.arn,
    this.lastUpdatedTime,
    this.routeId,
    this.serviceId,
    this.state,
  });

  factory DeleteRouteResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRouteResponse(
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      routeId: json['RouteId'] as String?,
      serviceId: json['ServiceId'] as String?,
      state: (json['State'] as String?)?.toRouteState(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final lastUpdatedTime = this.lastUpdatedTime;
    final routeId = this.routeId;
    final serviceId = this.serviceId;
    final state = this.state;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (routeId != null) 'RouteId': routeId,
      if (serviceId != null) 'ServiceId': serviceId,
      if (state != null) 'State': state.toValue(),
    };
  }
}

class DeleteServiceResponse {
  /// The ID of the application that the service is in.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the service.
  final String? arn;

  /// The unique identifier of the environment.
  final String? environmentId;

  /// A timestamp that indicates when the service was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the service.
  final String? name;

  /// The unique identifier of the service.
  final String? serviceId;

  /// The current state of the service.
  final ServiceState? state;

  DeleteServiceResponse({
    this.applicationId,
    this.arn,
    this.environmentId,
    this.lastUpdatedTime,
    this.name,
    this.serviceId,
    this.state,
  });

  factory DeleteServiceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteServiceResponse(
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      environmentId: json['EnvironmentId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      serviceId: json['ServiceId'] as String?,
      state: (json['State'] as String?)?.toServiceState(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final environmentId = this.environmentId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final serviceId = this.serviceId;
    final state = this.state;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (serviceId != null) 'ServiceId': serviceId,
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum EnvironmentState {
  creating,
  active,
  deleting,
  failed,
}

extension EnvironmentStateValueExtension on EnvironmentState {
  String toValue() {
    switch (this) {
      case EnvironmentState.creating:
        return 'CREATING';
      case EnvironmentState.active:
        return 'ACTIVE';
      case EnvironmentState.deleting:
        return 'DELETING';
      case EnvironmentState.failed:
        return 'FAILED';
    }
  }
}

extension EnvironmentStateFromString on String {
  EnvironmentState toEnvironmentState() {
    switch (this) {
      case 'CREATING':
        return EnvironmentState.creating;
      case 'ACTIVE':
        return EnvironmentState.active;
      case 'DELETING':
        return EnvironmentState.deleting;
      case 'FAILED':
        return EnvironmentState.failed;
    }
    throw Exception('$this is not known in enum EnvironmentState');
  }
}

/// The summary information for environments as a response to
/// <code>ListEnvironments</code>.
class EnvironmentSummary {
  /// The Amazon Resource Name (ARN) of the environment.
  final String? arn;

  /// A timestamp that indicates when the environment is created.
  final DateTime? createdTime;

  /// A description of the environment.
  final String? description;

  /// The unique identifier of the environment.
  final String? environmentId;

  /// Any error associated with the environment resource.
  final ErrorResponse? error;

  /// A timestamp that indicates when the environment was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the environment.
  final String? name;

  /// The network fabric type of the environment.
  final NetworkFabricType? networkFabricType;

  /// The Amazon Web Services account ID of the environment owner.
  final String? ownerAccountId;

  /// The current state of the environment.
  final EnvironmentState? state;

  /// The tags assigned to the environment.
  final Map<String, String>? tags;

  /// The ID of the Transit Gateway set up by the environment.
  final String? transitGatewayId;

  EnvironmentSummary({
    this.arn,
    this.createdTime,
    this.description,
    this.environmentId,
    this.error,
    this.lastUpdatedTime,
    this.name,
    this.networkFabricType,
    this.ownerAccountId,
    this.state,
    this.tags,
    this.transitGatewayId,
  });

  factory EnvironmentSummary.fromJson(Map<String, dynamic> json) {
    return EnvironmentSummary(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      environmentId: json['EnvironmentId'] as String?,
      error: json['Error'] != null
          ? ErrorResponse.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      networkFabricType:
          (json['NetworkFabricType'] as String?)?.toNetworkFabricType(),
      ownerAccountId: json['OwnerAccountId'] as String?,
      state: (json['State'] as String?)?.toEnvironmentState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      transitGatewayId: json['TransitGatewayId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final environmentId = this.environmentId;
    final error = this.error;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final networkFabricType = this.networkFabricType;
    final ownerAccountId = this.ownerAccountId;
    final state = this.state;
    final tags = this.tags;
    final transitGatewayId = this.transitGatewayId;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (error != null) 'Error': error,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (networkFabricType != null)
        'NetworkFabricType': networkFabricType.toValue(),
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (transitGatewayId != null) 'TransitGatewayId': transitGatewayId,
    };
  }
}

/// Provides summary information for the <code>EnvironmentVpc</code> resource as
/// a response to <code>ListEnvironmentVpc</code>.
class EnvironmentVpc {
  /// The Amazon Web Services account ID of the virtual private cloud (VPC) owner.
  final String? accountId;

  /// The list of Amazon Virtual Private Cloud (Amazon VPC) CIDR blocks.
  final List<String>? cidrBlocks;

  /// A timestamp that indicates when the VPC is first added to the environment.
  final DateTime? createdTime;

  /// The unique identifier of the environment.
  final String? environmentId;

  /// A timestamp that indicates when the VPC was last updated by the environment.
  final DateTime? lastUpdatedTime;

  /// The ID of the VPC.
  final String? vpcId;

  /// The name of the VPC at the time it is added to the environment.
  final String? vpcName;

  EnvironmentVpc({
    this.accountId,
    this.cidrBlocks,
    this.createdTime,
    this.environmentId,
    this.lastUpdatedTime,
    this.vpcId,
    this.vpcName,
  });

  factory EnvironmentVpc.fromJson(Map<String, dynamic> json) {
    return EnvironmentVpc(
      accountId: json['AccountId'] as String?,
      cidrBlocks: (json['CidrBlocks'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      createdTime: timeStampFromJson(json['CreatedTime']),
      environmentId: json['EnvironmentId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      vpcId: json['VpcId'] as String?,
      vpcName: json['VpcName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final cidrBlocks = this.cidrBlocks;
    final createdTime = this.createdTime;
    final environmentId = this.environmentId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final vpcId = this.vpcId;
    final vpcName = this.vpcName;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (cidrBlocks != null) 'CidrBlocks': cidrBlocks,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (vpcId != null) 'VpcId': vpcId,
      if (vpcName != null) 'VpcName': vpcName,
    };
  }
}

enum ErrorCode {
  invalidResourceState,
  resourceLimitExceeded,
  resourceCreationFailure,
  resourceUpdateFailure,
  serviceEndpointHealthCheckFailure,
  resourceDeletionFailure,
  resourceRetrievalFailure,
  resourceInUse,
  resourceNotFound,
  stateTransitionFailure,
  requestLimitExceeded,
  notAuthorized,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.invalidResourceState:
        return 'INVALID_RESOURCE_STATE';
      case ErrorCode.resourceLimitExceeded:
        return 'RESOURCE_LIMIT_EXCEEDED';
      case ErrorCode.resourceCreationFailure:
        return 'RESOURCE_CREATION_FAILURE';
      case ErrorCode.resourceUpdateFailure:
        return 'RESOURCE_UPDATE_FAILURE';
      case ErrorCode.serviceEndpointHealthCheckFailure:
        return 'SERVICE_ENDPOINT_HEALTH_CHECK_FAILURE';
      case ErrorCode.resourceDeletionFailure:
        return 'RESOURCE_DELETION_FAILURE';
      case ErrorCode.resourceRetrievalFailure:
        return 'RESOURCE_RETRIEVAL_FAILURE';
      case ErrorCode.resourceInUse:
        return 'RESOURCE_IN_USE';
      case ErrorCode.resourceNotFound:
        return 'RESOURCE_NOT_FOUND';
      case ErrorCode.stateTransitionFailure:
        return 'STATE_TRANSITION_FAILURE';
      case ErrorCode.requestLimitExceeded:
        return 'REQUEST_LIMIT_EXCEEDED';
      case ErrorCode.notAuthorized:
        return 'NOT_AUTHORIZED';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'INVALID_RESOURCE_STATE':
        return ErrorCode.invalidResourceState;
      case 'RESOURCE_LIMIT_EXCEEDED':
        return ErrorCode.resourceLimitExceeded;
      case 'RESOURCE_CREATION_FAILURE':
        return ErrorCode.resourceCreationFailure;
      case 'RESOURCE_UPDATE_FAILURE':
        return ErrorCode.resourceUpdateFailure;
      case 'SERVICE_ENDPOINT_HEALTH_CHECK_FAILURE':
        return ErrorCode.serviceEndpointHealthCheckFailure;
      case 'RESOURCE_DELETION_FAILURE':
        return ErrorCode.resourceDeletionFailure;
      case 'RESOURCE_RETRIEVAL_FAILURE':
        return ErrorCode.resourceRetrievalFailure;
      case 'RESOURCE_IN_USE':
        return ErrorCode.resourceInUse;
      case 'RESOURCE_NOT_FOUND':
        return ErrorCode.resourceNotFound;
      case 'STATE_TRANSITION_FAILURE':
        return ErrorCode.stateTransitionFailure;
      case 'REQUEST_LIMIT_EXCEEDED':
        return ErrorCode.requestLimitExceeded;
      case 'NOT_AUTHORIZED':
        return ErrorCode.notAuthorized;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

enum ErrorResourceType {
  environment,
  application,
  route,
  service,
  transitGateway,
  transitGatewayAttachment,
  apiGateway,
  nlb,
  targetGroup,
  loadBalancerListener,
  vpcLink,
  lambda,
  vpc,
  subnet,
  routeTable,
  securityGroup,
  vpcEndpointServiceConfiguration,
  resourceShare,
  iamRole,
}

extension ErrorResourceTypeValueExtension on ErrorResourceType {
  String toValue() {
    switch (this) {
      case ErrorResourceType.environment:
        return 'ENVIRONMENT';
      case ErrorResourceType.application:
        return 'APPLICATION';
      case ErrorResourceType.route:
        return 'ROUTE';
      case ErrorResourceType.service:
        return 'SERVICE';
      case ErrorResourceType.transitGateway:
        return 'TRANSIT_GATEWAY';
      case ErrorResourceType.transitGatewayAttachment:
        return 'TRANSIT_GATEWAY_ATTACHMENT';
      case ErrorResourceType.apiGateway:
        return 'API_GATEWAY';
      case ErrorResourceType.nlb:
        return 'NLB';
      case ErrorResourceType.targetGroup:
        return 'TARGET_GROUP';
      case ErrorResourceType.loadBalancerListener:
        return 'LOAD_BALANCER_LISTENER';
      case ErrorResourceType.vpcLink:
        return 'VPC_LINK';
      case ErrorResourceType.lambda:
        return 'LAMBDA';
      case ErrorResourceType.vpc:
        return 'VPC';
      case ErrorResourceType.subnet:
        return 'SUBNET';
      case ErrorResourceType.routeTable:
        return 'ROUTE_TABLE';
      case ErrorResourceType.securityGroup:
        return 'SECURITY_GROUP';
      case ErrorResourceType.vpcEndpointServiceConfiguration:
        return 'VPC_ENDPOINT_SERVICE_CONFIGURATION';
      case ErrorResourceType.resourceShare:
        return 'RESOURCE_SHARE';
      case ErrorResourceType.iamRole:
        return 'IAM_ROLE';
    }
  }
}

extension ErrorResourceTypeFromString on String {
  ErrorResourceType toErrorResourceType() {
    switch (this) {
      case 'ENVIRONMENT':
        return ErrorResourceType.environment;
      case 'APPLICATION':
        return ErrorResourceType.application;
      case 'ROUTE':
        return ErrorResourceType.route;
      case 'SERVICE':
        return ErrorResourceType.service;
      case 'TRANSIT_GATEWAY':
        return ErrorResourceType.transitGateway;
      case 'TRANSIT_GATEWAY_ATTACHMENT':
        return ErrorResourceType.transitGatewayAttachment;
      case 'API_GATEWAY':
        return ErrorResourceType.apiGateway;
      case 'NLB':
        return ErrorResourceType.nlb;
      case 'TARGET_GROUP':
        return ErrorResourceType.targetGroup;
      case 'LOAD_BALANCER_LISTENER':
        return ErrorResourceType.loadBalancerListener;
      case 'VPC_LINK':
        return ErrorResourceType.vpcLink;
      case 'LAMBDA':
        return ErrorResourceType.lambda;
      case 'VPC':
        return ErrorResourceType.vpc;
      case 'SUBNET':
        return ErrorResourceType.subnet;
      case 'ROUTE_TABLE':
        return ErrorResourceType.routeTable;
      case 'SECURITY_GROUP':
        return ErrorResourceType.securityGroup;
      case 'VPC_ENDPOINT_SERVICE_CONFIGURATION':
        return ErrorResourceType.vpcEndpointServiceConfiguration;
      case 'RESOURCE_SHARE':
        return ErrorResourceType.resourceShare;
      case 'IAM_ROLE':
        return ErrorResourceType.iamRole;
    }
    throw Exception('$this is not known in enum ErrorResourceType');
  }
}

/// Error associated with a resource returned for a Get or List resource
/// response.
class ErrorResponse {
  /// The Amazon Web Services account ID of the resource owner.
  final String? accountId;

  /// Additional details about the error.
  final Map<String, String>? additionalDetails;

  /// The error code associated with the error.
  final ErrorCode? code;

  /// The message associated with the error.
  final String? message;

  /// The ID of the resource.
  final String? resourceIdentifier;

  /// The type of resource.
  final ErrorResourceType? resourceType;

  ErrorResponse({
    this.accountId,
    this.additionalDetails,
    this.code,
    this.message,
    this.resourceIdentifier,
    this.resourceType,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      accountId: json['AccountId'] as String?,
      additionalDetails: (json['AdditionalDetails'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      code: (json['Code'] as String?)?.toErrorCode(),
      message: json['Message'] as String?,
      resourceIdentifier: json['ResourceIdentifier'] as String?,
      resourceType: (json['ResourceType'] as String?)?.toErrorResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final additionalDetails = this.additionalDetails;
    final code = this.code;
    final message = this.message;
    final resourceIdentifier = this.resourceIdentifier;
    final resourceType = this.resourceType;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (additionalDetails != null) 'AdditionalDetails': additionalDetails,
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
      if (resourceIdentifier != null) 'ResourceIdentifier': resourceIdentifier,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
    };
  }
}

class GetApplicationResponse {
  /// The endpoint URL of the API Gateway proxy.
  final ApiGatewayProxyConfig? apiGatewayProxy;

  /// The unique identifier of the application.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the application.
  final String? arn;

  /// The Amazon Web Services account ID of the application creator.
  final String? createdByAccountId;

  /// A timestamp that indicates when the application is created.
  final DateTime? createdTime;

  /// The unique identifier of the environment.
  final String? environmentId;

  /// Any error associated with the application resource.
  final ErrorResponse? error;

  /// A timestamp that indicates when the application was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the application.
  final String? name;

  /// The Amazon Web Services account ID of the application owner (which is always
  /// the same as the environment owner account ID).
  final String? ownerAccountId;

  /// The proxy type of the proxy created within the application.
  final ProxyType? proxyType;

  /// The current state of the application.
  final ApplicationState? state;

  /// The tags assigned to the application. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key-value pair.
  final Map<String, String>? tags;

  /// The ID of the virtual private cloud (VPC).
  final String? vpcId;

  GetApplicationResponse({
    this.apiGatewayProxy,
    this.applicationId,
    this.arn,
    this.createdByAccountId,
    this.createdTime,
    this.environmentId,
    this.error,
    this.lastUpdatedTime,
    this.name,
    this.ownerAccountId,
    this.proxyType,
    this.state,
    this.tags,
    this.vpcId,
  });

  factory GetApplicationResponse.fromJson(Map<String, dynamic> json) {
    return GetApplicationResponse(
      apiGatewayProxy: json['ApiGatewayProxy'] != null
          ? ApiGatewayProxyConfig.fromJson(
              json['ApiGatewayProxy'] as Map<String, dynamic>)
          : null,
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      createdByAccountId: json['CreatedByAccountId'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      environmentId: json['EnvironmentId'] as String?,
      error: json['Error'] != null
          ? ErrorResponse.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      proxyType: (json['ProxyType'] as String?)?.toProxyType(),
      state: (json['State'] as String?)?.toApplicationState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiGatewayProxy = this.apiGatewayProxy;
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdByAccountId = this.createdByAccountId;
    final createdTime = this.createdTime;
    final environmentId = this.environmentId;
    final error = this.error;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final proxyType = this.proxyType;
    final state = this.state;
    final tags = this.tags;
    final vpcId = this.vpcId;
    return {
      if (apiGatewayProxy != null) 'ApiGatewayProxy': apiGatewayProxy,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (createdByAccountId != null) 'CreatedByAccountId': createdByAccountId,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (error != null) 'Error': error,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (proxyType != null) 'ProxyType': proxyType.toValue(),
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

class GetEnvironmentResponse {
  /// The Amazon Resource Name (ARN) of the environment.
  final String? arn;

  /// A timestamp that indicates when the environment is created.
  final DateTime? createdTime;

  /// The description of the environment.
  final String? description;

  /// The unique identifier of the environment.
  final String? environmentId;

  /// Any error associated with the environment resource.
  final ErrorResponse? error;

  /// A timestamp that indicates when the environment was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the environment.
  final String? name;

  /// The network fabric type of the environment.
  final NetworkFabricType? networkFabricType;

  /// The Amazon Web Services account ID of the environment owner.
  final String? ownerAccountId;

  /// The current state of the environment.
  final EnvironmentState? state;

  /// The tags to assign to the environment. A tag is a label that you assign to
  /// an Amazon Web Services resource. Each tag consists of a key-value pair.
  final Map<String, String>? tags;

  /// The ID of the Transit Gateway set up by the environment, if applicable.
  final String? transitGatewayId;

  GetEnvironmentResponse({
    this.arn,
    this.createdTime,
    this.description,
    this.environmentId,
    this.error,
    this.lastUpdatedTime,
    this.name,
    this.networkFabricType,
    this.ownerAccountId,
    this.state,
    this.tags,
    this.transitGatewayId,
  });

  factory GetEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentResponse(
      arn: json['Arn'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      environmentId: json['EnvironmentId'] as String?,
      error: json['Error'] != null
          ? ErrorResponse.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      networkFabricType:
          (json['NetworkFabricType'] as String?)?.toNetworkFabricType(),
      ownerAccountId: json['OwnerAccountId'] as String?,
      state: (json['State'] as String?)?.toEnvironmentState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      transitGatewayId: json['TransitGatewayId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdTime = this.createdTime;
    final description = this.description;
    final environmentId = this.environmentId;
    final error = this.error;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final networkFabricType = this.networkFabricType;
    final ownerAccountId = this.ownerAccountId;
    final state = this.state;
    final tags = this.tags;
    final transitGatewayId = this.transitGatewayId;
    return {
      if (arn != null) 'Arn': arn,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (error != null) 'Error': error,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (networkFabricType != null)
        'NetworkFabricType': networkFabricType.toValue(),
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (transitGatewayId != null) 'TransitGatewayId': transitGatewayId,
    };
  }
}

class GetResourcePolicyResponse {
  /// A JSON-formatted string for an Amazon Web Services resource-based policy.
  final String? policy;

  GetResourcePolicyResponse({
    this.policy,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

class GetRouteResponse {
  /// If set to <code>true</code>, this option appends the source path to the
  /// service URL endpoint.
  final bool? appendSourcePath;

  /// The ID of the application that the route belongs to.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the route.
  final String? arn;

  /// The Amazon Web Services account ID of the route creator.
  final String? createdByAccountId;

  /// The timestamp of when the route is created.
  final DateTime? createdTime;

  /// Unique identifier of the environment.
  final String? environmentId;

  /// Any error associated with the route resource.
  final ErrorResponse? error;

  /// Indicates whether to match all subpaths of the given source path. If this
  /// value is <code>false</code>, requests must match the source path exactly
  /// before they are forwarded to this route's service.
  final bool? includeChildPaths;

  /// A timestamp that indicates when the route was last updated.
  final DateTime? lastUpdatedTime;

  /// A list of HTTP methods to match. An empty list matches all values. If a
  /// method is present, only HTTP requests using that method are forwarded to
  /// this route’s service.
  final List<HttpMethod>? methods;

  /// The Amazon Web Services account ID of the route owner.
  final String? ownerAccountId;

  /// A mapping of Amazon API Gateway path resources to resource IDs.
  final Map<String, String>? pathResourceToId;

  /// The unique identifier of the route.
  ///
  /// <b>DEFAULT</b>: All traffic that does not match another route is forwarded
  /// to the default route. Applications must have a default route before any
  /// other routes can be created.
  ///
  /// <b>URI_PATH</b>: A route that is based on a URI path.
  final String? routeId;

  /// The type of route.
  final RouteType? routeType;

  /// The unique identifier of the service.
  final String? serviceId;

  /// This is the path that Refactor Spaces uses to match traffic. Paths must
  /// start with <code>/</code> and are relative to the base of the application.
  /// To use path parameters in the source path, add a variable in curly braces.
  /// For example, the resource path {user} represents a path parameter called
  /// 'user'.
  final String? sourcePath;

  /// The current state of the route.
  final RouteState? state;

  /// The tags assigned to the route. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key-value pair.
  final Map<String, String>? tags;

  GetRouteResponse({
    this.appendSourcePath,
    this.applicationId,
    this.arn,
    this.createdByAccountId,
    this.createdTime,
    this.environmentId,
    this.error,
    this.includeChildPaths,
    this.lastUpdatedTime,
    this.methods,
    this.ownerAccountId,
    this.pathResourceToId,
    this.routeId,
    this.routeType,
    this.serviceId,
    this.sourcePath,
    this.state,
    this.tags,
  });

  factory GetRouteResponse.fromJson(Map<String, dynamic> json) {
    return GetRouteResponse(
      appendSourcePath: json['AppendSourcePath'] as bool?,
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      createdByAccountId: json['CreatedByAccountId'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      environmentId: json['EnvironmentId'] as String?,
      error: json['Error'] != null
          ? ErrorResponse.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      includeChildPaths: json['IncludeChildPaths'] as bool?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      methods: (json['Methods'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toHttpMethod())
          .toList(),
      ownerAccountId: json['OwnerAccountId'] as String?,
      pathResourceToId: (json['PathResourceToId'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      routeId: json['RouteId'] as String?,
      routeType: (json['RouteType'] as String?)?.toRouteType(),
      serviceId: json['ServiceId'] as String?,
      sourcePath: json['SourcePath'] as String?,
      state: (json['State'] as String?)?.toRouteState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final appendSourcePath = this.appendSourcePath;
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdByAccountId = this.createdByAccountId;
    final createdTime = this.createdTime;
    final environmentId = this.environmentId;
    final error = this.error;
    final includeChildPaths = this.includeChildPaths;
    final lastUpdatedTime = this.lastUpdatedTime;
    final methods = this.methods;
    final ownerAccountId = this.ownerAccountId;
    final pathResourceToId = this.pathResourceToId;
    final routeId = this.routeId;
    final routeType = this.routeType;
    final serviceId = this.serviceId;
    final sourcePath = this.sourcePath;
    final state = this.state;
    final tags = this.tags;
    return {
      if (appendSourcePath != null) 'AppendSourcePath': appendSourcePath,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (createdByAccountId != null) 'CreatedByAccountId': createdByAccountId,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (error != null) 'Error': error,
      if (includeChildPaths != null) 'IncludeChildPaths': includeChildPaths,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (methods != null) 'Methods': methods.map((e) => e.toValue()).toList(),
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (pathResourceToId != null) 'PathResourceToId': pathResourceToId,
      if (routeId != null) 'RouteId': routeId,
      if (routeType != null) 'RouteType': routeType.toValue(),
      if (serviceId != null) 'ServiceId': serviceId,
      if (sourcePath != null) 'SourcePath': sourcePath,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetServiceResponse {
  /// The ID of the application.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the service.
  final String? arn;

  /// The Amazon Web Services account ID of the service creator.
  final String? createdByAccountId;

  /// The timestamp of when the service is created.
  final DateTime? createdTime;

  /// The description of the service.
  final String? description;

  /// The endpoint type of the service.
  final ServiceEndpointType? endpointType;

  /// The unique identifier of the environment.
  final String? environmentId;

  /// Any error associated with the service resource.
  final ErrorResponse? error;

  /// The configuration for the Lambda endpoint type.
  ///
  /// The <b>Arn</b> is the Amazon Resource Name (ARN) of the Lambda function
  /// associated with this service.
  final LambdaEndpointConfig? lambdaEndpoint;

  /// A timestamp that indicates when the service was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the service.
  final String? name;

  /// The Amazon Web Services account ID of the service owner.
  final String? ownerAccountId;

  /// The unique identifier of the service.
  final String? serviceId;

  /// The current state of the service.
  final ServiceState? state;

  /// The tags assigned to the service. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key-value pair.
  final Map<String, String>? tags;

  /// The configuration for the URL endpoint type.
  ///
  /// The <b>Url</b> isthe URL of the endpoint type.
  ///
  /// The <b>HealthUrl</b> is the health check URL of the endpoint type.
  final UrlEndpointConfig? urlEndpoint;

  /// The ID of the virtual private cloud (VPC).
  final String? vpcId;

  GetServiceResponse({
    this.applicationId,
    this.arn,
    this.createdByAccountId,
    this.createdTime,
    this.description,
    this.endpointType,
    this.environmentId,
    this.error,
    this.lambdaEndpoint,
    this.lastUpdatedTime,
    this.name,
    this.ownerAccountId,
    this.serviceId,
    this.state,
    this.tags,
    this.urlEndpoint,
    this.vpcId,
  });

  factory GetServiceResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceResponse(
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      createdByAccountId: json['CreatedByAccountId'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      endpointType: (json['EndpointType'] as String?)?.toServiceEndpointType(),
      environmentId: json['EnvironmentId'] as String?,
      error: json['Error'] != null
          ? ErrorResponse.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      lambdaEndpoint: json['LambdaEndpoint'] != null
          ? LambdaEndpointConfig.fromJson(
              json['LambdaEndpoint'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      serviceId: json['ServiceId'] as String?,
      state: (json['State'] as String?)?.toServiceState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      urlEndpoint: json['UrlEndpoint'] != null
          ? UrlEndpointConfig.fromJson(
              json['UrlEndpoint'] as Map<String, dynamic>)
          : null,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdByAccountId = this.createdByAccountId;
    final createdTime = this.createdTime;
    final description = this.description;
    final endpointType = this.endpointType;
    final environmentId = this.environmentId;
    final error = this.error;
    final lambdaEndpoint = this.lambdaEndpoint;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final serviceId = this.serviceId;
    final state = this.state;
    final tags = this.tags;
    final urlEndpoint = this.urlEndpoint;
    final vpcId = this.vpcId;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (createdByAccountId != null) 'CreatedByAccountId': createdByAccountId,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (endpointType != null) 'EndpointType': endpointType.toValue(),
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (error != null) 'Error': error,
      if (lambdaEndpoint != null) 'LambdaEndpoint': lambdaEndpoint,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (serviceId != null) 'ServiceId': serviceId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (urlEndpoint != null) 'UrlEndpoint': urlEndpoint,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

enum HttpMethod {
  delete,
  get,
  head,
  options,
  patch,
  post,
  put,
}

extension HttpMethodValueExtension on HttpMethod {
  String toValue() {
    switch (this) {
      case HttpMethod.delete:
        return 'DELETE';
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.head:
        return 'HEAD';
      case HttpMethod.options:
        return 'OPTIONS';
      case HttpMethod.patch:
        return 'PATCH';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
    }
  }
}

extension HttpMethodFromString on String {
  HttpMethod toHttpMethod() {
    switch (this) {
      case 'DELETE':
        return HttpMethod.delete;
      case 'GET':
        return HttpMethod.get;
      case 'HEAD':
        return HttpMethod.head;
      case 'OPTIONS':
        return HttpMethod.options;
      case 'PATCH':
        return HttpMethod.patch;
      case 'POST':
        return HttpMethod.post;
      case 'PUT':
        return HttpMethod.put;
    }
    throw Exception('$this is not known in enum HttpMethod');
  }
}

/// The configuration for the Lambda endpoint type.
class LambdaEndpointConfig {
  /// The Amazon Resource Name (ARN) of the Lambda endpoint.
  final String? arn;

  LambdaEndpointConfig({
    this.arn,
  });

  factory LambdaEndpointConfig.fromJson(Map<String, dynamic> json) {
    return LambdaEndpointConfig(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

/// The input for the Lambda endpoint type.
class LambdaEndpointInput {
  /// The Amazon Resource Name (ARN) of the Lambda function or alias.
  final String arn;

  LambdaEndpointInput({
    required this.arn,
  });

  factory LambdaEndpointInput.fromJson(Map<String, dynamic> json) {
    return LambdaEndpointInput(
      arn: json['Arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'Arn': arn,
    };
  }
}

/// The summary for the Lambda endpoint type.
class LambdaEndpointSummary {
  /// The Amazon Resource Name (ARN) of the Lambda endpoint.
  final String? arn;

  LambdaEndpointSummary({
    this.arn,
  });

  factory LambdaEndpointSummary.fromJson(Map<String, dynamic> json) {
    return LambdaEndpointSummary(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class ListApplicationsResponse {
  /// The list of <code>ApplicationSummary</code> objects.
  final List<ApplicationSummary>? applicationSummaryList;

  /// The token for the next page of results.
  final String? nextToken;

  ListApplicationsResponse({
    this.applicationSummaryList,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      applicationSummaryList: (json['ApplicationSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationSummaryList = this.applicationSummaryList;
    final nextToken = this.nextToken;
    return {
      if (applicationSummaryList != null)
        'ApplicationSummaryList': applicationSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEnvironmentVpcsResponse {
  /// The list of <code>EnvironmentVpc</code> objects.
  final List<EnvironmentVpc>? environmentVpcList;

  /// The token for the next page of results.
  final String? nextToken;

  ListEnvironmentVpcsResponse({
    this.environmentVpcList,
    this.nextToken,
  });

  factory ListEnvironmentVpcsResponse.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentVpcsResponse(
      environmentVpcList: (json['EnvironmentVpcList'] as List?)
          ?.whereNotNull()
          .map((e) => EnvironmentVpc.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentVpcList = this.environmentVpcList;
    final nextToken = this.nextToken;
    return {
      if (environmentVpcList != null) 'EnvironmentVpcList': environmentVpcList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEnvironmentsResponse {
  /// The list of <code>EnvironmentSummary</code> objects.
  final List<EnvironmentSummary>? environmentSummaryList;

  /// The token for the next page of results.
  final String? nextToken;

  ListEnvironmentsResponse({
    this.environmentSummaryList,
    this.nextToken,
  });

  factory ListEnvironmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentsResponse(
      environmentSummaryList: (json['EnvironmentSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => EnvironmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentSummaryList = this.environmentSummaryList;
    final nextToken = this.nextToken;
    return {
      if (environmentSummaryList != null)
        'EnvironmentSummaryList': environmentSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRoutesResponse {
  /// The token for the next page of results.
  final String? nextToken;

  /// The list of <code>RouteSummary</code> objects.
  final List<RouteSummary>? routeSummaryList;

  ListRoutesResponse({
    this.nextToken,
    this.routeSummaryList,
  });

  factory ListRoutesResponse.fromJson(Map<String, dynamic> json) {
    return ListRoutesResponse(
      nextToken: json['NextToken'] as String?,
      routeSummaryList: (json['RouteSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => RouteSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final routeSummaryList = this.routeSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (routeSummaryList != null) 'RouteSummaryList': routeSummaryList,
    };
  }
}

class ListServicesResponse {
  /// The token for the next page of results.
  final String? nextToken;

  /// The list of <code>ServiceSummary</code> objects.
  final List<ServiceSummary>? serviceSummaryList;

  ListServicesResponse({
    this.nextToken,
    this.serviceSummaryList,
  });

  factory ListServicesResponse.fromJson(Map<String, dynamic> json) {
    return ListServicesResponse(
      nextToken: json['NextToken'] as String?,
      serviceSummaryList: (json['ServiceSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final serviceSummaryList = this.serviceSummaryList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (serviceSummaryList != null) 'ServiceSummaryList': serviceSummaryList,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tags assigned to the resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

enum NetworkFabricType {
  transitGateway,
  none,
}

extension NetworkFabricTypeValueExtension on NetworkFabricType {
  String toValue() {
    switch (this) {
      case NetworkFabricType.transitGateway:
        return 'TRANSIT_GATEWAY';
      case NetworkFabricType.none:
        return 'NONE';
    }
  }
}

extension NetworkFabricTypeFromString on String {
  NetworkFabricType toNetworkFabricType() {
    switch (this) {
      case 'TRANSIT_GATEWAY':
        return NetworkFabricType.transitGateway;
      case 'NONE':
        return NetworkFabricType.none;
    }
    throw Exception('$this is not known in enum NetworkFabricType');
  }
}

enum ProxyType {
  apiGateway,
}

extension ProxyTypeValueExtension on ProxyType {
  String toValue() {
    switch (this) {
      case ProxyType.apiGateway:
        return 'API_GATEWAY';
    }
  }
}

extension ProxyTypeFromString on String {
  ProxyType toProxyType() {
    switch (this) {
      case 'API_GATEWAY':
        return ProxyType.apiGateway;
    }
    throw Exception('$this is not known in enum ProxyType');
  }
}

class PutResourcePolicyResponse {
  PutResourcePolicyResponse();

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum RouteActivationState {
  active,
  inactive,
}

extension RouteActivationStateValueExtension on RouteActivationState {
  String toValue() {
    switch (this) {
      case RouteActivationState.active:
        return 'ACTIVE';
      case RouteActivationState.inactive:
        return 'INACTIVE';
    }
  }
}

extension RouteActivationStateFromString on String {
  RouteActivationState toRouteActivationState() {
    switch (this) {
      case 'ACTIVE':
        return RouteActivationState.active;
      case 'INACTIVE':
        return RouteActivationState.inactive;
    }
    throw Exception('$this is not known in enum RouteActivationState');
  }
}

enum RouteState {
  creating,
  active,
  deleting,
  failed,
  updating,
  inactive,
}

extension RouteStateValueExtension on RouteState {
  String toValue() {
    switch (this) {
      case RouteState.creating:
        return 'CREATING';
      case RouteState.active:
        return 'ACTIVE';
      case RouteState.deleting:
        return 'DELETING';
      case RouteState.failed:
        return 'FAILED';
      case RouteState.updating:
        return 'UPDATING';
      case RouteState.inactive:
        return 'INACTIVE';
    }
  }
}

extension RouteStateFromString on String {
  RouteState toRouteState() {
    switch (this) {
      case 'CREATING':
        return RouteState.creating;
      case 'ACTIVE':
        return RouteState.active;
      case 'DELETING':
        return RouteState.deleting;
      case 'FAILED':
        return RouteState.failed;
      case 'UPDATING':
        return RouteState.updating;
      case 'INACTIVE':
        return RouteState.inactive;
    }
    throw Exception('$this is not known in enum RouteState');
  }
}

/// The summary information for the routes as a response to
/// <code>ListRoutes</code>.
class RouteSummary {
  /// If set to <code>true</code>, this option appends the source path to the
  /// service URL endpoint.
  final bool? appendSourcePath;

  /// The unique identifier of the application.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the route.
  final String? arn;

  /// The Amazon Web Services account ID of the route creator.
  final String? createdByAccountId;

  /// A timestamp that indicates when the route is created.
  final DateTime? createdTime;

  /// The unique identifier of the environment.
  final String? environmentId;

  /// Any error associated with the route resource.
  final ErrorResponse? error;

  /// Indicates whether to match all subpaths of the given source path. If this
  /// value is <code>false</code>, requests must match the source path exactly
  /// before they are forwarded to this route's service.
  final bool? includeChildPaths;

  /// A timestamp that indicates when the route was last updated.
  final DateTime? lastUpdatedTime;

  /// A list of HTTP methods to match. An empty list matches all values. If a
  /// method is present, only HTTP requests using that method are forwarded to
  /// this route’s service.
  final List<HttpMethod>? methods;

  /// The Amazon Web Services account ID of the route owner.
  final String? ownerAccountId;

  /// A mapping of Amazon API Gateway path resources to resource IDs.
  final Map<String, String>? pathResourceToId;

  /// The unique identifier of the route.
  final String? routeId;

  /// The route type of the route.
  final RouteType? routeType;

  /// The unique identifier of the service.
  final String? serviceId;

  /// This is the path that Refactor Spaces uses to match traffic. Paths must
  /// start with <code>/</code> and are relative to the base of the application.
  /// To use path parameters in the source path, add a variable in curly braces.
  /// For example, the resource path {user} represents a path parameter called
  /// 'user'.
  final String? sourcePath;

  /// The current state of the route.
  final RouteState? state;

  /// The tags assigned to the route.
  final Map<String, String>? tags;

  RouteSummary({
    this.appendSourcePath,
    this.applicationId,
    this.arn,
    this.createdByAccountId,
    this.createdTime,
    this.environmentId,
    this.error,
    this.includeChildPaths,
    this.lastUpdatedTime,
    this.methods,
    this.ownerAccountId,
    this.pathResourceToId,
    this.routeId,
    this.routeType,
    this.serviceId,
    this.sourcePath,
    this.state,
    this.tags,
  });

  factory RouteSummary.fromJson(Map<String, dynamic> json) {
    return RouteSummary(
      appendSourcePath: json['AppendSourcePath'] as bool?,
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      createdByAccountId: json['CreatedByAccountId'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      environmentId: json['EnvironmentId'] as String?,
      error: json['Error'] != null
          ? ErrorResponse.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      includeChildPaths: json['IncludeChildPaths'] as bool?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      methods: (json['Methods'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toHttpMethod())
          .toList(),
      ownerAccountId: json['OwnerAccountId'] as String?,
      pathResourceToId: (json['PathResourceToId'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      routeId: json['RouteId'] as String?,
      routeType: (json['RouteType'] as String?)?.toRouteType(),
      serviceId: json['ServiceId'] as String?,
      sourcePath: json['SourcePath'] as String?,
      state: (json['State'] as String?)?.toRouteState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final appendSourcePath = this.appendSourcePath;
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdByAccountId = this.createdByAccountId;
    final createdTime = this.createdTime;
    final environmentId = this.environmentId;
    final error = this.error;
    final includeChildPaths = this.includeChildPaths;
    final lastUpdatedTime = this.lastUpdatedTime;
    final methods = this.methods;
    final ownerAccountId = this.ownerAccountId;
    final pathResourceToId = this.pathResourceToId;
    final routeId = this.routeId;
    final routeType = this.routeType;
    final serviceId = this.serviceId;
    final sourcePath = this.sourcePath;
    final state = this.state;
    final tags = this.tags;
    return {
      if (appendSourcePath != null) 'AppendSourcePath': appendSourcePath,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (createdByAccountId != null) 'CreatedByAccountId': createdByAccountId,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (error != null) 'Error': error,
      if (includeChildPaths != null) 'IncludeChildPaths': includeChildPaths,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (methods != null) 'Methods': methods.map((e) => e.toValue()).toList(),
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (pathResourceToId != null) 'PathResourceToId': pathResourceToId,
      if (routeId != null) 'RouteId': routeId,
      if (routeType != null) 'RouteType': routeType.toValue(),
      if (serviceId != null) 'ServiceId': serviceId,
      if (sourcePath != null) 'SourcePath': sourcePath,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum RouteType {
  $default,
  uriPath,
}

extension RouteTypeValueExtension on RouteType {
  String toValue() {
    switch (this) {
      case RouteType.$default:
        return 'DEFAULT';
      case RouteType.uriPath:
        return 'URI_PATH';
    }
  }
}

extension RouteTypeFromString on String {
  RouteType toRouteType() {
    switch (this) {
      case 'DEFAULT':
        return RouteType.$default;
      case 'URI_PATH':
        return RouteType.uriPath;
    }
    throw Exception('$this is not known in enum RouteType');
  }
}

enum ServiceEndpointType {
  lambda,
  url,
}

extension ServiceEndpointTypeValueExtension on ServiceEndpointType {
  String toValue() {
    switch (this) {
      case ServiceEndpointType.lambda:
        return 'LAMBDA';
      case ServiceEndpointType.url:
        return 'URL';
    }
  }
}

extension ServiceEndpointTypeFromString on String {
  ServiceEndpointType toServiceEndpointType() {
    switch (this) {
      case 'LAMBDA':
        return ServiceEndpointType.lambda;
      case 'URL':
        return ServiceEndpointType.url;
    }
    throw Exception('$this is not known in enum ServiceEndpointType');
  }
}

enum ServiceState {
  creating,
  active,
  deleting,
  failed,
}

extension ServiceStateValueExtension on ServiceState {
  String toValue() {
    switch (this) {
      case ServiceState.creating:
        return 'CREATING';
      case ServiceState.active:
        return 'ACTIVE';
      case ServiceState.deleting:
        return 'DELETING';
      case ServiceState.failed:
        return 'FAILED';
    }
  }
}

extension ServiceStateFromString on String {
  ServiceState toServiceState() {
    switch (this) {
      case 'CREATING':
        return ServiceState.creating;
      case 'ACTIVE':
        return ServiceState.active;
      case 'DELETING':
        return ServiceState.deleting;
      case 'FAILED':
        return ServiceState.failed;
    }
    throw Exception('$this is not known in enum ServiceState');
  }
}

/// A summary for the service as a response to <code>ListServices</code>.
class ServiceSummary {
  /// The unique identifier of the application.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the service.
  final String? arn;

  /// The Amazon Web Services account ID of the service creator.
  final String? createdByAccountId;

  /// A timestamp that indicates when the service is created.
  final DateTime? createdTime;

  /// A description of the service.
  final String? description;

  /// The endpoint type of the service.
  final ServiceEndpointType? endpointType;

  /// The unique identifier of the environment.
  final String? environmentId;

  /// Any error associated with the service resource.
  final ErrorResponse? error;

  /// A summary of the configuration for the Lambda endpoint type.
  final LambdaEndpointSummary? lambdaEndpoint;

  /// A timestamp that indicates when the service was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the service.
  final String? name;

  /// The Amazon Web Services account ID of the service owner.
  final String? ownerAccountId;

  /// The unique identifier of the service.
  final String? serviceId;

  /// The current state of the service.
  final ServiceState? state;

  /// The tags assigned to the service.
  final Map<String, String>? tags;

  /// The summary of the configuration for the URL endpoint type.
  final UrlEndpointSummary? urlEndpoint;

  /// The ID of the virtual private cloud (VPC).
  final String? vpcId;

  ServiceSummary({
    this.applicationId,
    this.arn,
    this.createdByAccountId,
    this.createdTime,
    this.description,
    this.endpointType,
    this.environmentId,
    this.error,
    this.lambdaEndpoint,
    this.lastUpdatedTime,
    this.name,
    this.ownerAccountId,
    this.serviceId,
    this.state,
    this.tags,
    this.urlEndpoint,
    this.vpcId,
  });

  factory ServiceSummary.fromJson(Map<String, dynamic> json) {
    return ServiceSummary(
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      createdByAccountId: json['CreatedByAccountId'] as String?,
      createdTime: timeStampFromJson(json['CreatedTime']),
      description: json['Description'] as String?,
      endpointType: (json['EndpointType'] as String?)?.toServiceEndpointType(),
      environmentId: json['EnvironmentId'] as String?,
      error: json['Error'] != null
          ? ErrorResponse.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      lambdaEndpoint: json['LambdaEndpoint'] != null
          ? LambdaEndpointSummary.fromJson(
              json['LambdaEndpoint'] as Map<String, dynamic>)
          : null,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      name: json['Name'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      serviceId: json['ServiceId'] as String?,
      state: (json['State'] as String?)?.toServiceState(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      urlEndpoint: json['UrlEndpoint'] != null
          ? UrlEndpointSummary.fromJson(
              json['UrlEndpoint'] as Map<String, dynamic>)
          : null,
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdByAccountId = this.createdByAccountId;
    final createdTime = this.createdTime;
    final description = this.description;
    final endpointType = this.endpointType;
    final environmentId = this.environmentId;
    final error = this.error;
    final lambdaEndpoint = this.lambdaEndpoint;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final serviceId = this.serviceId;
    final state = this.state;
    final tags = this.tags;
    final urlEndpoint = this.urlEndpoint;
    final vpcId = this.vpcId;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (createdByAccountId != null) 'CreatedByAccountId': createdByAccountId,
      if (createdTime != null) 'CreatedTime': unixTimestampToJson(createdTime),
      if (description != null) 'Description': description,
      if (endpointType != null) 'EndpointType': endpointType.toValue(),
      if (environmentId != null) 'EnvironmentId': environmentId,
      if (error != null) 'Error': error,
      if (lambdaEndpoint != null) 'LambdaEndpoint': lambdaEndpoint,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'Name': name,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (serviceId != null) 'ServiceId': serviceId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (urlEndpoint != null) 'UrlEndpoint': urlEndpoint,
      if (vpcId != null) 'VpcId': vpcId,
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

class UpdateRouteResponse {
  /// The ID of the application in which the route is being updated.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the route. The format for this ARN is
  /// <code>arn:aws:refactor-spaces:<i>region</i>:<i>account-id</i>:<i>resource-type/resource-id</i>
  /// </code>. For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// A timestamp that indicates when the route was last updated.
  final DateTime? lastUpdatedTime;

  /// The unique identifier of the route.
  final String? routeId;

  /// The ID of service in which the route was created. Traffic that matches this
  /// route is forwarded to this service.
  final String? serviceId;

  /// The current state of the route.
  final RouteState? state;

  UpdateRouteResponse({
    this.applicationId,
    this.arn,
    this.lastUpdatedTime,
    this.routeId,
    this.serviceId,
    this.state,
  });

  factory UpdateRouteResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRouteResponse(
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      routeId: json['RouteId'] as String?,
      serviceId: json['ServiceId'] as String?,
      state: (json['State'] as String?)?.toRouteState(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final lastUpdatedTime = this.lastUpdatedTime;
    final routeId = this.routeId;
    final serviceId = this.serviceId;
    final state = this.state;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (routeId != null) 'RouteId': routeId,
      if (serviceId != null) 'ServiceId': serviceId,
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// The configuration for the URI path route type.
class UriPathRouteInput {
  /// If set to <code>ACTIVE</code>, traffic is forwarded to this route’s service
  /// after the route is created.
  final RouteActivationState activationState;

  /// This is the path that Refactor Spaces uses to match traffic. Paths must
  /// start with <code>/</code> and are relative to the base of the application.
  /// To use path parameters in the source path, add a variable in curly braces.
  /// For example, the resource path {user} represents a path parameter called
  /// 'user'.
  final String sourcePath;

  /// If set to <code>true</code>, this option appends the source path to the
  /// service URL endpoint.
  final bool? appendSourcePath;

  /// Indicates whether to match all subpaths of the given source path. If this
  /// value is <code>false</code>, requests must match the source path exactly
  /// before they are forwarded to this route's service.
  final bool? includeChildPaths;

  /// A list of HTTP methods to match. An empty list matches all values. If a
  /// method is present, only HTTP requests using that method are forwarded to
  /// this route’s service.
  final List<HttpMethod>? methods;

  UriPathRouteInput({
    required this.activationState,
    required this.sourcePath,
    this.appendSourcePath,
    this.includeChildPaths,
    this.methods,
  });

  factory UriPathRouteInput.fromJson(Map<String, dynamic> json) {
    return UriPathRouteInput(
      activationState:
          (json['ActivationState'] as String).toRouteActivationState(),
      sourcePath: json['SourcePath'] as String,
      appendSourcePath: json['AppendSourcePath'] as bool?,
      includeChildPaths: json['IncludeChildPaths'] as bool?,
      methods: (json['Methods'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toHttpMethod())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final activationState = this.activationState;
    final sourcePath = this.sourcePath;
    final appendSourcePath = this.appendSourcePath;
    final includeChildPaths = this.includeChildPaths;
    final methods = this.methods;
    return {
      'ActivationState': activationState.toValue(),
      'SourcePath': sourcePath,
      if (appendSourcePath != null) 'AppendSourcePath': appendSourcePath,
      if (includeChildPaths != null) 'IncludeChildPaths': includeChildPaths,
      if (methods != null) 'Methods': methods.map((e) => e.toValue()).toList(),
    };
  }
}

/// The configuration for the URL endpoint type.
class UrlEndpointConfig {
  /// The health check URL of the URL endpoint type.
  final String? healthUrl;

  /// The HTTP URL endpoint.
  final String? url;

  UrlEndpointConfig({
    this.healthUrl,
    this.url,
  });

  factory UrlEndpointConfig.fromJson(Map<String, dynamic> json) {
    return UrlEndpointConfig(
      healthUrl: json['HealthUrl'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthUrl = this.healthUrl;
    final url = this.url;
    return {
      if (healthUrl != null) 'HealthUrl': healthUrl,
      if (url != null) 'Url': url,
    };
  }
}

/// The configuration for the URL endpoint type.
class UrlEndpointInput {
  /// The URL to route traffic to. The URL must be an <a
  /// href="https://datatracker.ietf.org/doc/html/rfc3986">rfc3986-formatted
  /// URL</a>. If the host is a domain name, the name must be resolvable over the
  /// public internet. If the scheme is <code>https</code>, the top level domain
  /// of the host must be listed in the <a
  /// href="https://www.iana.org/domains/root/db">IANA root zone database</a>.
  final String url;

  /// The health check URL of the URL endpoint type. If the URL is a public
  /// endpoint, the <code>HealthUrl</code> must also be a public endpoint. If the
  /// URL is a private endpoint inside a virtual private cloud (VPC), the health
  /// URL must also be a private endpoint, and the host must be the same as the
  /// URL.
  final String? healthUrl;

  UrlEndpointInput({
    required this.url,
    this.healthUrl,
  });

  factory UrlEndpointInput.fromJson(Map<String, dynamic> json) {
    return UrlEndpointInput(
      url: json['Url'] as String,
      healthUrl: json['HealthUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    final healthUrl = this.healthUrl;
    return {
      'Url': url,
      if (healthUrl != null) 'HealthUrl': healthUrl,
    };
  }
}

/// The summary of the configuration for the URL endpoint type.
class UrlEndpointSummary {
  /// The health check URL of the URL endpoint type. If the URL is a public
  /// endpoint, the <code>HealthUrl</code> must also be a public endpoint. If the
  /// URL is a private endpoint inside a virtual private cloud (VPC), the health
  /// URL must also be a private endpoint, and the host must be the same as the
  /// URL.
  final String? healthUrl;

  /// The URL to route traffic to. The URL must be an <a
  /// href="https://datatracker.ietf.org/doc/html/rfc3986">rfc3986-formatted
  /// URL</a>. If the host is a domain name, the name must be resolvable over the
  /// public internet. If the scheme is <code>https</code>, the top level domain
  /// of the host must be listed in the <a
  /// href="https://www.iana.org/domains/root/db">IANA root zone database</a>.
  final String? url;

  UrlEndpointSummary({
    this.healthUrl,
    this.url,
  });

  factory UrlEndpointSummary.fromJson(Map<String, dynamic> json) {
    return UrlEndpointSummary(
      healthUrl: json['HealthUrl'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthUrl = this.healthUrl;
    final url = this.url;
    return {
      if (healthUrl != null) 'HealthUrl': healthUrl,
      if (url != null) 'Url': url,
    };
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

class InvalidResourcePolicyException extends _s.GenericAwsException {
  InvalidResourcePolicyException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidResourcePolicyException',
            message: message);
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
  'InvalidResourcePolicyException': (type, message) =>
      InvalidResourcePolicyException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
