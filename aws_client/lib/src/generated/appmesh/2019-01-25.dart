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

part '2019-01-25.g.dart';

/// AWS App Mesh is a service mesh based on the Envoy proxy that makes it easy
/// to monitor and control microservices. App Mesh standardizes how your
/// microservices communicate, giving you end-to-end visibility and helping to
/// ensure high availability for your applications.
///
/// App Mesh gives you consistent visibility and network traffic controls for
/// every microservice in an application. You can use App Mesh with AWS Fargate,
/// Amazon ECS, Amazon EKS, Kubernetes on AWS, and Amazon EC2.
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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'appmesh',
            signingName: 'appmesh',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then the account that you specify must share the mesh with your
  /// account before you can create the resource in the service mesh. For more
  /// information about mesh sharing, see <a
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
    @_s.required String gatewayRouteName,
    @_s.required String meshName,
    @_s.required GatewayRouteSpec spec,
    @_s.required String virtualGatewayName,
    String clientToken,
    String meshOwner,
    List<TagRef> tags,
  }) async {
    ArgumentError.checkNotNull(gatewayRouteName, 'gatewayRouteName');
    _s.validateStringLength(
      'gatewayRouteName',
      gatewayRouteName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(spec, 'spec');
    ArgumentError.checkNotNull(virtualGatewayName, 'virtualGatewayName');
    _s.validateStringLength(
      'virtualGatewayName',
      virtualGatewayName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
    @_s.required String meshName,
    String clientToken,
    MeshSpec spec,
    List<TagRef> tags,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then the account that you specify must share the mesh with your
  /// account before you can create the resource in the service mesh. For more
  /// information about mesh sharing, see <a
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
    @_s.required String meshName,
    @_s.required String routeName,
    @_s.required RouteSpec spec,
    @_s.required String virtualRouterName,
    String clientToken,
    String meshOwner,
    List<TagRef> tags,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(routeName, 'routeName');
    _s.validateStringLength(
      'routeName',
      routeName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(spec, 'spec');
    ArgumentError.checkNotNull(virtualRouterName, 'virtualRouterName');
    _s.validateStringLength(
      'virtualRouterName',
      virtualRouterName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then the account that you specify must share the mesh with your
  /// account before you can create the resource in the service mesh. For more
  /// information about mesh sharing, see <a
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
    @_s.required String meshName,
    @_s.required VirtualGatewaySpec spec,
    @_s.required String virtualGatewayName,
    String clientToken,
    String meshOwner,
    List<TagRef> tags,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(spec, 'spec');
    ArgumentError.checkNotNull(virtualGatewayName, 'virtualGatewayName');
    _s.validateStringLength(
      'virtualGatewayName',
      virtualGatewayName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  ///
  /// AWS Cloud Map is not available in the eu-south-1 Region.
  /// </note>
  /// For more information about virtual nodes, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/virtual_nodes.html">Virtual
  /// nodes</a>. You must be using <code>1.15.0</code> or later of the Envoy
  /// image when setting these variables. For more information about App Mesh
  /// Envoy variables, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/envoy.html">Envoy
  /// image</a> in the AWS App Mesh User Guide.
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then the account that you specify must share the mesh with your
  /// account before you can create the resource in the service mesh. For more
  /// information about mesh sharing, see <a
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
    @_s.required String meshName,
    @_s.required VirtualNodeSpec spec,
    @_s.required String virtualNodeName,
    String clientToken,
    String meshOwner,
    List<TagRef> tags,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(spec, 'spec');
    ArgumentError.checkNotNull(virtualNodeName, 'virtualNodeName');
    _s.validateStringLength(
      'virtualNodeName',
      virtualNodeName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then the account that you specify must share the mesh with your
  /// account before you can create the resource in the service mesh. For more
  /// information about mesh sharing, see <a
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
    @_s.required String meshName,
    @_s.required VirtualRouterSpec spec,
    @_s.required String virtualRouterName,
    String clientToken,
    String meshOwner,
    List<TagRef> tags,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(spec, 'spec');
    ArgumentError.checkNotNull(virtualRouterName, 'virtualRouterName');
    _s.validateStringLength(
      'virtualRouterName',
      virtualRouterName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then the account that you specify must share the mesh with your
  /// account before you can create the resource in the service mesh. For more
  /// information about mesh sharing, see <a
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
    @_s.required String meshName,
    @_s.required VirtualServiceSpec spec,
    @_s.required String virtualServiceName,
    String clientToken,
    String meshOwner,
    List<TagRef> tags,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(spec, 'spec');
    ArgumentError.checkNotNull(virtualServiceName, 'virtualServiceName');
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DeleteGatewayRouteOutput> deleteGatewayRoute({
    @_s.required String gatewayRouteName,
    @_s.required String meshName,
    @_s.required String virtualGatewayName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(gatewayRouteName, 'gatewayRouteName');
    _s.validateStringLength(
      'gatewayRouteName',
      gatewayRouteName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualGatewayName, 'virtualGatewayName');
    _s.validateStringLength(
      'virtualGatewayName',
      virtualGatewayName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
    @_s.required String meshName,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DeleteRouteOutput> deleteRoute({
    @_s.required String meshName,
    @_s.required String routeName,
    @_s.required String virtualRouterName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(routeName, 'routeName');
    _s.validateStringLength(
      'routeName',
      routeName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualRouterName, 'virtualRouterName');
    _s.validateStringLength(
      'virtualRouterName',
      virtualRouterName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DeleteVirtualGatewayOutput> deleteVirtualGateway({
    @_s.required String meshName,
    @_s.required String virtualGatewayName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualGatewayName, 'virtualGatewayName');
    _s.validateStringLength(
      'virtualGatewayName',
      virtualGatewayName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DeleteVirtualNodeOutput> deleteVirtualNode({
    @_s.required String meshName,
    @_s.required String virtualNodeName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualNodeName, 'virtualNodeName');
    _s.validateStringLength(
      'virtualNodeName',
      virtualNodeName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DeleteVirtualRouterOutput> deleteVirtualRouter({
    @_s.required String meshName,
    @_s.required String virtualRouterName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualRouterName, 'virtualRouterName');
    _s.validateStringLength(
      'virtualRouterName',
      virtualRouterName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DeleteVirtualServiceOutput> deleteVirtualService({
    @_s.required String meshName,
    @_s.required String virtualServiceName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualServiceName, 'virtualServiceName');
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeGatewayRouteOutput> describeGatewayRoute({
    @_s.required String gatewayRouteName,
    @_s.required String meshName,
    @_s.required String virtualGatewayName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(gatewayRouteName, 'gatewayRouteName');
    _s.validateStringLength(
      'gatewayRouteName',
      gatewayRouteName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualGatewayName, 'virtualGatewayName');
    _s.validateStringLength(
      'virtualGatewayName',
      virtualGatewayName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeMeshOutput> describeMesh({
    @_s.required String meshName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeRouteOutput> describeRoute({
    @_s.required String meshName,
    @_s.required String routeName,
    @_s.required String virtualRouterName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(routeName, 'routeName');
    _s.validateStringLength(
      'routeName',
      routeName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualRouterName, 'virtualRouterName');
    _s.validateStringLength(
      'virtualRouterName',
      virtualRouterName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeVirtualGatewayOutput> describeVirtualGateway({
    @_s.required String meshName,
    @_s.required String virtualGatewayName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualGatewayName, 'virtualGatewayName');
    _s.validateStringLength(
      'virtualGatewayName',
      virtualGatewayName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeVirtualNodeOutput> describeVirtualNode({
    @_s.required String meshName,
    @_s.required String virtualNodeName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualNodeName, 'virtualNodeName');
    _s.validateStringLength(
      'virtualNodeName',
      virtualNodeName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeVirtualRouterOutput> describeVirtualRouter({
    @_s.required String meshName,
    @_s.required String virtualRouterName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualRouterName, 'virtualRouterName');
    _s.validateStringLength(
      'virtualRouterName',
      virtualRouterName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<DescribeVirtualServiceOutput> describeVirtualService({
    @_s.required String meshName,
    @_s.required String virtualServiceName,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualServiceName, 'virtualServiceName');
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
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
    @_s.required String meshName,
    @_s.required String virtualGatewayName,
    int limit,
    String meshOwner,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualGatewayName, 'virtualGatewayName');
    _s.validateStringLength(
      'virtualGatewayName',
      virtualGatewayName,
      1,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
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
    int limit,
    String nextToken,
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
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
    @_s.required String meshName,
    @_s.required String virtualRouterName,
    int limit,
    String meshOwner,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(virtualRouterName, 'virtualRouterName');
    _s.validateStringLength(
      'virtualRouterName',
      virtualRouterName,
      1,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
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
    @_s.required String resourceArn,
    int limit,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (resourceArn != null) 'resourceArn': [resourceArn],
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
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
    @_s.required String meshName,
    int limit,
    String meshOwner,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
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
    @_s.required String meshName,
    int limit,
    String meshOwner,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
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
    @_s.required String meshName,
    int limit,
    String meshOwner,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
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
    @_s.required String meshName,
    int limit,
    String meshOwner,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
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
    @_s.required String resourceArn,
    @_s.required List<TagRef> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $query = <String, List<String>>{
      if (resourceArn != null) 'resourceArn': [resourceArn],
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
    return TagResourceOutput.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (resourceArn != null) 'resourceArn': [resourceArn],
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
    return UntagResourceOutput.fromJson(response);
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<UpdateGatewayRouteOutput> updateGatewayRoute({
    @_s.required String gatewayRouteName,
    @_s.required String meshName,
    @_s.required GatewayRouteSpec spec,
    @_s.required String virtualGatewayName,
    String clientToken,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(gatewayRouteName, 'gatewayRouteName');
    _s.validateStringLength(
      'gatewayRouteName',
      gatewayRouteName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(spec, 'spec');
    ArgumentError.checkNotNull(virtualGatewayName, 'virtualGatewayName');
    _s.validateStringLength(
      'virtualGatewayName',
      virtualGatewayName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
    @_s.required String meshName,
    String clientToken,
    MeshSpec spec,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<UpdateRouteOutput> updateRoute({
    @_s.required String meshName,
    @_s.required String routeName,
    @_s.required RouteSpec spec,
    @_s.required String virtualRouterName,
    String clientToken,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(routeName, 'routeName');
    _s.validateStringLength(
      'routeName',
      routeName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(spec, 'spec');
    ArgumentError.checkNotNull(virtualRouterName, 'virtualRouterName');
    _s.validateStringLength(
      'virtualRouterName',
      virtualRouterName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<UpdateVirtualGatewayOutput> updateVirtualGateway({
    @_s.required String meshName,
    @_s.required VirtualGatewaySpec spec,
    @_s.required String virtualGatewayName,
    String clientToken,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(spec, 'spec');
    ArgumentError.checkNotNull(virtualGatewayName, 'virtualGatewayName');
    _s.validateStringLength(
      'virtualGatewayName',
      virtualGatewayName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<UpdateVirtualNodeOutput> updateVirtualNode({
    @_s.required String meshName,
    @_s.required VirtualNodeSpec spec,
    @_s.required String virtualNodeName,
    String clientToken,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(spec, 'spec');
    ArgumentError.checkNotNull(virtualNodeName, 'virtualNodeName');
    _s.validateStringLength(
      'virtualNodeName',
      virtualNodeName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<UpdateVirtualRouterOutput> updateVirtualRouter({
    @_s.required String meshName,
    @_s.required VirtualRouterSpec spec,
    @_s.required String virtualRouterName,
    String clientToken,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(spec, 'spec');
    ArgumentError.checkNotNull(virtualRouterName, 'virtualRouterName');
    _s.validateStringLength(
      'virtualRouterName',
      virtualRouterName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  Future<UpdateVirtualServiceOutput> updateVirtualService({
    @_s.required String meshName,
    @_s.required VirtualServiceSpec spec,
    @_s.required String virtualServiceName,
    String clientToken,
    String meshOwner,
  }) async {
    ArgumentError.checkNotNull(meshName, 'meshName');
    _s.validateStringLength(
      'meshName',
      meshName,
      1,
      255,
      isRequired: true,
    );
    ArgumentError.checkNotNull(spec, 'spec');
    ArgumentError.checkNotNull(virtualServiceName, 'virtualServiceName');
    _s.validateStringLength(
      'meshOwner',
      meshOwner,
      12,
      12,
    );
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccessLog {
  /// The file object to send virtual node access logs to.
  @_s.JsonKey(name: 'file')
  final FileAccessLog file;

  AccessLog({
    this.file,
  });
  factory AccessLog.fromJson(Map<String, dynamic> json) =>
      _$AccessLogFromJson(json);

  Map<String, dynamic> toJson() => _$AccessLogToJson(this);
}

/// An object that represents the AWS Cloud Map attribute information for your
/// virtual node.
/// <note>
/// AWS Cloud Map is not available in the eu-south-1 Region.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudMapInstanceAttribute {
  /// The name of an AWS Cloud Map service instance attribute key. Any AWS Cloud
  /// Map service instance that contains the specified key and value is returned.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The value of an AWS Cloud Map service instance attribute key. Any AWS Cloud
  /// Map service instance that contains the specified key and value is returned.
  @_s.JsonKey(name: 'value')
  final String value;

  AwsCloudMapInstanceAttribute({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory AwsCloudMapInstanceAttribute.fromJson(Map<String, dynamic> json) =>
      _$AwsCloudMapInstanceAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AwsCloudMapInstanceAttributeToJson(this);
}

/// An object that represents the AWS Cloud Map service discovery information
/// for your virtual node.
/// <note>
/// AWS Cloud Map is not available in the eu-south-1 Region.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsCloudMapServiceDiscovery {
  /// The name of the AWS Cloud Map namespace to use.
  @_s.JsonKey(name: 'namespaceName')
  final String namespaceName;

  /// The name of the AWS Cloud Map service to use.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  /// A string map that contains attributes with values that you can use to filter
  /// instances by any custom attribute that you specified when you registered the
  /// instance. Only instances that match all of the specified key/value pairs
  /// will be returned.
  @_s.JsonKey(name: 'attributes')
  final List<AwsCloudMapInstanceAttribute> attributes;

  AwsCloudMapServiceDiscovery({
    @_s.required this.namespaceName,
    @_s.required this.serviceName,
    this.attributes,
  });
  factory AwsCloudMapServiceDiscovery.fromJson(Map<String, dynamic> json) =>
      _$AwsCloudMapServiceDiscoveryFromJson(json);

  Map<String, dynamic> toJson() => _$AwsCloudMapServiceDiscoveryToJson(this);
}

/// An object that represents the backends that a virtual node is expected to
/// send outbound traffic to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Backend {
  /// Specifies a virtual service to use as a backend.
  @_s.JsonKey(name: 'virtualService')
  final VirtualServiceBackend virtualService;

  Backend({
    this.virtualService,
  });
  factory Backend.fromJson(Map<String, dynamic> json) =>
      _$BackendFromJson(json);

  Map<String, dynamic> toJson() => _$BackendToJson(this);
}

/// An object that represents the default properties for a backend.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BackendDefaults {
  /// A reference to an object that represents a client policy.
  @_s.JsonKey(name: 'clientPolicy')
  final ClientPolicy clientPolicy;

  BackendDefaults({
    this.clientPolicy,
  });
  factory BackendDefaults.fromJson(Map<String, dynamic> json) =>
      _$BackendDefaultsFromJson(json);

  Map<String, dynamic> toJson() => _$BackendDefaultsToJson(this);
}

/// An object that represents a client policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ClientPolicy {
  /// A reference to an object that represents a Transport Layer Security (TLS)
  /// client policy.
  @_s.JsonKey(name: 'tls')
  final ClientPolicyTls tls;

  ClientPolicy({
    this.tls,
  });
  factory ClientPolicy.fromJson(Map<String, dynamic> json) =>
      _$ClientPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$ClientPolicyToJson(this);
}

/// A reference to an object that represents a Transport Layer Security (TLS)
/// client policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ClientPolicyTls {
  /// A reference to an object that represents a TLS validation context.
  @_s.JsonKey(name: 'validation')
  final TlsValidationContext validation;

  /// Whether the policy is enforced. The default is <code>True</code>, if a value
  /// isn't specified.
  @_s.JsonKey(name: 'enforce')
  final bool enforce;

  /// One or more ports that the policy is enforced for.
  @_s.JsonKey(name: 'ports')
  final List<int> ports;

  ClientPolicyTls({
    @_s.required this.validation,
    this.enforce,
    this.ports,
  });
  factory ClientPolicyTls.fromJson(Map<String, dynamic> json) =>
      _$ClientPolicyTlsFromJson(json);

  Map<String, dynamic> toJson() => _$ClientPolicyTlsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGatewayRouteOutput {
  /// The full description of your gateway route following the create call.
  @_s.JsonKey(name: 'gatewayRoute')
  final GatewayRouteData gatewayRoute;

  CreateGatewayRouteOutput({
    @_s.required this.gatewayRoute,
  });
  factory CreateGatewayRouteOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateGatewayRouteOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMeshOutput {
  /// The full description of your service mesh following the create call.
  @_s.JsonKey(name: 'mesh')
  final MeshData mesh;

  CreateMeshOutput({
    @_s.required this.mesh,
  });
  factory CreateMeshOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateMeshOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRouteOutput {
  /// The full description of your mesh following the create call.
  @_s.JsonKey(name: 'route')
  final RouteData route;

  CreateRouteOutput({
    @_s.required this.route,
  });
  factory CreateRouteOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateRouteOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVirtualGatewayOutput {
  /// The full description of your virtual gateway following the create call.
  @_s.JsonKey(name: 'virtualGateway')
  final VirtualGatewayData virtualGateway;

  CreateVirtualGatewayOutput({
    @_s.required this.virtualGateway,
  });
  factory CreateVirtualGatewayOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateVirtualGatewayOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVirtualNodeOutput {
  /// The full description of your virtual node following the create call.
  @_s.JsonKey(name: 'virtualNode')
  final VirtualNodeData virtualNode;

  CreateVirtualNodeOutput({
    @_s.required this.virtualNode,
  });
  factory CreateVirtualNodeOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateVirtualNodeOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVirtualRouterOutput {
  /// The full description of your virtual router following the create call.
  @_s.JsonKey(name: 'virtualRouter')
  final VirtualRouterData virtualRouter;

  CreateVirtualRouterOutput({
    @_s.required this.virtualRouter,
  });
  factory CreateVirtualRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateVirtualRouterOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVirtualServiceOutput {
  /// The full description of your virtual service following the create call.
  @_s.JsonKey(name: 'virtualService')
  final VirtualServiceData virtualService;

  CreateVirtualServiceOutput({
    @_s.required this.virtualService,
  });
  factory CreateVirtualServiceOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateVirtualServiceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGatewayRouteOutput {
  /// The gateway route that was deleted.
  @_s.JsonKey(name: 'gatewayRoute')
  final GatewayRouteData gatewayRoute;

  DeleteGatewayRouteOutput({
    @_s.required this.gatewayRoute,
  });
  factory DeleteGatewayRouteOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteGatewayRouteOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMeshOutput {
  /// The service mesh that was deleted.
  @_s.JsonKey(name: 'mesh')
  final MeshData mesh;

  DeleteMeshOutput({
    @_s.required this.mesh,
  });
  factory DeleteMeshOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteMeshOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRouteOutput {
  /// The route that was deleted.
  @_s.JsonKey(name: 'route')
  final RouteData route;

  DeleteRouteOutput({
    @_s.required this.route,
  });
  factory DeleteRouteOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteRouteOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVirtualGatewayOutput {
  /// The virtual gateway that was deleted.
  @_s.JsonKey(name: 'virtualGateway')
  final VirtualGatewayData virtualGateway;

  DeleteVirtualGatewayOutput({
    @_s.required this.virtualGateway,
  });
  factory DeleteVirtualGatewayOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteVirtualGatewayOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVirtualNodeOutput {
  /// The virtual node that was deleted.
  @_s.JsonKey(name: 'virtualNode')
  final VirtualNodeData virtualNode;

  DeleteVirtualNodeOutput({
    @_s.required this.virtualNode,
  });
  factory DeleteVirtualNodeOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteVirtualNodeOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVirtualRouterOutput {
  /// The virtual router that was deleted.
  @_s.JsonKey(name: 'virtualRouter')
  final VirtualRouterData virtualRouter;

  DeleteVirtualRouterOutput({
    @_s.required this.virtualRouter,
  });
  factory DeleteVirtualRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteVirtualRouterOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVirtualServiceOutput {
  /// The virtual service that was deleted.
  @_s.JsonKey(name: 'virtualService')
  final VirtualServiceData virtualService;

  DeleteVirtualServiceOutput({
    @_s.required this.virtualService,
  });
  factory DeleteVirtualServiceOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteVirtualServiceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGatewayRouteOutput {
  /// The full description of your gateway route.
  @_s.JsonKey(name: 'gatewayRoute')
  final GatewayRouteData gatewayRoute;

  DescribeGatewayRouteOutput({
    @_s.required this.gatewayRoute,
  });
  factory DescribeGatewayRouteOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeGatewayRouteOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMeshOutput {
  /// The full description of your service mesh.
  @_s.JsonKey(name: 'mesh')
  final MeshData mesh;

  DescribeMeshOutput({
    @_s.required this.mesh,
  });
  factory DescribeMeshOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeMeshOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRouteOutput {
  /// The full description of your route.
  @_s.JsonKey(name: 'route')
  final RouteData route;

  DescribeRouteOutput({
    @_s.required this.route,
  });
  factory DescribeRouteOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeRouteOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeVirtualGatewayOutput {
  /// The full description of your virtual gateway.
  @_s.JsonKey(name: 'virtualGateway')
  final VirtualGatewayData virtualGateway;

  DescribeVirtualGatewayOutput({
    @_s.required this.virtualGateway,
  });
  factory DescribeVirtualGatewayOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeVirtualGatewayOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeVirtualNodeOutput {
  /// The full description of your virtual node.
  @_s.JsonKey(name: 'virtualNode')
  final VirtualNodeData virtualNode;

  DescribeVirtualNodeOutput({
    @_s.required this.virtualNode,
  });
  factory DescribeVirtualNodeOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeVirtualNodeOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeVirtualRouterOutput {
  /// The full description of your virtual router.
  @_s.JsonKey(name: 'virtualRouter')
  final VirtualRouterData virtualRouter;

  DescribeVirtualRouterOutput({
    @_s.required this.virtualRouter,
  });
  factory DescribeVirtualRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeVirtualRouterOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeVirtualServiceOutput {
  /// The full description of your virtual service.
  @_s.JsonKey(name: 'virtualService')
  final VirtualServiceData virtualService;

  DescribeVirtualServiceOutput({
    @_s.required this.virtualService,
  });
  factory DescribeVirtualServiceOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeVirtualServiceOutputFromJson(json);
}

/// An object that represents the DNS service discovery information for your
/// virtual node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DnsServiceDiscovery {
  /// Specifies the DNS service discovery hostname for the virtual node.
  @_s.JsonKey(name: 'hostname')
  final String hostname;

  DnsServiceDiscovery({
    @_s.required this.hostname,
  });
  factory DnsServiceDiscovery.fromJson(Map<String, dynamic> json) =>
      _$DnsServiceDiscoveryFromJson(json);

  Map<String, dynamic> toJson() => _$DnsServiceDiscoveryToJson(this);
}

/// An object that represents a duration of time.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Duration {
  /// A unit of time.
  @_s.JsonKey(name: 'unit')
  final DurationUnit unit;

  /// A number of time units.
  @_s.JsonKey(name: 'value')
  final int value;

  Duration({
    this.unit,
    this.value,
  });
  factory Duration.fromJson(Map<String, dynamic> json) =>
      _$DurationFromJson(json);

  Map<String, dynamic> toJson() => _$DurationToJson(this);
}

enum DurationUnit {
  @_s.JsonValue('s')
  s,
  @_s.JsonValue('ms')
  ms,
}

/// An object that represents the egress filter rules for a service mesh.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EgressFilter {
  /// The egress filter type. By default, the type is <code>DROP_ALL</code>, which
  /// allows egress only from virtual nodes to other defined resources in the
  /// service mesh (and any traffic to <code>*.amazonaws.com</code> for AWS API
  /// calls). You can set the egress filter type to <code>ALLOW_ALL</code> to
  /// allow egress to any endpoint inside or outside of the service mesh.
  @_s.JsonKey(name: 'type')
  final EgressFilterType type;

  EgressFilter({
    @_s.required this.type,
  });
  factory EgressFilter.fromJson(Map<String, dynamic> json) =>
      _$EgressFilterFromJson(json);

  Map<String, dynamic> toJson() => _$EgressFilterToJson(this);
}

enum EgressFilterType {
  @_s.JsonValue('ALLOW_ALL')
  allowAll,
  @_s.JsonValue('DROP_ALL')
  dropAll,
}

/// An object that represents an access log file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'path')
  final String path;

  FileAccessLog({
    @_s.required this.path,
  });
  factory FileAccessLog.fromJson(Map<String, dynamic> json) =>
      _$FileAccessLogFromJson(json);

  Map<String, dynamic> toJson() => _$FileAccessLogToJson(this);
}

/// An object that represents a gateway route returned by a describe operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GatewayRouteData {
  /// The name of the gateway route.
  @_s.JsonKey(name: 'gatewayRouteName')
  final String gatewayRouteName;

  /// The name of the service mesh that the resource resides in.
  @_s.JsonKey(name: 'meshName')
  final String meshName;
  @_s.JsonKey(name: 'metadata')
  final ResourceMetadata metadata;

  /// The specifications of the gateway route.
  @_s.JsonKey(name: 'spec')
  final GatewayRouteSpec spec;

  /// The status of the gateway route.
  @_s.JsonKey(name: 'status')
  final GatewayRouteStatus status;

  /// The virtual gateway that the gateway route is associated with.
  @_s.JsonKey(name: 'virtualGatewayName')
  final String virtualGatewayName;

  GatewayRouteData({
    @_s.required this.gatewayRouteName,
    @_s.required this.meshName,
    @_s.required this.metadata,
    @_s.required this.spec,
    @_s.required this.status,
    @_s.required this.virtualGatewayName,
  });
  factory GatewayRouteData.fromJson(Map<String, dynamic> json) =>
      _$GatewayRouteDataFromJson(json);
}

/// An object that represents a gateway route returned by a list operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GatewayRouteRef {
  /// The full Amazon Resource Name (ARN) for the gateway route.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The name of the gateway route.
  @_s.JsonKey(name: 'gatewayRouteName')
  final String gatewayRouteName;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the service mesh that the resource resides in.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'meshOwner')
  final String meshOwner;

  /// The AWS IAM account ID of the resource owner. If the account ID is not your
  /// own, then it's the ID of the mesh owner or of another account that the mesh
  /// is shared with. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'resourceOwner')
  final String resourceOwner;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  @_s.JsonKey(name: 'version')
  final int version;

  /// The virtual gateway that the gateway route is associated with.
  @_s.JsonKey(name: 'virtualGatewayName')
  final String virtualGatewayName;

  GatewayRouteRef({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.gatewayRouteName,
    @_s.required this.lastUpdatedAt,
    @_s.required this.meshName,
    @_s.required this.meshOwner,
    @_s.required this.resourceOwner,
    @_s.required this.version,
    @_s.required this.virtualGatewayName,
  });
  factory GatewayRouteRef.fromJson(Map<String, dynamic> json) =>
      _$GatewayRouteRefFromJson(json);
}

/// An object that represents a gateway route specification. Specify one gateway
/// route type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GatewayRouteSpec {
  /// An object that represents the specification of a gRPC gateway route.
  @_s.JsonKey(name: 'grpcRoute')
  final GrpcGatewayRoute grpcRoute;

  /// An object that represents the specification of an HTTP/2 gateway route.
  @_s.JsonKey(name: 'http2Route')
  final HttpGatewayRoute http2Route;

  /// An object that represents the specification of an HTTP gateway route.
  @_s.JsonKey(name: 'httpRoute')
  final HttpGatewayRoute httpRoute;

  GatewayRouteSpec({
    this.grpcRoute,
    this.http2Route,
    this.httpRoute,
  });
  factory GatewayRouteSpec.fromJson(Map<String, dynamic> json) =>
      _$GatewayRouteSpecFromJson(json);

  Map<String, dynamic> toJson() => _$GatewayRouteSpecToJson(this);
}

/// An object that represents the current status of a gateway route.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GatewayRouteStatus {
  /// The current status for the gateway route.
  @_s.JsonKey(name: 'status')
  final GatewayRouteStatusCode status;

  GatewayRouteStatus({
    @_s.required this.status,
  });
  factory GatewayRouteStatus.fromJson(Map<String, dynamic> json) =>
      _$GatewayRouteStatusFromJson(json);
}

enum GatewayRouteStatusCode {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('DELETED')
  deleted,
}

/// An object that represents a gateway route target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GatewayRouteTarget {
  /// An object that represents a virtual service gateway route target.
  @_s.JsonKey(name: 'virtualService')
  final GatewayRouteVirtualService virtualService;

  GatewayRouteTarget({
    @_s.required this.virtualService,
  });
  factory GatewayRouteTarget.fromJson(Map<String, dynamic> json) =>
      _$GatewayRouteTargetFromJson(json);

  Map<String, dynamic> toJson() => _$GatewayRouteTargetToJson(this);
}

/// An object that represents the virtual service that traffic is routed to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GatewayRouteVirtualService {
  /// The name of the virtual service that traffic is routed to.
  @_s.JsonKey(name: 'virtualServiceName')
  final String virtualServiceName;

  GatewayRouteVirtualService({
    @_s.required this.virtualServiceName,
  });
  factory GatewayRouteVirtualService.fromJson(Map<String, dynamic> json) =>
      _$GatewayRouteVirtualServiceFromJson(json);

  Map<String, dynamic> toJson() => _$GatewayRouteVirtualServiceToJson(this);
}

/// An object that represents a gRPC gateway route.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GrpcGatewayRoute {
  /// An object that represents the action to take if a match is determined.
  @_s.JsonKey(name: 'action')
  final GrpcGatewayRouteAction action;

  /// An object that represents the criteria for determining a request match.
  @_s.JsonKey(name: 'match')
  final GrpcGatewayRouteMatch match;

  GrpcGatewayRoute({
    @_s.required this.action,
    @_s.required this.match,
  });
  factory GrpcGatewayRoute.fromJson(Map<String, dynamic> json) =>
      _$GrpcGatewayRouteFromJson(json);

  Map<String, dynamic> toJson() => _$GrpcGatewayRouteToJson(this);
}

/// An object that represents the action to take if a match is determined.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GrpcGatewayRouteAction {
  /// An object that represents the target that traffic is routed to when a
  /// request matches the gateway route.
  @_s.JsonKey(name: 'target')
  final GatewayRouteTarget target;

  GrpcGatewayRouteAction({
    @_s.required this.target,
  });
  factory GrpcGatewayRouteAction.fromJson(Map<String, dynamic> json) =>
      _$GrpcGatewayRouteActionFromJson(json);

  Map<String, dynamic> toJson() => _$GrpcGatewayRouteActionToJson(this);
}

/// An object that represents the criteria for determining a request match.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GrpcGatewayRouteMatch {
  /// The fully qualified domain name for the service to match from the request.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  GrpcGatewayRouteMatch({
    this.serviceName,
  });
  factory GrpcGatewayRouteMatch.fromJson(Map<String, dynamic> json) =>
      _$GrpcGatewayRouteMatchFromJson(json);

  Map<String, dynamic> toJson() => _$GrpcGatewayRouteMatchToJson(this);
}

/// An object that represents a retry policy. Specify at least one value for at
/// least one of the types of <code>RetryEvents</code>, a value for
/// <code>maxRetries</code>, and a value for <code>perRetryTimeout</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GrpcRetryPolicy {
  /// The maximum number of retry attempts.
  @_s.JsonKey(name: 'maxRetries')
  final int maxRetries;

  /// The timeout for each retry attempt.
  @_s.JsonKey(name: 'perRetryTimeout')
  final Duration perRetryTimeout;

  /// Specify at least one of the valid values.
  @_s.JsonKey(name: 'grpcRetryEvents')
  final List<GrpcRetryPolicyEvent> grpcRetryEvents;

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
  @_s.JsonKey(name: 'httpRetryEvents')
  final List<String> httpRetryEvents;

  /// Specify a valid value. The event occurs before any processing of a request
  /// has started and is encountered when the upstream is temporarily or
  /// permanently unavailable.
  @_s.JsonKey(name: 'tcpRetryEvents')
  final List<TcpRetryPolicyEvent> tcpRetryEvents;

  GrpcRetryPolicy({
    @_s.required this.maxRetries,
    @_s.required this.perRetryTimeout,
    this.grpcRetryEvents,
    this.httpRetryEvents,
    this.tcpRetryEvents,
  });
  factory GrpcRetryPolicy.fromJson(Map<String, dynamic> json) =>
      _$GrpcRetryPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$GrpcRetryPolicyToJson(this);
}

enum GrpcRetryPolicyEvent {
  @_s.JsonValue('cancelled')
  cancelled,
  @_s.JsonValue('deadline-exceeded')
  deadlineExceeded,
  @_s.JsonValue('internal')
  internal,
  @_s.JsonValue('resource-exhausted')
  resourceExhausted,
  @_s.JsonValue('unavailable')
  unavailable,
}

/// An object that represents a gRPC route type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GrpcRoute {
  /// An object that represents the action to take if a match is determined.
  @_s.JsonKey(name: 'action')
  final GrpcRouteAction action;

  /// An object that represents the criteria for determining a request match.
  @_s.JsonKey(name: 'match')
  final GrpcRouteMatch match;

  /// An object that represents a retry policy.
  @_s.JsonKey(name: 'retryPolicy')
  final GrpcRetryPolicy retryPolicy;

  /// An object that represents types of timeouts.
  @_s.JsonKey(name: 'timeout')
  final GrpcTimeout timeout;

  GrpcRoute({
    @_s.required this.action,
    @_s.required this.match,
    this.retryPolicy,
    this.timeout,
  });
  factory GrpcRoute.fromJson(Map<String, dynamic> json) =>
      _$GrpcRouteFromJson(json);

  Map<String, dynamic> toJson() => _$GrpcRouteToJson(this);
}

/// An object that represents the action to take if a match is determined.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GrpcRouteAction {
  /// An object that represents the targets that traffic is routed to when a
  /// request matches the route.
  @_s.JsonKey(name: 'weightedTargets')
  final List<WeightedTarget> weightedTargets;

  GrpcRouteAction({
    @_s.required this.weightedTargets,
  });
  factory GrpcRouteAction.fromJson(Map<String, dynamic> json) =>
      _$GrpcRouteActionFromJson(json);

  Map<String, dynamic> toJson() => _$GrpcRouteActionToJson(this);
}

/// An object that represents the criteria for determining a request match.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GrpcRouteMatch {
  /// An object that represents the data to match from the request.
  @_s.JsonKey(name: 'metadata')
  final List<GrpcRouteMetadata> metadata;

  /// The method name to match from the request. If you specify a name, you must
  /// also specify a <code>serviceName</code>.
  @_s.JsonKey(name: 'methodName')
  final String methodName;

  /// The fully qualified domain name for the service to match from the request.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  GrpcRouteMatch({
    this.metadata,
    this.methodName,
    this.serviceName,
  });
  factory GrpcRouteMatch.fromJson(Map<String, dynamic> json) =>
      _$GrpcRouteMatchFromJson(json);

  Map<String, dynamic> toJson() => _$GrpcRouteMatchToJson(this);
}

/// An object that represents the match metadata for the route.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GrpcRouteMetadata {
  /// The name of the route.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Specify <code>True</code> to match anything except the match criteria. The
  /// default value is <code>False</code>.
  @_s.JsonKey(name: 'invert')
  final bool invert;

  /// An object that represents the data to match from the request.
  @_s.JsonKey(name: 'match')
  final GrpcRouteMetadataMatchMethod match;

  GrpcRouteMetadata({
    @_s.required this.name,
    this.invert,
    this.match,
  });
  factory GrpcRouteMetadata.fromJson(Map<String, dynamic> json) =>
      _$GrpcRouteMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$GrpcRouteMetadataToJson(this);
}

/// An object that represents the match method. Specify one of the match values.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GrpcRouteMetadataMatchMethod {
  /// The value sent by the client must match the specified value exactly.
  @_s.JsonKey(name: 'exact')
  final String exact;

  /// The value sent by the client must begin with the specified characters.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  /// An object that represents the range of values to match on.
  @_s.JsonKey(name: 'range')
  final MatchRange range;

  /// The value sent by the client must include the specified characters.
  @_s.JsonKey(name: 'regex')
  final String regex;

  /// The value sent by the client must end with the specified characters.
  @_s.JsonKey(name: 'suffix')
  final String suffix;

  GrpcRouteMetadataMatchMethod({
    this.exact,
    this.prefix,
    this.range,
    this.regex,
    this.suffix,
  });
  factory GrpcRouteMetadataMatchMethod.fromJson(Map<String, dynamic> json) =>
      _$GrpcRouteMetadataMatchMethodFromJson(json);

  Map<String, dynamic> toJson() => _$GrpcRouteMetadataMatchMethodToJson(this);
}

/// An object that represents types of timeouts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GrpcTimeout {
  /// An object that represents an idle timeout. An idle timeout bounds the amount
  /// of time that a connection may be idle. The default value is none.
  @_s.JsonKey(name: 'idle')
  final Duration idle;

  /// An object that represents a per request timeout. The default value is 15
  /// seconds. If you set a higher timeout, then make sure that the higher value
  /// is set for each App Mesh resource in a conversation. For example, if a
  /// virtual node backend uses a virtual router provider to route to another
  /// virtual node, then the timeout should be greater than 15 seconds for the
  /// source and destination virtual node and the route.
  @_s.JsonKey(name: 'perRequest')
  final Duration perRequest;

  GrpcTimeout({
    this.idle,
    this.perRequest,
  });
  factory GrpcTimeout.fromJson(Map<String, dynamic> json) =>
      _$GrpcTimeoutFromJson(json);

  Map<String, dynamic> toJson() => _$GrpcTimeoutToJson(this);
}

/// An object that represents the method and value to match with the header
/// value sent in a request. Specify one match method.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HeaderMatchMethod {
  /// The value sent by the client must match the specified value exactly.
  @_s.JsonKey(name: 'exact')
  final String exact;

  /// The value sent by the client must begin with the specified characters.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  /// An object that represents the range of values to match on.
  @_s.JsonKey(name: 'range')
  final MatchRange range;

  /// The value sent by the client must include the specified characters.
  @_s.JsonKey(name: 'regex')
  final String regex;

  /// The value sent by the client must end with the specified characters.
  @_s.JsonKey(name: 'suffix')
  final String suffix;

  HeaderMatchMethod({
    this.exact,
    this.prefix,
    this.range,
    this.regex,
    this.suffix,
  });
  factory HeaderMatchMethod.fromJson(Map<String, dynamic> json) =>
      _$HeaderMatchMethodFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderMatchMethodToJson(this);
}

/// An object that represents the health check policy for a virtual node's
/// listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HealthCheckPolicy {
  /// The number of consecutive successful health checks that must occur before
  /// declaring listener healthy.
  @_s.JsonKey(name: 'healthyThreshold')
  final int healthyThreshold;

  /// The time period in milliseconds between each health check execution.
  @_s.JsonKey(name: 'intervalMillis')
  final int intervalMillis;

  /// The protocol for the health check request. If you specify <code>grpc</code>,
  /// then your service must conform to the <a
  /// href="https://github.com/grpc/grpc/blob/master/doc/health-checking.md">GRPC
  /// Health Checking Protocol</a>.
  @_s.JsonKey(name: 'protocol')
  final PortProtocol protocol;

  /// The amount of time to wait when receiving a response from the health check,
  /// in milliseconds.
  @_s.JsonKey(name: 'timeoutMillis')
  final int timeoutMillis;

  /// The number of consecutive failed health checks that must occur before
  /// declaring a virtual node unhealthy.
  @_s.JsonKey(name: 'unhealthyThreshold')
  final int unhealthyThreshold;

  /// The destination path for the health check request. This value is only used
  /// if the specified protocol is HTTP or HTTP/2. For any other protocol, this
  /// value is ignored.
  @_s.JsonKey(name: 'path')
  final String path;

  /// The destination port for the health check request. This port must match the
  /// port defined in the <a>PortMapping</a> for the listener.
  @_s.JsonKey(name: 'port')
  final int port;

  HealthCheckPolicy({
    @_s.required this.healthyThreshold,
    @_s.required this.intervalMillis,
    @_s.required this.protocol,
    @_s.required this.timeoutMillis,
    @_s.required this.unhealthyThreshold,
    this.path,
    this.port,
  });
  factory HealthCheckPolicy.fromJson(Map<String, dynamic> json) =>
      _$HealthCheckPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$HealthCheckPolicyToJson(this);
}

/// An object that represents an HTTP gateway route.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpGatewayRoute {
  /// An object that represents the action to take if a match is determined.
  @_s.JsonKey(name: 'action')
  final HttpGatewayRouteAction action;

  /// An object that represents the criteria for determining a request match.
  @_s.JsonKey(name: 'match')
  final HttpGatewayRouteMatch match;

  HttpGatewayRoute({
    @_s.required this.action,
    @_s.required this.match,
  });
  factory HttpGatewayRoute.fromJson(Map<String, dynamic> json) =>
      _$HttpGatewayRouteFromJson(json);

  Map<String, dynamic> toJson() => _$HttpGatewayRouteToJson(this);
}

/// An object that represents the action to take if a match is determined.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpGatewayRouteAction {
  /// An object that represents the target that traffic is routed to when a
  /// request matches the gateway route.
  @_s.JsonKey(name: 'target')
  final GatewayRouteTarget target;

  HttpGatewayRouteAction({
    @_s.required this.target,
  });
  factory HttpGatewayRouteAction.fromJson(Map<String, dynamic> json) =>
      _$HttpGatewayRouteActionFromJson(json);

  Map<String, dynamic> toJson() => _$HttpGatewayRouteActionToJson(this);
}

/// An object that represents the criteria for determining a request match.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpGatewayRouteMatch {
  /// Specifies the path to match requests with. This parameter must always start
  /// with <code>/</code>, which by itself matches all requests to the virtual
  /// service name. You can also match for path-based routing of requests. For
  /// example, if your virtual service name is <code>my-service.local</code> and
  /// you want the route to match requests to
  /// <code>my-service.local/metrics</code>, your prefix should be
  /// <code>/metrics</code>.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  HttpGatewayRouteMatch({
    @_s.required this.prefix,
  });
  factory HttpGatewayRouteMatch.fromJson(Map<String, dynamic> json) =>
      _$HttpGatewayRouteMatchFromJson(json);

  Map<String, dynamic> toJson() => _$HttpGatewayRouteMatchToJson(this);
}

enum HttpMethod {
  @_s.JsonValue('GET')
  get,
  @_s.JsonValue('HEAD')
  head,
  @_s.JsonValue('POST')
  post,
  @_s.JsonValue('PUT')
  put,
  @_s.JsonValue('DELETE')
  delete,
  @_s.JsonValue('CONNECT')
  connect,
  @_s.JsonValue('OPTIONS')
  options,
  @_s.JsonValue('TRACE')
  trace,
  @_s.JsonValue('PATCH')
  patch,
}

/// An object that represents a retry policy. Specify at least one value for at
/// least one of the types of <code>RetryEvents</code>, a value for
/// <code>maxRetries</code>, and a value for <code>perRetryTimeout</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpRetryPolicy {
  /// The maximum number of retry attempts.
  @_s.JsonKey(name: 'maxRetries')
  final int maxRetries;

  /// The timeout for each retry attempt.
  @_s.JsonKey(name: 'perRetryTimeout')
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
  @_s.JsonKey(name: 'httpRetryEvents')
  final List<String> httpRetryEvents;

  /// Specify a valid value. The event occurs before any processing of a request
  /// has started and is encountered when the upstream is temporarily or
  /// permanently unavailable.
  @_s.JsonKey(name: 'tcpRetryEvents')
  final List<TcpRetryPolicyEvent> tcpRetryEvents;

  HttpRetryPolicy({
    @_s.required this.maxRetries,
    @_s.required this.perRetryTimeout,
    this.httpRetryEvents,
    this.tcpRetryEvents,
  });
  factory HttpRetryPolicy.fromJson(Map<String, dynamic> json) =>
      _$HttpRetryPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$HttpRetryPolicyToJson(this);
}

/// An object that represents an HTTP or HTTP/2 route type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpRoute {
  /// An object that represents the action to take if a match is determined.
  @_s.JsonKey(name: 'action')
  final HttpRouteAction action;

  /// An object that represents the criteria for determining a request match.
  @_s.JsonKey(name: 'match')
  final HttpRouteMatch match;

  /// An object that represents a retry policy.
  @_s.JsonKey(name: 'retryPolicy')
  final HttpRetryPolicy retryPolicy;

  /// An object that represents types of timeouts.
  @_s.JsonKey(name: 'timeout')
  final HttpTimeout timeout;

  HttpRoute({
    @_s.required this.action,
    @_s.required this.match,
    this.retryPolicy,
    this.timeout,
  });
  factory HttpRoute.fromJson(Map<String, dynamic> json) =>
      _$HttpRouteFromJson(json);

  Map<String, dynamic> toJson() => _$HttpRouteToJson(this);
}

/// An object that represents the action to take if a match is determined.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpRouteAction {
  /// An object that represents the targets that traffic is routed to when a
  /// request matches the route.
  @_s.JsonKey(name: 'weightedTargets')
  final List<WeightedTarget> weightedTargets;

  HttpRouteAction({
    @_s.required this.weightedTargets,
  });
  factory HttpRouteAction.fromJson(Map<String, dynamic> json) =>
      _$HttpRouteActionFromJson(json);

  Map<String, dynamic> toJson() => _$HttpRouteActionToJson(this);
}

/// An object that represents the HTTP header in the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpRouteHeader {
  /// A name for the HTTP header in the client request that will be matched on.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Specify <code>True</code> to match anything except the match criteria. The
  /// default value is <code>False</code>.
  @_s.JsonKey(name: 'invert')
  final bool invert;

  /// The <code>HeaderMatchMethod</code> object.
  @_s.JsonKey(name: 'match')
  final HeaderMatchMethod match;

  HttpRouteHeader({
    @_s.required this.name,
    this.invert,
    this.match,
  });
  factory HttpRouteHeader.fromJson(Map<String, dynamic> json) =>
      _$HttpRouteHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HttpRouteHeaderToJson(this);
}

/// An object that represents the requirements for a route to match HTTP
/// requests for a virtual router.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpRouteMatch {
  /// Specifies the path to match requests with. This parameter must always start
  /// with <code>/</code>, which by itself matches all requests to the virtual
  /// service name. You can also match for path-based routing of requests. For
  /// example, if your virtual service name is <code>my-service.local</code> and
  /// you want the route to match requests to
  /// <code>my-service.local/metrics</code>, your prefix should be
  /// <code>/metrics</code>.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  /// An object that represents the client request headers to match on.
  @_s.JsonKey(name: 'headers')
  final List<HttpRouteHeader> headers;

  /// The client request method to match on. Specify only one.
  @_s.JsonKey(name: 'method')
  final HttpMethod method;

  /// The client request scheme to match on. Specify only one.
  @_s.JsonKey(name: 'scheme')
  final HttpScheme scheme;

  HttpRouteMatch({
    @_s.required this.prefix,
    this.headers,
    this.method,
    this.scheme,
  });
  factory HttpRouteMatch.fromJson(Map<String, dynamic> json) =>
      _$HttpRouteMatchFromJson(json);

  Map<String, dynamic> toJson() => _$HttpRouteMatchToJson(this);
}

enum HttpScheme {
  @_s.JsonValue('http')
  http,
  @_s.JsonValue('https')
  https,
}

/// An object that represents types of timeouts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpTimeout {
  /// An object that represents an idle timeout. An idle timeout bounds the amount
  /// of time that a connection may be idle. The default value is none.
  @_s.JsonKey(name: 'idle')
  final Duration idle;

  /// An object that represents a per request timeout. The default value is 15
  /// seconds. If you set a higher timeout, then make sure that the higher value
  /// is set for each App Mesh resource in a conversation. For example, if a
  /// virtual node backend uses a virtual router provider to route to another
  /// virtual node, then the timeout should be greater than 15 seconds for the
  /// source and destination virtual node and the route.
  @_s.JsonKey(name: 'perRequest')
  final Duration perRequest;

  HttpTimeout({
    this.idle,
    this.perRequest,
  });
  factory HttpTimeout.fromJson(Map<String, dynamic> json) =>
      _$HttpTimeoutFromJson(json);

  Map<String, dynamic> toJson() => _$HttpTimeoutToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGatewayRoutesOutput {
  /// The list of existing gateway routes for the specified service mesh and
  /// virtual gateway.
  @_s.JsonKey(name: 'gatewayRoutes')
  final List<GatewayRouteRef> gatewayRoutes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListGatewayRoutes</code> request. When the results of a
  /// <code>ListGatewayRoutes</code> request exceed <code>limit</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListGatewayRoutesOutput({
    @_s.required this.gatewayRoutes,
    this.nextToken,
  });
  factory ListGatewayRoutesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListGatewayRoutesOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMeshesOutput {
  /// The list of existing service meshes.
  @_s.JsonKey(name: 'meshes')
  final List<MeshRef> meshes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListMeshes</code> request. When the results of a
  /// <code>ListMeshes</code> request exceed <code>limit</code>, you can use this
  /// value to retrieve the next page of results. This value is <code>null</code>
  /// when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListMeshesOutput({
    @_s.required this.meshes,
    this.nextToken,
  });
  factory ListMeshesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListMeshesOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRoutesOutput {
  /// The list of existing routes for the specified service mesh and virtual
  /// router.
  @_s.JsonKey(name: 'routes')
  final List<RouteRef> routes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListRoutes</code> request. When the results of a
  /// <code>ListRoutes</code> request exceed <code>limit</code>, you can use this
  /// value to retrieve the next page of results. This value is <code>null</code>
  /// when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListRoutesOutput({
    @_s.required this.routes,
    this.nextToken,
  });
  factory ListRoutesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListRoutesOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceOutput {
  /// The tags for the resource.
  @_s.JsonKey(name: 'tags')
  final List<TagRef> tags;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListTagsForResource</code> request. When the results of a
  /// <code>ListTagsForResource</code> request exceed <code>limit</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListTagsForResourceOutput({
    @_s.required this.tags,
    this.nextToken,
  });
  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVirtualGatewaysOutput {
  /// The list of existing virtual gateways for the specified service mesh.
  @_s.JsonKey(name: 'virtualGateways')
  final List<VirtualGatewayRef> virtualGateways;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListVirtualGateways</code> request. When the results of a
  /// <code>ListVirtualGateways</code> request exceed <code>limit</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListVirtualGatewaysOutput({
    @_s.required this.virtualGateways,
    this.nextToken,
  });
  factory ListVirtualGatewaysOutput.fromJson(Map<String, dynamic> json) =>
      _$ListVirtualGatewaysOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVirtualNodesOutput {
  /// The list of existing virtual nodes for the specified service mesh.
  @_s.JsonKey(name: 'virtualNodes')
  final List<VirtualNodeRef> virtualNodes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListVirtualNodes</code> request. When the results of a
  /// <code>ListVirtualNodes</code> request exceed <code>limit</code>, you can use
  /// this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListVirtualNodesOutput({
    @_s.required this.virtualNodes,
    this.nextToken,
  });
  factory ListVirtualNodesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListVirtualNodesOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVirtualRoutersOutput {
  /// The list of existing virtual routers for the specified service mesh.
  @_s.JsonKey(name: 'virtualRouters')
  final List<VirtualRouterRef> virtualRouters;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListVirtualRouters</code> request. When the results of a
  /// <code>ListVirtualRouters</code> request exceed <code>limit</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListVirtualRoutersOutput({
    @_s.required this.virtualRouters,
    this.nextToken,
  });
  factory ListVirtualRoutersOutput.fromJson(Map<String, dynamic> json) =>
      _$ListVirtualRoutersOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVirtualServicesOutput {
  /// The list of existing virtual services for the specified service mesh.
  @_s.JsonKey(name: 'virtualServices')
  final List<VirtualServiceRef> virtualServices;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListVirtualServices</code> request. When the results of a
  /// <code>ListVirtualServices</code> request exceed <code>limit</code>, you can
  /// use this value to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListVirtualServicesOutput({
    @_s.required this.virtualServices,
    this.nextToken,
  });
  factory ListVirtualServicesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListVirtualServicesOutputFromJson(json);
}

/// An object that represents a listener for a virtual node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Listener {
  /// The port mapping information for the listener.
  @_s.JsonKey(name: 'portMapping')
  final PortMapping portMapping;

  /// The connection pool information for the listener.
  @_s.JsonKey(name: 'connectionPool')
  final VirtualNodeConnectionPool connectionPool;

  /// The health check information for the listener.
  @_s.JsonKey(name: 'healthCheck')
  final HealthCheckPolicy healthCheck;

  /// The outlier detection information for the listener.
  @_s.JsonKey(name: 'outlierDetection')
  final OutlierDetection outlierDetection;

  /// An object that represents timeouts for different protocols.
  @_s.JsonKey(name: 'timeout')
  final ListenerTimeout timeout;

  /// A reference to an object that represents the Transport Layer Security (TLS)
  /// properties for a listener.
  @_s.JsonKey(name: 'tls')
  final ListenerTls tls;

  Listener({
    @_s.required this.portMapping,
    this.connectionPool,
    this.healthCheck,
    this.outlierDetection,
    this.timeout,
    this.tls,
  });
  factory Listener.fromJson(Map<String, dynamic> json) =>
      _$ListenerFromJson(json);

  Map<String, dynamic> toJson() => _$ListenerToJson(this);
}

/// An object that represents timeouts for different protocols.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ListenerTimeout {
  @_s.JsonKey(name: 'grpc')
  final GrpcTimeout grpc;

  /// An object that represents types of timeouts.
  @_s.JsonKey(name: 'http')
  final HttpTimeout http;

  /// An object that represents types of timeouts.
  @_s.JsonKey(name: 'http2')
  final HttpTimeout http2;

  /// An object that represents types of timeouts.
  @_s.JsonKey(name: 'tcp')
  final TcpTimeout tcp;

  ListenerTimeout({
    this.grpc,
    this.http,
    this.http2,
    this.tcp,
  });
  factory ListenerTimeout.fromJson(Map<String, dynamic> json) =>
      _$ListenerTimeoutFromJson(json);

  Map<String, dynamic> toJson() => _$ListenerTimeoutToJson(this);
}

/// An object that represents the Transport Layer Security (TLS) properties for
/// a listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ListenerTls {
  /// A reference to an object that represents a listener's TLS certificate.
  @_s.JsonKey(name: 'certificate')
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
  @_s.JsonKey(name: 'mode')
  final ListenerTlsMode mode;

  ListenerTls({
    @_s.required this.certificate,
    @_s.required this.mode,
  });
  factory ListenerTls.fromJson(Map<String, dynamic> json) =>
      _$ListenerTlsFromJson(json);

  Map<String, dynamic> toJson() => _$ListenerTlsToJson(this);
}

/// An object that represents an AWS Certicate Manager (ACM) certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ListenerTlsAcmCertificate {
  /// The Amazon Resource Name (ARN) for the certificate. The certificate must
  /// meet specific requirements and you must have proxy authorization enabled.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html#virtual-node-tls-prerequisites">Transport
  /// Layer Security (TLS)</a>.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  ListenerTlsAcmCertificate({
    @_s.required this.certificateArn,
  });
  factory ListenerTlsAcmCertificate.fromJson(Map<String, dynamic> json) =>
      _$ListenerTlsAcmCertificateFromJson(json);

  Map<String, dynamic> toJson() => _$ListenerTlsAcmCertificateToJson(this);
}

/// An object that represents a listener's Transport Layer Security (TLS)
/// certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ListenerTlsCertificate {
  /// A reference to an object that represents an AWS Certicate Manager (ACM)
  /// certificate.
  @_s.JsonKey(name: 'acm')
  final ListenerTlsAcmCertificate acm;

  /// A reference to an object that represents a local file certificate.
  @_s.JsonKey(name: 'file')
  final ListenerTlsFileCertificate file;

  ListenerTlsCertificate({
    this.acm,
    this.file,
  });
  factory ListenerTlsCertificate.fromJson(Map<String, dynamic> json) =>
      _$ListenerTlsCertificateFromJson(json);

  Map<String, dynamic> toJson() => _$ListenerTlsCertificateToJson(this);
}

/// An object that represents a local file certificate. The certificate must
/// meet specific requirements and you must have proxy authorization enabled.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html#virtual-node-tls-prerequisites">Transport
/// Layer Security (TLS)</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ListenerTlsFileCertificate {
  /// The certificate chain for the certificate.
  @_s.JsonKey(name: 'certificateChain')
  final String certificateChain;

  /// The private key for a certificate stored on the file system of the virtual
  /// node that the proxy is running on.
  @_s.JsonKey(name: 'privateKey')
  final String privateKey;

  ListenerTlsFileCertificate({
    @_s.required this.certificateChain,
    @_s.required this.privateKey,
  });
  factory ListenerTlsFileCertificate.fromJson(Map<String, dynamic> json) =>
      _$ListenerTlsFileCertificateFromJson(json);

  Map<String, dynamic> toJson() => _$ListenerTlsFileCertificateToJson(this);
}

enum ListenerTlsMode {
  @_s.JsonValue('STRICT')
  strict,
  @_s.JsonValue('PERMISSIVE')
  permissive,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// An object that represents the logging information for a virtual node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Logging {
  /// The access log configuration for a virtual node.
  @_s.JsonKey(name: 'accessLog')
  final AccessLog accessLog;

  Logging({
    this.accessLog,
  });
  factory Logging.fromJson(Map<String, dynamic> json) =>
      _$LoggingFromJson(json);

  Map<String, dynamic> toJson() => _$LoggingToJson(this);
}

/// An object that represents the range of values to match on. The first
/// character of the range is included in the range, though the last character
/// is not. For example, if the range specified were 1-100, only values 1-99
/// would be matched.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MatchRange {
  /// The end of the range.
  @_s.JsonKey(name: 'end')
  final int end;

  /// The start of the range.
  @_s.JsonKey(name: 'start')
  final int start;

  MatchRange({
    @_s.required this.end,
    @_s.required this.start,
  });
  factory MatchRange.fromJson(Map<String, dynamic> json) =>
      _$MatchRangeFromJson(json);

  Map<String, dynamic> toJson() => _$MatchRangeToJson(this);
}

/// An object that represents a service mesh returned by a describe operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MeshData {
  /// The name of the service mesh.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The associated metadata for the service mesh.
  @_s.JsonKey(name: 'metadata')
  final ResourceMetadata metadata;

  /// The associated specification for the service mesh.
  @_s.JsonKey(name: 'spec')
  final MeshSpec spec;

  /// The status of the service mesh.
  @_s.JsonKey(name: 'status')
  final MeshStatus status;

  MeshData({
    @_s.required this.meshName,
    @_s.required this.metadata,
    @_s.required this.spec,
    @_s.required this.status,
  });
  factory MeshData.fromJson(Map<String, dynamic> json) =>
      _$MeshDataFromJson(json);
}

/// An object that represents a service mesh returned by a list operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MeshRef {
  /// The full Amazon Resource Name (ARN) of the service mesh.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the service mesh.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'meshOwner')
  final String meshOwner;

  /// The AWS IAM account ID of the resource owner. If the account ID is not your
  /// own, then it's the ID of the mesh owner or of another account that the mesh
  /// is shared with. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'resourceOwner')
  final String resourceOwner;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  @_s.JsonKey(name: 'version')
  final int version;

  MeshRef({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.lastUpdatedAt,
    @_s.required this.meshName,
    @_s.required this.meshOwner,
    @_s.required this.resourceOwner,
    @_s.required this.version,
  });
  factory MeshRef.fromJson(Map<String, dynamic> json) =>
      _$MeshRefFromJson(json);
}

/// An object that represents the specification of a service mesh.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MeshSpec {
  /// The egress filter rules for the service mesh.
  @_s.JsonKey(name: 'egressFilter')
  final EgressFilter egressFilter;

  MeshSpec({
    this.egressFilter,
  });
  factory MeshSpec.fromJson(Map<String, dynamic> json) =>
      _$MeshSpecFromJson(json);

  Map<String, dynamic> toJson() => _$MeshSpecToJson(this);
}

/// An object that represents the status of a service mesh.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MeshStatus {
  /// The current mesh status.
  @_s.JsonKey(name: 'status')
  final MeshStatusCode status;

  MeshStatus({
    this.status,
  });
  factory MeshStatus.fromJson(Map<String, dynamic> json) =>
      _$MeshStatusFromJson(json);
}

enum MeshStatusCode {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('DELETED')
  deleted,
}

/// An object that represents the outlier detection for a virtual node's
/// listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutlierDetection {
  /// The base amount of time for which a host is ejected.
  @_s.JsonKey(name: 'baseEjectionDuration')
  final Duration baseEjectionDuration;

  /// The time interval between ejection sweep analysis.
  @_s.JsonKey(name: 'interval')
  final Duration interval;

  /// Maximum percentage of hosts in load balancing pool for upstream service that
  /// can be ejected. Will eject at least one host regardless of the value.
  @_s.JsonKey(name: 'maxEjectionPercent')
  final int maxEjectionPercent;

  /// Number of consecutive <code>5xx</code> errors required for ejection.
  @_s.JsonKey(name: 'maxServerErrors')
  final int maxServerErrors;

  OutlierDetection({
    @_s.required this.baseEjectionDuration,
    @_s.required this.interval,
    @_s.required this.maxEjectionPercent,
    @_s.required this.maxServerErrors,
  });
  factory OutlierDetection.fromJson(Map<String, dynamic> json) =>
      _$OutlierDetectionFromJson(json);

  Map<String, dynamic> toJson() => _$OutlierDetectionToJson(this);
}

/// An object that represents a port mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PortMapping {
  /// The port used for the port mapping.
  @_s.JsonKey(name: 'port')
  final int port;

  /// The protocol used for the port mapping. Specify one protocol.
  @_s.JsonKey(name: 'protocol')
  final PortProtocol protocol;

  PortMapping({
    @_s.required this.port,
    @_s.required this.protocol,
  });
  factory PortMapping.fromJson(Map<String, dynamic> json) =>
      _$PortMappingFromJson(json);

  Map<String, dynamic> toJson() => _$PortMappingToJson(this);
}

enum PortProtocol {
  @_s.JsonValue('http')
  http,
  @_s.JsonValue('tcp')
  tcp,
  @_s.JsonValue('http2')
  http2,
  @_s.JsonValue('grpc')
  grpc,
}

/// An object that represents metadata for a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceMetadata {
  /// The full Amazon Resource Name (ARN) for the resource.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'meshOwner')
  final String meshOwner;

  /// The AWS IAM account ID of the resource owner. If the account ID is not your
  /// own, then it's the ID of the mesh owner or of another account that the mesh
  /// is shared with. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'resourceOwner')
  final String resourceOwner;

  /// The unique identifier for the resource.
  @_s.JsonKey(name: 'uid')
  final String uid;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  @_s.JsonKey(name: 'version')
  final int version;

  ResourceMetadata({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.lastUpdatedAt,
    @_s.required this.meshOwner,
    @_s.required this.resourceOwner,
    @_s.required this.uid,
    @_s.required this.version,
  });
  factory ResourceMetadata.fromJson(Map<String, dynamic> json) =>
      _$ResourceMetadataFromJson(json);
}

/// An object that represents a route returned by a describe operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RouteData {
  /// The name of the service mesh that the route resides in.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The associated metadata for the route.
  @_s.JsonKey(name: 'metadata')
  final ResourceMetadata metadata;

  /// The name of the route.
  @_s.JsonKey(name: 'routeName')
  final String routeName;

  /// The specifications of the route.
  @_s.JsonKey(name: 'spec')
  final RouteSpec spec;

  /// The status of the route.
  @_s.JsonKey(name: 'status')
  final RouteStatus status;

  /// The virtual router that the route is associated with.
  @_s.JsonKey(name: 'virtualRouterName')
  final String virtualRouterName;

  RouteData({
    @_s.required this.meshName,
    @_s.required this.metadata,
    @_s.required this.routeName,
    @_s.required this.spec,
    @_s.required this.status,
    @_s.required this.virtualRouterName,
  });
  factory RouteData.fromJson(Map<String, dynamic> json) =>
      _$RouteDataFromJson(json);
}

/// An object that represents a route returned by a list operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RouteRef {
  /// The full Amazon Resource Name (ARN) for the route.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the service mesh that the route resides in.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'meshOwner')
  final String meshOwner;

  /// The AWS IAM account ID of the resource owner. If the account ID is not your
  /// own, then it's the ID of the mesh owner or of another account that the mesh
  /// is shared with. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'resourceOwner')
  final String resourceOwner;

  /// The name of the route.
  @_s.JsonKey(name: 'routeName')
  final String routeName;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  @_s.JsonKey(name: 'version')
  final int version;

  /// The virtual router that the route is associated with.
  @_s.JsonKey(name: 'virtualRouterName')
  final String virtualRouterName;

  RouteRef({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.lastUpdatedAt,
    @_s.required this.meshName,
    @_s.required this.meshOwner,
    @_s.required this.resourceOwner,
    @_s.required this.routeName,
    @_s.required this.version,
    @_s.required this.virtualRouterName,
  });
  factory RouteRef.fromJson(Map<String, dynamic> json) =>
      _$RouteRefFromJson(json);
}

/// An object that represents a route specification. Specify one route type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RouteSpec {
  /// An object that represents the specification of a gRPC route.
  @_s.JsonKey(name: 'grpcRoute')
  final GrpcRoute grpcRoute;

  /// An object that represents the specification of an HTTP/2 route.
  @_s.JsonKey(name: 'http2Route')
  final HttpRoute http2Route;

  /// An object that represents the specification of an HTTP route.
  @_s.JsonKey(name: 'httpRoute')
  final HttpRoute httpRoute;

  /// The priority for the route. Routes are matched based on the specified value,
  /// where 0 is the highest priority.
  @_s.JsonKey(name: 'priority')
  final int priority;

  /// An object that represents the specification of a TCP route.
  @_s.JsonKey(name: 'tcpRoute')
  final TcpRoute tcpRoute;

  RouteSpec({
    this.grpcRoute,
    this.http2Route,
    this.httpRoute,
    this.priority,
    this.tcpRoute,
  });
  factory RouteSpec.fromJson(Map<String, dynamic> json) =>
      _$RouteSpecFromJson(json);

  Map<String, dynamic> toJson() => _$RouteSpecToJson(this);
}

/// An object that represents the current status of a route.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RouteStatus {
  /// The current status for the route.
  @_s.JsonKey(name: 'status')
  final RouteStatusCode status;

  RouteStatus({
    @_s.required this.status,
  });
  factory RouteStatus.fromJson(Map<String, dynamic> json) =>
      _$RouteStatusFromJson(json);
}

enum RouteStatusCode {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('DELETED')
  deleted,
}

/// An object that represents the service discovery information for a virtual
/// node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServiceDiscovery {
  /// Specifies any AWS Cloud Map information for the virtual node.
  @_s.JsonKey(name: 'awsCloudMap')
  final AwsCloudMapServiceDiscovery awsCloudMap;

  /// Specifies the DNS information for the virtual node.
  @_s.JsonKey(name: 'dns')
  final DnsServiceDiscovery dns;

  ServiceDiscovery({
    this.awsCloudMap,
    this.dns,
  });
  factory ServiceDiscovery.fromJson(Map<String, dynamic> json) =>
      _$ServiceDiscoveryFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceDiscoveryToJson(this);
}

/// Optional metadata that you apply to a resource to assist with categorization
/// and organization. Each tag consists of a key and an optional value, both of
/// which you define. Tag keys can have a maximum character length of 128
/// characters, and tag values can have a maximum length of 256 characters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TagRef {
  /// One part of a key-value pair that make up a tag. A <code>key</code> is a
  /// general label that acts like a category for more specific tag values.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The optional part of a key-value pair that make up a tag. A
  /// <code>value</code> acts as a descriptor within a tag category (key).
  @_s.JsonKey(name: 'value')
  final String value;

  TagRef({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory TagRef.fromJson(Map<String, dynamic> json) => _$TagRefFromJson(json);

  Map<String, dynamic> toJson() => _$TagRefToJson(this);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceOutput {
  TagResourceOutput();
  factory TagResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$TagResourceOutputFromJson(json);
}

enum TcpRetryPolicyEvent {
  @_s.JsonValue('connection-error')
  connectionError,
}

/// An object that represents a TCP route type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TcpRoute {
  /// The action to take if a match is determined.
  @_s.JsonKey(name: 'action')
  final TcpRouteAction action;

  /// An object that represents types of timeouts.
  @_s.JsonKey(name: 'timeout')
  final TcpTimeout timeout;

  TcpRoute({
    @_s.required this.action,
    this.timeout,
  });
  factory TcpRoute.fromJson(Map<String, dynamic> json) =>
      _$TcpRouteFromJson(json);

  Map<String, dynamic> toJson() => _$TcpRouteToJson(this);
}

/// An object that represents the action to take if a match is determined.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TcpRouteAction {
  /// An object that represents the targets that traffic is routed to when a
  /// request matches the route.
  @_s.JsonKey(name: 'weightedTargets')
  final List<WeightedTarget> weightedTargets;

  TcpRouteAction({
    @_s.required this.weightedTargets,
  });
  factory TcpRouteAction.fromJson(Map<String, dynamic> json) =>
      _$TcpRouteActionFromJson(json);

  Map<String, dynamic> toJson() => _$TcpRouteActionToJson(this);
}

/// An object that represents types of timeouts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TcpTimeout {
  /// An object that represents an idle timeout. An idle timeout bounds the amount
  /// of time that a connection may be idle. The default value is none.
  @_s.JsonKey(name: 'idle')
  final Duration idle;

  TcpTimeout({
    this.idle,
  });
  factory TcpTimeout.fromJson(Map<String, dynamic> json) =>
      _$TcpTimeoutFromJson(json);

  Map<String, dynamic> toJson() => _$TcpTimeoutToJson(this);
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TlsValidationContext {
  /// A reference to an object that represents a TLS validation context trust.
  @_s.JsonKey(name: 'trust')
  final TlsValidationContextTrust trust;

  TlsValidationContext({
    @_s.required this.trust,
  });
  factory TlsValidationContext.fromJson(Map<String, dynamic> json) =>
      _$TlsValidationContextFromJson(json);

  Map<String, dynamic> toJson() => _$TlsValidationContextToJson(this);
}

/// An object that represents a TLS validation context trust for an AWS
/// Certicate Manager (ACM) certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TlsValidationContextAcmTrust {
  /// One or more ACM Amazon Resource Name (ARN)s.
  @_s.JsonKey(name: 'certificateAuthorityArns')
  final List<String> certificateAuthorityArns;

  TlsValidationContextAcmTrust({
    @_s.required this.certificateAuthorityArns,
  });
  factory TlsValidationContextAcmTrust.fromJson(Map<String, dynamic> json) =>
      _$TlsValidationContextAcmTrustFromJson(json);

  Map<String, dynamic> toJson() => _$TlsValidationContextAcmTrustToJson(this);
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context trust for a local file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TlsValidationContextFileTrust {
  /// The certificate trust chain for a certificate stored on the file system of
  /// the virtual node that the proxy is running on.
  @_s.JsonKey(name: 'certificateChain')
  final String certificateChain;

  TlsValidationContextFileTrust({
    @_s.required this.certificateChain,
  });
  factory TlsValidationContextFileTrust.fromJson(Map<String, dynamic> json) =>
      _$TlsValidationContextFileTrustFromJson(json);

  Map<String, dynamic> toJson() => _$TlsValidationContextFileTrustToJson(this);
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context trust.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TlsValidationContextTrust {
  /// A reference to an object that represents a TLS validation context trust for
  /// an AWS Certicate Manager (ACM) certificate.
  @_s.JsonKey(name: 'acm')
  final TlsValidationContextAcmTrust acm;

  /// An object that represents a TLS validation context trust for a local file.
  @_s.JsonKey(name: 'file')
  final TlsValidationContextFileTrust file;

  TlsValidationContextTrust({
    this.acm,
    this.file,
  });
  factory TlsValidationContextTrust.fromJson(Map<String, dynamic> json) =>
      _$TlsValidationContextTrustFromJson(json);

  Map<String, dynamic> toJson() => _$TlsValidationContextTrustToJson(this);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceOutput {
  UntagResourceOutput();
  factory UntagResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGatewayRouteOutput {
  /// A full description of the gateway route that was updated.
  @_s.JsonKey(name: 'gatewayRoute')
  final GatewayRouteData gatewayRoute;

  UpdateGatewayRouteOutput({
    @_s.required this.gatewayRoute,
  });
  factory UpdateGatewayRouteOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGatewayRouteOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMeshOutput {
  @_s.JsonKey(name: 'mesh')
  final MeshData mesh;

  UpdateMeshOutput({
    @_s.required this.mesh,
  });
  factory UpdateMeshOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateMeshOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRouteOutput {
  /// A full description of the route that was updated.
  @_s.JsonKey(name: 'route')
  final RouteData route;

  UpdateRouteOutput({
    @_s.required this.route,
  });
  factory UpdateRouteOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateRouteOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVirtualGatewayOutput {
  /// A full description of the virtual gateway that was updated.
  @_s.JsonKey(name: 'virtualGateway')
  final VirtualGatewayData virtualGateway;

  UpdateVirtualGatewayOutput({
    @_s.required this.virtualGateway,
  });
  factory UpdateVirtualGatewayOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateVirtualGatewayOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVirtualNodeOutput {
  /// A full description of the virtual node that was updated.
  @_s.JsonKey(name: 'virtualNode')
  final VirtualNodeData virtualNode;

  UpdateVirtualNodeOutput({
    @_s.required this.virtualNode,
  });
  factory UpdateVirtualNodeOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateVirtualNodeOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVirtualRouterOutput {
  /// A full description of the virtual router that was updated.
  @_s.JsonKey(name: 'virtualRouter')
  final VirtualRouterData virtualRouter;

  UpdateVirtualRouterOutput({
    @_s.required this.virtualRouter,
  });
  factory UpdateVirtualRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateVirtualRouterOutputFromJson(json);
}

/// <zonbook></zonbook><xhtml></xhtml>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVirtualServiceOutput {
  /// A full description of the virtual service that was updated.
  @_s.JsonKey(name: 'virtualService')
  final VirtualServiceData virtualService;

  UpdateVirtualServiceOutput({
    @_s.required this.virtualService,
  });
  factory UpdateVirtualServiceOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateVirtualServiceOutputFromJson(json);
}

/// The access log configuration for a virtual gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayAccessLog {
  /// The file object to send virtual gateway access logs to.
  @_s.JsonKey(name: 'file')
  final VirtualGatewayFileAccessLog file;

  VirtualGatewayAccessLog({
    this.file,
  });
  factory VirtualGatewayAccessLog.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayAccessLogFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualGatewayAccessLogToJson(this);
}

/// An object that represents the default properties for a backend.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayBackendDefaults {
  /// A reference to an object that represents a client policy.
  @_s.JsonKey(name: 'clientPolicy')
  final VirtualGatewayClientPolicy clientPolicy;

  VirtualGatewayBackendDefaults({
    this.clientPolicy,
  });
  factory VirtualGatewayBackendDefaults.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayBackendDefaultsFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualGatewayBackendDefaultsToJson(this);
}

/// An object that represents a client policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayClientPolicy {
  /// A reference to an object that represents a Transport Layer Security (TLS)
  /// client policy.
  @_s.JsonKey(name: 'tls')
  final VirtualGatewayClientPolicyTls tls;

  VirtualGatewayClientPolicy({
    this.tls,
  });
  factory VirtualGatewayClientPolicy.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayClientPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualGatewayClientPolicyToJson(this);
}

/// An object that represents a Transport Layer Security (TLS) client policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayClientPolicyTls {
  /// A reference to an object that represents a TLS validation context.
  @_s.JsonKey(name: 'validation')
  final VirtualGatewayTlsValidationContext validation;

  /// Whether the policy is enforced. The default is <code>True</code>, if a value
  /// isn't specified.
  @_s.JsonKey(name: 'enforce')
  final bool enforce;

  /// One or more ports that the policy is enforced for.
  @_s.JsonKey(name: 'ports')
  final List<int> ports;

  VirtualGatewayClientPolicyTls({
    @_s.required this.validation,
    this.enforce,
    this.ports,
  });
  factory VirtualGatewayClientPolicyTls.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayClientPolicyTlsFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualGatewayClientPolicyTlsToJson(this);
}

/// An object that represents the type of virtual gateway connection pool.
///
/// Only one protocol is used at a time and should be the same protocol as the
/// one chosen under port mapping.
///
/// If not present the default value for <code>maxPendingRequests</code> is
/// <code>2147483647</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayConnectionPool {
  /// An object that represents a type of connection pool.
  @_s.JsonKey(name: 'grpc')
  final VirtualGatewayGrpcConnectionPool grpc;

  /// An object that represents a type of connection pool.
  @_s.JsonKey(name: 'http')
  final VirtualGatewayHttpConnectionPool http;

  /// An object that represents a type of connection pool.
  @_s.JsonKey(name: 'http2')
  final VirtualGatewayHttp2ConnectionPool http2;

  VirtualGatewayConnectionPool({
    this.grpc,
    this.http,
    this.http2,
  });
  factory VirtualGatewayConnectionPool.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayConnectionPoolFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualGatewayConnectionPoolToJson(this);
}

/// An object that represents a virtual gateway returned by a describe
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualGatewayData {
  /// The name of the service mesh that the virtual gateway resides in.
  @_s.JsonKey(name: 'meshName')
  final String meshName;
  @_s.JsonKey(name: 'metadata')
  final ResourceMetadata metadata;

  /// The specifications of the virtual gateway.
  @_s.JsonKey(name: 'spec')
  final VirtualGatewaySpec spec;

  /// The current status of the virtual gateway.
  @_s.JsonKey(name: 'status')
  final VirtualGatewayStatus status;

  /// The name of the virtual gateway.
  @_s.JsonKey(name: 'virtualGatewayName')
  final String virtualGatewayName;

  VirtualGatewayData({
    @_s.required this.meshName,
    @_s.required this.metadata,
    @_s.required this.spec,
    @_s.required this.status,
    @_s.required this.virtualGatewayName,
  });
  factory VirtualGatewayData.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayDataFromJson(json);
}

/// An object that represents an access log file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayFileAccessLog {
  /// The file path to write access logs to. You can use <code>/dev/stdout</code>
  /// to send access logs to standard out and configure your Envoy container to
  /// use a log driver, such as <code>awslogs</code>, to export the access logs to
  /// a log storage service such as Amazon CloudWatch Logs. You can also specify a
  /// path in the Envoy container's file system to write the files to disk.
  @_s.JsonKey(name: 'path')
  final String path;

  VirtualGatewayFileAccessLog({
    @_s.required this.path,
  });
  factory VirtualGatewayFileAccessLog.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayFileAccessLogFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualGatewayFileAccessLogToJson(this);
}

/// An object that represents a type of connection pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayGrpcConnectionPool {
  /// Maximum number of inflight requests Envoy can concurrently support across
  /// hosts in upstream cluster.
  @_s.JsonKey(name: 'maxRequests')
  final int maxRequests;

  VirtualGatewayGrpcConnectionPool({
    @_s.required this.maxRequests,
  });
  factory VirtualGatewayGrpcConnectionPool.fromJson(
          Map<String, dynamic> json) =>
      _$VirtualGatewayGrpcConnectionPoolFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VirtualGatewayGrpcConnectionPoolToJson(this);
}

/// An object that represents the health check policy for a virtual gateway's
/// listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayHealthCheckPolicy {
  /// The number of consecutive successful health checks that must occur before
  /// declaring the listener healthy.
  @_s.JsonKey(name: 'healthyThreshold')
  final int healthyThreshold;

  /// The time period in milliseconds between each health check execution.
  @_s.JsonKey(name: 'intervalMillis')
  final int intervalMillis;

  /// The protocol for the health check request. If you specify <code>grpc</code>,
  /// then your service must conform to the <a
  /// href="https://github.com/grpc/grpc/blob/master/doc/health-checking.md">GRPC
  /// Health Checking Protocol</a>.
  @_s.JsonKey(name: 'protocol')
  final VirtualGatewayPortProtocol protocol;

  /// The amount of time to wait when receiving a response from the health check,
  /// in milliseconds.
  @_s.JsonKey(name: 'timeoutMillis')
  final int timeoutMillis;

  /// The number of consecutive failed health checks that must occur before
  /// declaring a virtual gateway unhealthy.
  @_s.JsonKey(name: 'unhealthyThreshold')
  final int unhealthyThreshold;

  /// The destination path for the health check request. This value is only used
  /// if the specified protocol is HTTP or HTTP/2. For any other protocol, this
  /// value is ignored.
  @_s.JsonKey(name: 'path')
  final String path;

  /// The destination port for the health check request. This port must match the
  /// port defined in the <a>PortMapping</a> for the listener.
  @_s.JsonKey(name: 'port')
  final int port;

  VirtualGatewayHealthCheckPolicy({
    @_s.required this.healthyThreshold,
    @_s.required this.intervalMillis,
    @_s.required this.protocol,
    @_s.required this.timeoutMillis,
    @_s.required this.unhealthyThreshold,
    this.path,
    this.port,
  });
  factory VirtualGatewayHealthCheckPolicy.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayHealthCheckPolicyFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VirtualGatewayHealthCheckPolicyToJson(this);
}

/// An object that represents a type of connection pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayHttp2ConnectionPool {
  /// Maximum number of inflight requests Envoy can concurrently support across
  /// hosts in upstream cluster.
  @_s.JsonKey(name: 'maxRequests')
  final int maxRequests;

  VirtualGatewayHttp2ConnectionPool({
    @_s.required this.maxRequests,
  });
  factory VirtualGatewayHttp2ConnectionPool.fromJson(
          Map<String, dynamic> json) =>
      _$VirtualGatewayHttp2ConnectionPoolFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VirtualGatewayHttp2ConnectionPoolToJson(this);
}

/// An object that represents a type of connection pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayHttpConnectionPool {
  /// Maximum number of outbound TCP connections Envoy can establish concurrently
  /// with all hosts in upstream cluster.
  @_s.JsonKey(name: 'maxConnections')
  final int maxConnections;

  /// Number of overflowing requests after <code>max_connections</code> Envoy will
  /// queue to upstream cluster.
  @_s.JsonKey(name: 'maxPendingRequests')
  final int maxPendingRequests;

  VirtualGatewayHttpConnectionPool({
    @_s.required this.maxConnections,
    this.maxPendingRequests,
  });
  factory VirtualGatewayHttpConnectionPool.fromJson(
          Map<String, dynamic> json) =>
      _$VirtualGatewayHttpConnectionPoolFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VirtualGatewayHttpConnectionPoolToJson(this);
}

/// An object that represents a listener for a virtual gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayListener {
  /// The port mapping information for the listener.
  @_s.JsonKey(name: 'portMapping')
  final VirtualGatewayPortMapping portMapping;

  /// The connection pool information for the virtual gateway listener.
  @_s.JsonKey(name: 'connectionPool')
  final VirtualGatewayConnectionPool connectionPool;

  /// The health check information for the listener.
  @_s.JsonKey(name: 'healthCheck')
  final VirtualGatewayHealthCheckPolicy healthCheck;

  /// A reference to an object that represents the Transport Layer Security (TLS)
  /// properties for the listener.
  @_s.JsonKey(name: 'tls')
  final VirtualGatewayListenerTls tls;

  VirtualGatewayListener({
    @_s.required this.portMapping,
    this.connectionPool,
    this.healthCheck,
    this.tls,
  });
  factory VirtualGatewayListener.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayListenerFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualGatewayListenerToJson(this);
}

/// An object that represents the Transport Layer Security (TLS) properties for
/// a listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayListenerTls {
  /// An object that represents a Transport Layer Security (TLS) certificate.
  @_s.JsonKey(name: 'certificate')
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
  @_s.JsonKey(name: 'mode')
  final VirtualGatewayListenerTlsMode mode;

  VirtualGatewayListenerTls({
    @_s.required this.certificate,
    @_s.required this.mode,
  });
  factory VirtualGatewayListenerTls.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayListenerTlsFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualGatewayListenerTlsToJson(this);
}

/// An object that represents an AWS Certicate Manager (ACM) certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayListenerTlsAcmCertificate {
  /// The Amazon Resource Name (ARN) for the certificate. The certificate must
  /// meet specific requirements and you must have proxy authorization enabled.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html#virtual-node-tls-prerequisites">Transport
  /// Layer Security (TLS)</a>.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  VirtualGatewayListenerTlsAcmCertificate({
    @_s.required this.certificateArn,
  });
  factory VirtualGatewayListenerTlsAcmCertificate.fromJson(
          Map<String, dynamic> json) =>
      _$VirtualGatewayListenerTlsAcmCertificateFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VirtualGatewayListenerTlsAcmCertificateToJson(this);
}

/// An object that represents a listener's Transport Layer Security (TLS)
/// certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayListenerTlsCertificate {
  /// A reference to an object that represents an AWS Certicate Manager (ACM)
  /// certificate.
  @_s.JsonKey(name: 'acm')
  final VirtualGatewayListenerTlsAcmCertificate acm;

  /// A reference to an object that represents a local file certificate.
  @_s.JsonKey(name: 'file')
  final VirtualGatewayListenerTlsFileCertificate file;

  VirtualGatewayListenerTlsCertificate({
    this.acm,
    this.file,
  });
  factory VirtualGatewayListenerTlsCertificate.fromJson(
          Map<String, dynamic> json) =>
      _$VirtualGatewayListenerTlsCertificateFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VirtualGatewayListenerTlsCertificateToJson(this);
}

/// An object that represents a local file certificate. The certificate must
/// meet specific requirements and you must have proxy authorization enabled.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/tls.html#virtual-node-tls-prerequisites">Transport
/// Layer Security (TLS)</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayListenerTlsFileCertificate {
  /// The certificate chain for the certificate.
  @_s.JsonKey(name: 'certificateChain')
  final String certificateChain;

  /// The private key for a certificate stored on the file system of the mesh
  /// endpoint that the proxy is running on.
  @_s.JsonKey(name: 'privateKey')
  final String privateKey;

  VirtualGatewayListenerTlsFileCertificate({
    @_s.required this.certificateChain,
    @_s.required this.privateKey,
  });
  factory VirtualGatewayListenerTlsFileCertificate.fromJson(
          Map<String, dynamic> json) =>
      _$VirtualGatewayListenerTlsFileCertificateFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VirtualGatewayListenerTlsFileCertificateToJson(this);
}

enum VirtualGatewayListenerTlsMode {
  @_s.JsonValue('STRICT')
  strict,
  @_s.JsonValue('PERMISSIVE')
  permissive,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// An object that represents logging information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayLogging {
  /// The access log configuration.
  @_s.JsonKey(name: 'accessLog')
  final VirtualGatewayAccessLog accessLog;

  VirtualGatewayLogging({
    this.accessLog,
  });
  factory VirtualGatewayLogging.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayLoggingFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualGatewayLoggingToJson(this);
}

/// An object that represents a port mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayPortMapping {
  /// The port used for the port mapping. Specify one protocol.
  @_s.JsonKey(name: 'port')
  final int port;

  /// The protocol used for the port mapping.
  @_s.JsonKey(name: 'protocol')
  final VirtualGatewayPortProtocol protocol;

  VirtualGatewayPortMapping({
    @_s.required this.port,
    @_s.required this.protocol,
  });
  factory VirtualGatewayPortMapping.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayPortMappingFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualGatewayPortMappingToJson(this);
}

enum VirtualGatewayPortProtocol {
  @_s.JsonValue('http')
  http,
  @_s.JsonValue('http2')
  http2,
  @_s.JsonValue('grpc')
  grpc,
}

/// An object that represents a virtual gateway returned by a list operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualGatewayRef {
  /// The full Amazon Resource Name (ARN) for the resource.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the service mesh that the resource resides in.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'meshOwner')
  final String meshOwner;

  /// The AWS IAM account ID of the resource owner. If the account ID is not your
  /// own, then it's the ID of the mesh owner or of another account that the mesh
  /// is shared with. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'resourceOwner')
  final String resourceOwner;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  @_s.JsonKey(name: 'version')
  final int version;

  /// The name of the resource.
  @_s.JsonKey(name: 'virtualGatewayName')
  final String virtualGatewayName;

  VirtualGatewayRef({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.lastUpdatedAt,
    @_s.required this.meshName,
    @_s.required this.meshOwner,
    @_s.required this.resourceOwner,
    @_s.required this.version,
    @_s.required this.virtualGatewayName,
  });
  factory VirtualGatewayRef.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayRefFromJson(json);
}

/// An object that represents the specification of a service mesh resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewaySpec {
  /// The listeners that the mesh endpoint is expected to receive inbound traffic
  /// from. You can specify one listener.
  @_s.JsonKey(name: 'listeners')
  final List<VirtualGatewayListener> listeners;

  /// A reference to an object that represents the defaults for backends.
  @_s.JsonKey(name: 'backendDefaults')
  final VirtualGatewayBackendDefaults backendDefaults;
  @_s.JsonKey(name: 'logging')
  final VirtualGatewayLogging logging;

  VirtualGatewaySpec({
    @_s.required this.listeners,
    this.backendDefaults,
    this.logging,
  });
  factory VirtualGatewaySpec.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewaySpecFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualGatewaySpecToJson(this);
}

/// An object that represents the status of the mesh resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualGatewayStatus {
  /// The current status.
  @_s.JsonKey(name: 'status')
  final VirtualGatewayStatusCode status;

  VirtualGatewayStatus({
    @_s.required this.status,
  });
  factory VirtualGatewayStatus.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayStatusFromJson(json);
}

enum VirtualGatewayStatusCode {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('DELETED')
  deleted,
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayTlsValidationContext {
  /// A reference to an object that represents a TLS validation context trust.
  @_s.JsonKey(name: 'trust')
  final VirtualGatewayTlsValidationContextTrust trust;

  VirtualGatewayTlsValidationContext({
    @_s.required this.trust,
  });
  factory VirtualGatewayTlsValidationContext.fromJson(
          Map<String, dynamic> json) =>
      _$VirtualGatewayTlsValidationContextFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VirtualGatewayTlsValidationContextToJson(this);
}

/// An object that represents a TLS validation context trust for an AWS
/// Certicate Manager (ACM) certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayTlsValidationContextAcmTrust {
  /// One or more ACM Amazon Resource Name (ARN)s.
  @_s.JsonKey(name: 'certificateAuthorityArns')
  final List<String> certificateAuthorityArns;

  VirtualGatewayTlsValidationContextAcmTrust({
    @_s.required this.certificateAuthorityArns,
  });
  factory VirtualGatewayTlsValidationContextAcmTrust.fromJson(
          Map<String, dynamic> json) =>
      _$VirtualGatewayTlsValidationContextAcmTrustFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VirtualGatewayTlsValidationContextAcmTrustToJson(this);
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context trust for a local file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayTlsValidationContextFileTrust {
  /// The certificate trust chain for a certificate stored on the file system of
  /// the virtual node that the proxy is running on.
  @_s.JsonKey(name: 'certificateChain')
  final String certificateChain;

  VirtualGatewayTlsValidationContextFileTrust({
    @_s.required this.certificateChain,
  });
  factory VirtualGatewayTlsValidationContextFileTrust.fromJson(
          Map<String, dynamic> json) =>
      _$VirtualGatewayTlsValidationContextFileTrustFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VirtualGatewayTlsValidationContextFileTrustToJson(this);
}

/// An object that represents a Transport Layer Security (TLS) validation
/// context trust.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualGatewayTlsValidationContextTrust {
  /// A reference to an object that represents a TLS validation context trust for
  /// an AWS Certicate Manager (ACM) certificate.
  @_s.JsonKey(name: 'acm')
  final VirtualGatewayTlsValidationContextAcmTrust acm;

  /// An object that represents a TLS validation context trust for a local file.
  @_s.JsonKey(name: 'file')
  final VirtualGatewayTlsValidationContextFileTrust file;

  VirtualGatewayTlsValidationContextTrust({
    this.acm,
    this.file,
  });
  factory VirtualGatewayTlsValidationContextTrust.fromJson(
          Map<String, dynamic> json) =>
      _$VirtualGatewayTlsValidationContextTrustFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VirtualGatewayTlsValidationContextTrustToJson(this);
}

/// An object that represents the type of virtual node connection pool.
///
/// Only one protocol is used at a time and should be the same protocol as the
/// one chosen under port mapping.
///
/// If not present the default value for <code>maxPendingRequests</code> is
/// <code>2147483647</code>.
/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualNodeConnectionPool {
  /// An object that represents a type of connection pool.
  @_s.JsonKey(name: 'grpc')
  final VirtualNodeGrpcConnectionPool grpc;

  /// An object that represents a type of connection pool.
  @_s.JsonKey(name: 'http')
  final VirtualNodeHttpConnectionPool http;

  /// An object that represents a type of connection pool.
  @_s.JsonKey(name: 'http2')
  final VirtualNodeHttp2ConnectionPool http2;

  /// An object that represents a type of connection pool.
  @_s.JsonKey(name: 'tcp')
  final VirtualNodeTcpConnectionPool tcp;

  VirtualNodeConnectionPool({
    this.grpc,
    this.http,
    this.http2,
    this.tcp,
  });
  factory VirtualNodeConnectionPool.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeConnectionPoolFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualNodeConnectionPoolToJson(this);
}

/// An object that represents a virtual node returned by a describe operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualNodeData {
  /// The name of the service mesh that the virtual node resides in.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The associated metadata for the virtual node.
  @_s.JsonKey(name: 'metadata')
  final ResourceMetadata metadata;

  /// The specifications of the virtual node.
  @_s.JsonKey(name: 'spec')
  final VirtualNodeSpec spec;

  /// The current status for the virtual node.
  @_s.JsonKey(name: 'status')
  final VirtualNodeStatus status;

  /// The name of the virtual node.
  @_s.JsonKey(name: 'virtualNodeName')
  final String virtualNodeName;

  VirtualNodeData({
    @_s.required this.meshName,
    @_s.required this.metadata,
    @_s.required this.spec,
    @_s.required this.status,
    @_s.required this.virtualNodeName,
  });
  factory VirtualNodeData.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeDataFromJson(json);
}

/// An object that represents a type of connection pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualNodeGrpcConnectionPool {
  /// Maximum number of inflight requests Envoy can concurrently support across
  /// hosts in upstream cluster.
  @_s.JsonKey(name: 'maxRequests')
  final int maxRequests;

  VirtualNodeGrpcConnectionPool({
    @_s.required this.maxRequests,
  });
  factory VirtualNodeGrpcConnectionPool.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeGrpcConnectionPoolFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualNodeGrpcConnectionPoolToJson(this);
}

/// An object that represents a type of connection pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualNodeHttp2ConnectionPool {
  /// Maximum number of inflight requests Envoy can concurrently support across
  /// hosts in upstream cluster.
  @_s.JsonKey(name: 'maxRequests')
  final int maxRequests;

  VirtualNodeHttp2ConnectionPool({
    @_s.required this.maxRequests,
  });
  factory VirtualNodeHttp2ConnectionPool.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeHttp2ConnectionPoolFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualNodeHttp2ConnectionPoolToJson(this);
}

/// An object that represents a type of connection pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualNodeHttpConnectionPool {
  /// Maximum number of outbound TCP connections Envoy can establish concurrently
  /// with all hosts in upstream cluster.
  @_s.JsonKey(name: 'maxConnections')
  final int maxConnections;

  /// Number of overflowing requests after <code>max_connections</code> Envoy will
  /// queue to upstream cluster.
  @_s.JsonKey(name: 'maxPendingRequests')
  final int maxPendingRequests;

  VirtualNodeHttpConnectionPool({
    @_s.required this.maxConnections,
    this.maxPendingRequests,
  });
  factory VirtualNodeHttpConnectionPool.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeHttpConnectionPoolFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualNodeHttpConnectionPoolToJson(this);
}

/// An object that represents a virtual node returned by a list operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualNodeRef {
  /// The full Amazon Resource Name (ARN) for the virtual node.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the service mesh that the virtual node resides in.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'meshOwner')
  final String meshOwner;

  /// The AWS IAM account ID of the resource owner. If the account ID is not your
  /// own, then it's the ID of the mesh owner or of another account that the mesh
  /// is shared with. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'resourceOwner')
  final String resourceOwner;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  @_s.JsonKey(name: 'version')
  final int version;

  /// The name of the virtual node.
  @_s.JsonKey(name: 'virtualNodeName')
  final String virtualNodeName;

  VirtualNodeRef({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.lastUpdatedAt,
    @_s.required this.meshName,
    @_s.required this.meshOwner,
    @_s.required this.resourceOwner,
    @_s.required this.version,
    @_s.required this.virtualNodeName,
  });
  factory VirtualNodeRef.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeRefFromJson(json);
}

/// An object that represents a virtual node service provider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualNodeServiceProvider {
  /// The name of the virtual node that is acting as a service provider.
  @_s.JsonKey(name: 'virtualNodeName')
  final String virtualNodeName;

  VirtualNodeServiceProvider({
    @_s.required this.virtualNodeName,
  });
  factory VirtualNodeServiceProvider.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeServiceProviderFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualNodeServiceProviderToJson(this);
}

/// An object that represents the specification of a virtual node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualNodeSpec {
  /// A reference to an object that represents the defaults for backends.
  @_s.JsonKey(name: 'backendDefaults')
  final BackendDefaults backendDefaults;

  /// The backends that the virtual node is expected to send outbound traffic to.
  @_s.JsonKey(name: 'backends')
  final List<Backend> backends;

  /// The listener that the virtual node is expected to receive inbound traffic
  /// from. You can specify one listener.
  @_s.JsonKey(name: 'listeners')
  final List<Listener> listeners;

  /// The inbound and outbound access logging information for the virtual node.
  @_s.JsonKey(name: 'logging')
  final Logging logging;

  /// The service discovery information for the virtual node. If your virtual node
  /// does not expect ingress traffic, you can omit this parameter. If you specify
  /// a <code>listener</code>, then you must specify service discovery
  /// information.
  @_s.JsonKey(name: 'serviceDiscovery')
  final ServiceDiscovery serviceDiscovery;

  VirtualNodeSpec({
    this.backendDefaults,
    this.backends,
    this.listeners,
    this.logging,
    this.serviceDiscovery,
  });
  factory VirtualNodeSpec.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeSpecFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualNodeSpecToJson(this);
}

/// An object that represents the current status of the virtual node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualNodeStatus {
  /// The current status of the virtual node.
  @_s.JsonKey(name: 'status')
  final VirtualNodeStatusCode status;

  VirtualNodeStatus({
    @_s.required this.status,
  });
  factory VirtualNodeStatus.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeStatusFromJson(json);
}

enum VirtualNodeStatusCode {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('DELETED')
  deleted,
}

/// An object that represents a type of connection pool.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualNodeTcpConnectionPool {
  /// Maximum number of outbound TCP connections Envoy can establish concurrently
  /// with all hosts in upstream cluster.
  @_s.JsonKey(name: 'maxConnections')
  final int maxConnections;

  VirtualNodeTcpConnectionPool({
    @_s.required this.maxConnections,
  });
  factory VirtualNodeTcpConnectionPool.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeTcpConnectionPoolFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualNodeTcpConnectionPoolToJson(this);
}

/// An object that represents a virtual router returned by a describe operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualRouterData {
  /// The name of the service mesh that the virtual router resides in.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The associated metadata for the virtual router.
  @_s.JsonKey(name: 'metadata')
  final ResourceMetadata metadata;

  /// The specifications of the virtual router.
  @_s.JsonKey(name: 'spec')
  final VirtualRouterSpec spec;

  /// The current status of the virtual router.
  @_s.JsonKey(name: 'status')
  final VirtualRouterStatus status;

  /// The name of the virtual router.
  @_s.JsonKey(name: 'virtualRouterName')
  final String virtualRouterName;

  VirtualRouterData({
    @_s.required this.meshName,
    @_s.required this.metadata,
    @_s.required this.spec,
    @_s.required this.status,
    @_s.required this.virtualRouterName,
  });
  factory VirtualRouterData.fromJson(Map<String, dynamic> json) =>
      _$VirtualRouterDataFromJson(json);
}

/// An object that represents a virtual router listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualRouterListener {
  @_s.JsonKey(name: 'portMapping')
  final PortMapping portMapping;

  VirtualRouterListener({
    @_s.required this.portMapping,
  });
  factory VirtualRouterListener.fromJson(Map<String, dynamic> json) =>
      _$VirtualRouterListenerFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualRouterListenerToJson(this);
}

/// An object that represents a virtual router returned by a list operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualRouterRef {
  /// The full Amazon Resource Name (ARN) for the virtual router.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the service mesh that the virtual router resides in.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'meshOwner')
  final String meshOwner;

  /// The AWS IAM account ID of the resource owner. If the account ID is not your
  /// own, then it's the ID of the mesh owner or of another account that the mesh
  /// is shared with. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'resourceOwner')
  final String resourceOwner;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  @_s.JsonKey(name: 'version')
  final int version;

  /// The name of the virtual router.
  @_s.JsonKey(name: 'virtualRouterName')
  final String virtualRouterName;

  VirtualRouterRef({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.lastUpdatedAt,
    @_s.required this.meshName,
    @_s.required this.meshOwner,
    @_s.required this.resourceOwner,
    @_s.required this.version,
    @_s.required this.virtualRouterName,
  });
  factory VirtualRouterRef.fromJson(Map<String, dynamic> json) =>
      _$VirtualRouterRefFromJson(json);
}

/// An object that represents a virtual node service provider.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualRouterServiceProvider {
  /// The name of the virtual router that is acting as a service provider.
  @_s.JsonKey(name: 'virtualRouterName')
  final String virtualRouterName;

  VirtualRouterServiceProvider({
    @_s.required this.virtualRouterName,
  });
  factory VirtualRouterServiceProvider.fromJson(Map<String, dynamic> json) =>
      _$VirtualRouterServiceProviderFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualRouterServiceProviderToJson(this);
}

/// An object that represents the specification of a virtual router.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualRouterSpec {
  /// The listeners that the virtual router is expected to receive inbound traffic
  /// from. You can specify one listener.
  @_s.JsonKey(name: 'listeners')
  final List<VirtualRouterListener> listeners;

  VirtualRouterSpec({
    this.listeners,
  });
  factory VirtualRouterSpec.fromJson(Map<String, dynamic> json) =>
      _$VirtualRouterSpecFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualRouterSpecToJson(this);
}

/// An object that represents the status of a virtual router.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualRouterStatus {
  /// The current status of the virtual router.
  @_s.JsonKey(name: 'status')
  final VirtualRouterStatusCode status;

  VirtualRouterStatus({
    @_s.required this.status,
  });
  factory VirtualRouterStatus.fromJson(Map<String, dynamic> json) =>
      _$VirtualRouterStatusFromJson(json);
}

enum VirtualRouterStatusCode {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('DELETED')
  deleted,
}

/// An object that represents a virtual service backend for a virtual node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualServiceBackend {
  /// The name of the virtual service that is acting as a virtual node backend.
  @_s.JsonKey(name: 'virtualServiceName')
  final String virtualServiceName;

  /// A reference to an object that represents the client policy for a backend.
  @_s.JsonKey(name: 'clientPolicy')
  final ClientPolicy clientPolicy;

  VirtualServiceBackend({
    @_s.required this.virtualServiceName,
    this.clientPolicy,
  });
  factory VirtualServiceBackend.fromJson(Map<String, dynamic> json) =>
      _$VirtualServiceBackendFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualServiceBackendToJson(this);
}

/// An object that represents a virtual service returned by a describe
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualServiceData {
  /// The name of the service mesh that the virtual service resides in.
  @_s.JsonKey(name: 'meshName')
  final String meshName;
  @_s.JsonKey(name: 'metadata')
  final ResourceMetadata metadata;

  /// The specifications of the virtual service.
  @_s.JsonKey(name: 'spec')
  final VirtualServiceSpec spec;

  /// The current status of the virtual service.
  @_s.JsonKey(name: 'status')
  final VirtualServiceStatus status;

  /// The name of the virtual service.
  @_s.JsonKey(name: 'virtualServiceName')
  final String virtualServiceName;

  VirtualServiceData({
    @_s.required this.meshName,
    @_s.required this.metadata,
    @_s.required this.spec,
    @_s.required this.status,
    @_s.required this.virtualServiceName,
  });
  factory VirtualServiceData.fromJson(Map<String, dynamic> json) =>
      _$VirtualServiceDataFromJson(json);
}

/// An object that represents the provider for a virtual service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualServiceProvider {
  /// The virtual node associated with a virtual service.
  @_s.JsonKey(name: 'virtualNode')
  final VirtualNodeServiceProvider virtualNode;

  /// The virtual router associated with a virtual service.
  @_s.JsonKey(name: 'virtualRouter')
  final VirtualRouterServiceProvider virtualRouter;

  VirtualServiceProvider({
    this.virtualNode,
    this.virtualRouter,
  });
  factory VirtualServiceProvider.fromJson(Map<String, dynamic> json) =>
      _$VirtualServiceProviderFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualServiceProviderToJson(this);
}

/// An object that represents a virtual service returned by a list operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualServiceRef {
  /// The full Amazon Resource Name (ARN) for the virtual service.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the service mesh that the virtual service resides in.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The AWS IAM account ID of the service mesh owner. If the account ID is not
  /// your own, then it's the ID of the account that shared the mesh with your
  /// account. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'meshOwner')
  final String meshOwner;

  /// The AWS IAM account ID of the resource owner. If the account ID is not your
  /// own, then it's the ID of the mesh owner or of another account that the mesh
  /// is shared with. For more information about mesh sharing, see <a
  /// href="https://docs.aws.amazon.com/app-mesh/latest/userguide/sharing.html">Working
  /// with shared meshes</a>.
  @_s.JsonKey(name: 'resourceOwner')
  final String resourceOwner;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is incremented each time that they're updated.
  @_s.JsonKey(name: 'version')
  final int version;

  /// The name of the virtual service.
  @_s.JsonKey(name: 'virtualServiceName')
  final String virtualServiceName;

  VirtualServiceRef({
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.lastUpdatedAt,
    @_s.required this.meshName,
    @_s.required this.meshOwner,
    @_s.required this.resourceOwner,
    @_s.required this.version,
    @_s.required this.virtualServiceName,
  });
  factory VirtualServiceRef.fromJson(Map<String, dynamic> json) =>
      _$VirtualServiceRefFromJson(json);
}

/// An object that represents the specification of a virtual service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualServiceSpec {
  /// The App Mesh object that is acting as the provider for a virtual service.
  /// You can specify a single virtual node or virtual router.
  @_s.JsonKey(name: 'provider')
  final VirtualServiceProvider provider;

  VirtualServiceSpec({
    this.provider,
  });
  factory VirtualServiceSpec.fromJson(Map<String, dynamic> json) =>
      _$VirtualServiceSpecFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualServiceSpecToJson(this);
}

/// An object that represents the status of a virtual service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualServiceStatus {
  /// The current status of the virtual service.
  @_s.JsonKey(name: 'status')
  final VirtualServiceStatusCode status;

  VirtualServiceStatus({
    @_s.required this.status,
  });
  factory VirtualServiceStatus.fromJson(Map<String, dynamic> json) =>
      _$VirtualServiceStatusFromJson(json);
}

enum VirtualServiceStatusCode {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('DELETED')
  deleted,
}

/// An object that represents a target and its relative weight. Traffic is
/// distributed across targets according to their relative weight. For example,
/// a weighted target with a relative weight of 50 receives five times as much
/// traffic as one with a relative weight of 10. The total weight for all
/// targets combined must be less than or equal to 100.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WeightedTarget {
  /// The virtual node to associate with the weighted target.
  @_s.JsonKey(name: 'virtualNode')
  final String virtualNode;

  /// The relative weight of the weighted target.
  @_s.JsonKey(name: 'weight')
  final int weight;

  WeightedTarget({
    @_s.required this.virtualNode,
    @_s.required this.weight,
  });
  factory WeightedTarget.fromJson(Map<String, dynamic> json) =>
      _$WeightedTargetFromJson(json);

  Map<String, dynamic> toJson() => _$WeightedTargetToJson(this);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
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

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
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
