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

part '2018-11-14.g.dart';

/// API for AWS Elemental MediaConnect
class MediaConnect {
  final _s.RestJsonProtocol _protocol;
  MediaConnect({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mediaconnect',
            signingName: 'mediaconnect',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String flowArn,
    @_s.required List<AddOutputRequest> outputs,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
    ArgumentError.checkNotNull(outputs, 'outputs');
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
    @_s.required String flowArn,
    @_s.required List<SetSourceRequest> sources,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
    ArgumentError.checkNotNull(sources, 'sources');
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
    @_s.required String flowArn,
    @_s.required List<VpcInterfaceRequest> vpcInterfaces,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
    ArgumentError.checkNotNull(vpcInterfaces, 'vpcInterfaces');
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
  /// Parameter [outputs] :
  /// The outputs that you want to add to this flow.
  ///
  /// Parameter [vpcInterfaces] :
  /// The VPC interfaces you want on the flow.
  Future<CreateFlowResponse> createFlow({
    @_s.required String name,
    String availabilityZone,
    List<GrantEntitlementRequest> entitlements,
    List<AddOutputRequest> outputs,
    SetSourceRequest source,
    FailoverConfig sourceFailoverConfig,
    List<SetSourceRequest> sources,
    List<VpcInterfaceRequest> vpcInterfaces,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'name': name,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (entitlements != null) 'entitlements': entitlements,
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
    @_s.required String flowArn,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFlowResponse.fromJson(response);
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
    @_s.required String flowArn,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFlowResponse.fromJson(response);
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
    @_s.required String offeringArn,
  }) async {
    ArgumentError.checkNotNull(offeringArn, 'offeringArn');
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
    @_s.required String reservationArn,
  }) async {
    ArgumentError.checkNotNull(reservationArn, 'reservationArn');
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
    @_s.required List<GrantEntitlementRequest> entitlements,
    @_s.required String flowArn,
  }) async {
    ArgumentError.checkNotNull(entitlements, 'entitlements');
    ArgumentError.checkNotNull(flowArn, 'flowArn');
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
    @_s.required String offeringArn,
    @_s.required String reservationName,
    @_s.required String start,
  }) async {
    ArgumentError.checkNotNull(offeringArn, 'offeringArn');
    ArgumentError.checkNotNull(reservationName, 'reservationName');
    ArgumentError.checkNotNull(start, 'start');
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
    @_s.required String flowArn,
    @_s.required String outputArn,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
    ArgumentError.checkNotNull(outputArn, 'outputArn');
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
    @_s.required String flowArn,
    @_s.required String sourceArn,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
    ArgumentError.checkNotNull(sourceArn, 'sourceArn');
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
    @_s.required String flowArn,
    @_s.required String vpcInterfaceName,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
    ArgumentError.checkNotNull(vpcInterfaceName, 'vpcInterfaceName');
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
    @_s.required String entitlementArn,
    @_s.required String flowArn,
  }) async {
    ArgumentError.checkNotNull(entitlementArn, 'entitlementArn');
    ArgumentError.checkNotNull(flowArn, 'flowArn');
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
    @_s.required String flowArn,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
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
    @_s.required String flowArn,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
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
    @_s.required String flowArn,
    UpdateFailoverConfig sourceFailoverConfig,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
    final $payload = <String, dynamic>{
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
  /// this entitlement.
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
    @_s.required String entitlementArn,
    @_s.required String flowArn,
    String description,
    UpdateEncryption encryption,
    EntitlementStatus entitlementStatus,
    List<String> subscribers,
  }) async {
    ArgumentError.checkNotNull(entitlementArn, 'entitlementArn');
    ArgumentError.checkNotNull(flowArn, 'flowArn');
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
  /// service will use the default setting (static-key).
  ///
  /// Parameter [maxLatency] :
  /// The maximum latency in milliseconds for Zixi-based streams.
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
  /// Parameter [smoothingLatency] :
  /// The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
  ///
  /// Parameter [streamId] :
  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi-based streams.
  ///
  /// Parameter [vpcInterfaceAttachment] :
  /// The name of the VPC interface attachment to use for this output.
  Future<UpdateFlowOutputResponse> updateFlowOutput({
    @_s.required String flowArn,
    @_s.required String outputArn,
    List<String> cidrAllowList,
    String description,
    String destination,
    UpdateEncryption encryption,
    int maxLatency,
    int port,
    Protocol protocol,
    String remoteId,
    int smoothingLatency,
    String streamId,
    VpcInterfaceAttachment vpcInterfaceAttachment,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
    ArgumentError.checkNotNull(outputArn, 'outputArn');
    final $payload = <String, dynamic>{
      if (cidrAllowList != null) 'cidrAllowList': cidrAllowList,
      if (description != null) 'description': description,
      if (destination != null) 'destination': destination,
      if (encryption != null) 'encryption': encryption,
      if (maxLatency != null) 'maxLatency': maxLatency,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (remoteId != null) 'remoteId': remoteId,
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
  /// Parameter [ingestPort] :
  /// The port that the flow will be listening on for incoming content.
  ///
  /// Parameter [maxBitrate] :
  /// The smoothing max bitrate for RIST, RTP, and RTP-FEC streams.
  ///
  /// Parameter [maxLatency] :
  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based and Zixi-based streams.
  ///
  /// Parameter [protocol] :
  /// The protocol that is used by the source.
  ///
  /// Parameter [streamId] :
  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi-based streams.
  ///
  /// Parameter [vpcInterfaceName] :
  /// The name of the VPC Interface to configure this Source with.
  ///
  /// Parameter [whitelistCidr] :
  /// The range of IP addresses that should be allowed to contribute content to
  /// your source. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  Future<UpdateFlowSourceResponse> updateFlowSource({
    @_s.required String flowArn,
    @_s.required String sourceArn,
    UpdateEncryption decryption,
    String description,
    String entitlementArn,
    int ingestPort,
    int maxBitrate,
    int maxLatency,
    Protocol protocol,
    String streamId,
    String vpcInterfaceName,
    String whitelistCidr,
  }) async {
    ArgumentError.checkNotNull(flowArn, 'flowArn');
    ArgumentError.checkNotNull(sourceArn, 'sourceArn');
    final $payload = <String, dynamic>{
      if (decryption != null) 'decryption': decryption,
      if (description != null) 'description': description,
      if (entitlementArn != null) 'entitlementArn': entitlementArn,
      if (ingestPort != null) 'ingestPort': ingestPort,
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (maxLatency != null) 'maxLatency': maxLatency,
      if (protocol != null) 'protocol': protocol.toValue(),
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
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddFlowOutputsResponse {
  /// The ARN of the flow that these outputs were added to.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The details of the newly added outputs.
  @_s.JsonKey(name: 'outputs')
  final List<Output> outputs;

  AddFlowOutputsResponse({
    this.flowArn,
    this.outputs,
  });
  factory AddFlowOutputsResponse.fromJson(Map<String, dynamic> json) =>
      _$AddFlowOutputsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddFlowSourcesResponse {
  /// The ARN of the flow that these sources were added to.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The details of the newly added sources.
  @_s.JsonKey(name: 'sources')
  final List<Source> sources;

  AddFlowSourcesResponse({
    this.flowArn,
    this.sources,
  });
  factory AddFlowSourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$AddFlowSourcesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddFlowVpcInterfacesResponse {
  /// The ARN of the flow that these VPC interfaces were added to.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The details of the newly added VPC interfaces.
  @_s.JsonKey(name: 'vpcInterfaces')
  final List<VpcInterface> vpcInterfaces;

  AddFlowVpcInterfacesResponse({
    this.flowArn,
    this.vpcInterfaces,
  });
  factory AddFlowVpcInterfacesResponse.fromJson(Map<String, dynamic> json) =>
      _$AddFlowVpcInterfacesResponseFromJson(json);
}

/// The output that you want to add to this flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AddOutputRequest {
  /// The protocol to use for the output.
  @_s.JsonKey(name: 'protocol')
  final Protocol protocol;

  /// The range of IP addresses that should be allowed to initiate output requests
  /// to this flow. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  @_s.JsonKey(name: 'cidrAllowList')
  final List<String> cidrAllowList;

  /// A description of the output. This description appears only on the AWS
  /// Elemental MediaConnect console and will not be seen by the end user.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The IP address from which video will be sent to output destinations.
  @_s.JsonKey(name: 'destination')
  final String destination;

  /// The type of key used for the encryption. If no keyType is provided, the
  /// service will use the default setting (static-key).
  @_s.JsonKey(name: 'encryption')
  final Encryption encryption;

  /// The maximum latency in milliseconds for Zixi-based streams.
  @_s.JsonKey(name: 'maxLatency')
  final int maxLatency;

  /// The name of the output. This value must be unique within the current flow.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The port to use when content is distributed to this output.
  @_s.JsonKey(name: 'port')
  final int port;

  /// The remote ID for the Zixi-pull output stream.
  @_s.JsonKey(name: 'remoteId')
  final String remoteId;

  /// The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
  @_s.JsonKey(name: 'smoothingLatency')
  final int smoothingLatency;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi-based streams.
  @_s.JsonKey(name: 'streamId')
  final String streamId;

  /// The name of the VPC interface attachment to use for this output.
  @_s.JsonKey(name: 'vpcInterfaceAttachment')
  final VpcInterfaceAttachment vpcInterfaceAttachment;

  AddOutputRequest({
    @_s.required this.protocol,
    this.cidrAllowList,
    this.description,
    this.destination,
    this.encryption,
    this.maxLatency,
    this.name,
    this.port,
    this.remoteId,
    this.smoothingLatency,
    this.streamId,
    this.vpcInterfaceAttachment,
  });
  Map<String, dynamic> toJson() => _$AddOutputRequestToJson(this);
}

enum Algorithm {
  @_s.JsonValue('aes128')
  aes128,
  @_s.JsonValue('aes192')
  aes192,
  @_s.JsonValue('aes256')
  aes256,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFlowResponse {
  @_s.JsonKey(name: 'flow')
  final Flow flow;

  CreateFlowResponse({
    this.flow,
  });
  factory CreateFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFlowResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFlowResponse {
  /// The ARN of the flow that was deleted.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The status of the flow when the DeleteFlow process begins.
  @_s.JsonKey(name: 'status')
  final Status status;

  DeleteFlowResponse({
    this.flowArn,
    this.status,
  });
  factory DeleteFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFlowResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFlowResponse {
  @_s.JsonKey(name: 'flow')
  final Flow flow;
  @_s.JsonKey(name: 'messages')
  final Messages messages;

  DescribeFlowResponse({
    this.flow,
    this.messages,
  });
  factory DescribeFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFlowResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOfferingResponse {
  @_s.JsonKey(name: 'offering')
  final Offering offering;

  DescribeOfferingResponse({
    this.offering,
  });
  factory DescribeOfferingResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeOfferingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeReservationResponse {
  @_s.JsonKey(name: 'reservation')
  final Reservation reservation;

  DescribeReservationResponse({
    this.reservation,
  });
  factory DescribeReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeReservationResponseFromJson(json);
}

enum DurationUnits {
  @_s.JsonValue('MONTHS')
  months,
}

/// Information about the encryption of the flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Encryption {
  /// The type of algorithm that is used for the encryption (such as aes128,
  /// aes192, or aes256).
  @_s.JsonKey(name: 'algorithm')
  final Algorithm algorithm;

  /// The ARN of the role that you created during setup (when you set up AWS
  /// Elemental MediaConnect as a trusted entity).
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// A 128-bit, 16-byte hex value represented by a 32-character string, to be
  /// used with the key for encrypting content. This parameter is not valid for
  /// static key encryption.
  @_s.JsonKey(name: 'constantInitializationVector')
  final String constantInitializationVector;

  /// The value of one of the devices that you configured with your digital rights
  /// management (DRM) platform key provider. This parameter is required for SPEKE
  /// encryption and is not valid for static key encryption.
  @_s.JsonKey(name: 'deviceId')
  final String deviceId;

  /// The type of key that is used for the encryption. If no keyType is provided,
  /// the service will use the default setting (static-key).
  @_s.JsonKey(name: 'keyType')
  final KeyType keyType;

  /// The AWS Region that the API Gateway proxy endpoint was created in. This
  /// parameter is required for SPEKE encryption and is not valid for static key
  /// encryption.
  @_s.JsonKey(name: 'region')
  final String region;

  /// An identifier for the content. The service sends this value to the key
  /// server to identify the current endpoint. The resource ID is also known as
  /// the content ID. This parameter is required for SPEKE encryption and is not
  /// valid for static key encryption.
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// The ARN of the secret that you created in AWS Secrets Manager to store the
  /// encryption key. This parameter is required for static key encryption and is
  /// not valid for SPEKE encryption.
  @_s.JsonKey(name: 'secretArn')
  final String secretArn;

  /// The URL from the API Gateway proxy that you set up to talk to your key
  /// server. This parameter is required for SPEKE encryption and is not valid for
  /// static key encryption.
  @_s.JsonKey(name: 'url')
  final String url;

  Encryption({
    @_s.required this.algorithm,
    @_s.required this.roleArn,
    this.constantInitializationVector,
    this.deviceId,
    this.keyType,
    this.region,
    this.resourceId,
    this.secretArn,
    this.url,
  });
  factory Encryption.fromJson(Map<String, dynamic> json) =>
      _$EncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionToJson(this);
}

/// The settings for a flow entitlement.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Entitlement {
  /// The ARN of the entitlement.
  @_s.JsonKey(name: 'entitlementArn')
  final String entitlementArn;

  /// The name of the entitlement.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The AWS account IDs that you want to share your content with. The receiving
  /// accounts (subscribers) will be allowed to create their own flow using your
  /// content as the source.
  @_s.JsonKey(name: 'subscribers')
  final List<String> subscribers;

  /// Percentage from 0-100 of the data transfer cost to be billed to the
  /// subscriber.
  @_s.JsonKey(name: 'dataTransferSubscriberFeePercent')
  final int dataTransferSubscriberFeePercent;

  /// A description of the entitlement.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The type of encryption that will be used on the output that is associated
  /// with this entitlement.
  @_s.JsonKey(name: 'encryption')
  final Encryption encryption;

  /// An indication of whether the entitlement is enabled.
  @_s.JsonKey(name: 'entitlementStatus')
  final EntitlementStatus entitlementStatus;

  Entitlement({
    @_s.required this.entitlementArn,
    @_s.required this.name,
    @_s.required this.subscribers,
    this.dataTransferSubscriberFeePercent,
    this.description,
    this.encryption,
    this.entitlementStatus,
  });
  factory Entitlement.fromJson(Map<String, dynamic> json) =>
      _$EntitlementFromJson(json);
}

enum EntitlementStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on EntitlementStatus {
  String toValue() {
    switch (this) {
      case EntitlementStatus.enabled:
        return 'ENABLED';
      case EntitlementStatus.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The settings for source failover
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FailoverConfig {
  /// Search window time to look for dash-7 packets
  @_s.JsonKey(name: 'recoveryWindow')
  final int recoveryWindow;
  @_s.JsonKey(name: 'state')
  final State state;

  FailoverConfig({
    this.recoveryWindow,
    this.state,
  });
  factory FailoverConfig.fromJson(Map<String, dynamic> json) =>
      _$FailoverConfigFromJson(json);

  Map<String, dynamic> toJson() => _$FailoverConfigToJson(this);
}

/// The settings for a flow, including its source, outputs, and entitlements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Flow {
  /// The Availability Zone that you want to create the flow in. These options are
  /// limited to the Availability Zones within the current AWS.
  @_s.JsonKey(name: 'availabilityZone')
  final String availabilityZone;

  /// The entitlements in this flow.
  @_s.JsonKey(name: 'entitlements')
  final List<Entitlement> entitlements;

  /// The Amazon Resource Name (ARN), a unique identifier for any AWS resource, of
  /// the flow.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The name of the flow.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The outputs in this flow.
  @_s.JsonKey(name: 'outputs')
  final List<Output> outputs;
  @_s.JsonKey(name: 'source')
  final Source source;

  /// The current status of the flow.
  @_s.JsonKey(name: 'status')
  final Status status;

  /// A description of the flow. This value is not used or seen outside of the
  /// current AWS Elemental MediaConnect account.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The IP address from which video will be sent to output destinations.
  @_s.JsonKey(name: 'egressIp')
  final String egressIp;
  @_s.JsonKey(name: 'sourceFailoverConfig')
  final FailoverConfig sourceFailoverConfig;
  @_s.JsonKey(name: 'sources')
  final List<Source> sources;

  /// The VPC Interfaces for this flow.
  @_s.JsonKey(name: 'vpcInterfaces')
  final List<VpcInterface> vpcInterfaces;

  Flow({
    @_s.required this.availabilityZone,
    @_s.required this.entitlements,
    @_s.required this.flowArn,
    @_s.required this.name,
    @_s.required this.outputs,
    @_s.required this.source,
    @_s.required this.status,
    this.description,
    this.egressIp,
    this.sourceFailoverConfig,
    this.sources,
    this.vpcInterfaces,
  });
  factory Flow.fromJson(Map<String, dynamic> json) => _$FlowFromJson(json);
}

/// The entitlements that you want to grant on a flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GrantEntitlementRequest {
  /// The AWS account IDs that you want to share your content with. The receiving
  /// accounts (subscribers) will be allowed to create their own flows using your
  /// content as the source.
  @_s.JsonKey(name: 'subscribers')
  final List<String> subscribers;

  /// Percentage from 0-100 of the data transfer cost to be billed to the
  /// subscriber.
  @_s.JsonKey(name: 'dataTransferSubscriberFeePercent')
  final int dataTransferSubscriberFeePercent;

  /// A description of the entitlement. This description appears only on the AWS
  /// Elemental MediaConnect console and will not be seen by the subscriber or end
  /// user.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The type of encryption that will be used on the output that is associated
  /// with this entitlement.
  @_s.JsonKey(name: 'encryption')
  final Encryption encryption;

  /// An indication of whether the new entitlement should be enabled or disabled
  /// as soon as it is created. If you don’t specify the entitlementStatus field
  /// in your request, MediaConnect sets it to ENABLED.
  @_s.JsonKey(name: 'entitlementStatus')
  final EntitlementStatus entitlementStatus;

  /// The name of the entitlement. This value must be unique within the current
  /// flow.
  @_s.JsonKey(name: 'name')
  final String name;

  GrantEntitlementRequest({
    @_s.required this.subscribers,
    this.dataTransferSubscriberFeePercent,
    this.description,
    this.encryption,
    this.entitlementStatus,
    this.name,
  });
  Map<String, dynamic> toJson() => _$GrantEntitlementRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GrantFlowEntitlementsResponse {
  /// The entitlements that were just granted.
  @_s.JsonKey(name: 'entitlements')
  final List<Entitlement> entitlements;

  /// The ARN of the flow that these entitlements were granted to.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  GrantFlowEntitlementsResponse({
    this.entitlements,
    this.flowArn,
  });
  factory GrantFlowEntitlementsResponse.fromJson(Map<String, dynamic> json) =>
      _$GrantFlowEntitlementsResponseFromJson(json);
}

enum KeyType {
  @_s.JsonValue('speke')
  speke,
  @_s.JsonValue('static-key')
  staticKey,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEntitlementsResponse {
  /// A list of entitlements that have been granted to you from other AWS
  /// accounts.
  @_s.JsonKey(name: 'entitlements')
  final List<ListedEntitlement> entitlements;

  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListEntitlements request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken value.
  /// To see the next batch of results, you can submit the ListEntitlements
  /// request a second time and specify the NextToken value.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListEntitlementsResponse({
    this.entitlements,
    this.nextToken,
  });
  factory ListEntitlementsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListEntitlementsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFlowsResponse {
  /// A list of flow summaries.
  @_s.JsonKey(name: 'flows')
  final List<ListedFlow> flows;

  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListFlows request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken value.
  /// To see the next batch of results, you can submit the ListFlows request a
  /// second time and specify the NextToken value.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFlowsResponse({
    this.flows,
    this.nextToken,
  });
  factory ListFlowsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFlowsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOfferingsResponse {
  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListOfferings request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken value.
  /// To see the next batch of results, you can submit the ListOfferings request a
  /// second time and specify the NextToken value.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of offerings that are available to this account in the current AWS
  /// Region.
  @_s.JsonKey(name: 'offerings')
  final List<Offering> offerings;

  ListOfferingsResponse({
    this.nextToken,
    this.offerings,
  });
  factory ListOfferingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOfferingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListReservationsResponse {
  /// The token that identifies which batch of results that you want to see. For
  /// example, you submit a ListReservations request with MaxResults set at 5. The
  /// service returns the first batch of results (up to 5) and a NextToken value.
  /// To see the next batch of results, you can submit the ListReservations
  /// request a second time and specify the NextToken value.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of all reservations that have been purchased by this account in the
  /// current AWS Region.
  @_s.JsonKey(name: 'reservations')
  final List<Reservation> reservations;

  ListReservationsResponse({
    this.nextToken,
    this.reservations,
  });
  factory ListReservationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListReservationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A map from tag keys to values. Tag keys can have a maximum character length
  /// of 128 characters, and tag values can have a maximum length of 256
  /// characters.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// An entitlement that has been granted to you from other AWS accounts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListedEntitlement {
  /// The ARN of the entitlement.
  @_s.JsonKey(name: 'entitlementArn')
  final String entitlementArn;

  /// The name of the entitlement.
  @_s.JsonKey(name: 'entitlementName')
  final String entitlementName;

  /// Percentage from 0-100 of the data transfer cost to be billed to the
  /// subscriber.
  @_s.JsonKey(name: 'dataTransferSubscriberFeePercent')
  final int dataTransferSubscriberFeePercent;

  ListedEntitlement({
    @_s.required this.entitlementArn,
    @_s.required this.entitlementName,
    this.dataTransferSubscriberFeePercent,
  });
  factory ListedEntitlement.fromJson(Map<String, dynamic> json) =>
      _$ListedEntitlementFromJson(json);
}

/// Provides a summary of a flow, including its ARN, Availability Zone, and
/// source type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListedFlow {
  /// The Availability Zone that the flow was created in.
  @_s.JsonKey(name: 'availabilityZone')
  final String availabilityZone;

  /// A description of the flow.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The ARN of the flow.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The name of the flow.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of source. This value is either owned (originated somewhere other
  /// than an AWS Elemental MediaConnect flow owned by another AWS account) or
  /// entitled (originated at an AWS Elemental MediaConnect flow owned by another
  /// AWS account).
  @_s.JsonKey(name: 'sourceType')
  final SourceType sourceType;

  /// The current status of the flow.
  @_s.JsonKey(name: 'status')
  final Status status;

  ListedFlow({
    @_s.required this.availabilityZone,
    @_s.required this.description,
    @_s.required this.flowArn,
    @_s.required this.name,
    @_s.required this.sourceType,
    @_s.required this.status,
  });
  factory ListedFlow.fromJson(Map<String, dynamic> json) =>
      _$ListedFlowFromJson(json);
}

/// Messages that provide the state of the flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Messages {
  /// A list of errors that might have been generated from processes on this flow.
  @_s.JsonKey(name: 'errors')
  final List<String> errors;

  Messages({
    @_s.required this.errors,
  });
  factory Messages.fromJson(Map<String, dynamic> json) =>
      _$MessagesFromJson(json);
}

/// A savings plan that reserves a certain amount of outbound bandwidth usage at
/// a discounted rate each month over a period of time.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Offering {
  /// The type of currency that is used for billing. The currencyCode used for all
  /// reservations is US dollars.
  @_s.JsonKey(name: 'currencyCode')
  final String currencyCode;

  /// The length of time that your reservation would be active.
  @_s.JsonKey(name: 'duration')
  final int duration;

  /// The unit of measurement for the duration of the offering.
  @_s.JsonKey(name: 'durationUnits')
  final DurationUnits durationUnits;

  /// The Amazon Resource Name (ARN) that MediaConnect assigns to the offering.
  @_s.JsonKey(name: 'offeringArn')
  final String offeringArn;

  /// A description of the offering.
  @_s.JsonKey(name: 'offeringDescription')
  final String offeringDescription;

  /// The cost of a single unit. This value, in combination with priceUnits, makes
  /// up the rate.
  @_s.JsonKey(name: 'pricePerUnit')
  final String pricePerUnit;

  /// The unit of measurement that is used for billing. This value, in combination
  /// with pricePerUnit, makes up the rate.
  @_s.JsonKey(name: 'priceUnits')
  final PriceUnits priceUnits;

  /// A definition of the amount of outbound bandwidth that you would be reserving
  /// if you purchase the offering.
  @_s.JsonKey(name: 'resourceSpecification')
  final ResourceSpecification resourceSpecification;

  Offering({
    @_s.required this.currencyCode,
    @_s.required this.duration,
    @_s.required this.durationUnits,
    @_s.required this.offeringArn,
    @_s.required this.offeringDescription,
    @_s.required this.pricePerUnit,
    @_s.required this.priceUnits,
    @_s.required this.resourceSpecification,
  });
  factory Offering.fromJson(Map<String, dynamic> json) =>
      _$OfferingFromJson(json);
}

/// The settings for an output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Output {
  /// The name of the output. This value must be unique within the current flow.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ARN of the output.
  @_s.JsonKey(name: 'outputArn')
  final String outputArn;

  /// Percentage from 0-100 of the data transfer cost to be billed to the
  /// subscriber.
  @_s.JsonKey(name: 'dataTransferSubscriberFeePercent')
  final int dataTransferSubscriberFeePercent;

  /// A description of the output.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The address where you want to send the output.
  @_s.JsonKey(name: 'destination')
  final String destination;

  /// The type of key used for the encryption. If no keyType is provided, the
  /// service will use the default setting (static-key).
  @_s.JsonKey(name: 'encryption')
  final Encryption encryption;

  /// The ARN of the entitlement on the originator''s flow. This value is relevant
  /// only on entitled flows.
  @_s.JsonKey(name: 'entitlementArn')
  final String entitlementArn;

  /// The input ARN of the AWS Elemental MediaLive channel. This parameter is
  /// relevant only for outputs that were added by creating a MediaLive input.
  @_s.JsonKey(name: 'mediaLiveInputArn')
  final String mediaLiveInputArn;

  /// The port to use when content is distributed to this output.
  @_s.JsonKey(name: 'port')
  final int port;

  /// Attributes related to the transport stream that are used in the output.
  @_s.JsonKey(name: 'transport')
  final Transport transport;

  /// The name of the VPC interface attachment to use for this output.
  @_s.JsonKey(name: 'vpcInterfaceAttachment')
  final VpcInterfaceAttachment vpcInterfaceAttachment;

  Output({
    @_s.required this.name,
    @_s.required this.outputArn,
    this.dataTransferSubscriberFeePercent,
    this.description,
    this.destination,
    this.encryption,
    this.entitlementArn,
    this.mediaLiveInputArn,
    this.port,
    this.transport,
    this.vpcInterfaceAttachment,
  });
  factory Output.fromJson(Map<String, dynamic> json) => _$OutputFromJson(json);
}

enum PriceUnits {
  @_s.JsonValue('HOURLY')
  hourly,
}

enum Protocol {
  @_s.JsonValue('zixi-push')
  zixiPush,
  @_s.JsonValue('rtp-fec')
  rtpFec,
  @_s.JsonValue('rtp')
  rtp,
  @_s.JsonValue('zixi-pull')
  zixiPull,
  @_s.JsonValue('rist')
  rist,
}

extension on Protocol {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PurchaseOfferingResponse {
  @_s.JsonKey(name: 'reservation')
  final Reservation reservation;

  PurchaseOfferingResponse({
    this.reservation,
  });
  factory PurchaseOfferingResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOfferingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveFlowOutputResponse {
  /// The ARN of the flow that is associated with the output you removed.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The ARN of the output that was removed.
  @_s.JsonKey(name: 'outputArn')
  final String outputArn;

  RemoveFlowOutputResponse({
    this.flowArn,
    this.outputArn,
  });
  factory RemoveFlowOutputResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveFlowOutputResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveFlowSourceResponse {
  /// The ARN of the flow that is associated with the source you removed.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The ARN of the source that was removed.
  @_s.JsonKey(name: 'sourceArn')
  final String sourceArn;

  RemoveFlowSourceResponse({
    this.flowArn,
    this.sourceArn,
  });
  factory RemoveFlowSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveFlowSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveFlowVpcInterfaceResponse {
  /// The ARN of the flow that is associated with the VPC interface you removed.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// IDs of network interfaces associated with the removed VPC interface that
  /// Media Connect was unable to remove.
  @_s.JsonKey(name: 'nonDeletedNetworkInterfaceIds')
  final List<String> nonDeletedNetworkInterfaceIds;

  /// The name of the VPC interface that was removed.
  @_s.JsonKey(name: 'vpcInterfaceName')
  final String vpcInterfaceName;

  RemoveFlowVpcInterfaceResponse({
    this.flowArn,
    this.nonDeletedNetworkInterfaceIds,
    this.vpcInterfaceName,
  });
  factory RemoveFlowVpcInterfaceResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveFlowVpcInterfaceResponseFromJson(json);
}

/// A pricing agreement for a discounted rate for a specific outbound bandwidth
/// that your MediaConnect account will use each month over a specific time
/// period. The discounted rate in the reservation applies to outbound bandwidth
/// for all flows from your account until your account reaches the amount of
/// bandwidth in your reservation. If you use more outbound bandwidth than the
/// agreed upon amount in a single month, the overage is charged at the
/// on-demand rate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Reservation {
  /// The type of currency that is used for billing. The currencyCode used for
  /// your reservation is US dollars.
  @_s.JsonKey(name: 'currencyCode')
  final String currencyCode;

  /// The length of time that this reservation is active. MediaConnect defines
  /// this value in the offering.
  @_s.JsonKey(name: 'duration')
  final int duration;

  /// The unit of measurement for the duration of the reservation. MediaConnect
  /// defines this value in the offering.
  @_s.JsonKey(name: 'durationUnits')
  final DurationUnits durationUnits;

  /// The day and time that this reservation expires. This value is calculated
  /// based on the start date and time that you set and the offering's duration.
  @_s.JsonKey(name: 'end')
  final String end;

  /// The Amazon Resource Name (ARN) that MediaConnect assigns to the offering.
  @_s.JsonKey(name: 'offeringArn')
  final String offeringArn;

  /// A description of the offering. MediaConnect defines this value in the
  /// offering.
  @_s.JsonKey(name: 'offeringDescription')
  final String offeringDescription;

  /// The cost of a single unit. This value, in combination with priceUnits, makes
  /// up the rate. MediaConnect defines this value in the offering.
  @_s.JsonKey(name: 'pricePerUnit')
  final String pricePerUnit;

  /// The unit of measurement that is used for billing. This value, in combination
  /// with pricePerUnit, makes up the rate. MediaConnect defines this value in the
  /// offering.
  @_s.JsonKey(name: 'priceUnits')
  final PriceUnits priceUnits;

  /// The Amazon Resource Name (ARN) that MediaConnect assigns to the reservation
  /// when you purchase an offering.
  @_s.JsonKey(name: 'reservationArn')
  final String reservationArn;

  /// The name that you assigned to the reservation when you purchased the
  /// offering.
  @_s.JsonKey(name: 'reservationName')
  final String reservationName;

  /// The status of your reservation.
  @_s.JsonKey(name: 'reservationState')
  final ReservationState reservationState;

  /// A definition of the amount of outbound bandwidth that you would be reserving
  /// if you purchase the offering. MediaConnect defines the values that make up
  /// the resourceSpecification in the offering.
  @_s.JsonKey(name: 'resourceSpecification')
  final ResourceSpecification resourceSpecification;

  /// The day and time that the reservation becomes active. You set this value
  /// when you purchase the offering.
  @_s.JsonKey(name: 'start')
  final String start;

  Reservation({
    @_s.required this.currencyCode,
    @_s.required this.duration,
    @_s.required this.durationUnits,
    @_s.required this.end,
    @_s.required this.offeringArn,
    @_s.required this.offeringDescription,
    @_s.required this.pricePerUnit,
    @_s.required this.priceUnits,
    @_s.required this.reservationArn,
    @_s.required this.reservationName,
    @_s.required this.reservationState,
    @_s.required this.resourceSpecification,
    @_s.required this.start,
  });
  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
}

enum ReservationState {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('EXPIRED')
  expired,
  @_s.JsonValue('PROCESSING')
  processing,
  @_s.JsonValue('CANCELED')
  canceled,
}

/// A definition of what is being billed for, including the type and amount.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceSpecification {
  /// The type of resource and the unit that is being billed for.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The amount of outbound bandwidth that is discounted in the offering.
  @_s.JsonKey(name: 'reservedBitrate')
  final int reservedBitrate;

  ResourceSpecification({
    @_s.required this.resourceType,
    this.reservedBitrate,
  });
  factory ResourceSpecification.fromJson(Map<String, dynamic> json) =>
      _$ResourceSpecificationFromJson(json);
}

enum ResourceType {
  @_s.JsonValue('Mbps_Outbound_Bandwidth')
  mbpsOutboundBandwidth,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RevokeFlowEntitlementResponse {
  /// The ARN of the entitlement that was revoked.
  @_s.JsonKey(name: 'entitlementArn')
  final String entitlementArn;

  /// The ARN of the flow that the entitlement was revoked from.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  RevokeFlowEntitlementResponse({
    this.entitlementArn,
    this.flowArn,
  });
  factory RevokeFlowEntitlementResponse.fromJson(Map<String, dynamic> json) =>
      _$RevokeFlowEntitlementResponseFromJson(json);
}

/// The settings for the source of the flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SetSourceRequest {
  /// The type of encryption that is used on the content ingested from this
  /// source.
  @_s.JsonKey(name: 'decryption')
  final Encryption decryption;

  /// A description for the source. This value is not used or seen outside of the
  /// current AWS Elemental MediaConnect account.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The ARN of the entitlement that allows you to subscribe to this flow. The
  /// entitlement is set by the flow originator, and the ARN is generated as part
  /// of the originator's flow.
  @_s.JsonKey(name: 'entitlementArn')
  final String entitlementArn;

  /// The port that the flow will be listening on for incoming content.
  @_s.JsonKey(name: 'ingestPort')
  final int ingestPort;

  /// The smoothing max bitrate for RIST, RTP, and RTP-FEC streams.
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based and Zixi-based streams.
  @_s.JsonKey(name: 'maxLatency')
  final int maxLatency;

  /// The name of the source.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The protocol that is used by the source.
  @_s.JsonKey(name: 'protocol')
  final Protocol protocol;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi-based streams.
  @_s.JsonKey(name: 'streamId')
  final String streamId;

  /// The name of the VPC interface to use for this source.
  @_s.JsonKey(name: 'vpcInterfaceName')
  final String vpcInterfaceName;

  /// The range of IP addresses that should be allowed to contribute content to
  /// your source. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  @_s.JsonKey(name: 'whitelistCidr')
  final String whitelistCidr;

  SetSourceRequest({
    this.decryption,
    this.description,
    this.entitlementArn,
    this.ingestPort,
    this.maxBitrate,
    this.maxLatency,
    this.name,
    this.protocol,
    this.streamId,
    this.vpcInterfaceName,
    this.whitelistCidr,
  });
  Map<String, dynamic> toJson() => _$SetSourceRequestToJson(this);
}

/// The settings for the source of the flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Source {
  /// The name of the source.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ARN of the source.
  @_s.JsonKey(name: 'sourceArn')
  final String sourceArn;

  /// Percentage from 0-100 of the data transfer cost to be billed to the
  /// subscriber.
  @_s.JsonKey(name: 'dataTransferSubscriberFeePercent')
  final int dataTransferSubscriberFeePercent;

  /// The type of encryption that is used on the content ingested from this
  /// source.
  @_s.JsonKey(name: 'decryption')
  final Encryption decryption;

  /// A description for the source. This value is not used or seen outside of the
  /// current AWS Elemental MediaConnect account.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The ARN of the entitlement that allows you to subscribe to content that
  /// comes from another AWS account. The entitlement is set by the content
  /// originator and the ARN is generated as part of the originator's flow.
  @_s.JsonKey(name: 'entitlementArn')
  final String entitlementArn;

  /// The IP address that the flow will be listening on for incoming content.
  @_s.JsonKey(name: 'ingestIp')
  final String ingestIp;

  /// The port that the flow will be listening on for incoming content.
  @_s.JsonKey(name: 'ingestPort')
  final int ingestPort;

  /// Attributes related to the transport stream that are used in the source.
  @_s.JsonKey(name: 'transport')
  final Transport transport;

  /// The name of the VPC Interface this Source is configured with.
  @_s.JsonKey(name: 'vpcInterfaceName')
  final String vpcInterfaceName;

  /// The range of IP addresses that should be allowed to contribute content to
  /// your source. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  @_s.JsonKey(name: 'whitelistCidr')
  final String whitelistCidr;

  Source({
    @_s.required this.name,
    @_s.required this.sourceArn,
    this.dataTransferSubscriberFeePercent,
    this.decryption,
    this.description,
    this.entitlementArn,
    this.ingestIp,
    this.ingestPort,
    this.transport,
    this.vpcInterfaceName,
    this.whitelistCidr,
  });
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

enum SourceType {
  @_s.JsonValue('OWNED')
  owned,
  @_s.JsonValue('ENTITLED')
  entitled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartFlowResponse {
  /// The ARN of the flow that you started.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The status of the flow when the StartFlow process begins.
  @_s.JsonKey(name: 'status')
  final Status status;

  StartFlowResponse({
    this.flowArn,
    this.status,
  });
  factory StartFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$StartFlowResponseFromJson(json);
}

enum State {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

enum Status {
  @_s.JsonValue('STANDBY')
  standby,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('ERROR')
  error,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopFlowResponse {
  /// The ARN of the flow that you stopped.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The status of the flow when the StopFlow process begins.
  @_s.JsonKey(name: 'status')
  final Status status;

  StopFlowResponse({
    this.flowArn,
    this.status,
  });
  factory StopFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$StopFlowResponseFromJson(json);
}

/// Attributes related to the transport stream that are used in a source or
/// output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Transport {
  /// The protocol that is used by the source or output.
  @_s.JsonKey(name: 'protocol')
  final Protocol protocol;

  /// The range of IP addresses that should be allowed to initiate output requests
  /// to this flow. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  @_s.JsonKey(name: 'cidrAllowList')
  final List<String> cidrAllowList;

  /// The smoothing max bitrate for RIST, RTP, and RTP-FEC streams.
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based and Zixi-based streams.
  @_s.JsonKey(name: 'maxLatency')
  final int maxLatency;

  /// The remote ID for the Zixi-pull stream.
  @_s.JsonKey(name: 'remoteId')
  final String remoteId;

  /// The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
  @_s.JsonKey(name: 'smoothingLatency')
  final int smoothingLatency;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi-based streams.
  @_s.JsonKey(name: 'streamId')
  final String streamId;

  Transport({
    @_s.required this.protocol,
    this.cidrAllowList,
    this.maxBitrate,
    this.maxLatency,
    this.remoteId,
    this.smoothingLatency,
    this.streamId,
  });
  factory Transport.fromJson(Map<String, dynamic> json) =>
      _$TransportFromJson(json);
}

/// Information about the encryption of the flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateEncryption {
  /// The type of algorithm that is used for the encryption (such as aes128,
  /// aes192, or aes256).
  @_s.JsonKey(name: 'algorithm')
  final Algorithm algorithm;

  /// A 128-bit, 16-byte hex value represented by a 32-character string, to be
  /// used with the key for encrypting content. This parameter is not valid for
  /// static key encryption.
  @_s.JsonKey(name: 'constantInitializationVector')
  final String constantInitializationVector;

  /// The value of one of the devices that you configured with your digital rights
  /// management (DRM) platform key provider. This parameter is required for SPEKE
  /// encryption and is not valid for static key encryption.
  @_s.JsonKey(name: 'deviceId')
  final String deviceId;

  /// The type of key that is used for the encryption. If no keyType is provided,
  /// the service will use the default setting (static-key).
  @_s.JsonKey(name: 'keyType')
  final KeyType keyType;

  /// The AWS Region that the API Gateway proxy endpoint was created in. This
  /// parameter is required for SPEKE encryption and is not valid for static key
  /// encryption.
  @_s.JsonKey(name: 'region')
  final String region;

  /// An identifier for the content. The service sends this value to the key
  /// server to identify the current endpoint. The resource ID is also known as
  /// the content ID. This parameter is required for SPEKE encryption and is not
  /// valid for static key encryption.
  @_s.JsonKey(name: 'resourceId')
  final String resourceId;

  /// The ARN of the role that you created during setup (when you set up AWS
  /// Elemental MediaConnect as a trusted entity).
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The ARN of the secret that you created in AWS Secrets Manager to store the
  /// encryption key. This parameter is required for static key encryption and is
  /// not valid for SPEKE encryption.
  @_s.JsonKey(name: 'secretArn')
  final String secretArn;

  /// The URL from the API Gateway proxy that you set up to talk to your key
  /// server. This parameter is required for SPEKE encryption and is not valid for
  /// static key encryption.
  @_s.JsonKey(name: 'url')
  final String url;

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
  Map<String, dynamic> toJson() => _$UpdateEncryptionToJson(this);
}

/// The settings for source failover
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateFailoverConfig {
  /// Recovery window time to look for dash-7 packets
  @_s.JsonKey(name: 'recoveryWindow')
  final int recoveryWindow;
  @_s.JsonKey(name: 'state')
  final State state;

  UpdateFailoverConfig({
    this.recoveryWindow,
    this.state,
  });
  Map<String, dynamic> toJson() => _$UpdateFailoverConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFlowEntitlementResponse {
  /// The new configuration of the entitlement that you updated.
  @_s.JsonKey(name: 'entitlement')
  final Entitlement entitlement;

  /// The ARN of the flow that this entitlement was granted on.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  UpdateFlowEntitlementResponse({
    this.entitlement,
    this.flowArn,
  });
  factory UpdateFlowEntitlementResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFlowEntitlementResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFlowOutputResponse {
  /// The ARN of the flow that is associated with the updated output.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The new settings of the output that you updated.
  @_s.JsonKey(name: 'output')
  final Output output;

  UpdateFlowOutputResponse({
    this.flowArn,
    this.output,
  });
  factory UpdateFlowOutputResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFlowOutputResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFlowResponse {
  @_s.JsonKey(name: 'flow')
  final Flow flow;

  UpdateFlowResponse({
    this.flow,
  });
  factory UpdateFlowResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFlowResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFlowSourceResponse {
  /// The ARN of the flow that you want to update.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  /// The settings for the source of the flow.
  @_s.JsonKey(name: 'source')
  final Source source;

  UpdateFlowSourceResponse({
    this.flowArn,
    this.source,
  });
  factory UpdateFlowSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFlowSourceResponseFromJson(json);
}

/// The settings for a VPC Source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcInterface {
  /// Immutable and has to be a unique against other VpcInterfaces in this Flow
  @_s.JsonKey(name: 'name')
  final String name;

  /// IDs of the network interfaces created in customer's account by MediaConnect.
  @_s.JsonKey(name: 'networkInterfaceIds')
  final List<String> networkInterfaceIds;

  /// Role Arn MediaConnect can assumes to create ENIs in customer's account
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// Security Group IDs to be used on ENI.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// Subnet must be in the AZ of the Flow
  @_s.JsonKey(name: 'subnetId')
  final String subnetId;

  VpcInterface({
    @_s.required this.name,
    @_s.required this.networkInterfaceIds,
    @_s.required this.roleArn,
    @_s.required this.securityGroupIds,
    @_s.required this.subnetId,
  });
  factory VpcInterface.fromJson(Map<String, dynamic> json) =>
      _$VpcInterfaceFromJson(json);
}

/// The settings for attaching a VPC interface to an output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VpcInterfaceAttachment {
  /// The name of the VPC interface to use for this output.
  @_s.JsonKey(name: 'vpcInterfaceName')
  final String vpcInterfaceName;

  VpcInterfaceAttachment({
    this.vpcInterfaceName,
  });
  factory VpcInterfaceAttachment.fromJson(Map<String, dynamic> json) =>
      _$VpcInterfaceAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$VpcInterfaceAttachmentToJson(this);
}

/// Desired VPC Interface for a Flow
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VpcInterfaceRequest {
  /// The name of the VPC Interface. This value must be unique within the current
  /// flow.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Role Arn MediaConnect can assumes to create ENIs in customer's account
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// Security Group IDs to be used on ENI.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// Subnet must be in the AZ of the Flow
  @_s.JsonKey(name: 'subnetId')
  final String subnetId;

  VpcInterfaceRequest({
    @_s.required this.name,
    @_s.required this.roleArn,
    @_s.required this.securityGroupIds,
    @_s.required this.subnetId,
  });
  Map<String, dynamic> toJson() => _$VpcInterfaceRequestToJson(this);
}

class AddFlowOutputs420Exception extends _s.GenericAwsException {
  AddFlowOutputs420Exception({String type, String message})
      : super(type: type, code: 'AddFlowOutputs420Exception', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class CreateFlow420Exception extends _s.GenericAwsException {
  CreateFlow420Exception({String type, String message})
      : super(type: type, code: 'CreateFlow420Exception', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class GrantFlowEntitlements420Exception extends _s.GenericAwsException {
  GrantFlowEntitlements420Exception({String type, String message})
      : super(
            type: type,
            code: 'GrantFlowEntitlements420Exception',
            message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
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
  'AddFlowOutputs420Exception': (type, message) =>
      AddFlowOutputs420Exception(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'CreateFlow420Exception': (type, message) =>
      CreateFlow420Exception(type: type, message: message),
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
