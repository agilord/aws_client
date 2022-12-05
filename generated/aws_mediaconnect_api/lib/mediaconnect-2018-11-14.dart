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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

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
    required String flowArn,
    required List<SetSourceRequest> sources,
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
    required String flowArn,
    required List<VpcInterfaceRequest> vpcInterfaces,
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
    required String name,
    String? availabilityZone,
    List<GrantEntitlementRequest>? entitlements,
    List<AddOutputRequest>? outputs,
    SetSourceRequest? source,
    FailoverConfig? sourceFailoverConfig,
    List<SetSourceRequest>? sources,
    List<VpcInterfaceRequest>? vpcInterfaces,
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
    required String flowArn,
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
    required String flowArn,
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
    required String offeringArn,
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
    required String reservationArn,
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
    required List<GrantEntitlementRequest> entitlements,
    required String flowArn,
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
    required String offeringArn,
    required String reservationName,
    required String start,
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
    required String flowArn,
    required String outputArn,
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
    required String flowArn,
    required String sourceArn,
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
    required String flowArn,
    required String vpcInterfaceName,
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
    required String entitlementArn,
    required String flowArn,
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
    required String flowArn,
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
    required String flowArn,
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
    required String resourceArn,
    required Map<String, String> tags,
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
    UpdateFailoverConfig? sourceFailoverConfig,
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
    required String entitlementArn,
    required String flowArn,
    String? description,
    UpdateEncryption? encryption,
    EntitlementStatus? entitlementStatus,
    List<String>? subscribers,
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
    required String flowArn,
    required String outputArn,
    List<String>? cidrAllowList,
    String? description,
    String? destination,
    UpdateEncryption? encryption,
    int? maxLatency,
    int? port,
    Protocol? protocol,
    String? remoteId,
    int? smoothingLatency,
    String? streamId,
    VpcInterfaceAttachment? vpcInterfaceAttachment,
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
    required String flowArn,
    required String sourceArn,
    UpdateEncryption? decryption,
    String? description,
    String? entitlementArn,
    int? ingestPort,
    int? maxBitrate,
    int? maxLatency,
    Protocol? protocol,
    String? streamId,
    String? vpcInterfaceName,
    String? whitelistCidr,
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
  /// service will use the default setting (static-key).
  final Encryption? encryption;

  /// The maximum latency in milliseconds for Zixi-based streams.
  final int? maxLatency;

  /// The name of the output. This value must be unique within the current flow.
  final String? name;

  /// The port to use when content is distributed to this output.
  final int? port;

  /// The remote ID for the Zixi-pull output stream.
  final String? remoteId;

  /// The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
  final int? smoothingLatency;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi-based streams.
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
    this.name,
    this.port,
    this.remoteId,
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
    final name = this.name;
    final port = this.port;
    final remoteId = this.remoteId;
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
      if (name != null) 'name': name,
      if (port != null) 'port': port,
      if (remoteId != null) 'remoteId': remoteId,
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

/// Information about the encryption of the flow.
class Encryption {
  /// The type of algorithm that is used for the encryption (such as aes128,
  /// aes192, or aes256).
  final Algorithm algorithm;

  /// The ARN of the role that you created during setup (when you set up AWS
  /// Elemental MediaConnect as a trusted entity).
  final String roleArn;

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
    required this.algorithm,
    required this.roleArn,
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
      algorithm: (json['algorithm'] as String).toAlgorithm(),
      roleArn: json['roleArn'] as String,
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
    final algorithm = this.algorithm;
    final roleArn = this.roleArn;
    final constantInitializationVector = this.constantInitializationVector;
    final deviceId = this.deviceId;
    final keyType = this.keyType;
    final region = this.region;
    final resourceId = this.resourceId;
    final secretArn = this.secretArn;
    final url = this.url;
    return {
      'algorithm': algorithm.toValue(),
      'roleArn': roleArn,
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

/// The settings for source failover
class FailoverConfig {
  /// Search window time to look for dash-7 packets
  final int? recoveryWindow;
  final State? state;

  FailoverConfig({
    this.recoveryWindow,
    this.state,
  });
  factory FailoverConfig.fromJson(Map<String, dynamic> json) {
    return FailoverConfig(
      recoveryWindow: json['recoveryWindow'] as int?,
      state: (json['state'] as String?)?.toState(),
    );
  }

  Map<String, dynamic> toJson() {
    final recoveryWindow = this.recoveryWindow;
    final state = this.state;
    return {
      if (recoveryWindow != null) 'recoveryWindow': recoveryWindow,
      if (state != null) 'state': state.toValue(),
    };
  }
}

/// The settings for a flow, including its source, outputs, and entitlements.
class Flow {
  /// The Availability Zone that you want to create the flow in. These options are
  /// limited to the Availability Zones within the current AWS.
  final String availabilityZone;

  /// The entitlements in this flow.
  final List<Entitlement> entitlements;

  /// The Amazon Resource Name (ARN), a unique identifier for any AWS resource, of
  /// the flow.
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
  /// with this entitlement.
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
}

enum KeyType {
  speke,
  staticKey,
}

extension KeyTypeValueExtension on KeyType {
  String toValue() {
    switch (this) {
      case KeyType.speke:
        return 'speke';
      case KeyType.staticKey:
        return 'static-key';
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
    }
    throw Exception('$this is not known in enum KeyType');
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

  ListedFlow({
    required this.availabilityZone,
    required this.description,
    required this.flowArn,
    required this.name,
    required this.sourceType,
    required this.status,
  });
  factory ListedFlow.fromJson(Map<String, dynamic> json) {
    return ListedFlow(
      availabilityZone: json['availabilityZone'] as String,
      description: json['description'] as String,
      flowArn: json['flowArn'] as String,
      name: json['name'] as String,
      sourceType: (json['sourceType'] as String).toSourceType(),
      status: (json['status'] as String).toStatus(),
    );
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
}

/// The settings for an output.
class Output {
  /// The name of the output. This value must be unique within the current flow.
  final String name;

  /// The ARN of the output.
  final String outputArn;

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

  /// The input ARN of the AWS Elemental MediaLive channel. This parameter is
  /// relevant only for outputs that were added by creating a MediaLive input.
  final String? mediaLiveInputArn;

  /// The port to use when content is distributed to this output.
  final int? port;

  /// Attributes related to the transport stream that are used in the output.
  final Transport? transport;

  /// The name of the VPC interface attachment to use for this output.
  final VpcInterfaceAttachment? vpcInterfaceAttachment;

  Output({
    required this.name,
    required this.outputArn,
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
  factory Output.fromJson(Map<String, dynamic> json) {
    return Output(
      name: json['name'] as String,
      outputArn: json['outputArn'] as String,
      dataTransferSubscriberFeePercent:
          json['dataTransferSubscriberFeePercent'] as int?,
      description: json['description'] as String?,
      destination: json['destination'] as String?,
      encryption: json['encryption'] != null
          ? Encryption.fromJson(json['encryption'] as Map<String, dynamic>)
          : null,
      entitlementArn: json['entitlementArn'] as String?,
      mediaLiveInputArn: json['mediaLiveInputArn'] as String?,
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
}

/// The settings for the source of the flow.
class SetSourceRequest {
  /// The type of encryption that is used on the content ingested from this
  /// source.
  final Encryption? decryption;

  /// A description for the source. This value is not used or seen outside of the
  /// current AWS Elemental MediaConnect account.
  final String? description;

  /// The ARN of the entitlement that allows you to subscribe to this flow. The
  /// entitlement is set by the flow originator, and the ARN is generated as part
  /// of the originator's flow.
  final String? entitlementArn;

  /// The port that the flow will be listening on for incoming content.
  final int? ingestPort;

  /// The smoothing max bitrate for RIST, RTP, and RTP-FEC streams.
  final int? maxBitrate;

  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based and Zixi-based streams.
  final int? maxLatency;

  /// The name of the source.
  final String? name;

  /// The protocol that is used by the source.
  final Protocol? protocol;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi-based streams.
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
    this.ingestPort,
    this.maxBitrate,
    this.maxLatency,
    this.name,
    this.protocol,
    this.streamId,
    this.vpcInterfaceName,
    this.whitelistCidr,
  });
  Map<String, dynamic> toJson() {
    final decryption = this.decryption;
    final description = this.description;
    final entitlementArn = this.entitlementArn;
    final ingestPort = this.ingestPort;
    final maxBitrate = this.maxBitrate;
    final maxLatency = this.maxLatency;
    final name = this.name;
    final protocol = this.protocol;
    final streamId = this.streamId;
    final vpcInterfaceName = this.vpcInterfaceName;
    final whitelistCidr = this.whitelistCidr;
    return {
      if (decryption != null) 'decryption': decryption,
      if (description != null) 'description': description,
      if (entitlementArn != null) 'entitlementArn': entitlementArn,
      if (ingestPort != null) 'ingestPort': ingestPort,
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (maxLatency != null) 'maxLatency': maxLatency,
      if (name != null) 'name': name,
      if (protocol != null) 'protocol': protocol.toValue(),
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

  /// The IP address that the flow will be listening on for incoming content.
  final String? ingestIp;

  /// The port that the flow will be listening on for incoming content.
  final int? ingestPort;

  /// Attributes related to the transport stream that are used in the source.
  final Transport? transport;

  /// The name of the VPC Interface this Source is configured with.
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
    this.ingestIp,
    this.ingestPort,
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
      ingestIp: json['ingestIp'] as String?,
      ingestPort: json['ingestPort'] as int?,
      transport: json['transport'] != null
          ? Transport.fromJson(json['transport'] as Map<String, dynamic>)
          : null,
      vpcInterfaceName: json['vpcInterfaceName'] as String?,
      whitelistCidr: json['whitelistCidr'] as String?,
    );
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

  /// The smoothing max bitrate for RIST, RTP, and RTP-FEC streams.
  final int? maxBitrate;

  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based and Zixi-based streams.
  final int? maxLatency;

  /// The remote ID for the Zixi-pull stream.
  final String? remoteId;

  /// The smoothing latency in milliseconds for RIST, RTP, and RTP-FEC streams.
  final int? smoothingLatency;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi-based streams.
  final String? streamId;

  Transport({
    required this.protocol,
    this.cidrAllowList,
    this.maxBitrate,
    this.maxLatency,
    this.remoteId,
    this.smoothingLatency,
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
      remoteId: json['remoteId'] as String?,
      smoothingLatency: json['smoothingLatency'] as int?,
      streamId: json['streamId'] as String?,
    );
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

/// The settings for source failover
class UpdateFailoverConfig {
  /// Recovery window time to look for dash-7 packets
  final int? recoveryWindow;
  final State? state;

  UpdateFailoverConfig({
    this.recoveryWindow,
    this.state,
  });
  Map<String, dynamic> toJson() {
    final recoveryWindow = this.recoveryWindow;
    final state = this.state;
    return {
      if (recoveryWindow != null) 'recoveryWindow': recoveryWindow,
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
}

/// The settings for a VPC Source.
class VpcInterface {
  /// Immutable and has to be a unique against other VpcInterfaces in this Flow
  final String name;

  /// IDs of the network interfaces created in customer's account by MediaConnect.
  final List<String> networkInterfaceIds;

  /// Role Arn MediaConnect can assumes to create ENIs in customer's account
  final String roleArn;

  /// Security Group IDs to be used on ENI.
  final List<String> securityGroupIds;

  /// Subnet must be in the AZ of the Flow
  final String subnetId;

  VpcInterface({
    required this.name,
    required this.networkInterfaceIds,
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
      roleArn: json['roleArn'] as String,
      securityGroupIds: (json['securityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetId: json['subnetId'] as String,
    );
  }
}

/// The settings for attaching a VPC interface to an output.
class VpcInterfaceAttachment {
  /// The name of the VPC interface to use for this output.
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

  VpcInterfaceRequest({
    required this.name,
    required this.roleArn,
    required this.securityGroupIds,
    required this.subnetId,
  });
  Map<String, dynamic> toJson() {
    final name = this.name;
    final roleArn = this.roleArn;
    final securityGroupIds = this.securityGroupIds;
    final subnetId = this.subnetId;
    return {
      'name': name,
      'roleArn': roleArn,
      'securityGroupIds': securityGroupIds,
      'subnetId': subnetId,
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

class CreateFlow420Exception extends _s.GenericAwsException {
  CreateFlow420Exception({String? type, String? message})
      : super(type: type, code: 'CreateFlow420Exception', message: message);
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
