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
    required String meshName,
    String? clientToken,
  }) async {
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
    required String meshName,
    required String routeName,
    required RouteSpec spec,
    required String virtualRouterName,
    String? clientToken,
  }) async {
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
    required String meshName,
    required VirtualNodeSpec spec,
    required String virtualNodeName,
    String? clientToken,
  }) async {
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
    required String meshName,
    required VirtualRouterSpec spec,
    required String virtualRouterName,
    String? clientToken,
  }) async {
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
    required String meshName,
  }) async {
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
    required String meshName,
    required String routeName,
    required String virtualRouterName,
  }) async {
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
    required String meshName,
    required String virtualNodeName,
  }) async {
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
    required String meshName,
    required String virtualRouterName,
  }) async {
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
    required String meshName,
  }) async {
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
    required String meshName,
    required String routeName,
    required String virtualRouterName,
  }) async {
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
    required String meshName,
    required String virtualNodeName,
  }) async {
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
    required String meshName,
    required String virtualRouterName,
  }) async {
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
    required String meshName,
    required String virtualRouterName,
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
    required String meshName,
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
    required String meshName,
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
    required String meshName,
    required String routeName,
    required RouteSpec spec,
    required String virtualRouterName,
    String? clientToken,
  }) async {
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
    required String meshName,
    required VirtualNodeSpec spec,
    required String virtualNodeName,
    String? clientToken,
  }) async {
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
    required String meshName,
    required VirtualRouterSpec spec,
    required String virtualRouterName,
    String? clientToken,
  }) async {
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

class DeleteMeshOutput {
  /// The service mesh that was deleted.
  final MeshData? mesh;

  DeleteMeshOutput({
    this.mesh,
  });

  Map<String, dynamic> toJson() {
    final mesh = this.mesh;
    return {
      if (mesh != null) 'mesh': mesh,
    };
  }
}

class UpdateVirtualRouterOutput {
  /// A full description of the virtual router that was updated.
  final VirtualRouterData? virtualRouter;

  UpdateVirtualRouterOutput({
    this.virtualRouter,
  });

  Map<String, dynamic> toJson() {
    final virtualRouter = this.virtualRouter;
    return {
      if (virtualRouter != null) 'virtualRouter': virtualRouter,
    };
  }
}

enum MeshStatusCode {
  active,
  deleted,
  inactive,
}

extension MeshStatusCodeValueExtension on MeshStatusCode {
  String toValue() {
    switch (this) {
      case MeshStatusCode.active:
        return 'ACTIVE';
      case MeshStatusCode.deleted:
        return 'DELETED';
      case MeshStatusCode.inactive:
        return 'INACTIVE';
    }
  }
}

extension MeshStatusCodeFromString on String {
  MeshStatusCode toMeshStatusCode() {
    switch (this) {
      case 'ACTIVE':
        return MeshStatusCode.active;
      case 'DELETED':
        return MeshStatusCode.deleted;
      case 'INACTIVE':
        return MeshStatusCode.inactive;
    }
    throw Exception('$this is not known in enum MeshStatusCode');
  }
}

/// An object representing a target and its relative weight. Traffic is
/// distributed across
/// targets according to their relative weight. For example, a weighted target
/// with a relative
/// weight of 50 receives five times as much traffic as one with a relative
/// weight of
/// 10.
class WeightedTarget {
  /// The virtual node to associate with the weighted target.
  final String? virtualNode;

  /// The relative weight of the weighted target.
  final int? weight;

  WeightedTarget({
    this.virtualNode,
    this.weight,
  });

  factory WeightedTarget.fromJson(Map<String, dynamic> json) {
    return WeightedTarget(
      virtualNode: json['virtualNode'] as String?,
      weight: json['weight'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualNode = this.virtualNode;
    final weight = this.weight;
    return {
      if (virtualNode != null) 'virtualNode': virtualNode,
      if (weight != null) 'weight': weight,
    };
  }
}

class CreateRouteOutput {
  /// The full description of your mesh following the create call.
  final RouteData? route;

  CreateRouteOutput({
    this.route,
  });

  Map<String, dynamic> toJson() {
    final route = this.route;
    return {
      if (route != null) 'route': route,
    };
  }
}

/// The DNS service discovery information for your virtual node.
class DnsServiceDiscovery {
  /// The DNS service name for your virtual node.
  final String? serviceName;

  DnsServiceDiscovery({
    this.serviceName,
  });

  factory DnsServiceDiscovery.fromJson(Map<String, dynamic> json) {
    return DnsServiceDiscovery(
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceName = this.serviceName;
    return {
      if (serviceName != null) 'serviceName': serviceName,
    };
  }
}

/// An object representing a virtual node returned by a list operation.
class VirtualNodeRef {
  /// The full Amazon Resource Name (ARN) for the virtual node.
  final String? arn;

  /// The name of the service mesh in which the virtual node resides.
  final String? meshName;

  /// The name of the virtual node.
  final String? virtualNodeName;

  VirtualNodeRef({
    this.arn,
    this.meshName,
    this.virtualNodeName,
  });

  factory VirtualNodeRef.fromJson(Map<String, dynamic> json) {
    return VirtualNodeRef(
      arn: json['arn'] as String?,
      meshName: json['meshName'] as String?,
      virtualNodeName: json['virtualNodeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final meshName = this.meshName;
    final virtualNodeName = this.virtualNodeName;
    return {
      if (arn != null) 'arn': arn,
      if (meshName != null) 'meshName': meshName,
      if (virtualNodeName != null) 'virtualNodeName': virtualNodeName,
    };
  }
}

class DescribeRouteOutput {
  /// The full description of your route.
  final RouteData? route;

  DescribeRouteOutput({
    this.route,
  });

  Map<String, dynamic> toJson() {
    final route = this.route;
    return {
      if (route != null) 'route': route,
    };
  }
}

/// An object representing the service discovery information for a virtual node.
class ServiceDiscovery {
  /// Specifies the DNS service name for the virtual node.
  final DnsServiceDiscovery? dns;

  ServiceDiscovery({
    this.dns,
  });

  factory ServiceDiscovery.fromJson(Map<String, dynamic> json) {
    return ServiceDiscovery(
      dns: json['dns'] != null
          ? DnsServiceDiscovery.fromJson(json['dns'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dns = this.dns;
    return {
      if (dns != null) 'dns': dns,
    };
  }
}

/// An object representing the status of a service mesh.
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

/// An object representing a virtual node returned by a describe operation.
class VirtualNodeData {
  /// The name of the service mesh in which the virtual node resides.
  final String meshName;

  /// The name of the virtual node.
  final String virtualNodeName;

  /// The associated metadata for the virtual node.
  final ResourceMetadata? metadata;

  /// The specifications of the virtual node.
  final VirtualNodeSpec? spec;

  /// The current status for the virtual node.
  final VirtualNodeStatus? status;

  VirtualNodeData({
    required this.meshName,
    required this.virtualNodeName,
    this.metadata,
    this.spec,
    this.status,
  });

  factory VirtualNodeData.fromJson(Map<String, dynamic> json) {
    return VirtualNodeData(
      meshName: json['meshName'] as String,
      virtualNodeName: json['virtualNodeName'] as String,
      metadata: json['metadata'] != null
          ? ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      spec: json['spec'] != null
          ? VirtualNodeSpec.fromJson(json['spec'] as Map<String, dynamic>)
          : null,
      status: json['status'] != null
          ? VirtualNodeStatus.fromJson(json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final meshName = this.meshName;
    final virtualNodeName = this.virtualNodeName;
    final metadata = this.metadata;
    final spec = this.spec;
    final status = this.status;
    return {
      'meshName': meshName,
      'virtualNodeName': virtualNodeName,
      if (metadata != null) 'metadata': metadata,
      if (spec != null) 'spec': spec,
      if (status != null) 'status': status,
    };
  }
}

/// An object representing the specification of a virtual node.
class VirtualNodeSpec {
  /// The backends to which the virtual node is expected to send outbound traffic.
  final List<String>? backends;

  /// The listeners from which the virtual node is expected to receive inbound
  /// traffic.
  final List<Listener>? listeners;

  /// The service discovery information for the virtual node.
  final ServiceDiscovery? serviceDiscovery;

  VirtualNodeSpec({
    this.backends,
    this.listeners,
    this.serviceDiscovery,
  });

  factory VirtualNodeSpec.fromJson(Map<String, dynamic> json) {
    return VirtualNodeSpec(
      backends: (json['backends'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      listeners: (json['listeners'] as List?)
          ?.whereNotNull()
          .map((e) => Listener.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceDiscovery: json['serviceDiscovery'] != null
          ? ServiceDiscovery.fromJson(
              json['serviceDiscovery'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backends = this.backends;
    final listeners = this.listeners;
    final serviceDiscovery = this.serviceDiscovery;
    return {
      if (backends != null) 'backends': backends,
      if (listeners != null) 'listeners': listeners,
      if (serviceDiscovery != null) 'serviceDiscovery': serviceDiscovery,
    };
  }
}

/// An object representing a service mesh returned by a list operation.
class MeshRef {
  /// The full Amazon Resource Name (ARN) of the service mesh.
  final String? arn;

  /// The name of the service mesh.
  final String? meshName;

  MeshRef({
    this.arn,
    this.meshName,
  });

  factory MeshRef.fromJson(Map<String, dynamic> json) {
    return MeshRef(
      arn: json['arn'] as String?,
      meshName: json['meshName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final meshName = this.meshName;
    return {
      if (arn != null) 'arn': arn,
      if (meshName != null) 'meshName': meshName,
    };
  }
}

class DescribeVirtualRouterOutput {
  /// The full description of your virtual router.
  final VirtualRouterData? virtualRouter;

  DescribeVirtualRouterOutput({
    this.virtualRouter,
  });

  Map<String, dynamic> toJson() {
    final virtualRouter = this.virtualRouter;
    return {
      if (virtualRouter != null) 'virtualRouter': virtualRouter,
    };
  }
}

class UpdateRouteOutput {
  /// A full description of the route that was updated.
  final RouteData? route;

  UpdateRouteOutput({
    this.route,
  });

  Map<String, dynamic> toJson() {
    final route = this.route;
    return {
      if (route != null) 'route': route,
    };
  }
}

/// An object representing the traffic distribution requirements for matched
/// HTTP
/// requests.
class HttpRouteAction {
  /// The targets that traffic is routed to when a request matches the route. You
  /// can specify
  /// one or more targets and their relative weights with which to distribute
  /// traffic.
  final List<WeightedTarget>? weightedTargets;

  HttpRouteAction({
    this.weightedTargets,
  });

  factory HttpRouteAction.fromJson(Map<String, dynamic> json) {
    return HttpRouteAction(
      weightedTargets: (json['weightedTargets'] as List?)
          ?.whereNotNull()
          .map((e) => WeightedTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final weightedTargets = this.weightedTargets;
    return {
      if (weightedTargets != null) 'weightedTargets': weightedTargets,
    };
  }
}

class CreateVirtualRouterOutput {
  /// The full description of your virtual router following the create call.
  final VirtualRouterData? virtualRouter;

  CreateVirtualRouterOutput({
    this.virtualRouter,
  });

  Map<String, dynamic> toJson() {
    final virtualRouter = this.virtualRouter;
    return {
      if (virtualRouter != null) 'virtualRouter': virtualRouter,
    };
  }
}

/// An object representing the current status of a route.
class RouteStatus {
  /// The current status for the route.
  final RouteStatusCode? status;

  RouteStatus({
    this.status,
  });

  factory RouteStatus.fromJson(Map<String, dynamic> json) {
    return RouteStatus(
      status: (json['status'] as String?)?.toRouteStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// An object representing the status of a virtual router.
class VirtualRouterStatus {
  /// The current status of the virtual router.
  final VirtualRouterStatusCode? status;

  VirtualRouterStatus({
    this.status,
  });

  factory VirtualRouterStatus.fromJson(Map<String, dynamic> json) {
    return VirtualRouterStatus(
      status: (json['status'] as String?)?.toVirtualRouterStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

class ListMeshesOutput {
  /// The list of existing service meshes.
  final List<MeshRef> meshes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListMeshes</code>
  /// request. When the results of a <code>ListMeshes</code> request exceed
  /// <code>limit</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
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

class DescribeVirtualNodeOutput {
  /// The full description of your virtual node.
  final VirtualNodeData? virtualNode;

  DescribeVirtualNodeOutput({
    this.virtualNode,
  });

  Map<String, dynamic> toJson() {
    final virtualNode = this.virtualNode;
    return {
      if (virtualNode != null) 'virtualNode': virtualNode,
    };
  }
}

class CreateMeshOutput {
  /// The full description of your service mesh following the create call.
  final MeshData? mesh;

  CreateMeshOutput({
    this.mesh,
  });

  Map<String, dynamic> toJson() {
    final mesh = this.mesh;
    return {
      if (mesh != null) 'mesh': mesh,
    };
  }
}

/// An object representing a route returned by a describe operation.
class RouteData {
  /// The name of the service mesh in which the route resides.
  final String meshName;

  /// The name of the route.
  final String routeName;

  /// The virtual router with which the route is associated.
  final String virtualRouterName;

  /// The associated metadata for the route.
  final ResourceMetadata? metadata;

  /// The specifications of the route.
  final RouteSpec? spec;

  /// The status of the route.
  final RouteStatus? status;

  RouteData({
    required this.meshName,
    required this.routeName,
    required this.virtualRouterName,
    this.metadata,
    this.spec,
    this.status,
  });

  factory RouteData.fromJson(Map<String, dynamic> json) {
    return RouteData(
      meshName: json['meshName'] as String,
      routeName: json['routeName'] as String,
      virtualRouterName: json['virtualRouterName'] as String,
      metadata: json['metadata'] != null
          ? ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      spec: json['spec'] != null
          ? RouteSpec.fromJson(json['spec'] as Map<String, dynamic>)
          : null,
      status: json['status'] != null
          ? RouteStatus.fromJson(json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final meshName = this.meshName;
    final routeName = this.routeName;
    final virtualRouterName = this.virtualRouterName;
    final metadata = this.metadata;
    final spec = this.spec;
    final status = this.status;
    return {
      'meshName': meshName,
      'routeName': routeName,
      'virtualRouterName': virtualRouterName,
      if (metadata != null) 'metadata': metadata,
      if (spec != null) 'spec': spec,
      if (status != null) 'status': status,
    };
  }
}

/// An object representing the HTTP routing specification for a route.
class HttpRoute {
  /// The action to take if a match is determined.
  final HttpRouteAction? action;

  /// The criteria for determining an HTTP request match.
  final HttpRouteMatch? match;

  HttpRoute({
    this.action,
    this.match,
  });

  factory HttpRoute.fromJson(Map<String, dynamic> json) {
    return HttpRoute(
      action: json['action'] != null
          ? HttpRouteAction.fromJson(json['action'] as Map<String, dynamic>)
          : null,
      match: json['match'] != null
          ? HttpRouteMatch.fromJson(json['match'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final match = this.match;
    return {
      if (action != null) 'action': action,
      if (match != null) 'match': match,
    };
  }
}

class ListRoutesOutput {
  /// The list of existing routes for the specified service mesh and virtual
  /// router.
  final List<RouteRef> routes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListRoutes</code>
  /// request. When the results of a <code>ListRoutes</code> request exceed
  /// <code>limit</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
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

/// An object representing the specification of a route.
class RouteSpec {
  /// The HTTP routing information for the route.
  final HttpRoute? httpRoute;

  RouteSpec({
    this.httpRoute,
  });

  factory RouteSpec.fromJson(Map<String, dynamic> json) {
    return RouteSpec(
      httpRoute: json['httpRoute'] != null
          ? HttpRoute.fromJson(json['httpRoute'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final httpRoute = this.httpRoute;
    return {
      if (httpRoute != null) 'httpRoute': httpRoute,
    };
  }
}

/// An object representing a virtual router returned by a list operation.
class VirtualRouterRef {
  /// The full Amazon Resource Name (ARN) for the virtual router.
  final String? arn;

  /// The name of the service mesh in which the virtual router resides.
  final String? meshName;

  /// The name of the virtual router.
  final String? virtualRouterName;

  VirtualRouterRef({
    this.arn,
    this.meshName,
    this.virtualRouterName,
  });

  factory VirtualRouterRef.fromJson(Map<String, dynamic> json) {
    return VirtualRouterRef(
      arn: json['arn'] as String?,
      meshName: json['meshName'] as String?,
      virtualRouterName: json['virtualRouterName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final meshName = this.meshName;
    final virtualRouterName = this.virtualRouterName;
    return {
      if (arn != null) 'arn': arn,
      if (meshName != null) 'meshName': meshName,
      if (virtualRouterName != null) 'virtualRouterName': virtualRouterName,
    };
  }
}

enum VirtualRouterStatusCode {
  active,
  deleted,
  inactive,
}

extension VirtualRouterStatusCodeValueExtension on VirtualRouterStatusCode {
  String toValue() {
    switch (this) {
      case VirtualRouterStatusCode.active:
        return 'ACTIVE';
      case VirtualRouterStatusCode.deleted:
        return 'DELETED';
      case VirtualRouterStatusCode.inactive:
        return 'INACTIVE';
    }
  }
}

extension VirtualRouterStatusCodeFromString on String {
  VirtualRouterStatusCode toVirtualRouterStatusCode() {
    switch (this) {
      case 'ACTIVE':
        return VirtualRouterStatusCode.active;
      case 'DELETED':
        return VirtualRouterStatusCode.deleted;
      case 'INACTIVE':
        return VirtualRouterStatusCode.inactive;
    }
    throw Exception('$this is not known in enum VirtualRouterStatusCode');
  }
}

class ListVirtualNodesOutput {
  /// The list of existing virtual nodes for the specified service mesh.
  final List<VirtualNodeRef> virtualNodes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListVirtualNodes</code>
  /// request. When the results of a <code>ListVirtualNodes</code> request exceed
  /// <code>limit</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
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

class DeleteVirtualNodeOutput {
  /// The virtual node that was deleted.
  final VirtualNodeData? virtualNode;

  DeleteVirtualNodeOutput({
    this.virtualNode,
  });

  Map<String, dynamic> toJson() {
    final virtualNode = this.virtualNode;
    return {
      if (virtualNode != null) 'virtualNode': virtualNode,
    };
  }
}

class ListVirtualRoutersOutput {
  /// The list of existing virtual routers for the specified service mesh.
  final List<VirtualRouterRef> virtualRouters;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListVirtualRouters</code>
  /// request. When the results of a <code>ListVirtualRouters</code> request
  /// exceed
  /// <code>limit</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
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

class CreateVirtualNodeOutput {
  /// The full description of your virtual node following the create call.
  final VirtualNodeData? virtualNode;

  CreateVirtualNodeOutput({
    this.virtualNode,
  });

  Map<String, dynamic> toJson() {
    final virtualNode = this.virtualNode;
    return {
      if (virtualNode != null) 'virtualNode': virtualNode,
    };
  }
}

class DeleteVirtualRouterOutput {
  /// The virtual router that was deleted.
  final VirtualRouterData? virtualRouter;

  DeleteVirtualRouterOutput({
    this.virtualRouter,
  });

  Map<String, dynamic> toJson() {
    final virtualRouter = this.virtualRouter;
    return {
      if (virtualRouter != null) 'virtualRouter': virtualRouter,
    };
  }
}

enum PortProtocol {
  http,
  tcp,
}

extension PortProtocolValueExtension on PortProtocol {
  String toValue() {
    switch (this) {
      case PortProtocol.http:
        return 'http';
      case PortProtocol.tcp:
        return 'tcp';
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
    }
    throw Exception('$this is not known in enum PortProtocol');
  }
}

/// An object representing metadata for a resource.
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
  final String? arn;

  /// The Unix epoch timestamp in seconds for when the resource was created.
  final DateTime? createdAt;

  /// The Unix epoch timestamp in seconds for when the resource was last updated.
  final DateTime? lastUpdatedAt;

  /// The unique identifier for the resource.
  final String? uid;

  /// The version of the resource. Resources are created at version 1, and this
  /// version is
  /// incremented each time they are updated.
  final int? version;

  ResourceMetadata({
    this.arn,
    this.createdAt,
    this.lastUpdatedAt,
    this.uid,
    this.version,
  });

  factory ResourceMetadata.fromJson(Map<String, dynamic> json) {
    return ResourceMetadata(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      uid: json['uid'] as String?,
      version: json['version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final uid = this.uid;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (uid != null) 'uid': uid,
      if (version != null) 'version': version,
    };
  }
}

/// An object representing a virtual node listener port mapping.
class PortMapping {
  /// The port used for the port mapping.
  final int? port;

  /// The protocol used for the port mapping.
  final PortProtocol? protocol;

  PortMapping({
    this.port,
    this.protocol,
  });

  factory PortMapping.fromJson(Map<String, dynamic> json) {
    return PortMapping(
      port: json['port'] as int?,
      protocol: (json['protocol'] as String?)?.toPortProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final protocol = this.protocol;
    return {
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.toValue(),
    };
  }
}

enum VirtualNodeStatusCode {
  active,
  deleted,
  inactive,
}

extension VirtualNodeStatusCodeValueExtension on VirtualNodeStatusCode {
  String toValue() {
    switch (this) {
      case VirtualNodeStatusCode.active:
        return 'ACTIVE';
      case VirtualNodeStatusCode.deleted:
        return 'DELETED';
      case VirtualNodeStatusCode.inactive:
        return 'INACTIVE';
    }
  }
}

extension VirtualNodeStatusCodeFromString on String {
  VirtualNodeStatusCode toVirtualNodeStatusCode() {
    switch (this) {
      case 'ACTIVE':
        return VirtualNodeStatusCode.active;
      case 'DELETED':
        return VirtualNodeStatusCode.deleted;
      case 'INACTIVE':
        return VirtualNodeStatusCode.inactive;
    }
    throw Exception('$this is not known in enum VirtualNodeStatusCode');
  }
}

/// An object representing the specification of a virtual router.
class VirtualRouterSpec {
  /// The service mesh service names to associate with the virtual router.
  final List<String>? serviceNames;

  VirtualRouterSpec({
    this.serviceNames,
  });

  factory VirtualRouterSpec.fromJson(Map<String, dynamic> json) {
    return VirtualRouterSpec(
      serviceNames: (json['serviceNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceNames = this.serviceNames;
    return {
      if (serviceNames != null) 'serviceNames': serviceNames,
    };
  }
}

class DescribeMeshOutput {
  /// The full description of your service mesh.
  final MeshData? mesh;

  DescribeMeshOutput({
    this.mesh,
  });

  Map<String, dynamic> toJson() {
    final mesh = this.mesh;
    return {
      if (mesh != null) 'mesh': mesh,
    };
  }
}

/// An object representing a virtual router returned by a describe operation.
class VirtualRouterData {
  /// The name of the service mesh in which the virtual router resides.
  final String meshName;

  /// The name of the virtual router.
  final String virtualRouterName;

  /// The associated metadata for the virtual router.
  final ResourceMetadata? metadata;

  /// The specifications of the virtual router.
  final VirtualRouterSpec? spec;

  /// The current status of the virtual router.
  final VirtualRouterStatus? status;

  VirtualRouterData({
    required this.meshName,
    required this.virtualRouterName,
    this.metadata,
    this.spec,
    this.status,
  });

  factory VirtualRouterData.fromJson(Map<String, dynamic> json) {
    return VirtualRouterData(
      meshName: json['meshName'] as String,
      virtualRouterName: json['virtualRouterName'] as String,
      metadata: json['metadata'] != null
          ? ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      spec: json['spec'] != null
          ? VirtualRouterSpec.fromJson(json['spec'] as Map<String, dynamic>)
          : null,
      status: json['status'] != null
          ? VirtualRouterStatus.fromJson(json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final meshName = this.meshName;
    final virtualRouterName = this.virtualRouterName;
    final metadata = this.metadata;
    final spec = this.spec;
    final status = this.status;
    return {
      'meshName': meshName,
      'virtualRouterName': virtualRouterName,
      if (metadata != null) 'metadata': metadata,
      if (spec != null) 'spec': spec,
      if (status != null) 'status': status,
    };
  }
}

/// An object representing a listener for a virtual node.
class Listener {
  /// The health check information for the listener.
  final HealthCheckPolicy? healthCheck;

  /// The port mapping information for the listener.
  final PortMapping? portMapping;

  Listener({
    this.healthCheck,
    this.portMapping,
  });

  factory Listener.fromJson(Map<String, dynamic> json) {
    return Listener(
      healthCheck: json['healthCheck'] != null
          ? HealthCheckPolicy.fromJson(
              json['healthCheck'] as Map<String, dynamic>)
          : null,
      portMapping: json['portMapping'] != null
          ? PortMapping.fromJson(json['portMapping'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final healthCheck = this.healthCheck;
    final portMapping = this.portMapping;
    return {
      if (healthCheck != null) 'healthCheck': healthCheck,
      if (portMapping != null) 'portMapping': portMapping,
    };
  }
}

/// An object representing the health check policy for a virtual node's
/// listener.
class HealthCheckPolicy {
  /// The number of consecutive successful health checks that must occur before
  /// declaring
  /// listener healthy.
  final int healthyThreshold;

  /// The time period in milliseconds between each health check execution.
  final int intervalMillis;

  /// The protocol for the health check request.
  final PortProtocol protocol;

  /// The amount of time to wait when receiving a response from the health check,
  /// in
  /// milliseconds.
  final int timeoutMillis;

  /// The number of consecutive failed health checks that must occur before
  /// declaring a
  /// virtual node unhealthy.
  final int unhealthyThreshold;

  /// The destination path for the health check request. This is only required if
  /// the
  /// specified protocol is HTTP; if the protocol is TCP, then this parameter is
  /// ignored.
  final String? path;

  /// The destination port for the health check request. This port must match the
  /// port defined
  /// in the <a>PortMapping</a> for the listener.
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

/// An object representing a service mesh returned by a describe operation.
class MeshData {
  /// The name of the service mesh.
  final String meshName;

  /// The associated metadata for the service mesh.
  final ResourceMetadata metadata;

  /// The status of the service mesh.
  final MeshStatus? status;

  MeshData({
    required this.meshName,
    required this.metadata,
    this.status,
  });

  factory MeshData.fromJson(Map<String, dynamic> json) {
    return MeshData(
      meshName: json['meshName'] as String,
      metadata:
          ResourceMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      status: json['status'] != null
          ? MeshStatus.fromJson(json['status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final meshName = this.meshName;
    final metadata = this.metadata;
    final status = this.status;
    return {
      'meshName': meshName,
      'metadata': metadata,
      if (status != null) 'status': status,
    };
  }
}

/// An object representing the requirements for a route to match HTTP requests
/// for a virtual
/// router.
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
  final String? prefix;

  HttpRouteMatch({
    this.prefix,
  });

  factory HttpRouteMatch.fromJson(Map<String, dynamic> json) {
    return HttpRouteMatch(
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final prefix = this.prefix;
    return {
      if (prefix != null) 'prefix': prefix,
    };
  }
}

class DeleteRouteOutput {
  /// The route that was deleted.
  final RouteData? route;

  DeleteRouteOutput({
    this.route,
  });

  Map<String, dynamic> toJson() {
    final route = this.route;
    return {
      if (route != null) 'route': route,
    };
  }
}

/// An object representing the current status of the virtual node.
class VirtualNodeStatus {
  /// The current status of the virtual node.
  final VirtualNodeStatusCode? status;

  VirtualNodeStatus({
    this.status,
  });

  factory VirtualNodeStatus.fromJson(Map<String, dynamic> json) {
    return VirtualNodeStatus(
      status: (json['status'] as String?)?.toVirtualNodeStatusCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// An object representing a route returned by a list operation.
class RouteRef {
  /// The full Amazon Resource Name (ARN) for the route.
  final String? arn;

  /// The name of the service mesh in which the route resides.
  final String? meshName;

  /// The name of the route.
  final String? routeName;

  /// The virtual router with which the route is associated.
  final String? virtualRouterName;

  RouteRef({
    this.arn,
    this.meshName,
    this.routeName,
    this.virtualRouterName,
  });

  factory RouteRef.fromJson(Map<String, dynamic> json) {
    return RouteRef(
      arn: json['arn'] as String?,
      meshName: json['meshName'] as String?,
      routeName: json['routeName'] as String?,
      virtualRouterName: json['virtualRouterName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final meshName = this.meshName;
    final routeName = this.routeName;
    final virtualRouterName = this.virtualRouterName;
    return {
      if (arn != null) 'arn': arn,
      if (meshName != null) 'meshName': meshName,
      if (routeName != null) 'routeName': routeName,
      if (virtualRouterName != null) 'virtualRouterName': virtualRouterName,
    };
  }
}

enum RouteStatusCode {
  active,
  deleted,
  inactive,
}

extension RouteStatusCodeValueExtension on RouteStatusCode {
  String toValue() {
    switch (this) {
      case RouteStatusCode.active:
        return 'ACTIVE';
      case RouteStatusCode.deleted:
        return 'DELETED';
      case RouteStatusCode.inactive:
        return 'INACTIVE';
    }
  }
}

extension RouteStatusCodeFromString on String {
  RouteStatusCode toRouteStatusCode() {
    switch (this) {
      case 'ACTIVE':
        return RouteStatusCode.active;
      case 'DELETED':
        return RouteStatusCode.deleted;
      case 'INACTIVE':
        return RouteStatusCode.inactive;
    }
    throw Exception('$this is not known in enum RouteStatusCode');
  }
}

class UpdateVirtualNodeOutput {
  /// A full description of the virtual node that was updated.
  final VirtualNodeData? virtualNode;

  UpdateVirtualNodeOutput({
    this.virtualNode,
  });

  Map<String, dynamic> toJson() {
    final virtualNode = this.virtualNode;
    return {
      if (virtualNode != null) 'virtualNode': virtualNode,
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
