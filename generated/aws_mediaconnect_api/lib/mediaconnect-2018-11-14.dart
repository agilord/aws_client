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

part 'mediaconnect-2018-11-14.g.dart';

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
          service: 'mediaconnect',
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
    final $payload = AddFlowOutputsRequest(
      flowArn: flowArn,
      outputs: outputs,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn.toString())}/outputs',
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
    final $payload = AddFlowSourcesRequest(
      flowArn: flowArn,
      sources: sources,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn.toString())}/source',
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
    final $payload = AddFlowVpcInterfacesRequest(
      flowArn: flowArn,
      vpcInterfaces: vpcInterfaces,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn.toString())}/vpcInterfaces',
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
    final $payload = CreateFlowRequest(
      name: name,
      availabilityZone: availabilityZone,
      entitlements: entitlements,
      outputs: outputs,
      source: source,
      sourceFailoverConfig: sourceFailoverConfig,
      sources: sources,
      vpcInterfaces: vpcInterfaces,
    );
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
    final $payload = DeleteFlowRequest(
      flowArn: flowArn,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn.toString())}',
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
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFlowResponse.fromJson(response);
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
    final $payload = GrantFlowEntitlementsRequest(
      entitlements: entitlements,
      flowArn: flowArn,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn.toString())}/entitlements',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/entitlements$_query',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/flows$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListFlowsResponse.fromJson(response);
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
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
    final $payload = RemoveFlowOutputRequest(
      flowArn: flowArn,
      outputArn: outputArn,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn.toString())}/outputs/${Uri.encodeComponent(outputArn.toString())}',
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
    final $payload = RemoveFlowSourceRequest(
      flowArn: flowArn,
      sourceArn: sourceArn,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn.toString())}/source/${Uri.encodeComponent(sourceArn.toString())}',
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
    final $payload = RemoveFlowVpcInterfaceRequest(
      flowArn: flowArn,
      vpcInterfaceName: vpcInterfaceName,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn.toString())}/vpcInterfaces/${Uri.encodeComponent(vpcInterfaceName.toString())}',
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
    final $payload = RevokeFlowEntitlementRequest(
      entitlementArn: entitlementArn,
      flowArn: flowArn,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn.toString())}/entitlements/${Uri.encodeComponent(entitlementArn.toString())}',
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
    final $payload = StartFlowRequest(
      flowArn: flowArn,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/flows/start/${Uri.encodeComponent(flowArn.toString())}',
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
    final $payload = StopFlowRequest(
      flowArn: flowArn,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/flows/stop/${Uri.encodeComponent(flowArn.toString())}',
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
    final $payload = TagResourceRequest(
      resourceArn: resourceArn,
      tags: tags,
    );
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}$_query',
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
    final $payload = UpdateFlowRequest(
      flowArn: flowArn,
      sourceFailoverConfig: sourceFailoverConfig,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn.toString())}',
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
  /// Parameter [subscribers] :
  /// The AWS account IDs that you want to share your content with. The
  /// receiving accounts (subscribers) will be allowed to create their own flow
  /// using your content as the source.
  Future<UpdateFlowEntitlementResponse> updateFlowEntitlement({
    @_s.required String entitlementArn,
    @_s.required String flowArn,
    String description,
    UpdateEncryption encryption,
    List<String> subscribers,
  }) async {
    ArgumentError.checkNotNull(entitlementArn, 'entitlementArn');
    ArgumentError.checkNotNull(flowArn, 'flowArn');
    final $payload = UpdateFlowEntitlementRequest(
      entitlementArn: entitlementArn,
      flowArn: flowArn,
      description: description,
      encryption: encryption,
      subscribers: subscribers,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn.toString())}/entitlements/${Uri.encodeComponent(entitlementArn.toString())}',
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
    final $payload = UpdateFlowOutputRequest(
      flowArn: flowArn,
      outputArn: outputArn,
      cidrAllowList: cidrAllowList,
      description: description,
      destination: destination,
      encryption: encryption,
      maxLatency: maxLatency,
      port: port,
      protocol: protocol,
      remoteId: remoteId,
      smoothingLatency: smoothingLatency,
      streamId: streamId,
      vpcInterfaceAttachment: vpcInterfaceAttachment,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn.toString())}/outputs/${Uri.encodeComponent(outputArn.toString())}',
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
    final $payload = UpdateFlowSourceRequest(
      flowArn: flowArn,
      sourceArn: sourceArn,
      decryption: decryption,
      description: description,
      entitlementArn: entitlementArn,
      ingestPort: ingestPort,
      maxBitrate: maxBitrate,
      maxLatency: maxLatency,
      protocol: protocol,
      streamId: streamId,
      vpcInterfaceName: vpcInterfaceName,
      whitelistCidr: whitelistCidr,
    );
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/flows/${Uri.encodeComponent(flowArn.toString())}/source/${Uri.encodeComponent(sourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFlowSourceResponse.fromJson(response);
  }
}

/// A request to add outputs to the specified flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AddFlowOutputsRequest {
  /// The flow that you want to add outputs to.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  /// A list of outputs that you want to add.
  @_s.JsonKey(name: 'outputs')
  final List<AddOutputRequest> outputs;

  AddFlowOutputsRequest({
    @_s.required this.flowArn,
    @_s.required this.outputs,
  });
  Map<String, dynamic> toJson() => _$AddFlowOutputsRequestToJson(this);
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

/// A request to add sources to the flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AddFlowSourcesRequest {
  /// The flow that you want to mutate.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  /// A list of sources that you want to add.
  @_s.JsonKey(name: 'sources')
  final List<SetSourceRequest> sources;

  AddFlowSourcesRequest({
    @_s.required this.flowArn,
    @_s.required this.sources,
  });
  Map<String, dynamic> toJson() => _$AddFlowSourcesRequestToJson(this);
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

/// A request to add VPC interfaces to the flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AddFlowVpcInterfacesRequest {
  /// The flow that you want to mutate.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  /// A list of VPC interfaces that you want to add.
  @_s.JsonKey(name: 'vpcInterfaces')
  final List<VpcInterfaceRequest> vpcInterfaces;

  AddFlowVpcInterfacesRequest({
    @_s.required this.flowArn,
    @_s.required this.vpcInterfaces,
  });
  Map<String, dynamic> toJson() => _$AddFlowVpcInterfacesRequestToJson(this);
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

/// Creates a new flow. The request must include one source. The request
/// optionally can include outputs (up to 50) and entitlements (up to 50).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateFlowRequest {
  /// The name of the flow.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Availability Zone that you want to create the flow in. These options are
  /// limited to the Availability Zones within the current AWS Region.
  @_s.JsonKey(name: 'availabilityZone')
  final String availabilityZone;

  /// The entitlements that you want to grant on a flow.
  @_s.JsonKey(name: 'entitlements')
  final List<GrantEntitlementRequest> entitlements;

  /// The outputs that you want to add to this flow.
  @_s.JsonKey(name: 'outputs')
  final List<AddOutputRequest> outputs;
  @_s.JsonKey(name: 'source')
  final SetSourceRequest source;
  @_s.JsonKey(name: 'sourceFailoverConfig')
  final FailoverConfig sourceFailoverConfig;
  @_s.JsonKey(name: 'sources')
  final List<SetSourceRequest> sources;

  /// The VPC interfaces you want on the flow.
  @_s.JsonKey(name: 'vpcInterfaces')
  final List<VpcInterfaceRequest> vpcInterfaces;

  CreateFlowRequest({
    @_s.required this.name,
    this.availabilityZone,
    this.entitlements,
    this.outputs,
    this.source,
    this.sourceFailoverConfig,
    this.sources,
    this.vpcInterfaces,
  });
  Map<String, dynamic> toJson() => _$CreateFlowRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class DeleteFlowRequest {
  /// The ARN of the flow that you want to delete.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  DeleteFlowRequest({
    @_s.required this.flowArn,
  });
  Map<String, dynamic> toJson() => _$DeleteFlowRequestToJson(this);
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

  Entitlement({
    @_s.required this.entitlementArn,
    @_s.required this.name,
    @_s.required this.subscribers,
    this.dataTransferSubscriberFeePercent,
    this.description,
    this.encryption,
  });
  factory Entitlement.fromJson(Map<String, dynamic> json) =>
      _$EntitlementFromJson(json);
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

  /// The name of the entitlement. This value must be unique within the current
  /// flow.
  @_s.JsonKey(name: 'name')
  final String name;

  GrantEntitlementRequest({
    @_s.required this.subscribers,
    this.dataTransferSubscriberFeePercent,
    this.description,
    this.encryption,
    this.name,
  });
  Map<String, dynamic> toJson() => _$GrantEntitlementRequestToJson(this);
}

/// A request to grant entitlements on a flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GrantFlowEntitlementsRequest {
  /// The list of entitlements that you want to grant.
  @_s.JsonKey(name: 'entitlements')
  final List<GrantEntitlementRequest> entitlements;

  /// The flow that you want to grant entitlements on.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  GrantFlowEntitlementsRequest({
    @_s.required this.entitlements,
    @_s.required this.flowArn,
  });
  Map<String, dynamic> toJson() => _$GrantFlowEntitlementsRequestToJson(this);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RemoveFlowOutputRequest {
  /// The flow that you want to remove an output from.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  /// The ARN of the output that you want to remove.
  @_s.JsonKey(name: 'outputArn', ignore: true)
  final String outputArn;

  RemoveFlowOutputRequest({
    @_s.required this.flowArn,
    @_s.required this.outputArn,
  });
  Map<String, dynamic> toJson() => _$RemoveFlowOutputRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class RemoveFlowSourceRequest {
  /// The flow that you want to remove a source from.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  /// The ARN of the source that you want to remove.
  @_s.JsonKey(name: 'sourceArn', ignore: true)
  final String sourceArn;

  RemoveFlowSourceRequest({
    @_s.required this.flowArn,
    @_s.required this.sourceArn,
  });
  Map<String, dynamic> toJson() => _$RemoveFlowSourceRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class RemoveFlowVpcInterfaceRequest {
  /// The flow that you want to remove a VPC interface from.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  /// The name of the VPC interface that you want to remove.
  @_s.JsonKey(name: 'vpcInterfaceName', ignore: true)
  final String vpcInterfaceName;

  RemoveFlowVpcInterfaceRequest({
    @_s.required this.flowArn,
    @_s.required this.vpcInterfaceName,
  });
  Map<String, dynamic> toJson() => _$RemoveFlowVpcInterfaceRequestToJson(this);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RevokeFlowEntitlementRequest {
  /// The ARN of the entitlement that you want to revoke.
  @_s.JsonKey(name: 'entitlementArn', ignore: true)
  final String entitlementArn;

  /// The flow that you want to revoke an entitlement from.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  RevokeFlowEntitlementRequest({
    @_s.required this.entitlementArn,
    @_s.required this.flowArn,
  });
  Map<String, dynamic> toJson() => _$RevokeFlowEntitlementRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class StartFlowRequest {
  /// The ARN of the flow that you want to start.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  StartFlowRequest({
    @_s.required this.flowArn,
  });
  Map<String, dynamic> toJson() => _$StartFlowRequestToJson(this);
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
    createFactory: false,
    createToJson: true)
class StopFlowRequest {
  /// The ARN of the flow that you want to stop.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  StopFlowRequest({
    @_s.required this.flowArn,
  });
  Map<String, dynamic> toJson() => _$StopFlowRequestToJson(this);
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

/// The tags to add to the resource. A tag is an array of key-value pairs. Tag
/// keys can have a maximum character length of 128 characters, and tag values
/// can have a maximum length of 256 characters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TagResourceRequest {
  /// The Amazon Resource Name (ARN) that identifies the AWS Elemental
  /// MediaConnect resource to which to add tags.
  @_s.JsonKey(name: 'resourceArn', ignore: true)
  final String resourceArn;

  /// A map from tag keys to values. Tag keys can have a maximum character length
  /// of 128 characters, and tag values can have a maximum length of 256
  /// characters.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  TagResourceRequest({
    @_s.required this.resourceArn,
    @_s.required this.tags,
  });
  Map<String, dynamic> toJson() => _$TagResourceRequestToJson(this);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UntagResourceRequest {
  /// The Amazon Resource Name (ARN) that identifies the AWS Elemental
  /// MediaConnect resource from which to delete tags.
  @_s.JsonKey(name: 'resourceArn', ignore: true)
  final String resourceArn;

  /// The keys of the tags to be removed.
  @_s.JsonKey(name: 'tagKeys', ignore: true)
  final List<String> tagKeys;

  UntagResourceRequest({
    @_s.required this.resourceArn,
    @_s.required this.tagKeys,
  });
  Map<String, dynamic> toJson() => _$UntagResourceRequestToJson(this);
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

/// The entitlement fields that you want to update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateFlowEntitlementRequest {
  /// The ARN of the entitlement that you want to update.
  @_s.JsonKey(name: 'entitlementArn', ignore: true)
  final String entitlementArn;

  /// The flow that is associated with the entitlement that you want to update.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  /// A description of the entitlement. This description appears only on the AWS
  /// Elemental MediaConnect console and will not be seen by the subscriber or end
  /// user.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The type of encryption that will be used on the output associated with this
  /// entitlement.
  @_s.JsonKey(name: 'encryption')
  final UpdateEncryption encryption;

  /// The AWS account IDs that you want to share your content with. The receiving
  /// accounts (subscribers) will be allowed to create their own flow using your
  /// content as the source.
  @_s.JsonKey(name: 'subscribers')
  final List<String> subscribers;

  UpdateFlowEntitlementRequest({
    @_s.required this.entitlementArn,
    @_s.required this.flowArn,
    this.description,
    this.encryption,
    this.subscribers,
  });
  Map<String, dynamic> toJson() => _$UpdateFlowEntitlementRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFlowEntitlementResponse {
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

/// The fields that you want to update in the output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateFlowOutputRequest {
  /// The flow that is associated with the output that you want to update.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  /// The ARN of the output that you want to update.
  @_s.JsonKey(name: 'outputArn', ignore: true)
  final String outputArn;

  /// The range of IP addresses that should be allowed to initiate output requests
  /// to this flow. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  @_s.JsonKey(name: 'cidrAllowList')
  final List<String> cidrAllowList;

  /// A description of the output. This description appears only on the AWS
  /// Elemental MediaConnect console and will not be seen by the end user.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The IP address where you want to send the output.
  @_s.JsonKey(name: 'destination')
  final String destination;

  /// The type of key used for the encryption. If no keyType is provided, the
  /// service will use the default setting (static-key).
  @_s.JsonKey(name: 'encryption')
  final UpdateEncryption encryption;

  /// The maximum latency in milliseconds for Zixi-based streams.
  @_s.JsonKey(name: 'maxLatency')
  final int maxLatency;

  /// The port to use when content is distributed to this output.
  @_s.JsonKey(name: 'port')
  final int port;

  /// The protocol to use for the output.
  @_s.JsonKey(name: 'protocol')
  final Protocol protocol;

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

  /// The name of the VPC interface attachment to use for this output.
  @_s.JsonKey(name: 'vpcInterfaceAttachment')
  final VpcInterfaceAttachment vpcInterfaceAttachment;

  UpdateFlowOutputRequest({
    @_s.required this.flowArn,
    @_s.required this.outputArn,
    this.cidrAllowList,
    this.description,
    this.destination,
    this.encryption,
    this.maxLatency,
    this.port,
    this.protocol,
    this.remoteId,
    this.smoothingLatency,
    this.streamId,
    this.vpcInterfaceAttachment,
  });
  Map<String, dynamic> toJson() => _$UpdateFlowOutputRequestToJson(this);
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
  @_s.JsonKey(name: 'output')
  final Output output;

  UpdateFlowOutputResponse({
    this.flowArn,
    this.output,
  });
  factory UpdateFlowOutputResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFlowOutputResponseFromJson(json);
}

/// A request to update flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateFlowRequest {
  /// The flow that you want to update.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;
  @_s.JsonKey(name: 'sourceFailoverConfig')
  final UpdateFailoverConfig sourceFailoverConfig;

  UpdateFlowRequest({
    @_s.required this.flowArn,
    this.sourceFailoverConfig,
  });
  Map<String, dynamic> toJson() => _$UpdateFlowRequestToJson(this);
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

/// A request to update the source of a flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateFlowSourceRequest {
  /// The flow that is associated with the source that you want to update.
  @_s.JsonKey(name: 'flowArn', ignore: true)
  final String flowArn;

  /// The ARN of the source that you want to update.
  @_s.JsonKey(name: 'sourceArn', ignore: true)
  final String sourceArn;

  /// The type of encryption used on the content ingested from this source.
  @_s.JsonKey(name: 'decryption')
  final UpdateEncryption decryption;

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

  /// The protocol that is used by the source.
  @_s.JsonKey(name: 'protocol')
  final Protocol protocol;

  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi-based streams.
  @_s.JsonKey(name: 'streamId')
  final String streamId;

  /// The name of the VPC Interface to configure this Source with.
  @_s.JsonKey(name: 'vpcInterfaceName')
  final String vpcInterfaceName;

  /// The range of IP addresses that should be allowed to contribute content to
  /// your source. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  @_s.JsonKey(name: 'whitelistCidr')
  final String whitelistCidr;

  UpdateFlowSourceRequest({
    @_s.required this.flowArn,
    @_s.required this.sourceArn,
    this.decryption,
    this.description,
    this.entitlementArn,
    this.ingestPort,
    this.maxBitrate,
    this.maxLatency,
    this.protocol,
    this.streamId,
    this.vpcInterfaceName,
    this.whitelistCidr,
  });
  Map<String, dynamic> toJson() => _$UpdateFlowSourceRequestToJson(this);
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
