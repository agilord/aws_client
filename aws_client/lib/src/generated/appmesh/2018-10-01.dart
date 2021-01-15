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

part '2018-10-01.g.dart';

/// AWS App Mesh is a service mesh based on the Envoy proxy that makes it easy
/// to monitor and
/// control containerized microservices. App Mesh standardizes how your
/// microservices
/// communicate, giving you end-to-end visibility and helping to ensure
/// high-availability for
/// your applications.
///
///
/// App Mesh gives you consistent visibility and network traffic controls for
/// every
/// microservice in an application. You can use App Mesh with Amazon ECS
/// (using the Amazon EC2 launch type), Amazon EKS, and Kubernetes on AWS.
///
/// <note>
///
/// App Mesh supports containerized microservice applications that use service
/// discovery
/// naming for their components. To use App Mesh, you must have a containerized
/// application
/// running on Amazon EC2 instances, hosted in either Amazon ECS, Amazon EKS, or
/// Kubernetes on AWS. For
/// more information about service discovery on Amazon ECS, see <a
/// href="http://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-discovery.html">Service
/// Discovery</a> in the
/// <i>Amazon Elastic Container Service Developer Guide</i>. Kubernetes
/// <code>kube-dns</code> is supported.
/// For more information, see <a
/// href="https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/">DNS
/// for Services and Pods</a> in the Kubernetes documentation.
///
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

  /// Creates a new service mesh. A service mesh is a logical boundary for
  /// network traffic
  /// between the services that reside within it.
  ///
  ///
  /// After you create your service mesh, you can create virtual nodes, virtual
  /// routers, and
  /// routes to distribute traffic between the applications in your mesh.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name to use for the service mesh.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the
  /// request. Up to 36 letters, numbers, hyphens, and underscores are allowed.
  Future<CreateMeshOutput> createMesh({
    @_s.required String meshName,
    String clientToken,
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
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri: '/meshes',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateMeshOutput(
      mesh: MeshData.fromJson($json),
    );
  }

  /// Creates a new route that is associated with a virtual router.
  ///
  ///
  /// You can use the <code>prefix</code> parameter in your route specification
  /// for path-based
  /// routing of requests. For example, if your virtual router service name is
  /// <code>my-service.local</code>, and you want the route to match requests to
  /// <code>my-service.local/metrics</code>, then your prefix should be
  /// <code>/metrics</code>.
  ///
  ///
  /// If your route matches a request, you can distribute traffic to one or more
  /// target
  /// virtual nodes with relative weighting.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which to create the route.
  ///
  /// Parameter [routeName] :
  /// The name to use for the route.
  ///
  /// Parameter [spec] :
  /// The route specification to apply.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router in which to create the route.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the
  /// request. Up to 36 letters, numbers, hyphens, and underscores are allowed.
  Future<CreateRouteOutput> createRoute({
    @_s.required String meshName,
    @_s.required String routeName,
    @_s.required RouteSpec spec,
    @_s.required String virtualRouterName,
    String clientToken,
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
    final $payload = <String, dynamic>{
      'routeName': routeName,
      'spec': spec,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/meshes/${Uri.encodeComponent(meshName)}/virtualRouter/${Uri.encodeComponent(virtualRouterName)}/routes',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateRouteOutput(
      route: RouteData.fromJson($json),
    );
  }

  /// Creates a new virtual node within a service mesh.
  ///
  ///
  /// A virtual node acts as logical pointer to a particular task group, such as
  /// an Amazon ECS
  /// service or a Kubernetes deployment. When you create a virtual node, you
  /// must specify the
  /// DNS service discovery name for your task group.
  ///
  ///
  /// Any inbound traffic that your virtual node expects should be specified as
  /// a
  /// <code>listener</code>. Any outbound traffic that your virtual node expects
  /// to reach
  /// should be specified as a <code>backend</code>.
  ///
  ///
  /// The response metadata for your new virtual node contains the
  /// <code>arn</code> that is
  /// associated with the virtual node. Set this value (either the full ARN or
  /// the truncated
  /// resource name, for example,
  /// <code>mesh/default/virtualNode/simpleapp</code>, as the
  /// <code>APPMESH_VIRTUAL_NODE_NAME</code> environment variable for your task
  /// group's Envoy
  /// proxy container in your task definition or pod spec. This is then mapped
  /// to the
  /// <code>node.id</code> and <code>node.cluster</code> Envoy parameters.
  ///
  /// <note>
  ///
  /// If you require your Envoy stats or tracing to use a different name, you
  /// can override
  /// the <code>node.cluster</code> value that is set by
  /// <code>APPMESH_VIRTUAL_NODE_NAME</code> with the
  /// <code>APPMESH_VIRTUAL_NODE_CLUSTER</code> environment variable.
  ///
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which to create the virtual node.
  ///
  /// Parameter [spec] :
  /// The virtual node specification to apply.
  ///
  /// Parameter [virtualNodeName] :
  /// The name to use for the virtual node.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the
  /// request. Up to 36 letters, numbers, hyphens, and underscores are allowed.
  Future<CreateVirtualNodeOutput> createVirtualNode({
    @_s.required String meshName,
    @_s.required VirtualNodeSpec spec,
    @_s.required String virtualNodeName,
    String clientToken,
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
    final $payload = <String, dynamic>{
      'spec': spec,
      'virtualNodeName': virtualNodeName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri: '/meshes/${Uri.encodeComponent(meshName)}/virtualNodes',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateVirtualNodeOutput(
      virtualNode: VirtualNodeData.fromJson($json),
    );
  }

  /// Creates a new virtual router within a service mesh.
  ///
  ///
  /// Virtual routers handle traffic for one or more service names within your
  /// mesh. After you
  /// create your virtual router, create and associate routes for your virtual
  /// router that direct
  /// incoming requests to different virtual nodes.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which to create the virtual router.
  ///
  /// Parameter [spec] :
  /// The virtual router specification to apply.
  ///
  /// Parameter [virtualRouterName] :
  /// The name to use for the virtual router.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the
  /// request. Up to 36 letters, numbers, hyphens, and underscores are allowed.
  Future<CreateVirtualRouterOutput> createVirtualRouter({
    @_s.required String meshName,
    @_s.required VirtualRouterSpec spec,
    @_s.required String virtualRouterName,
    String clientToken,
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
    final $payload = <String, dynamic>{
      'spec': spec,
      'virtualRouterName': virtualRouterName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri: '/meshes/${Uri.encodeComponent(meshName)}/virtualRouters',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateVirtualRouterOutput(
      virtualRouter: VirtualRouterData.fromJson($json),
    );
  }

  /// Deletes an existing service mesh.
  ///
  ///
  /// You must delete all resources (routes, virtual routers, virtual nodes) in
  /// the service
  /// mesh before you can delete the mesh itself.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
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
      requestUri: '/meshes/${Uri.encodeComponent(meshName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteMeshOutput(
      mesh: MeshData.fromJson($json),
    );
  }

  /// Deletes an existing route.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which to delete the route.
  ///
  /// Parameter [routeName] :
  /// The name of the route to delete.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router in which to delete the route.
  Future<DeleteRouteOutput> deleteRoute({
    @_s.required String meshName,
    @_s.required String routeName,
    @_s.required String virtualRouterName,
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
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/meshes/${Uri.encodeComponent(meshName)}/virtualRouter/${Uri.encodeComponent(virtualRouterName)}/routes/${Uri.encodeComponent(routeName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteRouteOutput(
      route: RouteData.fromJson($json),
    );
  }

  /// Deletes an existing virtual node.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which to delete the virtual node.
  ///
  /// Parameter [virtualNodeName] :
  /// The name of the virtual node to delete.
  Future<DeleteVirtualNodeOutput> deleteVirtualNode({
    @_s.required String meshName,
    @_s.required String virtualNodeName,
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
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/meshes/${Uri.encodeComponent(meshName)}/virtualNodes/${Uri.encodeComponent(virtualNodeName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteVirtualNodeOutput(
      virtualNode: VirtualNodeData.fromJson($json),
    );
  }

  /// Deletes an existing virtual router.
  ///
  ///
  /// You must delete any routes associated with the virtual router before you
  /// can delete the
  /// router itself.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which to delete the virtual router.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router to delete.
  Future<DeleteVirtualRouterOutput> deleteVirtualRouter({
    @_s.required String meshName,
    @_s.required String virtualRouterName,
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
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/meshes/${Uri.encodeComponent(meshName)}/virtualRouters/${Uri.encodeComponent(virtualRouterName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteVirtualRouterOutput(
      virtualRouter: VirtualRouterData.fromJson($json),
    );
  }

  /// Describes an existing service mesh.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh to describe.
  Future<DescribeMeshOutput> describeMesh({
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
      method: 'GET',
      requestUri: '/meshes/${Uri.encodeComponent(meshName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeMeshOutput(
      mesh: MeshData.fromJson($json),
    );
  }

  /// Describes an existing route.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which the route resides.
  ///
  /// Parameter [routeName] :
  /// The name of the route to describe.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router with which the route is associated.
  Future<DescribeRouteOutput> describeRoute({
    @_s.required String meshName,
    @_s.required String routeName,
    @_s.required String virtualRouterName,
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
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/meshes/${Uri.encodeComponent(meshName)}/virtualRouter/${Uri.encodeComponent(virtualRouterName)}/routes/${Uri.encodeComponent(routeName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeRouteOutput(
      route: RouteData.fromJson($json),
    );
  }

  /// Describes an existing virtual node.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which the virtual node resides.
  ///
  /// Parameter [virtualNodeName] :
  /// The name of the virtual node to describe.
  Future<DescribeVirtualNodeOutput> describeVirtualNode({
    @_s.required String meshName,
    @_s.required String virtualNodeName,
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
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/meshes/${Uri.encodeComponent(meshName)}/virtualNodes/${Uri.encodeComponent(virtualNodeName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeVirtualNodeOutput(
      virtualNode: VirtualNodeData.fromJson($json),
    );
  }

  /// Describes an existing virtual router.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which the virtual router resides.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router to describe.
  Future<DescribeVirtualRouterOutput> describeVirtualRouter({
    @_s.required String meshName,
    @_s.required String virtualRouterName,
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
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/meshes/${Uri.encodeComponent(meshName)}/virtualRouters/${Uri.encodeComponent(virtualRouterName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeVirtualRouterOutput(
      virtualRouter: VirtualRouterData.fromJson($json),
    );
  }

  /// Returns a list of existing service meshes.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [limit] :
  /// The maximum number of mesh results returned by <code>ListMeshes</code> in
  /// paginated
  /// output. When this parameter is used, <code>ListMeshes</code> only returns
  /// <code>limit</code> results in a single page along with a
  /// <code>nextToken</code> response
  /// element. The remaining results of the initial request can be seen by
  /// sending another
  /// <code>ListMeshes</code> request with the returned <code>nextToken</code>
  /// value. This
  /// value can be between 1 and 100. If this parameter is not
  /// used, then <code>ListMeshes</code> returns up to 100 results and a
  /// <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListMeshes</code> request where <code>limit</code> was used and the
  /// results exceeded the value of that parameter. Pagination continues from
  /// the end of the
  /// previous results that returned the <code>nextToken</code> value.
  ///
  /// <note>
  ///
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  ///
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
      requestUri: '/meshes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMeshesOutput.fromJson(response);
  }

  /// Returns a list of existing routes in a service mesh.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which to list routes.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router in which to list routes.
  ///
  /// Parameter [limit] :
  /// The maximum number of mesh results returned by <code>ListRoutes</code> in
  /// paginated
  /// output. When this parameter is used, <code>ListRoutes</code> only returns
  /// <code>limit</code> results in a single page along with a
  /// <code>nextToken</code> response
  /// element. The remaining results of the initial request can be seen by
  /// sending another
  /// <code>ListRoutes</code> request with the returned <code>nextToken</code>
  /// value. This
  /// value can be between 1 and 100. If this parameter is not
  /// used, then <code>ListRoutes</code> returns up to 100 results and a
  /// <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListRoutes</code> request where <code>limit</code> was used and the
  /// results exceeded the value of that parameter. Pagination continues from
  /// the end of the
  /// previous results that returned the <code>nextToken</code> value.
  Future<ListRoutesOutput> listRoutes({
    @_s.required String meshName,
    @_s.required String virtualRouterName,
    int limit,
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
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/meshes/${Uri.encodeComponent(meshName)}/virtualRouter/${Uri.encodeComponent(virtualRouterName)}/routes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRoutesOutput.fromJson(response);
  }

  /// Returns a list of existing virtual nodes.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which to list virtual nodes.
  ///
  /// Parameter [limit] :
  /// The maximum number of mesh results returned by
  /// <code>ListVirtualNodes</code> in
  /// paginated output. When this parameter is used,
  /// <code>ListVirtualNodes</code> only returns
  /// <code>limit</code> results in a single page along with a
  /// <code>nextToken</code>
  /// response element. The remaining results of the initial request can be seen
  /// by sending
  /// another <code>ListVirtualNodes</code> request with the returned
  /// <code>nextToken</code>
  /// value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListVirtualNodes</code> returns up to
  /// 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListVirtualNodes</code> request where <code>limit</code> was used
  /// and the
  /// results exceeded the value of that parameter. Pagination continues from
  /// the end of the
  /// previous results that returned the <code>nextToken</code> value.
  Future<ListVirtualNodesOutput> listVirtualNodes({
    @_s.required String meshName,
    int limit,
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
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/meshes/${Uri.encodeComponent(meshName)}/virtualNodes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVirtualNodesOutput.fromJson(response);
  }

  /// Returns a list of existing virtual routers in a service mesh.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which to list virtual routers.
  ///
  /// Parameter [limit] :
  /// The maximum number of mesh results returned by
  /// <code>ListVirtualRouters</code> in
  /// paginated output. When this parameter is used,
  /// <code>ListVirtualRouters</code> only returns
  /// <code>limit</code> results in a single page along with a
  /// <code>nextToken</code>
  /// response element. The remaining results of the initial request can be seen
  /// by sending
  /// another <code>ListVirtualRouters</code> request with the returned
  /// <code>nextToken</code>
  /// value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListVirtualRouters</code> returns up to
  /// 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListVirtualRouters</code> request where <code>limit</code> was used
  /// and the
  /// results exceeded the value of that parameter. Pagination continues from
  /// the end of the
  /// previous results that returned the <code>nextToken</code> value.
  Future<ListVirtualRoutersOutput> listVirtualRouters({
    @_s.required String meshName,
    int limit,
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
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/meshes/${Uri.encodeComponent(meshName)}/virtualRouters',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVirtualRoutersOutput.fromJson(response);
  }

  /// Updates an existing route for a specified service mesh and virtual router.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which the route resides.
  ///
  /// Parameter [routeName] :
  /// The name of the route to update.
  ///
  /// Parameter [spec] :
  /// The new route specification to apply. This overwrites the existing data.
  ///
  /// Parameter [virtualRouterName] :
  /// The name of the virtual router with which the route is associated.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the
  /// request. Up to 36 letters, numbers, hyphens, and underscores are allowed.
  Future<UpdateRouteOutput> updateRoute({
    @_s.required String meshName,
    @_s.required String routeName,
    @_s.required RouteSpec spec,
    @_s.required String virtualRouterName,
    String clientToken,
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
    final $payload = <String, dynamic>{
      'spec': spec,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/meshes/${Uri.encodeComponent(meshName)}/virtualRouter/${Uri.encodeComponent(virtualRouterName)}/routes/${Uri.encodeComponent(routeName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateRouteOutput(
      route: RouteData.fromJson($json),
    );
  }

  /// Updates an existing virtual node in a specified service mesh.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which the virtual node resides.
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
  /// idempotency of the
  /// request. Up to 36 letters, numbers, hyphens, and underscores are allowed.
  Future<UpdateVirtualNodeOutput> updateVirtualNode({
    @_s.required String meshName,
    @_s.required VirtualNodeSpec spec,
    @_s.required String virtualNodeName,
    String clientToken,
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
    final $payload = <String, dynamic>{
      'spec': spec,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/meshes/${Uri.encodeComponent(meshName)}/virtualNodes/${Uri.encodeComponent(virtualNodeName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateVirtualNodeOutput(
      virtualNode: VirtualNodeData.fromJson($json),
    );
  }

  /// Updates an existing virtual router in a specified service mesh.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [LimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [meshName] :
  /// The name of the service mesh in which the virtual router resides.
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
  /// idempotency of the
  /// request. Up to 36 letters, numbers, hyphens, and underscores are allowed.
  Future<UpdateVirtualRouterOutput> updateVirtualRouter({
    @_s.required String meshName,
    @_s.required VirtualRouterSpec spec,
    @_s.required String virtualRouterName,
    String clientToken,
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
    final $payload = <String, dynamic>{
      'spec': spec,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/meshes/${Uri.encodeComponent(meshName)}/virtualRouters/${Uri.encodeComponent(virtualRouterName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateVirtualRouterOutput(
      virtualRouter: VirtualRouterData.fromJson($json),
    );
  }
}

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
    this.mesh,
  });
  factory DeleteMeshOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteMeshOutputFromJson(json);
}

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
    this.virtualRouter,
  });
  factory UpdateVirtualRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateVirtualRouterOutputFromJson(json);
}

enum MeshStatusCode {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('INACTIVE')
  inactive,
}

/// An object representing a target and its relative weight. Traffic is
/// distributed across
/// targets according to their relative weight. For example, a weighted target
/// with a relative
/// weight of 50 receives five times as much traffic as one with a relative
/// weight of
/// 10.
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
    this.virtualNode,
    this.weight,
  });
  factory WeightedTarget.fromJson(Map<String, dynamic> json) =>
      _$WeightedTargetFromJson(json);

  Map<String, dynamic> toJson() => _$WeightedTargetToJson(this);
}

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
    this.route,
  });
  factory CreateRouteOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateRouteOutputFromJson(json);
}

/// The DNS service discovery information for your virtual node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DnsServiceDiscovery {
  /// The DNS service name for your virtual node.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  DnsServiceDiscovery({
    this.serviceName,
  });
  factory DnsServiceDiscovery.fromJson(Map<String, dynamic> json) =>
      _$DnsServiceDiscoveryFromJson(json);

  Map<String, dynamic> toJson() => _$DnsServiceDiscoveryToJson(this);
}

/// An object representing a virtual node returned by a list operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualNodeRef {
  /// The full Amazon Resource Name (ARN) for the virtual node.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name of the service mesh in which the virtual node resides.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The name of the virtual node.
  @_s.JsonKey(name: 'virtualNodeName')
  final String virtualNodeName;

  VirtualNodeRef({
    this.arn,
    this.meshName,
    this.virtualNodeName,
  });
  factory VirtualNodeRef.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeRefFromJson(json);
}

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
    this.route,
  });
  factory DescribeRouteOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeRouteOutputFromJson(json);
}

/// An object representing the service discovery information for a virtual node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServiceDiscovery {
  /// Specifies the DNS service name for the virtual node.
  @_s.JsonKey(name: 'dns')
  final DnsServiceDiscovery dns;

  ServiceDiscovery({
    this.dns,
  });
  factory ServiceDiscovery.fromJson(Map<String, dynamic> json) =>
      _$ServiceDiscoveryFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceDiscoveryToJson(this);
}

/// An object representing the status of a service mesh.
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

/// An object representing a virtual node returned by a describe operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualNodeData {
  /// The name of the service mesh in which the virtual node resides.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The name of the virtual node.
  @_s.JsonKey(name: 'virtualNodeName')
  final String virtualNodeName;

  /// The associated metadata for the virtual node.
  @_s.JsonKey(name: 'metadata')
  final ResourceMetadata metadata;

  /// The specifications of the virtual node.
  @_s.JsonKey(name: 'spec')
  final VirtualNodeSpec spec;

  /// The current status for the virtual node.
  @_s.JsonKey(name: 'status')
  final VirtualNodeStatus status;

  VirtualNodeData({
    @_s.required this.meshName,
    @_s.required this.virtualNodeName,
    this.metadata,
    this.spec,
    this.status,
  });
  factory VirtualNodeData.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeDataFromJson(json);
}

/// An object representing the specification of a virtual node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualNodeSpec {
  /// The backends to which the virtual node is expected to send outbound traffic.
  @_s.JsonKey(name: 'backends')
  final List<String> backends;

  /// The listeners from which the virtual node is expected to receive inbound
  /// traffic.
  @_s.JsonKey(name: 'listeners')
  final List<Listener> listeners;

  /// The service discovery information for the virtual node.
  @_s.JsonKey(name: 'serviceDiscovery')
  final ServiceDiscovery serviceDiscovery;

  VirtualNodeSpec({
    this.backends,
    this.listeners,
    this.serviceDiscovery,
  });
  factory VirtualNodeSpec.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeSpecFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualNodeSpecToJson(this);
}

/// An object representing a service mesh returned by a list operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MeshRef {
  /// The full Amazon Resource Name (ARN) of the service mesh.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name of the service mesh.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  MeshRef({
    this.arn,
    this.meshName,
  });
  factory MeshRef.fromJson(Map<String, dynamic> json) =>
      _$MeshRefFromJson(json);
}

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
    this.virtualRouter,
  });
  factory DescribeVirtualRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeVirtualRouterOutputFromJson(json);
}

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
    this.route,
  });
  factory UpdateRouteOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateRouteOutputFromJson(json);
}

/// An object representing the traffic distribution requirements for matched
/// HTTP
/// requests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpRouteAction {
  /// The targets that traffic is routed to when a request matches the route. You
  /// can specify
  /// one or more targets and their relative weights with which to distribute
  /// traffic.
  @_s.JsonKey(name: 'weightedTargets')
  final List<WeightedTarget> weightedTargets;

  HttpRouteAction({
    this.weightedTargets,
  });
  factory HttpRouteAction.fromJson(Map<String, dynamic> json) =>
      _$HttpRouteActionFromJson(json);

  Map<String, dynamic> toJson() => _$HttpRouteActionToJson(this);
}

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
    this.virtualRouter,
  });
  factory CreateVirtualRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateVirtualRouterOutputFromJson(json);
}

/// An object representing the current status of a route.
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
    this.status,
  });
  factory RouteStatus.fromJson(Map<String, dynamic> json) =>
      _$RouteStatusFromJson(json);
}

/// An object representing the status of a virtual router.
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
    this.status,
  });
  factory VirtualRouterStatus.fromJson(Map<String, dynamic> json) =>
      _$VirtualRouterStatusFromJson(json);
}

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
  /// <code>ListMeshes</code>
  /// request. When the results of a <code>ListMeshes</code> request exceed
  /// <code>limit</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListMeshesOutput({
    @_s.required this.meshes,
    this.nextToken,
  });
  factory ListMeshesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListMeshesOutputFromJson(json);
}

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
    this.virtualNode,
  });
  factory DescribeVirtualNodeOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeVirtualNodeOutputFromJson(json);
}

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
    this.mesh,
  });
  factory CreateMeshOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateMeshOutputFromJson(json);
}

/// An object representing a route returned by a describe operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RouteData {
  /// The name of the service mesh in which the route resides.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The name of the route.
  @_s.JsonKey(name: 'routeName')
  final String routeName;

  /// The virtual router with which the route is associated.
  @_s.JsonKey(name: 'virtualRouterName')
  final String virtualRouterName;

  /// The associated metadata for the route.
  @_s.JsonKey(name: 'metadata')
  final ResourceMetadata metadata;

  /// The specifications of the route.
  @_s.JsonKey(name: 'spec')
  final RouteSpec spec;

  /// The status of the route.
  @_s.JsonKey(name: 'status')
  final RouteStatus status;

  RouteData({
    @_s.required this.meshName,
    @_s.required this.routeName,
    @_s.required this.virtualRouterName,
    this.metadata,
    this.spec,
    this.status,
  });
  factory RouteData.fromJson(Map<String, dynamic> json) =>
      _$RouteDataFromJson(json);
}

/// An object representing the HTTP routing specification for a route.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpRoute {
  /// The action to take if a match is determined.
  @_s.JsonKey(name: 'action')
  final HttpRouteAction action;

  /// The criteria for determining an HTTP request match.
  @_s.JsonKey(name: 'match')
  final HttpRouteMatch match;

  HttpRoute({
    this.action,
    this.match,
  });
  factory HttpRoute.fromJson(Map<String, dynamic> json) =>
      _$HttpRouteFromJson(json);

  Map<String, dynamic> toJson() => _$HttpRouteToJson(this);
}

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
  /// <code>ListRoutes</code>
  /// request. When the results of a <code>ListRoutes</code> request exceed
  /// <code>limit</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListRoutesOutput({
    @_s.required this.routes,
    this.nextToken,
  });
  factory ListRoutesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListRoutesOutputFromJson(json);
}

/// An object representing the specification of a route.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RouteSpec {
  /// The HTTP routing information for the route.
  @_s.JsonKey(name: 'httpRoute')
  final HttpRoute httpRoute;

  RouteSpec({
    this.httpRoute,
  });
  factory RouteSpec.fromJson(Map<String, dynamic> json) =>
      _$RouteSpecFromJson(json);

  Map<String, dynamic> toJson() => _$RouteSpecToJson(this);
}

/// An object representing a virtual router returned by a list operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualRouterRef {
  /// The full Amazon Resource Name (ARN) for the virtual router.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name of the service mesh in which the virtual router resides.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The name of the virtual router.
  @_s.JsonKey(name: 'virtualRouterName')
  final String virtualRouterName;

  VirtualRouterRef({
    this.arn,
    this.meshName,
    this.virtualRouterName,
  });
  factory VirtualRouterRef.fromJson(Map<String, dynamic> json) =>
      _$VirtualRouterRefFromJson(json);
}

enum VirtualRouterStatusCode {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('INACTIVE')
  inactive,
}

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
  /// <code>ListVirtualNodes</code>
  /// request. When the results of a <code>ListVirtualNodes</code> request exceed
  /// <code>limit</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListVirtualNodesOutput({
    @_s.required this.virtualNodes,
    this.nextToken,
  });
  factory ListVirtualNodesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListVirtualNodesOutputFromJson(json);
}

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
    this.virtualNode,
  });
  factory DeleteVirtualNodeOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteVirtualNodeOutputFromJson(json);
}

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
  /// <code>ListVirtualRouters</code>
  /// request. When the results of a <code>ListVirtualRouters</code> request
  /// exceed
  /// <code>limit</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListVirtualRoutersOutput({
    @_s.required this.virtualRouters,
    this.nextToken,
  });
  factory ListVirtualRoutersOutput.fromJson(Map<String, dynamic> json) =>
      _$ListVirtualRoutersOutputFromJson(json);
}

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
    this.virtualNode,
  });
  factory CreateVirtualNodeOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateVirtualNodeOutputFromJson(json);
}

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
    this.virtualRouter,
  });
  factory DeleteVirtualRouterOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteVirtualRouterOutputFromJson(json);
}

enum PortProtocol {
  @_s.JsonValue('http')
  http,
  @_s.JsonValue('tcp')
  tcp,
}

/// An object representing metadata for a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceMetadata {
  /// The full Amazon Resource Name (ARN) for the resource.
  ///
  /// <note>
  ///
  /// After you create a virtual node, set this value (either the full ARN or the
  /// truncated resource name, for example,
  /// <code>mesh/default/virtualNode/simpleapp</code>,
  /// as the <code>APPMESH_VIRTUAL_NODE_NAME</code> environment variable for your
  /// task group's
  /// Envoy proxy container in your task definition or pod spec. This is then
  /// mapped to the
  /// <code>node.id</code> and <code>node.cluster</code> Envoy parameters.
  ///
  ///
  /// If you require your Envoy stats or tracing to use a different name, you can
  /// override
  /// the <code>node.cluster</code> value that is set by
  /// <code>APPMESH_VIRTUAL_NODE_NAME</code> with the
  /// <code>APPMESH_VIRTUAL_NODE_CLUSTER</code> environment variable.
  ///
  /// </note>
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

  /// The unique identifier for the resource.
  @_s.JsonKey(name: 'uid')
  final String uid;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is
  /// incremented each time they are updated.
  @_s.JsonKey(name: 'version')
  final int version;

  ResourceMetadata({
    this.arn,
    this.createdAt,
    this.lastUpdatedAt,
    this.uid,
    this.version,
  });
  factory ResourceMetadata.fromJson(Map<String, dynamic> json) =>
      _$ResourceMetadataFromJson(json);
}

/// An object representing a virtual node listener port mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PortMapping {
  /// The port used for the port mapping.
  @_s.JsonKey(name: 'port')
  final int port;

  /// The protocol used for the port mapping.
  @_s.JsonKey(name: 'protocol')
  final PortProtocol protocol;

  PortMapping({
    this.port,
    this.protocol,
  });
  factory PortMapping.fromJson(Map<String, dynamic> json) =>
      _$PortMappingFromJson(json);

  Map<String, dynamic> toJson() => _$PortMappingToJson(this);
}

enum VirtualNodeStatusCode {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('INACTIVE')
  inactive,
}

/// An object representing the specification of a virtual router.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VirtualRouterSpec {
  /// The service mesh service names to associate with the virtual router.
  @_s.JsonKey(name: 'serviceNames')
  final List<String> serviceNames;

  VirtualRouterSpec({
    this.serviceNames,
  });
  factory VirtualRouterSpec.fromJson(Map<String, dynamic> json) =>
      _$VirtualRouterSpecFromJson(json);

  Map<String, dynamic> toJson() => _$VirtualRouterSpecToJson(this);
}

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
    this.mesh,
  });
  factory DescribeMeshOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeMeshOutputFromJson(json);
}

/// An object representing a virtual router returned by a describe operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualRouterData {
  /// The name of the service mesh in which the virtual router resides.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The name of the virtual router.
  @_s.JsonKey(name: 'virtualRouterName')
  final String virtualRouterName;

  /// The associated metadata for the virtual router.
  @_s.JsonKey(name: 'metadata')
  final ResourceMetadata metadata;

  /// The specifications of the virtual router.
  @_s.JsonKey(name: 'spec')
  final VirtualRouterSpec spec;

  /// The current status of the virtual router.
  @_s.JsonKey(name: 'status')
  final VirtualRouterStatus status;

  VirtualRouterData({
    @_s.required this.meshName,
    @_s.required this.virtualRouterName,
    this.metadata,
    this.spec,
    this.status,
  });
  factory VirtualRouterData.fromJson(Map<String, dynamic> json) =>
      _$VirtualRouterDataFromJson(json);
}

/// An object representing a listener for a virtual node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Listener {
  /// The health check information for the listener.
  @_s.JsonKey(name: 'healthCheck')
  final HealthCheckPolicy healthCheck;

  /// The port mapping information for the listener.
  @_s.JsonKey(name: 'portMapping')
  final PortMapping portMapping;

  Listener({
    this.healthCheck,
    this.portMapping,
  });
  factory Listener.fromJson(Map<String, dynamic> json) =>
      _$ListenerFromJson(json);

  Map<String, dynamic> toJson() => _$ListenerToJson(this);
}

/// An object representing the health check policy for a virtual node's
/// listener.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HealthCheckPolicy {
  /// The number of consecutive successful health checks that must occur before
  /// declaring
  /// listener healthy.
  @_s.JsonKey(name: 'healthyThreshold')
  final int healthyThreshold;

  /// The time period in milliseconds between each health check execution.
  @_s.JsonKey(name: 'intervalMillis')
  final int intervalMillis;

  /// The protocol for the health check request.
  @_s.JsonKey(name: 'protocol')
  final PortProtocol protocol;

  /// The amount of time to wait when receiving a response from the health check,
  /// in
  /// milliseconds.
  @_s.JsonKey(name: 'timeoutMillis')
  final int timeoutMillis;

  /// The number of consecutive failed health checks that must occur before
  /// declaring a
  /// virtual node unhealthy.
  @_s.JsonKey(name: 'unhealthyThreshold')
  final int unhealthyThreshold;

  /// The destination path for the health check request. This is only required if
  /// the
  /// specified protocol is HTTP; if the protocol is TCP, then this parameter is
  /// ignored.
  @_s.JsonKey(name: 'path')
  final String path;

  /// The destination port for the health check request. This port must match the
  /// port defined
  /// in the <a>PortMapping</a> for the listener.
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

/// An object representing a service mesh returned by a describe operation.
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

  /// The status of the service mesh.
  @_s.JsonKey(name: 'status')
  final MeshStatus status;

  MeshData({
    @_s.required this.meshName,
    @_s.required this.metadata,
    this.status,
  });
  factory MeshData.fromJson(Map<String, dynamic> json) =>
      _$MeshDataFromJson(json);
}

/// An object representing the requirements for a route to match HTTP requests
/// for a virtual
/// router.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpRouteMatch {
  /// Specifies the path with which to match requests. This parameter must always
  /// start with
  /// <code>/</code>, which by itself matches all requests to the virtual router
  /// service name.
  /// You can also match for path-based routing of requests. For example, if your
  /// virtual router
  /// service name is <code>my-service.local</code>, and you want the route to
  /// match requests to
  /// <code>my-service.local/metrics</code>, then your prefix should be
  /// <code>/metrics</code>.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  HttpRouteMatch({
    this.prefix,
  });
  factory HttpRouteMatch.fromJson(Map<String, dynamic> json) =>
      _$HttpRouteMatchFromJson(json);

  Map<String, dynamic> toJson() => _$HttpRouteMatchToJson(this);
}

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
    this.route,
  });
  factory DeleteRouteOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteRouteOutputFromJson(json);
}

/// An object representing the current status of the virtual node.
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
    this.status,
  });
  factory VirtualNodeStatus.fromJson(Map<String, dynamic> json) =>
      _$VirtualNodeStatusFromJson(json);
}

/// An object representing a route returned by a list operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RouteRef {
  /// The full Amazon Resource Name (ARN) for the route.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name of the service mesh in which the route resides.
  @_s.JsonKey(name: 'meshName')
  final String meshName;

  /// The name of the route.
  @_s.JsonKey(name: 'routeName')
  final String routeName;

  /// The virtual router with which the route is associated.
  @_s.JsonKey(name: 'virtualRouterName')
  final String virtualRouterName;

  RouteRef({
    this.arn,
    this.meshName,
    this.routeName,
    this.virtualRouterName,
  });
  factory RouteRef.fromJson(Map<String, dynamic> json) =>
      _$RouteRefFromJson(json);
}

enum RouteStatusCode {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('INACTIVE')
  inactive,
}

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
    this.virtualNode,
  });
  factory UpdateVirtualNodeOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateVirtualNodeOutputFromJson(json);
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
};
