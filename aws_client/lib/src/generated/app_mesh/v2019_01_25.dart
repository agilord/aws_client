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

/// App Mesh is a service mesh based on the Envoy proxy that makes it easy to
/// monitor and control microservices. App Mesh standardizes how your
/// microservices communicate, giving you end-to-end visibility and helping to
/// ensure high availability for your applications.
///
/// App Mesh gives you consistent visibility and network traffic controls for
/// every microservice in an application. You can use App Mesh with Amazon Web
/// Services Fargate, Amazon ECS, Amazon EKS, Kubernetes on Amazon Web Services,
/// and Amazon EC2.
/// <note>
/// App Mesh supports microservice applications that use service discovery
/// naming for their components. For more information about service discovery on
/// Amazon ECS, see <a
/// href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html">Service
/// Discovery</a> in the <i>Amazon Elastic Container Service Developer
/// Guide</i>. Kubernetes <code>kube-dns</code> and <code>coredns</code> are
/// supported. For more information, see <a
/// href="https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/">DNS
/// for Services and Pods</a> in the Kubernetes documentation.
/// </note>
class AppMesh {
  final _s.RestJsonProtocol _protocol;
  AppMesh({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'appmesh',
            signingName: 'appmesh',
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

  /// Creates a gateway route.
  ///
  /// A gateway route is attached to a virtual gateway and routes traffic to an
  /// existing virtual service. If a route matches a request, it can distribute
  /// traffic to a target virtual service.
  ///
  /// For more information about gateway routes, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/gateway-routes.html">Gateway
  /// routes</a>.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [gatewayRouteName] :
  /// The name to use for the gateway route.
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to create the gateway route in.
  ///
  /// Parameter [spec] :
  /// The gateway route specification to apply.
  ///
  /// Parameter [virtualGatewayName] :
  /// The name of the virtual gateway to associate the gateway route with. If
  /// the virtual gateway is in a shared mesh, then you must be the owner of the
  /// virtual gateway resource.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then the account that you specify must share
  /// the mesh with your account before you can create the resource in the
  /// service mesh. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you can apply to the gateway route to assist with
  /// categorization and organization. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<CreateGatewayRouteOutput> createGatewayRoute({
    required String gatewayRouteName,
    required String meshName,
    required GatewayRouteSpec spec,
    required String virtualGatewayName,
    String? clientToken,
    String? meshOwner,
    List<TagRef>? tags,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final $payload = <String, dynamic>{
      'gatewayRouteName': gatewayRouteName,
      'spec': spec,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualGateway/${Uri.encodeComponent(virtualGatewayName)}/gatewayRoutes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateGatewayRouteOutput(
      gatewayRoute: GatewayRouteData.fromJson($json),
    );
  }

  /// Creates a service mesh.
  ///
  /// A service mesh is a logical boundary for network traffic between services
  /// that are represented by resources within the mesh. After you create your
  /// service mesh, you can create virtual services, virtual nodes, virtual
  /// routers, and routes to distribute traffic between the applications in your
  /// mesh.
  ///
  /// For more information about service meshes, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/meshes.html">Service
  /// meshes</a>.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [meshName] :
  /// The name to use for the service mesh.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [spec] :
  /// The service mesh specification to apply.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you can apply to the service mesh to assist with
  /// categorization and organization. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<CreateMeshOutput> createMesh({
    required String meshName,
    String? clientToken,
    MeshSpec? spec,
    List<TagRef>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'meshName': meshName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (spec != null) 'spec': spec,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v20190125/meshes',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateMeshOutput(
      mesh: MeshData.fromJson($json),
    );
  }

  /// Creates a route that is associated with a virtual router.
  ///
  /// You can route several different protocols and define a retry policy for a
  /// route. Traffic can be routed to one or more virtual nodes.
  ///
  /// For more information about routes, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/routes.html">Routes</a>.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to create the route in.
  ///
  /// Parameter [routeName] :
  /// The name to use for the route.
  ///
  /// Parameter [spec] :
  /// The route specification to apply.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router in which to create the route. If the
  /// virtual router is in a shared mesh, then you must be the owner of the
  /// virtual router resource.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then the account that you specify must share
  /// the mesh with your account before you can create the resource in the
  /// service mesh. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you can apply to the route to assist with
  /// categorization and organization. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<CreateRouteOutput> createRoute({
    required String meshName,
    required String routeName,
    required RouteSpec spec,
    required String virtualRouterName,
    String? clientToken,
    String? meshOwner,
    List<TagRef>? tags,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final $payload = <String, dynamic>{
      'routeName': routeName,
      'spec': spec,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualRouter/${Uri.encodeComponent(virtualRouterName)}/routes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateRouteOutput(
      route: RouteData.fromJson($json),
    );
  }

  /// Creates a virtual gateway.
  ///
  /// A virtual gateway allows resources outside your mesh to communicate to
  /// resources that are inside your mesh. The virtual gateway represents an
  /// Envoy proxy running in an Amazon ECS task, in a Kubernetes service, or on
  /// an Amazon EC2 instance. Unlike a virtual node, which represents an Envoy
  /// running with an application, a virtual gateway represents Envoy deployed
  /// by itself.
  ///
  /// For more information about virtual gateways, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_gateways.html">Virtual
  /// gateways</a>.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to create the virtual gateway in.
  ///
  /// Parameter [spec] :
  /// The virtual gateway specification to apply.
  ///
  /// Parameter [virtualGatewayName] :
  /// The name to use for the virtual gateway.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then the account that you specify must share
  /// the mesh with your account before you can create the resource in the
  /// service mesh. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you can apply to the virtual gateway to assist with
  /// categorization and organization. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<CreateVirtualGatewayOutput> createVirtualGateway({
    required String meshName,
    required VirtualGatewaySpec spec,
    required String virtualGatewayName,
    String? clientToken,
    String? meshOwner,
    List<TagRef>? tags,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final $payload = <String, dynamic>{
      'spec': spec,
      'virtualGatewayName': virtualGatewayName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualGateways',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateVirtualGatewayOutput(
      virtualGateway: VirtualGatewayData.fromJson($json),
    );
  }

  /// Creates a virtual node within a service mesh.
  ///
  /// A virtual node acts as a logical pointer to a particular task group, such
  /// as an Amazon ECS service or a Kubernetes deployment. When you create a
  /// virtual node, you can specify the service discovery information for your
  /// task group, and whether the proxy running in a task group will communicate
  /// with other proxies using Transport Layer Security (TLS).
  ///
  /// You define a <code>listener</code> for any inbound traffic that your
  /// virtual node expects. Any virtual service that your virtual node expects
  /// to communicate to is specified as a <code>backend</code>.
  ///
  /// The response metadata for your new virtual node contains the
  /// <code>arn</code> that is associated with the virtual node. Set this value
  /// to the full ARN; for example,
  /// <code>arn:aws:appmesh:us-west-2:123456789012:myMesh/default/virtualNode/myApp</code>)
  /// as the <code>APPMESH_RESOURCE_ARN</code> environment variable for your
  /// task group's Envoy proxy container in your task definition or pod spec.
  /// This is then mapped to the <code>node.id</code> and
  /// <code>node.cluster</code> Envoy parameters.
  /// <note>
  /// By default, App Mesh uses the name of the resource you specified in
  /// <code>APPMESH_RESOURCE_ARN</code> when Envoy is referring to itself in
  /// metrics and traces. You can override this behavior by setting the
  /// <code>APPMESH_RESOURCE_CLUSTER</code> environment variable with your own
  /// name.
  /// </note>
  /// For more information about virtual nodes, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_nodes.html">Virtual
  /// nodes</a>. You must be using <code>1.15.0</code> or later of the Envoy
  /// image when setting these variables. For more information aboutApp Mesh
  /// Envoy variables, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/envoy.html">Envoy
  /// image</a> in the App Mesh User Guide.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to create the virtual node in.
  ///
  /// Parameter [spec] :
  /// The virtual node specification to apply.
  ///
  /// Parameter [virtualNodeName] :
  /// The name to use for the virtual node.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then the account that you specify must share
  /// the mesh with your account before you can create the resource in the
  /// service mesh. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you can apply to the virtual node to assist with
  /// categorization and organization. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<CreateVirtualNodeOutput> createVirtualNode({
    required String meshName,
    required VirtualNodeSpec spec,
    required String virtualNodeName,
    String? clientToken,
    String? meshOwner,
    List<TagRef>? tags,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final $payload = <String, dynamic>{
      'spec': spec,
      'virtualNodeName': virtualNodeName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualNodes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateVirtualNodeOutput(
      virtualNode: VirtualNodeData.fromJson($json),
    );
  }

  /// Creates a virtual router within a service mesh.
  ///
  /// Specify a <code>listener</code> for any inbound traffic that your virtual
  /// router receives. Create a virtual router for each protocol and port that
  /// you need to route. Virtual routers handle traffic for one or more virtual
  /// services within your mesh. After you create your virtual router, create
  /// and associate routes for your virtual router that direct incoming requests
  /// to different virtual nodes.
  ///
  /// For more information about virtual routers, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_routers.html">Virtual
  /// routers</a>.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to create the virtual router in.
  ///
  /// Parameter [spec] :
  /// The virtual router specification to apply.
  ///
  /// Parameter [virtualRouterName] :
  /// The name to use for the virtual router.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then the account that you specify must share
  /// the mesh with your account before you can create the resource in the
  /// service mesh. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you can apply to the virtual router to assist with
  /// categorization and organization. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<CreateVirtualRouterOutput> createVirtualRouter({
    required String meshName,
    required VirtualRouterSpec spec,
    required String virtualRouterName,
    String? clientToken,
    String? meshOwner,
    List<TagRef>? tags,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final $payload = <String, dynamic>{
      'spec': spec,
      'virtualRouterName': virtualRouterName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualRouters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateVirtualRouterOutput(
      virtualRouter: VirtualRouterData.fromJson($json),
    );
  }

  /// Creates a virtual service within a service mesh.
  ///
  /// A virtual service is an abstraction of a real service that is provided by
  /// a virtual node directly or indirectly by means of a virtual router.
  /// Dependent services call your virtual service by its
  /// <code>virtualServiceName</code>, and those requests are routed to the
  /// virtual node or virtual router that is specified as the provider for the
  /// virtual service.
  ///
  /// For more information about virtual services, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_services.html">Virtual
  /// services</a>.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to create the virtual service in.
  ///
  /// Parameter [spec] :
  /// The virtual service specification to apply.
  ///
  /// Parameter [virtualServiceName] :
  /// The name to use for the virtual service.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then the account that you specify must share
  /// the mesh with your account before you can create the resource in the
  /// service mesh. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  ///
  /// Parameter [tags] :
  /// Optional metadata that you can apply to the virtual service to assist with
  /// categorization and organization. Each tag consists of a key and an
  /// optional value, both of which you define. Tag keys can have a maximum
  /// character length of 128 characters, and tag values can have a maximum
  /// length of 256 characters.
  Future<CreateVirtualServiceOutput> createVirtualService({
    required String meshName,
    required VirtualServiceSpec spec,
    required String virtualServiceName,
    String? clientToken,
    String? meshOwner,
    List<TagRef>? tags,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final $payload = <String, dynamic>{
      'spec': spec,
      'virtualServiceName': virtualServiceName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualServices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateVirtualServiceOutput(
      virtualService: VirtualServiceData.fromJson($json),
    );
  }

  /// Deletes an existing gateway route.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceInUseException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [gatewayRouteName] :
  /// The name of the gateway route to delete.
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to delete the gateway route from.
  ///
  /// Parameter [virtualGatewayName] :
  /// The name of the virtual gateway to delete the route from.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DeleteGatewayRouteOutput> deleteGatewayRoute({
    required String gatewayRouteName,
    required String meshName,
    required String virtualGatewayName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualGateway/${Uri.encodeComponent(virtualGatewayName)}/gatewayRoutes/${Uri.encodeComponent(gatewayRouteName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteGatewayRouteOutput(
      gatewayRoute: GatewayRouteData.fromJson($json),
    );
  }

  /// Deletes an existing service mesh.
  ///
  /// You must delete all resources (virtual services, routes, virtual routers,
  /// and virtual nodes) in the service mesh before you can delete the mesh
  /// itself.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceInUseException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to delete.
  Future<DeleteMeshOutput> deleteMesh({
    required String meshName,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/v20190125/meshes/${Uri.encodeComponent(meshName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteMeshOutput(
      mesh: MeshData.fromJson($json),
    );
  }

  /// Deletes an existing route.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceInUseException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to delete the route in.
  ///
  /// Parameter [routeName] :
  /// The name of the route to delete.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router to delete the route in.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DeleteRouteOutput> deleteRoute({
    required String meshName,
    required String routeName,
    required String virtualRouterName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualRouter/${Uri.encodeComponent(virtualRouterName)}/routes/${Uri.encodeComponent(routeName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteRouteOutput(
      route: RouteData.fromJson($json),
    );
  }

  /// Deletes an existing virtual gateway. You cannot delete a virtual gateway
  /// if any gateway routes are associated to it.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceInUseException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to delete the virtual gateway from.
  ///
  /// Parameter [virtualGatewayName] :
  /// The name of the virtual gateway to delete.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DeleteVirtualGatewayOutput> deleteVirtualGateway({
    required String meshName,
    required String virtualGatewayName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualGateways/${Uri.encodeComponent(virtualGatewayName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteVirtualGatewayOutput(
      virtualGateway: VirtualGatewayData.fromJson($json),
    );
  }

  /// Deletes an existing virtual node.
  ///
  /// You must delete any virtual services that list a virtual node as a service
  /// provider before you can delete the virtual node itself.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceInUseException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to delete the virtual node in.
  ///
  /// Parameter [virtualNodeName] :
  /// The name of the virtual node to delete.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DeleteVirtualNodeOutput> deleteVirtualNode({
    required String meshName,
    required String virtualNodeName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualNodes/${Uri.encodeComponent(virtualNodeName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteVirtualNodeOutput(
      virtualNode: VirtualNodeData.fromJson($json),
    );
  }

  /// Deletes an existing virtual router.
  ///
  /// You must delete any routes associated with the virtual router before you
  /// can delete the router itself.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceInUseException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to delete the virtual router in.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router to delete.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DeleteVirtualRouterOutput> deleteVirtualRouter({
    required String meshName,
    required String virtualRouterName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualRouters/${Uri.encodeComponent(virtualRouterName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteVirtualRouterOutput(
      virtualRouter: VirtualRouterData.fromJson($json),
    );
  }

  /// Deletes an existing virtual service.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceInUseException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to delete the virtual service in.
  ///
  /// Parameter [virtualServiceName] :
  /// The name of the virtual service to delete.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DeleteVirtualServiceOutput> deleteVirtualService({
    required String meshName,
    required String virtualServiceName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualServices/${Uri.encodeComponent(virtualServiceName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteVirtualServiceOutput(
      virtualService: VirtualServiceData.fromJson($json),
    );
  }

  /// Describes an existing gateway route.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [gatewayRouteName] :
  /// The name of the gateway route to describe.
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh that the gateway route resides in.
  ///
  /// Parameter [virtualGatewayName] :
  /// The name of the virtual gateway that the gateway route is associated with.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeGatewayRouteOutput> describeGatewayRoute({
    required String gatewayRouteName,
    required String meshName,
    required String virtualGatewayName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualGateway/${Uri.encodeComponent(virtualGatewayName)}/gatewayRoutes/${Uri.encodeComponent(gatewayRouteName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeGatewayRouteOutput(
      gatewayRoute: GatewayRouteData.fromJson($json),
    );
  }

  /// Describes an existing service mesh.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to describe.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeMeshOutput> describeMesh({
    required String meshName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v20190125/meshes/${Uri.encodeComponent(meshName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeMeshOutput(
      mesh: MeshData.fromJson($json),
    );
  }

  /// Describes an existing route.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh that the route resides in.
  ///
  /// Parameter [routeName] :
  /// The name of the route to describe.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router that the route is associated with.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeRouteOutput> describeRoute({
    required String meshName,
    required String routeName,
    required String virtualRouterName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualRouter/${Uri.encodeComponent(virtualRouterName)}/routes/${Uri.encodeComponent(routeName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeRouteOutput(
      route: RouteData.fromJson($json),
    );
  }

  /// Describes an existing virtual gateway.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh that the gateway route resides in.
  ///
  /// Parameter [virtualGatewayName] :
  /// The name of the virtual gateway to describe.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeVirtualGatewayOutput> describeVirtualGateway({
    required String meshName,
    required String virtualGatewayName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualGateways/${Uri.encodeComponent(virtualGatewayName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeVirtualGatewayOutput(
      virtualGateway: VirtualGatewayData.fromJson($json),
    );
  }

  /// Describes an existing virtual node.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh that the virtual node resides in.
  ///
  /// Parameter [virtualNodeName] :
  /// The name of the virtual node to describe.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeVirtualNodeOutput> describeVirtualNode({
    required String meshName,
    required String virtualNodeName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualNodes/${Uri.encodeComponent(virtualNodeName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeVirtualNodeOutput(
      virtualNode: VirtualNodeData.fromJson($json),
    );
  }

  /// Describes an existing virtual router.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh that the virtual router resides in.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router to describe.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeVirtualRouterOutput> describeVirtualRouter({
    required String meshName,
    required String virtualRouterName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualRouters/${Uri.encodeComponent(virtualRouterName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeVirtualRouterOutput(
      virtualRouter: VirtualRouterData.fromJson($json),
    );
  }

  /// Describes an existing virtual service.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh that the virtual service resides in.
  ///
  /// Parameter [virtualServiceName] :
  /// The name of the virtual service to describe.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeVirtualServiceOutput> describeVirtualService({
    required String meshName,
    required String virtualServiceName,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualServices/${Uri.encodeComponent(virtualServiceName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeVirtualServiceOutput(
      virtualService: VirtualServiceData.fromJson($json),
    );
  }

  /// Returns a list of existing gateway routes that are associated to a virtual
  /// gateway.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to list gateway routes in.
  ///
  /// Parameter [virtualGatewayName] :
  /// The name of the virtual gateway to list gateway routes in.
  ///
  /// Parameter [limit] :
  /// The maximum number of results returned by <code>ListGatewayRoutes</code>
  /// in paginated output. When you use this parameter,
  /// <code>ListGatewayRoutes</code> returns only <code>limit</code> results in
  /// a single page along with a <code>nextToken</code> response element. You
  /// can see the remaining results of the initial request by sending another
  /// <code>ListGatewayRoutes</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, <code>ListGatewayRoutes</code> returns up to 100
  /// results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListGatewayRoutes</code> request where <code>limit</code> was used
  /// and the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  Future<ListGatewayRoutesOutput> listGatewayRoutes({
    required String meshName,
    required String virtualGatewayName,
    int? limit,
    String? meshOwner,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (meshOwner != null) 'meshOwner': [meshOwner],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualGateway/${Uri.encodeComponent(virtualGatewayName)}/gatewayRoutes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGatewayRoutesOutput.fromJson(response);
  }

  /// Returns a list of existing service meshes.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [limit] :
  /// The maximum number of results returned by <code>ListMeshes</code> in
  /// paginated output. When you use this parameter, <code>ListMeshes</code>
  /// returns only <code>limit</code> results in a single page along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another <code>ListMeshes</code> request
  /// with the returned <code>nextToken</code> value. This value can be between
  /// 1 and 100. If you don't use this parameter, <code>ListMeshes</code>
  /// returns up to 100 results and a <code>nextToken</code> value if
  /// applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListMeshes</code> request where <code>limit</code> was used and the
  /// results exceeded the value of that parameter. Pagination continues from
  /// the end of the previous results that returned the <code>nextToken</code>
  /// value.
  /// <note>
  /// This token should be treated as an opaque identifier that is used only to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListMeshesOutput> listMeshes({
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v20190125/meshes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMeshesOutput.fromJson(response);
  }

  /// Returns a list of existing routes in a service mesh.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to list routes in.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router to list routes in.
  ///
  /// Parameter [limit] :
  /// The maximum number of results returned by <code>ListRoutes</code> in
  /// paginated output. When you use this parameter, <code>ListRoutes</code>
  /// returns only <code>limit</code> results in a single page along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another <code>ListRoutes</code> request
  /// with the returned <code>nextToken</code> value. This value can be between
  /// 1 and 100. If you don't use this parameter, <code>ListRoutes</code>
  /// returns up to 100 results and a <code>nextToken</code> value if
  /// applicable.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListRoutes</code> request where <code>limit</code> was used and the
  /// results exceeded the value of that parameter. Pagination continues from
  /// the end of the previous results that returned the <code>nextToken</code>
  /// value.
  Future<ListRoutesOutput> listRoutes({
    required String meshName,
    required String virtualRouterName,
    int? limit,
    String? meshOwner,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (meshOwner != null) 'meshOwner': [meshOwner],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualRouter/${Uri.encodeComponent(virtualRouterName)}/routes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRoutesOutput.fromJson(response);
  }

  /// List the tags for an App Mesh resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource to list the
  /// tags for.
  ///
  /// Parameter [limit] :
  /// The maximum number of tag results returned by
  /// <code>ListTagsForResource</code> in paginated output. When this parameter
  /// is used, <code>ListTagsForResource</code> returns only <code>limit</code>
  /// results in a single page along with a <code>nextToken</code> response
  /// element. You can see the remaining results of the initial request by
  /// sending another <code>ListTagsForResource</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, <code>ListTagsForResource</code> returns up to
  /// 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListTagsForResource</code> request where <code>limit</code> was used
  /// and the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
    int? limit,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
      if (limit != null) 'limit': [limit.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v20190125/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Returns a list of existing virtual gateways in a service mesh.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to list virtual gateways in.
  ///
  /// Parameter [limit] :
  /// The maximum number of results returned by <code>ListVirtualGateways</code>
  /// in paginated output. When you use this parameter,
  /// <code>ListVirtualGateways</code> returns only <code>limit</code> results
  /// in a single page along with a <code>nextToken</code> response element. You
  /// can see the remaining results of the initial request by sending another
  /// <code>ListVirtualGateways</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, <code>ListVirtualGateways</code> returns up to
  /// 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListVirtualGateways</code> request where <code>limit</code> was used
  /// and the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  Future<ListVirtualGatewaysOutput> listVirtualGateways({
    required String meshName,
    int? limit,
    String? meshOwner,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (meshOwner != null) 'meshOwner': [meshOwner],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualGateways',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVirtualGatewaysOutput.fromJson(response);
  }

  /// Returns a list of existing virtual nodes.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to list virtual nodes in.
  ///
  /// Parameter [limit] :
  /// The maximum number of results returned by <code>ListVirtualNodes</code> in
  /// paginated output. When you use this parameter,
  /// <code>ListVirtualNodes</code> returns only <code>limit</code> results in a
  /// single page along with a <code>nextToken</code> response element. You can
  /// see the remaining results of the initial request by sending another
  /// <code>ListVirtualNodes</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, <code>ListVirtualNodes</code> returns up to 100
  /// results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListVirtualNodes</code> request where <code>limit</code> was used
  /// and the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  Future<ListVirtualNodesOutput> listVirtualNodes({
    required String meshName,
    int? limit,
    String? meshOwner,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (meshOwner != null) 'meshOwner': [meshOwner],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualNodes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVirtualNodesOutput.fromJson(response);
  }

  /// Returns a list of existing virtual routers in a service mesh.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to list virtual routers in.
  ///
  /// Parameter [limit] :
  /// The maximum number of results returned by <code>ListVirtualRouters</code>
  /// in paginated output. When you use this parameter,
  /// <code>ListVirtualRouters</code> returns only <code>limit</code> results in
  /// a single page along with a <code>nextToken</code> response element. You
  /// can see the remaining results of the initial request by sending another
  /// <code>ListVirtualRouters</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, <code>ListVirtualRouters</code> returns up to
  /// 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListVirtualRouters</code> request where <code>limit</code> was used
  /// and the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  Future<ListVirtualRoutersOutput> listVirtualRouters({
    required String meshName,
    int? limit,
    String? meshOwner,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (meshOwner != null) 'meshOwner': [meshOwner],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualRouters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVirtualRoutersOutput.fromJson(response);
  }

  /// Returns a list of existing virtual services in a service mesh.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to list virtual services in.
  ///
  /// Parameter [limit] :
  /// The maximum number of results returned by <code>ListVirtualServices</code>
  /// in paginated output. When you use this parameter,
  /// <code>ListVirtualServices</code> returns only <code>limit</code> results
  /// in a single page along with a <code>nextToken</code> response element. You
  /// can see the remaining results of the initial request by sending another
  /// <code>ListVirtualServices</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If you
  /// don't use this parameter, <code>ListVirtualServices</code> returns up to
  /// 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListVirtualServices</code> request where <code>limit</code> was used
  /// and the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  Future<ListVirtualServicesOutput> listVirtualServices({
    required String meshName,
    int? limit,
    String? meshOwner,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (meshOwner != null) 'meshOwner': [meshOwner],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualServices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVirtualServicesOutput.fromJson(response);
  }

  /// Associates the specified tags to a resource with the specified
  /// <code>resourceArn</code>. If existing tags on a resource aren't specified
  /// in the request parameters, they aren't changed. When a resource is
  /// deleted, the tags associated with that resource are also deleted.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyTagsException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to add tags to.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource. A tag is an array of key-value pairs. Tag
  /// keys can have a maximum character length of 128 characters, and tag values
  /// can have a maximum length of 256 characters.
  Future<void> tagResource({
    required String resourceArn,
    required List<TagRef> tags,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v20190125/tag',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes specified tags from a resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to delete tags from.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final $payload = <String, dynamic>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v20190125/untag',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an existing gateway route that is associated to a specified
  /// virtual gateway in a service mesh.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [gatewayRouteName] :
  /// The name of the gateway route to update.
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh that the gateway route resides in.
  ///
  /// Parameter [spec] :
  /// The new gateway route specification to apply. This overwrites the existing
  /// data.
  ///
  /// Parameter [virtualGatewayName] :
  /// The name of the virtual gateway that the gateway route is associated with.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<UpdateGatewayRouteOutput> updateGatewayRoute({
    required String gatewayRouteName,
    required String meshName,
    required GatewayRouteSpec spec,
    required String virtualGatewayName,
    String? clientToken,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final $payload = <String, dynamic>{
      'spec': spec,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualGateway/${Uri.encodeComponent(virtualGatewayName)}/gatewayRoutes/${Uri.encodeComponent(gatewayRouteName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateGatewayRouteOutput(
      gatewayRoute: GatewayRouteData.fromJson($json),
    );
  }

  /// Updates an existing service mesh.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to update.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [spec] :
  /// The service mesh specification to apply.
  Future<UpdateMeshOutput> updateMesh({
    required String meshName,
    String? clientToken,
    MeshSpec? spec,
  }) async {
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (spec != null) 'spec': spec,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v20190125/meshes/${Uri.encodeComponent(meshName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateMeshOutput(
      mesh: MeshData.fromJson($json),
    );
  }

  /// Updates an existing route for a specified service mesh and virtual router.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh that the route resides in.
  ///
  /// Parameter [routeName] :
  /// The name of the route to update.
  ///
  /// Parameter [spec] :
  /// The new route specification to apply. This overwrites the existing data.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router that the route is associated with.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<UpdateRouteOutput> updateRoute({
    required String meshName,
    required String routeName,
    required RouteSpec spec,
    required String virtualRouterName,
    String? clientToken,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final $payload = <String, dynamic>{
      'spec': spec,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualRouter/${Uri.encodeComponent(virtualRouterName)}/routes/${Uri.encodeComponent(routeName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateRouteOutput(
      route: RouteData.fromJson($json),
    );
  }

  /// Updates an existing virtual gateway in a specified service mesh.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh that the virtual gateway resides in.
  ///
  /// Parameter [spec] :
  /// The new virtual gateway specification to apply. This overwrites the
  /// existing data.
  ///
  /// Parameter [virtualGatewayName] :
  /// The name of the virtual gateway to update.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<UpdateVirtualGatewayOutput> updateVirtualGateway({
    required String meshName,
    required VirtualGatewaySpec spec,
    required String virtualGatewayName,
    String? clientToken,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final $payload = <String, dynamic>{
      'spec': spec,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualGateways/${Uri.encodeComponent(virtualGatewayName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateVirtualGatewayOutput(
      virtualGateway: VirtualGatewayData.fromJson($json),
    );
  }

  /// Updates an existing virtual node in a specified service mesh.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh that the virtual node resides in.
  ///
  /// Parameter [spec] :
  /// The new virtual node specification to apply. This overwrites the existing
  /// data.
  ///
  /// Parameter [virtualNodeName] :
  /// The name of the virtual node to update.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<UpdateVirtualNodeOutput> updateVirtualNode({
    required String meshName,
    required VirtualNodeSpec spec,
    required String virtualNodeName,
    String? clientToken,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final $payload = <String, dynamic>{
      'spec': spec,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualNodes/${Uri.encodeComponent(virtualNodeName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateVirtualNodeOutput(
      virtualNode: VirtualNodeData.fromJson($json),
    );
  }

  /// Updates an existing virtual router in a specified service mesh.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh that the virtual router resides in.
  ///
  /// Parameter [spec] :
  /// The new virtual router specification to apply. This overwrites the
  /// existing data.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router to update.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<UpdateVirtualRouterOutput> updateVirtualRouter({
    required String meshName,
    required VirtualRouterSpec spec,
    required String virtualRouterName,
    String? clientToken,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final $payload = <String, dynamic>{
      'spec': spec,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualRouters/${Uri.encodeComponent(virtualRouterName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateVirtualRouterOutput(
      virtualRouter: VirtualRouterData.fromJson($json),
    );
  }

  /// Updates an existing virtual service in a specified service mesh.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh that the virtual service resides in.
  ///
  /// Parameter [spec] :
  /// The new virtual service specification to apply. This overwrites the
  /// existing data.
  ///
  /// Parameter [virtualServiceName] :
  /// The name of the virtual service to update.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Up to 36 letters, numbers, hyphens, and
  /// underscores are allowed.
  ///
  /// Parameter [meshOwner] :
  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared
  /// the mesh with your account. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<UpdateVirtualServiceOutput> updateVirtualService({
    required String meshName,
    required VirtualServiceSpec spec,
    required String virtualServiceName,
    String? clientToken,
    String? meshOwner,
  }) async {
    final $query = <String, List<String>>{
      if (meshOwner != null) 'meshOwner': [meshOwner],
    };
    final $payload = <String, dynamic>{
      'spec': spec,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v20190125/meshes/${Uri.encodeComponent(meshName)}/virtualServices/${Uri.encodeComponent(virtualServiceName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateVirtualServiceOutput(
      virtualService: VirtualServiceData.fromJson($json),
    );
  }
}

/// An object that represents the access logging information for a virtual node.
class AccessLog {
  /// The file object to send virtual node access logs to.
  final FileAccessLog? file;

  AccessLog({
    this.file,
  });

  factory AccessLog.fromJson(Map<String, dynamic> json) {
    return AccessLog(
      file: json['file'] != null
          ? FileAccessLog.fromJson(json['file'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final file = this.file;
    return {
      if (file != null) 'file': file,
    };
  }
}

/// An object that represents the Cloud Map attribute information for your
/// virtual node.
/// <note>
/// Cloud Map is not available in the eu-south-1 Region.
/// </note>
class AwsCloudMapInstanceAttribute {
  /// The name of an Cloud Map service instance attribute key. Any Cloud Map
  /// service instance that contains the specified key and value is returned.
  final String key;

  /// The value of an Cloud Map service instance attribute key. Any Cloud Map
  /// service instance that contains the specified key and value is returned.
  final String value;

  AwsCloudMapInstanceAttribute({
    required this.key,
    required this.value,
  });

  factory AwsCloudMapInstanceAttribute.fromJson(Map<String, dynamic> json) {
    return AwsCloudMapInstanceAttribute(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// An object that represents the Cloud Map service discovery information for
/// your virtual node.
/// <note>
/// Cloud Map is not available in the eu-south-1 Region.
/// </note>
class AwsCloudMapServiceDiscovery {
  /// The name of the Cloud Map namespace to use.
  final String namespaceName;

  /// The name of the Cloud Map service to use.
  final String serviceName;

  /// A string map that contains attributes with values that you can use to filter
  /// instances by any custom attribute that you specified when you registered the
  /// instance. Only instances that match all of the specified key/value pairs
  /// will be returned.
  final List<AwsCloudMapInstanceAttribute>? attributes;

  /// The preferred IP version that this virtual node uses. Setting the IP
  /// preference on the virtual node only overrides the IP preference set for the
  /// mesh on this specific node.
  final IpPreference? ipPreference;

  AwsCloudMapServiceDiscovery({
    required this.namespaceName,
    required this.serviceName,
    this.attributes,
    this.ipPreference,
  });

  factory AwsCloudMapServiceDiscovery.fromJson(Map<String, dynamic> json) {
    return AwsCloudMapServiceDiscovery(
      namespaceName: json['namespaceName'] as String,
      serviceName: json['serviceName'] as String,
      attributes: (json['attributes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AwsCloudMapInstanceAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      ipPreference: (json['ipPreference'] as String?)?.toIpPreference(),
    );
  }

  Map<String, dynamic> toJson() {
    final namespaceName = this.namespaceName;
    final serviceName = this.serviceName;
    final attributes = this.attributes;
    final ipPreference = this.ipPreference;
    return {
      'namespaceName': namespaceName,
      'serviceName': serviceName,
      if (attributes != null) 'attributes': attributes,
      if (ipPreference != null) 'ipPreference': ipPreference.toValue(),
    };
  }
}

/// An object that represents the backends that a virtual node is expected to
/// send outbound traffic to.
class Backend {
  /// Specifies a virtual service to use as a backend.
  final VirtualServiceBackend? virtualService;

  Backend({
    this.virtualService,
  });

  factory Backend.fromJson(Map<String, dynamic> json) {
    return Backend(
      virtualService: json['virtualService'] != null
          ? VirtualServiceBackend.fromJson(
              json['virtualService'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualService = this.virtualService;
    return {
      if (virtualService != null) 'virtualService': virtualService,
    };
  }
}

/// An object that represents the default properties for a backend.
class BackendDefaults {
  /// A reference to an object that represents a client policy.
  final ClientPolicy? clientPolicy;

  BackendDefaults({
    this.clientPolicy,
  });

  factory BackendDefaults.fromJson(Map<String, dynamic> json) {
    return BackendDefaults(
      clientPolicy: json['clientPolicy'] != null
          ? ClientPolicy.fromJson(json['clientPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientPolicy = this.clientPolicy;
    return {
      if (clientPolicy != null) 'clientPolicy': clientPolicy,
    };
  }
}

/// An object that represents a client policy.
class ClientPolicy {
  /// A reference to an object that represents a Transport Layer Security (TLS)
  /// client policy.
  final ClientPolicyTls? tls;

  ClientPolicy({
    this.tls,
  });

  factory ClientPolicy.fromJson(Map<String, dynamic> json) {
    return ClientPolicy(
      tls: json['tls'] != null
          ? ClientPolicyTls.fromJson(json['tls'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tls = this.tls;
    return {
      if (tls != null) 'tls': tls,
    };
  }
}

/// A reference to an object that represents a Transport Layer Security (TLS)
/// client policy.
class ClientPolicyTls {
  /// A reference to an object that represents a TLS validation context.
  final TlsValidationContext validation;

  /// A reference to an object that represents a client's TLS certificate.
  final ClientTlsCertificate? certificate;

  /// Whether the policy is enforced. The default is <code>True</code>, if a value
  /// isn't specified.
  final bool? enforce;

  /// One or more ports that the policy is enforced for.
  final List<int>? ports;

  ClientPolicyTls({
    required this.validation,
    this.certificate,
    this.enforce,
    this.ports,
  });

  factory ClientPolicyTls.fromJson(Map<String, dynamic> json) {
    return ClientPolicyTls(
      validation: TlsValidationContext.fromJson(
          json['validation'] as Map<String, dynamic>),
      certificate: json['certificate'] != null
          ? ClientTlsCertificate.fromJson(
              json['certificate'] as Map<String, dynamic>)
          : null,
      enforce: json['enforce'] as bool?,
      ports: (json['ports'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final validation = this.validation;
    final certificate = this.certificate;
    final enforce = this.enforce;
    final ports = this.ports;
    return {
      'validation': validation,
      if (certificate != null) 'certificate': certificate,
      if (enforce != null) 'enforce': enforce,
      if (ports != null) 'ports': ports,
    };
  }
}

/// An object that represents the client's certificate.
class ClientTlsCertificate {
  /// An object that represents a local file certificate. The certificate must
  /// meet specific requirements and you must have proxy authorization enabled.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html">Transport
  /// Layer Security (TLS)</a>.
  final ListenerTlsFileCertificate? file;

  /// A reference to an object that represents a client's TLS Secret Discovery
  /// Service certificate.
  final ListenerTlsSdsCertificate? sds;

  ClientTlsCertificate({
    this.file,
    this.sds,
  });

  factory ClientTlsCertificate.fromJson(Map<String, dynamic> json) {
    return ClientTlsCertificate(
      file: json['file'] != null
          ? ListenerTlsFileCertificate.fromJson(
              json['file'] as Map<String, dynamic>)
          : null,
      sds: json['sds'] != null
          ? ListenerTlsSdsCertificate.fromJson(
              json['sds'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final file = this.file;
    final sds = this.sds;
    return {
      if (file != null) 'file': file,
      if (sds != null) 'sds': sds,
    };
  }
}

class CreateGatewayRouteOutput {
  /// The full description of your gateway route following the create call.
  final GatewayRouteData gatewayRoute;

  CreateGatewayRouteOutput({
    required this.gatewayRoute,
  });

  Map<String, dynamic> toJson() {
    final gatewayRoute = this.gatewayRoute;
    return {
      'gatewayRoute': gatewayRoute,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class CreateMeshOutput {
  /// The full description of your service mesh following the create call.
  final MeshData mesh;

  CreateMeshOutput({
    required this.mesh,
  });

  Map<String, dynamic> toJson() {
    final mesh = this.mesh;
    return {
      'mesh': mesh,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class CreateRouteOutput {
  /// The full description of your mesh following the create call.
  final RouteData route;

  CreateRouteOutput({
    required this.route,
  });

  Map<String, dynamic> toJson() {
    final route = this.route;
    return {
      'route': route,
    };
  }
}

class CreateVirtualGatewayOutput {
  /// The full description of your virtual gateway following the create call.
  final VirtualGatewayData virtualGateway;

  CreateVirtualGatewayOutput({
    required this.virtualGateway,
  });

  Map<String, dynamic> toJson() {
    final virtualGateway = this.virtualGateway;
    return {
      'virtualGateway': virtualGateway,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class CreateVirtualNodeOutput {
  /// The full description of your virtual node following the create call.
  final VirtualNodeData virtualNode;

  CreateVirtualNodeOutput({
    required this.virtualNode,
  });

  Map<String, dynamic> toJson() {
    final virtualNode = this.virtualNode;
    return {
      'virtualNode': virtualNode,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class CreateVirtualRouterOutput {
  /// The full description of your virtual router following the create call.
  final VirtualRouterData virtualRouter;

  CreateVirtualRouterOutput({
    required this.virtualRouter,
  });

  Map<String, dynamic> toJson() {
    final virtualRouter = this.virtualRouter;
    return {
      'virtualRouter': virtualRouter,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class CreateVirtualServiceOutput {
  /// The full description of your virtual service following the create call.
  final VirtualServiceData virtualService;

  CreateVirtualServiceOutput({
    required this.virtualService,
  });

  Map<String, dynamic> toJson() {
    final virtualService = this.virtualService;
    return {
      'virtualService': virtualService,
    };
  }
}

enum DefaultGatewayRouteRewrite {
  enabled,
  disabled,
}

extension DefaultGatewayRouteRewriteValueExtension
    on DefaultGatewayRouteRewrite {
  String toValue() {
    switch (this) {
      case DefaultGatewayRouteRewrite.enabled:
        return 'ENABLED';
      case DefaultGatewayRouteRewrite.disabled:
        return 'DISABLED';
    }
  }
}

extension DefaultGatewayRouteRewriteFromString on String {
  DefaultGatewayRouteRewrite toDefaultGatewayRouteRewrite() {
    switch (this) {
      case 'ENABLED':
        return DefaultGatewayRouteRewrite.enabled;
      case 'DISABLED':
        return DefaultGatewayRouteRewrite.disabled;
    }
    throw Exception('$this is not known in enum DefaultGatewayRouteRewrite');
  }
}

class DeleteGatewayRouteOutput {
  /// The gateway route that was deleted.
  final GatewayRouteData gatewayRoute;

  DeleteGatewayRouteOutput({
    required this.gatewayRoute,
  });

  Map<String, dynamic> toJson() {
    final gatewayRoute = this.gatewayRoute;
    return {
      'gatewayRoute': gatewayRoute,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class DeleteMeshOutput {
  /// The service mesh that was deleted.
  final MeshData mesh;

  DeleteMeshOutput({
    required this.mesh,
  });

  Map<String, dynamic> toJson() {
    final mesh = this.mesh;
    return {
      'mesh': mesh,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class DeleteRouteOutput {
  /// The route that was deleted.
  final RouteData route;

  DeleteRouteOutput({
    required this.route,
  });

  Map<String, dynamic> toJson() {
    final route = this.route;
    return {
      'route': route,
    };
  }
}

class DeleteVirtualGatewayOutput {
  /// The virtual gateway that was deleted.
  final VirtualGatewayData virtualGateway;

  DeleteVirtualGatewayOutput({
    required this.virtualGateway,
  });

  Map<String, dynamic> toJson() {
    final virtualGateway = this.virtualGateway;
    return {
      'virtualGateway': virtualGateway,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class DeleteVirtualNodeOutput {
  /// The virtual node that was deleted.
  final VirtualNodeData virtualNode;

  DeleteVirtualNodeOutput({
    required this.virtualNode,
  });

  Map<String, dynamic> toJson() {
    final virtualNode = this.virtualNode;
    return {
      'virtualNode': virtualNode,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class DeleteVirtualRouterOutput {
  /// The virtual router that was deleted.
  final VirtualRouterData virtualRouter;

  DeleteVirtualRouterOutput({
    required this.virtualRouter,
  });

  Map<String, dynamic> toJson() {
    final virtualRouter = this.virtualRouter;
    return {
      'virtualRouter': virtualRouter,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class DeleteVirtualServiceOutput {
  /// The virtual service that was deleted.
  final VirtualServiceData virtualService;

  DeleteVirtualServiceOutput({
    required this.virtualService,
  });

  Map<String, dynamic> toJson() {
    final virtualService = this.virtualService;
    return {
      'virtualService': virtualService,
    };
  }
}

class DescribeGatewayRouteOutput {
  /// The full description of your gateway route.
  final GatewayRouteData gatewayRoute;

  DescribeGatewayRouteOutput({
    required this.gatewayRoute,
  });

  Map<String, dynamic> toJson() {
    final gatewayRoute = this.gatewayRoute;
    return {
      'gatewayRoute': gatewayRoute,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class DescribeMeshOutput {
  /// The full description of your service mesh.
  final MeshData mesh;

  DescribeMeshOutput({
    required this.mesh,
  });

  Map<String, dynamic> toJson() {
    final mesh = this.mesh;
    return {
      'mesh': mesh,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class DescribeRouteOutput {
  /// The full description of your route.
  final RouteData route;

  DescribeRouteOutput({
    required this.route,
  });

  Map<String, dynamic> toJson() {
    final route = this.route;
    return {
      'route': route,
    };
  }
}

class DescribeVirtualGatewayOutput {
  /// The full description of your virtual gateway.
  final VirtualGatewayData virtualGateway;

  DescribeVirtualGatewayOutput({
    required this.virtualGateway,
  });

  Map<String, dynamic> toJson() {
    final virtualGateway = this.virtualGateway;
    return {
      'virtualGateway': virtualGateway,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class DescribeVirtualNodeOutput {
  /// The full description of your virtual node.
  final VirtualNodeData virtualNode;

  DescribeVirtualNodeOutput({
    required this.virtualNode,
  });

  Map<String, dynamic> toJson() {
    final virtualNode = this.virtualNode;
    return {
      'virtualNode': virtualNode,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class DescribeVirtualRouterOutput {
  /// The full description of your virtual router.
  final VirtualRouterData virtualRouter;

  DescribeVirtualRouterOutput({
    required this.virtualRouter,
  });

  Map<String, dynamic> toJson() {
    final virtualRouter = this.virtualRouter;
    return {
      'virtualRouter': virtualRouter,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class DescribeVirtualServiceOutput {
  /// The full description of your virtual service.
  final VirtualServiceData virtualService;

  DescribeVirtualServiceOutput({
    required this.virtualService,
  });

  Map<String, dynamic> toJson() {
    final virtualService = this.virtualService;
    return {
      'virtualService': virtualService,
    };
  }
}

enum DnsResponseType {
  loadbalancer,
  endpoints,
}

extension DnsResponseTypeValueExtension on DnsResponseType {
  String toValue() {
    switch (this) {
      case DnsResponseType.loadbalancer:
        return 'LOADBALANCER';
      case DnsResponseType.endpoints:
        return 'ENDPOINTS';
    }
  }
}

extension DnsResponseTypeFromString on String {
  DnsResponseType toDnsResponseType() {
    switch (this) {
      case 'LOADBALANCER':
        return DnsResponseType.loadbalancer;
      case 'ENDPOINTS':
        return DnsResponseType.endpoints;
    }
    throw Exception('$this is not known in enum DnsResponseType');
  }
}

/// An object that represents the DNS service discovery information for your
/// virtual node.
class DnsServiceDiscovery {
  /// Specifies the DNS service discovery hostname for the virtual node.
  final String hostname;

  /// The preferred IP version that this virtual node uses. Setting the IP
  /// preference on the virtual node only overrides the IP preference set for the
  /// mesh on this specific node.
  final IpPreference? ipPreference;

  /// Specifies the DNS response type for the virtual node.
  final DnsResponseType? responseType;

  DnsServiceDiscovery({
    required this.hostname,
    this.ipPreference,
    this.responseType,
  });

  factory DnsServiceDiscovery.fromJson(Map<String, dynamic> json) {
    return DnsServiceDiscovery(
      hostname: json['hostname'] as String,
      ipPreference: (json['ipPreference'] as String?)?.toIpPreference(),
      responseType: (json['responseType'] as String?)?.toDnsResponseType(),
    );
  }

  Map<String, dynamic> toJson() {
    final hostname = this.hostname;
    final ipPreference = this.ipPreference;
    final responseType = this.responseType;
    return {
      'hostname': hostname,
      if (ipPreference != null) 'ipPreference': ipPreference.toValue(),
      if (responseType != null) 'responseType': responseType.toValue(),
    };
  }
}

/// An object that represents a duration of time.
class Duration {
  /// A unit of time.
  final DurationUnit? unit;

  /// A number of time units.
  final int? value;

  Duration({
    this.unit,
    this.value,
  });

  factory Duration.fromJson(Map<String, dynamic> json) {
    return Duration(
      unit: (json['unit'] as String?)?.toDurationUnit(),
      value: json['value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      if (unit != null) 'unit': unit.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum DurationUnit {
  s,
  ms,
}

extension DurationUnitValueExtension on DurationUnit {
  String toValue() {
    switch (this) {
      case DurationUnit.s:
        return 's';
      case DurationUnit.ms:
        return 'ms';
    }
  }
}

extension DurationUnitFromString on String {
  DurationUnit toDurationUnit() {
    switch (this) {
      case 's':
        return DurationUnit.s;
      case 'ms':
        return DurationUnit.ms;
    }
    throw Exception('$this is not known in enum DurationUnit');
  }
}

/// An object that represents the egress filter rules for a service mesh.
class EgressFilter {
  /// The egress filter type. By default, the type is <code>DROP_ALL</code>, which
  /// allows egress only from virtual nodes to other defined resources in the
  /// service mesh (and any traffic to <code>*.amazonaws.com</code> for Amazon Web
  /// Services API calls). You can set the egress filter type to
  /// <code>ALLOW_ALL</code> to allow egress to any endpoint inside or outside of
  /// the service mesh.
  final EgressFilterType type;

  EgressFilter({
    required this.type,
  });

  factory EgressFilter.fromJson(Map<String, dynamic> json) {
    return EgressFilter(
      type: (json['type'] as String).toEgressFilterType(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.toValue(),
    };
  }
}

enum EgressFilterType {
  allowAll,
  dropAll,
}

extension EgressFilterTypeValueExtension on EgressFilterType {
  String toValue() {
    switch (this) {
      case EgressFilterType.allowAll:
        return 'ALLOW_ALL';
      case EgressFilterType.dropAll:
        return 'DROP_ALL';
    }
  }
}

extension EgressFilterTypeFromString on String {
  EgressFilterType toEgressFilterType() {
    switch (this) {
      case 'ALLOW_ALL':
        return EgressFilterType.allowAll;
      case 'DROP_ALL':
        return EgressFilterType.dropAll;
    }
    throw Exception('$this is not known in enum EgressFilterType');
  }
}

/// An object that represents an access log file.
class FileAccessLog {
  /// The file path to write access logs to. You can use <code>/dev/stdout</code>
  /// to send access logs to standard out and configure your Envoy container to
  /// use a log driver, such as <code>awslogs</code>, to export the access logs to
  /// a log storage service such as Amazon CloudWatch Logs. You can also specify a
  /// path in the Envoy container's file system to write the files to disk.
  /// <note>
  /// The Envoy process must have write permissions to the path that you specify
  /// here. Otherwise, Envoy fails to bootstrap properly.
  /// </note>
  final String path;

  /// The specified format for the logs. The format is either
  /// <code>json_format</code> or <code>text_format</code>.
  final LoggingFormat? format;

  FileAccessLog({
    required this.path,
    this.format,
  });

  factory FileAccessLog.fromJson(Map<String, dynamic> json) {
    return FileAccessLog(
      path: json['path'] as String,
      format: json['format'] != null
          ? LoggingFormat.fromJson(json['format'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final format = this.format;
    return {
      'path': path,
      if (format != null) 'format': format,
    };
  }
}

/// An object that represents a gateway route returned by a describe operation.
class GatewayRouteData {
  /// The name of the gateway route.
  final String gatewayRouteName;

  /// The name of the service mesh that the resource resides in.
  final String meshName;
  final ResourceMetadata metadata;

  /// The specifications of the gateway route.
  final GatewayRouteSpec spec;

  /// The status of the gateway route.
  final GatewayRouteStatus status;

  /// The virtual gateway that the gateway route is associated with.
  final String virtualGatewayName;

  GatewayRouteData({
    required this.gatewayRouteName,
    required this.meshName,
    required this.metadata,
    required this.spec,
    required this.status,
    required this.virtualGatewayName,
  });

  factory GatewayRouteData.fromJson(Map<String, dynamic> json) {
    return GatewayRouteData(
      gatewayRouteName: json['gatewayRouteName'] as String,
      meshName: json['meshName'] as String,
      metadata:
          ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      spec: GatewayRouteSpec.fromJson(json['spec'] as Map<String, dynamic>),
      status:
          GatewayRouteStatus.fromJson(json['status'] as Map<String, dynamic>),
      virtualGatewayName: json['virtualGatewayName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayRouteName = this.gatewayRouteName;
    final meshName = this.meshName;
    final metadata = this.metadata;
    final spec = this.spec;
    final status = this.status;
    final virtualGatewayName = this.virtualGatewayName;
    return {
      'gatewayRouteName': gatewayRouteName,
      'meshName': meshName,
      'metadata': metadata,
      'spec': spec,
      'status': status,
      'virtualGatewayName': virtualGatewayName,
    };
  }
}

/// An object representing the gateway route host name to match.
class GatewayRouteHostnameMatch {
  /// The exact host name to match on.
  final String? exact;

  /// The specified ending characters of the host name to match on.
  final String? suffix;

  GatewayRouteHostnameMatch({
    this.exact,
    this.suffix,
  });

  factory GatewayRouteHostnameMatch.fromJson(Map<String, dynamic> json) {
    return GatewayRouteHostnameMatch(
      exact: json['exact'] as String?,
      suffix: json['suffix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exact = this.exact;
    final suffix = this.suffix;
    return {
      if (exact != null) 'exact': exact,
      if (suffix != null) 'suffix': suffix,
    };
  }
}

/// An object representing the gateway route host name to rewrite.
class GatewayRouteHostnameRewrite {
  /// The default target host name to write to.
  final DefaultGatewayRouteRewrite? defaultTargetHostname;

  GatewayRouteHostnameRewrite({
    this.defaultTargetHostname,
  });

  factory GatewayRouteHostnameRewrite.fromJson(Map<String, dynamic> json) {
    return GatewayRouteHostnameRewrite(
      defaultTargetHostname: (json['defaultTargetHostname'] as String?)
          ?.toDefaultGatewayRouteRewrite(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultTargetHostname = this.defaultTargetHostname;
    return {
      if (defaultTargetHostname != null)
        'defaultTargetHostname': defaultTargetHostname.toValue(),
    };
  }
}

/// An object that represents a gateway route returned by a list operation.
class GatewayRouteRef {
  /// The full Amazon Resource Name (ARN) for the gateway route.
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  final DateTime createdAt;

  /// The name of the gateway route.
  final String gatewayRouteName;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  final DateTime lastUpdatedAt;

  /// The name of the service mesh that the resource resides in.
  final String meshName;

  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared the
  /// mesh with your account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String meshOwner;

  /// The Amazon Web Services IAM account ID of the resource owner. If the account
  /// ID is not your own, then it's the ID of the mesh owner or of another account
  /// that the mesh is shared with. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String resourceOwner;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  final int version;

  /// The virtual gateway that the gateway route is associated with.
  final String virtualGatewayName;

  GatewayRouteRef({
    required this.arn,
    required this.createdAt,
    required this.gatewayRouteName,
    required this.lastUpdatedAt,
    required this.meshName,
    required this.meshOwner,
    required this.resourceOwner,
    required this.version,
    required this.virtualGatewayName,
  });

  factory GatewayRouteRef.fromJson(Map<String, dynamic> json) {
    return GatewayRouteRef(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      gatewayRouteName: json['gatewayRouteName'] as String,
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['lastUpdatedAt'] as Object),
      meshName: json['meshName'] as String,
      meshOwner: json['meshOwner'] as String,
      resourceOwner: json['resourceOwner'] as String,
      version: json['version'] as int,
      virtualGatewayName: json['virtualGatewayName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final gatewayRouteName = this.gatewayRouteName;
    final lastUpdatedAt = this.lastUpdatedAt;
    final meshName = this.meshName;
    final meshOwner = this.meshOwner;
    final resourceOwner = this.resourceOwner;
    final version = this.version;
    final virtualGatewayName = this.virtualGatewayName;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'gatewayRouteName': gatewayRouteName,
      'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'meshName': meshName,
      'meshOwner': meshOwner,
      'resourceOwner': resourceOwner,
      'version': version,
      'virtualGatewayName': virtualGatewayName,
    };
  }
}

/// An object that represents a gateway route specification. Specify one gateway
/// route type.
class GatewayRouteSpec {
  /// An object that represents the specification of a gRPC gateway route.
  final GrpcGatewayRoute? grpcRoute;

  /// An object that represents the specification of an HTTP/2 gateway route.
  final HttpGatewayRoute? http2Route;

  /// An object that represents the specification of an HTTP gateway route.
  final HttpGatewayRoute? httpRoute;

  /// The ordering of the gateway routes spec.
  final int? priority;

  GatewayRouteSpec({
    this.grpcRoute,
    this.http2Route,
    this.httpRoute,
    this.priority,
  });

  factory GatewayRouteSpec.fromJson(Map<String, dynamic> json) {
    return GatewayRouteSpec(
      grpcRoute: json['grpcRoute'] != null
          ? GrpcGatewayRoute.fromJson(json['grpcRoute'] as Map<String, dynamic>)
          : null,
      http2Route: json['http2Route'] != null
          ? HttpGatewayRoute.fromJson(
              json['http2Route'] as Map<String, dynamic>)
          : null,
      httpRoute: json['httpRoute'] != null
          ? HttpGatewayRoute.fromJson(json['httpRoute'] as Map<String, dynamic>)
          : null,
      priority: json['priority'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final grpcRoute = this.grpcRoute;
    final http2Route = this.http2Route;
    final httpRoute = this.httpRoute;
    final priority = this.priority;
    return {
      if (grpcRoute != null) 'grpcRoute': grpcRoute,
      if (http2Route != null) 'http2Route': http2Route,
      if (httpRoute != null) 'httpRoute': httpRoute,
      if (priority != null) 'priority': priority,
    };
  }
}

/// An object that represents the current status of a gateway route.
class GatewayRouteStatus {
  /// The current status for the gateway route.
  final GatewayRouteStatusCode status;

  GatewayRouteStatus({
    required this.status,
  });

  factory GatewayRouteStatus.fromJson(Map<String, dynamic> json) {
    return GatewayRouteStatus(
      status: (json['status'] as String).toGatewayRouteStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

enum GatewayRouteStatusCode {
  active,
  inactive,
  deleted,
}

extension GatewayRouteStatusCodeValueExtension on GatewayRouteStatusCode {
  String toValue() {
    switch (this) {
      case GatewayRouteStatusCode.active:
        return 'ACTIVE';
      case GatewayRouteStatusCode.inactive:
        return 'INACTIVE';
      case GatewayRouteStatusCode.deleted:
        return 'DELETED';
    }
  }
}

extension GatewayRouteStatusCodeFromString on String {
  GatewayRouteStatusCode toGatewayRouteStatusCode() {
    switch (this) {
      case 'ACTIVE':
        return GatewayRouteStatusCode.active;
      case 'INACTIVE':
        return GatewayRouteStatusCode.inactive;
      case 'DELETED':
        return GatewayRouteStatusCode.deleted;
    }
    throw Exception('$this is not known in enum GatewayRouteStatusCode');
  }
}

/// An object that represents a gateway route target.
class GatewayRouteTarget {
  /// An object that represents a virtual service gateway route target.
  final GatewayRouteVirtualService virtualService;

  /// The port number of the gateway route target.
  final int? port;

  GatewayRouteTarget({
    required this.virtualService,
    this.port,
  });

  factory GatewayRouteTarget.fromJson(Map<String, dynamic> json) {
    return GatewayRouteTarget(
      virtualService: GatewayRouteVirtualService.fromJson(
          json['virtualService'] as Map<String, dynamic>),
      port: json['port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualService = this.virtualService;
    final port = this.port;
    return {
      'virtualService': virtualService,
      if (port != null) 'port': port,
    };
  }
}

/// An object that represents the virtual service that traffic is routed to.
class GatewayRouteVirtualService {
  /// The name of the virtual service that traffic is routed to.
  final String virtualServiceName;

  GatewayRouteVirtualService({
    required this.virtualServiceName,
  });

  factory GatewayRouteVirtualService.fromJson(Map<String, dynamic> json) {
    return GatewayRouteVirtualService(
      virtualServiceName: json['virtualServiceName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualServiceName = this.virtualServiceName;
    return {
      'virtualServiceName': virtualServiceName,
    };
  }
}

/// An object that represents a gRPC gateway route.
class GrpcGatewayRoute {
  /// An object that represents the action to take if a match is determined.
  final GrpcGatewayRouteAction action;

  /// An object that represents the criteria for determining a request match.
  final GrpcGatewayRouteMatch match;

  GrpcGatewayRoute({
    required this.action,
    required this.match,
  });

  factory GrpcGatewayRoute.fromJson(Map<String, dynamic> json) {
    return GrpcGatewayRoute(
      action: GrpcGatewayRouteAction.fromJson(
          json['action'] as Map<String, dynamic>),
      match:
          GrpcGatewayRouteMatch.fromJson(json['match'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    return {
      'action': action,
      'match': match,
    };
  }
}

/// An object that represents the action to take if a match is determined.
class GrpcGatewayRouteAction {
  /// An object that represents the target that traffic is routed to when a
  /// request matches the gateway route.
  final GatewayRouteTarget target;

  /// The gateway route action to rewrite.
  final GrpcGatewayRouteRewrite? rewrite;

  GrpcGatewayRouteAction({
    required this.target,
    this.rewrite,
  });

  factory GrpcGatewayRouteAction.fromJson(Map<String, dynamic> json) {
    return GrpcGatewayRouteAction(
      target:
          GatewayRouteTarget.fromJson(json['target'] as Map<String, dynamic>),
      rewrite: json['rewrite'] != null
          ? GrpcGatewayRouteRewrite.fromJson(
              json['rewrite'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final target = this.target;
    final rewrite = this.rewrite;
    return {
      'target': target,
      if (rewrite != null) 'rewrite': rewrite,
    };
  }
}

/// An object that represents the criteria for determining a request match.
class GrpcGatewayRouteMatch {
  /// The gateway route host name to be matched on.
  final GatewayRouteHostnameMatch? hostname;

  /// The gateway route metadata to be matched on.
  final List<GrpcGatewayRouteMetadata>? metadata;

  /// The gateway route port to be matched on.
  final int? port;

  /// The fully qualified domain name for the service to match from the request.
  final String? serviceName;

  GrpcGatewayRouteMatch({
    this.hostname,
    this.metadata,
    this.port,
    this.serviceName,
  });

  factory GrpcGatewayRouteMatch.fromJson(Map<String, dynamic> json) {
    return GrpcGatewayRouteMatch(
      hostname: json['hostname'] != null
          ? GatewayRouteHostnameMatch.fromJson(
              json['hostname'] as Map<String, dynamic>)
          : null,
      metadata: (json['metadata'] as List?)
          ?.whereNotNull()
          .map((e) =>
              GrpcGatewayRouteMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      port: json['port'] as int?,
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostname = this.hostname;
    final metadata = this.metadata;
    final port = this.port;
    final serviceName = this.serviceName;
    return {
      if (hostname != null) 'hostname': hostname,
      if (metadata != null) 'metadata': metadata,
      if (port != null) 'port': port,
      if (serviceName != null) 'serviceName': serviceName,
    };
  }
}

/// An object representing the metadata of the gateway route.
class GrpcGatewayRouteMetadata {
  /// A name for the gateway route metadata.
  final String name;

  /// Specify <code>True</code> to match anything except the match criteria. The
  /// default value is <code>False</code>.
  final bool? invert;

  /// The criteria for determining a metadata match.
  final GrpcMetadataMatchMethod? match;

  GrpcGatewayRouteMetadata({
    required this.name,
    this.invert,
    this.match,
  });

  factory GrpcGatewayRouteMetadata.fromJson(Map<String, dynamic> json) {
    return GrpcGatewayRouteMetadata(
      name: json['name'] as String,
      invert: json['invert'] as bool?,
      match: json['match'] != null
          ? GrpcMetadataMatchMethod.fromJson(
              json['match'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final invert = this.invert;
    final match = this.match;
    return {
      'name': name,
      if (invert != null) 'invert': invert,
      if (match != null) 'match': match,
    };
  }
}

/// An object that represents the gateway route to rewrite.
class GrpcGatewayRouteRewrite {
  /// The host name of the gateway route to rewrite.
  final GatewayRouteHostnameRewrite? hostname;

  GrpcGatewayRouteRewrite({
    this.hostname,
  });

  factory GrpcGatewayRouteRewrite.fromJson(Map<String, dynamic> json) {
    return GrpcGatewayRouteRewrite(
      hostname: json['hostname'] != null
          ? GatewayRouteHostnameRewrite.fromJson(
              json['hostname'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hostname = this.hostname;
    return {
      if (hostname != null) 'hostname': hostname,
    };
  }
}

/// An object representing the method header to be matched.
class GrpcMetadataMatchMethod {
  /// The exact method header to be matched on.
  final String? exact;

  /// The specified beginning characters of the method header to be matched on.
  final String? prefix;
  final MatchRange? range;

  /// The regex used to match the method header.
  final String? regex;

  /// The specified ending characters of the method header to match on.
  final String? suffix;

  GrpcMetadataMatchMethod({
    this.exact,
    this.prefix,
    this.range,
    this.regex,
    this.suffix,
  });

  factory GrpcMetadataMatchMethod.fromJson(Map<String, dynamic> json) {
    return GrpcMetadataMatchMethod(
      exact: json['exact'] as String?,
      prefix: json['prefix'] as String?,
      range: json['range'] != null
          ? MatchRange.fromJson(json['range'] as Map<String, dynamic>)
          : null,
      regex: json['regex'] as String?,
      suffix: json['suffix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exact = this.exact;
    final prefix = this.prefix;
    final range = this.range;
    final regex = this.regex;
    final suffix = this.suffix;
    return {
      if (exact != null) 'exact': exact,
      if (prefix != null) 'prefix': prefix,
      if (range != null) 'range': range,
      if (regex != null) 'regex': regex,
      if (suffix != null) 'suffix': suffix,
    };
  }
}

/// An object that represents a retry policy. Specify at least one value for at
/// least one of the types of <code>RetryEvents</code>, a value for
/// <code>maxRetries</code>, and a value for <code>perRetryTimeout</code>. Both
/// <code>server-error</code> and <code>gateway-error</code> under
/// <code>httpRetryEvents</code> include the Envoy <code>reset</code> policy.
/// For more information on the <code>reset</code> policy, see the <a
/// href="https://www.envoyproxy.io/docs/envoy/latest/configuration/http/http_filters/router_filter#x-envoy-retry-on">Envoy
/// documentation</a>.
class GrpcRetryPolicy {
  /// The maximum number of retry attempts.
  final int maxRetries;

  /// The timeout for each retry attempt.
  final Duration perRetryTimeout;

  /// Specify at least one of the valid values.
  final List<GrpcRetryPolicyEvent>? grpcRetryEvents;

  /// Specify at least one of the following values.
  ///
  /// <ul>
  /// <li>
  /// <b>server-error</b> – HTTP status codes 500, 501, 502, 503, 504, 505, 506,
  /// 507, 508, 510, and 511
  /// </li>
  /// <li>
  /// <b>gateway-error</b> – HTTP status codes 502, 503, and 504
  /// </li>
  /// <li>
  /// <b>client-error</b> – HTTP status code 409
  /// </li>
  /// <li>
  /// <b>stream-error</b> – Retry on refused stream
  /// </li>
  /// </ul>
  final List<String>? httpRetryEvents;

  /// Specify a valid value. The event occurs before any processing of a request
  /// has started and is encountered when the upstream is temporarily or
  /// permanently unavailable.
  final List<TcpRetryPolicyEvent>? tcpRetryEvents;

  GrpcRetryPolicy({
    required this.maxRetries,
    required this.perRetryTimeout,
    this.grpcRetryEvents,
    this.httpRetryEvents,
    this.tcpRetryEvents,
  });

  factory GrpcRetryPolicy.fromJson(Map<String, dynamic> json) {
    return GrpcRetryPolicy(
      maxRetries: json['maxRetries'] as int,
      perRetryTimeout:
          Duration.fromJson(json['perRetryTimeout'] as Map<String, dynamic>),
      grpcRetryEvents: (json['grpcRetryEvents'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toGrpcRetryPolicyEvent())
          .toList(),
      httpRetryEvents: (json['httpRetryEvents'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tcpRetryEvents: (json['tcpRetryEvents'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toTcpRetryPolicyEvent())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxRetries = this.maxRetries;
    final perRetryTimeout = this.perRetryTimeout;
    final grpcRetryEvents = this.grpcRetryEvents;
    final httpRetryEvents = this.httpRetryEvents;
    final tcpRetryEvents = this.tcpRetryEvents;
    return {
      'maxRetries': maxRetries,
      'perRetryTimeout': perRetryTimeout,
      if (grpcRetryEvents != null)
        'grpcRetryEvents': grpcRetryEvents.map((e) => e.toValue()).toList(),
      if (httpRetryEvents != null) 'httpRetryEvents': httpRetryEvents,
      if (tcpRetryEvents != null)
        'tcpRetryEvents': tcpRetryEvents.map((e) => e.toValue()).toList(),
    };
  }
}

enum GrpcRetryPolicyEvent {
  cancelled,
  deadlineExceeded,
  internal,
  resourceExhausted,
  unavailable,
}

extension GrpcRetryPolicyEventValueExtension on GrpcRetryPolicyEvent {
  String toValue() {
    switch (this) {
      case GrpcRetryPolicyEvent.cancelled:
        return 'cancelled';
      case GrpcRetryPolicyEvent.deadlineExceeded:
        return 'deadline-exceeded';
      case GrpcRetryPolicyEvent.internal:
        return 'internal';
      case GrpcRetryPolicyEvent.resourceExhausted:
        return 'resource-exhausted';
      case GrpcRetryPolicyEvent.unavailable:
        return 'unavailable';
    }
  }
}

extension GrpcRetryPolicyEventFromString on String {
  GrpcRetryPolicyEvent toGrpcRetryPolicyEvent() {
    switch (this) {
      case 'cancelled':
        return GrpcRetryPolicyEvent.cancelled;
      case 'deadline-exceeded':
        return GrpcRetryPolicyEvent.deadlineExceeded;
      case 'internal':
        return GrpcRetryPolicyEvent.internal;
      case 'resource-exhausted':
        return GrpcRetryPolicyEvent.resourceExhausted;
      case 'unavailable':
        return GrpcRetryPolicyEvent.unavailable;
    }
    throw Exception('$this is not known in enum GrpcRetryPolicyEvent');
  }
}

/// An object that represents a gRPC route type.
class GrpcRoute {
  /// An object that represents the action to take if a match is determined.
  final GrpcRouteAction action;

  /// An object that represents the criteria for determining a request match.
  final GrpcRouteMatch match;

  /// An object that represents a retry policy.
  final GrpcRetryPolicy? retryPolicy;

  /// An object that represents types of timeouts.
  final GrpcTimeout? timeout;

  GrpcRoute({
    required this.action,
    required this.match,
    this.retryPolicy,
    this.timeout,
  });

  factory GrpcRoute.fromJson(Map<String, dynamic> json) {
    return GrpcRoute(
      action: GrpcRouteAction.fromJson(json['action'] as Map<String, dynamic>),
      match: GrpcRouteMatch.fromJson(json['match'] as Map<String, dynamic>),
      retryPolicy: json['retryPolicy'] != null
          ? GrpcRetryPolicy.fromJson(
              json['retryPolicy'] as Map<String, dynamic>)
          : null,
      timeout: json['timeout'] != null
          ? GrpcTimeout.fromJson(json['timeout'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final retryPolicy = this.retryPolicy;
    final timeout = this.timeout;
    return {
      'action': action,
      'match': match,
      if (retryPolicy != null) 'retryPolicy': retryPolicy,
      if (timeout != null) 'timeout': timeout,
    };
  }
}

/// An object that represents the action to take if a match is determined.
class GrpcRouteAction {
  /// An object that represents the targets that traffic is routed to when a
  /// request matches the route.
  final List<WeightedTarget> weightedTargets;

  GrpcRouteAction({
    required this.weightedTargets,
  });

  factory GrpcRouteAction.fromJson(Map<String, dynamic> json) {
    return GrpcRouteAction(
      weightedTargets: (json['weightedTargets'] as List)
          .whereNotNull()
          .map((e) => WeightedTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final weightedTargets = this.weightedTargets;
    return {
      'weightedTargets': weightedTargets,
    };
  }
}

/// An object that represents the criteria for determining a request match.
class GrpcRouteMatch {
  /// An object that represents the data to match from the request.
  final List<GrpcRouteMetadata>? metadata;

  /// The method name to match from the request. If you specify a name, you must
  /// also specify a <code>serviceName</code>.
  final String? methodName;

  /// The port number to match on.
  final int? port;

  /// The fully qualified domain name for the service to match from the request.
  final String? serviceName;

  GrpcRouteMatch({
    this.metadata,
    this.methodName,
    this.port,
    this.serviceName,
  });

  factory GrpcRouteMatch.fromJson(Map<String, dynamic> json) {
    return GrpcRouteMatch(
      metadata: (json['metadata'] as List?)
          ?.whereNotNull()
          .map((e) => GrpcRouteMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      methodName: json['methodName'] as String?,
      port: json['port'] as int?,
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final methodName = this.methodName;
    final port = this.port;
    final serviceName = this.serviceName;
    return {
      if (metadata != null) 'metadata': metadata,
      if (methodName != null) 'methodName': methodName,
      if (port != null) 'port': port,
      if (serviceName != null) 'serviceName': serviceName,
    };
  }
}

/// An object that represents the match metadata for the route.
class GrpcRouteMetadata {
  /// The name of the route.
  final String name;

  /// Specify <code>True</code> to match anything except the match criteria. The
  /// default value is <code>False</code>.
  final bool? invert;

  /// An object that represents the data to match from the request.
  final GrpcRouteMetadataMatchMethod? match;

  GrpcRouteMetadata({
    required this.name,
    this.invert,
    this.match,
  });

  factory GrpcRouteMetadata.fromJson(Map<String, dynamic> json) {
    return GrpcRouteMetadata(
      name: json['name'] as String,
      invert: json['invert'] as bool?,
      match: json['match'] != null
          ? GrpcRouteMetadataMatchMethod.fromJson(
              json['match'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final invert = this.invert;
    final match = this.match;
    return {
      'name': name,
      if (invert != null) 'invert': invert,
      if (match != null) 'match': match,
    };
  }
}

/// An object that represents the match method. Specify one of the match values.
class GrpcRouteMetadataMatchMethod {
  /// The value sent by the client must match the specified value exactly.
  final String? exact;

  /// The value sent by the client must begin with the specified characters.
  final String? prefix;

  /// An object that represents the range of values to match on.
  final MatchRange? range;

  /// The value sent by the client must include the specified characters.
  final String? regex;

  /// The value sent by the client must end with the specified characters.
  final String? suffix;

  GrpcRouteMetadataMatchMethod({
    this.exact,
    this.prefix,
    this.range,
    this.regex,
    this.suffix,
  });

  factory GrpcRouteMetadataMatchMethod.fromJson(Map<String, dynamic> json) {
    return GrpcRouteMetadataMatchMethod(
      exact: json['exact'] as String?,
      prefix: json['prefix'] as String?,
      range: json['range'] != null
          ? MatchRange.fromJson(json['range'] as Map<String, dynamic>)
          : null,
      regex: json['regex'] as String?,
      suffix: json['suffix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exact = this.exact;
    final prefix = this.prefix;
    final range = this.range;
    final regex = this.regex;
    final suffix = this.suffix;
    return {
      if (exact != null) 'exact': exact,
      if (prefix != null) 'prefix': prefix,
      if (range != null) 'range': range,
      if (regex != null) 'regex': regex,
      if (suffix != null) 'suffix': suffix,
    };
  }
}

/// An object that represents types of timeouts.
class GrpcTimeout {
  /// An object that represents an idle timeout. An idle timeout bounds the amount
  /// of time that a connection may be idle. The default value is none.
  final Duration? idle;

  /// An object that represents a per request timeout. The default value is 15
  /// seconds. If you set a higher timeout, then make sure that the higher value
  /// is set for each App Mesh resource in a conversation. For example, if a
  /// virtual node backend uses a virtual router provider to route to another
  /// virtual node, then the timeout should be greater than 15 seconds for the
  /// source and destination virtual node and the route.
  final Duration? perRequest;

  GrpcTimeout({
    this.idle,
    this.perRequest,
  });

  factory GrpcTimeout.fromJson(Map<String, dynamic> json) {
    return GrpcTimeout(
      idle: json['idle'] != null
          ? Duration.fromJson(json['idle'] as Map<String, dynamic>)
          : null,
      perRequest: json['perRequest'] != null
          ? Duration.fromJson(json['perRequest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final idle = this.idle;
    final perRequest = this.perRequest;
    return {
      if (idle != null) 'idle': idle,
      if (perRequest != null) 'perRequest': perRequest,
    };
  }
}

/// An object that represents the method and value to match with the header
/// value sent in a request. Specify one match method.
class HeaderMatchMethod {
  /// The value sent by the client must match the specified value exactly.
  final String? exact;

  /// The value sent by the client must begin with the specified characters.
  final String? prefix;

  /// An object that represents the range of values to match on.
  final MatchRange? range;

  /// The value sent by the client must include the specified characters.
  final String? regex;

  /// The value sent by the client must end with the specified characters.
  final String? suffix;

  HeaderMatchMethod({
    this.exact,
    this.prefix,
    this.range,
    this.regex,
    this.suffix,
  });

  factory HeaderMatchMethod.fromJson(Map<String, dynamic> json) {
    return HeaderMatchMethod(
      exact: json['exact'] as String?,
      prefix: json['prefix'] as String?,
      range: json['range'] != null
          ? MatchRange.fromJson(json['range'] as Map<String, dynamic>)
          : null,
      regex: json['regex'] as String?,
      suffix: json['suffix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exact = this.exact;
    final prefix = this.prefix;
    final range = this.range;
    final regex = this.regex;
    final suffix = this.suffix;
    return {
      if (exact != null) 'exact': exact,
      if (prefix != null) 'prefix': prefix,
      if (range != null) 'range': range,
      if (regex != null) 'regex': regex,
      if (suffix != null) 'suffix': suffix,
    };
  }
}

/// An object that represents the health check policy for a virtual node's
/// listener.
class HealthCheckPolicy {
  /// The number of consecutive successful health checks that must occur before
  /// declaring listener healthy.
  final int healthyThreshold;

  /// The time period in milliseconds between each health check execution.
  final int intervalMillis;

  /// The protocol for the health check request. If you specify <code>grpc</code>,
  /// then your service must conform to the <a
  /// href="https://github.com/grpc/grpc/blob/master/doc/health-checking.md">GRPC
  /// Health Checking Protocol</a>.
  final PortProtocol protocol;

  /// The amount of time to wait when receiving a response from the health check,
  /// in milliseconds.
  final int timeoutMillis;

  /// The number of consecutive failed health checks that must occur before
  /// declaring a virtual node unhealthy.
  final int unhealthyThreshold;

  /// The destination path for the health check request. This value is only used
  /// if the specified protocol is HTTP or HTTP/2. For any other protocol, this
  /// value is ignored.
  final String? path;

  /// The destination port for the health check request. This port must match the
  /// port defined in the <a>PortMapping</a> for the listener.
  final int? port;

  HealthCheckPolicy({
    required this.healthyThreshold,
    required this.intervalMillis,
    required this.protocol,
    required this.timeoutMillis,
    required this.unhealthyThreshold,
    this.path,
    this.port,
  });

  factory HealthCheckPolicy.fromJson(Map<String, dynamic> json) {
    return HealthCheckPolicy(
      healthyThreshold: json['healthyThreshold'] as int,
      intervalMillis: json['intervalMillis'] as int,
      protocol: (json['protocol'] as String).toPortProtocol(),
      timeoutMillis: json['timeoutMillis'] as int,
      unhealthyThreshold: json['unhealthyThreshold'] as int,
      path: json['path'] as String?,
      port: json['port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthyThreshold = this.healthyThreshold;
    final intervalMillis = this.intervalMillis;
    final protocol = this.protocol;
    final timeoutMillis = this.timeoutMillis;
    final unhealthyThreshold = this.unhealthyThreshold;
    final path = this.path;
    final port = this.port;
    return {
      'healthyThreshold': healthyThreshold,
      'intervalMillis': intervalMillis,
      'protocol': protocol.toValue(),
      'timeoutMillis': timeoutMillis,
      'unhealthyThreshold': unhealthyThreshold,
      if (path != null) 'path': path,
      if (port != null) 'port': port,
    };
  }
}

/// An object that represents an HTTP gateway route.
class HttpGatewayRoute {
  /// An object that represents the action to take if a match is determined.
  final HttpGatewayRouteAction action;

  /// An object that represents the criteria for determining a request match.
  final HttpGatewayRouteMatch match;

  HttpGatewayRoute({
    required this.action,
    required this.match,
  });

  factory HttpGatewayRoute.fromJson(Map<String, dynamic> json) {
    return HttpGatewayRoute(
      action: HttpGatewayRouteAction.fromJson(
          json['action'] as Map<String, dynamic>),
      match:
          HttpGatewayRouteMatch.fromJson(json['match'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    return {
      'action': action,
      'match': match,
    };
  }
}

/// An object that represents the action to take if a match is determined.
class HttpGatewayRouteAction {
  /// An object that represents the target that traffic is routed to when a
  /// request matches the gateway route.
  final GatewayRouteTarget target;

  /// The gateway route action to rewrite.
  final HttpGatewayRouteRewrite? rewrite;

  HttpGatewayRouteAction({
    required this.target,
    this.rewrite,
  });

  factory HttpGatewayRouteAction.fromJson(Map<String, dynamic> json) {
    return HttpGatewayRouteAction(
      target:
          GatewayRouteTarget.fromJson(json['target'] as Map<String, dynamic>),
      rewrite: json['rewrite'] != null
          ? HttpGatewayRouteRewrite.fromJson(
              json['rewrite'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final target = this.target;
    final rewrite = this.rewrite;
    return {
      'target': target,
      if (rewrite != null) 'rewrite': rewrite,
    };
  }
}

/// An object that represents the HTTP header in the gateway route.
class HttpGatewayRouteHeader {
  /// A name for the HTTP header in the gateway route that will be matched on.
  final String name;

  /// Specify <code>True</code> to match anything except the match criteria. The
  /// default value is <code>False</code>.
  final bool? invert;

  /// An object that represents the method and value to match with the header
  /// value sent in a request. Specify one match method.
  final HeaderMatchMethod? match;

  HttpGatewayRouteHeader({
    required this.name,
    this.invert,
    this.match,
  });

  factory HttpGatewayRouteHeader.fromJson(Map<String, dynamic> json) {
    return HttpGatewayRouteHeader(
      name: json['name'] as String,
      invert: json['invert'] as bool?,
      match: json['match'] != null
          ? HeaderMatchMethod.fromJson(json['match'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final invert = this.invert;
    final match = this.match;
    return {
      'name': name,
      if (invert != null) 'invert': invert,
      if (match != null) 'match': match,
    };
  }
}

/// An object that represents the criteria for determining a request match.
class HttpGatewayRouteMatch {
  /// The client request headers to match on.
  final List<HttpGatewayRouteHeader>? headers;

  /// The host name to match on.
  final GatewayRouteHostnameMatch? hostname;

  /// The method to match on.
  final HttpMethod? method;

  /// The path to match on.
  final HttpPathMatch? path;

  /// The port number to match on.
  final int? port;

  /// Specifies the path to match requests with. This parameter must always start
  /// with <code>/</code>, which by itself matches all requests to the virtual
  /// service name. You can also match for path-based routing of requests. For
  /// example, if your virtual service name is <code>my-service.local</code> and
  /// you want the route to match requests to
  /// <code>my-service.local/metrics</code>, your prefix should be
  /// <code>/metrics</code>.
  final String? prefix;

  /// The query parameter to match on.
  final List<HttpQueryParameter>? queryParameters;

  HttpGatewayRouteMatch({
    this.headers,
    this.hostname,
    this.method,
    this.path,
    this.port,
    this.prefix,
    this.queryParameters,
  });

  factory HttpGatewayRouteMatch.fromJson(Map<String, dynamic> json) {
    return HttpGatewayRouteMatch(
      headers: (json['headers'] as List?)
          ?.whereNotNull()
          .map(
              (e) => HttpGatewayRouteHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
      hostname: json['hostname'] != null
          ? GatewayRouteHostnameMatch.fromJson(
              json['hostname'] as Map<String, dynamic>)
          : null,
      method: (json['method'] as String?)?.toHttpMethod(),
      path: json['path'] != null
          ? HttpPathMatch.fromJson(json['path'] as Map<String, dynamic>)
          : null,
      port: json['port'] as int?,
      prefix: json['prefix'] as String?,
      queryParameters: (json['queryParameters'] as List?)
          ?.whereNotNull()
          .map((e) => HttpQueryParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final headers = this.headers;
    final hostname = this.hostname;
    final method = this.method;
    final path = this.path;
    final port = this.port;
    final prefix = this.prefix;
    final queryParameters = this.queryParameters;
    return {
      if (headers != null) 'headers': headers,
      if (hostname != null) 'hostname': hostname,
      if (method != null) 'method': method.toValue(),
      if (path != null) 'path': path,
      if (port != null) 'port': port,
      if (prefix != null) 'prefix': prefix,
      if (queryParameters != null) 'queryParameters': queryParameters,
    };
  }
}

/// An object that represents the path to rewrite.
class HttpGatewayRoutePathRewrite {
  /// The exact path to rewrite.
  final String? exact;

  HttpGatewayRoutePathRewrite({
    this.exact,
  });

  factory HttpGatewayRoutePathRewrite.fromJson(Map<String, dynamic> json) {
    return HttpGatewayRoutePathRewrite(
      exact: json['exact'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exact = this.exact;
    return {
      if (exact != null) 'exact': exact,
    };
  }
}

/// An object representing the beginning characters of the route to rewrite.
class HttpGatewayRoutePrefixRewrite {
  /// The default prefix used to replace the incoming route prefix when rewritten.
  final DefaultGatewayRouteRewrite? defaultPrefix;

  /// The value used to replace the incoming route prefix when rewritten.
  final String? value;

  HttpGatewayRoutePrefixRewrite({
    this.defaultPrefix,
    this.value,
  });

  factory HttpGatewayRoutePrefixRewrite.fromJson(Map<String, dynamic> json) {
    return HttpGatewayRoutePrefixRewrite(
      defaultPrefix:
          (json['defaultPrefix'] as String?)?.toDefaultGatewayRouteRewrite(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultPrefix = this.defaultPrefix;
    final value = this.value;
    return {
      if (defaultPrefix != null) 'defaultPrefix': defaultPrefix.toValue(),
      if (value != null) 'value': value,
    };
  }
}

/// An object representing the gateway route to rewrite.
class HttpGatewayRouteRewrite {
  /// The host name to rewrite.
  final GatewayRouteHostnameRewrite? hostname;

  /// The path to rewrite.
  final HttpGatewayRoutePathRewrite? path;

  /// The specified beginning characters to rewrite.
  final HttpGatewayRoutePrefixRewrite? prefix;

  HttpGatewayRouteRewrite({
    this.hostname,
    this.path,
    this.prefix,
  });

  factory HttpGatewayRouteRewrite.fromJson(Map<String, dynamic> json) {
    return HttpGatewayRouteRewrite(
      hostname: json['hostname'] != null
          ? GatewayRouteHostnameRewrite.fromJson(
              json['hostname'] as Map<String, dynamic>)
          : null,
      path: json['path'] != null
          ? HttpGatewayRoutePathRewrite.fromJson(
              json['path'] as Map<String, dynamic>)
          : null,
      prefix: json['prefix'] != null
          ? HttpGatewayRoutePrefixRewrite.fromJson(
              json['prefix'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hostname = this.hostname;
    final path = this.path;
    final prefix = this.prefix;
    return {
      if (hostname != null) 'hostname': hostname,
      if (path != null) 'path': path,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

enum HttpMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}

extension HttpMethodValueExtension on HttpMethod {
  String toValue() {
    switch (this) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.head:
        return 'HEAD';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.delete:
        return 'DELETE';
      case HttpMethod.connect:
        return 'CONNECT';
      case HttpMethod.options:
        return 'OPTIONS';
      case HttpMethod.trace:
        return 'TRACE';
      case HttpMethod.patch:
        return 'PATCH';
    }
  }
}

extension HttpMethodFromString on String {
  HttpMethod toHttpMethod() {
    switch (this) {
      case 'GET':
        return HttpMethod.get;
      case 'HEAD':
        return HttpMethod.head;
      case 'POST':
        return HttpMethod.post;
      case 'PUT':
        return HttpMethod.put;
      case 'DELETE':
        return HttpMethod.delete;
      case 'CONNECT':
        return HttpMethod.connect;
      case 'OPTIONS':
        return HttpMethod.options;
      case 'TRACE':
        return HttpMethod.trace;
      case 'PATCH':
        return HttpMethod.patch;
    }
    throw Exception('$this is not known in enum HttpMethod');
  }
}

/// An object representing the path to match in the request.
class HttpPathMatch {
  /// The exact path to match on.
  final String? exact;

  /// The regex used to match the path.
  final String? regex;

  HttpPathMatch({
    this.exact,
    this.regex,
  });

  factory HttpPathMatch.fromJson(Map<String, dynamic> json) {
    return HttpPathMatch(
      exact: json['exact'] as String?,
      regex: json['regex'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exact = this.exact;
    final regex = this.regex;
    return {
      if (exact != null) 'exact': exact,
      if (regex != null) 'regex': regex,
    };
  }
}

/// An object that represents the query parameter in the request.
class HttpQueryParameter {
  /// A name for the query parameter that will be matched on.
  final String name;

  /// The query parameter to match on.
  final QueryParameterMatch? match;

  HttpQueryParameter({
    required this.name,
    this.match,
  });

  factory HttpQueryParameter.fromJson(Map<String, dynamic> json) {
    return HttpQueryParameter(
      name: json['name'] as String,
      match: json['match'] != null
          ? QueryParameterMatch.fromJson(json['match'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final match = this.match;
    return {
      'name': name,
      if (match != null) 'match': match,
    };
  }
}

/// An object that represents a retry policy. Specify at least one value for at
/// least one of the types of <code>RetryEvents</code>, a value for
/// <code>maxRetries</code>, and a value for <code>perRetryTimeout</code>. Both
/// <code>server-error</code> and <code>gateway-error</code> under
/// <code>httpRetryEvents</code> include the Envoy <code>reset</code> policy.
/// For more information on the <code>reset</code> policy, see the <a
/// href="https://www.envoyproxy.io/docs/envoy/latest/configuration/http/http_filters/router_filter#x-envoy-retry-on">Envoy
/// documentation</a>.
class HttpRetryPolicy {
  /// The maximum number of retry attempts.
  final int maxRetries;

  /// The timeout for each retry attempt.
  final Duration perRetryTimeout;

  /// Specify at least one of the following values.
  ///
  /// <ul>
  /// <li>
  /// <b>server-error</b> – HTTP status codes 500, 501, 502, 503, 504, 505, 506,
  /// 507, 508, 510, and 511
  /// </li>
  /// <li>
  /// <b>gateway-error</b> – HTTP status codes 502, 503, and 504
  /// </li>
  /// <li>
  /// <b>client-error</b> – HTTP status code 409
  /// </li>
  /// <li>
  /// <b>stream-error</b> – Retry on refused stream
  /// </li>
  /// </ul>
  final List<String>? httpRetryEvents;

  /// Specify a valid value. The event occurs before any processing of a request
  /// has started and is encountered when the upstream is temporarily or
  /// permanently unavailable.
  final List<TcpRetryPolicyEvent>? tcpRetryEvents;

  HttpRetryPolicy({
    required this.maxRetries,
    required this.perRetryTimeout,
    this.httpRetryEvents,
    this.tcpRetryEvents,
  });

  factory HttpRetryPolicy.fromJson(Map<String, dynamic> json) {
    return HttpRetryPolicy(
      maxRetries: json['maxRetries'] as int,
      perRetryTimeout:
          Duration.fromJson(json['perRetryTimeout'] as Map<String, dynamic>),
      httpRetryEvents: (json['httpRetryEvents'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tcpRetryEvents: (json['tcpRetryEvents'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toTcpRetryPolicyEvent())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxRetries = this.maxRetries;
    final perRetryTimeout = this.perRetryTimeout;
    final httpRetryEvents = this.httpRetryEvents;
    final tcpRetryEvents = this.tcpRetryEvents;
    return {
      'maxRetries': maxRetries,
      'perRetryTimeout': perRetryTimeout,
      if (httpRetryEvents != null) 'httpRetryEvents': httpRetryEvents,
      if (tcpRetryEvents != null)
        'tcpRetryEvents': tcpRetryEvents.map((e) => e.toValue()).toList(),
    };
  }
}

/// An object that represents an HTTP or HTTP/2 route type.
class HttpRoute {
  /// An object that represents the action to take if a match is determined.
  final HttpRouteAction action;

  /// An object that represents the criteria for determining a request match.
  final HttpRouteMatch match;

  /// An object that represents a retry policy.
  final HttpRetryPolicy? retryPolicy;

  /// An object that represents types of timeouts.
  final HttpTimeout? timeout;

  HttpRoute({
    required this.action,
    required this.match,
    this.retryPolicy,
    this.timeout,
  });

  factory HttpRoute.fromJson(Map<String, dynamic> json) {
    return HttpRoute(
      action: HttpRouteAction.fromJson(json['action'] as Map<String, dynamic>),
      match: HttpRouteMatch.fromJson(json['match'] as Map<String, dynamic>),
      retryPolicy: json['retryPolicy'] != null
          ? HttpRetryPolicy.fromJson(
              json['retryPolicy'] as Map<String, dynamic>)
          : null,
      timeout: json['timeout'] != null
          ? HttpTimeout.fromJson(json['timeout'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final retryPolicy = this.retryPolicy;
    final timeout = this.timeout;
    return {
      'action': action,
      'match': match,
      if (retryPolicy != null) 'retryPolicy': retryPolicy,
      if (timeout != null) 'timeout': timeout,
    };
  }
}

/// An object that represents the action to take if a match is determined.
class HttpRouteAction {
  /// An object that represents the targets that traffic is routed to when a
  /// request matches the route.
  final List<WeightedTarget> weightedTargets;

  HttpRouteAction({
    required this.weightedTargets,
  });

  factory HttpRouteAction.fromJson(Map<String, dynamic> json) {
    return HttpRouteAction(
      weightedTargets: (json['weightedTargets'] as List)
          .whereNotNull()
          .map((e) => WeightedTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final weightedTargets = this.weightedTargets;
    return {
      'weightedTargets': weightedTargets,
    };
  }
}

/// An object that represents the HTTP header in the request.
class HttpRouteHeader {
  /// A name for the HTTP header in the client request that will be matched on.
  final String name;

  /// Specify <code>True</code> to match anything except the match criteria. The
  /// default value is <code>False</code>.
  final bool? invert;

  /// The <code>HeaderMatchMethod</code> object.
  final HeaderMatchMethod? match;

  HttpRouteHeader({
    required this.name,
    this.invert,
    this.match,
  });

  factory HttpRouteHeader.fromJson(Map<String, dynamic> json) {
    return HttpRouteHeader(
      name: json['name'] as String,
      invert: json['invert'] as bool?,
      match: json['match'] != null
          ? HeaderMatchMethod.fromJson(json['match'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final invert = this.invert;
    final match = this.match;
    return {
      'name': name,
      if (invert != null) 'invert': invert,
      if (match != null) 'match': match,
    };
  }
}

/// An object that represents the requirements for a route to match HTTP
/// requests for a virtual router.
class HttpRouteMatch {
  /// The client request headers to match on.
  final List<HttpRouteHeader>? headers;

  /// The client request method to match on. Specify only one.
  final HttpMethod? method;

  /// The client request path to match on.
  final HttpPathMatch? path;

  /// The port number to match on.
  final int? port;

  /// Specifies the path to match requests with. This parameter must always start
  /// with <code>/</code>, which by itself matches all requests to the virtual
  /// service name. You can also match for path-based routing of requests. For
  /// example, if your virtual service name is <code>my-service.local</code> and
  /// you want the route to match requests to
  /// <code>my-service.local/metrics</code>, your prefix should be
  /// <code>/metrics</code>.
  final String? prefix;

  /// The client request query parameters to match on.
  final List<HttpQueryParameter>? queryParameters;

  /// The client request scheme to match on. Specify only one. Applicable only for
  /// HTTP2 routes.
  final HttpScheme? scheme;

  HttpRouteMatch({
    this.headers,
    this.method,
    this.path,
    this.port,
    this.prefix,
    this.queryParameters,
    this.scheme,
  });

  factory HttpRouteMatch.fromJson(Map<String, dynamic> json) {
    return HttpRouteMatch(
      headers: (json['headers'] as List?)
          ?.whereNotNull()
          .map((e) => HttpRouteHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
      method: (json['method'] as String?)?.toHttpMethod(),
      path: json['path'] != null
          ? HttpPathMatch.fromJson(json['path'] as Map<String, dynamic>)
          : null,
      port: json['port'] as int?,
      prefix: json['prefix'] as String?,
      queryParameters: (json['queryParameters'] as List?)
          ?.whereNotNull()
          .map((e) => HttpQueryParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      scheme: (json['scheme'] as String?)?.toHttpScheme(),
    );
  }

  Map<String, dynamic> toJson() {
    final headers = this.headers;
    final method = this.method;
    final path = this.path;
    final port = this.port;
    final prefix = this.prefix;
    final queryParameters = this.queryParameters;
    final scheme = this.scheme;
    return {
      if (headers != null) 'headers': headers,
      if (method != null) 'method': method.toValue(),
      if (path != null) 'path': path,
      if (port != null) 'port': port,
      if (prefix != null) 'prefix': prefix,
      if (queryParameters != null) 'queryParameters': queryParameters,
      if (scheme != null) 'scheme': scheme.toValue(),
    };
  }
}

enum HttpScheme {
  http,
  https,
}

extension HttpSchemeValueExtension on HttpScheme {
  String toValue() {
    switch (this) {
      case HttpScheme.http:
        return 'http';
      case HttpScheme.https:
        return 'https';
    }
  }
}

extension HttpSchemeFromString on String {
  HttpScheme toHttpScheme() {
    switch (this) {
      case 'http':
        return HttpScheme.http;
      case 'https':
        return HttpScheme.https;
    }
    throw Exception('$this is not known in enum HttpScheme');
  }
}

/// An object that represents types of timeouts.
class HttpTimeout {
  /// An object that represents an idle timeout. An idle timeout bounds the amount
  /// of time that a connection may be idle. The default value is none.
  final Duration? idle;

  /// An object that represents a per request timeout. The default value is 15
  /// seconds. If you set a higher timeout, then make sure that the higher value
  /// is set for each App Mesh resource in a conversation. For example, if a
  /// virtual node backend uses a virtual router provider to route to another
  /// virtual node, then the timeout should be greater than 15 seconds for the
  /// source and destination virtual node and the route.
  final Duration? perRequest;

  HttpTimeout({
    this.idle,
    this.perRequest,
  });

  factory HttpTimeout.fromJson(Map<String, dynamic> json) {
    return HttpTimeout(
      idle: json['idle'] != null
          ? Duration.fromJson(json['idle'] as Map<String, dynamic>)
          : null,
      perRequest: json['perRequest'] != null
          ? Duration.fromJson(json['perRequest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final idle = this.idle;
    final perRequest = this.perRequest;
    return {
      if (idle != null) 'idle': idle,
      if (perRequest != null) 'perRequest': perRequest,
    };
  }
}

enum IpPreference {
  iPv6Preferred,
  iPv4Preferred,
  iPv4Only,
  iPv6Only,
}

extension IpPreferenceValueExtension on IpPreference {
  String toValue() {
    switch (this) {
      case IpPreference.iPv6Preferred:
        return 'IPv6_PREFERRED';
      case IpPreference.iPv4Preferred:
        return 'IPv4_PREFERRED';
      case IpPreference.iPv4Only:
        return 'IPv4_ONLY';
      case IpPreference.iPv6Only:
        return 'IPv6_ONLY';
    }
  }
}

extension IpPreferenceFromString on String {
  IpPreference toIpPreference() {
    switch (this) {
      case 'IPv6_PREFERRED':
        return IpPreference.iPv6Preferred;
      case 'IPv4_PREFERRED':
        return IpPreference.iPv4Preferred;
      case 'IPv4_ONLY':
        return IpPreference.iPv4Only;
      case 'IPv6_ONLY':
        return IpPreference.iPv6Only;
    }
    throw Exception('$this is not known in enum IpPreference');
  }
}

/// An object that represents the key value pairs for the JSON.
class JsonFormatRef {
  /// The specified key for the JSON.
  final String key;

  /// The specified value for the JSON.
  final String value;

  JsonFormatRef({
    required this.key,
    required this.value,
  });

  factory JsonFormatRef.fromJson(Map<String, dynamic> json) {
    return JsonFormatRef(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

class ListGatewayRoutesOutput {
  /// The list of existing gateway routes for the specified service mesh and
  /// virtual gateway.
  final List<GatewayRouteRef> gatewayRoutes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListGatewayRoutes</code> request. When the results of a
  /// <code>ListGatewayRoutes</code> request exceed <code>limit</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListGatewayRoutesOutput({
    required this.gatewayRoutes,
    this.nextToken,
  });

  factory ListGatewayRoutesOutput.fromJson(Map<String, dynamic> json) {
    return ListGatewayRoutesOutput(
      gatewayRoutes: (json['gatewayRoutes'] as List)
          .whereNotNull()
          .map((e) => GatewayRouteRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayRoutes = this.gatewayRoutes;
    final nextToken = this.nextToken;
    return {
      'gatewayRoutes': gatewayRoutes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class ListMeshesOutput {
  /// The list of existing service meshes.
  final List<MeshRef> meshes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListMeshes</code> request. When the results of a
  /// <code>ListMeshes</code> request exceed <code>limit</code>, you can use this
  /// value to retrieve the next page of results. This value is <code>null</code>
  /// when there are no more results to return.
  final String? nextToken;

  ListMeshesOutput({
    required this.meshes,
    this.nextToken,
  });

  factory ListMeshesOutput.fromJson(Map<String, dynamic> json) {
    return ListMeshesOutput(
      meshes: (json['meshes'] as List)
          .whereNotNull()
          .map((e) => MeshRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final meshes = this.meshes;
    final nextToken = this.nextToken;
    return {
      'meshes': meshes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class ListRoutesOutput {
  /// The list of existing routes for the specified service mesh and virtual
  /// router.
  final List<RouteRef> routes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListRoutes</code> request. When the results of a
  /// <code>ListRoutes</code> request exceed <code>limit</code>, you can use this
  /// value to retrieve the next page of results. This value is <code>null</code>
  /// when there are no more results to return.
  final String? nextToken;

  ListRoutesOutput({
    required this.routes,
    this.nextToken,
  });

  factory ListRoutesOutput.fromJson(Map<String, dynamic> json) {
    return ListRoutesOutput(
      routes: (json['routes'] as List)
          .whereNotNull()
          .map((e) => RouteRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routes = this.routes;
    final nextToken = this.nextToken;
    return {
      'routes': routes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class ListTagsForResourceOutput {
  /// The tags for the resource.
  final List<TagRef> tags;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListTagsForResource</code> request. When the results of a
  /// <code>ListTagsForResource</code> request exceed <code>limit</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListTagsForResourceOutput({
    required this.tags,
    this.nextToken,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags: (json['tags'] as List)
          .whereNotNull()
          .map((e) => TagRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final nextToken = this.nextToken;
    return {
      'tags': tags,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListVirtualGatewaysOutput {
  /// The list of existing virtual gateways for the specified service mesh.
  final List<VirtualGatewayRef> virtualGateways;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListVirtualGateways</code> request. When the results of a
  /// <code>ListVirtualGateways</code> request exceed <code>limit</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListVirtualGatewaysOutput({
    required this.virtualGateways,
    this.nextToken,
  });

  factory ListVirtualGatewaysOutput.fromJson(Map<String, dynamic> json) {
    return ListVirtualGatewaysOutput(
      virtualGateways: (json['virtualGateways'] as List)
          .whereNotNull()
          .map((e) => VirtualGatewayRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualGateways = this.virtualGateways;
    final nextToken = this.nextToken;
    return {
      'virtualGateways': virtualGateways,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class ListVirtualNodesOutput {
  /// The list of existing virtual nodes for the specified service mesh.
  final List<VirtualNodeRef> virtualNodes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListVirtualNodes</code> request. When the results of a
  /// <code>ListVirtualNodes</code> request exceed <code>limit</code>, you can use
  /// this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListVirtualNodesOutput({
    required this.virtualNodes,
    this.nextToken,
  });

  factory ListVirtualNodesOutput.fromJson(Map<String, dynamic> json) {
    return ListVirtualNodesOutput(
      virtualNodes: (json['virtualNodes'] as List)
          .whereNotNull()
          .map((e) => VirtualNodeRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualNodes = this.virtualNodes;
    final nextToken = this.nextToken;
    return {
      'virtualNodes': virtualNodes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class ListVirtualRoutersOutput {
  /// The list of existing virtual routers for the specified service mesh.
  final List<VirtualRouterRef> virtualRouters;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListVirtualRouters</code> request. When the results of a
  /// <code>ListVirtualRouters</code> request exceed <code>limit</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListVirtualRoutersOutput({
    required this.virtualRouters,
    this.nextToken,
  });

  factory ListVirtualRoutersOutput.fromJson(Map<String, dynamic> json) {
    return ListVirtualRoutersOutput(
      virtualRouters: (json['virtualRouters'] as List)
          .whereNotNull()
          .map((e) => VirtualRouterRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualRouters = this.virtualRouters;
    final nextToken = this.nextToken;
    return {
      'virtualRouters': virtualRouters,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class ListVirtualServicesOutput {
  /// The list of existing virtual services for the specified service mesh.
  final List<VirtualServiceRef> virtualServices;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListVirtualServices</code> request. When the results of a
  /// <code>ListVirtualServices</code> request exceed <code>limit</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListVirtualServicesOutput({
    required this.virtualServices,
    this.nextToken,
  });

  factory ListVirtualServicesOutput.fromJson(Map<String, dynamic> json) {
    return ListVirtualServicesOutput(
      virtualServices: (json['virtualServices'] as List)
          .whereNotNull()
          .map((e) => VirtualServiceRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualServices = this.virtualServices;
    final nextToken = this.nextToken;
    return {
      'virtualServices': virtualServices,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// An object that represents a listener for a virtual node.
class Listener {
  /// The port mapping information for the listener.
  final PortMapping portMapping;

  /// The connection pool information for the listener.
  final VirtualNodeConnectionPool? connectionPool;

  /// The health check information for the listener.
  final HealthCheckPolicy? healthCheck;

  /// The outlier detection information for the listener.
  final OutlierDetection? outlierDetection;

  /// An object that represents timeouts for different protocols.
  final ListenerTimeout? timeout;

  /// A reference to an object that represents the Transport Layer Security (TLS)
  /// properties for a listener.
  final ListenerTls? tls;

  Listener({
    required this.portMapping,
    this.connectionPool,
    this.healthCheck,
    this.outlierDetection,
    this.timeout,
    this.tls,
  });

  factory Listener.fromJson(Map<String, dynamic> json) {
    return Listener(
      portMapping:
          PortMapping.fromJson(json['portMapping'] as Map<String, dynamic>),
      connectionPool: json['connectionPool'] != null
          ? VirtualNodeConnectionPool.fromJson(
              json['connectionPool'] as Map<String, dynamic>)
          : null,
      healthCheck: json['healthCheck'] != null
          ? HealthCheckPolicy.fromJson(
              json['healthCheck'] as Map<String, dynamic>)
          : null,
      outlierDetection: json['outlierDetection'] != null
          ? OutlierDetection.fromJson(
              json['outlierDetection'] as Map<String, dynamic>)
          : null,
      timeout: json['timeout'] != null
          ? ListenerTimeout.fromJson(json['timeout'] as Map<String, dynamic>)
          : null,
      tls: json['tls'] != null
          ? ListenerTls.fromJson(json['tls'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final portMapping = this.portMapping;
    final connectionPool = this.connectionPool;
    final healthCheck = this.healthCheck;
    final outlierDetection = this.outlierDetection;
    final timeout = this.timeout;
    final tls = this.tls;
    return {
      'portMapping': portMapping,
      if (connectionPool != null) 'connectionPool': connectionPool,
      if (healthCheck != null) 'healthCheck': healthCheck,
      if (outlierDetection != null) 'outlierDetection': outlierDetection,
      if (timeout != null) 'timeout': timeout,
      if (tls != null) 'tls': tls,
    };
  }
}

/// An object that represents timeouts for different protocols.
class ListenerTimeout {
  /// An object that represents types of timeouts.
  final GrpcTimeout? grpc;

  /// An object that represents types of timeouts.
  final HttpTimeout? http;

  /// An object that represents types of timeouts.
  final HttpTimeout? http2;

  /// An object that represents types of timeouts.
  final TcpTimeout? tcp;

  ListenerTimeout({
    this.grpc,
    this.http,
    this.http2,
    this.tcp,
  });

  factory ListenerTimeout.fromJson(Map<String, dynamic> json) {
    return ListenerTimeout(
      grpc: json['grpc'] != null
          ? GrpcTimeout.fromJson(json['grpc'] as Map<String, dynamic>)
          : null,
      http: json['http'] != null
          ? HttpTimeout.fromJson(json['http'] as Map<String, dynamic>)
          : null,
      http2: json['http2'] != null
          ? HttpTimeout.fromJson(json['http2'] as Map<String, dynamic>)
          : null,
      tcp: json['tcp'] != null
          ? TcpTimeout.fromJson(json['tcp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final grpc = this.grpc;
    final http = this.http;
    final http2 = this.http2;
    final tcp = this.tcp;
    return {
      if (grpc != null) 'grpc': grpc,
      if (http != null) 'http': http,
      if (http2 != null) 'http2': http2,
      if (tcp != null) 'tcp': tcp,
    };
  }
}

/// An object that represents the Transport Layer Security (TLS) properties for
/// a listener.
class ListenerTls {
  /// A reference to an object that represents a listener's Transport Layer
  /// Security (TLS) certificate.
  final ListenerTlsCertificate certificate;

  /// Specify one of the following modes.
  ///
  /// <ul>
  /// <li>
  /// <b/>STRICT – Listener only accepts connections with TLS enabled.
  /// </li>
  /// <li>
  /// <b/>PERMISSIVE – Listener accepts connections with or without TLS enabled.
  /// </li>
  /// <li>
  /// <b/>DISABLED – Listener only accepts connections without TLS.
  /// </li>
  /// </ul>
  final ListenerTlsMode mode;

  /// A reference to an object that represents a listener's Transport Layer
  /// Security (TLS) validation context.
  final ListenerTlsValidationContext? validation;

  ListenerTls({
    required this.certificate,
    required this.mode,
    this.validation,
  });

  factory ListenerTls.fromJson(Map<String, dynamic> json) {
    return ListenerTls(
      certificate: ListenerTlsCertificate.fromJson(
          json['certificate'] as Map<String, dynamic>),
      mode: (json['mode'] as String).toListenerTlsMode(),
      validation: json['validation'] != null
          ? ListenerTlsValidationContext.fromJson(
              json['validation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    final mode = this.mode;
    final validation = this.validation;
    return {
      'certificate': certificate,
      'mode': mode.toValue(),
      if (validation != null) 'validation': validation,
    };
  }
}

/// An object that represents an Certificate Manager certificate.
class ListenerTlsAcmCertificate {
  /// The Amazon Resource Name (ARN) for the certificate. The certificate must
  /// meet specific requirements and you must have proxy authorization enabled.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html#virtual-node-tls-prerequisites">Transport
  /// Layer Security (TLS)</a>.
  final String certificateArn;

  ListenerTlsAcmCertificate({
    required this.certificateArn,
  });

  factory ListenerTlsAcmCertificate.fromJson(Map<String, dynamic> json) {
    return ListenerTlsAcmCertificate(
      certificateArn: json['certificateArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    return {
      'certificateArn': certificateArn,
    };
  }
}

/// An object that represents a listener's Transport Layer Security (TLS)
/// certificate.
class ListenerTlsCertificate {
  /// A reference to an object that represents an Certificate Manager certificate.
  final ListenerTlsAcmCertificate? acm;

  /// A reference to an object that represents a local file certificate.
  final ListenerTlsFileCertificate? file;

  /// A reference to an object that represents a listener's Secret Discovery
  /// Service certificate.
  final ListenerTlsSdsCertificate? sds;

  ListenerTlsCertificate({
    this.acm,
    this.file,
    this.sds,
  });

  factory ListenerTlsCertificate.fromJson(Map<String, dynamic> json) {
    return ListenerTlsCertificate(
      acm: json['acm'] != null
          ? ListenerTlsAcmCertificate.fromJson(
              json['acm'] as Map<String, dynamic>)
          : null,
      file: json['file'] != null
          ? ListenerTlsFileCertificate.fromJson(
              json['file'] as Map<String, dynamic>)
          : null,
      sds: json['sds'] != null
          ? ListenerTlsSdsCertificate.fromJson(
              json['sds'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final acm = this.acm;
    final file = this.file;
    final sds = this.sds;
    return {
      if (acm != null) 'acm': acm,
      if (file != null) 'file': file,
      if (sds != null) 'sds': sds,
    };
  }
}

/// An object that represents a local file certificate. The certificate must
/// meet specific requirements and you must have proxy authorization enabled.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html#virtual-node-tls-prerequisites">Transport
/// Layer Security (TLS)</a>.
class ListenerTlsFileCertificate {
  /// The certificate chain for the certificate.
  final String certificateChain;

  /// The private key for a certificate stored on the file system of the virtual
  /// node that the proxy is running on.
  final String privateKey;

  ListenerTlsFileCertificate({
    required this.certificateChain,
    required this.privateKey,
  });

  factory ListenerTlsFileCertificate.fromJson(Map<String, dynamic> json) {
    return ListenerTlsFileCertificate(
      certificateChain: json['certificateChain'] as String,
      privateKey: json['privateKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateChain = this.certificateChain;
    final privateKey = this.privateKey;
    return {
      'certificateChain': certificateChain,
      'privateKey': privateKey,
    };
  }
}

enum ListenerTlsMode {
  strict,
  permissive,
  disabled,
}

extension ListenerTlsModeValueExtension on ListenerTlsMode {
  String toValue() {
    switch (this) {
      case ListenerTlsMode.strict:
        return 'STRICT';
      case ListenerTlsMode.permissive:
        return 'PERMISSIVE';
      case ListenerTlsMode.disabled:
        return 'DISABLED';
    }
  }
}

extension ListenerTlsModeFromString on String {
  ListenerTlsMode toListenerTlsMode() {
    switch (this) {
      case 'STRICT':
        return ListenerTlsMode.strict;
      case 'PERMISSIVE':
        return ListenerTlsMode.permissive;
      case 'DISABLED':
        return ListenerTlsMode.disabled;
    }
    throw Exception('$this is not known in enum ListenerTlsMode');
  }
}

/// An object that represents the listener's Secret Discovery Service
/// certificate. The proxy must be configured with a local SDS provider via a
/// Unix Domain Socket. See App Mesh <a
/// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html">TLS
/// documentation</a> for more info.
class ListenerTlsSdsCertificate {
  /// A reference to an object that represents the name of the secret requested
  /// from the Secret Discovery Service provider representing Transport Layer
  /// Security (TLS) materials like a certificate or certificate chain.
  final String secretName;

  ListenerTlsSdsCertificate({
    required this.secretName,
  });

  factory ListenerTlsSdsCertificate.fromJson(Map<String, dynamic> json) {
    return ListenerTlsSdsCertificate(
      secretName: json['secretName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final secretName = this.secretName;
    return {
      'secretName': secretName,
    };
  }
}

/// An object that represents a listener's Transport Layer Security (TLS)
/// validation context.
class ListenerTlsValidationContext {
  /// A reference to where to retrieve the trust chain when validating a peer’s
  /// Transport Layer Security (TLS) certificate.
  final ListenerTlsValidationContextTrust trust;

  /// A reference to an object that represents the SANs for a listener's Transport
  /// Layer Security (TLS) validation context.
  final SubjectAlternativeNames? subjectAlternativeNames;

  ListenerTlsValidationContext({
    required this.trust,
    this.subjectAlternativeNames,
  });

  factory ListenerTlsValidationContext.fromJson(Map<String, dynamic> json) {
    return ListenerTlsValidationContext(
      trust: ListenerTlsValidationContextTrust.fromJson(
          json['trust'] as Map<String, dynamic>),
      subjectAlternativeNames: json['subjectAlternativeNames'] != null
          ? SubjectAlternativeNames.fromJson(
              json['subjectAlternativeNames'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final trust = this.trust;
    final subjectAlternativeNames = this.subjectAlternativeNames;
    return {
      'trust': trust,
      if (subjectAlternativeNames != null)
        'subjectAlternativeNames': subjectAlternativeNames,
    };
  }
}

/// An object that represents a listener's Transport Layer Security (TLS)
/// validation context trust.
class ListenerTlsValidationContextTrust {
  /// An object that represents a Transport Layer Security (TLS) validation
  /// context trust for a local file.
  final TlsValidationContextFileTrust? file;

  /// A reference to an object that represents a listener's Transport Layer
  /// Security (TLS) Secret Discovery Service validation context trust.
  final TlsValidationContextSdsTrust? sds;

  ListenerTlsValidationContextTrust({
    this.file,
    this.sds,
  });

  factory ListenerTlsValidationContextTrust.fromJson(
      Map<String, dynamic> json) {
    return ListenerTlsValidationContextTrust(
      file: json['file'] != null
          ? TlsValidationContextFileTrust.fromJson(
              json['file'] as Map<String, dynamic>)
          : null,
      sds: json['sds'] != null
          ? TlsValidationContextSdsTrust.fromJson(
              json['sds'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final file = this.file;
    final sds = this.sds;
    return {
      if (file != null) 'file': file,
      if (sds != null) 'sds': sds,
    };
  }
}

/// An object that represents the logging information for a virtual node.
class Logging {
  /// The access log configuration for a virtual node.
  final AccessLog? accessLog;

  Logging({
    this.accessLog,
  });

  factory Logging.fromJson(Map<String, dynamic> json) {
    return Logging(
      accessLog: json['accessLog'] != null
          ? AccessLog.fromJson(json['accessLog'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessLog = this.accessLog;
    return {
      if (accessLog != null) 'accessLog': accessLog,
    };
  }
}

/// An object that represents the format for the logs.
class LoggingFormat {
  /// <p/>
  final List<JsonFormatRef>? json;

  /// <p/>
  final String? text;

  LoggingFormat({
    this.json,
    this.text,
  });

  factory LoggingFormat.fromJson(Map<String, dynamic> json) {
    return LoggingFormat(
      json: (json['json'] as List?)
          ?.whereNotNull()
          .map((e) => JsonFormatRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final json = this.json;
    final text = this.text;
    return {
      if (json != null) 'json': json,
      if (text != null) 'text': text,
    };
  }
}

/// An object that represents the range of values to match on. The first
/// character of the range is included in the range, though the last character
/// is not. For example, if the range specified were 1-100, only values 1-99
/// would be matched.
class MatchRange {
  /// The end of the range.
  final int end;

  /// The start of the range.
  final int start;

  MatchRange({
    required this.end,
    required this.start,
  });

  factory MatchRange.fromJson(Map<String, dynamic> json) {
    return MatchRange(
      end: json['end'] as int,
      start: json['start'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      'end': end,
      'start': start,
    };
  }
}

/// An object that represents a service mesh returned by a describe operation.
class MeshData {
  /// The name of the service mesh.
  final String meshName;

  /// The associated metadata for the service mesh.
  final ResourceMetadata metadata;

  /// The associated specification for the service mesh.
  final MeshSpec spec;

  /// The status of the service mesh.
  final MeshStatus status;

  MeshData({
    required this.meshName,
    required this.metadata,
    required this.spec,
    required this.status,
  });

  factory MeshData.fromJson(Map<String, dynamic> json) {
    return MeshData(
      meshName: json['meshName'] as String,
      metadata:
          ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      spec: MeshSpec.fromJson(json['spec'] as Map<String, dynamic>),
      status: MeshStatus.fromJson(json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final meshName = this.meshName;
    final metadata = this.metadata;
    final spec = this.spec;
    final status = this.status;
    return {
      'meshName': meshName,
      'metadata': metadata,
      'spec': spec,
      'status': status,
    };
  }
}

/// An object that represents a service mesh returned by a list operation.
class MeshRef {
  /// The full Amazon Resource Name (ARN) of the service mesh.
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  final DateTime lastUpdatedAt;

  /// The name of the service mesh.
  final String meshName;

  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared the
  /// mesh with your account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String meshOwner;

  /// The Amazon Web Services IAM account ID of the resource owner. If the account
  /// ID is not your own, then it's the ID of the mesh owner or of another account
  /// that the mesh is shared with. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String resourceOwner;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  final int version;

  MeshRef({
    required this.arn,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.meshName,
    required this.meshOwner,
    required this.resourceOwner,
    required this.version,
  });

  factory MeshRef.fromJson(Map<String, dynamic> json) {
    return MeshRef(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['lastUpdatedAt'] as Object),
      meshName: json['meshName'] as String,
      meshOwner: json['meshOwner'] as String,
      resourceOwner: json['resourceOwner'] as String,
      version: json['version'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final meshName = this.meshName;
    final meshOwner = this.meshOwner;
    final resourceOwner = this.resourceOwner;
    final version = this.version;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'meshName': meshName,
      'meshOwner': meshOwner,
      'resourceOwner': resourceOwner,
      'version': version,
    };
  }
}

/// An object that represents the service discovery information for a service
/// mesh.
class MeshServiceDiscovery {
  /// The IP version to use to control traffic within the mesh.
  final IpPreference? ipPreference;

  MeshServiceDiscovery({
    this.ipPreference,
  });

  factory MeshServiceDiscovery.fromJson(Map<String, dynamic> json) {
    return MeshServiceDiscovery(
      ipPreference: (json['ipPreference'] as String?)?.toIpPreference(),
    );
  }

  Map<String, dynamic> toJson() {
    final ipPreference = this.ipPreference;
    return {
      if (ipPreference != null) 'ipPreference': ipPreference.toValue(),
    };
  }
}

/// An object that represents the specification of a service mesh.
class MeshSpec {
  /// The egress filter rules for the service mesh.
  final EgressFilter? egressFilter;
  final MeshServiceDiscovery? serviceDiscovery;

  MeshSpec({
    this.egressFilter,
    this.serviceDiscovery,
  });

  factory MeshSpec.fromJson(Map<String, dynamic> json) {
    return MeshSpec(
      egressFilter: json['egressFilter'] != null
          ? EgressFilter.fromJson(json['egressFilter'] as Map<String, dynamic>)
          : null,
      serviceDiscovery: json['serviceDiscovery'] != null
          ? MeshServiceDiscovery.fromJson(
              json['serviceDiscovery'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final egressFilter = this.egressFilter;
    final serviceDiscovery = this.serviceDiscovery;
    return {
      if (egressFilter != null) 'egressFilter': egressFilter,
      if (serviceDiscovery != null) 'serviceDiscovery': serviceDiscovery,
    };
  }
}

/// An object that represents the status of a service mesh.
class MeshStatus {
  /// The current mesh status.
  final MeshStatusCode? status;

  MeshStatus({
    this.status,
  });

  factory MeshStatus.fromJson(Map<String, dynamic> json) {
    return MeshStatus(
      status: (json['status'] as String?)?.toMeshStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum MeshStatusCode {
  active,
  inactive,
  deleted,
}

extension MeshStatusCodeValueExtension on MeshStatusCode {
  String toValue() {
    switch (this) {
      case MeshStatusCode.active:
        return 'ACTIVE';
      case MeshStatusCode.inactive:
        return 'INACTIVE';
      case MeshStatusCode.deleted:
        return 'DELETED';
    }
  }
}

extension MeshStatusCodeFromString on String {
  MeshStatusCode toMeshStatusCode() {
    switch (this) {
      case 'ACTIVE':
        return MeshStatusCode.active;
      case 'INACTIVE':
        return MeshStatusCode.inactive;
      case 'DELETED':
        return MeshStatusCode.deleted;
    }
    throw Exception('$this is not known in enum MeshStatusCode');
  }
}

/// An object that represents the outlier detection for a virtual node's
/// listener.
class OutlierDetection {
  /// The base amount of time for which a host is ejected.
  final Duration baseEjectionDuration;

  /// The time interval between ejection sweep analysis.
  final Duration interval;

  /// Maximum percentage of hosts in load balancing pool for upstream service that
  /// can be ejected. Will eject at least one host regardless of the value.
  final int maxEjectionPercent;

  /// Number of consecutive <code>5xx</code> errors required for ejection.
  final int maxServerErrors;

  OutlierDetection({
    required this.baseEjectionDuration,
    required this.interval,
    required this.maxEjectionPercent,
    required this.maxServerErrors,
  });

  factory OutlierDetection.fromJson(Map<String, dynamic> json) {
    return OutlierDetection(
      baseEjectionDuration: Duration.fromJson(
          json['baseEjectionDuration'] as Map<String, dynamic>),
      interval: Duration.fromJson(json['interval'] as Map<String, dynamic>),
      maxEjectionPercent: json['maxEjectionPercent'] as int,
      maxServerErrors: json['maxServerErrors'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final baseEjectionDuration = this.baseEjectionDuration;
    final interval = this.interval;
    final maxEjectionPercent = this.maxEjectionPercent;
    final maxServerErrors = this.maxServerErrors;
    return {
      'baseEjectionDuration': baseEjectionDuration,
      'interval': interval,
      'maxEjectionPercent': maxEjectionPercent,
      'maxServerErrors': maxServerErrors,
    };
  }
}

/// An object that represents a port mapping.
class PortMapping {
  /// The port used for the port mapping.
  final int port;

  /// The protocol used for the port mapping. Specify one protocol.
  final PortProtocol protocol;

  PortMapping({
    required this.port,
    required this.protocol,
  });

  factory PortMapping.fromJson(Map<String, dynamic> json) {
    return PortMapping(
      port: json['port'] as int,
      protocol: (json['protocol'] as String).toPortProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final protocol = this.protocol;
    return {
      'port': port,
      'protocol': protocol.toValue(),
    };
  }
}

enum PortProtocol {
  http,
  tcp,
  http2,
  grpc,
}

extension PortProtocolValueExtension on PortProtocol {
  String toValue() {
    switch (this) {
      case PortProtocol.http:
        return 'http';
      case PortProtocol.tcp:
        return 'tcp';
      case PortProtocol.http2:
        return 'http2';
      case PortProtocol.grpc:
        return 'grpc';
    }
  }
}

extension PortProtocolFromString on String {
  PortProtocol toPortProtocol() {
    switch (this) {
      case 'http':
        return PortProtocol.http;
      case 'tcp':
        return PortProtocol.tcp;
      case 'http2':
        return PortProtocol.http2;
      case 'grpc':
        return PortProtocol.grpc;
    }
    throw Exception('$this is not known in enum PortProtocol');
  }
}

/// An object representing the query parameter to match.
class QueryParameterMatch {
  /// The exact query parameter to match on.
  final String? exact;

  QueryParameterMatch({
    this.exact,
  });

  factory QueryParameterMatch.fromJson(Map<String, dynamic> json) {
    return QueryParameterMatch(
      exact: json['exact'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exact = this.exact;
    return {
      if (exact != null) 'exact': exact,
    };
  }
}

/// An object that represents metadata for a resource.
class ResourceMetadata {
  /// The full Amazon Resource Name (ARN) for the resource.
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  final DateTime lastUpdatedAt;

  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared the
  /// mesh with your account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String meshOwner;

  /// The Amazon Web Services IAM account ID of the resource owner. If the account
  /// ID is not your own, then it's the ID of the mesh owner or of another account
  /// that the mesh is shared with. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String resourceOwner;

  /// The unique identifier for the resource.
  final String uid;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  final int version;

  ResourceMetadata({
    required this.arn,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.meshOwner,
    required this.resourceOwner,
    required this.uid,
    required this.version,
  });

  factory ResourceMetadata.fromJson(Map<String, dynamic> json) {
    return ResourceMetadata(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['lastUpdatedAt'] as Object),
      meshOwner: json['meshOwner'] as String,
      resourceOwner: json['resourceOwner'] as String,
      uid: json['uid'] as String,
      version: json['version'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final meshOwner = this.meshOwner;
    final resourceOwner = this.resourceOwner;
    final uid = this.uid;
    final version = this.version;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'meshOwner': meshOwner,
      'resourceOwner': resourceOwner,
      'uid': uid,
      'version': version,
    };
  }
}

/// An object that represents a route returned by a describe operation.
class RouteData {
  /// The name of the service mesh that the route resides in.
  final String meshName;

  /// The associated metadata for the route.
  final ResourceMetadata metadata;

  /// The name of the route.
  final String routeName;

  /// The specifications of the route.
  final RouteSpec spec;

  /// The status of the route.
  final RouteStatus status;

  /// The virtual router that the route is associated with.
  final String virtualRouterName;

  RouteData({
    required this.meshName,
    required this.metadata,
    required this.routeName,
    required this.spec,
    required this.status,
    required this.virtualRouterName,
  });

  factory RouteData.fromJson(Map<String, dynamic> json) {
    return RouteData(
      meshName: json['meshName'] as String,
      metadata:
          ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      routeName: json['routeName'] as String,
      spec: RouteSpec.fromJson(json['spec'] as Map<String, dynamic>),
      status: RouteStatus.fromJson(json['status'] as Map<String, dynamic>),
      virtualRouterName: json['virtualRouterName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final meshName = this.meshName;
    final metadata = this.metadata;
    final routeName = this.routeName;
    final spec = this.spec;
    final status = this.status;
    final virtualRouterName = this.virtualRouterName;
    return {
      'meshName': meshName,
      'metadata': metadata,
      'routeName': routeName,
      'spec': spec,
      'status': status,
      'virtualRouterName': virtualRouterName,
    };
  }
}

/// An object that represents a route returned by a list operation.
class RouteRef {
  /// The full Amazon Resource Name (ARN) for the route.
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  final DateTime lastUpdatedAt;

  /// The name of the service mesh that the route resides in.
  final String meshName;

  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared the
  /// mesh with your account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String meshOwner;

  /// The Amazon Web Services IAM account ID of the resource owner. If the account
  /// ID is not your own, then it's the ID of the mesh owner or of another account
  /// that the mesh is shared with. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String resourceOwner;

  /// The name of the route.
  final String routeName;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  final int version;

  /// The virtual router that the route is associated with.
  final String virtualRouterName;

  RouteRef({
    required this.arn,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.meshName,
    required this.meshOwner,
    required this.resourceOwner,
    required this.routeName,
    required this.version,
    required this.virtualRouterName,
  });

  factory RouteRef.fromJson(Map<String, dynamic> json) {
    return RouteRef(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['lastUpdatedAt'] as Object),
      meshName: json['meshName'] as String,
      meshOwner: json['meshOwner'] as String,
      resourceOwner: json['resourceOwner'] as String,
      routeName: json['routeName'] as String,
      version: json['version'] as int,
      virtualRouterName: json['virtualRouterName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final meshName = this.meshName;
    final meshOwner = this.meshOwner;
    final resourceOwner = this.resourceOwner;
    final routeName = this.routeName;
    final version = this.version;
    final virtualRouterName = this.virtualRouterName;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'meshName': meshName,
      'meshOwner': meshOwner,
      'resourceOwner': resourceOwner,
      'routeName': routeName,
      'version': version,
      'virtualRouterName': virtualRouterName,
    };
  }
}

/// An object that represents a route specification. Specify one route type.
class RouteSpec {
  /// An object that represents the specification of a gRPC route.
  final GrpcRoute? grpcRoute;

  /// An object that represents the specification of an HTTP/2 route.
  final HttpRoute? http2Route;

  /// An object that represents the specification of an HTTP route.
  final HttpRoute? httpRoute;

  /// The priority for the route. Routes are matched based on the specified value,
  /// where 0 is the highest priority.
  final int? priority;

  /// An object that represents the specification of a TCP route.
  final TcpRoute? tcpRoute;

  RouteSpec({
    this.grpcRoute,
    this.http2Route,
    this.httpRoute,
    this.priority,
    this.tcpRoute,
  });

  factory RouteSpec.fromJson(Map<String, dynamic> json) {
    return RouteSpec(
      grpcRoute: json['grpcRoute'] != null
          ? GrpcRoute.fromJson(json['grpcRoute'] as Map<String, dynamic>)
          : null,
      http2Route: json['http2Route'] != null
          ? HttpRoute.fromJson(json['http2Route'] as Map<String, dynamic>)
          : null,
      httpRoute: json['httpRoute'] != null
          ? HttpRoute.fromJson(json['httpRoute'] as Map<String, dynamic>)
          : null,
      priority: json['priority'] as int?,
      tcpRoute: json['tcpRoute'] != null
          ? TcpRoute.fromJson(json['tcpRoute'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final grpcRoute = this.grpcRoute;
    final http2Route = this.http2Route;
    final httpRoute = this.httpRoute;
    final priority = this.priority;
    final tcpRoute = this.tcpRoute;
    return {
      if (grpcRoute != null) 'grpcRoute': grpcRoute,
      if (http2Route != null) 'http2Route': http2Route,
      if (httpRoute != null) 'httpRoute': httpRoute,
      if (priority != null) 'priority': priority,
      if (tcpRoute != null) 'tcpRoute': tcpRoute,
    };
  }
}

/// An object that represents the current status of a route.
class RouteStatus {
  /// The current status for the route.
  final RouteStatusCode status;

  RouteStatus({
    required this.status,
  });

  factory RouteStatus.fromJson(Map<String, dynamic> json) {
    return RouteStatus(
      status: (json['status'] as String).toRouteStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

enum RouteStatusCode {
  active,
  inactive,
  deleted,
}

extension RouteStatusCodeValueExtension on RouteStatusCode {
  String toValue() {
    switch (this) {
      case RouteStatusCode.active:
        return 'ACTIVE';
      case RouteStatusCode.inactive:
        return 'INACTIVE';
      case RouteStatusCode.deleted:
        return 'DELETED';
    }
  }
}

extension RouteStatusCodeFromString on String {
  RouteStatusCode toRouteStatusCode() {
    switch (this) {
      case 'ACTIVE':
        return RouteStatusCode.active;
      case 'INACTIVE':
        return RouteStatusCode.inactive;
      case 'DELETED':
        return RouteStatusCode.deleted;
    }
    throw Exception('$this is not known in enum RouteStatusCode');
  }
}

/// An object that represents the service discovery information for a virtual
/// node.
class ServiceDiscovery {
  /// Specifies any Cloud Map information for the virtual node.
  final AwsCloudMapServiceDiscovery? awsCloudMap;

  /// Specifies the DNS information for the virtual node.
  final DnsServiceDiscovery? dns;

  ServiceDiscovery({
    this.awsCloudMap,
    this.dns,
  });

  factory ServiceDiscovery.fromJson(Map<String, dynamic> json) {
    return ServiceDiscovery(
      awsCloudMap: json['awsCloudMap'] != null
          ? AwsCloudMapServiceDiscovery.fromJson(
              json['awsCloudMap'] as Map<String, dynamic>)
          : null,
      dns: json['dns'] != null
          ? DnsServiceDiscovery.fromJson(json['dns'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsCloudMap = this.awsCloudMap;
    final dns = this.dns;
    return {
      if (awsCloudMap != null) 'awsCloudMap': awsCloudMap,
      if (dns != null) 'dns': dns,
    };
  }
}

/// An object that represents the methods by which a subject alternative name on
/// a peer Transport Layer Security (TLS) certificate can be matched.
class SubjectAlternativeNameMatchers {
  /// The values sent must match the specified values exactly.
  final List<String> exact;

  SubjectAlternativeNameMatchers({
    required this.exact,
  });

  factory SubjectAlternativeNameMatchers.fromJson(Map<String, dynamic> json) {
    return SubjectAlternativeNameMatchers(
      exact: (json['exact'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final exact = this.exact;
    return {
      'exact': exact,
    };
  }
}

/// An object that represents the subject alternative names secured by the
/// certificate.
class SubjectAlternativeNames {
  /// An object that represents the criteria for determining a SANs match.
  final SubjectAlternativeNameMatchers match;

  SubjectAlternativeNames({
    required this.match,
  });

  factory SubjectAlternativeNames.fromJson(Map<String, dynamic> json) {
    return SubjectAlternativeNames(
      match: SubjectAlternativeNameMatchers.fromJson(
          json['match'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final match = this.match;
    return {
      'match': match,
    };
  }
}

/// Optional metadata that you apply to a resource to assist with categorization
/// and organization. Each tag consists of a key and an optional value, both of
/// which you define. Tag keys can have a maximum character length of 128
/// characters, and tag values can have a maximum length of 256 characters.
class TagRef {
  /// One part of a key-value pair that make up a tag. A <code>key</code> is a
  /// general label that acts like a category for more specific tag values.
  final String key;

  /// The optional part of a key-value pair that make up a tag. A
  /// <code>value</code> acts as a descriptor within a tag category (key).
  final String value;

  TagRef({
    required this.key,
    required this.value,
  });

  factory TagRef.fromJson(Map<String, dynamic> json) {
    return TagRef(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum TcpRetryPolicyEvent {
  connectionError,
}

extension TcpRetryPolicyEventValueExtension on TcpRetryPolicyEvent {
  String toValue() {
    switch (this) {
      case TcpRetryPolicyEvent.connectionError:
        return 'connection-error';
    }
  }
}

extension TcpRetryPolicyEventFromString on String {
  TcpRetryPolicyEvent toTcpRetryPolicyEvent() {
    switch (this) {
      case 'connection-error':
        return TcpRetryPolicyEvent.connectionError;
    }
    throw Exception('$this is not known in enum TcpRetryPolicyEvent');
  }
}

/// An object that represents a TCP route type.
class TcpRoute {
  /// The action to take if a match is determined.
  final TcpRouteAction action;

  /// An object that represents the criteria for determining a request match.
  final TcpRouteMatch? match;

  /// An object that represents types of timeouts.
  final TcpTimeout? timeout;

  TcpRoute({
    required this.action,
    this.match,
    this.timeout,
  });

  factory TcpRoute.fromJson(Map<String, dynamic> json) {
    return TcpRoute(
      action: TcpRouteAction.fromJson(json['action'] as Map<String, dynamic>),
      match: json['match'] != null
          ? TcpRouteMatch.fromJson(json['match'] as Map<String, dynamic>)
          : null,
      timeout: json['timeout'] != null
          ? TcpTimeout.fromJson(json['timeout'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    final timeout = this.timeout;
    return {
      'action': action,
      if (match != null) 'match': match,
      if (timeout != null) 'timeout': timeout,
    };
  }
}

/// An object that represents the action to take if a match is determined.
class TcpRouteAction {
  /// An object that represents the targets that traffic is routed to when a
  /// request matches the route.
  final List<WeightedTarget> weightedTargets;

  TcpRouteAction({
    required this.weightedTargets,
  });

  factory TcpRouteAction.fromJson(Map<String, dynamic> json) {
    return TcpRouteAction(
      weightedTargets: (json['weightedTargets'] as List)
          .whereNotNull()
          .map((e) => WeightedTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final weightedTargets = this.weightedTargets;
    return {
      'weightedTargets': weightedTargets,
    };
  }
}

/// An object representing the TCP route to match.
class TcpRouteMatch {
  /// The port number to match on.
  final int? port;

  TcpRouteMatch({
    this.port,
  });

  factory TcpRouteMatch.fromJson(Map<String, dynamic> json) {
    return TcpRouteMatch(
      port: json['port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    return {
      if (port != null) 'port': port,
    };
  }
}

/// An object that represents types of timeouts.
class TcpTimeout {
  /// An object that represents an idle timeout. An idle timeout bounds the amount
  /// of time that a connection may be idle. The default value is none.
  final Duration? idle;

  TcpTimeout({
    this.idle,
  });

  factory TcpTimeout.fromJson(Map<String, dynamic> json) {
    return TcpTimeout(
      idle: json['idle'] != null
          ? Duration.fromJson(json['idle'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final idle = this.idle;
    return {
      if (idle != null) 'idle': idle,
    };
  }
}

/// An object that represents how the proxy will validate its peer during
/// Transport Layer Security (TLS) negotiation.
class TlsValidationContext {
  /// A reference to where to retrieve the trust chain when validating a peer’s
  /// Transport Layer Security (TLS) certificate.
  final TlsValidationContextTrust trust;

  /// A reference to an object that represents the SANs for a Transport Layer
  /// Security (TLS) validation context. If you don't specify SANs on the
  /// <i>terminating</i> mesh endpoint, the Envoy proxy for that node doesn't
  /// verify the SAN on a peer client certificate. If you don't specify SANs on
  /// the <i>originating</i> mesh endpoint, the SAN on the certificate provided by
  /// the terminating endpoint must match the mesh endpoint service discovery
  /// configuration. Since SPIRE vended certificates have a SPIFFE ID as a name,
  /// you must set the SAN since the name doesn't match the service discovery
  /// name.
  final SubjectAlternativeNames? subjectAlternativeNames;

  TlsValidationContext({
    required this.trust,
    this.subjectAlternativeNames,
  });

  factory TlsValidationContext.fromJson(Map<String, dynamic> json) {
    return TlsValidationContext(
      trust: TlsValidationContextTrust.fromJson(
          json['trust'] as Map<String, dynamic>),
      subjectAlternativeNames: json['subjectAlternativeNames'] != null
          ? SubjectAlternativeNames.fromJson(
              json['subjectAlternativeNames'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final trust = this.trust;
    final subjectAlternativeNames = this.subjectAlternativeNames;
    return {
      'trust': trust,
      if (subjectAlternativeNames != null)
        'subjectAlternativeNames': subjectAlternativeNames,
    };
  }
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context trust for an Certificate Manager certificate.
class TlsValidationContextAcmTrust {
  /// One or more ACM Amazon Resource Name (ARN)s.
  final List<String> certificateAuthorityArns;

  TlsValidationContextAcmTrust({
    required this.certificateAuthorityArns,
  });

  factory TlsValidationContextAcmTrust.fromJson(Map<String, dynamic> json) {
    return TlsValidationContextAcmTrust(
      certificateAuthorityArns: (json['certificateAuthorityArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityArns = this.certificateAuthorityArns;
    return {
      'certificateAuthorityArns': certificateAuthorityArns,
    };
  }
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context trust for a local file.
class TlsValidationContextFileTrust {
  /// The certificate trust chain for a certificate stored on the file system of
  /// the virtual node that the proxy is running on.
  final String certificateChain;

  TlsValidationContextFileTrust({
    required this.certificateChain,
  });

  factory TlsValidationContextFileTrust.fromJson(Map<String, dynamic> json) {
    return TlsValidationContextFileTrust(
      certificateChain: json['certificateChain'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateChain = this.certificateChain;
    return {
      'certificateChain': certificateChain,
    };
  }
}

/// An object that represents a Transport Layer Security (TLS) Secret Discovery
/// Service validation context trust. The proxy must be configured with a local
/// SDS provider via a Unix Domain Socket. See App Mesh <a
/// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html">TLS
/// documentation</a> for more info.
class TlsValidationContextSdsTrust {
  /// A reference to an object that represents the name of the secret for a
  /// Transport Layer Security (TLS) Secret Discovery Service validation context
  /// trust.
  final String secretName;

  TlsValidationContextSdsTrust({
    required this.secretName,
  });

  factory TlsValidationContextSdsTrust.fromJson(Map<String, dynamic> json) {
    return TlsValidationContextSdsTrust(
      secretName: json['secretName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final secretName = this.secretName;
    return {
      'secretName': secretName,
    };
  }
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context trust.
class TlsValidationContextTrust {
  /// A reference to an object that represents a Transport Layer Security (TLS)
  /// validation context trust for an Certificate Manager certificate.
  final TlsValidationContextAcmTrust? acm;

  /// An object that represents a Transport Layer Security (TLS) validation
  /// context trust for a local file.
  final TlsValidationContextFileTrust? file;

  /// A reference to an object that represents a Transport Layer Security (TLS)
  /// Secret Discovery Service validation context trust.
  final TlsValidationContextSdsTrust? sds;

  TlsValidationContextTrust({
    this.acm,
    this.file,
    this.sds,
  });

  factory TlsValidationContextTrust.fromJson(Map<String, dynamic> json) {
    return TlsValidationContextTrust(
      acm: json['acm'] != null
          ? TlsValidationContextAcmTrust.fromJson(
              json['acm'] as Map<String, dynamic>)
          : null,
      file: json['file'] != null
          ? TlsValidationContextFileTrust.fromJson(
              json['file'] as Map<String, dynamic>)
          : null,
      sds: json['sds'] != null
          ? TlsValidationContextSdsTrust.fromJson(
              json['sds'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final acm = this.acm;
    final file = this.file;
    final sds = this.sds;
    return {
      if (acm != null) 'acm': acm,
      if (file != null) 'file': file,
      if (sds != null) 'sds': sds,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateGatewayRouteOutput {
  /// A full description of the gateway route that was updated.
  final GatewayRouteData gatewayRoute;

  UpdateGatewayRouteOutput({
    required this.gatewayRoute,
  });

  Map<String, dynamic> toJson() {
    final gatewayRoute = this.gatewayRoute;
    return {
      'gatewayRoute': gatewayRoute,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class UpdateMeshOutput {
  final MeshData mesh;

  UpdateMeshOutput({
    required this.mesh,
  });

  Map<String, dynamic> toJson() {
    final mesh = this.mesh;
    return {
      'mesh': mesh,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class UpdateRouteOutput {
  /// A full description of the route that was updated.
  final RouteData route;

  UpdateRouteOutput({
    required this.route,
  });

  Map<String, dynamic> toJson() {
    final route = this.route;
    return {
      'route': route,
    };
  }
}

class UpdateVirtualGatewayOutput {
  /// A full description of the virtual gateway that was updated.
  final VirtualGatewayData virtualGateway;

  UpdateVirtualGatewayOutput({
    required this.virtualGateway,
  });

  Map<String, dynamic> toJson() {
    final virtualGateway = this.virtualGateway;
    return {
      'virtualGateway': virtualGateway,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class UpdateVirtualNodeOutput {
  /// A full description of the virtual node that was updated.
  final VirtualNodeData virtualNode;

  UpdateVirtualNodeOutput({
    required this.virtualNode,
  });

  Map<String, dynamic> toJson() {
    final virtualNode = this.virtualNode;
    return {
      'virtualNode': virtualNode,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class UpdateVirtualRouterOutput {
  /// A full description of the virtual router that was updated.
  final VirtualRouterData virtualRouter;

  UpdateVirtualRouterOutput({
    required this.virtualRouter,
  });

  Map<String, dynamic> toJson() {
    final virtualRouter = this.virtualRouter;
    return {
      'virtualRouter': virtualRouter,
    };
  }
}

/// <zonbook></zonbook><xhtml></xhtml>
class UpdateVirtualServiceOutput {
  /// A full description of the virtual service that was updated.
  final VirtualServiceData virtualService;

  UpdateVirtualServiceOutput({
    required this.virtualService,
  });

  Map<String, dynamic> toJson() {
    final virtualService = this.virtualService;
    return {
      'virtualService': virtualService,
    };
  }
}

/// The access log configuration for a virtual gateway.
class VirtualGatewayAccessLog {
  /// The file object to send virtual gateway access logs to.
  final VirtualGatewayFileAccessLog? file;

  VirtualGatewayAccessLog({
    this.file,
  });

  factory VirtualGatewayAccessLog.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayAccessLog(
      file: json['file'] != null
          ? VirtualGatewayFileAccessLog.fromJson(
              json['file'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final file = this.file;
    return {
      if (file != null) 'file': file,
    };
  }
}

/// An object that represents the default properties for a backend.
class VirtualGatewayBackendDefaults {
  /// A reference to an object that represents a client policy.
  final VirtualGatewayClientPolicy? clientPolicy;

  VirtualGatewayBackendDefaults({
    this.clientPolicy,
  });

  factory VirtualGatewayBackendDefaults.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayBackendDefaults(
      clientPolicy: json['clientPolicy'] != null
          ? VirtualGatewayClientPolicy.fromJson(
              json['clientPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientPolicy = this.clientPolicy;
    return {
      if (clientPolicy != null) 'clientPolicy': clientPolicy,
    };
  }
}

/// An object that represents a client policy.
class VirtualGatewayClientPolicy {
  /// A reference to an object that represents a Transport Layer Security (TLS)
  /// client policy.
  final VirtualGatewayClientPolicyTls? tls;

  VirtualGatewayClientPolicy({
    this.tls,
  });

  factory VirtualGatewayClientPolicy.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayClientPolicy(
      tls: json['tls'] != null
          ? VirtualGatewayClientPolicyTls.fromJson(
              json['tls'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tls = this.tls;
    return {
      if (tls != null) 'tls': tls,
    };
  }
}

/// An object that represents a Transport Layer Security (TLS) client policy.
class VirtualGatewayClientPolicyTls {
  /// A reference to an object that represents a Transport Layer Security (TLS)
  /// validation context.
  final VirtualGatewayTlsValidationContext validation;

  /// A reference to an object that represents a virtual gateway's client's
  /// Transport Layer Security (TLS) certificate.
  final VirtualGatewayClientTlsCertificate? certificate;

  /// Whether the policy is enforced. The default is <code>True</code>, if a value
  /// isn't specified.
  final bool? enforce;

  /// One or more ports that the policy is enforced for.
  final List<int>? ports;

  VirtualGatewayClientPolicyTls({
    required this.validation,
    this.certificate,
    this.enforce,
    this.ports,
  });

  factory VirtualGatewayClientPolicyTls.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayClientPolicyTls(
      validation: VirtualGatewayTlsValidationContext.fromJson(
          json['validation'] as Map<String, dynamic>),
      certificate: json['certificate'] != null
          ? VirtualGatewayClientTlsCertificate.fromJson(
              json['certificate'] as Map<String, dynamic>)
          : null,
      enforce: json['enforce'] as bool?,
      ports: (json['ports'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final validation = this.validation;
    final certificate = this.certificate;
    final enforce = this.enforce;
    final ports = this.ports;
    return {
      'validation': validation,
      if (certificate != null) 'certificate': certificate,
      if (enforce != null) 'enforce': enforce,
      if (ports != null) 'ports': ports,
    };
  }
}

/// An object that represents the virtual gateway's client's Transport Layer
/// Security (TLS) certificate.
class VirtualGatewayClientTlsCertificate {
  /// An object that represents a local file certificate. The certificate must
  /// meet specific requirements and you must have proxy authorization enabled.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html">
  /// Transport Layer Security (TLS) </a>.
  final VirtualGatewayListenerTlsFileCertificate? file;

  /// A reference to an object that represents a virtual gateway's client's Secret
  /// Discovery Service certificate.
  final VirtualGatewayListenerTlsSdsCertificate? sds;

  VirtualGatewayClientTlsCertificate({
    this.file,
    this.sds,
  });

  factory VirtualGatewayClientTlsCertificate.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayClientTlsCertificate(
      file: json['file'] != null
          ? VirtualGatewayListenerTlsFileCertificate.fromJson(
              json['file'] as Map<String, dynamic>)
          : null,
      sds: json['sds'] != null
          ? VirtualGatewayListenerTlsSdsCertificate.fromJson(
              json['sds'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final file = this.file;
    final sds = this.sds;
    return {
      if (file != null) 'file': file,
      if (sds != null) 'sds': sds,
    };
  }
}

/// An object that represents the type of virtual gateway connection pool.
///
/// Only one protocol is used at a time and should be the same protocol as the
/// one chosen under port mapping.
///
/// If not present the default value for <code>maxPendingRequests</code> is
/// <code>2147483647</code>.
class VirtualGatewayConnectionPool {
  /// An object that represents a type of connection pool.
  final VirtualGatewayGrpcConnectionPool? grpc;

  /// An object that represents a type of connection pool.
  final VirtualGatewayHttpConnectionPool? http;

  /// An object that represents a type of connection pool.
  final VirtualGatewayHttp2ConnectionPool? http2;

  VirtualGatewayConnectionPool({
    this.grpc,
    this.http,
    this.http2,
  });

  factory VirtualGatewayConnectionPool.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayConnectionPool(
      grpc: json['grpc'] != null
          ? VirtualGatewayGrpcConnectionPool.fromJson(
              json['grpc'] as Map<String, dynamic>)
          : null,
      http: json['http'] != null
          ? VirtualGatewayHttpConnectionPool.fromJson(
              json['http'] as Map<String, dynamic>)
          : null,
      http2: json['http2'] != null
          ? VirtualGatewayHttp2ConnectionPool.fromJson(
              json['http2'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final grpc = this.grpc;
    final http = this.http;
    final http2 = this.http2;
    return {
      if (grpc != null) 'grpc': grpc,
      if (http != null) 'http': http,
      if (http2 != null) 'http2': http2,
    };
  }
}

/// An object that represents a virtual gateway returned by a describe
/// operation.
class VirtualGatewayData {
  /// The name of the service mesh that the virtual gateway resides in.
  final String meshName;
  final ResourceMetadata metadata;

  /// The specifications of the virtual gateway.
  final VirtualGatewaySpec spec;

  /// The current status of the virtual gateway.
  final VirtualGatewayStatus status;

  /// The name of the virtual gateway.
  final String virtualGatewayName;

  VirtualGatewayData({
    required this.meshName,
    required this.metadata,
    required this.spec,
    required this.status,
    required this.virtualGatewayName,
  });

  factory VirtualGatewayData.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayData(
      meshName: json['meshName'] as String,
      metadata:
          ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      spec: VirtualGatewaySpec.fromJson(json['spec'] as Map<String, dynamic>),
      status:
          VirtualGatewayStatus.fromJson(json['status'] as Map<String, dynamic>),
      virtualGatewayName: json['virtualGatewayName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final meshName = this.meshName;
    final metadata = this.metadata;
    final spec = this.spec;
    final status = this.status;
    final virtualGatewayName = this.virtualGatewayName;
    return {
      'meshName': meshName,
      'metadata': metadata,
      'spec': spec,
      'status': status,
      'virtualGatewayName': virtualGatewayName,
    };
  }
}

/// An object that represents an access log file.
class VirtualGatewayFileAccessLog {
  /// The file path to write access logs to. You can use <code>/dev/stdout</code>
  /// to send access logs to standard out and configure your Envoy container to
  /// use a log driver, such as <code>awslogs</code>, to export the access logs to
  /// a log storage service such as Amazon CloudWatch Logs. You can also specify a
  /// path in the Envoy container's file system to write the files to disk.
  final String path;

  /// The specified format for the virtual gateway access logs. It can be either
  /// <code>json_format</code> or <code>text_format</code>.
  final LoggingFormat? format;

  VirtualGatewayFileAccessLog({
    required this.path,
    this.format,
  });

  factory VirtualGatewayFileAccessLog.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayFileAccessLog(
      path: json['path'] as String,
      format: json['format'] != null
          ? LoggingFormat.fromJson(json['format'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final format = this.format;
    return {
      'path': path,
      if (format != null) 'format': format,
    };
  }
}

/// An object that represents a type of connection pool.
class VirtualGatewayGrpcConnectionPool {
  /// Maximum number of inflight requests Envoy can concurrently support across
  /// hosts in upstream cluster.
  final int maxRequests;

  VirtualGatewayGrpcConnectionPool({
    required this.maxRequests,
  });

  factory VirtualGatewayGrpcConnectionPool.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayGrpcConnectionPool(
      maxRequests: json['maxRequests'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maxRequests = this.maxRequests;
    return {
      'maxRequests': maxRequests,
    };
  }
}

/// An object that represents the health check policy for a virtual gateway's
/// listener.
class VirtualGatewayHealthCheckPolicy {
  /// The number of consecutive successful health checks that must occur before
  /// declaring the listener healthy.
  final int healthyThreshold;

  /// The time period in milliseconds between each health check execution.
  final int intervalMillis;

  /// The protocol for the health check request. If you specify <code>grpc</code>,
  /// then your service must conform to the <a
  /// href="https://github.com/grpc/grpc/blob/master/doc/health-checking.md">GRPC
  /// Health Checking Protocol</a>.
  final VirtualGatewayPortProtocol protocol;

  /// The amount of time to wait when receiving a response from the health check,
  /// in milliseconds.
  final int timeoutMillis;

  /// The number of consecutive failed health checks that must occur before
  /// declaring a virtual gateway unhealthy.
  final int unhealthyThreshold;

  /// The destination path for the health check request. This value is only used
  /// if the specified protocol is HTTP or HTTP/2. For any other protocol, this
  /// value is ignored.
  final String? path;

  /// The destination port for the health check request. This port must match the
  /// port defined in the <a>PortMapping</a> for the listener.
  final int? port;

  VirtualGatewayHealthCheckPolicy({
    required this.healthyThreshold,
    required this.intervalMillis,
    required this.protocol,
    required this.timeoutMillis,
    required this.unhealthyThreshold,
    this.path,
    this.port,
  });

  factory VirtualGatewayHealthCheckPolicy.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayHealthCheckPolicy(
      healthyThreshold: json['healthyThreshold'] as int,
      intervalMillis: json['intervalMillis'] as int,
      protocol: (json['protocol'] as String).toVirtualGatewayPortProtocol(),
      timeoutMillis: json['timeoutMillis'] as int,
      unhealthyThreshold: json['unhealthyThreshold'] as int,
      path: json['path'] as String?,
      port: json['port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthyThreshold = this.healthyThreshold;
    final intervalMillis = this.intervalMillis;
    final protocol = this.protocol;
    final timeoutMillis = this.timeoutMillis;
    final unhealthyThreshold = this.unhealthyThreshold;
    final path = this.path;
    final port = this.port;
    return {
      'healthyThreshold': healthyThreshold,
      'intervalMillis': intervalMillis,
      'protocol': protocol.toValue(),
      'timeoutMillis': timeoutMillis,
      'unhealthyThreshold': unhealthyThreshold,
      if (path != null) 'path': path,
      if (port != null) 'port': port,
    };
  }
}

/// An object that represents a type of connection pool.
class VirtualGatewayHttp2ConnectionPool {
  /// Maximum number of inflight requests Envoy can concurrently support across
  /// hosts in upstream cluster.
  final int maxRequests;

  VirtualGatewayHttp2ConnectionPool({
    required this.maxRequests,
  });

  factory VirtualGatewayHttp2ConnectionPool.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayHttp2ConnectionPool(
      maxRequests: json['maxRequests'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maxRequests = this.maxRequests;
    return {
      'maxRequests': maxRequests,
    };
  }
}

/// An object that represents a type of connection pool.
class VirtualGatewayHttpConnectionPool {
  /// Maximum number of outbound TCP connections Envoy can establish concurrently
  /// with all hosts in upstream cluster.
  final int maxConnections;

  /// Number of overflowing requests after <code>max_connections</code> Envoy will
  /// queue to upstream cluster.
  final int? maxPendingRequests;

  VirtualGatewayHttpConnectionPool({
    required this.maxConnections,
    this.maxPendingRequests,
  });

  factory VirtualGatewayHttpConnectionPool.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayHttpConnectionPool(
      maxConnections: json['maxConnections'] as int,
      maxPendingRequests: json['maxPendingRequests'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxConnections = this.maxConnections;
    final maxPendingRequests = this.maxPendingRequests;
    return {
      'maxConnections': maxConnections,
      if (maxPendingRequests != null) 'maxPendingRequests': maxPendingRequests,
    };
  }
}

/// An object that represents a listener for a virtual gateway.
class VirtualGatewayListener {
  /// The port mapping information for the listener.
  final VirtualGatewayPortMapping portMapping;

  /// The connection pool information for the virtual gateway listener.
  final VirtualGatewayConnectionPool? connectionPool;

  /// The health check information for the listener.
  final VirtualGatewayHealthCheckPolicy? healthCheck;

  /// A reference to an object that represents the Transport Layer Security (TLS)
  /// properties for the listener.
  final VirtualGatewayListenerTls? tls;

  VirtualGatewayListener({
    required this.portMapping,
    this.connectionPool,
    this.healthCheck,
    this.tls,
  });

  factory VirtualGatewayListener.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayListener(
      portMapping: VirtualGatewayPortMapping.fromJson(
          json['portMapping'] as Map<String, dynamic>),
      connectionPool: json['connectionPool'] != null
          ? VirtualGatewayConnectionPool.fromJson(
              json['connectionPool'] as Map<String, dynamic>)
          : null,
      healthCheck: json['healthCheck'] != null
          ? VirtualGatewayHealthCheckPolicy.fromJson(
              json['healthCheck'] as Map<String, dynamic>)
          : null,
      tls: json['tls'] != null
          ? VirtualGatewayListenerTls.fromJson(
              json['tls'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final portMapping = this.portMapping;
    final connectionPool = this.connectionPool;
    final healthCheck = this.healthCheck;
    final tls = this.tls;
    return {
      'portMapping': portMapping,
      if (connectionPool != null) 'connectionPool': connectionPool,
      if (healthCheck != null) 'healthCheck': healthCheck,
      if (tls != null) 'tls': tls,
    };
  }
}

/// An object that represents the Transport Layer Security (TLS) properties for
/// a listener.
class VirtualGatewayListenerTls {
  /// An object that represents a Transport Layer Security (TLS) certificate.
  final VirtualGatewayListenerTlsCertificate certificate;

  /// Specify one of the following modes.
  ///
  /// <ul>
  /// <li>
  /// <b/>STRICT – Listener only accepts connections with TLS enabled.
  /// </li>
  /// <li>
  /// <b/>PERMISSIVE – Listener accepts connections with or without TLS enabled.
  /// </li>
  /// <li>
  /// <b/>DISABLED – Listener only accepts connections without TLS.
  /// </li>
  /// </ul>
  final VirtualGatewayListenerTlsMode mode;

  /// A reference to an object that represents a virtual gateway's listener's
  /// Transport Layer Security (TLS) validation context.
  final VirtualGatewayListenerTlsValidationContext? validation;

  VirtualGatewayListenerTls({
    required this.certificate,
    required this.mode,
    this.validation,
  });

  factory VirtualGatewayListenerTls.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayListenerTls(
      certificate: VirtualGatewayListenerTlsCertificate.fromJson(
          json['certificate'] as Map<String, dynamic>),
      mode: (json['mode'] as String).toVirtualGatewayListenerTlsMode(),
      validation: json['validation'] != null
          ? VirtualGatewayListenerTlsValidationContext.fromJson(
              json['validation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    final mode = this.mode;
    final validation = this.validation;
    return {
      'certificate': certificate,
      'mode': mode.toValue(),
      if (validation != null) 'validation': validation,
    };
  }
}

/// An object that represents an Certificate Manager certificate.
class VirtualGatewayListenerTlsAcmCertificate {
  /// The Amazon Resource Name (ARN) for the certificate. The certificate must
  /// meet specific requirements and you must have proxy authorization enabled.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html#virtual-node-tls-prerequisites">Transport
  /// Layer Security (TLS)</a>.
  final String certificateArn;

  VirtualGatewayListenerTlsAcmCertificate({
    required this.certificateArn,
  });

  factory VirtualGatewayListenerTlsAcmCertificate.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayListenerTlsAcmCertificate(
      certificateArn: json['certificateArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    return {
      'certificateArn': certificateArn,
    };
  }
}

/// An object that represents a listener's Transport Layer Security (TLS)
/// certificate.
class VirtualGatewayListenerTlsCertificate {
  /// A reference to an object that represents an Certificate Manager certificate.
  final VirtualGatewayListenerTlsAcmCertificate? acm;

  /// A reference to an object that represents a local file certificate.
  final VirtualGatewayListenerTlsFileCertificate? file;

  /// A reference to an object that represents a virtual gateway's listener's
  /// Secret Discovery Service certificate.
  final VirtualGatewayListenerTlsSdsCertificate? sds;

  VirtualGatewayListenerTlsCertificate({
    this.acm,
    this.file,
    this.sds,
  });

  factory VirtualGatewayListenerTlsCertificate.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayListenerTlsCertificate(
      acm: json['acm'] != null
          ? VirtualGatewayListenerTlsAcmCertificate.fromJson(
              json['acm'] as Map<String, dynamic>)
          : null,
      file: json['file'] != null
          ? VirtualGatewayListenerTlsFileCertificate.fromJson(
              json['file'] as Map<String, dynamic>)
          : null,
      sds: json['sds'] != null
          ? VirtualGatewayListenerTlsSdsCertificate.fromJson(
              json['sds'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final acm = this.acm;
    final file = this.file;
    final sds = this.sds;
    return {
      if (acm != null) 'acm': acm,
      if (file != null) 'file': file,
      if (sds != null) 'sds': sds,
    };
  }
}

/// An object that represents a local file certificate. The certificate must
/// meet specific requirements and you must have proxy authorization enabled.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html#virtual-node-tls-prerequisites">Transport
/// Layer Security (TLS)</a>.
class VirtualGatewayListenerTlsFileCertificate {
  /// The certificate chain for the certificate.
  final String certificateChain;

  /// The private key for a certificate stored on the file system of the mesh
  /// endpoint that the proxy is running on.
  final String privateKey;

  VirtualGatewayListenerTlsFileCertificate({
    required this.certificateChain,
    required this.privateKey,
  });

  factory VirtualGatewayListenerTlsFileCertificate.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayListenerTlsFileCertificate(
      certificateChain: json['certificateChain'] as String,
      privateKey: json['privateKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateChain = this.certificateChain;
    final privateKey = this.privateKey;
    return {
      'certificateChain': certificateChain,
      'privateKey': privateKey,
    };
  }
}

enum VirtualGatewayListenerTlsMode {
  strict,
  permissive,
  disabled,
}

extension VirtualGatewayListenerTlsModeValueExtension
    on VirtualGatewayListenerTlsMode {
  String toValue() {
    switch (this) {
      case VirtualGatewayListenerTlsMode.strict:
        return 'STRICT';
      case VirtualGatewayListenerTlsMode.permissive:
        return 'PERMISSIVE';
      case VirtualGatewayListenerTlsMode.disabled:
        return 'DISABLED';
    }
  }
}

extension VirtualGatewayListenerTlsModeFromString on String {
  VirtualGatewayListenerTlsMode toVirtualGatewayListenerTlsMode() {
    switch (this) {
      case 'STRICT':
        return VirtualGatewayListenerTlsMode.strict;
      case 'PERMISSIVE':
        return VirtualGatewayListenerTlsMode.permissive;
      case 'DISABLED':
        return VirtualGatewayListenerTlsMode.disabled;
    }
    throw Exception('$this is not known in enum VirtualGatewayListenerTlsMode');
  }
}

/// An object that represents the virtual gateway's listener's Secret Discovery
/// Service certificate.The proxy must be configured with a local SDS provider
/// via a Unix Domain Socket. See App Mesh<a
/// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html">TLS
/// documentation</a> for more info.
class VirtualGatewayListenerTlsSdsCertificate {
  /// A reference to an object that represents the name of the secret secret
  /// requested from the Secret Discovery Service provider representing Transport
  /// Layer Security (TLS) materials like a certificate or certificate chain.
  final String secretName;

  VirtualGatewayListenerTlsSdsCertificate({
    required this.secretName,
  });

  factory VirtualGatewayListenerTlsSdsCertificate.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayListenerTlsSdsCertificate(
      secretName: json['secretName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final secretName = this.secretName;
    return {
      'secretName': secretName,
    };
  }
}

/// An object that represents a virtual gateway's listener's Transport Layer
/// Security (TLS) validation context.
class VirtualGatewayListenerTlsValidationContext {
  /// A reference to where to retrieve the trust chain when validating a peer’s
  /// Transport Layer Security (TLS) certificate.
  final VirtualGatewayListenerTlsValidationContextTrust trust;

  /// A reference to an object that represents the SANs for a virtual gateway
  /// listener's Transport Layer Security (TLS) validation context.
  final SubjectAlternativeNames? subjectAlternativeNames;

  VirtualGatewayListenerTlsValidationContext({
    required this.trust,
    this.subjectAlternativeNames,
  });

  factory VirtualGatewayListenerTlsValidationContext.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayListenerTlsValidationContext(
      trust: VirtualGatewayListenerTlsValidationContextTrust.fromJson(
          json['trust'] as Map<String, dynamic>),
      subjectAlternativeNames: json['subjectAlternativeNames'] != null
          ? SubjectAlternativeNames.fromJson(
              json['subjectAlternativeNames'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final trust = this.trust;
    final subjectAlternativeNames = this.subjectAlternativeNames;
    return {
      'trust': trust,
      if (subjectAlternativeNames != null)
        'subjectAlternativeNames': subjectAlternativeNames,
    };
  }
}

/// An object that represents a virtual gateway's listener's Transport Layer
/// Security (TLS) validation context trust.
class VirtualGatewayListenerTlsValidationContextTrust {
  /// An object that represents a Transport Layer Security (TLS) validation
  /// context trust for a local file.
  final VirtualGatewayTlsValidationContextFileTrust? file;

  /// A reference to an object that represents a virtual gateway's listener's
  /// Transport Layer Security (TLS) Secret Discovery Service validation context
  /// trust.
  final VirtualGatewayTlsValidationContextSdsTrust? sds;

  VirtualGatewayListenerTlsValidationContextTrust({
    this.file,
    this.sds,
  });

  factory VirtualGatewayListenerTlsValidationContextTrust.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayListenerTlsValidationContextTrust(
      file: json['file'] != null
          ? VirtualGatewayTlsValidationContextFileTrust.fromJson(
              json['file'] as Map<String, dynamic>)
          : null,
      sds: json['sds'] != null
          ? VirtualGatewayTlsValidationContextSdsTrust.fromJson(
              json['sds'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final file = this.file;
    final sds = this.sds;
    return {
      if (file != null) 'file': file,
      if (sds != null) 'sds': sds,
    };
  }
}

/// An object that represents logging information.
class VirtualGatewayLogging {
  /// The access log configuration.
  final VirtualGatewayAccessLog? accessLog;

  VirtualGatewayLogging({
    this.accessLog,
  });

  factory VirtualGatewayLogging.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayLogging(
      accessLog: json['accessLog'] != null
          ? VirtualGatewayAccessLog.fromJson(
              json['accessLog'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessLog = this.accessLog;
    return {
      if (accessLog != null) 'accessLog': accessLog,
    };
  }
}

/// An object that represents a port mapping.
class VirtualGatewayPortMapping {
  /// The port used for the port mapping. Specify one protocol.
  final int port;

  /// The protocol used for the port mapping.
  final VirtualGatewayPortProtocol protocol;

  VirtualGatewayPortMapping({
    required this.port,
    required this.protocol,
  });

  factory VirtualGatewayPortMapping.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayPortMapping(
      port: json['port'] as int,
      protocol: (json['protocol'] as String).toVirtualGatewayPortProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final protocol = this.protocol;
    return {
      'port': port,
      'protocol': protocol.toValue(),
    };
  }
}

enum VirtualGatewayPortProtocol {
  http,
  http2,
  grpc,
}

extension VirtualGatewayPortProtocolValueExtension
    on VirtualGatewayPortProtocol {
  String toValue() {
    switch (this) {
      case VirtualGatewayPortProtocol.http:
        return 'http';
      case VirtualGatewayPortProtocol.http2:
        return 'http2';
      case VirtualGatewayPortProtocol.grpc:
        return 'grpc';
    }
  }
}

extension VirtualGatewayPortProtocolFromString on String {
  VirtualGatewayPortProtocol toVirtualGatewayPortProtocol() {
    switch (this) {
      case 'http':
        return VirtualGatewayPortProtocol.http;
      case 'http2':
        return VirtualGatewayPortProtocol.http2;
      case 'grpc':
        return VirtualGatewayPortProtocol.grpc;
    }
    throw Exception('$this is not known in enum VirtualGatewayPortProtocol');
  }
}

/// An object that represents a virtual gateway returned by a list operation.
class VirtualGatewayRef {
  /// The full Amazon Resource Name (ARN) for the resource.
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  final DateTime lastUpdatedAt;

  /// The name of the service mesh that the resource resides in.
  final String meshName;

  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared the
  /// mesh with your account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String meshOwner;

  /// The Amazon Web Services IAM account ID of the resource owner. If the account
  /// ID is not your own, then it's the ID of the mesh owner or of another account
  /// that the mesh is shared with. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String resourceOwner;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  final int version;

  /// The name of the resource.
  final String virtualGatewayName;

  VirtualGatewayRef({
    required this.arn,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.meshName,
    required this.meshOwner,
    required this.resourceOwner,
    required this.version,
    required this.virtualGatewayName,
  });

  factory VirtualGatewayRef.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayRef(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['lastUpdatedAt'] as Object),
      meshName: json['meshName'] as String,
      meshOwner: json['meshOwner'] as String,
      resourceOwner: json['resourceOwner'] as String,
      version: json['version'] as int,
      virtualGatewayName: json['virtualGatewayName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final meshName = this.meshName;
    final meshOwner = this.meshOwner;
    final resourceOwner = this.resourceOwner;
    final version = this.version;
    final virtualGatewayName = this.virtualGatewayName;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'meshName': meshName,
      'meshOwner': meshOwner,
      'resourceOwner': resourceOwner,
      'version': version,
      'virtualGatewayName': virtualGatewayName,
    };
  }
}

/// An object that represents the specification of a service mesh resource.
class VirtualGatewaySpec {
  /// The listeners that the mesh endpoint is expected to receive inbound traffic
  /// from. You can specify one listener.
  final List<VirtualGatewayListener> listeners;

  /// A reference to an object that represents the defaults for backends.
  final VirtualGatewayBackendDefaults? backendDefaults;
  final VirtualGatewayLogging? logging;

  VirtualGatewaySpec({
    required this.listeners,
    this.backendDefaults,
    this.logging,
  });

  factory VirtualGatewaySpec.fromJson(Map<String, dynamic> json) {
    return VirtualGatewaySpec(
      listeners: (json['listeners'] as List)
          .whereNotNull()
          .map(
              (e) => VirtualGatewayListener.fromJson(e as Map<String, dynamic>))
          .toList(),
      backendDefaults: json['backendDefaults'] != null
          ? VirtualGatewayBackendDefaults.fromJson(
              json['backendDefaults'] as Map<String, dynamic>)
          : null,
      logging: json['logging'] != null
          ? VirtualGatewayLogging.fromJson(
              json['logging'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final listeners = this.listeners;
    final backendDefaults = this.backendDefaults;
    final logging = this.logging;
    return {
      'listeners': listeners,
      if (backendDefaults != null) 'backendDefaults': backendDefaults,
      if (logging != null) 'logging': logging,
    };
  }
}

/// An object that represents the status of the mesh resource.
class VirtualGatewayStatus {
  /// The current status.
  final VirtualGatewayStatusCode status;

  VirtualGatewayStatus({
    required this.status,
  });

  factory VirtualGatewayStatus.fromJson(Map<String, dynamic> json) {
    return VirtualGatewayStatus(
      status: (json['status'] as String).toVirtualGatewayStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

enum VirtualGatewayStatusCode {
  active,
  inactive,
  deleted,
}

extension VirtualGatewayStatusCodeValueExtension on VirtualGatewayStatusCode {
  String toValue() {
    switch (this) {
      case VirtualGatewayStatusCode.active:
        return 'ACTIVE';
      case VirtualGatewayStatusCode.inactive:
        return 'INACTIVE';
      case VirtualGatewayStatusCode.deleted:
        return 'DELETED';
    }
  }
}

extension VirtualGatewayStatusCodeFromString on String {
  VirtualGatewayStatusCode toVirtualGatewayStatusCode() {
    switch (this) {
      case 'ACTIVE':
        return VirtualGatewayStatusCode.active;
      case 'INACTIVE':
        return VirtualGatewayStatusCode.inactive;
      case 'DELETED':
        return VirtualGatewayStatusCode.deleted;
    }
    throw Exception('$this is not known in enum VirtualGatewayStatusCode');
  }
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context.
class VirtualGatewayTlsValidationContext {
  /// A reference to where to retrieve the trust chain when validating a peer’s
  /// Transport Layer Security (TLS) certificate.
  final VirtualGatewayTlsValidationContextTrust trust;

  /// A reference to an object that represents the SANs for a virtual gateway's
  /// listener's Transport Layer Security (TLS) validation context.
  final SubjectAlternativeNames? subjectAlternativeNames;

  VirtualGatewayTlsValidationContext({
    required this.trust,
    this.subjectAlternativeNames,
  });

  factory VirtualGatewayTlsValidationContext.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayTlsValidationContext(
      trust: VirtualGatewayTlsValidationContextTrust.fromJson(
          json['trust'] as Map<String, dynamic>),
      subjectAlternativeNames: json['subjectAlternativeNames'] != null
          ? SubjectAlternativeNames.fromJson(
              json['subjectAlternativeNames'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final trust = this.trust;
    final subjectAlternativeNames = this.subjectAlternativeNames;
    return {
      'trust': trust,
      if (subjectAlternativeNames != null)
        'subjectAlternativeNames': subjectAlternativeNames,
    };
  }
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context trust for an Certificate Manager certificate.
class VirtualGatewayTlsValidationContextAcmTrust {
  /// One or more ACM Amazon Resource Name (ARN)s.
  final List<String> certificateAuthorityArns;

  VirtualGatewayTlsValidationContextAcmTrust({
    required this.certificateAuthorityArns,
  });

  factory VirtualGatewayTlsValidationContextAcmTrust.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayTlsValidationContextAcmTrust(
      certificateAuthorityArns: (json['certificateAuthorityArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateAuthorityArns = this.certificateAuthorityArns;
    return {
      'certificateAuthorityArns': certificateAuthorityArns,
    };
  }
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context trust for a local file.
class VirtualGatewayTlsValidationContextFileTrust {
  /// The certificate trust chain for a certificate stored on the file system of
  /// the virtual node that the proxy is running on.
  final String certificateChain;

  VirtualGatewayTlsValidationContextFileTrust({
    required this.certificateChain,
  });

  factory VirtualGatewayTlsValidationContextFileTrust.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayTlsValidationContextFileTrust(
      certificateChain: json['certificateChain'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateChain = this.certificateChain;
    return {
      'certificateChain': certificateChain,
    };
  }
}

/// An object that represents a virtual gateway's listener's Transport Layer
/// Security (TLS) Secret Discovery Service validation context trust. The proxy
/// must be configured with a local SDS provider via a Unix Domain Socket. See
/// App Mesh <a
/// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html">TLS
/// documentation</a> for more info.
class VirtualGatewayTlsValidationContextSdsTrust {
  /// A reference to an object that represents the name of the secret for a
  /// virtual gateway's Transport Layer Security (TLS) Secret Discovery Service
  /// validation context trust.
  final String secretName;

  VirtualGatewayTlsValidationContextSdsTrust({
    required this.secretName,
  });

  factory VirtualGatewayTlsValidationContextSdsTrust.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayTlsValidationContextSdsTrust(
      secretName: json['secretName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final secretName = this.secretName;
    return {
      'secretName': secretName,
    };
  }
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context trust.
class VirtualGatewayTlsValidationContextTrust {
  /// A reference to an object that represents a Transport Layer Security (TLS)
  /// validation context trust for an Certificate Manager certificate.
  final VirtualGatewayTlsValidationContextAcmTrust? acm;

  /// An object that represents a Transport Layer Security (TLS) validation
  /// context trust for a local file.
  final VirtualGatewayTlsValidationContextFileTrust? file;

  /// A reference to an object that represents a virtual gateway's Transport Layer
  /// Security (TLS) Secret Discovery Service validation context trust.
  final VirtualGatewayTlsValidationContextSdsTrust? sds;

  VirtualGatewayTlsValidationContextTrust({
    this.acm,
    this.file,
    this.sds,
  });

  factory VirtualGatewayTlsValidationContextTrust.fromJson(
      Map<String, dynamic> json) {
    return VirtualGatewayTlsValidationContextTrust(
      acm: json['acm'] != null
          ? VirtualGatewayTlsValidationContextAcmTrust.fromJson(
              json['acm'] as Map<String, dynamic>)
          : null,
      file: json['file'] != null
          ? VirtualGatewayTlsValidationContextFileTrust.fromJson(
              json['file'] as Map<String, dynamic>)
          : null,
      sds: json['sds'] != null
          ? VirtualGatewayTlsValidationContextSdsTrust.fromJson(
              json['sds'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final acm = this.acm;
    final file = this.file;
    final sds = this.sds;
    return {
      if (acm != null) 'acm': acm,
      if (file != null) 'file': file,
      if (sds != null) 'sds': sds,
    };
  }
}

/// An object that represents the type of virtual node connection pool.
///
/// Only one protocol is used at a time and should be the same protocol as the
/// one chosen under port mapping.
///
/// If not present the default value for <code>maxPendingRequests</code> is
/// <code>2147483647</code>.
/// <p/>
class VirtualNodeConnectionPool {
  /// An object that represents a type of connection pool.
  final VirtualNodeGrpcConnectionPool? grpc;

  /// An object that represents a type of connection pool.
  final VirtualNodeHttpConnectionPool? http;

  /// An object that represents a type of connection pool.
  final VirtualNodeHttp2ConnectionPool? http2;

  /// An object that represents a type of connection pool.
  final VirtualNodeTcpConnectionPool? tcp;

  VirtualNodeConnectionPool({
    this.grpc,
    this.http,
    this.http2,
    this.tcp,
  });

  factory VirtualNodeConnectionPool.fromJson(Map<String, dynamic> json) {
    return VirtualNodeConnectionPool(
      grpc: json['grpc'] != null
          ? VirtualNodeGrpcConnectionPool.fromJson(
              json['grpc'] as Map<String, dynamic>)
          : null,
      http: json['http'] != null
          ? VirtualNodeHttpConnectionPool.fromJson(
              json['http'] as Map<String, dynamic>)
          : null,
      http2: json['http2'] != null
          ? VirtualNodeHttp2ConnectionPool.fromJson(
              json['http2'] as Map<String, dynamic>)
          : null,
      tcp: json['tcp'] != null
          ? VirtualNodeTcpConnectionPool.fromJson(
              json['tcp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final grpc = this.grpc;
    final http = this.http;
    final http2 = this.http2;
    final tcp = this.tcp;
    return {
      if (grpc != null) 'grpc': grpc,
      if (http != null) 'http': http,
      if (http2 != null) 'http2': http2,
      if (tcp != null) 'tcp': tcp,
    };
  }
}

/// An object that represents a virtual node returned by a describe operation.
class VirtualNodeData {
  /// The name of the service mesh that the virtual node resides in.
  final String meshName;

  /// The associated metadata for the virtual node.
  final ResourceMetadata metadata;

  /// The specifications of the virtual node.
  final VirtualNodeSpec spec;

  /// The current status for the virtual node.
  final VirtualNodeStatus status;

  /// The name of the virtual node.
  final String virtualNodeName;

  VirtualNodeData({
    required this.meshName,
    required this.metadata,
    required this.spec,
    required this.status,
    required this.virtualNodeName,
  });

  factory VirtualNodeData.fromJson(Map<String, dynamic> json) {
    return VirtualNodeData(
      meshName: json['meshName'] as String,
      metadata:
          ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      spec: VirtualNodeSpec.fromJson(json['spec'] as Map<String, dynamic>),
      status:
          VirtualNodeStatus.fromJson(json['status'] as Map<String, dynamic>),
      virtualNodeName: json['virtualNodeName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final meshName = this.meshName;
    final metadata = this.metadata;
    final spec = this.spec;
    final status = this.status;
    final virtualNodeName = this.virtualNodeName;
    return {
      'meshName': meshName,
      'metadata': metadata,
      'spec': spec,
      'status': status,
      'virtualNodeName': virtualNodeName,
    };
  }
}

/// An object that represents a type of connection pool.
class VirtualNodeGrpcConnectionPool {
  /// Maximum number of inflight requests Envoy can concurrently support across
  /// hosts in upstream cluster.
  final int maxRequests;

  VirtualNodeGrpcConnectionPool({
    required this.maxRequests,
  });

  factory VirtualNodeGrpcConnectionPool.fromJson(Map<String, dynamic> json) {
    return VirtualNodeGrpcConnectionPool(
      maxRequests: json['maxRequests'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maxRequests = this.maxRequests;
    return {
      'maxRequests': maxRequests,
    };
  }
}

/// An object that represents a type of connection pool.
class VirtualNodeHttp2ConnectionPool {
  /// Maximum number of inflight requests Envoy can concurrently support across
  /// hosts in upstream cluster.
  final int maxRequests;

  VirtualNodeHttp2ConnectionPool({
    required this.maxRequests,
  });

  factory VirtualNodeHttp2ConnectionPool.fromJson(Map<String, dynamic> json) {
    return VirtualNodeHttp2ConnectionPool(
      maxRequests: json['maxRequests'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maxRequests = this.maxRequests;
    return {
      'maxRequests': maxRequests,
    };
  }
}

/// An object that represents a type of connection pool.
class VirtualNodeHttpConnectionPool {
  /// Maximum number of outbound TCP connections Envoy can establish concurrently
  /// with all hosts in upstream cluster.
  final int maxConnections;

  /// Number of overflowing requests after <code>max_connections</code> Envoy will
  /// queue to upstream cluster.
  final int? maxPendingRequests;

  VirtualNodeHttpConnectionPool({
    required this.maxConnections,
    this.maxPendingRequests,
  });

  factory VirtualNodeHttpConnectionPool.fromJson(Map<String, dynamic> json) {
    return VirtualNodeHttpConnectionPool(
      maxConnections: json['maxConnections'] as int,
      maxPendingRequests: json['maxPendingRequests'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxConnections = this.maxConnections;
    final maxPendingRequests = this.maxPendingRequests;
    return {
      'maxConnections': maxConnections,
      if (maxPendingRequests != null) 'maxPendingRequests': maxPendingRequests,
    };
  }
}

/// An object that represents a virtual node returned by a list operation.
class VirtualNodeRef {
  /// The full Amazon Resource Name (ARN) for the virtual node.
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  final DateTime lastUpdatedAt;

  /// The name of the service mesh that the virtual node resides in.
  final String meshName;

  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared the
  /// mesh with your account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String meshOwner;

  /// The Amazon Web Services IAM account ID of the resource owner. If the account
  /// ID is not your own, then it's the ID of the mesh owner or of another account
  /// that the mesh is shared with. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String resourceOwner;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  final int version;

  /// The name of the virtual node.
  final String virtualNodeName;

  VirtualNodeRef({
    required this.arn,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.meshName,
    required this.meshOwner,
    required this.resourceOwner,
    required this.version,
    required this.virtualNodeName,
  });

  factory VirtualNodeRef.fromJson(Map<String, dynamic> json) {
    return VirtualNodeRef(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['lastUpdatedAt'] as Object),
      meshName: json['meshName'] as String,
      meshOwner: json['meshOwner'] as String,
      resourceOwner: json['resourceOwner'] as String,
      version: json['version'] as int,
      virtualNodeName: json['virtualNodeName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final meshName = this.meshName;
    final meshOwner = this.meshOwner;
    final resourceOwner = this.resourceOwner;
    final version = this.version;
    final virtualNodeName = this.virtualNodeName;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'meshName': meshName,
      'meshOwner': meshOwner,
      'resourceOwner': resourceOwner,
      'version': version,
      'virtualNodeName': virtualNodeName,
    };
  }
}

/// An object that represents a virtual node service provider.
class VirtualNodeServiceProvider {
  /// The name of the virtual node that is acting as a service provider.
  final String virtualNodeName;

  VirtualNodeServiceProvider({
    required this.virtualNodeName,
  });

  factory VirtualNodeServiceProvider.fromJson(Map<String, dynamic> json) {
    return VirtualNodeServiceProvider(
      virtualNodeName: json['virtualNodeName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualNodeName = this.virtualNodeName;
    return {
      'virtualNodeName': virtualNodeName,
    };
  }
}

/// An object that represents the specification of a virtual node.
class VirtualNodeSpec {
  /// A reference to an object that represents the defaults for backends.
  final BackendDefaults? backendDefaults;

  /// The backends that the virtual node is expected to send outbound traffic to.
  final List<Backend>? backends;

  /// The listener that the virtual node is expected to receive inbound traffic
  /// from. You can specify one listener.
  final List<Listener>? listeners;

  /// The inbound and outbound access logging information for the virtual node.
  final Logging? logging;

  /// The service discovery information for the virtual node. If your virtual node
  /// does not expect ingress traffic, you can omit this parameter. If you specify
  /// a <code>listener</code>, then you must specify service discovery
  /// information.
  final ServiceDiscovery? serviceDiscovery;

  VirtualNodeSpec({
    this.backendDefaults,
    this.backends,
    this.listeners,
    this.logging,
    this.serviceDiscovery,
  });

  factory VirtualNodeSpec.fromJson(Map<String, dynamic> json) {
    return VirtualNodeSpec(
      backendDefaults: json['backendDefaults'] != null
          ? BackendDefaults.fromJson(
              json['backendDefaults'] as Map<String, dynamic>)
          : null,
      backends: (json['backends'] as List?)
          ?.whereNotNull()
          .map((e) => Backend.fromJson(e as Map<String, dynamic>))
          .toList(),
      listeners: (json['listeners'] as List?)
          ?.whereNotNull()
          .map((e) => Listener.fromJson(e as Map<String, dynamic>))
          .toList(),
      logging: json['logging'] != null
          ? Logging.fromJson(json['logging'] as Map<String, dynamic>)
          : null,
      serviceDiscovery: json['serviceDiscovery'] != null
          ? ServiceDiscovery.fromJson(
              json['serviceDiscovery'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backendDefaults = this.backendDefaults;
    final backends = this.backends;
    final listeners = this.listeners;
    final logging = this.logging;
    final serviceDiscovery = this.serviceDiscovery;
    return {
      if (backendDefaults != null) 'backendDefaults': backendDefaults,
      if (backends != null) 'backends': backends,
      if (listeners != null) 'listeners': listeners,
      if (logging != null) 'logging': logging,
      if (serviceDiscovery != null) 'serviceDiscovery': serviceDiscovery,
    };
  }
}

/// An object that represents the current status of the virtual node.
class VirtualNodeStatus {
  /// The current status of the virtual node.
  final VirtualNodeStatusCode status;

  VirtualNodeStatus({
    required this.status,
  });

  factory VirtualNodeStatus.fromJson(Map<String, dynamic> json) {
    return VirtualNodeStatus(
      status: (json['status'] as String).toVirtualNodeStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

enum VirtualNodeStatusCode {
  active,
  inactive,
  deleted,
}

extension VirtualNodeStatusCodeValueExtension on VirtualNodeStatusCode {
  String toValue() {
    switch (this) {
      case VirtualNodeStatusCode.active:
        return 'ACTIVE';
      case VirtualNodeStatusCode.inactive:
        return 'INACTIVE';
      case VirtualNodeStatusCode.deleted:
        return 'DELETED';
    }
  }
}

extension VirtualNodeStatusCodeFromString on String {
  VirtualNodeStatusCode toVirtualNodeStatusCode() {
    switch (this) {
      case 'ACTIVE':
        return VirtualNodeStatusCode.active;
      case 'INACTIVE':
        return VirtualNodeStatusCode.inactive;
      case 'DELETED':
        return VirtualNodeStatusCode.deleted;
    }
    throw Exception('$this is not known in enum VirtualNodeStatusCode');
  }
}

/// An object that represents a type of connection pool.
class VirtualNodeTcpConnectionPool {
  /// Maximum number of outbound TCP connections Envoy can establish concurrently
  /// with all hosts in upstream cluster.
  final int maxConnections;

  VirtualNodeTcpConnectionPool({
    required this.maxConnections,
  });

  factory VirtualNodeTcpConnectionPool.fromJson(Map<String, dynamic> json) {
    return VirtualNodeTcpConnectionPool(
      maxConnections: json['maxConnections'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maxConnections = this.maxConnections;
    return {
      'maxConnections': maxConnections,
    };
  }
}

/// An object that represents a virtual router returned by a describe operation.
class VirtualRouterData {
  /// The name of the service mesh that the virtual router resides in.
  final String meshName;

  /// The associated metadata for the virtual router.
  final ResourceMetadata metadata;

  /// The specifications of the virtual router.
  final VirtualRouterSpec spec;

  /// The current status of the virtual router.
  final VirtualRouterStatus status;

  /// The name of the virtual router.
  final String virtualRouterName;

  VirtualRouterData({
    required this.meshName,
    required this.metadata,
    required this.spec,
    required this.status,
    required this.virtualRouterName,
  });

  factory VirtualRouterData.fromJson(Map<String, dynamic> json) {
    return VirtualRouterData(
      meshName: json['meshName'] as String,
      metadata:
          ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      spec: VirtualRouterSpec.fromJson(json['spec'] as Map<String, dynamic>),
      status:
          VirtualRouterStatus.fromJson(json['status'] as Map<String, dynamic>),
      virtualRouterName: json['virtualRouterName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final meshName = this.meshName;
    final metadata = this.metadata;
    final spec = this.spec;
    final status = this.status;
    final virtualRouterName = this.virtualRouterName;
    return {
      'meshName': meshName,
      'metadata': metadata,
      'spec': spec,
      'status': status,
      'virtualRouterName': virtualRouterName,
    };
  }
}

/// An object that represents a virtual router listener.
class VirtualRouterListener {
  final PortMapping portMapping;

  VirtualRouterListener({
    required this.portMapping,
  });

  factory VirtualRouterListener.fromJson(Map<String, dynamic> json) {
    return VirtualRouterListener(
      portMapping:
          PortMapping.fromJson(json['portMapping'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final portMapping = this.portMapping;
    return {
      'portMapping': portMapping,
    };
  }
}

/// An object that represents a virtual router returned by a list operation.
class VirtualRouterRef {
  /// The full Amazon Resource Name (ARN) for the virtual router.
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  final DateTime lastUpdatedAt;

  /// The name of the service mesh that the virtual router resides in.
  final String meshName;

  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared the
  /// mesh with your account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String meshOwner;

  /// The Amazon Web Services IAM account ID of the resource owner. If the account
  /// ID is not your own, then it's the ID of the mesh owner or of another account
  /// that the mesh is shared with. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String resourceOwner;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  final int version;

  /// The name of the virtual router.
  final String virtualRouterName;

  VirtualRouterRef({
    required this.arn,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.meshName,
    required this.meshOwner,
    required this.resourceOwner,
    required this.version,
    required this.virtualRouterName,
  });

  factory VirtualRouterRef.fromJson(Map<String, dynamic> json) {
    return VirtualRouterRef(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['lastUpdatedAt'] as Object),
      meshName: json['meshName'] as String,
      meshOwner: json['meshOwner'] as String,
      resourceOwner: json['resourceOwner'] as String,
      version: json['version'] as int,
      virtualRouterName: json['virtualRouterName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final meshName = this.meshName;
    final meshOwner = this.meshOwner;
    final resourceOwner = this.resourceOwner;
    final version = this.version;
    final virtualRouterName = this.virtualRouterName;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'meshName': meshName,
      'meshOwner': meshOwner,
      'resourceOwner': resourceOwner,
      'version': version,
      'virtualRouterName': virtualRouterName,
    };
  }
}

/// An object that represents a virtual node service provider.
class VirtualRouterServiceProvider {
  /// The name of the virtual router that is acting as a service provider.
  final String virtualRouterName;

  VirtualRouterServiceProvider({
    required this.virtualRouterName,
  });

  factory VirtualRouterServiceProvider.fromJson(Map<String, dynamic> json) {
    return VirtualRouterServiceProvider(
      virtualRouterName: json['virtualRouterName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualRouterName = this.virtualRouterName;
    return {
      'virtualRouterName': virtualRouterName,
    };
  }
}

/// An object that represents the specification of a virtual router.
class VirtualRouterSpec {
  /// The listeners that the virtual router is expected to receive inbound traffic
  /// from. You can specify one listener.
  final List<VirtualRouterListener>? listeners;

  VirtualRouterSpec({
    this.listeners,
  });

  factory VirtualRouterSpec.fromJson(Map<String, dynamic> json) {
    return VirtualRouterSpec(
      listeners: (json['listeners'] as List?)
          ?.whereNotNull()
          .map((e) => VirtualRouterListener.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final listeners = this.listeners;
    return {
      if (listeners != null) 'listeners': listeners,
    };
  }
}

/// An object that represents the status of a virtual router.
class VirtualRouterStatus {
  /// The current status of the virtual router.
  final VirtualRouterStatusCode status;

  VirtualRouterStatus({
    required this.status,
  });

  factory VirtualRouterStatus.fromJson(Map<String, dynamic> json) {
    return VirtualRouterStatus(
      status: (json['status'] as String).toVirtualRouterStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

enum VirtualRouterStatusCode {
  active,
  inactive,
  deleted,
}

extension VirtualRouterStatusCodeValueExtension on VirtualRouterStatusCode {
  String toValue() {
    switch (this) {
      case VirtualRouterStatusCode.active:
        return 'ACTIVE';
      case VirtualRouterStatusCode.inactive:
        return 'INACTIVE';
      case VirtualRouterStatusCode.deleted:
        return 'DELETED';
    }
  }
}

extension VirtualRouterStatusCodeFromString on String {
  VirtualRouterStatusCode toVirtualRouterStatusCode() {
    switch (this) {
      case 'ACTIVE':
        return VirtualRouterStatusCode.active;
      case 'INACTIVE':
        return VirtualRouterStatusCode.inactive;
      case 'DELETED':
        return VirtualRouterStatusCode.deleted;
    }
    throw Exception('$this is not known in enum VirtualRouterStatusCode');
  }
}

/// An object that represents a virtual service backend for a virtual node.
class VirtualServiceBackend {
  /// The name of the virtual service that is acting as a virtual node backend.
  final String virtualServiceName;

  /// A reference to an object that represents the client policy for a backend.
  final ClientPolicy? clientPolicy;

  VirtualServiceBackend({
    required this.virtualServiceName,
    this.clientPolicy,
  });

  factory VirtualServiceBackend.fromJson(Map<String, dynamic> json) {
    return VirtualServiceBackend(
      virtualServiceName: json['virtualServiceName'] as String,
      clientPolicy: json['clientPolicy'] != null
          ? ClientPolicy.fromJson(json['clientPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualServiceName = this.virtualServiceName;
    final clientPolicy = this.clientPolicy;
    return {
      'virtualServiceName': virtualServiceName,
      if (clientPolicy != null) 'clientPolicy': clientPolicy,
    };
  }
}

/// An object that represents a virtual service returned by a describe
/// operation.
class VirtualServiceData {
  /// The name of the service mesh that the virtual service resides in.
  final String meshName;
  final ResourceMetadata metadata;

  /// The specifications of the virtual service.
  final VirtualServiceSpec spec;

  /// The current status of the virtual service.
  final VirtualServiceStatus status;

  /// The name of the virtual service.
  final String virtualServiceName;

  VirtualServiceData({
    required this.meshName,
    required this.metadata,
    required this.spec,
    required this.status,
    required this.virtualServiceName,
  });

  factory VirtualServiceData.fromJson(Map<String, dynamic> json) {
    return VirtualServiceData(
      meshName: json['meshName'] as String,
      metadata:
          ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      spec: VirtualServiceSpec.fromJson(json['spec'] as Map<String, dynamic>),
      status:
          VirtualServiceStatus.fromJson(json['status'] as Map<String, dynamic>),
      virtualServiceName: json['virtualServiceName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final meshName = this.meshName;
    final metadata = this.metadata;
    final spec = this.spec;
    final status = this.status;
    final virtualServiceName = this.virtualServiceName;
    return {
      'meshName': meshName,
      'metadata': metadata,
      'spec': spec,
      'status': status,
      'virtualServiceName': virtualServiceName,
    };
  }
}

/// An object that represents the provider for a virtual service.
class VirtualServiceProvider {
  /// The virtual node associated with a virtual service.
  final VirtualNodeServiceProvider? virtualNode;

  /// The virtual router associated with a virtual service.
  final VirtualRouterServiceProvider? virtualRouter;

  VirtualServiceProvider({
    this.virtualNode,
    this.virtualRouter,
  });

  factory VirtualServiceProvider.fromJson(Map<String, dynamic> json) {
    return VirtualServiceProvider(
      virtualNode: json['virtualNode'] != null
          ? VirtualNodeServiceProvider.fromJson(
              json['virtualNode'] as Map<String, dynamic>)
          : null,
      virtualRouter: json['virtualRouter'] != null
          ? VirtualRouterServiceProvider.fromJson(
              json['virtualRouter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualNode = this.virtualNode;
    final virtualRouter = this.virtualRouter;
    return {
      if (virtualNode != null) 'virtualNode': virtualNode,
      if (virtualRouter != null) 'virtualRouter': virtualRouter,
    };
  }
}

/// An object that represents a virtual service returned by a list operation.
class VirtualServiceRef {
  /// The full Amazon Resource Name (ARN) for the virtual service.
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  final DateTime lastUpdatedAt;

  /// The name of the service mesh that the virtual service resides in.
  final String meshName;

  /// The Amazon Web Services IAM account ID of the service mesh owner. If the
  /// account ID is not your own, then it's the ID of the account that shared the
  /// mesh with your account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String meshOwner;

  /// The Amazon Web Services IAM account ID of the resource owner. If the account
  /// ID is not your own, then it's the ID of the mesh owner or of another account
  /// that the mesh is shared with. For more information about mesh sharing, see
  /// <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  final String resourceOwner;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  final int version;

  /// The name of the virtual service.
  final String virtualServiceName;

  VirtualServiceRef({
    required this.arn,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.meshName,
    required this.meshOwner,
    required this.resourceOwner,
    required this.version,
    required this.virtualServiceName,
  });

  factory VirtualServiceRef.fromJson(Map<String, dynamic> json) {
    return VirtualServiceRef(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      lastUpdatedAt:
          nonNullableTimeStampFromJson(json['lastUpdatedAt'] as Object),
      meshName: json['meshName'] as String,
      meshOwner: json['meshOwner'] as String,
      resourceOwner: json['resourceOwner'] as String,
      version: json['version'] as int,
      virtualServiceName: json['virtualServiceName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final meshName = this.meshName;
    final meshOwner = this.meshOwner;
    final resourceOwner = this.resourceOwner;
    final version = this.version;
    final virtualServiceName = this.virtualServiceName;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'meshName': meshName,
      'meshOwner': meshOwner,
      'resourceOwner': resourceOwner,
      'version': version,
      'virtualServiceName': virtualServiceName,
    };
  }
}

/// An object that represents the specification of a virtual service.
class VirtualServiceSpec {
  /// The App Mesh object that is acting as the provider for a virtual service.
  /// You can specify a single virtual node or virtual router.
  final VirtualServiceProvider? provider;

  VirtualServiceSpec({
    this.provider,
  });

  factory VirtualServiceSpec.fromJson(Map<String, dynamic> json) {
    return VirtualServiceSpec(
      provider: json['provider'] != null
          ? VirtualServiceProvider.fromJson(
              json['provider'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final provider = this.provider;
    return {
      if (provider != null) 'provider': provider,
    };
  }
}

/// An object that represents the status of a virtual service.
class VirtualServiceStatus {
  /// The current status of the virtual service.
  final VirtualServiceStatusCode status;

  VirtualServiceStatus({
    required this.status,
  });

  factory VirtualServiceStatus.fromJson(Map<String, dynamic> json) {
    return VirtualServiceStatus(
      status: (json['status'] as String).toVirtualServiceStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

enum VirtualServiceStatusCode {
  active,
  inactive,
  deleted,
}

extension VirtualServiceStatusCodeValueExtension on VirtualServiceStatusCode {
  String toValue() {
    switch (this) {
      case VirtualServiceStatusCode.active:
        return 'ACTIVE';
      case VirtualServiceStatusCode.inactive:
        return 'INACTIVE';
      case VirtualServiceStatusCode.deleted:
        return 'DELETED';
    }
  }
}

extension VirtualServiceStatusCodeFromString on String {
  VirtualServiceStatusCode toVirtualServiceStatusCode() {
    switch (this) {
      case 'ACTIVE':
        return VirtualServiceStatusCode.active;
      case 'INACTIVE':
        return VirtualServiceStatusCode.inactive;
      case 'DELETED':
        return VirtualServiceStatusCode.deleted;
    }
    throw Exception('$this is not known in enum VirtualServiceStatusCode');
  }
}

/// An object that represents a target and its relative weight. Traffic is
/// distributed across targets according to their relative weight. For example,
/// a weighted target with a relative weight of 50 receives five times as much
/// traffic as one with a relative weight of 10. The total weight for all
/// targets combined must be less than or equal to 100.
class WeightedTarget {
  /// The virtual node to associate with the weighted target.
  final String virtualNode;

  /// The relative weight of the weighted target.
  final int weight;

  /// The targeted port of the weighted object.
  final int? port;

  WeightedTarget({
    required this.virtualNode,
    required this.weight,
    this.port,
  });

  factory WeightedTarget.fromJson(Map<String, dynamic> json) {
    return WeightedTarget(
      virtualNode: json['virtualNode'] as String,
      weight: json['weight'] as int,
      port: json['port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualNode = this.virtualNode;
    final weight = this.weight;
    final port = this.port;
    return {
      'virtualNode': virtualNode,
      'weight': weight,
      if (port != null) 'port': port,
    };
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

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
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

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
