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

/// API for AWS Elemental MediaConnect
class MediaConnect {
  final _s.RestJsonProtocol _protocol;
  MediaConnect({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mediaconnect',
            signingName: 'mediaconnect',
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

  /// Adds outputs to an existing bridge.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [bridgeArn] :
  /// The ARN of the bridge that you want to update.
  ///
  /// Parameter [outputs] :
  /// The outputs that you want to add to this bridge.
  Future<AddBridgeOutputsResponse> addBridgeOutputs({
    required String bridgeArn,
    required List<AddBridgeOutputRequest> outputs,
  }) async {
    final $payload = <String, dynamic>{
      'outputs': outputs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/bridges/${Uri.encodeComponent(bridgeArn)}/outputs',
      exceptionFnMap: _exceptionFns,
    );
    return AddBridgeOutputsResponse.fromJson(response);
  }

  /// Adds sources to an existing bridge.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [bridgeArn] :
  /// The ARN of the bridge that you want to update.
  ///
  /// Parameter [sources] :
  /// The sources that you want to add to this bridge.
  Future<AddBridgeSourcesResponse> addBridgeSources({
    required String bridgeArn,
    required List<AddBridgeSourceRequest> sources,
  }) async {
    final $payload = <String, dynamic>{
      'sources': sources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/bridges/${Uri.encodeComponent(bridgeArn)}/sources',
      exceptionFnMap: _exceptionFns,
    );
    return AddBridgeSourcesResponse.fromJson(response);
  }

  /// Adds media streams to an existing flow. After you add a media stream to a
  /// flow, you can associate it with a source and/or an output that uses the ST
  /// 2110 JPEG XS or CDI protocol.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow.
  ///
  /// Parameter [mediaStreams] :
  /// The media streams that you want to add to the flow.
  Future<AddFlowMediaStreamsResponse> addFlowMediaStreams({
    required String flowArn,
    required List<AddMediaStreamRequest> mediaStreams,
  }) async {
    final $payload = <String, dynamic>{
      'mediaStreams': mediaStreams,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}/mediaStreams',
      exceptionFnMap: _exceptionFns,
    );
    return AddFlowMediaStreamsResponse.fromJson(response);
  }

  /// Adds outputs to an existing flow. You can create up to 50 outputs per
  /// flow.
  ///
  /// May throw [AddFlowOutputs420Exception].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The flow that you want to add outputs to.
  ///
  /// Parameter [outputs] :
  /// A list of outputs that you want to add.
  Future<AddFlowOutputsResponse> addFlowOutputs({
    required String flowArn,
    required List<AddOutputRequest> outputs,
  }) async {
    final $payload = <String, dynamic>{
      'outputs': outputs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}/outputs',
      exceptionFnMap: _exceptionFns,
    );
    return AddFlowOutputsResponse.fromJson(response);
  }

  /// Adds Sources to flow
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The flow that you want to mutate.
  ///
  /// Parameter [sources] :
  /// A list of sources that you want to add.
  Future<AddFlowSourcesResponse> addFlowSources({
    required String flowArn,
    required List<SetSourceRequest> sources,
  }) async {
    final $payload = <String, dynamic>{
      'sources': sources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}/source',
      exceptionFnMap: _exceptionFns,
    );
    return AddFlowSourcesResponse.fromJson(response);
  }

  /// Adds VPC interfaces to flow
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The flow that you want to mutate.
  ///
  /// Parameter [vpcInterfaces] :
  /// A list of VPC interfaces that you want to add.
  Future<AddFlowVpcInterfacesResponse> addFlowVpcInterfaces({
    required String flowArn,
    required List<VpcInterfaceRequest> vpcInterfaces,
  }) async {
    final $payload = <String, dynamic>{
      'vpcInterfaces': vpcInterfaces,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}/vpcInterfaces',
      exceptionFnMap: _exceptionFns,
    );
    return AddFlowVpcInterfacesResponse.fromJson(response);
  }

  /// Creates a new bridge. The request must include one source.
  ///
  /// May throw [CreateBridge420Exception].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// The name of the bridge. This name can not be modified after the bridge is
  /// created.
  ///
  /// Parameter [placementArn] :
  /// The bridge placement Amazon Resource Number (ARN).
  ///
  /// Parameter [sources] :
  /// The sources that you want to add to this bridge.
  ///
  /// Parameter [egressGatewayBridge] :
  /// Create a bridge with the egress bridge type. An egress bridge is a
  /// cloud-to-ground bridge. The content comes from an existing MediaConnect
  /// flow and is delivered to your premises.
  ///
  /// Parameter [ingressGatewayBridge] :
  /// Create a bridge with the ingress bridge type. An ingress bridge is a
  /// ground-to-cloud bridge. The content originates at your premises and is
  /// delivered to the cloud.
  ///
  /// Parameter [outputs] :
  /// The outputs that you want to add to this bridge.
  ///
  /// Parameter [sourceFailoverConfig] :
  /// The settings for source failover.
  Future<CreateBridgeResponse> createBridge({
    required String name,
    required String placementArn,
    required List<AddBridgeSourceRequest> sources,
    AddEgressGatewayBridgeRequest? egressGatewayBridge,
    AddIngressGatewayBridgeRequest? ingressGatewayBridge,
    List<AddBridgeOutputRequest>? outputs,
    FailoverConfig? sourceFailoverConfig,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'placementArn': placementArn,
      'sources': sources,
      if (egressGatewayBridge != null)
        'egressGatewayBridge': egressGatewayBridge,
      if (ingressGatewayBridge != null)
        'ingressGatewayBridge': ingressGatewayBridge,
      if (outputs != null) 'outputs': outputs,
      if (sourceFailoverConfig != null)
        'sourceFailoverConfig': sourceFailoverConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/bridges',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBridgeResponse.fromJson(response);
  }

  /// Creates a new flow. The request must include one source. The request
  /// optionally can include outputs (up to 50) and entitlements (up to 50).
  ///
  /// May throw [CreateFlow420Exception].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the flow.
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone that you want to create the flow in. These options
  /// are limited to the Availability Zones within the current AWS Region.
  ///
  /// Parameter [entitlements] :
  /// The entitlements that you want to grant on a flow.
  ///
  /// Parameter [mediaStreams] :
  /// The media streams that you want to add to the flow. You can associate
  /// these media streams with sources and outputs on the flow.
  ///
  /// Parameter [outputs] :
  /// The outputs that you want to add to this flow.
  ///
  /// Parameter [vpcInterfaces] :
  /// The VPC interfaces you want on the flow.
  Future<CreateFlowResponse> createFlow({
    required String name,
    String? availabilityZone,
    List<GrantEntitlementRequest>? entitlements,
    AddMaintenance? maintenance,
    List<AddMediaStreamRequest>? mediaStreams,
    List<AddOutputRequest>? outputs,
    SetSourceRequest? source,
    FailoverConfig? sourceFailoverConfig,
    List<SetSourceRequest>? sources,
    List<VpcInterfaceRequest>? vpcInterfaces,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (entitlements != null) 'entitlements': entitlements,
      if (maintenance != null) 'maintenance': maintenance,
      if (mediaStreams != null) 'mediaStreams': mediaStreams,
      if (outputs != null) 'outputs': outputs,
      if (source != null) 'source': source,
      if (sourceFailoverConfig != null)
        'sourceFailoverConfig': sourceFailoverConfig,
      if (sources != null) 'sources': sources,
      if (vpcInterfaces != null) 'vpcInterfaces': vpcInterfaces,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/flows',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFlowResponse.fromJson(response);
  }

  /// Creates a new gateway. The request must include at least one network (up
  /// to 4).
  ///
  /// May throw [CreateGateway420Exception].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [egressCidrBlocks] :
  /// The range of IP addresses that are allowed to contribute content or
  /// initiate output requests for flows communicating with this gateway. These
  /// IP addresses should be in the form of a Classless Inter-Domain Routing
  /// (CIDR) block; for example, 10.0.0.0/16.
  ///
  /// Parameter [name] :
  /// The name of the gateway. This name can not be modified after the gateway
  /// is created.
  ///
  /// Parameter [networks] :
  /// The list of networks that you want to add.
  Future<CreateGatewayResponse> createGateway({
    required List<String> egressCidrBlocks,
    required String name,
    required List<GatewayNetwork> networks,
  }) async {
    final $payload = <String, dynamic>{
      'egressCidrBlocks': egressCidrBlocks,
      'name': name,
      'networks': networks,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/gateways',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGatewayResponse.fromJson(response);
  }

  /// Deletes a bridge. Before you can delete a bridge, you must stop the
  /// bridge.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [bridgeArn] :
  /// The ARN of the bridge that you want to delete.
  Future<DeleteBridgeResponse> deleteBridge({
    required String bridgeArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/bridges/${Uri.encodeComponent(bridgeArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBridgeResponse.fromJson(response);
  }

  /// Deletes a flow. Before you can delete a flow, you must stop the flow.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The ARN of the flow that you want to delete.
  Future<DeleteFlowResponse> deleteFlow({
    required String flowArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFlowResponse.fromJson(response);
  }

  /// Deletes a gateway. Before you can delete a gateway, you must deregister
  /// its instances and delete its bridges.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [gatewayArn] :
  /// The ARN of the gateway that you want to delete.
  Future<DeleteGatewayResponse> deleteGateway({
    required String gatewayArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/gateways/${Uri.encodeComponent(gatewayArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteGatewayResponse.fromJson(response);
  }

  /// Deregisters an instance. Before you deregister an instance, all bridges
  /// running on the instance must be stopped. If you want to deregister an
  /// instance without stopping the bridges, you must use the --force option.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [gatewayInstanceArn] :
  /// The Amazon Resource Name (ARN) of the gateway that contains the instance
  /// that you want to deregister.
  ///
  /// Parameter [force] :
  /// Force the deregistration of an instance. Force will deregister an
  /// instance, even if there are bridges running on it.
  Future<DeregisterGatewayInstanceResponse> deregisterGatewayInstance({
    required String gatewayInstanceArn,
    bool? force,
  }) async {
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/gateway-instances/${Uri.encodeComponent(gatewayInstanceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeregisterGatewayInstanceResponse.fromJson(response);
  }

  /// Displays the details of a bridge.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [bridgeArn] :
  /// The ARN of the bridge that you want to describe.
  Future<DescribeBridgeResponse> describeBridge({
    required String bridgeArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/bridges/${Uri.encodeComponent(bridgeArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBridgeResponse.fromJson(response);
  }

  /// Displays the details of a flow. The response includes the flow ARN, name,
  /// and Availability Zone, as well as details about the source, outputs, and
  /// entitlements.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The ARN of the flow that you want to describe.
  Future<DescribeFlowResponse> describeFlow({
    required String flowArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFlowResponse.fromJson(response);
  }

  /// Displays details of the flow's source stream. The response contains
  /// information about the contents of the stream and its programs.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow.
  Future<DescribeFlowSourceMetadataResponse> describeFlowSourceMetadata({
    required String flowArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}/source-metadata',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFlowSourceMetadataResponse.fromJson(response);
  }

  /// Displays the details of a gateway. The response includes the gateway ARN,
  /// name, and CIDR blocks, as well as details about the networks.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway that you want to describe.
  Future<DescribeGatewayResponse> describeGateway({
    required String gatewayArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/gateways/${Uri.encodeComponent(gatewayArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGatewayResponse.fromJson(response);
  }

  /// Displays the details of an instance.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [gatewayInstanceArn] :
  /// The Amazon Resource Name (ARN) of the gateway instance that you want to
  /// describe.
  Future<DescribeGatewayInstanceResponse> describeGatewayInstance({
    required String gatewayInstanceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/gateway-instances/${Uri.encodeComponent(gatewayInstanceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGatewayInstanceResponse.fromJson(response);
  }

  /// Displays the details of an offering. The response includes the offering
  /// description, duration, outbound bandwidth, price, and Amazon Resource Name
  /// (ARN).
  ///
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [offeringArn] :
  /// The Amazon Resource Name (ARN) of the offering.
  Future<DescribeOfferingResponse> describeOffering({
    required String offeringArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/offerings/${Uri.encodeComponent(offeringArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOfferingResponse.fromJson(response);
  }

  /// Displays the details of a reservation. The response includes the
  /// reservation name, state, start date and time, and the details of the
  /// offering that make up the rest of the reservation (such as price,
  /// duration, and outbound bandwidth).
  ///
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [reservationArn] :
  /// The Amazon Resource Name (ARN) of the reservation.
  Future<DescribeReservationResponse> describeReservation({
    required String reservationArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/reservations/${Uri.encodeComponent(reservationArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeReservationResponse.fromJson(response);
  }

  /// Grants entitlements to an existing flow.
  ///
  /// May throw [GrantFlowEntitlements420Exception].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [entitlements] :
  /// The list of entitlements that you want to grant.
  ///
  /// Parameter [flowArn] :
  /// The flow that you want to grant entitlements on.
  Future<GrantFlowEntitlementsResponse> grantFlowEntitlements({
    required List<GrantEntitlementRequest> entitlements,
    required String flowArn,
  }) async {
    final $payload = <String, dynamic>{
      'entitlements': entitlements,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}/entitlements',
      exceptionFnMap: _exceptionFns,
    );
    return GrantFlowEntitlementsResponse.fromJson(response);
  }

  /// Displays a list of bridges that are associated with this account and an
  /// optionally specified Arn. This request returns a paginated result.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  ///
  /// Parameter [filterArn] :
  /// Filter the list results to display only the bridges associated with the
  /// selected Amazon Resource Name (ARN).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request. For example, you
  /// submit a ListBridges request with MaxResults set at 5. Although 20 items
  /// match your request, the service returns no more than the first 5 items.
  /// (The service also returns a NextToken value that you can use to fetch the
  /// next batch of results.) The service might return fewer results than the
  /// MaxResults value. If MaxResults is not included in the request, the
  /// service defaults to pagination with a maximum of 10 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListBridges request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken
  /// value. To see the next batch of results, you can submit the ListBridges
  /// request a second time and specify the NextToken value.
  Future<ListBridgesResponse> listBridges({
    String? filterArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (filterArn != null) 'filterArn': [filterArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/bridges',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBridgesResponse.fromJson(response);
  }

  /// Displays a list of all entitlements that have been granted to this
  /// account. This request returns 20 results per page.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request. For example, you
  /// submit a ListEntitlements request with MaxResults set at 5. Although 20
  /// items match your request, the service returns no more than the first 5
  /// items. (The service also returns a NextToken value that you can use to
  /// fetch the next batch of results.) The service might return fewer results
  /// than the MaxResults value. If MaxResults is not included in the request,
  /// the service defaults to pagination with a maximum of 20 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListEntitlements request with MaxResults set at 5.
  /// The service returns the first batch of results (up to 5) and a NextToken
  /// value. To see the next batch of results, you can submit the
  /// ListEntitlements request a second time and specify the NextToken value.
  Future<ListEntitlementsResponse> listEntitlements({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/entitlements',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEntitlementsResponse.fromJson(response);
  }

  /// Displays a list of flows that are associated with this account. This
  /// request returns a paginated result.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request. For example, you
  /// submit a ListFlows request with MaxResults set at 5. Although 20 items
  /// match your request, the service returns no more than the first 5 items.
  /// (The service also returns a NextToken value that you can use to fetch the
  /// next batch of results.) The service might return fewer results than the
  /// MaxResults value. If MaxResults is not included in the request, the
  /// service defaults to pagination with a maximum of 10 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListFlows request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken
  /// value. To see the next batch of results, you can submit the ListFlows
  /// request a second time and specify the NextToken value.
  Future<ListFlowsResponse> listFlows({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/flows',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFlowsResponse.fromJson(response);
  }

  /// Displays a list of instances associated with the AWS account. This request
  /// returns a paginated result. You can use the filterArn property to display
  /// only the instances associated with the selected Gateway Amazon Resource
  /// Name (ARN).
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  ///
  /// Parameter [filterArn] :
  /// Filter the list results to display only the instances associated with the
  /// selected Gateway Amazon Resource Name (ARN).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request. For example, you
  /// submit a ListInstances request with MaxResults set at 5. Although 20 items
  /// match your request, the service returns no more than the first 5 items.
  /// (The service also returns a NextToken value that you can use to fetch the
  /// next batch of results.) The service might return fewer results than the
  /// MaxResults value. If MaxResults is not included in the request, the
  /// service defaults to pagination with a maximum of 10 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListInstances request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken
  /// value. To see the next batch of results, you can submit the ListInstances
  /// request a second time and specify the NextToken value.
  Future<ListGatewayInstancesResponse> listGatewayInstances({
    String? filterArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (filterArn != null) 'filterArn': [filterArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/gateway-instances',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGatewayInstancesResponse.fromJson(response);
  }

  /// Displays a list of gateways that are associated with this account. This
  /// request returns a paginated result.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request. For example, you
  /// submit a ListGateways request with MaxResults set at 5. Although 20 items
  /// match your request, the service returns no more than the first 5 items.
  /// (The service also returns a NextToken value that you can use to fetch the
  /// next batch of results.) The service might return fewer results than the
  /// MaxResults value. If MaxResults is not included in the request, the
  /// service defaults to pagination with a maximum of 10 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListGateways request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken
  /// value. To see the next batch of results, you can submit the ListGateways
  /// request a second time and specify the NextToken value.
  Future<ListGatewaysResponse> listGateways({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/gateways',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGatewaysResponse.fromJson(response);
  }

  /// Displays a list of all offerings that are available to this account in the
  /// current AWS Region. If you have an active reservation (which means you've
  /// purchased an offering that has already started and hasn't expired yet),
  /// your account isn't eligible for other offerings.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request. For example, you
  /// submit a ListOfferings request with MaxResults set at 5. Although 20 items
  /// match your request, the service returns no more than the first 5 items.
  /// (The service also returns a NextToken value that you can use to fetch the
  /// next batch of results.) The service might return fewer results than the
  /// MaxResults value. If MaxResults is not included in the request, the
  /// service defaults to pagination with a maximum of 10 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListOfferings request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken
  /// value. To see the next batch of results, you can submit the ListOfferings
  /// request a second time and specify the NextToken value.
  Future<ListOfferingsResponse> listOfferings({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/offerings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOfferingsResponse.fromJson(response);
  }

  /// Displays a list of all reservations that have been purchased by this
  /// account in the current AWS Region. This list includes all reservations in
  /// all states (such as active and expired).
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request. For example, you
  /// submit a ListReservations request with MaxResults set at 5. Although 20
  /// items match your request, the service returns no more than the first 5
  /// items. (The service also returns a NextToken value that you can use to
  /// fetch the next batch of results.) The service might return fewer results
  /// than the MaxResults value. If MaxResults is not included in the request,
  /// the service defaults to pagination with a maximum of 10 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListReservations request with MaxResults set at 5.
  /// The service returns the first batch of results (up to 5) and a NextToken
  /// value. To see the next batch of results, you can submit the ListOfferings
  /// request a second time and specify the NextToken value.
  Future<ListReservationsResponse> listReservations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/reservations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReservationsResponse.fromJson(response);
  }

  /// List all tags on an AWS Elemental MediaConnect resource
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the AWS Elemental
  /// MediaConnect resource for which to list the tags.
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

  /// Submits a request to purchase an offering. If you already have an active
  /// reservation, you can't purchase another offering.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [offeringArn] :
  /// The Amazon Resource Name (ARN) of the offering.
  ///
  /// Parameter [reservationName] :
  /// The name that you want to use for the reservation.
  ///
  /// Parameter [start] :
  /// The date and time that you want the reservation to begin, in Coordinated
  /// Universal Time (UTC). You can specify any date and time between 12:00am on
  /// the first day of the current month to the current time on today's date,
  /// inclusive. Specify the start in a 24-hour notation. Use the following
  /// format: YYYY-MM-DDTHH:mm:SSZ, where T and Z are literal characters. For
  /// example, to specify 11:30pm on March 5, 2020, enter 2020-03-05T23:30:00Z.
  Future<PurchaseOfferingResponse> purchaseOffering({
    required String offeringArn,
    required String reservationName,
    required String start,
  }) async {
    final $payload = <String, dynamic>{
      'reservationName': reservationName,
      'start': start,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/offerings/${Uri.encodeComponent(offeringArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return PurchaseOfferingResponse.fromJson(response);
  }

  /// Removes an output from a bridge.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [bridgeArn] :
  /// The ARN of the bridge that you want to update.
  ///
  /// Parameter [outputName] :
  /// The name of the bridge output that you want to remove.
  Future<RemoveBridgeOutputResponse> removeBridgeOutput({
    required String bridgeArn,
    required String outputName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/bridges/${Uri.encodeComponent(bridgeArn)}/outputs/${Uri.encodeComponent(outputName)}',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveBridgeOutputResponse.fromJson(response);
  }

  /// Removes a source from a bridge.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [bridgeArn] :
  /// The ARN of the bridge that you want to update.
  ///
  /// Parameter [sourceName] :
  /// The name of the bridge source that you want to remove.
  Future<RemoveBridgeSourceResponse> removeBridgeSource({
    required String bridgeArn,
    required String sourceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/bridges/${Uri.encodeComponent(bridgeArn)}/sources/${Uri.encodeComponent(sourceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveBridgeSourceResponse.fromJson(response);
  }

  /// Removes a media stream from a flow. This action is only available if the
  /// media stream is not associated with a source or output.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow.
  ///
  /// Parameter [mediaStreamName] :
  /// The name of the media stream that you want to remove.
  Future<RemoveFlowMediaStreamResponse> removeFlowMediaStream({
    required String flowArn,
    required String mediaStreamName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn)}/mediaStreams/${Uri.encodeComponent(mediaStreamName)}',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveFlowMediaStreamResponse.fromJson(response);
  }

  /// Removes an output from an existing flow. This request can be made only on
  /// an output that does not have an entitlement associated with it. If the
  /// output has an entitlement, you must revoke the entitlement instead. When
  /// an entitlement is revoked from a flow, the service automatically removes
  /// the associated output.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The flow that you want to remove an output from.
  ///
  /// Parameter [outputArn] :
  /// The ARN of the output that you want to remove.
  Future<RemoveFlowOutputResponse> removeFlowOutput({
    required String flowArn,
    required String outputArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn)}/outputs/${Uri.encodeComponent(outputArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveFlowOutputResponse.fromJson(response);
  }

  /// Removes a source from an existing flow. This request can be made only if
  /// there is more than one source on the flow.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The flow that you want to remove a source from.
  ///
  /// Parameter [sourceArn] :
  /// The ARN of the source that you want to remove.
  Future<RemoveFlowSourceResponse> removeFlowSource({
    required String flowArn,
    required String sourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn)}/source/${Uri.encodeComponent(sourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveFlowSourceResponse.fromJson(response);
  }

  /// Removes a VPC Interface from an existing flow. This request can be made
  /// only on a VPC interface that does not have a Source or Output associated
  /// with it. If the VPC interface is referenced by a Source or Output, you
  /// must first delete or update the Source or Output to no longer reference
  /// the VPC interface.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The flow that you want to remove a VPC interface from.
  ///
  /// Parameter [vpcInterfaceName] :
  /// The name of the VPC interface that you want to remove.
  Future<RemoveFlowVpcInterfaceResponse> removeFlowVpcInterface({
    required String flowArn,
    required String vpcInterfaceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn)}/vpcInterfaces/${Uri.encodeComponent(vpcInterfaceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveFlowVpcInterfaceResponse.fromJson(response);
  }

  /// Revokes an entitlement from a flow. Once an entitlement is revoked, the
  /// content becomes unavailable to the subscriber and the associated output is
  /// removed.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [entitlementArn] :
  /// The ARN of the entitlement that you want to revoke.
  ///
  /// Parameter [flowArn] :
  /// The flow that you want to revoke an entitlement from.
  Future<RevokeFlowEntitlementResponse> revokeFlowEntitlement({
    required String entitlementArn,
    required String flowArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn)}/entitlements/${Uri.encodeComponent(entitlementArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return RevokeFlowEntitlementResponse.fromJson(response);
  }

  /// Starts a flow.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The ARN of the flow that you want to start.
  Future<StartFlowResponse> startFlow({
    required String flowArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/flows/start/${Uri.encodeComponent(flowArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return StartFlowResponse.fromJson(response);
  }

  /// Stops a flow.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The ARN of the flow that you want to stop.
  Future<StopFlowResponse> stopFlow({
    required String flowArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/flows/stop/${Uri.encodeComponent(flowArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return StopFlowResponse.fromJson(response);
  }

  /// Associates the specified tags to a resource with the specified
  /// resourceArn. If existing tags on a resource are not specified in the
  /// request parameters, they are not changed. When a resource is deleted, the
  /// tags associated with that resource are deleted as well.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the AWS Elemental
  /// MediaConnect resource to which to add tags.
  ///
  /// Parameter [tags] :
  /// A map from tag keys to values. Tag keys can have a maximum character
  /// length of 128 characters, and tag values can have a maximum length of 256
  /// characters.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes specified tags from a resource.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the AWS Elemental
  /// MediaConnect resource from which to delete tags.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the bridge
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [bridgeArn] :
  /// The Amazon Resource Number (ARN) of the bridge that you want to update.
  Future<UpdateBridgeResponse> updateBridge({
    required String bridgeArn,
    UpdateEgressGatewayBridgeRequest? egressGatewayBridge,
    UpdateIngressGatewayBridgeRequest? ingressGatewayBridge,
    UpdateFailoverConfig? sourceFailoverConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (egressGatewayBridge != null)
        'egressGatewayBridge': egressGatewayBridge,
      if (ingressGatewayBridge != null)
        'ingressGatewayBridge': ingressGatewayBridge,
      if (sourceFailoverConfig != null)
        'sourceFailoverConfig': sourceFailoverConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/bridges/${Uri.encodeComponent(bridgeArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBridgeResponse.fromJson(response);
  }

  /// Updates an existing bridge output.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [bridgeArn] :
  /// The ARN of the bridge that you want to update.
  ///
  /// Parameter [outputName] :
  /// The name of the bridge output that you want to update.
  Future<UpdateBridgeOutputResponse> updateBridgeOutput({
    required String bridgeArn,
    required String outputName,
    UpdateBridgeNetworkOutputRequest? networkOutput,
  }) async {
    final $payload = <String, dynamic>{
      if (networkOutput != null) 'networkOutput': networkOutput,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/bridges/${Uri.encodeComponent(bridgeArn)}/outputs/${Uri.encodeComponent(outputName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBridgeOutputResponse.fromJson(response);
  }

  /// Updates an existing bridge source.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [bridgeArn] :
  /// The ARN of the bridge that you want to update.
  ///
  /// Parameter [sourceName] :
  /// The name of the source that you want to update.
  Future<UpdateBridgeSourceResponse> updateBridgeSource({
    required String bridgeArn,
    required String sourceName,
    UpdateBridgeFlowSourceRequest? flowSource,
    UpdateBridgeNetworkSourceRequest? networkSource,
  }) async {
    final $payload = <String, dynamic>{
      if (flowSource != null) 'flowSource': flowSource,
      if (networkSource != null) 'networkSource': networkSource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/bridges/${Uri.encodeComponent(bridgeArn)}/sources/${Uri.encodeComponent(sourceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBridgeSourceResponse.fromJson(response);
  }

  /// Updates the bridge state
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [bridgeArn] :
  /// The ARN of the bridge that you want to update.
  Future<UpdateBridgeStateResponse> updateBridgeState({
    required String bridgeArn,
    required DesiredState desiredState,
  }) async {
    final $payload = <String, dynamic>{
      'desiredState': desiredState.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/bridges/${Uri.encodeComponent(bridgeArn)}/state',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBridgeStateResponse.fromJson(response);
  }

  /// Updates flow
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The flow that you want to update.
  Future<UpdateFlowResponse> updateFlow({
    required String flowArn,
    UpdateMaintenance? maintenance,
    UpdateFailoverConfig? sourceFailoverConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (maintenance != null) 'maintenance': maintenance,
      if (sourceFailoverConfig != null)
        'sourceFailoverConfig': sourceFailoverConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFlowResponse.fromJson(response);
  }

  /// You can change an entitlement's description, subscribers, and encryption.
  /// If you change the subscribers, the service will remove the outputs that
  /// are are used by the subscribers that are removed.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [entitlementArn] :
  /// The ARN of the entitlement that you want to update.
  ///
  /// Parameter [flowArn] :
  /// The flow that is associated with the entitlement that you want to update.
  ///
  /// Parameter [description] :
  /// A description of the entitlement. This description appears only on the AWS
  /// Elemental MediaConnect console and will not be seen by the subscriber or
  /// end user.
  ///
  /// Parameter [encryption] :
  /// The type of encryption that will be used on the output associated with
  /// this entitlement. Allowable encryption types: static-key, speke.
  ///
  /// Parameter [entitlementStatus] :
  /// An indication of whether you want to enable the entitlement to allow
  /// access, or disable it to stop streaming content to the subscriber’s flow
  /// temporarily. If you don’t specify the entitlementStatus field in your
  /// request, MediaConnect leaves the value unchanged.
  ///
  /// Parameter [subscribers] :
  /// The AWS account IDs that you want to share your content with. The
  /// receiving accounts (subscribers) will be allowed to create their own flow
  /// using your content as the source.
  Future<UpdateFlowEntitlementResponse> updateFlowEntitlement({
    required String entitlementArn,
    required String flowArn,
    String? description,
    UpdateEncryption? encryption,
    EntitlementStatus? entitlementStatus,
    List<String>? subscribers,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (encryption != null) 'encryption': encryption,
      if (entitlementStatus != null)
        'entitlementStatus': entitlementStatus.toValue(),
      if (subscribers != null) 'subscribers': subscribers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn)}/entitlements/${Uri.encodeComponent(entitlementArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFlowEntitlementResponse.fromJson(response);
  }

  /// Updates an existing media stream.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow.
  ///
  /// Parameter [mediaStreamName] :
  /// The name of the media stream that you want to update.
  ///
  /// Parameter [attributes] :
  /// The attributes that you want to assign to the media stream.
  ///
  /// Parameter [clockRate] :
  /// The sample rate (in Hz) for the stream. If the media stream type is video
  /// or ancillary data, set this value to 90000. If the media stream type is
  /// audio, set this value to either 48000 or 96000.
  ///
  /// Parameter [description] :
  /// Description
  ///
  /// Parameter [mediaStreamType] :
  /// The type of media stream.
  ///
  /// Parameter [videoFormat] :
  /// The resolution of the video.
  Future<UpdateFlowMediaStreamResponse> updateFlowMediaStream({
    required String flowArn,
    required String mediaStreamName,
    MediaStreamAttributesRequest? attributes,
    int? clockRate,
    String? description,
    MediaStreamType? mediaStreamType,
    String? videoFormat,
  }) async {
    final $payload = <String, dynamic>{
      if (attributes != null) 'attributes': attributes,
      if (clockRate != null) 'clockRate': clockRate,
      if (description != null) 'description': description,
      if (mediaStreamType != null) 'mediaStreamType': mediaStreamType.toValue(),
      if (videoFormat != null) 'videoFormat': videoFormat,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn)}/mediaStreams/${Uri.encodeComponent(mediaStreamName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFlowMediaStreamResponse.fromJson(response);
  }

  /// Updates an existing flow output.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The flow that is associated with the output that you want to update.
  ///
  /// Parameter [outputArn] :
  /// The ARN of the output that you want to update.
  ///
  /// Parameter [cidrAllowList] :
  /// The range of IP addresses that should be allowed to initiate output
  /// requests to this flow. These IP addresses should be in the form of a
  /// Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  ///
  /// Parameter [description] :
  /// A description of the output. This description appears only on the AWS
  /// Elemental MediaConnect console and will not be seen by the end user.
  ///
  /// Parameter [destination] :
  /// The IP address where you want to send the output.
  ///
  /// Parameter [encryption] :
  /// The type of key used for the encryption. If no keyType is provided, the
  /// service will use the default setting (static-key). Allowable encryption
  /// types: static-key.
  ///
  /// Parameter [maxLatency] :
  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based, Zixi-based, and Fujitsu-based streams.
  ///
  /// Parameter [mediaStreamOutputConfigurations] :
  /// The media streams that are associated with the output, and the parameters
  /// for those associations.
  ///
  /// Parameter [minLatency] :
  /// The minimum latency in milliseconds for SRT-based streams. In streams that
  /// use the SRT protocol, this value that you set on your MediaConnect source
  /// or output represents the minimal potential latency of that connection. The
  /// latency of the stream is set to the highest number between the sender’s
  /// minimum latency and the receiver’s minimum latency.
  ///
  /// Parameter [port] :
  /// The port to use when content is distributed to this output.
  ///
  /// Parameter [protocol] :
  /// The protocol to use for the output.
  ///
  /// Parameter [remoteId] :
  /// The remote ID for the Zixi-pull stream.
  ///
  /// Parameter [senderControlPort] :
  /// The port that the flow uses to send outbound requests to initiate
  /// connection with the sender.
  ///
  /// Parameter [senderIpAddress] :
  /// The IP address that the flow communicates with to initiate connection with
  /// the sender.
  ///
  /// Parameter [smoothingLatency] :
  /// The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
  ///
  /// Parameter [streamId] :
  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi and SRT caller-based streams.
  ///
  /// Parameter [vpcInterfaceAttachment] :
  /// The name of the VPC interface attachment to use for this output.
  Future<UpdateFlowOutputResponse> updateFlowOutput({
    required String flowArn,
    required String outputArn,
    List<String>? cidrAllowList,
    String? description,
    String? destination,
    UpdateEncryption? encryption,
    int? maxLatency,
    List<MediaStreamOutputConfigurationRequest>?
        mediaStreamOutputConfigurations,
    int? minLatency,
    int? port,
    Protocol? protocol,
    String? remoteId,
    int? senderControlPort,
    String? senderIpAddress,
    int? smoothingLatency,
    String? streamId,
    VpcInterfaceAttachment? vpcInterfaceAttachment,
  }) async {
    final $payload = <String, dynamic>{
      if (cidrAllowList != null) 'cidrAllowList': cidrAllowList,
      if (description != null) 'description': description,
      if (destination != null) 'destination': destination,
      if (encryption != null) 'encryption': encryption,
      if (maxLatency != null) 'maxLatency': maxLatency,
      if (mediaStreamOutputConfigurations != null)
        'mediaStreamOutputConfigurations': mediaStreamOutputConfigurations,
      if (minLatency != null) 'minLatency': minLatency,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (remoteId != null) 'remoteId': remoteId,
      if (senderControlPort != null) 'senderControlPort': senderControlPort,
      if (senderIpAddress != null) 'senderIpAddress': senderIpAddress,
      if (smoothingLatency != null) 'smoothingLatency': smoothingLatency,
      if (streamId != null) 'streamId': streamId,
      if (vpcInterfaceAttachment != null)
        'vpcInterfaceAttachment': vpcInterfaceAttachment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn)}/outputs/${Uri.encodeComponent(outputArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFlowOutputResponse.fromJson(response);
  }

  /// Updates the source of a flow.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The flow that is associated with the source that you want to update.
  ///
  /// Parameter [sourceArn] :
  /// The ARN of the source that you want to update.
  ///
  /// Parameter [decryption] :
  /// The type of encryption used on the content ingested from this source.
  /// Allowable encryption types: static-key.
  ///
  /// Parameter [description] :
  /// A description for the source. This value is not used or seen outside of
  /// the current AWS Elemental MediaConnect account.
  ///
  /// Parameter [entitlementArn] :
  /// The ARN of the entitlement that allows you to subscribe to this flow. The
  /// entitlement is set by the flow originator, and the ARN is generated as
  /// part of the originator's flow.
  ///
  /// Parameter [gatewayBridgeSource] :
  /// The source configuration for cloud flows receiving a stream from a bridge.
  ///
  /// Parameter [ingestPort] :
  /// The port that the flow will be listening on for incoming content.
  ///
  /// Parameter [maxBitrate] :
  /// The smoothing max bitrate (in bps) for RIST, RTP, and RTP-FEC streams.
  ///
  /// Parameter [maxLatency] :
  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based, Zixi-based, and Fujitsu-based streams.
  ///
  /// Parameter [maxSyncBuffer] :
  /// The size of the buffer (in milliseconds) to use to sync incoming source
  /// data.
  ///
  /// Parameter [mediaStreamSourceConfigurations] :
  /// The media streams that are associated with the source, and the parameters
  /// for those associations.
  ///
  /// Parameter [minLatency] :
  /// The minimum latency in milliseconds for SRT-based streams. In streams that
  /// use the SRT protocol, this value that you set on your MediaConnect source
  /// or output represents the minimal potential latency of that connection. The
  /// latency of the stream is set to the highest number between the sender’s
  /// minimum latency and the receiver’s minimum latency.
  ///
  /// Parameter [protocol] :
  /// The protocol that is used by the source.
  ///
  /// Parameter [senderControlPort] :
  /// The port that the flow uses to send outbound requests to initiate
  /// connection with the sender.
  ///
  /// Parameter [senderIpAddress] :
  /// The IP address that the flow communicates with to initiate connection with
  /// the sender.
  ///
  /// Parameter [sourceListenerAddress] :
  /// Source IP or domain name for SRT-caller protocol.
  ///
  /// Parameter [sourceListenerPort] :
  /// Source port for SRT-caller protocol.
  ///
  /// Parameter [streamId] :
  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi and SRT caller-based streams.
  ///
  /// Parameter [vpcInterfaceName] :
  /// The name of the VPC interface to use for this source.
  ///
  /// Parameter [whitelistCidr] :
  /// The range of IP addresses that should be allowed to contribute content to
  /// your source. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  Future<UpdateFlowSourceResponse> updateFlowSource({
    required String flowArn,
    required String sourceArn,
    UpdateEncryption? decryption,
    String? description,
    String? entitlementArn,
    UpdateGatewayBridgeSourceRequest? gatewayBridgeSource,
    int? ingestPort,
    int? maxBitrate,
    int? maxLatency,
    int? maxSyncBuffer,
    List<MediaStreamSourceConfigurationRequest>?
        mediaStreamSourceConfigurations,
    int? minLatency,
    Protocol? protocol,
    int? senderControlPort,
    String? senderIpAddress,
    String? sourceListenerAddress,
    int? sourceListenerPort,
    String? streamId,
    String? vpcInterfaceName,
    String? whitelistCidr,
  }) async {
    final $payload = <String, dynamic>{
      if (decryption != null) 'decryption': decryption,
      if (description != null) 'description': description,
      if (entitlementArn != null) 'entitlementArn': entitlementArn,
      if (gatewayBridgeSource != null)
        'gatewayBridgeSource': gatewayBridgeSource,
      if (ingestPort != null) 'ingestPort': ingestPort,
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (maxLatency != null) 'maxLatency': maxLatency,
      if (maxSyncBuffer != null) 'maxSyncBuffer': maxSyncBuffer,
      if (mediaStreamSourceConfigurations != null)
        'mediaStreamSourceConfigurations': mediaStreamSourceConfigurations,
      if (minLatency != null) 'minLatency': minLatency,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (senderControlPort != null) 'senderControlPort': senderControlPort,
      if (senderIpAddress != null) 'senderIpAddress': senderIpAddress,
      if (sourceListenerAddress != null)
        'sourceListenerAddress': sourceListenerAddress,
      if (sourceListenerPort != null) 'sourceListenerPort': sourceListenerPort,
      if (streamId != null) 'streamId': streamId,
      if (vpcInterfaceName != null) 'vpcInterfaceName': vpcInterfaceName,
      if (whitelistCidr != null) 'whitelistCidr': whitelistCidr,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn)}/source/${Uri.encodeComponent(sourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFlowSourceResponse.fromJson(response);
  }

  /// Updates the configuration of an existing Gateway Instance.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [gatewayInstanceArn] :
  /// The Amazon Resource Name (ARN) of the instance that you want to update.
  ///
  /// Parameter [bridgePlacement] :
  /// The availability of the instance to host new bridges. The bridgePlacement
  /// property can be LOCKED or AVAILABLE. If it is LOCKED, no new bridges can
  /// be deployed to this instance. If it is AVAILABLE, new bridges can be added
  /// to this instance.
  Future<UpdateGatewayInstanceResponse> updateGatewayInstance({
    required String gatewayInstanceArn,
    BridgePlacement? bridgePlacement,
  }) async {
    final $payload = <String, dynamic>{
      if (bridgePlacement != null) 'bridgePlacement': bridgePlacement.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/gateway-instances/${Uri.encodeComponent(gatewayInstanceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGatewayInstanceResponse.fromJson(response);
  }
}

/// Add a flow source to an existing bridge.
class AddBridgeFlowSourceRequest {
  /// The Amazon Resource Number (ARN) of the cloud flow to use as a source of
  /// this bridge.
  final String flowArn;

  /// The name of the flow source. This name is used to reference the source and
  /// must be unique among sources in this bridge.
  final String name;

  /// The name of the VPC interface attachment to use for this source.
  final VpcInterfaceAttachment? flowVpcInterfaceAttachment;

  AddBridgeFlowSourceRequest({
    required this.flowArn,
    required this.name,
    this.flowVpcInterfaceAttachment,
  });

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final name = this.name;
    final flowVpcInterfaceAttachment = this.flowVpcInterfaceAttachment;
    return {
      'flowArn': flowArn,
      'name': name,
      if (flowVpcInterfaceAttachment != null)
        'flowVpcInterfaceAttachment': flowVpcInterfaceAttachment,
    };
  }
}

/// Add a network output to an existing bridge.
class AddBridgeNetworkOutputRequest {
  /// The network output IP Address.
  final String ipAddress;

  /// The network output name. This name is used to reference the output and must
  /// be unique among outputs in this bridge.
  final String name;

  /// The network output's gateway network name.
  final String networkName;

  /// The network output port.
  final int port;

  /// The network output protocol.
  final Protocol protocol;

  /// The network output TTL.
  final int ttl;

  AddBridgeNetworkOutputRequest({
    required this.ipAddress,
    required this.name,
    required this.networkName,
    required this.port,
    required this.protocol,
    required this.ttl,
  });

  Map<String, dynamic> toJson() {
    final ipAddress = this.ipAddress;
    final name = this.name;
    final networkName = this.networkName;
    final port = this.port;
    final protocol = this.protocol;
    final ttl = this.ttl;
    return {
      'ipAddress': ipAddress,
      'name': name,
      'networkName': networkName,
      'port': port,
      'protocol': protocol.toValue(),
      'ttl': ttl,
    };
  }
}

/// Add a network source to an existing bridge.
class AddBridgeNetworkSourceRequest {
  /// The network source multicast IP.
  final String multicastIp;

  /// The name of the network source. This name is used to reference the source
  /// and must be unique among sources in this bridge.
  final String name;

  /// The network source's gateway network name.
  final String networkName;

  /// The network source port.
  final int port;

  /// The network source protocol.
  final Protocol protocol;

  AddBridgeNetworkSourceRequest({
    required this.multicastIp,
    required this.name,
    required this.networkName,
    required this.port,
    required this.protocol,
  });

  Map<String, dynamic> toJson() {
    final multicastIp = this.multicastIp;
    final name = this.name;
    final networkName = this.networkName;
    final port = this.port;
    final protocol = this.protocol;
    return {
      'multicastIp': multicastIp,
      'name': name,
      'networkName': networkName,
      'port': port,
      'protocol': protocol.toValue(),
    };
  }
}

/// Add an output to a bridge.
class AddBridgeOutputRequest {
  final AddBridgeNetworkOutputRequest? networkOutput;

  AddBridgeOutputRequest({
    this.networkOutput,
  });

  Map<String, dynamic> toJson() {
    final networkOutput = this.networkOutput;
    return {
      if (networkOutput != null) 'networkOutput': networkOutput,
    };
  }
}

class AddBridgeOutputsResponse {
  /// The Amazon Resource Number (ARN) of the bridge.
  final String? bridgeArn;

  /// The outputs that you added to this bridge.
  final List<BridgeOutput>? outputs;

  AddBridgeOutputsResponse({
    this.bridgeArn,
    this.outputs,
  });

  factory AddBridgeOutputsResponse.fromJson(Map<String, dynamic> json) {
    return AddBridgeOutputsResponse(
      bridgeArn: json['bridgeArn'] as String?,
      outputs: (json['outputs'] as List?)
          ?.whereNotNull()
          .map((e) => BridgeOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final outputs = this.outputs;
    return {
      if (bridgeArn != null) 'bridgeArn': bridgeArn,
      if (outputs != null) 'outputs': outputs,
    };
  }
}

/// Add a source to an existing bridge.
class AddBridgeSourceRequest {
  final AddBridgeFlowSourceRequest? flowSource;
  final AddBridgeNetworkSourceRequest? networkSource;

  AddBridgeSourceRequest({
    this.flowSource,
    this.networkSource,
  });

  Map<String, dynamic> toJson() {
    final flowSource = this.flowSource;
    final networkSource = this.networkSource;
    return {
      if (flowSource != null) 'flowSource': flowSource,
      if (networkSource != null) 'networkSource': networkSource,
    };
  }
}

class AddBridgeSourcesResponse {
  /// The Amazon Resource Number (ARN) of the bridge.
  final String? bridgeArn;

  /// The sources that you added to this bridge.
  final List<BridgeSource>? sources;

  AddBridgeSourcesResponse({
    this.bridgeArn,
    this.sources,
  });

  factory AddBridgeSourcesResponse.fromJson(Map<String, dynamic> json) {
    return AddBridgeSourcesResponse(
      bridgeArn: json['bridgeArn'] as String?,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => BridgeSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final sources = this.sources;
    return {
      if (bridgeArn != null) 'bridgeArn': bridgeArn,
      if (sources != null) 'sources': sources,
    };
  }
}

class AddEgressGatewayBridgeRequest {
  /// The maximum expected bitrate (in bps).
  final int maxBitrate;

  AddEgressGatewayBridgeRequest({
    required this.maxBitrate,
  });

  Map<String, dynamic> toJson() {
    final maxBitrate = this.maxBitrate;
    return {
      'maxBitrate': maxBitrate,
    };
  }
}

class AddFlowMediaStreamsResponse {
  /// The ARN of the flow that you added media streams to.
  final String? flowArn;

  /// The media streams that you added to the flow.
  final List<MediaStream>? mediaStreams;

  AddFlowMediaStreamsResponse({
    this.flowArn,
    this.mediaStreams,
  });

  factory AddFlowMediaStreamsResponse.fromJson(Map<String, dynamic> json) {
    return AddFlowMediaStreamsResponse(
      flowArn: json['flowArn'] as String?,
      mediaStreams: (json['mediaStreams'] as List?)
          ?.whereNotNull()
          .map((e) => MediaStream.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final mediaStreams = this.mediaStreams;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (mediaStreams != null) 'mediaStreams': mediaStreams,
    };
  }
}

class AddFlowOutputsResponse {
  /// The ARN of the flow that these outputs were added to.
  final String? flowArn;

  /// The details of the newly added outputs.
  final List<Output>? outputs;

  AddFlowOutputsResponse({
    this.flowArn,
    this.outputs,
  });

  factory AddFlowOutputsResponse.fromJson(Map<String, dynamic> json) {
    return AddFlowOutputsResponse(
      flowArn: json['flowArn'] as String?,
      outputs: (json['outputs'] as List?)
          ?.whereNotNull()
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final outputs = this.outputs;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (outputs != null) 'outputs': outputs,
    };
  }
}

class AddFlowSourcesResponse {
  /// The ARN of the flow that these sources were added to.
  final String? flowArn;

  /// The details of the newly added sources.
  final List<Source>? sources;

  AddFlowSourcesResponse({
    this.flowArn,
    this.sources,
  });

  factory AddFlowSourcesResponse.fromJson(Map<String, dynamic> json) {
    return AddFlowSourcesResponse(
      flowArn: json['flowArn'] as String?,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final sources = this.sources;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (sources != null) 'sources': sources,
    };
  }
}

class AddFlowVpcInterfacesResponse {
  /// The ARN of the flow that these VPC interfaces were added to.
  final String? flowArn;

  /// The details of the newly added VPC interfaces.
  final List<VpcInterface>? vpcInterfaces;

  AddFlowVpcInterfacesResponse({
    this.flowArn,
    this.vpcInterfaces,
  });

  factory AddFlowVpcInterfacesResponse.fromJson(Map<String, dynamic> json) {
    return AddFlowVpcInterfacesResponse(
      flowArn: json['flowArn'] as String?,
      vpcInterfaces: (json['vpcInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => VpcInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final vpcInterfaces = this.vpcInterfaces;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (vpcInterfaces != null) 'vpcInterfaces': vpcInterfaces,
    };
  }
}

class AddIngressGatewayBridgeRequest {
  /// The maximum expected bitrate (in bps).
  final int maxBitrate;

  /// The maximum number of expected outputs.
  final int maxOutputs;

  AddIngressGatewayBridgeRequest({
    required this.maxBitrate,
    required this.maxOutputs,
  });

  Map<String, dynamic> toJson() {
    final maxBitrate = this.maxBitrate;
    final maxOutputs = this.maxOutputs;
    return {
      'maxBitrate': maxBitrate,
      'maxOutputs': maxOutputs,
    };
  }
}

/// Create maintenance setting for a flow
class AddMaintenance {
  /// A day of a week when the maintenance will happen. Use
  /// Monday/Tuesday/Wednesday/Thursday/Friday/Saturday/Sunday.
  final MaintenanceDay maintenanceDay;

  /// UTC time when the maintenance will happen. Use 24-hour HH:MM format. Minutes
  /// must be 00. Example: 13:00. The default value is 02:00.
  final String maintenanceStartHour;

  AddMaintenance({
    required this.maintenanceDay,
    required this.maintenanceStartHour,
  });

  Map<String, dynamic> toJson() {
    final maintenanceDay = this.maintenanceDay;
    final maintenanceStartHour = this.maintenanceStartHour;
    return {
      'maintenanceDay': maintenanceDay.toValue(),
      'maintenanceStartHour': maintenanceStartHour,
    };
  }
}

/// The media stream that you want to add to the flow.
class AddMediaStreamRequest {
  /// A unique identifier for the media stream.
  final int mediaStreamId;

  /// A name that helps you distinguish one media stream from another.
  final String mediaStreamName;

  /// The type of media stream.
  final MediaStreamType mediaStreamType;

  /// The attributes that you want to assign to the new media stream.
  final MediaStreamAttributesRequest? attributes;

  /// The sample rate (in Hz) for the stream. If the media stream type is video or
  /// ancillary data, set this value to 90000. If the media stream type is audio,
  /// set this value to either 48000 or 96000.
  final int? clockRate;

  /// A description that can help you quickly identify what your media stream is
  /// used for.
  final String? description;

  /// The resolution of the video.
  final String? videoFormat;

  AddMediaStreamRequest({
    required this.mediaStreamId,
    required this.mediaStreamName,
    required this.mediaStreamType,
    this.attributes,
    this.clockRate,
    this.description,
    this.videoFormat,
  });

  Map<String, dynamic> toJson() {
    final mediaStreamId = this.mediaStreamId;
    final mediaStreamName = this.mediaStreamName;
    final mediaStreamType = this.mediaStreamType;
    final attributes = this.attributes;
    final clockRate = this.clockRate;
    final description = this.description;
    final videoFormat = this.videoFormat;
    return {
      'mediaStreamId': mediaStreamId,
      'mediaStreamName': mediaStreamName,
      'mediaStreamType': mediaStreamType.toValue(),
      if (attributes != null) 'attributes': attributes,
      if (clockRate != null) 'clockRate': clockRate,
      if (description != null) 'description': description,
      if (videoFormat != null) 'videoFormat': videoFormat,
    };
  }
}

/// The output that you want to add to this flow.
class AddOutputRequest {
  /// The protocol to use for the output.
  final Protocol protocol;

  /// The range of IP addresses that should be allowed to initiate output requests
  /// to this flow. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  final List<String>? cidrAllowList;

  /// A description of the output. This description appears only on the AWS
  /// Elemental MediaConnect console and will not be seen by the end user.
  final String? description;

  /// The IP address from which video will be sent to output destinations.
  final String? destination;

  /// The type of key used for the encryption. If no keyType is provided, the
  /// service will use the default setting (static-key). Allowable encryption
  /// types: static-key.
  final Encryption? encryption;

  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based, Zixi-based, and Fujitsu-based streams.
  final int? maxLatency;

  /// The media streams that are associated with the output, and the parameters
  /// for those associations.
  final List<MediaStreamOutputConfigurationRequest>?
      mediaStreamOutputConfigurations;

  /// The minimum latency in milliseconds for SRT-based streams. In streams that
  /// use the SRT protocol, this value that you set on your MediaConnect source or
  /// output represents the minimal potential latency of that connection. The
  /// latency of the stream is set to the highest number between the sender’s
  /// minimum latency and the receiver’s minimum latency.
  final int? minLatency;

  /// The name of the output. This value must be unique within the current flow.
  final String? name;

  /// The port to use when content is distributed to this output.
  final int? port;

  /// The remote ID for the Zixi-pull output stream.
  final String? remoteId;

  /// The port that the flow uses to send outbound requests to initiate connection
  /// with the sender.
  final int? senderControlPort;

  /// The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
  final int? smoothingLatency;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi and SRT caller-based streams.
  final String? streamId;

  /// The name of the VPC interface attachment to use for this output.
  final VpcInterfaceAttachment? vpcInterfaceAttachment;

  AddOutputRequest({
    required this.protocol,
    this.cidrAllowList,
    this.description,
    this.destination,
    this.encryption,
    this.maxLatency,
    this.mediaStreamOutputConfigurations,
    this.minLatency,
    this.name,
    this.port,
    this.remoteId,
    this.senderControlPort,
    this.smoothingLatency,
    this.streamId,
    this.vpcInterfaceAttachment,
  });

  Map<String, dynamic> toJson() {
    final protocol = this.protocol;
    final cidrAllowList = this.cidrAllowList;
    final description = this.description;
    final destination = this.destination;
    final encryption = this.encryption;
    final maxLatency = this.maxLatency;
    final mediaStreamOutputConfigurations =
        this.mediaStreamOutputConfigurations;
    final minLatency = this.minLatency;
    final name = this.name;
    final port = this.port;
    final remoteId = this.remoteId;
    final senderControlPort = this.senderControlPort;
    final smoothingLatency = this.smoothingLatency;
    final streamId = this.streamId;
    final vpcInterfaceAttachment = this.vpcInterfaceAttachment;
    return {
      'protocol': protocol.toValue(),
      if (cidrAllowList != null) 'cidrAllowList': cidrAllowList,
      if (description != null) 'description': description,
      if (destination != null) 'destination': destination,
      if (encryption != null) 'encryption': encryption,
      if (maxLatency != null) 'maxLatency': maxLatency,
      if (mediaStreamOutputConfigurations != null)
        'mediaStreamOutputConfigurations': mediaStreamOutputConfigurations,
      if (minLatency != null) 'minLatency': minLatency,
      if (name != null) 'name': name,
      if (port != null) 'port': port,
      if (remoteId != null) 'remoteId': remoteId,
      if (senderControlPort != null) 'senderControlPort': senderControlPort,
      if (smoothingLatency != null) 'smoothingLatency': smoothingLatency,
      if (streamId != null) 'streamId': streamId,
      if (vpcInterfaceAttachment != null)
        'vpcInterfaceAttachment': vpcInterfaceAttachment,
    };
  }
}

enum Algorithm {
  aes128,
  aes192,
  aes256,
}

extension AlgorithmValueExtension on Algorithm {
  String toValue() {
    switch (this) {
      case Algorithm.aes128:
        return 'aes128';
      case Algorithm.aes192:
        return 'aes192';
      case Algorithm.aes256:
        return 'aes256';
    }
  }
}

extension AlgorithmFromString on String {
  Algorithm toAlgorithm() {
    switch (this) {
      case 'aes128':
        return Algorithm.aes128;
      case 'aes192':
        return Algorithm.aes192;
      case 'aes256':
        return Algorithm.aes256;
    }
    throw Exception('$this is not known in enum Algorithm');
  }
}

/// A Bridge is the connection between your datacenter's Instances and the AWS
/// cloud. A bridge can be used to send video from the AWS cloud to your
/// datacenter or from your datacenter to the AWS cloud.
class Bridge {
  /// The Amazon Resource Number (ARN) of the bridge.
  final String bridgeArn;
  final BridgeState bridgeState;

  /// The name of the bridge.
  final String name;

  /// The placement Amazon Resource Number (ARN) of the bridge.
  final String placementArn;
  final List<MessageDetail>? bridgeMessages;
  final EgressGatewayBridge? egressGatewayBridge;
  final IngressGatewayBridge? ingressGatewayBridge;

  /// The outputs on this bridge.
  final List<BridgeOutput>? outputs;
  final FailoverConfig? sourceFailoverConfig;

  /// The sources on this bridge.
  final List<BridgeSource>? sources;

  Bridge({
    required this.bridgeArn,
    required this.bridgeState,
    required this.name,
    required this.placementArn,
    this.bridgeMessages,
    this.egressGatewayBridge,
    this.ingressGatewayBridge,
    this.outputs,
    this.sourceFailoverConfig,
    this.sources,
  });

  factory Bridge.fromJson(Map<String, dynamic> json) {
    return Bridge(
      bridgeArn: json['bridgeArn'] as String,
      bridgeState: (json['bridgeState'] as String).toBridgeState(),
      name: json['name'] as String,
      placementArn: json['placementArn'] as String,
      bridgeMessages: (json['bridgeMessages'] as List?)
          ?.whereNotNull()
          .map((e) => MessageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      egressGatewayBridge: json['egressGatewayBridge'] != null
          ? EgressGatewayBridge.fromJson(
              json['egressGatewayBridge'] as Map<String, dynamic>)
          : null,
      ingressGatewayBridge: json['ingressGatewayBridge'] != null
          ? IngressGatewayBridge.fromJson(
              json['ingressGatewayBridge'] as Map<String, dynamic>)
          : null,
      outputs: (json['outputs'] as List?)
          ?.whereNotNull()
          .map((e) => BridgeOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceFailoverConfig: json['sourceFailoverConfig'] != null
          ? FailoverConfig.fromJson(
              json['sourceFailoverConfig'] as Map<String, dynamic>)
          : null,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => BridgeSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final bridgeState = this.bridgeState;
    final name = this.name;
    final placementArn = this.placementArn;
    final bridgeMessages = this.bridgeMessages;
    final egressGatewayBridge = this.egressGatewayBridge;
    final ingressGatewayBridge = this.ingressGatewayBridge;
    final outputs = this.outputs;
    final sourceFailoverConfig = this.sourceFailoverConfig;
    final sources = this.sources;
    return {
      'bridgeArn': bridgeArn,
      'bridgeState': bridgeState.toValue(),
      'name': name,
      'placementArn': placementArn,
      if (bridgeMessages != null) 'bridgeMessages': bridgeMessages,
      if (egressGatewayBridge != null)
        'egressGatewayBridge': egressGatewayBridge,
      if (ingressGatewayBridge != null)
        'ingressGatewayBridge': ingressGatewayBridge,
      if (outputs != null) 'outputs': outputs,
      if (sourceFailoverConfig != null)
        'sourceFailoverConfig': sourceFailoverConfig,
      if (sources != null) 'sources': sources,
    };
  }
}

/// The output of the bridge. A flow output is delivered to the AWS cloud.
class BridgeFlowOutput {
  /// The Amazon Resource Number (ARN) of the cloud flow.
  final String flowArn;

  /// The Amazon Resource Number (ARN) of the flow source.
  final String flowSourceArn;

  /// The name of the bridge's output.
  final String name;

  BridgeFlowOutput({
    required this.flowArn,
    required this.flowSourceArn,
    required this.name,
  });

  factory BridgeFlowOutput.fromJson(Map<String, dynamic> json) {
    return BridgeFlowOutput(
      flowArn: json['flowArn'] as String,
      flowSourceArn: json['flowSourceArn'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final flowSourceArn = this.flowSourceArn;
    final name = this.name;
    return {
      'flowArn': flowArn,
      'flowSourceArn': flowSourceArn,
      'name': name,
    };
  }
}

/// The source of the bridge. A flow source originates in MediaConnect as an
/// existing cloud flow.
class BridgeFlowSource {
  /// The ARN of the cloud flow used as a source of this bridge.
  final String flowArn;

  /// The name of the flow source.
  final String name;

  /// The name of the VPC interface attachment to use for this source.
  final VpcInterfaceAttachment? flowVpcInterfaceAttachment;

  /// The Amazon Resource Number (ARN) of the output.
  final String? outputArn;

  BridgeFlowSource({
    required this.flowArn,
    required this.name,
    this.flowVpcInterfaceAttachment,
    this.outputArn,
  });

  factory BridgeFlowSource.fromJson(Map<String, dynamic> json) {
    return BridgeFlowSource(
      flowArn: json['flowArn'] as String,
      name: json['name'] as String,
      flowVpcInterfaceAttachment: json['flowVpcInterfaceAttachment'] != null
          ? VpcInterfaceAttachment.fromJson(
              json['flowVpcInterfaceAttachment'] as Map<String, dynamic>)
          : null,
      outputArn: json['outputArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final name = this.name;
    final flowVpcInterfaceAttachment = this.flowVpcInterfaceAttachment;
    final outputArn = this.outputArn;
    return {
      'flowArn': flowArn,
      'name': name,
      if (flowVpcInterfaceAttachment != null)
        'flowVpcInterfaceAttachment': flowVpcInterfaceAttachment,
      if (outputArn != null) 'outputArn': outputArn,
    };
  }
}

/// The output of the bridge. A network output is delivered to your premises.
class BridgeNetworkOutput {
  /// The network output IP Address.
  final String ipAddress;

  /// The network output name.
  final String name;

  /// The network output's gateway network name.
  final String networkName;

  /// The network output port.
  final int port;

  /// The network output protocol.
  final Protocol protocol;

  /// The network output TTL.
  final int ttl;

  BridgeNetworkOutput({
    required this.ipAddress,
    required this.name,
    required this.networkName,
    required this.port,
    required this.protocol,
    required this.ttl,
  });

  factory BridgeNetworkOutput.fromJson(Map<String, dynamic> json) {
    return BridgeNetworkOutput(
      ipAddress: json['ipAddress'] as String,
      name: json['name'] as String,
      networkName: json['networkName'] as String,
      port: json['port'] as int,
      protocol: (json['protocol'] as String).toProtocol(),
      ttl: json['ttl'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAddress = this.ipAddress;
    final name = this.name;
    final networkName = this.networkName;
    final port = this.port;
    final protocol = this.protocol;
    final ttl = this.ttl;
    return {
      'ipAddress': ipAddress,
      'name': name,
      'networkName': networkName,
      'port': port,
      'protocol': protocol.toValue(),
      'ttl': ttl,
    };
  }
}

/// The source of the bridge. A network source originates at your premises.
class BridgeNetworkSource {
  /// The network source multicast IP.
  final String multicastIp;

  /// The name of the network source.
  final String name;

  /// The network source's gateway network name.
  final String networkName;

  /// The network source port.
  final int port;

  /// The network source protocol.
  final Protocol protocol;

  BridgeNetworkSource({
    required this.multicastIp,
    required this.name,
    required this.networkName,
    required this.port,
    required this.protocol,
  });

  factory BridgeNetworkSource.fromJson(Map<String, dynamic> json) {
    return BridgeNetworkSource(
      multicastIp: json['multicastIp'] as String,
      name: json['name'] as String,
      networkName: json['networkName'] as String,
      port: json['port'] as int,
      protocol: (json['protocol'] as String).toProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final multicastIp = this.multicastIp;
    final name = this.name;
    final networkName = this.networkName;
    final port = this.port;
    final protocol = this.protocol;
    return {
      'multicastIp': multicastIp,
      'name': name,
      'networkName': networkName,
      'port': port,
      'protocol': protocol.toValue(),
    };
  }
}

/// The output of the bridge.
class BridgeOutput {
  final BridgeFlowOutput? flowOutput;
  final BridgeNetworkOutput? networkOutput;

  BridgeOutput({
    this.flowOutput,
    this.networkOutput,
  });

  factory BridgeOutput.fromJson(Map<String, dynamic> json) {
    return BridgeOutput(
      flowOutput: json['flowOutput'] != null
          ? BridgeFlowOutput.fromJson(
              json['flowOutput'] as Map<String, dynamic>)
          : null,
      networkOutput: json['networkOutput'] != null
          ? BridgeNetworkOutput.fromJson(
              json['networkOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flowOutput = this.flowOutput;
    final networkOutput = this.networkOutput;
    return {
      if (flowOutput != null) 'flowOutput': flowOutput,
      if (networkOutput != null) 'networkOutput': networkOutput,
    };
  }
}

enum BridgePlacement {
  available,
  locked,
}

extension BridgePlacementValueExtension on BridgePlacement {
  String toValue() {
    switch (this) {
      case BridgePlacement.available:
        return 'AVAILABLE';
      case BridgePlacement.locked:
        return 'LOCKED';
    }
  }
}

extension BridgePlacementFromString on String {
  BridgePlacement toBridgePlacement() {
    switch (this) {
      case 'AVAILABLE':
        return BridgePlacement.available;
      case 'LOCKED':
        return BridgePlacement.locked;
    }
    throw Exception('$this is not known in enum BridgePlacement');
  }
}

/// The bridge's source.
class BridgeSource {
  final BridgeFlowSource? flowSource;
  final BridgeNetworkSource? networkSource;

  BridgeSource({
    this.flowSource,
    this.networkSource,
  });

  factory BridgeSource.fromJson(Map<String, dynamic> json) {
    return BridgeSource(
      flowSource: json['flowSource'] != null
          ? BridgeFlowSource.fromJson(
              json['flowSource'] as Map<String, dynamic>)
          : null,
      networkSource: json['networkSource'] != null
          ? BridgeNetworkSource.fromJson(
              json['networkSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flowSource = this.flowSource;
    final networkSource = this.networkSource;
    return {
      if (flowSource != null) 'flowSource': flowSource,
      if (networkSource != null) 'networkSource': networkSource,
    };
  }
}

enum BridgeState {
  creating,
  standby,
  starting,
  deploying,
  active,
  stopping,
  deleting,
  deleted,
  startFailed,
  startPending,
  stopFailed,
  updating,
}

extension BridgeStateValueExtension on BridgeState {
  String toValue() {
    switch (this) {
      case BridgeState.creating:
        return 'CREATING';
      case BridgeState.standby:
        return 'STANDBY';
      case BridgeState.starting:
        return 'STARTING';
      case BridgeState.deploying:
        return 'DEPLOYING';
      case BridgeState.active:
        return 'ACTIVE';
      case BridgeState.stopping:
        return 'STOPPING';
      case BridgeState.deleting:
        return 'DELETING';
      case BridgeState.deleted:
        return 'DELETED';
      case BridgeState.startFailed:
        return 'START_FAILED';
      case BridgeState.startPending:
        return 'START_PENDING';
      case BridgeState.stopFailed:
        return 'STOP_FAILED';
      case BridgeState.updating:
        return 'UPDATING';
    }
  }
}

extension BridgeStateFromString on String {
  BridgeState toBridgeState() {
    switch (this) {
      case 'CREATING':
        return BridgeState.creating;
      case 'STANDBY':
        return BridgeState.standby;
      case 'STARTING':
        return BridgeState.starting;
      case 'DEPLOYING':
        return BridgeState.deploying;
      case 'ACTIVE':
        return BridgeState.active;
      case 'STOPPING':
        return BridgeState.stopping;
      case 'DELETING':
        return BridgeState.deleting;
      case 'DELETED':
        return BridgeState.deleted;
      case 'START_FAILED':
        return BridgeState.startFailed;
      case 'START_PENDING':
        return BridgeState.startPending;
      case 'STOP_FAILED':
        return BridgeState.stopFailed;
      case 'UPDATING':
        return BridgeState.updating;
    }
    throw Exception('$this is not known in enum BridgeState');
  }
}

enum Colorimetry {
  bt601,
  bt709,
  bt2020,
  bt2100,
  st2065_1,
  st2065_3,
  xyz,
}

extension ColorimetryValueExtension on Colorimetry {
  String toValue() {
    switch (this) {
      case Colorimetry.bt601:
        return 'BT601';
      case Colorimetry.bt709:
        return 'BT709';
      case Colorimetry.bt2020:
        return 'BT2020';
      case Colorimetry.bt2100:
        return 'BT2100';
      case Colorimetry.st2065_1:
        return 'ST2065-1';
      case Colorimetry.st2065_3:
        return 'ST2065-3';
      case Colorimetry.xyz:
        return 'XYZ';
    }
  }
}

extension ColorimetryFromString on String {
  Colorimetry toColorimetry() {
    switch (this) {
      case 'BT601':
        return Colorimetry.bt601;
      case 'BT709':
        return Colorimetry.bt709;
      case 'BT2020':
        return Colorimetry.bt2020;
      case 'BT2100':
        return Colorimetry.bt2100;
      case 'ST2065-1':
        return Colorimetry.st2065_1;
      case 'ST2065-3':
        return Colorimetry.st2065_3;
      case 'XYZ':
        return Colorimetry.xyz;
    }
    throw Exception('$this is not known in enum Colorimetry');
  }
}

enum ConnectionStatus {
  connected,
  disconnected,
}

extension ConnectionStatusValueExtension on ConnectionStatus {
  String toValue() {
    switch (this) {
      case ConnectionStatus.connected:
        return 'CONNECTED';
      case ConnectionStatus.disconnected:
        return 'DISCONNECTED';
    }
  }
}

extension ConnectionStatusFromString on String {
  ConnectionStatus toConnectionStatus() {
    switch (this) {
      case 'CONNECTED':
        return ConnectionStatus.connected;
      case 'DISCONNECTED':
        return ConnectionStatus.disconnected;
    }
    throw Exception('$this is not known in enum ConnectionStatus');
  }
}

class CreateBridgeResponse {
  final Bridge? bridge;

  CreateBridgeResponse({
    this.bridge,
  });

  factory CreateBridgeResponse.fromJson(Map<String, dynamic> json) {
    return CreateBridgeResponse(
      bridge: json['bridge'] != null
          ? Bridge.fromJson(json['bridge'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bridge = this.bridge;
    return {
      if (bridge != null) 'bridge': bridge,
    };
  }
}

class CreateFlowResponse {
  final Flow? flow;

  CreateFlowResponse({
    this.flow,
  });

  factory CreateFlowResponse.fromJson(Map<String, dynamic> json) {
    return CreateFlowResponse(
      flow: json['flow'] != null
          ? Flow.fromJson(json['flow'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flow = this.flow;
    return {
      if (flow != null) 'flow': flow,
    };
  }
}

class CreateGatewayResponse {
  final Gateway? gateway;

  CreateGatewayResponse({
    this.gateway,
  });

  factory CreateGatewayResponse.fromJson(Map<String, dynamic> json) {
    return CreateGatewayResponse(
      gateway: json['gateway'] != null
          ? Gateway.fromJson(json['gateway'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gateway = this.gateway;
    return {
      if (gateway != null) 'gateway': gateway,
    };
  }
}

class DeleteBridgeResponse {
  /// The Amazon Resource Number (ARN) of the deleted bridge.
  final String? bridgeArn;

  DeleteBridgeResponse({
    this.bridgeArn,
  });

  factory DeleteBridgeResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBridgeResponse(
      bridgeArn: json['bridgeArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    return {
      if (bridgeArn != null) 'bridgeArn': bridgeArn,
    };
  }
}

class DeleteFlowResponse {
  /// The ARN of the flow that was deleted.
  final String? flowArn;

  /// The status of the flow when the DeleteFlow process begins.
  final Status? status;

  DeleteFlowResponse({
    this.flowArn,
    this.status,
  });

  factory DeleteFlowResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFlowResponse(
      flowArn: json['flowArn'] as String?,
      status: (json['status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final status = this.status;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class DeleteGatewayResponse {
  /// The Amazon Resource Name (ARN) of the gateway that was deleted.
  final String? gatewayArn;

  DeleteGatewayResponse({
    this.gatewayArn,
  });

  factory DeleteGatewayResponse.fromJson(Map<String, dynamic> json) {
    return DeleteGatewayResponse(
      gatewayArn: json['gatewayArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    return {
      if (gatewayArn != null) 'gatewayArn': gatewayArn,
    };
  }
}

class DeregisterGatewayInstanceResponse {
  /// The Amazon Resource Name (ARN) of the instance.
  final String? gatewayInstanceArn;

  /// The status of the instance.
  final InstanceState? instanceState;

  DeregisterGatewayInstanceResponse({
    this.gatewayInstanceArn,
    this.instanceState,
  });

  factory DeregisterGatewayInstanceResponse.fromJson(
      Map<String, dynamic> json) {
    return DeregisterGatewayInstanceResponse(
      gatewayInstanceArn: json['gatewayInstanceArn'] as String?,
      instanceState: (json['instanceState'] as String?)?.toInstanceState(),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayInstanceArn = this.gatewayInstanceArn;
    final instanceState = this.instanceState;
    return {
      if (gatewayInstanceArn != null) 'gatewayInstanceArn': gatewayInstanceArn,
      if (instanceState != null) 'instanceState': instanceState.toValue(),
    };
  }
}

class DescribeBridgeResponse {
  final Bridge? bridge;

  DescribeBridgeResponse({
    this.bridge,
  });

  factory DescribeBridgeResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBridgeResponse(
      bridge: json['bridge'] != null
          ? Bridge.fromJson(json['bridge'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bridge = this.bridge;
    return {
      if (bridge != null) 'bridge': bridge,
    };
  }
}

class DescribeFlowResponse {
  final Flow? flow;
  final Messages? messages;

  DescribeFlowResponse({
    this.flow,
    this.messages,
  });

  factory DescribeFlowResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFlowResponse(
      flow: json['flow'] != null
          ? Flow.fromJson(json['flow'] as Map<String, dynamic>)
          : null,
      messages: json['messages'] != null
          ? Messages.fromJson(json['messages'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flow = this.flow;
    final messages = this.messages;
    return {
      if (flow != null) 'flow': flow,
      if (messages != null) 'messages': messages,
    };
  }
}

class DescribeFlowSourceMetadataResponse {
  /// The ARN of the flow that DescribeFlowSourceMetadata was performed on.
  final String? flowArn;

  /// Provides a status code and message regarding issues found with the flow
  /// source metadata.
  final List<MessageDetail>? messages;

  /// The timestamp of the most recent change in metadata for this flow’s source.
  final DateTime? timestamp;
  final TransportMediaInfo? transportMediaInfo;

  DescribeFlowSourceMetadataResponse({
    this.flowArn,
    this.messages,
    this.timestamp,
    this.transportMediaInfo,
  });

  factory DescribeFlowSourceMetadataResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeFlowSourceMetadataResponse(
      flowArn: json['flowArn'] as String?,
      messages: (json['messages'] as List?)
          ?.whereNotNull()
          .map((e) => MessageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: timeStampFromJson(json['timestamp']),
      transportMediaInfo: json['transportMediaInfo'] != null
          ? TransportMediaInfo.fromJson(
              json['transportMediaInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final messages = this.messages;
    final timestamp = this.timestamp;
    final transportMediaInfo = this.transportMediaInfo;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (messages != null) 'messages': messages,
      if (timestamp != null) 'timestamp': iso8601ToJson(timestamp),
      if (transportMediaInfo != null) 'transportMediaInfo': transportMediaInfo,
    };
  }
}

class DescribeGatewayInstanceResponse {
  final GatewayInstance? gatewayInstance;

  DescribeGatewayInstanceResponse({
    this.gatewayInstance,
  });

  factory DescribeGatewayInstanceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeGatewayInstanceResponse(
      gatewayInstance: json['gatewayInstance'] != null
          ? GatewayInstance.fromJson(
              json['gatewayInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayInstance = this.gatewayInstance;
    return {
      if (gatewayInstance != null) 'gatewayInstance': gatewayInstance,
    };
  }
}

class DescribeGatewayResponse {
  final Gateway? gateway;

  DescribeGatewayResponse({
    this.gateway,
  });

  factory DescribeGatewayResponse.fromJson(Map<String, dynamic> json) {
    return DescribeGatewayResponse(
      gateway: json['gateway'] != null
          ? Gateway.fromJson(json['gateway'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gateway = this.gateway;
    return {
      if (gateway != null) 'gateway': gateway,
    };
  }
}

class DescribeOfferingResponse {
  final Offering? offering;

  DescribeOfferingResponse({
    this.offering,
  });

  factory DescribeOfferingResponse.fromJson(Map<String, dynamic> json) {
    return DescribeOfferingResponse(
      offering: json['offering'] != null
          ? Offering.fromJson(json['offering'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final offering = this.offering;
    return {
      if (offering != null) 'offering': offering,
    };
  }
}

class DescribeReservationResponse {
  final Reservation? reservation;

  DescribeReservationResponse({
    this.reservation,
  });

  factory DescribeReservationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeReservationResponse(
      reservation: json['reservation'] != null
          ? Reservation.fromJson(json['reservation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reservation = this.reservation;
    return {
      if (reservation != null) 'reservation': reservation,
    };
  }
}

enum DesiredState {
  active,
  standby,
  deleted,
}

extension DesiredStateValueExtension on DesiredState {
  String toValue() {
    switch (this) {
      case DesiredState.active:
        return 'ACTIVE';
      case DesiredState.standby:
        return 'STANDBY';
      case DesiredState.deleted:
        return 'DELETED';
    }
  }
}

extension DesiredStateFromString on String {
  DesiredState toDesiredState() {
    switch (this) {
      case 'ACTIVE':
        return DesiredState.active;
      case 'STANDBY':
        return DesiredState.standby;
      case 'DELETED':
        return DesiredState.deleted;
    }
    throw Exception('$this is not known in enum DesiredState');
  }
}

/// The transport parameters that are associated with an outbound media stream.
class DestinationConfiguration {
  /// The IP address where contents of the media stream will be sent.
  final String destinationIp;

  /// The port to use when the content of the media stream is distributed to the
  /// output.
  final int destinationPort;

  /// The VPC interface that is used for the media stream associated with the
  /// output.
  final Interface interface;

  /// The IP address that the receiver requires in order to establish a connection
  /// with the flow. This value is represented by the elastic network interface IP
  /// address of the VPC. This field applies only to outputs that use the CDI or
  /// ST 2110 JPEG XS protocol.
  final String outboundIp;

  DestinationConfiguration({
    required this.destinationIp,
    required this.destinationPort,
    required this.interface,
    required this.outboundIp,
  });

  factory DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return DestinationConfiguration(
      destinationIp: json['destinationIp'] as String,
      destinationPort: json['destinationPort'] as int,
      interface: Interface.fromJson(json['interface'] as Map<String, dynamic>),
      outboundIp: json['outboundIp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationIp = this.destinationIp;
    final destinationPort = this.destinationPort;
    final interface = this.interface;
    final outboundIp = this.outboundIp;
    return {
      'destinationIp': destinationIp,
      'destinationPort': destinationPort,
      'interface': interface,
      'outboundIp': outboundIp,
    };
  }
}

/// The transport parameters that you want to associate with an outbound media
/// stream.
class DestinationConfigurationRequest {
  /// The IP address where you want MediaConnect to send contents of the media
  /// stream.
  final String destinationIp;

  /// The port that you want MediaConnect to use when it distributes the media
  /// stream to the output.
  final int destinationPort;

  /// The VPC interface that you want to use for the media stream associated with
  /// the output.
  final InterfaceRequest interface;

  DestinationConfigurationRequest({
    required this.destinationIp,
    required this.destinationPort,
    required this.interface,
  });

  Map<String, dynamic> toJson() {
    final destinationIp = this.destinationIp;
    final destinationPort = this.destinationPort;
    final interface = this.interface;
    return {
      'destinationIp': destinationIp,
      'destinationPort': destinationPort,
      'interface': interface,
    };
  }
}

enum DurationUnits {
  months,
}

extension DurationUnitsValueExtension on DurationUnits {
  String toValue() {
    switch (this) {
      case DurationUnits.months:
        return 'MONTHS';
    }
  }
}

extension DurationUnitsFromString on String {
  DurationUnits toDurationUnits() {
    switch (this) {
      case 'MONTHS':
        return DurationUnits.months;
    }
    throw Exception('$this is not known in enum DurationUnits');
  }
}

class EgressGatewayBridge {
  /// The maximum expected bitrate (in bps) of the egress bridge.
  final int maxBitrate;

  /// The ID of the instance running this bridge.
  final String? instanceId;

  EgressGatewayBridge({
    required this.maxBitrate,
    this.instanceId,
  });

  factory EgressGatewayBridge.fromJson(Map<String, dynamic> json) {
    return EgressGatewayBridge(
      maxBitrate: json['maxBitrate'] as int,
      instanceId: json['instanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxBitrate = this.maxBitrate;
    final instanceId = this.instanceId;
    return {
      'maxBitrate': maxBitrate,
      if (instanceId != null) 'instanceId': instanceId,
    };
  }
}

enum EncoderProfile {
  main,
  high,
}

extension EncoderProfileValueExtension on EncoderProfile {
  String toValue() {
    switch (this) {
      case EncoderProfile.main:
        return 'main';
      case EncoderProfile.high:
        return 'high';
    }
  }
}

extension EncoderProfileFromString on String {
  EncoderProfile toEncoderProfile() {
    switch (this) {
      case 'main':
        return EncoderProfile.main;
      case 'high':
        return EncoderProfile.high;
    }
    throw Exception('$this is not known in enum EncoderProfile');
  }
}

enum EncodingName {
  jxsv,
  raw,
  smpte291,
  pcm,
}

extension EncodingNameValueExtension on EncodingName {
  String toValue() {
    switch (this) {
      case EncodingName.jxsv:
        return 'jxsv';
      case EncodingName.raw:
        return 'raw';
      case EncodingName.smpte291:
        return 'smpte291';
      case EncodingName.pcm:
        return 'pcm';
    }
  }
}

extension EncodingNameFromString on String {
  EncodingName toEncodingName() {
    switch (this) {
      case 'jxsv':
        return EncodingName.jxsv;
      case 'raw':
        return EncodingName.raw;
      case 'smpte291':
        return EncodingName.smpte291;
      case 'pcm':
        return EncodingName.pcm;
    }
    throw Exception('$this is not known in enum EncodingName');
  }
}

/// A collection of parameters that determine how MediaConnect will convert the
/// content. These fields only apply to outputs on flows that have a CDI source.
class EncodingParameters {
  /// A value that is used to calculate compression for an output. The bitrate of
  /// the output is calculated as follows: Output bitrate = (1 /
  /// compressionFactor) * (source bitrate) This property only applies to outputs
  /// that use the ST 2110 JPEG XS protocol, with a flow source that uses the CDI
  /// protocol. Valid values are floating point numbers in the range of 3.0 to
  /// 10.0, inclusive.
  final double compressionFactor;

  /// A setting on the encoder that drives compression settings. This property
  /// only applies to video media streams associated with outputs that use the ST
  /// 2110 JPEG XS protocol, with a flow source that uses the CDI protocol.
  final EncoderProfile encoderProfile;

  EncodingParameters({
    required this.compressionFactor,
    required this.encoderProfile,
  });

  factory EncodingParameters.fromJson(Map<String, dynamic> json) {
    return EncodingParameters(
      compressionFactor: json['compressionFactor'] as double,
      encoderProfile: (json['encoderProfile'] as String).toEncoderProfile(),
    );
  }

  Map<String, dynamic> toJson() {
    final compressionFactor = this.compressionFactor;
    final encoderProfile = this.encoderProfile;
    return {
      'compressionFactor': compressionFactor,
      'encoderProfile': encoderProfile.toValue(),
    };
  }
}

/// A collection of parameters that determine how MediaConnect will convert the
/// content. These fields only apply to outputs on flows that have a CDI source.
class EncodingParametersRequest {
  /// A value that is used to calculate compression for an output. The bitrate of
  /// the output is calculated as follows: Output bitrate = (1 /
  /// compressionFactor) * (source bitrate) This property only applies to outputs
  /// that use the ST 2110 JPEG XS protocol, with a flow source that uses the CDI
  /// protocol. Valid values are floating point numbers in the range of 3.0 to
  /// 10.0, inclusive.
  final double compressionFactor;

  /// A setting on the encoder that drives compression settings. This property
  /// only applies to video media streams associated with outputs that use the ST
  /// 2110 JPEG XS protocol, if at least one source on the flow uses the CDI
  /// protocol.
  final EncoderProfile encoderProfile;

  EncodingParametersRequest({
    required this.compressionFactor,
    required this.encoderProfile,
  });

  Map<String, dynamic> toJson() {
    final compressionFactor = this.compressionFactor;
    final encoderProfile = this.encoderProfile;
    return {
      'compressionFactor': compressionFactor,
      'encoderProfile': encoderProfile.toValue(),
    };
  }
}

/// Information about the encryption of the flow.
class Encryption {
  /// The ARN of the role that you created during setup (when you set up AWS
  /// Elemental MediaConnect as a trusted entity).
  final String roleArn;

  /// The type of algorithm that is used for the encryption (such as aes128,
  /// aes192, or aes256).
  final Algorithm? algorithm;

  /// A 128-bit, 16-byte hex value represented by a 32-character string, to be
  /// used with the key for encrypting content. This parameter is not valid for
  /// static key encryption.
  final String? constantInitializationVector;

  /// The value of one of the devices that you configured with your digital rights
  /// management (DRM) platform key provider. This parameter is required for SPEKE
  /// encryption and is not valid for static key encryption.
  final String? deviceId;

  /// The type of key that is used for the encryption. If no keyType is provided,
  /// the service will use the default setting (static-key).
  final KeyType? keyType;

  /// The AWS Region that the API Gateway proxy endpoint was created in. This
  /// parameter is required for SPEKE encryption and is not valid for static key
  /// encryption.
  final String? region;

  /// An identifier for the content. The service sends this value to the key
  /// server to identify the current endpoint. The resource ID is also known as
  /// the content ID. This parameter is required for SPEKE encryption and is not
  /// valid for static key encryption.
  final String? resourceId;

  /// The ARN of the secret that you created in AWS Secrets Manager to store the
  /// encryption key. This parameter is required for static key encryption and is
  /// not valid for SPEKE encryption.
  final String? secretArn;

  /// The URL from the API Gateway proxy that you set up to talk to your key
  /// server. This parameter is required for SPEKE encryption and is not valid for
  /// static key encryption.
  final String? url;

  Encryption({
    required this.roleArn,
    this.algorithm,
    this.constantInitializationVector,
    this.deviceId,
    this.keyType,
    this.region,
    this.resourceId,
    this.secretArn,
    this.url,
  });

  factory Encryption.fromJson(Map<String, dynamic> json) {
    return Encryption(
      roleArn: json['roleArn'] as String,
      algorithm: (json['algorithm'] as String?)?.toAlgorithm(),
      constantInitializationVector:
          json['constantInitializationVector'] as String?,
      deviceId: json['deviceId'] as String?,
      keyType: (json['keyType'] as String?)?.toKeyType(),
      region: json['region'] as String?,
      resourceId: json['resourceId'] as String?,
      secretArn: json['secretArn'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final algorithm = this.algorithm;
    final constantInitializationVector = this.constantInitializationVector;
    final deviceId = this.deviceId;
    final keyType = this.keyType;
    final region = this.region;
    final resourceId = this.resourceId;
    final secretArn = this.secretArn;
    final url = this.url;
    return {
      'roleArn': roleArn,
      if (algorithm != null) 'algorithm': algorithm.toValue(),
      if (constantInitializationVector != null)
        'constantInitializationVector': constantInitializationVector,
      if (deviceId != null) 'deviceId': deviceId,
      if (keyType != null) 'keyType': keyType.toValue(),
      if (region != null) 'region': region,
      if (resourceId != null) 'resourceId': resourceId,
      if (secretArn != null) 'secretArn': secretArn,
      if (url != null) 'url': url,
    };
  }
}

/// The settings for a flow entitlement.
class Entitlement {
  /// The ARN of the entitlement.
  final String entitlementArn;

  /// The name of the entitlement.
  final String name;

  /// The AWS account IDs that you want to share your content with. The receiving
  /// accounts (subscribers) will be allowed to create their own flow using your
  /// content as the source.
  final List<String> subscribers;

  /// Percentage from 0-100 of the data transfer cost to be billed to the
  /// subscriber.
  final int? dataTransferSubscriberFeePercent;

  /// A description of the entitlement.
  final String? description;

  /// The type of encryption that will be used on the output that is associated
  /// with this entitlement.
  final Encryption? encryption;

  /// An indication of whether the entitlement is enabled.
  final EntitlementStatus? entitlementStatus;

  Entitlement({
    required this.entitlementArn,
    required this.name,
    required this.subscribers,
    this.dataTransferSubscriberFeePercent,
    this.description,
    this.encryption,
    this.entitlementStatus,
  });

  factory Entitlement.fromJson(Map<String, dynamic> json) {
    return Entitlement(
      entitlementArn: json['entitlementArn'] as String,
      name: json['name'] as String,
      subscribers: (json['subscribers'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      dataTransferSubscriberFeePercent:
          json['dataTransferSubscriberFeePercent'] as int?,
      description: json['description'] as String?,
      encryption: json['encryption'] != null
          ? Encryption.fromJson(json['encryption'] as Map<String, dynamic>)
          : null,
      entitlementStatus:
          (json['entitlementStatus'] as String?)?.toEntitlementStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final entitlementArn = this.entitlementArn;
    final name = this.name;
    final subscribers = this.subscribers;
    final dataTransferSubscriberFeePercent =
        this.dataTransferSubscriberFeePercent;
    final description = this.description;
    final encryption = this.encryption;
    final entitlementStatus = this.entitlementStatus;
    return {
      'entitlementArn': entitlementArn,
      'name': name,
      'subscribers': subscribers,
      if (dataTransferSubscriberFeePercent != null)
        'dataTransferSubscriberFeePercent': dataTransferSubscriberFeePercent,
      if (description != null) 'description': description,
      if (encryption != null) 'encryption': encryption,
      if (entitlementStatus != null)
        'entitlementStatus': entitlementStatus.toValue(),
    };
  }
}

enum EntitlementStatus {
  enabled,
  disabled,
}

extension EntitlementStatusValueExtension on EntitlementStatus {
  String toValue() {
    switch (this) {
      case EntitlementStatus.enabled:
        return 'ENABLED';
      case EntitlementStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension EntitlementStatusFromString on String {
  EntitlementStatus toEntitlementStatus() {
    switch (this) {
      case 'ENABLED':
        return EntitlementStatus.enabled;
      case 'DISABLED':
        return EntitlementStatus.disabled;
    }
    throw Exception('$this is not known in enum EntitlementStatus');
  }
}

/// The settings for source failover.
class FailoverConfig {
  /// The type of failover you choose for this flow. MERGE combines the source
  /// streams into a single stream, allowing graceful recovery from any
  /// single-source loss. FAILOVER allows switching between different streams.
  final FailoverMode? failoverMode;

  /// Search window time to look for dash-7 packets
  final int? recoveryWindow;

  /// The priority you want to assign to a source. You can have a primary stream
  /// and a backup stream or two equally prioritized streams.
  final SourcePriority? sourcePriority;
  final State? state;

  FailoverConfig({
    this.failoverMode,
    this.recoveryWindow,
    this.sourcePriority,
    this.state,
  });

  factory FailoverConfig.fromJson(Map<String, dynamic> json) {
    return FailoverConfig(
      failoverMode: (json['failoverMode'] as String?)?.toFailoverMode(),
      recoveryWindow: json['recoveryWindow'] as int?,
      sourcePriority: json['sourcePriority'] != null
          ? SourcePriority.fromJson(
              json['sourcePriority'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.toState(),
    );
  }

  Map<String, dynamic> toJson() {
    final failoverMode = this.failoverMode;
    final recoveryWindow = this.recoveryWindow;
    final sourcePriority = this.sourcePriority;
    final state = this.state;
    return {
      if (failoverMode != null) 'failoverMode': failoverMode.toValue(),
      if (recoveryWindow != null) 'recoveryWindow': recoveryWindow,
      if (sourcePriority != null) 'sourcePriority': sourcePriority,
      if (state != null) 'state': state.toValue(),
    };
  }
}

enum FailoverMode {
  merge,
  failover,
}

extension FailoverModeValueExtension on FailoverMode {
  String toValue() {
    switch (this) {
      case FailoverMode.merge:
        return 'MERGE';
      case FailoverMode.failover:
        return 'FAILOVER';
    }
  }
}

extension FailoverModeFromString on String {
  FailoverMode toFailoverMode() {
    switch (this) {
      case 'MERGE':
        return FailoverMode.merge;
      case 'FAILOVER':
        return FailoverMode.failover;
    }
    throw Exception('$this is not known in enum FailoverMode');
  }
}

/// The settings for a flow, including its source, outputs, and entitlements.
class Flow {
  /// The Availability Zone that you want to create the flow in. These options are
  /// limited to the Availability Zones within the current AWS.
  final String availabilityZone;

  /// The entitlements in this flow.
  final List<Entitlement> entitlements;

  /// The Amazon Resource Name (ARN) of the flow.
  final String flowArn;

  /// The name of the flow.
  final String name;

  /// The outputs in this flow.
  final List<Output> outputs;
  final Source source;

  /// The current status of the flow.
  final Status status;

  /// A description of the flow. This value is not used or seen outside of the
  /// current AWS Elemental MediaConnect account.
  final String? description;

  /// The IP address from which video will be sent to output destinations.
  final String? egressIp;
  final Maintenance? maintenance;

  /// The media streams that are associated with the flow. After you associate a
  /// media stream with a source, you can also associate it with outputs on the
  /// flow.
  final List<MediaStream>? mediaStreams;
  final FailoverConfig? sourceFailoverConfig;
  final List<Source>? sources;

  /// The VPC Interfaces for this flow.
  final List<VpcInterface>? vpcInterfaces;

  Flow({
    required this.availabilityZone,
    required this.entitlements,
    required this.flowArn,
    required this.name,
    required this.outputs,
    required this.source,
    required this.status,
    this.description,
    this.egressIp,
    this.maintenance,
    this.mediaStreams,
    this.sourceFailoverConfig,
    this.sources,
    this.vpcInterfaces,
  });

  factory Flow.fromJson(Map<String, dynamic> json) {
    return Flow(
      availabilityZone: json['availabilityZone'] as String,
      entitlements: (json['entitlements'] as List)
          .whereNotNull()
          .map((e) => Entitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
      flowArn: json['flowArn'] as String,
      name: json['name'] as String,
      outputs: (json['outputs'] as List)
          .whereNotNull()
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      status: (json['status'] as String).toStatus(),
      description: json['description'] as String?,
      egressIp: json['egressIp'] as String?,
      maintenance: json['maintenance'] != null
          ? Maintenance.fromJson(json['maintenance'] as Map<String, dynamic>)
          : null,
      mediaStreams: (json['mediaStreams'] as List?)
          ?.whereNotNull()
          .map((e) => MediaStream.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceFailoverConfig: json['sourceFailoverConfig'] != null
          ? FailoverConfig.fromJson(
              json['sourceFailoverConfig'] as Map<String, dynamic>)
          : null,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcInterfaces: (json['vpcInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => VpcInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final entitlements = this.entitlements;
    final flowArn = this.flowArn;
    final name = this.name;
    final outputs = this.outputs;
    final source = this.source;
    final status = this.status;
    final description = this.description;
    final egressIp = this.egressIp;
    final maintenance = this.maintenance;
    final mediaStreams = this.mediaStreams;
    final sourceFailoverConfig = this.sourceFailoverConfig;
    final sources = this.sources;
    final vpcInterfaces = this.vpcInterfaces;
    return {
      'availabilityZone': availabilityZone,
      'entitlements': entitlements,
      'flowArn': flowArn,
      'name': name,
      'outputs': outputs,
      'source': source,
      'status': status.toValue(),
      if (description != null) 'description': description,
      if (egressIp != null) 'egressIp': egressIp,
      if (maintenance != null) 'maintenance': maintenance,
      if (mediaStreams != null) 'mediaStreams': mediaStreams,
      if (sourceFailoverConfig != null)
        'sourceFailoverConfig': sourceFailoverConfig,
      if (sources != null) 'sources': sources,
      if (vpcInterfaces != null) 'vpcInterfaces': vpcInterfaces,
    };
  }
}

/// FMTP
class Fmtp {
  /// The format of the audio channel.
  final String? channelOrder;

  /// The format that is used for the representation of color.
  final Colorimetry? colorimetry;

  /// The frame rate for the video stream, in frames/second. For example:
  /// 60000/1001. If you specify a whole number, MediaConnect uses a ratio of N/1.
  /// For example, if you specify 60, MediaConnect uses 60/1 as the
  /// exactFramerate.
  final String? exactFramerate;

  /// The pixel aspect ratio (PAR) of the video.
  final String? par;

  /// The encoding range of the video.
  final Range? range;

  /// The type of compression that was used to smooth the video’s appearance
  final ScanMode? scanMode;

  /// The transfer characteristic system (TCS) that is used in the video.
  final Tcs? tcs;

  Fmtp({
    this.channelOrder,
    this.colorimetry,
    this.exactFramerate,
    this.par,
    this.range,
    this.scanMode,
    this.tcs,
  });

  factory Fmtp.fromJson(Map<String, dynamic> json) {
    return Fmtp(
      channelOrder: json['channelOrder'] as String?,
      colorimetry: (json['colorimetry'] as String?)?.toColorimetry(),
      exactFramerate: json['exactFramerate'] as String?,
      par: json['par'] as String?,
      range: (json['range'] as String?)?.toRange(),
      scanMode: (json['scanMode'] as String?)?.toScanMode(),
      tcs: (json['tcs'] as String?)?.toTcs(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelOrder = this.channelOrder;
    final colorimetry = this.colorimetry;
    final exactFramerate = this.exactFramerate;
    final par = this.par;
    final range = this.range;
    final scanMode = this.scanMode;
    final tcs = this.tcs;
    return {
      if (channelOrder != null) 'channelOrder': channelOrder,
      if (colorimetry != null) 'colorimetry': colorimetry.toValue(),
      if (exactFramerate != null) 'exactFramerate': exactFramerate,
      if (par != null) 'par': par,
      if (range != null) 'range': range.toValue(),
      if (scanMode != null) 'scanMode': scanMode.toValue(),
      if (tcs != null) 'tcs': tcs.toValue(),
    };
  }
}

/// The settings that you want to use to define the media stream.
class FmtpRequest {
  /// The format of the audio channel.
  final String? channelOrder;

  /// The format that is used for the representation of color.
  final Colorimetry? colorimetry;

  /// The frame rate for the video stream, in frames/second. For example:
  /// 60000/1001. If you specify a whole number, MediaConnect uses a ratio of N/1.
  /// For example, if you specify 60, MediaConnect uses 60/1 as the
  /// exactFramerate.
  final String? exactFramerate;

  /// The pixel aspect ratio (PAR) of the video.
  final String? par;

  /// The encoding range of the video.
  final Range? range;

  /// The type of compression that was used to smooth the video’s appearance.
  final ScanMode? scanMode;

  /// The transfer characteristic system (TCS) that is used in the video.
  final Tcs? tcs;

  FmtpRequest({
    this.channelOrder,
    this.colorimetry,
    this.exactFramerate,
    this.par,
    this.range,
    this.scanMode,
    this.tcs,
  });

  Map<String, dynamic> toJson() {
    final channelOrder = this.channelOrder;
    final colorimetry = this.colorimetry;
    final exactFramerate = this.exactFramerate;
    final par = this.par;
    final range = this.range;
    final scanMode = this.scanMode;
    final tcs = this.tcs;
    return {
      if (channelOrder != null) 'channelOrder': channelOrder,
      if (colorimetry != null) 'colorimetry': colorimetry.toValue(),
      if (exactFramerate != null) 'exactFramerate': exactFramerate,
      if (par != null) 'par': par,
      if (range != null) 'range': range.toValue(),
      if (scanMode != null) 'scanMode': scanMode.toValue(),
      if (tcs != null) 'tcs': tcs.toValue(),
    };
  }
}

/// The frame resolution used by the video stream.
class FrameResolution {
  /// The number of pixels in the height of the video frame.
  final int frameHeight;

  /// The number of pixels in the width of the video frame.
  final int frameWidth;

  FrameResolution({
    required this.frameHeight,
    required this.frameWidth,
  });

  factory FrameResolution.fromJson(Map<String, dynamic> json) {
    return FrameResolution(
      frameHeight: json['frameHeight'] as int,
      frameWidth: json['frameWidth'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final frameHeight = this.frameHeight;
    final frameWidth = this.frameWidth;
    return {
      'frameHeight': frameHeight,
      'frameWidth': frameWidth,
    };
  }
}

/// The settings for a gateway, including its networks.
class Gateway {
  /// The range of IP addresses that contribute content or initiate output
  /// requests for flows communicating with this gateway. These IP addresses
  /// should be in the form of a Classless Inter-Domain Routing (CIDR) block; for
  /// example, 10.0.0.0/16.
  final List<String> egressCidrBlocks;

  /// The Amazon Resource Name (ARN) of the gateway.
  final String gatewayArn;

  /// The name of the gateway. This name can not be modified after the gateway is
  /// created.
  final String name;

  /// The list of networks in the gateway.
  final List<GatewayNetwork> networks;
  final List<MessageDetail>? gatewayMessages;

  /// The current status of the gateway.
  final GatewayState? gatewayState;

  Gateway({
    required this.egressCidrBlocks,
    required this.gatewayArn,
    required this.name,
    required this.networks,
    this.gatewayMessages,
    this.gatewayState,
  });

  factory Gateway.fromJson(Map<String, dynamic> json) {
    return Gateway(
      egressCidrBlocks: (json['egressCidrBlocks'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      gatewayArn: json['gatewayArn'] as String,
      name: json['name'] as String,
      networks: (json['networks'] as List)
          .whereNotNull()
          .map((e) => GatewayNetwork.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatewayMessages: (json['gatewayMessages'] as List?)
          ?.whereNotNull()
          .map((e) => MessageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatewayState: (json['gatewayState'] as String?)?.toGatewayState(),
    );
  }

  Map<String, dynamic> toJson() {
    final egressCidrBlocks = this.egressCidrBlocks;
    final gatewayArn = this.gatewayArn;
    final name = this.name;
    final networks = this.networks;
    final gatewayMessages = this.gatewayMessages;
    final gatewayState = this.gatewayState;
    return {
      'egressCidrBlocks': egressCidrBlocks,
      'gatewayArn': gatewayArn,
      'name': name,
      'networks': networks,
      if (gatewayMessages != null) 'gatewayMessages': gatewayMessages,
      if (gatewayState != null) 'gatewayState': gatewayState.toValue(),
    };
  }
}

/// The source configuration for cloud flows receiving a stream from a bridge.
class GatewayBridgeSource {
  /// The ARN of the bridge feeding this flow.
  final String bridgeArn;

  /// The name of the VPC interface attachment to use for this bridge source.
  final VpcInterfaceAttachment? vpcInterfaceAttachment;

  GatewayBridgeSource({
    required this.bridgeArn,
    this.vpcInterfaceAttachment,
  });

  factory GatewayBridgeSource.fromJson(Map<String, dynamic> json) {
    return GatewayBridgeSource(
      bridgeArn: json['bridgeArn'] as String,
      vpcInterfaceAttachment: json['vpcInterfaceAttachment'] != null
          ? VpcInterfaceAttachment.fromJson(
              json['vpcInterfaceAttachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final vpcInterfaceAttachment = this.vpcInterfaceAttachment;
    return {
      'bridgeArn': bridgeArn,
      if (vpcInterfaceAttachment != null)
        'vpcInterfaceAttachment': vpcInterfaceAttachment,
    };
  }
}

/// The settings for an instance in a gateway.
class GatewayInstance {
  /// The availability of the instance to host new bridges. The bridgePlacement
  /// property can be LOCKED or AVAILABLE. If it is LOCKED, no new bridges can be
  /// deployed to this instance. If it is AVAILABLE, new bridges can be added to
  /// this instance.
  final BridgePlacement bridgePlacement;

  /// The connection state of the instance.
  final ConnectionStatus connectionStatus;

  /// The Amazon Resource Name (ARN) of the instance.
  final String gatewayArn;

  /// The Amazon Resource Name (ARN) of the gateway.
  final String gatewayInstanceArn;

  /// The managed instance ID generated by the SSM install. This will begin with
  /// "mi-".
  final String instanceId;

  /// The status of the instance.
  final InstanceState instanceState;

  /// The running bridge count.
  final int runningBridgeCount;
  final List<MessageDetail>? instanceMessages;

  GatewayInstance({
    required this.bridgePlacement,
    required this.connectionStatus,
    required this.gatewayArn,
    required this.gatewayInstanceArn,
    required this.instanceId,
    required this.instanceState,
    required this.runningBridgeCount,
    this.instanceMessages,
  });

  factory GatewayInstance.fromJson(Map<String, dynamic> json) {
    return GatewayInstance(
      bridgePlacement: (json['bridgePlacement'] as String).toBridgePlacement(),
      connectionStatus:
          (json['connectionStatus'] as String).toConnectionStatus(),
      gatewayArn: json['gatewayArn'] as String,
      gatewayInstanceArn: json['gatewayInstanceArn'] as String,
      instanceId: json['instanceId'] as String,
      instanceState: (json['instanceState'] as String).toInstanceState(),
      runningBridgeCount: json['runningBridgeCount'] as int,
      instanceMessages: (json['instanceMessages'] as List?)
          ?.whereNotNull()
          .map((e) => MessageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bridgePlacement = this.bridgePlacement;
    final connectionStatus = this.connectionStatus;
    final gatewayArn = this.gatewayArn;
    final gatewayInstanceArn = this.gatewayInstanceArn;
    final instanceId = this.instanceId;
    final instanceState = this.instanceState;
    final runningBridgeCount = this.runningBridgeCount;
    final instanceMessages = this.instanceMessages;
    return {
      'bridgePlacement': bridgePlacement.toValue(),
      'connectionStatus': connectionStatus.toValue(),
      'gatewayArn': gatewayArn,
      'gatewayInstanceArn': gatewayInstanceArn,
      'instanceId': instanceId,
      'instanceState': instanceState.toValue(),
      'runningBridgeCount': runningBridgeCount,
      if (instanceMessages != null) 'instanceMessages': instanceMessages,
    };
  }
}

/// The network settings for a gateway.
class GatewayNetwork {
  /// A unique IP address range to use for this network. These IP addresses should
  /// be in the form of a Classless Inter-Domain Routing (CIDR) block; for
  /// example, 10.0.0.0/16.
  final String cidrBlock;

  /// The name of the network. This name is used to reference the network and must
  /// be unique among networks in this gateway.
  final String name;

  GatewayNetwork({
    required this.cidrBlock,
    required this.name,
  });

  factory GatewayNetwork.fromJson(Map<String, dynamic> json) {
    return GatewayNetwork(
      cidrBlock: json['cidrBlock'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final cidrBlock = this.cidrBlock;
    final name = this.name;
    return {
      'cidrBlock': cidrBlock,
      'name': name,
    };
  }
}

enum GatewayState {
  creating,
  active,
  updating,
  error,
  deleting,
  deleted,
}

extension GatewayStateValueExtension on GatewayState {
  String toValue() {
    switch (this) {
      case GatewayState.creating:
        return 'CREATING';
      case GatewayState.active:
        return 'ACTIVE';
      case GatewayState.updating:
        return 'UPDATING';
      case GatewayState.error:
        return 'ERROR';
      case GatewayState.deleting:
        return 'DELETING';
      case GatewayState.deleted:
        return 'DELETED';
    }
  }
}

extension GatewayStateFromString on String {
  GatewayState toGatewayState() {
    switch (this) {
      case 'CREATING':
        return GatewayState.creating;
      case 'ACTIVE':
        return GatewayState.active;
      case 'UPDATING':
        return GatewayState.updating;
      case 'ERROR':
        return GatewayState.error;
      case 'DELETING':
        return GatewayState.deleting;
      case 'DELETED':
        return GatewayState.deleted;
    }
    throw Exception('$this is not known in enum GatewayState');
  }
}

/// The entitlements that you want to grant on a flow.
class GrantEntitlementRequest {
  /// The AWS account IDs that you want to share your content with. The receiving
  /// accounts (subscribers) will be allowed to create their own flows using your
  /// content as the source.
  final List<String> subscribers;

  /// Percentage from 0-100 of the data transfer cost to be billed to the
  /// subscriber.
  final int? dataTransferSubscriberFeePercent;

  /// A description of the entitlement. This description appears only on the AWS
  /// Elemental MediaConnect console and will not be seen by the subscriber or end
  /// user.
  final String? description;

  /// The type of encryption that will be used on the output that is associated
  /// with this entitlement. Allowable encryption types: static-key, speke.
  final Encryption? encryption;

  /// An indication of whether the new entitlement should be enabled or disabled
  /// as soon as it is created. If you don’t specify the entitlementStatus field
  /// in your request, MediaConnect sets it to ENABLED.
  final EntitlementStatus? entitlementStatus;

  /// The name of the entitlement. This value must be unique within the current
  /// flow.
  final String? name;

  GrantEntitlementRequest({
    required this.subscribers,
    this.dataTransferSubscriberFeePercent,
    this.description,
    this.encryption,
    this.entitlementStatus,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final subscribers = this.subscribers;
    final dataTransferSubscriberFeePercent =
        this.dataTransferSubscriberFeePercent;
    final description = this.description;
    final encryption = this.encryption;
    final entitlementStatus = this.entitlementStatus;
    final name = this.name;
    return {
      'subscribers': subscribers,
      if (dataTransferSubscriberFeePercent != null)
        'dataTransferSubscriberFeePercent': dataTransferSubscriberFeePercent,
      if (description != null) 'description': description,
      if (encryption != null) 'encryption': encryption,
      if (entitlementStatus != null)
        'entitlementStatus': entitlementStatus.toValue(),
      if (name != null) 'name': name,
    };
  }
}

class GrantFlowEntitlementsResponse {
  /// The entitlements that were just granted.
  final List<Entitlement>? entitlements;

  /// The ARN of the flow that these entitlements were granted to.
  final String? flowArn;

  GrantFlowEntitlementsResponse({
    this.entitlements,
    this.flowArn,
  });

  factory GrantFlowEntitlementsResponse.fromJson(Map<String, dynamic> json) {
    return GrantFlowEntitlementsResponse(
      entitlements: (json['entitlements'] as List?)
          ?.whereNotNull()
          .map((e) => Entitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
      flowArn: json['flowArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitlements = this.entitlements;
    final flowArn = this.flowArn;
    return {
      if (entitlements != null) 'entitlements': entitlements,
      if (flowArn != null) 'flowArn': flowArn,
    };
  }
}

class IngressGatewayBridge {
  /// The maximum expected bitrate (in bps) of the ingress bridge.
  final int maxBitrate;

  /// The maximum number of outputs on the ingress bridge.
  final int maxOutputs;

  /// The ID of the instance running this bridge.
  final String? instanceId;

  IngressGatewayBridge({
    required this.maxBitrate,
    required this.maxOutputs,
    this.instanceId,
  });

  factory IngressGatewayBridge.fromJson(Map<String, dynamic> json) {
    return IngressGatewayBridge(
      maxBitrate: json['maxBitrate'] as int,
      maxOutputs: json['maxOutputs'] as int,
      instanceId: json['instanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxBitrate = this.maxBitrate;
    final maxOutputs = this.maxOutputs;
    final instanceId = this.instanceId;
    return {
      'maxBitrate': maxBitrate,
      'maxOutputs': maxOutputs,
      if (instanceId != null) 'instanceId': instanceId,
    };
  }
}

/// The transport parameters that are associated with an incoming media stream.
class InputConfiguration {
  /// The IP address that the flow listens on for incoming content for a media
  /// stream.
  final String inputIp;

  /// The port that the flow listens on for an incoming media stream.
  final int inputPort;

  /// The VPC interface where the media stream comes in from.
  final Interface interface;

  InputConfiguration({
    required this.inputIp,
    required this.inputPort,
    required this.interface,
  });

  factory InputConfiguration.fromJson(Map<String, dynamic> json) {
    return InputConfiguration(
      inputIp: json['inputIp'] as String,
      inputPort: json['inputPort'] as int,
      interface: Interface.fromJson(json['interface'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final inputIp = this.inputIp;
    final inputPort = this.inputPort;
    final interface = this.interface;
    return {
      'inputIp': inputIp,
      'inputPort': inputPort,
      'interface': interface,
    };
  }
}

/// The transport parameters that you want to associate with an incoming media
/// stream.
class InputConfigurationRequest {
  /// The port that you want the flow to listen on for an incoming media stream.
  final int inputPort;

  /// The VPC interface that you want to use for the incoming media stream.
  final InterfaceRequest interface;

  InputConfigurationRequest({
    required this.inputPort,
    required this.interface,
  });

  Map<String, dynamic> toJson() {
    final inputPort = this.inputPort;
    final interface = this.interface;
    return {
      'inputPort': inputPort,
      'interface': interface,
    };
  }
}

enum InstanceState {
  registering,
  active,
  deregistering,
  deregistered,
  registrationError,
  deregistrationError,
}

extension InstanceStateValueExtension on InstanceState {
  String toValue() {
    switch (this) {
      case InstanceState.registering:
        return 'REGISTERING';
      case InstanceState.active:
        return 'ACTIVE';
      case InstanceState.deregistering:
        return 'DEREGISTERING';
      case InstanceState.deregistered:
        return 'DEREGISTERED';
      case InstanceState.registrationError:
        return 'REGISTRATION_ERROR';
      case InstanceState.deregistrationError:
        return 'DEREGISTRATION_ERROR';
    }
  }
}

extension InstanceStateFromString on String {
  InstanceState toInstanceState() {
    switch (this) {
      case 'REGISTERING':
        return InstanceState.registering;
      case 'ACTIVE':
        return InstanceState.active;
      case 'DEREGISTERING':
        return InstanceState.deregistering;
      case 'DEREGISTERED':
        return InstanceState.deregistered;
      case 'REGISTRATION_ERROR':
        return InstanceState.registrationError;
      case 'DEREGISTRATION_ERROR':
        return InstanceState.deregistrationError;
    }
    throw Exception('$this is not known in enum InstanceState');
  }
}

/// The VPC interface that is used for the media stream associated with the
/// source or output.
class Interface {
  /// The name of the VPC interface.
  final String name;

  Interface({
    required this.name,
  });

  factory Interface.fromJson(Map<String, dynamic> json) {
    return Interface(
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// The VPC interface that you want to designate where the media stream is
/// coming from or going to.
class InterfaceRequest {
  /// The name of the VPC interface.
  final String name;

  InterfaceRequest({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

enum KeyType {
  speke,
  staticKey,
  srtPassword,
}

extension KeyTypeValueExtension on KeyType {
  String toValue() {
    switch (this) {
      case KeyType.speke:
        return 'speke';
      case KeyType.staticKey:
        return 'static-key';
      case KeyType.srtPassword:
        return 'srt-password';
    }
  }
}

extension KeyTypeFromString on String {
  KeyType toKeyType() {
    switch (this) {
      case 'speke':
        return KeyType.speke;
      case 'static-key':
        return KeyType.staticKey;
      case 'srt-password':
        return KeyType.srtPassword;
    }
    throw Exception('$this is not known in enum KeyType');
  }
}

class ListBridgesResponse {
  /// A list of bridge summaries.
  final List<ListedBridge>? bridges;

  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListBridges request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken value.
  /// To see the next batch of results, you can submit the ListBridges request a
  /// second time and specify the NextToken value.
  final String? nextToken;

  ListBridgesResponse({
    this.bridges,
    this.nextToken,
  });

  factory ListBridgesResponse.fromJson(Map<String, dynamic> json) {
    return ListBridgesResponse(
      bridges: (json['bridges'] as List?)
          ?.whereNotNull()
          .map((e) => ListedBridge.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bridges = this.bridges;
    final nextToken = this.nextToken;
    return {
      if (bridges != null) 'bridges': bridges,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEntitlementsResponse {
  /// A list of entitlements that have been granted to you from other AWS
  /// accounts.
  final List<ListedEntitlement>? entitlements;

  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListEntitlements request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken value.
  /// To see the next batch of results, you can submit the ListEntitlements
  /// request a second time and specify the NextToken value.
  final String? nextToken;

  ListEntitlementsResponse({
    this.entitlements,
    this.nextToken,
  });

  factory ListEntitlementsResponse.fromJson(Map<String, dynamic> json) {
    return ListEntitlementsResponse(
      entitlements: (json['entitlements'] as List?)
          ?.whereNotNull()
          .map((e) => ListedEntitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitlements = this.entitlements;
    final nextToken = this.nextToken;
    return {
      if (entitlements != null) 'entitlements': entitlements,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFlowsResponse {
  /// A list of flow summaries.
  final List<ListedFlow>? flows;

  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListFlows request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken value.
  /// To see the next batch of results, you can submit the ListFlows request a
  /// second time and specify the NextToken value.
  final String? nextToken;

  ListFlowsResponse({
    this.flows,
    this.nextToken,
  });

  factory ListFlowsResponse.fromJson(Map<String, dynamic> json) {
    return ListFlowsResponse(
      flows: (json['flows'] as List?)
          ?.whereNotNull()
          .map((e) => ListedFlow.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flows = this.flows;
    final nextToken = this.nextToken;
    return {
      if (flows != null) 'flows': flows,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListGatewayInstancesResponse {
  /// A list of instance summaries.
  final List<ListedGatewayInstance>? instances;

  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListInstances request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken value.
  /// To see the next batch of results, you can submit the ListInstances request a
  /// second time and specify the NextToken value.
  final String? nextToken;

  ListGatewayInstancesResponse({
    this.instances,
    this.nextToken,
  });

  factory ListGatewayInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListGatewayInstancesResponse(
      instances: (json['instances'] as List?)
          ?.whereNotNull()
          .map((e) => ListedGatewayInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    final nextToken = this.nextToken;
    return {
      if (instances != null) 'instances': instances,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListGatewaysResponse {
  /// A list of gateway summaries.
  final List<ListedGateway>? gateways;

  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListGateways request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken value.
  /// To see the next batch of results, you can submit the ListGateways request a
  /// second time and specify the NextToken value.
  final String? nextToken;

  ListGatewaysResponse({
    this.gateways,
    this.nextToken,
  });

  factory ListGatewaysResponse.fromJson(Map<String, dynamic> json) {
    return ListGatewaysResponse(
      gateways: (json['gateways'] as List?)
          ?.whereNotNull()
          .map((e) => ListedGateway.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gateways = this.gateways;
    final nextToken = this.nextToken;
    return {
      if (gateways != null) 'gateways': gateways,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListOfferingsResponse {
  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListOfferings request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken value.
  /// To see the next batch of results, you can submit the ListOfferings request a
  /// second time and specify the NextToken value.
  final String? nextToken;

  /// A list of offerings that are available to this account in the current AWS
  /// Region.
  final List<Offering>? offerings;

  ListOfferingsResponse({
    this.nextToken,
    this.offerings,
  });

  factory ListOfferingsResponse.fromJson(Map<String, dynamic> json) {
    return ListOfferingsResponse(
      nextToken: json['nextToken'] as String?,
      offerings: (json['offerings'] as List?)
          ?.whereNotNull()
          .map((e) => Offering.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final offerings = this.offerings;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (offerings != null) 'offerings': offerings,
    };
  }
}

class ListReservationsResponse {
  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListReservations request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken value.
  /// To see the next batch of results, you can submit the ListReservations
  /// request a second time and specify the NextToken value.
  final String? nextToken;

  /// A list of all reservations that have been purchased by this account in the
  /// current AWS Region.
  final List<Reservation>? reservations;

  ListReservationsResponse({
    this.nextToken,
    this.reservations,
  });

  factory ListReservationsResponse.fromJson(Map<String, dynamic> json) {
    return ListReservationsResponse(
      nextToken: json['nextToken'] as String?,
      reservations: (json['reservations'] as List?)
          ?.whereNotNull()
          .map((e) => Reservation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reservations = this.reservations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (reservations != null) 'reservations': reservations,
    };
  }
}

class ListTagsForResourceResponse {
  /// A map from tag keys to values. Tag keys can have a maximum character length
  /// of 128 characters, and tag values can have a maximum length of 256
  /// characters.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
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

/// Displays details of the selected bridge.
class ListedBridge {
  /// The ARN of the bridge.
  final String bridgeArn;
  final BridgeState bridgeState;

  /// The type of the bridge.
  final String bridgeType;

  /// The name of the bridge.
  final String name;

  /// The ARN of the gateway associated with the bridge.
  final String placementArn;

  ListedBridge({
    required this.bridgeArn,
    required this.bridgeState,
    required this.bridgeType,
    required this.name,
    required this.placementArn,
  });

  factory ListedBridge.fromJson(Map<String, dynamic> json) {
    return ListedBridge(
      bridgeArn: json['bridgeArn'] as String,
      bridgeState: (json['bridgeState'] as String).toBridgeState(),
      bridgeType: json['bridgeType'] as String,
      name: json['name'] as String,
      placementArn: json['placementArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final bridgeState = this.bridgeState;
    final bridgeType = this.bridgeType;
    final name = this.name;
    final placementArn = this.placementArn;
    return {
      'bridgeArn': bridgeArn,
      'bridgeState': bridgeState.toValue(),
      'bridgeType': bridgeType,
      'name': name,
      'placementArn': placementArn,
    };
  }
}

/// An entitlement that has been granted to you from other AWS accounts.
class ListedEntitlement {
  /// The ARN of the entitlement.
  final String entitlementArn;

  /// The name of the entitlement.
  final String entitlementName;

  /// Percentage from 0-100 of the data transfer cost to be billed to the
  /// subscriber.
  final int? dataTransferSubscriberFeePercent;

  ListedEntitlement({
    required this.entitlementArn,
    required this.entitlementName,
    this.dataTransferSubscriberFeePercent,
  });

  factory ListedEntitlement.fromJson(Map<String, dynamic> json) {
    return ListedEntitlement(
      entitlementArn: json['entitlementArn'] as String,
      entitlementName: json['entitlementName'] as String,
      dataTransferSubscriberFeePercent:
          json['dataTransferSubscriberFeePercent'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitlementArn = this.entitlementArn;
    final entitlementName = this.entitlementName;
    final dataTransferSubscriberFeePercent =
        this.dataTransferSubscriberFeePercent;
    return {
      'entitlementArn': entitlementArn,
      'entitlementName': entitlementName,
      if (dataTransferSubscriberFeePercent != null)
        'dataTransferSubscriberFeePercent': dataTransferSubscriberFeePercent,
    };
  }
}

/// Provides a summary of a flow, including its ARN, Availability Zone, and
/// source type.
class ListedFlow {
  /// The Availability Zone that the flow was created in.
  final String availabilityZone;

  /// A description of the flow.
  final String description;

  /// The ARN of the flow.
  final String flowArn;

  /// The name of the flow.
  final String name;

  /// The type of source. This value is either owned (originated somewhere other
  /// than an AWS Elemental MediaConnect flow owned by another AWS account) or
  /// entitled (originated at an AWS Elemental MediaConnect flow owned by another
  /// AWS account).
  final SourceType sourceType;

  /// The current status of the flow.
  final Status status;
  final Maintenance? maintenance;

  ListedFlow({
    required this.availabilityZone,
    required this.description,
    required this.flowArn,
    required this.name,
    required this.sourceType,
    required this.status,
    this.maintenance,
  });

  factory ListedFlow.fromJson(Map<String, dynamic> json) {
    return ListedFlow(
      availabilityZone: json['availabilityZone'] as String,
      description: json['description'] as String,
      flowArn: json['flowArn'] as String,
      name: json['name'] as String,
      sourceType: (json['sourceType'] as String).toSourceType(),
      status: (json['status'] as String).toStatus(),
      maintenance: json['maintenance'] != null
          ? Maintenance.fromJson(json['maintenance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final description = this.description;
    final flowArn = this.flowArn;
    final name = this.name;
    final sourceType = this.sourceType;
    final status = this.status;
    final maintenance = this.maintenance;
    return {
      'availabilityZone': availabilityZone,
      'description': description,
      'flowArn': flowArn,
      'name': name,
      'sourceType': sourceType.toValue(),
      'status': status.toValue(),
      if (maintenance != null) 'maintenance': maintenance,
    };
  }
}

/// Provides a summary of a gateway, including its name, ARN, and status.
class ListedGateway {
  /// The Amazon Resource Name (ARN) of the gateway.
  final String gatewayArn;
  final GatewayState gatewayState;

  /// The name of the gateway.
  final String name;

  ListedGateway({
    required this.gatewayArn,
    required this.gatewayState,
    required this.name,
  });

  factory ListedGateway.fromJson(Map<String, dynamic> json) {
    return ListedGateway(
      gatewayArn: json['gatewayArn'] as String,
      gatewayState: (json['gatewayState'] as String).toGatewayState(),
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    final gatewayState = this.gatewayState;
    final name = this.name;
    return {
      'gatewayArn': gatewayArn,
      'gatewayState': gatewayState.toValue(),
      'name': name,
    };
  }
}

/// Provides a summary of an instance.
class ListedGatewayInstance {
  /// The Amazon Resource Name (ARN) of the gateway.
  final String gatewayArn;

  /// The Amazon Resource Name (ARN) of the instance.
  final String gatewayInstanceArn;

  /// The managed instance ID generated by the SSM install. This will begin with
  /// "mi-".
  final String instanceId;

  /// The status of the instance.
  final InstanceState? instanceState;

  ListedGatewayInstance({
    required this.gatewayArn,
    required this.gatewayInstanceArn,
    required this.instanceId,
    this.instanceState,
  });

  factory ListedGatewayInstance.fromJson(Map<String, dynamic> json) {
    return ListedGatewayInstance(
      gatewayArn: json['gatewayArn'] as String,
      gatewayInstanceArn: json['gatewayInstanceArn'] as String,
      instanceId: json['instanceId'] as String,
      instanceState: (json['instanceState'] as String?)?.toInstanceState(),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    final gatewayInstanceArn = this.gatewayInstanceArn;
    final instanceId = this.instanceId;
    final instanceState = this.instanceState;
    return {
      'gatewayArn': gatewayArn,
      'gatewayInstanceArn': gatewayInstanceArn,
      'instanceId': instanceId,
      if (instanceState != null) 'instanceState': instanceState.toValue(),
    };
  }
}

/// The maintenance setting of a flow
class Maintenance {
  /// A day of a week when the maintenance will happen. Use
  /// Monday/Tuesday/Wednesday/Thursday/Friday/Saturday/Sunday.
  final MaintenanceDay? maintenanceDay;

  /// The Maintenance has to be performed before this deadline in ISO UTC format.
  /// Example: 2021-01-30T08:30:00Z.
  final String? maintenanceDeadline;

  /// A scheduled date in ISO UTC format when the maintenance will happen. Use
  /// YYYY-MM-DD format. Example: 2021-01-30.
  final String? maintenanceScheduledDate;

  /// UTC time when the maintenance will happen. Use 24-hour HH:MM format. Minutes
  /// must be 00. Example: 13:00. The default value is 02:00.
  final String? maintenanceStartHour;

  Maintenance({
    this.maintenanceDay,
    this.maintenanceDeadline,
    this.maintenanceScheduledDate,
    this.maintenanceStartHour,
  });

  factory Maintenance.fromJson(Map<String, dynamic> json) {
    return Maintenance(
      maintenanceDay: (json['maintenanceDay'] as String?)?.toMaintenanceDay(),
      maintenanceDeadline: json['maintenanceDeadline'] as String?,
      maintenanceScheduledDate: json['maintenanceScheduledDate'] as String?,
      maintenanceStartHour: json['maintenanceStartHour'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final maintenanceDay = this.maintenanceDay;
    final maintenanceDeadline = this.maintenanceDeadline;
    final maintenanceScheduledDate = this.maintenanceScheduledDate;
    final maintenanceStartHour = this.maintenanceStartHour;
    return {
      if (maintenanceDay != null) 'maintenanceDay': maintenanceDay.toValue(),
      if (maintenanceDeadline != null)
        'maintenanceDeadline': maintenanceDeadline,
      if (maintenanceScheduledDate != null)
        'maintenanceScheduledDate': maintenanceScheduledDate,
      if (maintenanceStartHour != null)
        'maintenanceStartHour': maintenanceStartHour,
    };
  }
}

enum MaintenanceDay {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension MaintenanceDayValueExtension on MaintenanceDay {
  String toValue() {
    switch (this) {
      case MaintenanceDay.monday:
        return 'Monday';
      case MaintenanceDay.tuesday:
        return 'Tuesday';
      case MaintenanceDay.wednesday:
        return 'Wednesday';
      case MaintenanceDay.thursday:
        return 'Thursday';
      case MaintenanceDay.friday:
        return 'Friday';
      case MaintenanceDay.saturday:
        return 'Saturday';
      case MaintenanceDay.sunday:
        return 'Sunday';
    }
  }
}

extension MaintenanceDayFromString on String {
  MaintenanceDay toMaintenanceDay() {
    switch (this) {
      case 'Monday':
        return MaintenanceDay.monday;
      case 'Tuesday':
        return MaintenanceDay.tuesday;
      case 'Wednesday':
        return MaintenanceDay.wednesday;
      case 'Thursday':
        return MaintenanceDay.thursday;
      case 'Friday':
        return MaintenanceDay.friday;
      case 'Saturday':
        return MaintenanceDay.saturday;
      case 'Sunday':
        return MaintenanceDay.sunday;
    }
    throw Exception('$this is not known in enum MaintenanceDay');
  }
}

/// A single track or stream of media that contains video, audio, or ancillary
/// data. After you add a media stream to a flow, you can associate it with
/// sources and outputs on that flow, as long as they use the CDI protocol or
/// the ST 2110 JPEG XS protocol. Each source or output can consist of one or
/// many media streams.
class MediaStream {
  /// The format type number (sometimes referred to as RTP payload type) of the
  /// media stream. MediaConnect assigns this value to the media stream. For ST
  /// 2110 JPEG XS outputs, you need to provide this value to the receiver.
  final int fmt;

  /// A unique identifier for the media stream.
  final int mediaStreamId;

  /// A name that helps you distinguish one media stream from another.
  final String mediaStreamName;

  /// The type of media stream.
  final MediaStreamType mediaStreamType;

  /// Attributes that are related to the media stream.
  final MediaStreamAttributes? attributes;

  /// The sample rate for the stream. This value is measured in Hz.
  final int? clockRate;

  /// A description that can help you quickly identify what your media stream is
  /// used for.
  final String? description;

  /// The resolution of the video.
  final String? videoFormat;

  MediaStream({
    required this.fmt,
    required this.mediaStreamId,
    required this.mediaStreamName,
    required this.mediaStreamType,
    this.attributes,
    this.clockRate,
    this.description,
    this.videoFormat,
  });

  factory MediaStream.fromJson(Map<String, dynamic> json) {
    return MediaStream(
      fmt: json['fmt'] as int,
      mediaStreamId: json['mediaStreamId'] as int,
      mediaStreamName: json['mediaStreamName'] as String,
      mediaStreamType: (json['mediaStreamType'] as String).toMediaStreamType(),
      attributes: json['attributes'] != null
          ? MediaStreamAttributes.fromJson(
              json['attributes'] as Map<String, dynamic>)
          : null,
      clockRate: json['clockRate'] as int?,
      description: json['description'] as String?,
      videoFormat: json['videoFormat'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fmt = this.fmt;
    final mediaStreamId = this.mediaStreamId;
    final mediaStreamName = this.mediaStreamName;
    final mediaStreamType = this.mediaStreamType;
    final attributes = this.attributes;
    final clockRate = this.clockRate;
    final description = this.description;
    final videoFormat = this.videoFormat;
    return {
      'fmt': fmt,
      'mediaStreamId': mediaStreamId,
      'mediaStreamName': mediaStreamName,
      'mediaStreamType': mediaStreamType.toValue(),
      if (attributes != null) 'attributes': attributes,
      if (clockRate != null) 'clockRate': clockRate,
      if (description != null) 'description': description,
      if (videoFormat != null) 'videoFormat': videoFormat,
    };
  }
}

/// Attributes that are related to the media stream.
class MediaStreamAttributes {
  /// A set of parameters that define the media stream.
  final Fmtp fmtp;

  /// The audio language, in a format that is recognized by the receiver.
  final String? lang;

  MediaStreamAttributes({
    required this.fmtp,
    this.lang,
  });

  factory MediaStreamAttributes.fromJson(Map<String, dynamic> json) {
    return MediaStreamAttributes(
      fmtp: Fmtp.fromJson(json['fmtp'] as Map<String, dynamic>),
      lang: json['lang'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fmtp = this.fmtp;
    final lang = this.lang;
    return {
      'fmtp': fmtp,
      if (lang != null) 'lang': lang,
    };
  }
}

/// Attributes that are related to the media stream.
class MediaStreamAttributesRequest {
  /// The settings that you want to use to define the media stream.
  final FmtpRequest? fmtp;

  /// The audio language, in a format that is recognized by the receiver.
  final String? lang;

  MediaStreamAttributesRequest({
    this.fmtp,
    this.lang,
  });

  Map<String, dynamic> toJson() {
    final fmtp = this.fmtp;
    final lang = this.lang;
    return {
      if (fmtp != null) 'fmtp': fmtp,
      if (lang != null) 'lang': lang,
    };
  }
}

/// The media stream that is associated with the output, and the parameters for
/// that association.
class MediaStreamOutputConfiguration {
  /// The format that was used to encode the data. For ancillary data streams, set
  /// the encoding name to smpte291. For audio streams, set the encoding name to
  /// pcm. For video, 2110 streams, set the encoding name to raw. For video, JPEG
  /// XS streams, set the encoding name to jxsv.
  final EncodingName encodingName;

  /// The name of the media stream.
  final String mediaStreamName;

  /// The transport parameters that are associated with each outbound media
  /// stream.
  final List<DestinationConfiguration>? destinationConfigurations;

  /// Encoding parameters
  final EncodingParameters? encodingParameters;

  MediaStreamOutputConfiguration({
    required this.encodingName,
    required this.mediaStreamName,
    this.destinationConfigurations,
    this.encodingParameters,
  });

  factory MediaStreamOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return MediaStreamOutputConfiguration(
      encodingName: (json['encodingName'] as String).toEncodingName(),
      mediaStreamName: json['mediaStreamName'] as String,
      destinationConfigurations: (json['destinationConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DestinationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      encodingParameters: json['encodingParameters'] != null
          ? EncodingParameters.fromJson(
              json['encodingParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encodingName = this.encodingName;
    final mediaStreamName = this.mediaStreamName;
    final destinationConfigurations = this.destinationConfigurations;
    final encodingParameters = this.encodingParameters;
    return {
      'encodingName': encodingName.toValue(),
      'mediaStreamName': mediaStreamName,
      if (destinationConfigurations != null)
        'destinationConfigurations': destinationConfigurations,
      if (encodingParameters != null) 'encodingParameters': encodingParameters,
    };
  }
}

/// The media stream that you want to associate with the output, and the
/// parameters for that association.
class MediaStreamOutputConfigurationRequest {
  /// The format that will be used to encode the data. For ancillary data streams,
  /// set the encoding name to smpte291. For audio streams, set the encoding name
  /// to pcm. For video, 2110 streams, set the encoding name to raw. For video,
  /// JPEG XS streams, set the encoding name to jxsv.
  final EncodingName encodingName;

  /// The name of the media stream that is associated with the output.
  final String mediaStreamName;

  /// The transport parameters that you want to associate with the media stream.
  final List<DestinationConfigurationRequest>? destinationConfigurations;

  /// A collection of parameters that determine how MediaConnect will convert the
  /// content. These fields only apply to outputs on flows that have a CDI source.
  final EncodingParametersRequest? encodingParameters;

  MediaStreamOutputConfigurationRequest({
    required this.encodingName,
    required this.mediaStreamName,
    this.destinationConfigurations,
    this.encodingParameters,
  });

  Map<String, dynamic> toJson() {
    final encodingName = this.encodingName;
    final mediaStreamName = this.mediaStreamName;
    final destinationConfigurations = this.destinationConfigurations;
    final encodingParameters = this.encodingParameters;
    return {
      'encodingName': encodingName.toValue(),
      'mediaStreamName': mediaStreamName,
      if (destinationConfigurations != null)
        'destinationConfigurations': destinationConfigurations,
      if (encodingParameters != null) 'encodingParameters': encodingParameters,
    };
  }
}

/// The media stream that is associated with the source, and the parameters for
/// that association.
class MediaStreamSourceConfiguration {
  /// The format that was used to encode the data. For ancillary data streams, set
  /// the encoding name to smpte291. For audio streams, set the encoding name to
  /// pcm. For video, 2110 streams, set the encoding name to raw. For video, JPEG
  /// XS streams, set the encoding name to jxsv.
  final EncodingName encodingName;

  /// The name of the media stream.
  final String mediaStreamName;

  /// The transport parameters that are associated with an incoming media stream.
  final List<InputConfiguration>? inputConfigurations;

  MediaStreamSourceConfiguration({
    required this.encodingName,
    required this.mediaStreamName,
    this.inputConfigurations,
  });

  factory MediaStreamSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return MediaStreamSourceConfiguration(
      encodingName: (json['encodingName'] as String).toEncodingName(),
      mediaStreamName: json['mediaStreamName'] as String,
      inputConfigurations: (json['inputConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => InputConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final encodingName = this.encodingName;
    final mediaStreamName = this.mediaStreamName;
    final inputConfigurations = this.inputConfigurations;
    return {
      'encodingName': encodingName.toValue(),
      'mediaStreamName': mediaStreamName,
      if (inputConfigurations != null)
        'inputConfigurations': inputConfigurations,
    };
  }
}

/// The definition of a media stream that you want to associate with the source.
class MediaStreamSourceConfigurationRequest {
  /// The format you want to use to encode the data. For ancillary data streams,
  /// set the encoding name to smpte291. For audio streams, set the encoding name
  /// to pcm. For video, 2110 streams, set the encoding name to raw. For video,
  /// JPEG XS streams, set the encoding name to jxsv.
  final EncodingName encodingName;

  /// The name of the media stream.
  final String mediaStreamName;

  /// The transport parameters that you want to associate with the media stream.
  final List<InputConfigurationRequest>? inputConfigurations;

  MediaStreamSourceConfigurationRequest({
    required this.encodingName,
    required this.mediaStreamName,
    this.inputConfigurations,
  });

  Map<String, dynamic> toJson() {
    final encodingName = this.encodingName;
    final mediaStreamName = this.mediaStreamName;
    final inputConfigurations = this.inputConfigurations;
    return {
      'encodingName': encodingName.toValue(),
      'mediaStreamName': mediaStreamName,
      if (inputConfigurations != null)
        'inputConfigurations': inputConfigurations,
    };
  }
}

enum MediaStreamType {
  video,
  audio,
  ancillaryData,
}

extension MediaStreamTypeValueExtension on MediaStreamType {
  String toValue() {
    switch (this) {
      case MediaStreamType.video:
        return 'video';
      case MediaStreamType.audio:
        return 'audio';
      case MediaStreamType.ancillaryData:
        return 'ancillary-data';
    }
  }
}

extension MediaStreamTypeFromString on String {
  MediaStreamType toMediaStreamType() {
    switch (this) {
      case 'video':
        return MediaStreamType.video;
      case 'audio':
        return MediaStreamType.audio;
      case 'ancillary-data':
        return MediaStreamType.ancillaryData;
    }
    throw Exception('$this is not known in enum MediaStreamType');
  }
}

class MessageDetail {
  /// The error code.
  final String code;

  /// The specific error message that MediaConnect returns to help you understand
  /// the reason that the request did not succeed.
  final String message;

  /// The name of the resource.
  final String? resourceName;

  MessageDetail({
    required this.code,
    required this.message,
    this.resourceName,
  });

  factory MessageDetail.fromJson(Map<String, dynamic> json) {
    return MessageDetail(
      code: json['code'] as String,
      message: json['message'] as String,
      resourceName: json['resourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    final resourceName = this.resourceName;
    return {
      'code': code,
      'message': message,
      if (resourceName != null) 'resourceName': resourceName,
    };
  }
}

/// Messages that provide the state of the flow.
class Messages {
  /// A list of errors that might have been generated from processes on this flow.
  final List<String> errors;

  Messages({
    required this.errors,
  });

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'errors': errors,
    };
  }
}

enum NetworkInterfaceType {
  ena,
  efa,
}

extension NetworkInterfaceTypeValueExtension on NetworkInterfaceType {
  String toValue() {
    switch (this) {
      case NetworkInterfaceType.ena:
        return 'ena';
      case NetworkInterfaceType.efa:
        return 'efa';
    }
  }
}

extension NetworkInterfaceTypeFromString on String {
  NetworkInterfaceType toNetworkInterfaceType() {
    switch (this) {
      case 'ena':
        return NetworkInterfaceType.ena;
      case 'efa':
        return NetworkInterfaceType.efa;
    }
    throw Exception('$this is not known in enum NetworkInterfaceType');
  }
}

/// A savings plan that reserves a certain amount of outbound bandwidth usage at
/// a discounted rate each month over a period of time.
class Offering {
  /// The type of currency that is used for billing. The currencyCode used for all
  /// reservations is US dollars.
  final String currencyCode;

  /// The length of time that your reservation would be active.
  final int duration;

  /// The unit of measurement for the duration of the offering.
  final DurationUnits durationUnits;

  /// The Amazon Resource Name (ARN) that MediaConnect assigns to the offering.
  final String offeringArn;

  /// A description of the offering.
  final String offeringDescription;

  /// The cost of a single unit. This value, in combination with priceUnits, makes
  /// up the rate.
  final String pricePerUnit;

  /// The unit of measurement that is used for billing. This value, in combination
  /// with pricePerUnit, makes up the rate.
  final PriceUnits priceUnits;

  /// A definition of the amount of outbound bandwidth that you would be reserving
  /// if you purchase the offering.
  final ResourceSpecification resourceSpecification;

  Offering({
    required this.currencyCode,
    required this.duration,
    required this.durationUnits,
    required this.offeringArn,
    required this.offeringDescription,
    required this.pricePerUnit,
    required this.priceUnits,
    required this.resourceSpecification,
  });

  factory Offering.fromJson(Map<String, dynamic> json) {
    return Offering(
      currencyCode: json['currencyCode'] as String,
      duration: json['duration'] as int,
      durationUnits: (json['durationUnits'] as String).toDurationUnits(),
      offeringArn: json['offeringArn'] as String,
      offeringDescription: json['offeringDescription'] as String,
      pricePerUnit: json['pricePerUnit'] as String,
      priceUnits: (json['priceUnits'] as String).toPriceUnits(),
      resourceSpecification: ResourceSpecification.fromJson(
          json['resourceSpecification'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final durationUnits = this.durationUnits;
    final offeringArn = this.offeringArn;
    final offeringDescription = this.offeringDescription;
    final pricePerUnit = this.pricePerUnit;
    final priceUnits = this.priceUnits;
    final resourceSpecification = this.resourceSpecification;
    return {
      'currencyCode': currencyCode,
      'duration': duration,
      'durationUnits': durationUnits.toValue(),
      'offeringArn': offeringArn,
      'offeringDescription': offeringDescription,
      'pricePerUnit': pricePerUnit,
      'priceUnits': priceUnits.toValue(),
      'resourceSpecification': resourceSpecification,
    };
  }
}

/// The settings for an output.
class Output {
  /// The name of the output. This value must be unique within the current flow.
  final String name;

  /// The ARN of the output.
  final String outputArn;

  /// The ARN of the bridge that added this output.
  final String? bridgeArn;

  /// The bridge output ports currently in use.
  final List<int>? bridgePorts;

  /// Percentage from 0-100 of the data transfer cost to be billed to the
  /// subscriber.
  final int? dataTransferSubscriberFeePercent;

  /// A description of the output.
  final String? description;

  /// The address where you want to send the output.
  final String? destination;

  /// The type of key used for the encryption. If no keyType is provided, the
  /// service will use the default setting (static-key).
  final Encryption? encryption;

  /// The ARN of the entitlement on the originator''s flow. This value is relevant
  /// only on entitled flows.
  final String? entitlementArn;

  /// The IP address that the receiver requires in order to establish a connection
  /// with the flow. For public networking, the ListenerAddress is represented by
  /// the elastic IP address of the flow. For private networking, the
  /// ListenerAddress is represented by the elastic network interface IP address
  /// of the VPC. This field applies only to outputs that use the Zixi pull or SRT
  /// listener protocol.
  final String? listenerAddress;

  /// The input ARN of the AWS Elemental MediaLive channel. This parameter is
  /// relevant only for outputs that were added by creating a MediaLive input.
  final String? mediaLiveInputArn;

  /// The configuration for each media stream that is associated with the output.
  final List<MediaStreamOutputConfiguration>? mediaStreamOutputConfigurations;

  /// The port to use when content is distributed to this output.
  final int? port;

  /// Attributes related to the transport stream that are used in the output.
  final Transport? transport;

  /// The name of the VPC interface attachment to use for this output.
  final VpcInterfaceAttachment? vpcInterfaceAttachment;

  Output({
    required this.name,
    required this.outputArn,
    this.bridgeArn,
    this.bridgePorts,
    this.dataTransferSubscriberFeePercent,
    this.description,
    this.destination,
    this.encryption,
    this.entitlementArn,
    this.listenerAddress,
    this.mediaLiveInputArn,
    this.mediaStreamOutputConfigurations,
    this.port,
    this.transport,
    this.vpcInterfaceAttachment,
  });

  factory Output.fromJson(Map<String, dynamic> json) {
    return Output(
      name: json['name'] as String,
      outputArn: json['outputArn'] as String,
      bridgeArn: json['bridgeArn'] as String?,
      bridgePorts: (json['bridgePorts'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      dataTransferSubscriberFeePercent:
          json['dataTransferSubscriberFeePercent'] as int?,
      description: json['description'] as String?,
      destination: json['destination'] as String?,
      encryption: json['encryption'] != null
          ? Encryption.fromJson(json['encryption'] as Map<String, dynamic>)
          : null,
      entitlementArn: json['entitlementArn'] as String?,
      listenerAddress: json['listenerAddress'] as String?,
      mediaLiveInputArn: json['mediaLiveInputArn'] as String?,
      mediaStreamOutputConfigurations:
          (json['mediaStreamOutputConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => MediaStreamOutputConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      port: json['port'] as int?,
      transport: json['transport'] != null
          ? Transport.fromJson(json['transport'] as Map<String, dynamic>)
          : null,
      vpcInterfaceAttachment: json['vpcInterfaceAttachment'] != null
          ? VpcInterfaceAttachment.fromJson(
              json['vpcInterfaceAttachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final outputArn = this.outputArn;
    final bridgeArn = this.bridgeArn;
    final bridgePorts = this.bridgePorts;
    final dataTransferSubscriberFeePercent =
        this.dataTransferSubscriberFeePercent;
    final description = this.description;
    final destination = this.destination;
    final encryption = this.encryption;
    final entitlementArn = this.entitlementArn;
    final listenerAddress = this.listenerAddress;
    final mediaLiveInputArn = this.mediaLiveInputArn;
    final mediaStreamOutputConfigurations =
        this.mediaStreamOutputConfigurations;
    final port = this.port;
    final transport = this.transport;
    final vpcInterfaceAttachment = this.vpcInterfaceAttachment;
    return {
      'name': name,
      'outputArn': outputArn,
      if (bridgeArn != null) 'bridgeArn': bridgeArn,
      if (bridgePorts != null) 'bridgePorts': bridgePorts,
      if (dataTransferSubscriberFeePercent != null)
        'dataTransferSubscriberFeePercent': dataTransferSubscriberFeePercent,
      if (description != null) 'description': description,
      if (destination != null) 'destination': destination,
      if (encryption != null) 'encryption': encryption,
      if (entitlementArn != null) 'entitlementArn': entitlementArn,
      if (listenerAddress != null) 'listenerAddress': listenerAddress,
      if (mediaLiveInputArn != null) 'mediaLiveInputArn': mediaLiveInputArn,
      if (mediaStreamOutputConfigurations != null)
        'mediaStreamOutputConfigurations': mediaStreamOutputConfigurations,
      if (port != null) 'port': port,
      if (transport != null) 'transport': transport,
      if (vpcInterfaceAttachment != null)
        'vpcInterfaceAttachment': vpcInterfaceAttachment,
    };
  }
}

enum PriceUnits {
  hourly,
}

extension PriceUnitsValueExtension on PriceUnits {
  String toValue() {
    switch (this) {
      case PriceUnits.hourly:
        return 'HOURLY';
    }
  }
}

extension PriceUnitsFromString on String {
  PriceUnits toPriceUnits() {
    switch (this) {
      case 'HOURLY':
        return PriceUnits.hourly;
    }
    throw Exception('$this is not known in enum PriceUnits');
  }
}

enum Protocol {
  zixiPush,
  rtpFec,
  rtp,
  zixiPull,
  rist,
  st2110Jpegxs,
  cdi,
  srtListener,
  srtCaller,
  fujitsuQos,
  udp,
}

extension ProtocolValueExtension on Protocol {
  String toValue() {
    switch (this) {
      case Protocol.zixiPush:
        return 'zixi-push';
      case Protocol.rtpFec:
        return 'rtp-fec';
      case Protocol.rtp:
        return 'rtp';
      case Protocol.zixiPull:
        return 'zixi-pull';
      case Protocol.rist:
        return 'rist';
      case Protocol.st2110Jpegxs:
        return 'st2110-jpegxs';
      case Protocol.cdi:
        return 'cdi';
      case Protocol.srtListener:
        return 'srt-listener';
      case Protocol.srtCaller:
        return 'srt-caller';
      case Protocol.fujitsuQos:
        return 'fujitsu-qos';
      case Protocol.udp:
        return 'udp';
    }
  }
}

extension ProtocolFromString on String {
  Protocol toProtocol() {
    switch (this) {
      case 'zixi-push':
        return Protocol.zixiPush;
      case 'rtp-fec':
        return Protocol.rtpFec;
      case 'rtp':
        return Protocol.rtp;
      case 'zixi-pull':
        return Protocol.zixiPull;
      case 'rist':
        return Protocol.rist;
      case 'st2110-jpegxs':
        return Protocol.st2110Jpegxs;
      case 'cdi':
        return Protocol.cdi;
      case 'srt-listener':
        return Protocol.srtListener;
      case 'srt-caller':
        return Protocol.srtCaller;
      case 'fujitsu-qos':
        return Protocol.fujitsuQos;
      case 'udp':
        return Protocol.udp;
    }
    throw Exception('$this is not known in enum Protocol');
  }
}

class PurchaseOfferingResponse {
  final Reservation? reservation;

  PurchaseOfferingResponse({
    this.reservation,
  });

  factory PurchaseOfferingResponse.fromJson(Map<String, dynamic> json) {
    return PurchaseOfferingResponse(
      reservation: json['reservation'] != null
          ? Reservation.fromJson(json['reservation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reservation = this.reservation;
    return {
      if (reservation != null) 'reservation': reservation,
    };
  }
}

enum Range {
  narrow,
  full,
  fullprotect,
}

extension RangeValueExtension on Range {
  String toValue() {
    switch (this) {
      case Range.narrow:
        return 'NARROW';
      case Range.full:
        return 'FULL';
      case Range.fullprotect:
        return 'FULLPROTECT';
    }
  }
}

extension RangeFromString on String {
  Range toRange() {
    switch (this) {
      case 'NARROW':
        return Range.narrow;
      case 'FULL':
        return Range.full;
      case 'FULLPROTECT':
        return Range.fullprotect;
    }
    throw Exception('$this is not known in enum Range');
  }
}

class RemoveBridgeOutputResponse {
  final String? bridgeArn;
  final String? outputName;

  RemoveBridgeOutputResponse({
    this.bridgeArn,
    this.outputName,
  });

  factory RemoveBridgeOutputResponse.fromJson(Map<String, dynamic> json) {
    return RemoveBridgeOutputResponse(
      bridgeArn: json['bridgeArn'] as String?,
      outputName: json['outputName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final outputName = this.outputName;
    return {
      if (bridgeArn != null) 'bridgeArn': bridgeArn,
      if (outputName != null) 'outputName': outputName,
    };
  }
}

class RemoveBridgeSourceResponse {
  final String? bridgeArn;
  final String? sourceName;

  RemoveBridgeSourceResponse({
    this.bridgeArn,
    this.sourceName,
  });

  factory RemoveBridgeSourceResponse.fromJson(Map<String, dynamic> json) {
    return RemoveBridgeSourceResponse(
      bridgeArn: json['bridgeArn'] as String?,
      sourceName: json['sourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final sourceName = this.sourceName;
    return {
      if (bridgeArn != null) 'bridgeArn': bridgeArn,
      if (sourceName != null) 'sourceName': sourceName,
    };
  }
}

class RemoveFlowMediaStreamResponse {
  /// The Amazon Resource Name (ARN) of the flow.
  final String? flowArn;

  /// The name of the media stream that was removed.
  final String? mediaStreamName;

  RemoveFlowMediaStreamResponse({
    this.flowArn,
    this.mediaStreamName,
  });

  factory RemoveFlowMediaStreamResponse.fromJson(Map<String, dynamic> json) {
    return RemoveFlowMediaStreamResponse(
      flowArn: json['flowArn'] as String?,
      mediaStreamName: json['mediaStreamName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final mediaStreamName = this.mediaStreamName;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (mediaStreamName != null) 'mediaStreamName': mediaStreamName,
    };
  }
}

class RemoveFlowOutputResponse {
  /// The ARN of the flow that is associated with the output you removed.
  final String? flowArn;

  /// The ARN of the output that was removed.
  final String? outputArn;

  RemoveFlowOutputResponse({
    this.flowArn,
    this.outputArn,
  });

  factory RemoveFlowOutputResponse.fromJson(Map<String, dynamic> json) {
    return RemoveFlowOutputResponse(
      flowArn: json['flowArn'] as String?,
      outputArn: json['outputArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final outputArn = this.outputArn;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (outputArn != null) 'outputArn': outputArn,
    };
  }
}

class RemoveFlowSourceResponse {
  /// The ARN of the flow that is associated with the source you removed.
  final String? flowArn;

  /// The ARN of the source that was removed.
  final String? sourceArn;

  RemoveFlowSourceResponse({
    this.flowArn,
    this.sourceArn,
  });

  factory RemoveFlowSourceResponse.fromJson(Map<String, dynamic> json) {
    return RemoveFlowSourceResponse(
      flowArn: json['flowArn'] as String?,
      sourceArn: json['sourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final sourceArn = this.sourceArn;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (sourceArn != null) 'sourceArn': sourceArn,
    };
  }
}

class RemoveFlowVpcInterfaceResponse {
  /// The ARN of the flow that is associated with the VPC interface you removed.
  final String? flowArn;

  /// IDs of network interfaces associated with the removed VPC interface that
  /// Media Connect was unable to remove.
  final List<String>? nonDeletedNetworkInterfaceIds;

  /// The name of the VPC interface that was removed.
  final String? vpcInterfaceName;

  RemoveFlowVpcInterfaceResponse({
    this.flowArn,
    this.nonDeletedNetworkInterfaceIds,
    this.vpcInterfaceName,
  });

  factory RemoveFlowVpcInterfaceResponse.fromJson(Map<String, dynamic> json) {
    return RemoveFlowVpcInterfaceResponse(
      flowArn: json['flowArn'] as String?,
      nonDeletedNetworkInterfaceIds:
          (json['nonDeletedNetworkInterfaceIds'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      vpcInterfaceName: json['vpcInterfaceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final nonDeletedNetworkInterfaceIds = this.nonDeletedNetworkInterfaceIds;
    final vpcInterfaceName = this.vpcInterfaceName;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (nonDeletedNetworkInterfaceIds != null)
        'nonDeletedNetworkInterfaceIds': nonDeletedNetworkInterfaceIds,
      if (vpcInterfaceName != null) 'vpcInterfaceName': vpcInterfaceName,
    };
  }
}

/// A pricing agreement for a discounted rate for a specific outbound bandwidth
/// that your MediaConnect account will use each month over a specific time
/// period. The discounted rate in the reservation applies to outbound bandwidth
/// for all flows from your account until your account reaches the amount of
/// bandwidth in your reservation. If you use more outbound bandwidth than the
/// agreed upon amount in a single month, the overage is charged at the
/// on-demand rate.
class Reservation {
  /// The type of currency that is used for billing. The currencyCode used for
  /// your reservation is US dollars.
  final String currencyCode;

  /// The length of time that this reservation is active. MediaConnect defines
  /// this value in the offering.
  final int duration;

  /// The unit of measurement for the duration of the reservation. MediaConnect
  /// defines this value in the offering.
  final DurationUnits durationUnits;

  /// The day and time that this reservation expires. This value is calculated
  /// based on the start date and time that you set and the offering's duration.
  final String end;

  /// The Amazon Resource Name (ARN) that MediaConnect assigns to the offering.
  final String offeringArn;

  /// A description of the offering. MediaConnect defines this value in the
  /// offering.
  final String offeringDescription;

  /// The cost of a single unit. This value, in combination with priceUnits, makes
  /// up the rate. MediaConnect defines this value in the offering.
  final String pricePerUnit;

  /// The unit of measurement that is used for billing. This value, in combination
  /// with pricePerUnit, makes up the rate. MediaConnect defines this value in the
  /// offering.
  final PriceUnits priceUnits;

  /// The Amazon Resource Name (ARN) that MediaConnect assigns to the reservation
  /// when you purchase an offering.
  final String reservationArn;

  /// The name that you assigned to the reservation when you purchased the
  /// offering.
  final String reservationName;

  /// The status of your reservation.
  final ReservationState reservationState;

  /// A definition of the amount of outbound bandwidth that you would be reserving
  /// if you purchase the offering. MediaConnect defines the values that make up
  /// the resourceSpecification in the offering.
  final ResourceSpecification resourceSpecification;

  /// The day and time that the reservation becomes active. You set this value
  /// when you purchase the offering.
  final String start;

  Reservation({
    required this.currencyCode,
    required this.duration,
    required this.durationUnits,
    required this.end,
    required this.offeringArn,
    required this.offeringDescription,
    required this.pricePerUnit,
    required this.priceUnits,
    required this.reservationArn,
    required this.reservationName,
    required this.reservationState,
    required this.resourceSpecification,
    required this.start,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      currencyCode: json['currencyCode'] as String,
      duration: json['duration'] as int,
      durationUnits: (json['durationUnits'] as String).toDurationUnits(),
      end: json['end'] as String,
      offeringArn: json['offeringArn'] as String,
      offeringDescription: json['offeringDescription'] as String,
      pricePerUnit: json['pricePerUnit'] as String,
      priceUnits: (json['priceUnits'] as String).toPriceUnits(),
      reservationArn: json['reservationArn'] as String,
      reservationName: json['reservationName'] as String,
      reservationState:
          (json['reservationState'] as String).toReservationState(),
      resourceSpecification: ResourceSpecification.fromJson(
          json['resourceSpecification'] as Map<String, dynamic>),
      start: json['start'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final durationUnits = this.durationUnits;
    final end = this.end;
    final offeringArn = this.offeringArn;
    final offeringDescription = this.offeringDescription;
    final pricePerUnit = this.pricePerUnit;
    final priceUnits = this.priceUnits;
    final reservationArn = this.reservationArn;
    final reservationName = this.reservationName;
    final reservationState = this.reservationState;
    final resourceSpecification = this.resourceSpecification;
    final start = this.start;
    return {
      'currencyCode': currencyCode,
      'duration': duration,
      'durationUnits': durationUnits.toValue(),
      'end': end,
      'offeringArn': offeringArn,
      'offeringDescription': offeringDescription,
      'pricePerUnit': pricePerUnit,
      'priceUnits': priceUnits.toValue(),
      'reservationArn': reservationArn,
      'reservationName': reservationName,
      'reservationState': reservationState.toValue(),
      'resourceSpecification': resourceSpecification,
      'start': start,
    };
  }
}

enum ReservationState {
  active,
  expired,
  processing,
  canceled,
}

extension ReservationStateValueExtension on ReservationState {
  String toValue() {
    switch (this) {
      case ReservationState.active:
        return 'ACTIVE';
      case ReservationState.expired:
        return 'EXPIRED';
      case ReservationState.processing:
        return 'PROCESSING';
      case ReservationState.canceled:
        return 'CANCELED';
    }
  }
}

extension ReservationStateFromString on String {
  ReservationState toReservationState() {
    switch (this) {
      case 'ACTIVE':
        return ReservationState.active;
      case 'EXPIRED':
        return ReservationState.expired;
      case 'PROCESSING':
        return ReservationState.processing;
      case 'CANCELED':
        return ReservationState.canceled;
    }
    throw Exception('$this is not known in enum ReservationState');
  }
}

/// A definition of what is being billed for, including the type and amount.
class ResourceSpecification {
  /// The type of resource and the unit that is being billed for.
  final ResourceType resourceType;

  /// The amount of outbound bandwidth that is discounted in the offering.
  final int? reservedBitrate;

  ResourceSpecification({
    required this.resourceType,
    this.reservedBitrate,
  });

  factory ResourceSpecification.fromJson(Map<String, dynamic> json) {
    return ResourceSpecification(
      resourceType: (json['resourceType'] as String).toResourceType(),
      reservedBitrate: json['reservedBitrate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final reservedBitrate = this.reservedBitrate;
    return {
      'resourceType': resourceType.toValue(),
      if (reservedBitrate != null) 'reservedBitrate': reservedBitrate,
    };
  }
}

enum ResourceType {
  mbpsOutboundBandwidth,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.mbpsOutboundBandwidth:
        return 'Mbps_Outbound_Bandwidth';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'Mbps_Outbound_Bandwidth':
        return ResourceType.mbpsOutboundBandwidth;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

class RevokeFlowEntitlementResponse {
  /// The ARN of the entitlement that was revoked.
  final String? entitlementArn;

  /// The ARN of the flow that the entitlement was revoked from.
  final String? flowArn;

  RevokeFlowEntitlementResponse({
    this.entitlementArn,
    this.flowArn,
  });

  factory RevokeFlowEntitlementResponse.fromJson(Map<String, dynamic> json) {
    return RevokeFlowEntitlementResponse(
      entitlementArn: json['entitlementArn'] as String?,
      flowArn: json['flowArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitlementArn = this.entitlementArn;
    final flowArn = this.flowArn;
    return {
      if (entitlementArn != null) 'entitlementArn': entitlementArn,
      if (flowArn != null) 'flowArn': flowArn,
    };
  }
}

enum ScanMode {
  progressive,
  interlace,
  progressiveSegmentedFrame,
}

extension ScanModeValueExtension on ScanMode {
  String toValue() {
    switch (this) {
      case ScanMode.progressive:
        return 'progressive';
      case ScanMode.interlace:
        return 'interlace';
      case ScanMode.progressiveSegmentedFrame:
        return 'progressive-segmented-frame';
    }
  }
}

extension ScanModeFromString on String {
  ScanMode toScanMode() {
    switch (this) {
      case 'progressive':
        return ScanMode.progressive;
      case 'interlace':
        return ScanMode.interlace;
      case 'progressive-segmented-frame':
        return ScanMode.progressiveSegmentedFrame;
    }
    throw Exception('$this is not known in enum ScanMode');
  }
}

/// The source configuration for cloud flows receiving a stream from a bridge.
class SetGatewayBridgeSourceRequest {
  /// The ARN of the bridge feeding this flow.
  final String bridgeArn;

  /// The name of the VPC interface attachment to use for this bridge source.
  final VpcInterfaceAttachment? vpcInterfaceAttachment;

  SetGatewayBridgeSourceRequest({
    required this.bridgeArn,
    this.vpcInterfaceAttachment,
  });

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final vpcInterfaceAttachment = this.vpcInterfaceAttachment;
    return {
      'bridgeArn': bridgeArn,
      if (vpcInterfaceAttachment != null)
        'vpcInterfaceAttachment': vpcInterfaceAttachment,
    };
  }
}

/// The settings for the source of the flow.
class SetSourceRequest {
  /// The type of encryption that is used on the content ingested from this
  /// source. Allowable encryption types: static-key.
  final Encryption? decryption;

  /// A description for the source. This value is not used or seen outside of the
  /// current AWS Elemental MediaConnect account.
  final String? description;

  /// The ARN of the entitlement that allows you to subscribe to this flow. The
  /// entitlement is set by the flow originator, and the ARN is generated as part
  /// of the originator's flow.
  final String? entitlementArn;

  /// The source configuration for cloud flows receiving a stream from a bridge.
  final SetGatewayBridgeSourceRequest? gatewayBridgeSource;

  /// The port that the flow will be listening on for incoming content.
  final int? ingestPort;

  /// The smoothing max bitrate (in bps) for RIST, RTP, and RTP-FEC streams.
  final int? maxBitrate;

  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based, Zixi-based, and Fujitsu-based streams.
  final int? maxLatency;

  /// The size of the buffer (in milliseconds) to use to sync incoming source
  /// data.
  final int? maxSyncBuffer;

  /// The media streams that are associated with the source, and the parameters
  /// for those associations.
  final List<MediaStreamSourceConfigurationRequest>?
      mediaStreamSourceConfigurations;

  /// The minimum latency in milliseconds for SRT-based streams. In streams that
  /// use the SRT protocol, this value that you set on your MediaConnect source or
  /// output represents the minimal potential latency of that connection. The
  /// latency of the stream is set to the highest number between the sender’s
  /// minimum latency and the receiver’s minimum latency.
  final int? minLatency;

  /// The name of the source.
  final String? name;

  /// The protocol that is used by the source.
  final Protocol? protocol;

  /// The port that the flow uses to send outbound requests to initiate connection
  /// with the sender.
  final int? senderControlPort;

  /// The IP address that the flow communicates with to initiate connection with
  /// the sender.
  final String? senderIpAddress;

  /// Source IP or domain name for SRT-caller protocol.
  final String? sourceListenerAddress;

  /// Source port for SRT-caller protocol.
  final int? sourceListenerPort;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi and SRT caller-based streams.
  final String? streamId;

  /// The name of the VPC interface to use for this source.
  final String? vpcInterfaceName;

  /// The range of IP addresses that should be allowed to contribute content to
  /// your source. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  final String? whitelistCidr;

  SetSourceRequest({
    this.decryption,
    this.description,
    this.entitlementArn,
    this.gatewayBridgeSource,
    this.ingestPort,
    this.maxBitrate,
    this.maxLatency,
    this.maxSyncBuffer,
    this.mediaStreamSourceConfigurations,
    this.minLatency,
    this.name,
    this.protocol,
    this.senderControlPort,
    this.senderIpAddress,
    this.sourceListenerAddress,
    this.sourceListenerPort,
    this.streamId,
    this.vpcInterfaceName,
    this.whitelistCidr,
  });

  Map<String, dynamic> toJson() {
    final decryption = this.decryption;
    final description = this.description;
    final entitlementArn = this.entitlementArn;
    final gatewayBridgeSource = this.gatewayBridgeSource;
    final ingestPort = this.ingestPort;
    final maxBitrate = this.maxBitrate;
    final maxLatency = this.maxLatency;
    final maxSyncBuffer = this.maxSyncBuffer;
    final mediaStreamSourceConfigurations =
        this.mediaStreamSourceConfigurations;
    final minLatency = this.minLatency;
    final name = this.name;
    final protocol = this.protocol;
    final senderControlPort = this.senderControlPort;
    final senderIpAddress = this.senderIpAddress;
    final sourceListenerAddress = this.sourceListenerAddress;
    final sourceListenerPort = this.sourceListenerPort;
    final streamId = this.streamId;
    final vpcInterfaceName = this.vpcInterfaceName;
    final whitelistCidr = this.whitelistCidr;
    return {
      if (decryption != null) 'decryption': decryption,
      if (description != null) 'description': description,
      if (entitlementArn != null) 'entitlementArn': entitlementArn,
      if (gatewayBridgeSource != null)
        'gatewayBridgeSource': gatewayBridgeSource,
      if (ingestPort != null) 'ingestPort': ingestPort,
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (maxLatency != null) 'maxLatency': maxLatency,
      if (maxSyncBuffer != null) 'maxSyncBuffer': maxSyncBuffer,
      if (mediaStreamSourceConfigurations != null)
        'mediaStreamSourceConfigurations': mediaStreamSourceConfigurations,
      if (minLatency != null) 'minLatency': minLatency,
      if (name != null) 'name': name,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (senderControlPort != null) 'senderControlPort': senderControlPort,
      if (senderIpAddress != null) 'senderIpAddress': senderIpAddress,
      if (sourceListenerAddress != null)
        'sourceListenerAddress': sourceListenerAddress,
      if (sourceListenerPort != null) 'sourceListenerPort': sourceListenerPort,
      if (streamId != null) 'streamId': streamId,
      if (vpcInterfaceName != null) 'vpcInterfaceName': vpcInterfaceName,
      if (whitelistCidr != null) 'whitelistCidr': whitelistCidr,
    };
  }
}

/// The settings for the source of the flow.
class Source {
  /// The name of the source.
  final String name;

  /// The ARN of the source.
  final String sourceArn;

  /// Percentage from 0-100 of the data transfer cost to be billed to the
  /// subscriber.
  final int? dataTransferSubscriberFeePercent;

  /// The type of encryption that is used on the content ingested from this
  /// source.
  final Encryption? decryption;

  /// A description for the source. This value is not used or seen outside of the
  /// current AWS Elemental MediaConnect account.
  final String? description;

  /// The ARN of the entitlement that allows you to subscribe to content that
  /// comes from another AWS account. The entitlement is set by the content
  /// originator and the ARN is generated as part of the originator's flow.
  final String? entitlementArn;

  /// The source configuration for cloud flows receiving a stream from a bridge.
  final GatewayBridgeSource? gatewayBridgeSource;

  /// The IP address that the flow will be listening on for incoming content.
  final String? ingestIp;

  /// The port that the flow will be listening on for incoming content.
  final int? ingestPort;

  /// The media streams that are associated with the source, and the parameters
  /// for those associations.
  final List<MediaStreamSourceConfiguration>? mediaStreamSourceConfigurations;

  /// The port that the flow uses to send outbound requests to initiate connection
  /// with the sender.
  final int? senderControlPort;

  /// The IP address that the flow communicates with to initiate connection with
  /// the sender.
  final String? senderIpAddress;

  /// Attributes related to the transport stream that are used in the source.
  final Transport? transport;

  /// The name of the VPC interface that is used for this source.
  final String? vpcInterfaceName;

  /// The range of IP addresses that should be allowed to contribute content to
  /// your source. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  final String? whitelistCidr;

  Source({
    required this.name,
    required this.sourceArn,
    this.dataTransferSubscriberFeePercent,
    this.decryption,
    this.description,
    this.entitlementArn,
    this.gatewayBridgeSource,
    this.ingestIp,
    this.ingestPort,
    this.mediaStreamSourceConfigurations,
    this.senderControlPort,
    this.senderIpAddress,
    this.transport,
    this.vpcInterfaceName,
    this.whitelistCidr,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      name: json['name'] as String,
      sourceArn: json['sourceArn'] as String,
      dataTransferSubscriberFeePercent:
          json['dataTransferSubscriberFeePercent'] as int?,
      decryption: json['decryption'] != null
          ? Encryption.fromJson(json['decryption'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      entitlementArn: json['entitlementArn'] as String?,
      gatewayBridgeSource: json['gatewayBridgeSource'] != null
          ? GatewayBridgeSource.fromJson(
              json['gatewayBridgeSource'] as Map<String, dynamic>)
          : null,
      ingestIp: json['ingestIp'] as String?,
      ingestPort: json['ingestPort'] as int?,
      mediaStreamSourceConfigurations:
          (json['mediaStreamSourceConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => MediaStreamSourceConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      senderControlPort: json['senderControlPort'] as int?,
      senderIpAddress: json['senderIpAddress'] as String?,
      transport: json['transport'] != null
          ? Transport.fromJson(json['transport'] as Map<String, dynamic>)
          : null,
      vpcInterfaceName: json['vpcInterfaceName'] as String?,
      whitelistCidr: json['whitelistCidr'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sourceArn = this.sourceArn;
    final dataTransferSubscriberFeePercent =
        this.dataTransferSubscriberFeePercent;
    final decryption = this.decryption;
    final description = this.description;
    final entitlementArn = this.entitlementArn;
    final gatewayBridgeSource = this.gatewayBridgeSource;
    final ingestIp = this.ingestIp;
    final ingestPort = this.ingestPort;
    final mediaStreamSourceConfigurations =
        this.mediaStreamSourceConfigurations;
    final senderControlPort = this.senderControlPort;
    final senderIpAddress = this.senderIpAddress;
    final transport = this.transport;
    final vpcInterfaceName = this.vpcInterfaceName;
    final whitelistCidr = this.whitelistCidr;
    return {
      'name': name,
      'sourceArn': sourceArn,
      if (dataTransferSubscriberFeePercent != null)
        'dataTransferSubscriberFeePercent': dataTransferSubscriberFeePercent,
      if (decryption != null) 'decryption': decryption,
      if (description != null) 'description': description,
      if (entitlementArn != null) 'entitlementArn': entitlementArn,
      if (gatewayBridgeSource != null)
        'gatewayBridgeSource': gatewayBridgeSource,
      if (ingestIp != null) 'ingestIp': ingestIp,
      if (ingestPort != null) 'ingestPort': ingestPort,
      if (mediaStreamSourceConfigurations != null)
        'mediaStreamSourceConfigurations': mediaStreamSourceConfigurations,
      if (senderControlPort != null) 'senderControlPort': senderControlPort,
      if (senderIpAddress != null) 'senderIpAddress': senderIpAddress,
      if (transport != null) 'transport': transport,
      if (vpcInterfaceName != null) 'vpcInterfaceName': vpcInterfaceName,
      if (whitelistCidr != null) 'whitelistCidr': whitelistCidr,
    };
  }
}

/// The priority you want to assign to a source. You can have a primary stream
/// and a backup stream or two equally prioritized streams.
class SourcePriority {
  /// The name of the source you choose as the primary source for this flow.
  final String? primarySource;

  SourcePriority({
    this.primarySource,
  });

  factory SourcePriority.fromJson(Map<String, dynamic> json) {
    return SourcePriority(
      primarySource: json['primarySource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final primarySource = this.primarySource;
    return {
      if (primarySource != null) 'primarySource': primarySource,
    };
  }
}

enum SourceType {
  owned,
  entitled,
}

extension SourceTypeValueExtension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.owned:
        return 'OWNED';
      case SourceType.entitled:
        return 'ENTITLED';
    }
  }
}

extension SourceTypeFromString on String {
  SourceType toSourceType() {
    switch (this) {
      case 'OWNED':
        return SourceType.owned;
      case 'ENTITLED':
        return SourceType.entitled;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

class StartFlowResponse {
  /// The ARN of the flow that you started.
  final String? flowArn;

  /// The status of the flow when the StartFlow process begins.
  final Status? status;

  StartFlowResponse({
    this.flowArn,
    this.status,
  });

  factory StartFlowResponse.fromJson(Map<String, dynamic> json) {
    return StartFlowResponse(
      flowArn: json['flowArn'] as String?,
      status: (json['status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final status = this.status;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum State {
  enabled,
  disabled,
}

extension StateValueExtension on State {
  String toValue() {
    switch (this) {
      case State.enabled:
        return 'ENABLED';
      case State.disabled:
        return 'DISABLED';
    }
  }
}

extension StateFromString on String {
  State toState() {
    switch (this) {
      case 'ENABLED':
        return State.enabled;
      case 'DISABLED':
        return State.disabled;
    }
    throw Exception('$this is not known in enum State');
  }
}

enum Status {
  standby,
  active,
  updating,
  deleting,
  starting,
  stopping,
  error,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.standby:
        return 'STANDBY';
      case Status.active:
        return 'ACTIVE';
      case Status.updating:
        return 'UPDATING';
      case Status.deleting:
        return 'DELETING';
      case Status.starting:
        return 'STARTING';
      case Status.stopping:
        return 'STOPPING';
      case Status.error:
        return 'ERROR';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'STANDBY':
        return Status.standby;
      case 'ACTIVE':
        return Status.active;
      case 'UPDATING':
        return Status.updating;
      case 'DELETING':
        return Status.deleting;
      case 'STARTING':
        return Status.starting;
      case 'STOPPING':
        return Status.stopping;
      case 'ERROR':
        return Status.error;
    }
    throw Exception('$this is not known in enum Status');
  }
}

class StopFlowResponse {
  /// The ARN of the flow that you stopped.
  final String? flowArn;

  /// The status of the flow when the StopFlow process begins.
  final Status? status;

  StopFlowResponse({
    this.flowArn,
    this.status,
  });

  factory StopFlowResponse.fromJson(Map<String, dynamic> json) {
    return StopFlowResponse(
      flowArn: json['flowArn'] as String?,
      status: (json['status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final status = this.status;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum Tcs {
  sdr,
  pq,
  hlg,
  linear,
  bt2100linpq,
  bt2100linhlg,
  st2065_1,
  st428_1,
  density,
}

extension TcsValueExtension on Tcs {
  String toValue() {
    switch (this) {
      case Tcs.sdr:
        return 'SDR';
      case Tcs.pq:
        return 'PQ';
      case Tcs.hlg:
        return 'HLG';
      case Tcs.linear:
        return 'LINEAR';
      case Tcs.bt2100linpq:
        return 'BT2100LINPQ';
      case Tcs.bt2100linhlg:
        return 'BT2100LINHLG';
      case Tcs.st2065_1:
        return 'ST2065-1';
      case Tcs.st428_1:
        return 'ST428-1';
      case Tcs.density:
        return 'DENSITY';
    }
  }
}

extension TcsFromString on String {
  Tcs toTcs() {
    switch (this) {
      case 'SDR':
        return Tcs.sdr;
      case 'PQ':
        return Tcs.pq;
      case 'HLG':
        return Tcs.hlg;
      case 'LINEAR':
        return Tcs.linear;
      case 'BT2100LINPQ':
        return Tcs.bt2100linpq;
      case 'BT2100LINHLG':
        return Tcs.bt2100linhlg;
      case 'ST2065-1':
        return Tcs.st2065_1;
      case 'ST428-1':
        return Tcs.st428_1;
      case 'DENSITY':
        return Tcs.density;
    }
    throw Exception('$this is not known in enum Tcs');
  }
}

/// Attributes related to the transport stream that are used in a source or
/// output.
class Transport {
  /// The protocol that is used by the source or output.
  final Protocol protocol;

  /// The range of IP addresses that should be allowed to initiate output requests
  /// to this flow. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  final List<String>? cidrAllowList;

  /// The smoothing max bitrate (in bps) for RIST, RTP, and RTP-FEC streams.
  final int? maxBitrate;

  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based, Zixi-based, and Fujitsu-based streams.
  final int? maxLatency;

  /// The size of the buffer (in milliseconds) to use to sync incoming source
  /// data.
  final int? maxSyncBuffer;

  /// The minimum latency in milliseconds for SRT-based streams. In streams that
  /// use the SRT protocol, this value that you set on your MediaConnect source or
  /// output represents the minimal potential latency of that connection. The
  /// latency of the stream is set to the highest number between the sender’s
  /// minimum latency and the receiver’s minimum latency.
  final int? minLatency;

  /// The remote ID for the Zixi-pull stream.
  final String? remoteId;

  /// The port that the flow uses to send outbound requests to initiate connection
  /// with the sender.
  final int? senderControlPort;

  /// The IP address that the flow communicates with to initiate connection with
  /// the sender.
  final String? senderIpAddress;

  /// The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
  final int? smoothingLatency;

  /// Source IP or domain name for SRT-caller protocol.
  final String? sourceListenerAddress;

  /// Source port for SRT-caller protocol.
  final int? sourceListenerPort;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi and SRT caller-based streams.
  final String? streamId;

  Transport({
    required this.protocol,
    this.cidrAllowList,
    this.maxBitrate,
    this.maxLatency,
    this.maxSyncBuffer,
    this.minLatency,
    this.remoteId,
    this.senderControlPort,
    this.senderIpAddress,
    this.smoothingLatency,
    this.sourceListenerAddress,
    this.sourceListenerPort,
    this.streamId,
  });

  factory Transport.fromJson(Map<String, dynamic> json) {
    return Transport(
      protocol: (json['protocol'] as String).toProtocol(),
      cidrAllowList: (json['cidrAllowList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      maxBitrate: json['maxBitrate'] as int?,
      maxLatency: json['maxLatency'] as int?,
      maxSyncBuffer: json['maxSyncBuffer'] as int?,
      minLatency: json['minLatency'] as int?,
      remoteId: json['remoteId'] as String?,
      senderControlPort: json['senderControlPort'] as int?,
      senderIpAddress: json['senderIpAddress'] as String?,
      smoothingLatency: json['smoothingLatency'] as int?,
      sourceListenerAddress: json['sourceListenerAddress'] as String?,
      sourceListenerPort: json['sourceListenerPort'] as int?,
      streamId: json['streamId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final protocol = this.protocol;
    final cidrAllowList = this.cidrAllowList;
    final maxBitrate = this.maxBitrate;
    final maxLatency = this.maxLatency;
    final maxSyncBuffer = this.maxSyncBuffer;
    final minLatency = this.minLatency;
    final remoteId = this.remoteId;
    final senderControlPort = this.senderControlPort;
    final senderIpAddress = this.senderIpAddress;
    final smoothingLatency = this.smoothingLatency;
    final sourceListenerAddress = this.sourceListenerAddress;
    final sourceListenerPort = this.sourceListenerPort;
    final streamId = this.streamId;
    return {
      'protocol': protocol.toValue(),
      if (cidrAllowList != null) 'cidrAllowList': cidrAllowList,
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (maxLatency != null) 'maxLatency': maxLatency,
      if (maxSyncBuffer != null) 'maxSyncBuffer': maxSyncBuffer,
      if (minLatency != null) 'minLatency': minLatency,
      if (remoteId != null) 'remoteId': remoteId,
      if (senderControlPort != null) 'senderControlPort': senderControlPort,
      if (senderIpAddress != null) 'senderIpAddress': senderIpAddress,
      if (smoothingLatency != null) 'smoothingLatency': smoothingLatency,
      if (sourceListenerAddress != null)
        'sourceListenerAddress': sourceListenerAddress,
      if (sourceListenerPort != null) 'sourceListenerPort': sourceListenerPort,
      if (streamId != null) 'streamId': streamId,
    };
  }
}

/// The metadata of the transport stream in the current flow's source.
class TransportMediaInfo {
  /// The list of transport stream programs in the current flow's source.
  final List<TransportStreamProgram> programs;

  TransportMediaInfo({
    required this.programs,
  });

  factory TransportMediaInfo.fromJson(Map<String, dynamic> json) {
    return TransportMediaInfo(
      programs: (json['programs'] as List)
          .whereNotNull()
          .map(
              (e) => TransportStreamProgram.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final programs = this.programs;
    return {
      'programs': programs,
    };
  }
}

/// The metadata of an elementary transport stream.
class TransportStream {
  /// The Packet ID (PID) as it is reported in the Program Map Table.
  final int pid;

  /// The Stream Type as it is reported in the Program Map Table.
  final String streamType;

  /// The number of channels in the audio stream.
  final int? channels;

  /// The codec used by the stream.
  final String? codec;

  /// The frame rate used by the video stream.
  final String? frameRate;
  final FrameResolution? frameResolution;

  /// The sample rate used by the audio stream.
  final int? sampleRate;

  /// The sample bit size used by the audio stream.
  final int? sampleSize;

  TransportStream({
    required this.pid,
    required this.streamType,
    this.channels,
    this.codec,
    this.frameRate,
    this.frameResolution,
    this.sampleRate,
    this.sampleSize,
  });

  factory TransportStream.fromJson(Map<String, dynamic> json) {
    return TransportStream(
      pid: json['pid'] as int,
      streamType: json['streamType'] as String,
      channels: json['channels'] as int?,
      codec: json['codec'] as String?,
      frameRate: json['frameRate'] as String?,
      frameResolution: json['frameResolution'] != null
          ? FrameResolution.fromJson(
              json['frameResolution'] as Map<String, dynamic>)
          : null,
      sampleRate: json['sampleRate'] as int?,
      sampleSize: json['sampleSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final pid = this.pid;
    final streamType = this.streamType;
    final channels = this.channels;
    final codec = this.codec;
    final frameRate = this.frameRate;
    final frameResolution = this.frameResolution;
    final sampleRate = this.sampleRate;
    final sampleSize = this.sampleSize;
    return {
      'pid': pid,
      'streamType': streamType,
      if (channels != null) 'channels': channels,
      if (codec != null) 'codec': codec,
      if (frameRate != null) 'frameRate': frameRate,
      if (frameResolution != null) 'frameResolution': frameResolution,
      if (sampleRate != null) 'sampleRate': sampleRate,
      if (sampleSize != null) 'sampleSize': sampleSize,
    };
  }
}

/// The metadata of a single transport stream program.
class TransportStreamProgram {
  /// The Program Clock Reference (PCR) Packet ID (PID) as it is reported in the
  /// Program Association Table.
  final int pcrPid;

  /// The program number as it is reported in the Program Association Table.
  final int programNumber;

  /// The program Packet ID (PID) as it is reported in the Program Association
  /// Table.
  final int programPid;

  /// The list of elementary transport streams in the program. The list includes
  /// video, audio, and data streams.
  final List<TransportStream> streams;

  /// The program name as it is reported in the Program Association Table.
  final String? programName;

  TransportStreamProgram({
    required this.pcrPid,
    required this.programNumber,
    required this.programPid,
    required this.streams,
    this.programName,
  });

  factory TransportStreamProgram.fromJson(Map<String, dynamic> json) {
    return TransportStreamProgram(
      pcrPid: json['pcrPid'] as int,
      programNumber: json['programNumber'] as int,
      programPid: json['programPid'] as int,
      streams: (json['streams'] as List)
          .whereNotNull()
          .map((e) => TransportStream.fromJson(e as Map<String, dynamic>))
          .toList(),
      programName: json['programName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pcrPid = this.pcrPid;
    final programNumber = this.programNumber;
    final programPid = this.programPid;
    final streams = this.streams;
    final programName = this.programName;
    return {
      'pcrPid': pcrPid,
      'programNumber': programNumber,
      'programPid': programPid,
      'streams': streams,
      if (programName != null) 'programName': programName,
    };
  }
}

/// Update the flow source of the bridge.
class UpdateBridgeFlowSourceRequest {
  /// The ARN of the cloud flow to use as a source of this bridge.
  final String? flowArn;

  /// The name of the VPC interface attachment to use for this source.
  final VpcInterfaceAttachment? flowVpcInterfaceAttachment;

  UpdateBridgeFlowSourceRequest({
    this.flowArn,
    this.flowVpcInterfaceAttachment,
  });

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final flowVpcInterfaceAttachment = this.flowVpcInterfaceAttachment;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (flowVpcInterfaceAttachment != null)
        'flowVpcInterfaceAttachment': flowVpcInterfaceAttachment,
    };
  }
}

/// Update an existing network output.
class UpdateBridgeNetworkOutputRequest {
  /// The network output IP Address.
  final String? ipAddress;

  /// The network output's gateway network name.
  final String? networkName;

  /// The network output port.
  final int? port;

  /// The network output protocol.
  final Protocol? protocol;

  /// The network output TTL.
  final int? ttl;

  UpdateBridgeNetworkOutputRequest({
    this.ipAddress,
    this.networkName,
    this.port,
    this.protocol,
    this.ttl,
  });

  Map<String, dynamic> toJson() {
    final ipAddress = this.ipAddress;
    final networkName = this.networkName;
    final port = this.port;
    final protocol = this.protocol;
    final ttl = this.ttl;
    return {
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (networkName != null) 'networkName': networkName,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (ttl != null) 'ttl': ttl,
    };
  }
}

/// Update the network source of the bridge.
class UpdateBridgeNetworkSourceRequest {
  /// The network source multicast IP.
  final String? multicastIp;

  /// The network source's gateway network name.
  final String? networkName;

  /// The network source port.
  final int? port;

  /// The network source protocol.
  final Protocol? protocol;

  UpdateBridgeNetworkSourceRequest({
    this.multicastIp,
    this.networkName,
    this.port,
    this.protocol,
  });

  Map<String, dynamic> toJson() {
    final multicastIp = this.multicastIp;
    final networkName = this.networkName;
    final port = this.port;
    final protocol = this.protocol;
    return {
      if (multicastIp != null) 'multicastIp': multicastIp,
      if (networkName != null) 'networkName': networkName,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.toValue(),
    };
  }
}

class UpdateBridgeOutputResponse {
  /// The Amazon Resource Number (ARN) of the bridge.
  final String? bridgeArn;

  /// The output that you updated.
  final BridgeOutput? output;

  UpdateBridgeOutputResponse({
    this.bridgeArn,
    this.output,
  });

  factory UpdateBridgeOutputResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBridgeOutputResponse(
      bridgeArn: json['bridgeArn'] as String?,
      output: json['output'] != null
          ? BridgeOutput.fromJson(json['output'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final output = this.output;
    return {
      if (bridgeArn != null) 'bridgeArn': bridgeArn,
      if (output != null) 'output': output,
    };
  }
}

class UpdateBridgeResponse {
  final Bridge? bridge;

  UpdateBridgeResponse({
    this.bridge,
  });

  factory UpdateBridgeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBridgeResponse(
      bridge: json['bridge'] != null
          ? Bridge.fromJson(json['bridge'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bridge = this.bridge;
    return {
      if (bridge != null) 'bridge': bridge,
    };
  }
}

class UpdateBridgeSourceResponse {
  /// The Amazon Resource Number (ARN) of the bridge.
  final String? bridgeArn;
  final BridgeSource? source;

  UpdateBridgeSourceResponse({
    this.bridgeArn,
    this.source,
  });

  factory UpdateBridgeSourceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBridgeSourceResponse(
      bridgeArn: json['bridgeArn'] as String?,
      source: json['source'] != null
          ? BridgeSource.fromJson(json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final source = this.source;
    return {
      if (bridgeArn != null) 'bridgeArn': bridgeArn,
      if (source != null) 'source': source,
    };
  }
}

class UpdateBridgeStateResponse {
  /// The Amazon Resource Number (ARN) of the bridge.
  final String? bridgeArn;

  /// The state of the bridge. ACTIVE or STANDBY.
  final DesiredState? desiredState;

  UpdateBridgeStateResponse({
    this.bridgeArn,
    this.desiredState,
  });

  factory UpdateBridgeStateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBridgeStateResponse(
      bridgeArn: json['bridgeArn'] as String?,
      desiredState: (json['desiredState'] as String?)?.toDesiredState(),
    );
  }

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final desiredState = this.desiredState;
    return {
      if (bridgeArn != null) 'bridgeArn': bridgeArn,
      if (desiredState != null) 'desiredState': desiredState.toValue(),
    };
  }
}

class UpdateEgressGatewayBridgeRequest {
  /// Update an existing egress-type bridge.
  final int? maxBitrate;

  UpdateEgressGatewayBridgeRequest({
    this.maxBitrate,
  });

  Map<String, dynamic> toJson() {
    final maxBitrate = this.maxBitrate;
    return {
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
    };
  }
}

/// Information about the encryption of the flow.
class UpdateEncryption {
  /// The type of algorithm that is used for the encryption (such as aes128,
  /// aes192, or aes256).
  final Algorithm? algorithm;

  /// A 128-bit, 16-byte hex value represented by a 32-character string, to be
  /// used with the key for encrypting content. This parameter is not valid for
  /// static key encryption.
  final String? constantInitializationVector;

  /// The value of one of the devices that you configured with your digital rights
  /// management (DRM) platform key provider. This parameter is required for SPEKE
  /// encryption and is not valid for static key encryption.
  final String? deviceId;

  /// The type of key that is used for the encryption. If no keyType is provided,
  /// the service will use the default setting (static-key).
  final KeyType? keyType;

  /// The AWS Region that the API Gateway proxy endpoint was created in. This
  /// parameter is required for SPEKE encryption and is not valid for static key
  /// encryption.
  final String? region;

  /// An identifier for the content. The service sends this value to the key
  /// server to identify the current endpoint. The resource ID is also known as
  /// the content ID. This parameter is required for SPEKE encryption and is not
  /// valid for static key encryption.
  final String? resourceId;

  /// The ARN of the role that you created during setup (when you set up AWS
  /// Elemental MediaConnect as a trusted entity).
  final String? roleArn;

  /// The ARN of the secret that you created in AWS Secrets Manager to store the
  /// encryption key. This parameter is required for static key encryption and is
  /// not valid for SPEKE encryption.
  final String? secretArn;

  /// The URL from the API Gateway proxy that you set up to talk to your key
  /// server. This parameter is required for SPEKE encryption and is not valid for
  /// static key encryption.
  final String? url;

  UpdateEncryption({
    this.algorithm,
    this.constantInitializationVector,
    this.deviceId,
    this.keyType,
    this.region,
    this.resourceId,
    this.roleArn,
    this.secretArn,
    this.url,
  });

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    final constantInitializationVector = this.constantInitializationVector;
    final deviceId = this.deviceId;
    final keyType = this.keyType;
    final region = this.region;
    final resourceId = this.resourceId;
    final roleArn = this.roleArn;
    final secretArn = this.secretArn;
    final url = this.url;
    return {
      if (algorithm != null) 'algorithm': algorithm.toValue(),
      if (constantInitializationVector != null)
        'constantInitializationVector': constantInitializationVector,
      if (deviceId != null) 'deviceId': deviceId,
      if (keyType != null) 'keyType': keyType.toValue(),
      if (region != null) 'region': region,
      if (resourceId != null) 'resourceId': resourceId,
      if (roleArn != null) 'roleArn': roleArn,
      if (secretArn != null) 'secretArn': secretArn,
      if (url != null) 'url': url,
    };
  }
}

/// The settings for source failover.
class UpdateFailoverConfig {
  /// The type of failover you choose for this flow. MERGE combines the source
  /// streams into a single stream, allowing graceful recovery from any
  /// single-source loss. FAILOVER allows switching between different streams.
  final FailoverMode? failoverMode;

  /// Recovery window time to look for dash-7 packets
  final int? recoveryWindow;

  /// The priority you want to assign to a source. You can have a primary stream
  /// and a backup stream or two equally prioritized streams.
  final SourcePriority? sourcePriority;
  final State? state;

  UpdateFailoverConfig({
    this.failoverMode,
    this.recoveryWindow,
    this.sourcePriority,
    this.state,
  });

  Map<String, dynamic> toJson() {
    final failoverMode = this.failoverMode;
    final recoveryWindow = this.recoveryWindow;
    final sourcePriority = this.sourcePriority;
    final state = this.state;
    return {
      if (failoverMode != null) 'failoverMode': failoverMode.toValue(),
      if (recoveryWindow != null) 'recoveryWindow': recoveryWindow,
      if (sourcePriority != null) 'sourcePriority': sourcePriority,
      if (state != null) 'state': state.toValue(),
    };
  }
}

class UpdateFlowEntitlementResponse {
  /// The new configuration of the entitlement that you updated.
  final Entitlement? entitlement;

  /// The ARN of the flow that this entitlement was granted on.
  final String? flowArn;

  UpdateFlowEntitlementResponse({
    this.entitlement,
    this.flowArn,
  });

  factory UpdateFlowEntitlementResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFlowEntitlementResponse(
      entitlement: json['entitlement'] != null
          ? Entitlement.fromJson(json['entitlement'] as Map<String, dynamic>)
          : null,
      flowArn: json['flowArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitlement = this.entitlement;
    final flowArn = this.flowArn;
    return {
      if (entitlement != null) 'entitlement': entitlement,
      if (flowArn != null) 'flowArn': flowArn,
    };
  }
}

class UpdateFlowMediaStreamResponse {
  /// The ARN of the flow that is associated with the media stream that you
  /// updated.
  final String? flowArn;

  /// The media stream that you updated.
  final MediaStream? mediaStream;

  UpdateFlowMediaStreamResponse({
    this.flowArn,
    this.mediaStream,
  });

  factory UpdateFlowMediaStreamResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFlowMediaStreamResponse(
      flowArn: json['flowArn'] as String?,
      mediaStream: json['mediaStream'] != null
          ? MediaStream.fromJson(json['mediaStream'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final mediaStream = this.mediaStream;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (mediaStream != null) 'mediaStream': mediaStream,
    };
  }
}

class UpdateFlowOutputResponse {
  /// The ARN of the flow that is associated with the updated output.
  final String? flowArn;

  /// The new settings of the output that you updated.
  final Output? output;

  UpdateFlowOutputResponse({
    this.flowArn,
    this.output,
  });

  factory UpdateFlowOutputResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFlowOutputResponse(
      flowArn: json['flowArn'] as String?,
      output: json['output'] != null
          ? Output.fromJson(json['output'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final output = this.output;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (output != null) 'output': output,
    };
  }
}

class UpdateFlowResponse {
  final Flow? flow;

  UpdateFlowResponse({
    this.flow,
  });

  factory UpdateFlowResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFlowResponse(
      flow: json['flow'] != null
          ? Flow.fromJson(json['flow'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flow = this.flow;
    return {
      if (flow != null) 'flow': flow,
    };
  }
}

class UpdateFlowSourceResponse {
  /// The ARN of the flow that you want to update.
  final String? flowArn;

  /// The settings for the source of the flow.
  final Source? source;

  UpdateFlowSourceResponse({
    this.flowArn,
    this.source,
  });

  factory UpdateFlowSourceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFlowSourceResponse(
      flowArn: json['flowArn'] as String?,
      source: json['source'] != null
          ? Source.fromJson(json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final source = this.source;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (source != null) 'source': source,
    };
  }
}

/// The source configuration for cloud flows receiving a stream from a bridge.
class UpdateGatewayBridgeSourceRequest {
  /// The ARN of the bridge feeding this flow.
  final String? bridgeArn;

  /// The name of the VPC interface attachment to use for this bridge source.
  final VpcInterfaceAttachment? vpcInterfaceAttachment;

  UpdateGatewayBridgeSourceRequest({
    this.bridgeArn,
    this.vpcInterfaceAttachment,
  });

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final vpcInterfaceAttachment = this.vpcInterfaceAttachment;
    return {
      if (bridgeArn != null) 'bridgeArn': bridgeArn,
      if (vpcInterfaceAttachment != null)
        'vpcInterfaceAttachment': vpcInterfaceAttachment,
    };
  }
}

class UpdateGatewayInstanceResponse {
  /// The availability of the instance to host new bridges. The bridgePlacement
  /// property can be LOCKED or AVAILABLE. If it is LOCKED, no new bridges can be
  /// deployed to this instance. If it is AVAILABLE, new bridges can be added to
  /// this instance.
  final BridgePlacement? bridgePlacement;

  /// The Amazon Resource Name (ARN) of the instance.
  final String? gatewayInstanceArn;

  UpdateGatewayInstanceResponse({
    this.bridgePlacement,
    this.gatewayInstanceArn,
  });

  factory UpdateGatewayInstanceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateGatewayInstanceResponse(
      bridgePlacement:
          (json['bridgePlacement'] as String?)?.toBridgePlacement(),
      gatewayInstanceArn: json['gatewayInstanceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bridgePlacement = this.bridgePlacement;
    final gatewayInstanceArn = this.gatewayInstanceArn;
    return {
      if (bridgePlacement != null) 'bridgePlacement': bridgePlacement.toValue(),
      if (gatewayInstanceArn != null) 'gatewayInstanceArn': gatewayInstanceArn,
    };
  }
}

class UpdateIngressGatewayBridgeRequest {
  /// The maximum expected bitrate (in bps).
  final int? maxBitrate;

  /// The maximum number of expected outputs.
  final int? maxOutputs;

  UpdateIngressGatewayBridgeRequest({
    this.maxBitrate,
    this.maxOutputs,
  });

  Map<String, dynamic> toJson() {
    final maxBitrate = this.maxBitrate;
    final maxOutputs = this.maxOutputs;
    return {
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (maxOutputs != null) 'maxOutputs': maxOutputs,
    };
  }
}

/// Update maintenance setting for a flow
class UpdateMaintenance {
  /// A day of a week when the maintenance will happen. use
  /// Monday/Tuesday/Wednesday/Thursday/Friday/Saturday/Sunday.
  final MaintenanceDay? maintenanceDay;

  /// A scheduled date in ISO UTC format when the maintenance will happen. Use
  /// YYYY-MM-DD format. Example: 2021-01-30.
  final String? maintenanceScheduledDate;

  /// UTC time when the maintenance will happen. Use 24-hour HH:MM format. Minutes
  /// must be 00. Example: 13:00. The default value is 02:00.
  final String? maintenanceStartHour;

  UpdateMaintenance({
    this.maintenanceDay,
    this.maintenanceScheduledDate,
    this.maintenanceStartHour,
  });

  Map<String, dynamic> toJson() {
    final maintenanceDay = this.maintenanceDay;
    final maintenanceScheduledDate = this.maintenanceScheduledDate;
    final maintenanceStartHour = this.maintenanceStartHour;
    return {
      if (maintenanceDay != null) 'maintenanceDay': maintenanceDay.toValue(),
      if (maintenanceScheduledDate != null)
        'maintenanceScheduledDate': maintenanceScheduledDate,
      if (maintenanceStartHour != null)
        'maintenanceStartHour': maintenanceStartHour,
    };
  }
}

/// The settings for a VPC Source.
class VpcInterface {
  /// Immutable and has to be a unique against other VpcInterfaces in this Flow.
  final String name;

  /// IDs of the network interfaces created in customer's account by MediaConnect.
  final List<String> networkInterfaceIds;

  /// The type of network interface.
  final NetworkInterfaceType networkInterfaceType;

  /// Role Arn MediaConnect can assumes to create ENIs in customer's account
  final String roleArn;

  /// Security Group IDs to be used on ENI.
  final List<String> securityGroupIds;

  /// Subnet must be in the AZ of the Flow
  final String subnetId;

  VpcInterface({
    required this.name,
    required this.networkInterfaceIds,
    required this.networkInterfaceType,
    required this.roleArn,
    required this.securityGroupIds,
    required this.subnetId,
  });

  factory VpcInterface.fromJson(Map<String, dynamic> json) {
    return VpcInterface(
      name: json['name'] as String,
      networkInterfaceIds: (json['networkInterfaceIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      networkInterfaceType:
          (json['networkInterfaceType'] as String).toNetworkInterfaceType(),
      roleArn: json['roleArn'] as String,
      securityGroupIds: (json['securityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetId: json['subnetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final networkInterfaceIds = this.networkInterfaceIds;
    final networkInterfaceType = this.networkInterfaceType;
    final roleArn = this.roleArn;
    final securityGroupIds = this.securityGroupIds;
    final subnetId = this.subnetId;
    return {
      'name': name,
      'networkInterfaceIds': networkInterfaceIds,
      'networkInterfaceType': networkInterfaceType.toValue(),
      'roleArn': roleArn,
      'securityGroupIds': securityGroupIds,
      'subnetId': subnetId,
    };
  }
}

/// The settings for attaching a VPC interface to an resource.
class VpcInterfaceAttachment {
  /// The name of the VPC interface to use for this resource.
  final String? vpcInterfaceName;

  VpcInterfaceAttachment({
    this.vpcInterfaceName,
  });

  factory VpcInterfaceAttachment.fromJson(Map<String, dynamic> json) {
    return VpcInterfaceAttachment(
      vpcInterfaceName: json['vpcInterfaceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcInterfaceName = this.vpcInterfaceName;
    return {
      if (vpcInterfaceName != null) 'vpcInterfaceName': vpcInterfaceName,
    };
  }
}

/// Desired VPC Interface for a Flow
class VpcInterfaceRequest {
  /// The name of the VPC Interface. This value must be unique within the current
  /// flow.
  final String name;

  /// Role Arn MediaConnect can assumes to create ENIs in customer's account
  final String roleArn;

  /// Security Group IDs to be used on ENI.
  final List<String> securityGroupIds;

  /// Subnet must be in the AZ of the Flow
  final String subnetId;

  /// The type of network interface. If this value is not included in the request,
  /// MediaConnect uses ENA as the networkInterfaceType.
  final NetworkInterfaceType? networkInterfaceType;

  VpcInterfaceRequest({
    required this.name,
    required this.roleArn,
    required this.securityGroupIds,
    required this.subnetId,
    this.networkInterfaceType,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final roleArn = this.roleArn;
    final securityGroupIds = this.securityGroupIds;
    final subnetId = this.subnetId;
    final networkInterfaceType = this.networkInterfaceType;
    return {
      'name': name,
      'roleArn': roleArn,
      'securityGroupIds': securityGroupIds,
      'subnetId': subnetId,
      if (networkInterfaceType != null)
        'networkInterfaceType': networkInterfaceType.toValue(),
    };
  }
}

class AddFlowOutputs420Exception extends _s.GenericAwsException {
  AddFlowOutputs420Exception({String? type, String? message})
      : super(type: type, code: 'AddFlowOutputs420Exception', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class CreateBridge420Exception extends _s.GenericAwsException {
  CreateBridge420Exception({String? type, String? message})
      : super(type: type, code: 'CreateBridge420Exception', message: message);
}

class CreateFlow420Exception extends _s.GenericAwsException {
  CreateFlow420Exception({String? type, String? message})
      : super(type: type, code: 'CreateFlow420Exception', message: message);
}

class CreateGateway420Exception extends _s.GenericAwsException {
  CreateGateway420Exception({String? type, String? message})
      : super(type: type, code: 'CreateGateway420Exception', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class GrantFlowEntitlements420Exception extends _s.GenericAwsException {
  GrantFlowEntitlements420Exception({String? type, String? message})
      : super(
            type: type,
            code: 'GrantFlowEntitlements420Exception',
            message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
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
  'AddFlowOutputs420Exception': (type, message) =>
      AddFlowOutputs420Exception(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'CreateBridge420Exception': (type, message) =>
      CreateBridge420Exception(type: type, message: message),
  'CreateFlow420Exception': (type, message) =>
      CreateFlow420Exception(type: type, message: message),
  'CreateGateway420Exception': (type, message) =>
      CreateGateway420Exception(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'GrantFlowEntitlements420Exception': (type, message) =>
      GrantFlowEntitlements420Exception(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
