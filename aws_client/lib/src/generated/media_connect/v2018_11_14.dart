// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2018_11_14.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Welcome to the Elemental MediaConnect API reference.
///
/// MediaConnect is a service that lets you ingest live video content into the
/// cloud and distribute it to destinations all over the world, both inside and
/// outside the Amazon Web Services cloud. This API reference provides
/// descriptions, syntax, and usage examples for each of the actions and data
/// types that are supported by MediaConnect.
///
/// Use the following links to get started with the MediaConnect API:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/mediaconnect/latest/api/API_Operations.html">Actions</a>:
/// An alphabetical list of all MediaConnect API operations.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/mediaconnect/latest/api/API_Types.html">Data
/// types</a>: An alphabetical list of all MediaConnect data types.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/mediaconnect/latest/api/CommonParameters.html">Common
/// parameters</a>: Parameters that all operations can use.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/mediaconnect/latest/api/CommonErrors.html">Common
/// errors</a>: Client and server errors that all operations can return.
/// </li>
/// </ul>
class MediaConnect {
  final _s.RestJsonProtocol _protocol;
  factory MediaConnect({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'mediaconnect',
    );
    return MediaConnect._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  MediaConnect._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Displays a list of all entitlements that have been granted to this
  /// account. This request returns 20 results per page.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request.
  ///
  /// For example, you submit a <code>ListEntitlements</code> request with set
  /// at 5. Although 20 items match your request, the service returns no more
  /// than the first 5 items. (The service also returns a NextToken value that
  /// you can use to fetch the next batch of results.)
  ///
  /// The service might return fewer results than the <code>MaxResults</code>
  /// value. If <code>MaxResults</code> is not included in the request, the
  /// service defaults to pagination with a maximum of 20 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListEntitlements</code> request with
  /// <code>MaxResults</code> set at 5. The service returns the first batch of
  /// results (up to 5) and a <code>NextToken</code> value. To see the next
  /// batch of results, you can submit the <code>ListEntitlements</code> request
  /// a second time and specify the <code>NextToken</code> value.
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

  /// Lists the tags associated with a global resource in AWS Elemental
  /// MediaConnect. The API supports the following global resources: router
  /// inputs, router outputs and router network interfaces.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the global resource whose tags you want
  /// to list.
  Future<ListTagsForGlobalResourceResponse> listTagsForGlobalResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/global/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForGlobalResourceResponse.fromJson(response);
  }

  /// List all tags on a MediaConnect resource in the current region.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the MediaConnect resource
  /// for which to list the tags.
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

  /// Adds tags to a global resource in AWS Elemental MediaConnect. The API
  /// supports the following global resources: router inputs, router outputs and
  /// router network interfaces.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the global resource to tag.
  ///
  /// Parameter [tags] :
  /// A map of tag keys and values to add to the global resource.
  Future<void> tagGlobalResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/global/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates the specified tags to a resource with the specified
  /// <code>resourceArn</code> in the current region. If existing tags on a
  /// resource are not specified in the request parameters, they are not
  /// changed. When a resource is deleted, the tags associated with that
  /// resource are deleted as well.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the MediaConnect resource
  /// to which to add tags.
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

  /// Removes tags from a global resource in AWS Elemental MediaConnect. The API
  /// supports the following global resources: router inputs, router outputs and
  /// router network interfaces.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the global resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove from the global resource.
  Future<void> untagGlobalResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/global/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes specified tags from a resource in the current region.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to untag.
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

  /// Creates a new bridge. The request must include one source.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [CreateBridge420Exception].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
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
  /// An egress bridge is a cloud-to-ground bridge. The content comes from an
  /// existing MediaConnect flow and is delivered to your premises.
  ///
  /// Parameter [ingressGatewayBridge] :
  /// An ingress bridge is a ground-to-cloud bridge. The content originates at
  /// your premises and is delivered to the cloud.
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

  /// Displays the details of a bridge.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [bridgeArn] :
  /// The Amazon Resource Name (ARN) of the bridge that you want to describe.
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

  /// Updates the bridge.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [bridgeArn] :
  /// TheAmazon Resource Name (ARN) of the bridge that you want to update.
  ///
  /// Parameter [egressGatewayBridge] :
  /// A cloud-to-ground bridge. The content comes from an existing MediaConnect
  /// flow and is delivered to your premises.
  ///
  /// Parameter [ingressGatewayBridge] :
  /// A ground-to-cloud bridge. The content originates at your premises and is
  /// delivered to the cloud.
  ///
  /// Parameter [sourceFailoverConfig] :
  /// The settings for source failover.
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

  /// Deletes a bridge. Before you can delete a bridge, you must stop the
  /// bridge.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [bridgeArn] :
  /// The Amazon Resource Name (ARN) of the bridge that you want to delete.
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

  /// Displays a list of bridges that are associated with this account and an
  /// optionally specified Amazon Resource Name (ARN). This request returns a
  /// paginated result.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [filterArn] :
  /// Filter the list results to display only the bridges associated with the
  /// selected ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request.
  ///
  /// For example, you submit a <code>ListBridges</code> request with
  /// <code>MaxResults</code> set at 5. Although 20 items match your request,
  /// the service returns no more than the first 5 items. (The service also
  /// returns a <code>NextToken</code> value that you can use to fetch the next
  /// batch of results.)
  ///
  /// The service might return fewer results than the <code>MaxResults</code>
  /// value. If <code>MaxResults</code> is not included in the request, the
  /// service defaults to pagination with a maximum of 10 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListBridges</code> request with
  /// <code>MaxResults</code> set at 5. The service returns the first batch of
  /// results (up to 5) and a <code>NextToken</code> value. To see the next
  /// batch of results, you can submit the <code>ListBridges</code> request a
  /// second time and specify the <code>NextToken</code> value.
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

  /// Adds outputs to an existing bridge.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [bridgeArn] :
  /// The Amazon Resource Name (ARN) of the bridge that you want to update.
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
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [bridgeArn] :
  /// The Amazon Resource Name (ARN) of the bridge that you want to update.
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

  /// Removes an output from a bridge.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [bridgeArn] :
  /// The Amazon Resource Name (ARN) of the bridge that you want to update.
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
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [bridgeArn] :
  /// The Amazon Resource Name (ARN) of the bridge that you want to update.
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

  /// Updates an existing bridge output.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [bridgeArn] :
  /// The Amazon Resource Name (ARN) of the bridge that you want to update.
  ///
  /// Parameter [outputName] :
  /// Tname of the output that you want to update.
  ///
  /// Parameter [networkOutput] :
  /// The network of the bridge output.
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
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [bridgeArn] :
  /// The Amazon Resource Name (ARN) of the bridge that you want to update.
  ///
  /// Parameter [sourceName] :
  /// The name of the source that you want to update.
  ///
  /// Parameter [flowSource] :
  /// The name of the flow that you want to update.
  ///
  /// Parameter [networkSource] :
  /// The network for the bridge source.
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

  /// Updates the bridge state.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [bridgeArn] :
  /// The Amazon Resource Name (ARN) of the bridge that you want to update the
  /// state of.
  ///
  /// Parameter [desiredState] :
  /// The desired state for the bridge.
  Future<UpdateBridgeStateResponse> updateBridgeState({
    required String bridgeArn,
    required DesiredState desiredState,
  }) async {
    final $payload = <String, dynamic>{
      'desiredState': desiredState.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/bridges/${Uri.encodeComponent(bridgeArn)}/state',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBridgeStateResponse.fromJson(response);
  }

  /// Creates a new flow. The request must include one source. The request
  /// optionally can include outputs (up to 50) and entitlements (up to 50).
  ///
  /// May throw [BadRequestException].
  /// May throw [CreateFlow420Exception].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the flow.
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone that you want to create the flow in. These options
  /// are limited to the Availability Zones within the current Amazon Web
  /// Services Region.
  ///
  /// Parameter [entitlements] :
  /// The entitlements that you want to grant on a flow.
  ///
  /// Parameter [flowSize] :
  /// Determines the processing capacity and feature set of the flow. Set this
  /// optional parameter to <code>LARGE</code> if you want to enable NDI sources
  /// or outputs on the flow.
  ///
  /// Parameter [flowTags] :
  /// The key-value pairs that can be used to tag and organize the flow.
  ///
  /// Parameter [maintenance] :
  /// The maintenance settings you want to use for the flow.
  ///
  /// Parameter [mediaStreams] :
  /// The media streams that you want to add to the flow. You can associate
  /// these media streams with sources and outputs on the flow.
  ///
  /// Parameter [ndiConfig] :
  /// Specifies the configuration settings for a flow's NDI source or output.
  /// Required when the flow includes an NDI source or output.
  ///
  /// Parameter [outputs] :
  /// The outputs that you want to add to this flow.
  ///
  /// Parameter [source] :
  /// The settings for the source that you want to use for the new flow.
  ///
  /// Parameter [sourceFailoverConfig] :
  /// The settings for source failover.
  ///
  /// Parameter [sourceMonitoringConfig] :
  /// The settings for source monitoring.
  ///
  /// Parameter [sources] :
  /// The sources that are assigned to the flow.
  ///
  /// Parameter [vpcInterfaces] :
  /// The VPC interfaces you want on the flow.
  Future<CreateFlowResponse> createFlow({
    required String name,
    String? availabilityZone,
    EncodingConfig? encodingConfig,
    List<GrantEntitlementRequest>? entitlements,
    FlowSize? flowSize,
    Map<String, String>? flowTags,
    AddMaintenance? maintenance,
    List<AddMediaStreamRequest>? mediaStreams,
    NdiConfig? ndiConfig,
    List<AddOutputRequest>? outputs,
    SetSourceRequest? source,
    FailoverConfig? sourceFailoverConfig,
    MonitoringConfig? sourceMonitoringConfig,
    List<SetSourceRequest>? sources,
    List<VpcInterfaceRequest>? vpcInterfaces,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (encodingConfig != null) 'encodingConfig': encodingConfig,
      if (entitlements != null) 'entitlements': entitlements,
      if (flowSize != null) 'flowSize': flowSize.value,
      if (flowTags != null) 'flowTags': flowTags,
      if (maintenance != null) 'maintenance': maintenance,
      if (mediaStreams != null) 'mediaStreams': mediaStreams,
      if (ndiConfig != null) 'ndiConfig': ndiConfig,
      if (outputs != null) 'outputs': outputs,
      if (source != null) 'source': source,
      if (sourceFailoverConfig != null)
        'sourceFailoverConfig': sourceFailoverConfig,
      if (sourceMonitoringConfig != null)
        'sourceMonitoringConfig': sourceMonitoringConfig,
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

  /// Displays the details of a flow. The response includes the flow Amazon
  /// Resource Name (ARN), name, and Availability Zone, as well as details about
  /// the source, outputs, and entitlements.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
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

  /// Updates an existing flow.
  /// <note>
  /// Because <code>UpdateFlowSources</code> and <code>UpdateFlow</code> are
  /// separate operations, you can't change both the source type AND the flow
  /// size in a single request.
  ///
  /// <ul>
  /// <li>
  /// If you have a <code>MEDIUM</code> flow and you want to change the flow
  /// source to NDI®:
  ///
  /// <ul>
  /// <li>
  /// First, use the <code>UpdateFlow</code> operation to upgrade the flow size
  /// to <code>LARGE</code>.
  /// </li>
  /// <li>
  /// After that, you can then use the <code>UpdateFlowSource</code> operation
  /// to configure the NDI source.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If you're switching from an NDI source to a transport stream (TS) source
  /// and want to downgrade the flow size:
  ///
  /// <ul>
  /// <li>
  /// First, use the <code>UpdateFlowSource</code> operation to change the flow
  /// source type.
  /// </li>
  /// <li>
  /// After that, you can then use the <code>UpdateFlow</code> operation to
  /// downgrade the flow size to <code>MEDIUM</code>.
  /// </li>
  /// </ul> </li>
  /// </ul> </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to update.
  ///
  /// Parameter [flowSize] :
  /// Determines the processing capacity and feature set of the flow.
  ///
  /// Parameter [maintenance] :
  /// The maintenance setting of the flow.
  ///
  /// Parameter [ndiConfig] :
  /// Specifies the configuration settings for a flow's NDI source or output.
  /// Required when the flow includes an NDI source or output.
  ///
  /// Parameter [sourceFailoverConfig] :
  /// The settings for source failover.
  ///
  /// Parameter [sourceMonitoringConfig] :
  /// The settings for source monitoring.
  Future<UpdateFlowResponse> updateFlow({
    required String flowArn,
    EncodingConfig? encodingConfig,
    FlowSize? flowSize,
    UpdateMaintenance? maintenance,
    NdiConfig? ndiConfig,
    UpdateFailoverConfig? sourceFailoverConfig,
    MonitoringConfig? sourceMonitoringConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (encodingConfig != null) 'encodingConfig': encodingConfig,
      if (flowSize != null) 'flowSize': flowSize.value,
      if (maintenance != null) 'maintenance': maintenance,
      if (ndiConfig != null) 'ndiConfig': ndiConfig,
      if (sourceFailoverConfig != null)
        'sourceFailoverConfig': sourceFailoverConfig,
      if (sourceMonitoringConfig != null)
        'sourceMonitoringConfig': sourceMonitoringConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFlowResponse.fromJson(response);
  }

  /// Deletes a flow. Before you can delete a flow, you must stop the flow.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to delete.
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

  /// Displays a list of flows that are associated with this account. This
  /// request returns a paginated result.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request.
  ///
  /// For example, you submit a <code>ListFlows</code> request with MaxResults
  /// set at 5. Although 20 items match your request, the service returns no
  /// more than the first 5 items. (The service also returns a
  /// <code>NextToken</code> value that you can use to fetch the next batch of
  /// results.)
  ///
  /// The service might return fewer results than the <code>MaxResults</code>
  /// value. If <code>MaxResults</code> is not included in the request, the
  /// service defaults to pagination with a maximum of 10 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListFlows</code> request with MaxResults
  /// set at 5. The service returns the first batch of results (up to 5) and a
  /// <code>NextToken</code> value. To see the next batch of results, you can
  /// submit the <code>ListFlows</code> request a second time and specify the
  /// <code>NextToken</code> value.
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

  /// Adds media streams to an existing flow. After you add a media stream to a
  /// flow, you can associate it with a source and/or an output that uses the ST
  /// 2110 JPEG XS or CDI protocol.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
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
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to add outputs
  /// to.
  ///
  /// Parameter [outputs] :
  /// A list of outputs that you want to add to the flow.
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

  /// Adds sources to a flow.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to update.
  ///
  /// Parameter [sources] :
  /// A list of sources that you want to add to the flow.
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

  /// Adds VPC interfaces to a flow.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to update.
  ///
  /// Parameter [vpcInterfaces] :
  /// A list of VPC interfaces that you want to add to the flow.
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

  /// The <code>DescribeFlowSourceMetadata</code> API is used to view
  /// information about the flow's source transport stream and programs. This
  /// API displays status messages about the flow's source as well as details
  /// about the program's video, audio, and other data.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
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

  /// Describes the thumbnail for the flow source.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow.
  Future<DescribeFlowSourceThumbnailResponse> describeFlowSourceThumbnail({
    required String flowArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/flows/${Uri.encodeComponent(flowArn)}/source-thumbnail',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFlowSourceThumbnailResponse.fromJson(response);
  }

  /// Grants entitlements to an existing flow.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [GrantFlowEntitlements420Exception].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [entitlements] :
  /// The list of entitlements that you want to grant.
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to grant
  /// entitlements on.
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

  /// Removes a media stream from a flow. This action is only available if the
  /// media stream is not associated with a source or output.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to update.
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
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to remove an
  /// output from.
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
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to remove a
  /// source from.
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
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to remove a VPC
  /// interface from.
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
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [entitlementArn] :
  /// The Amazon Resource Name (ARN) of the entitlement that you want to revoke.
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
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to start.
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
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that you want to stop.
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

  /// Updates an entitlement. You can change an entitlement's description,
  /// subscribers, and encryption. If you change the subscribers, the service
  /// will remove the outputs that are are used by the subscribers that are
  /// removed.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [entitlementArn] :
  /// The Amazon Resource Name (ARN) of the entitlement that you want to update.
  ///
  /// Parameter [flowArn] :
  /// The ARN of the flow that is associated with the entitlement that you want
  /// to update.
  ///
  /// Parameter [description] :
  /// A description of the entitlement. This description appears only on the
  /// MediaConnect console and will not be seen by the subscriber or end user.
  ///
  /// Parameter [encryption] :
  /// The type of encryption that will be used on the output associated with
  /// this entitlement. Allowable encryption types: static-key, speke.
  ///
  /// Parameter [entitlementStatus] :
  /// An indication of whether you want to enable the entitlement to allow
  /// access, or disable it to stop streaming content to the subscriber’s flow
  /// temporarily. If you don’t specify the <code>entitlementStatus</code> field
  /// in your request, MediaConnect leaves the value unchanged.
  ///
  /// Parameter [subscribers] :
  /// The Amazon Web Services account IDs that you want to share your content
  /// with. The receiving accounts (subscribers) will be allowed to create their
  /// own flow using your content as the source.
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
        'entitlementStatus': entitlementStatus.value,
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
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that is associated with the
  /// media stream that you updated.
  ///
  /// Parameter [mediaStreamName] :
  /// The media stream that you updated.
  ///
  /// Parameter [attributes] :
  /// The attributes that you want to assign to the media stream.
  ///
  /// Parameter [clockRate] :
  /// The sample rate for the stream. This value in measured in kHz.
  ///
  /// Parameter [description] :
  /// A description that can help you quickly identify what your media stream is
  /// used for.
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
      if (mediaStreamType != null) 'mediaStreamType': mediaStreamType.value,
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
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The Amazon Resource Name (ARN) of the flow that is associated with the
  /// output that you want to update.
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
  /// A description of the output. This description appears only on the
  /// MediaConnect console and will not be seen by the end user.
  ///
  /// Parameter [destination] :
  /// The IP address where you want to send the output.
  ///
  /// Parameter [encryption] :
  /// The type of key used for the encryption. If no <code>keyType</code> is
  /// provided, the service will use the default setting (static-key). Allowable
  /// encryption types: static-key.
  ///
  /// Parameter [maxLatency] :
  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based and Zixi-based streams.
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
  /// Parameter [ndiOutputTimecodeSource] :
  /// Controls how MediaConnect generates timecodes for NDI output frames. If
  /// you don't specify this field, MediaConnect leaves the value unchanged.
  ///
  /// <ul>
  /// <li>
  /// <code>EMBEDDED_TIMECODE</code> - Preserves timecodes from the input
  /// transport stream. The timecodes must be embedded in the video stream as
  /// SEI timing messages. If no embedded timecode is detected, MediaConnect
  /// uses the UTC system time instead.
  /// </li>
  /// <li>
  /// <code>UTC_SYSTEM_TIME</code> - Generates timecodes based on the system
  /// clock time when each frame is sent.
  /// </li>
  /// </ul>
  ///
  /// Parameter [ndiProgramName] :
  /// A suffix for the name of the NDI® sender that the flow creates. If a
  /// custom name isn't specified, MediaConnect uses the output name.
  ///
  /// Parameter [ndiSpeedHqQuality] :
  /// A quality setting for the NDI Speed HQ encoder.
  ///
  /// Parameter [outputStatus] :
  /// An indication of whether the output should transmit data or not. If you
  /// don't specify the <code>outputStatus</code> field in your request,
  /// MediaConnect leaves the value unchanged.
  ///
  /// Parameter [port] :
  /// The port to use when content is distributed to this output.
  ///
  /// Parameter [protocol] :
  /// The protocol to use for the output.
  /// <note>
  /// Elemental MediaConnect no longer supports the Fujitsu QoS protocol. This
  /// reference is maintained for legacy purposes only.
  /// </note>
  ///
  /// Parameter [remoteId] :
  /// The remote ID for the Zixi-pull stream.
  ///
  /// Parameter [routerIntegrationState] :
  /// Indicates whether to enable or disable router integration for this flow
  /// output.
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
    NdiOutputTimecodeSource? ndiOutputTimecodeSource,
    String? ndiProgramName,
    int? ndiSpeedHqQuality,
    OutputStatus? outputStatus,
    int? port,
    Protocol? protocol,
    String? remoteId,
    State? routerIntegrationState,
    FlowTransitEncryption? routerIntegrationTransitEncryption,
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
      if (ndiOutputTimecodeSource != null)
        'ndiOutputTimecodeSource': ndiOutputTimecodeSource.value,
      if (ndiProgramName != null) 'ndiProgramName': ndiProgramName,
      if (ndiSpeedHqQuality != null) 'ndiSpeedHqQuality': ndiSpeedHqQuality,
      if (outputStatus != null) 'outputStatus': outputStatus.value,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.value,
      if (remoteId != null) 'remoteId': remoteId,
      if (routerIntegrationState != null)
        'routerIntegrationState': routerIntegrationState.value,
      if (routerIntegrationTransitEncryption != null)
        'routerIntegrationTransitEncryption':
            routerIntegrationTransitEncryption,
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
  /// <note>
  /// Because <code>UpdateFlowSources</code> and <code>UpdateFlow</code> are
  /// separate operations, you can't change both the source type AND the flow
  /// size in a single request.
  ///
  /// <ul>
  /// <li>
  /// If you have a <code>MEDIUM</code> flow and you want to change the flow
  /// source to NDI®:
  ///
  /// <ul>
  /// <li>
  /// First, use the <code>UpdateFlow</code> operation to upgrade the flow size
  /// to <code>LARGE</code>.
  /// </li>
  /// <li>
  /// After that, you can then use the <code>UpdateFlowSource</code> operation
  /// to configure the NDI source.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// If you're switching from an NDI source to a transport stream (TS) source
  /// and want to downgrade the flow size:
  ///
  /// <ul>
  /// <li>
  /// First, use the <code>UpdateFlowSource</code> operation to change the flow
  /// source type.
  /// </li>
  /// <li>
  /// After that, you can then use the <code>UpdateFlow</code> operation to
  /// downgrade the flow size to <code>MEDIUM</code>.
  /// </li>
  /// </ul> </li>
  /// </ul> </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [flowArn] :
  /// The ARN of the flow that you want to update.
  ///
  /// Parameter [sourceArn] :
  /// The ARN of the source that you want to update.
  ///
  /// Parameter [decryption] :
  /// The type of encryption that is used on the content ingested from the
  /// source.
  ///
  /// Parameter [description] :
  /// A description of the source. This description is not visible outside of
  /// the current Amazon Web Services account.
  ///
  /// Parameter [entitlementArn] :
  /// The Amazon Resource Name (ARN) of the entitlement that allows you to
  /// subscribe to the flow. The entitlement is set by the content originator,
  /// and the ARN is generated as part of the originator's flow.
  ///
  /// Parameter [gatewayBridgeSource] :
  /// The source configuration for cloud flows receiving a stream from a bridge.
  ///
  /// Parameter [ingestPort] :
  /// The port that the flow listens on for incoming content. If the protocol of
  /// the source is Zixi, the port must be set to 2088.
  ///
  /// Parameter [maxBitrate] :
  /// The maximum bitrate for RIST, RTP, and RTP-FEC streams.
  ///
  /// Parameter [maxLatency] :
  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based and Zixi-based streams.
  ///
  /// Parameter [maxSyncBuffer] :
  /// The size of the buffer (in milliseconds) to use to sync incoming source
  /// data.
  ///
  /// Parameter [mediaStreamSourceConfigurations] :
  /// The media stream that is associated with the source, and the parameters
  /// for that association.
  ///
  /// Parameter [minLatency] :
  /// The minimum latency in milliseconds for SRT-based streams. In streams that
  /// use the SRT protocol, this value that you set on your MediaConnect source
  /// or output represents the minimal potential latency of that connection. The
  /// latency of the stream is set to the highest number between the sender’s
  /// minimum latency and the receiver’s minimum latency.
  ///
  /// Parameter [ndiSourceSettings] :
  /// The settings for the NDI source. This includes the exact name of the
  /// upstream NDI sender that you want to connect to your source.
  ///
  /// Parameter [protocol] :
  /// The protocol that the source uses to deliver the content to MediaConnect.
  /// <note>
  /// Elemental MediaConnect no longer supports the Fujitsu QoS protocol. This
  /// reference is maintained for legacy purposes only.
  /// </note>
  ///
  /// Parameter [routerIntegrationState] :
  /// Indicates whether to enable or disable router integration for this flow
  /// source.
  ///
  /// Parameter [routerIntegrationTransitDecryption] :
  /// The encryption configuration for the flow source when router integration
  /// is enabled.
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
  /// The source IP or domain name for SRT-caller protocol.
  ///
  /// Parameter [sourceListenerPort] :
  /// Source port for SRT-caller protocol.
  ///
  /// Parameter [streamId] :
  /// The stream ID that you want to use for this transport. This parameter
  /// applies only to Zixi and SRT caller-based streams.
  ///
  /// Parameter [vpcInterfaceName] :
  /// The name of the VPC interface that you want to send your output to.
  ///
  /// Parameter [whitelistCidr] :
  /// The range of IP addresses that are allowed to contribute content to your
  /// source. Format the IP addresses as a Classless Inter-Domain Routing (CIDR)
  /// block; for example, 10.0.0.0/16.
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
    NdiSourceSettings? ndiSourceSettings,
    Protocol? protocol,
    State? routerIntegrationState,
    FlowTransitEncryption? routerIntegrationTransitDecryption,
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
      if (ndiSourceSettings != null) 'ndiSourceSettings': ndiSourceSettings,
      if (protocol != null) 'protocol': protocol.value,
      if (routerIntegrationState != null)
        'routerIntegrationState': routerIntegrationState.value,
      if (routerIntegrationTransitDecryption != null)
        'routerIntegrationTransitDecryption':
            routerIntegrationTransitDecryption,
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

  /// Displays the details of an instance.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
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

  /// Updates an existing gateway instance.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [gatewayInstanceArn] :
  /// The Amazon Resource Name (ARN) of the gateway instance that you want to
  /// update.
  ///
  /// Parameter [bridgePlacement] :
  /// The state of the instance. <code>ACTIVE</code> or <code>INACTIVE</code>.
  Future<UpdateGatewayInstanceResponse> updateGatewayInstance({
    required String gatewayInstanceArn,
    BridgePlacement? bridgePlacement,
  }) async {
    final $payload = <String, dynamic>{
      if (bridgePlacement != null) 'bridgePlacement': bridgePlacement.value,
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

  /// Deregisters an instance. Before you deregister an instance, all bridges
  /// running on the instance must be stopped. If you want to deregister an
  /// instance without stopping the bridges, you must use the --force option.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
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

  /// Displays a list of instances associated with the Amazon Web Services
  /// account. This request returns a paginated result. You can use the
  /// filterArn property to display only the instances associated with the
  /// selected Gateway Amazon Resource Name (ARN).
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [filterArn] :
  /// Filter the list results to display only the instances associated with the
  /// selected Gateway ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request.
  ///
  /// For example, you submit a ListInstances request with
  /// <code>MaxResults</code> set at 5. Although 20 items match your request,
  /// the service returns no more than the first 5 items. (The service also
  /// returns a <code>NextToken</code> value that you can use to fetch the next
  /// batch of results.)
  ///
  /// The service might return fewer results than the <code>MaxResults</code>
  /// value. If <code>MaxResults</code> is not included in the request, the
  /// service defaults to pagination with a maximum of 10 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListInstances</code> request with
  /// <code>MaxResults</code> set at 5. The service returns the first batch of
  /// results (up to 5) and a <code>NextToken</code> value. To see the next
  /// batch of results, you can submit the <code>ListInstances</code> request a
  /// second time and specify the <code>NextToken</code> value.
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

  /// Creates a new gateway. The request must include at least one network (up
  /// to four).
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [CreateGateway420Exception].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
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
  /// The list of networks that you want to add to the gateway.
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

  /// Displays the details of a gateway. The response includes the gateway
  /// Amazon Resource Name (ARN), name, and CIDR blocks, as well as details
  /// about the networks.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [gatewayArn] :
  /// The ARN of the gateway that you want to describe.
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

  /// Deletes a gateway. Before you can delete a gateway, you must deregister
  /// its instances and delete its bridges.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [gatewayArn] :
  /// The Amazon Resource Name (ARN) of the gateway that you want to delete.
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

  /// Displays a list of gateways that are associated with this account. This
  /// request returns a paginated result.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request.
  ///
  /// For example, you submit a <code>ListGateways</code> request with
  /// <code>MaxResults</code> set at 5. Although 20 items match your request,
  /// the service returns no more than the first 5 items. (The service also
  /// returns a <code>NextToken</code> value that you can use to fetch the next
  /// batch of results.)
  ///
  /// The service might return fewer results than the <code>MaxResults</code>
  /// value. If <code>MaxResults</code> is not included in the request, the
  /// service defaults to pagination with a maximum of 10 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListGateways</code> request with
  /// <code>MaxResults</code> set at 5. The service returns the first batch of
  /// results (up to 5) and a <code>NextToken</code> value. To see the next
  /// batch of results, you can submit the <code>ListGateways</code> request a
  /// second time and specify the <code>NextToken</code> value.
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

  /// Displays the details of an offering. The response includes the offering
  /// description, duration, outbound bandwidth, price, and Amazon Resource Name
  /// (ARN).
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [offeringArn] :
  /// The ARN of the offering.
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

  /// Displays a list of all offerings that are available to this account in the
  /// current Amazon Web Services Region. If you have an active reservation
  /// (which means you've purchased an offering that has already started and
  /// hasn't expired yet), your account isn't eligible for other offerings.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request.
  ///
  /// For example, you submit a <code>ListOfferings</code> request with
  /// <code>MaxResults</code> set at 5. Although 20 items match your request,
  /// the service returns no more than the first 5 items. (The service also
  /// returns a <code>NextToken</code> value that you can use to fetch the next
  /// batch of results.)
  ///
  /// The service might return fewer results than the <code>MaxResults</code>
  /// value. If <code>MaxResults</code> is not included in the request, the
  /// service defaults to pagination with a maximum of 10 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListOfferings</code> request with
  /// <code>MaxResults</code> set at 5. The service returns the first batch of
  /// results (up to 5) and a <code>NextToken</code> value. To see the next
  /// batch of results, you can submit the <code>ListOfferings</code> request a
  /// second time and specify the <code>NextToken</code> value.
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

  /// Submits a request to purchase an offering. If you already have an active
  /// reservation, you can't purchase another offering.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
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
  /// Universal Time (UTC).
  ///
  /// You can specify any date and time between 12:00am on the first day of the
  /// current month to the current time on today's date, inclusive. Specify the
  /// start in a 24-hour notation. Use the following format:
  /// <code>YYYY-MM-DDTHH:mm:SSZ</code>, where <code>T</code> and <code>Z</code>
  /// are literal characters. For example, to specify 11:30pm on March 5, 2020,
  /// enter <code>2020-03-05T23:30:00Z</code>.
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

  /// Displays the details of a reservation. The response includes the
  /// reservation name, state, start date and time, and the details of the
  /// offering that make up the rest of the reservation (such as price,
  /// duration, and outbound bandwidth).
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [reservationArn] :
  /// The Amazon Resource Name (ARN) of the offering.
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

  /// Displays a list of all reservations that have been purchased by this
  /// account in the current Amazon Web Services Region. This list includes all
  /// reservations in all states (such as active and expired).
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per API request.
  ///
  /// For example, you submit a <code>ListReservations</code> request with
  /// <code>MaxResults</code> set at 5. Although 20 items match your request,
  /// the service returns no more than the first 5 items. (The service also
  /// returns a NextToken value that you can use to fetch the next batch of
  /// results.)
  ///
  /// The service might return fewer results than the <code>MaxResults</code>
  /// value. If <code>MaxResults</code> is not included in the request, the
  /// service defaults to pagination with a maximum of 10 results per page.
  ///
  /// Parameter [nextToken] :
  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListReservations</code> request with
  /// <code>MaxResults</code> set at 5. The service returns the first batch of
  /// results (up to 5) and a <code>NextToken</code> value. To see the next
  /// batch of results, you can submit the <code>ListOfferings</code> request a
  /// second time and specify the <code>NextToken</code> value.
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

  /// Creates a new router input in AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [RouterInputServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [configuration] :
  /// The configuration settings for the router input, which can include the
  /// protocol, network interface, and other details.
  ///
  /// Parameter [maximumBitrate] :
  /// The maximum bitrate for the router input.
  ///
  /// Parameter [name] :
  /// The name of the router input.
  ///
  /// Parameter [routingScope] :
  /// Specifies whether the router input can be assigned to outputs in different
  /// Regions. REGIONAL (default) - connects only to outputs in same Region.
  /// GLOBAL - connects to outputs in any Region.
  ///
  /// Parameter [tier] :
  /// The tier level for the router input.
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone where you want to create the router input. This must
  /// be a valid Availability Zone for the region specified by
  /// <code>regionName</code>, or the current region if no
  /// <code>regionName</code> is provided.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request to ensure idempotency.
  ///
  /// Parameter [maintenanceConfiguration] :
  /// The maintenance configuration settings for the router input, including
  /// preferred maintenance windows and schedules.
  ///
  /// Parameter [regionName] :
  /// The Amazon Web Services Region for the router input. Defaults to the
  /// current region if not specified.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to tag and organize this router input.
  ///
  /// Parameter [transitEncryption] :
  /// The transit encryption settings for the router input.
  Future<CreateRouterInputResponse> createRouterInput({
    required RouterInputConfiguration configuration,
    required int maximumBitrate,
    required String name,
    required RoutingScope routingScope,
    required RouterInputTier tier,
    String? availabilityZone,
    String? clientToken,
    MaintenanceConfiguration? maintenanceConfiguration,
    String? regionName,
    Map<String, String>? tags,
    RouterInputTransitEncryption? transitEncryption,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'maximumBitrate': maximumBitrate,
      'name': name,
      'routingScope': routingScope.value,
      'tier': tier.value,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (maintenanceConfiguration != null)
        'maintenanceConfiguration': maintenanceConfiguration,
      if (regionName != null) 'regionName': regionName,
      if (tags != null) 'tags': tags,
      if (transitEncryption != null) 'transitEncryption': transitEncryption,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/routerInput',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRouterInputResponse.fromJson(response);
  }

  /// Retrieves information about a specific router input in AWS Elemental
  /// MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router input to retrieve information
  /// about.
  Future<GetRouterInputResponse> getRouterInput({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/routerInput/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRouterInputResponse.fromJson(response);
  }

  /// Updates the configuration of an existing router input in AWS Elemental
  /// MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router input that you want to
  /// update.
  ///
  /// Parameter [configuration] :
  /// The updated configuration settings for the router input. Changing the type
  /// of the configuration is not supported.
  ///
  /// Parameter [maintenanceConfiguration] :
  /// The updated maintenance configuration settings for the router input,
  /// including any changes to preferred maintenance windows and schedules.
  ///
  /// Parameter [maximumBitrate] :
  /// The updated maximum bitrate for the router input.
  ///
  /// Parameter [name] :
  /// The updated name for the router input.
  ///
  /// Parameter [routingScope] :
  /// Specifies whether the router input can be assigned to outputs in different
  /// Regions. REGIONAL (default) - can be assigned only to outputs in the same
  /// Region. GLOBAL - can be assigned to outputs in any Region.
  ///
  /// Parameter [tier] :
  /// The updated tier level for the router input.
  ///
  /// Parameter [transitEncryption] :
  /// The updated transit encryption settings for the router input.
  Future<UpdateRouterInputResponse> updateRouterInput({
    required String arn,
    RouterInputConfiguration? configuration,
    MaintenanceConfiguration? maintenanceConfiguration,
    int? maximumBitrate,
    String? name,
    RoutingScope? routingScope,
    RouterInputTier? tier,
    RouterInputTransitEncryption? transitEncryption,
  }) async {
    final $payload = <String, dynamic>{
      if (configuration != null) 'configuration': configuration,
      if (maintenanceConfiguration != null)
        'maintenanceConfiguration': maintenanceConfiguration,
      if (maximumBitrate != null) 'maximumBitrate': maximumBitrate,
      if (name != null) 'name': name,
      if (routingScope != null) 'routingScope': routingScope.value,
      if (tier != null) 'tier': tier.value,
      if (transitEncryption != null) 'transitEncryption': transitEncryption,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/routerInput/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRouterInputResponse.fromJson(response);
  }

  /// Deletes a router input from AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router input that you want to
  /// delete.
  Future<DeleteRouterInputResponse> deleteRouterInput({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/routerInput/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRouterInputResponse.fromJson(response);
  }

  /// Retrieves a list of router inputs in AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [filters] :
  /// The filters to apply when retrieving the list of router inputs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of router inputs to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used to retrieve the next page of results.
  Future<ListRouterInputsResponse> listRouterInputs({
    List<RouterInputFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/routerInputs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRouterInputsResponse.fromJson(response);
  }

  /// Retrieves detailed metadata information about a specific router input
  /// source, including stream details and connection state.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router input to retrieve metadata
  /// for.
  Future<GetRouterInputSourceMetadataResponse> getRouterInputSourceMetadata({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/routerInput/${Uri.encodeComponent(arn)}/source-metadata',
      exceptionFnMap: _exceptionFns,
    );
    return GetRouterInputSourceMetadataResponse.fromJson(response);
  }

  /// Retrieves the thumbnail for a router input in AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router input that you want to see a
  /// thumbnail of.
  Future<GetRouterInputThumbnailResponse> getRouterInputThumbnail({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/routerInput/${Uri.encodeComponent(arn)}/thumbnail',
      exceptionFnMap: _exceptionFns,
    );
    return GetRouterInputThumbnailResponse.fromJson(response);
  }

  /// Restarts a router input. This operation can be used to recover from errors
  /// or refresh the input state.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router input that you want to
  /// restart.
  Future<RestartRouterInputResponse> restartRouterInput({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/routerInput/restart/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return RestartRouterInputResponse.fromJson(response);
  }

  /// Starts a router input in AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router input that you want to start.
  Future<StartRouterInputResponse> startRouterInput({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/routerInput/start/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return StartRouterInputResponse.fromJson(response);
  }

  /// Stops a router input in AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router input that you want to stop.
  Future<StopRouterInputResponse> stopRouterInput({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/routerInput/stop/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return StopRouterInputResponse.fromJson(response);
  }

  /// Retrieves information about multiple router inputs in AWS Elemental
  /// MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arns] :
  /// The Amazon Resource Names (ARNs) of the router inputs you want to retrieve
  /// information about.
  Future<BatchGetRouterInputResponse> batchGetRouterInput({
    required List<String> arns,
  }) async {
    final $query = <String, List<String>>{
      'arns': arns,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/routerInputs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetRouterInputResponse.fromJson(response);
  }

  /// Creates a new router network interface in AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [RouterNetworkInterfaceServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [configuration] :
  /// The configuration settings for the router network interface.
  ///
  /// Parameter [name] :
  /// The name of the router network interface.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request to ensure idempotency.
  ///
  /// Parameter [regionName] :
  /// The Amazon Web Services Region for the router network interface. Defaults
  /// to the current region if not specified.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to tag and organize this router network
  /// interface.
  Future<CreateRouterNetworkInterfaceResponse> createRouterNetworkInterface({
    required RouterNetworkInterfaceConfiguration configuration,
    required String name,
    String? clientToken,
    String? regionName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (regionName != null) 'regionName': regionName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/routerNetworkInterface',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRouterNetworkInterfaceResponse.fromJson(response);
  }

  /// Retrieves information about a specific router network interface in AWS
  /// Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router network interface that you
  /// want to retrieve information about.
  Future<GetRouterNetworkInterfaceResponse> getRouterNetworkInterface({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/routerNetworkInterface/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRouterNetworkInterfaceResponse.fromJson(response);
  }

  /// Updates the configuration of an existing router network interface in AWS
  /// Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router network interface that you
  /// want to update.
  ///
  /// Parameter [configuration] :
  /// The updated configuration settings for the router network interface.
  /// Changing the type of the configuration is not supported.
  ///
  /// Parameter [name] :
  /// The updated name for the router network interface.
  Future<UpdateRouterNetworkInterfaceResponse> updateRouterNetworkInterface({
    required String arn,
    RouterNetworkInterfaceConfiguration? configuration,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (configuration != null) 'configuration': configuration,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/routerNetworkInterface/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRouterNetworkInterfaceResponse.fromJson(response);
  }

  /// Deletes a router network interface from AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router network interface that you
  /// want to delete.
  Future<DeleteRouterNetworkInterfaceResponse> deleteRouterNetworkInterface({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/routerNetworkInterface/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRouterNetworkInterfaceResponse.fromJson(response);
  }

  /// Retrieves a list of router network interfaces in AWS Elemental
  /// MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [filters] :
  /// The filters to apply when retrieving the list of router network
  /// interfaces.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of router network interfaces to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used to retrieve the next page of results.
  Future<ListRouterNetworkInterfacesResponse> listRouterNetworkInterfaces({
    List<RouterNetworkInterfaceFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/routerNetworkInterfaces',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRouterNetworkInterfacesResponse.fromJson(response);
  }

  /// Retrieves information about multiple router network interfaces in AWS
  /// Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arns] :
  /// The Amazon Resource Names (ARNs) of the router network interfaces you want
  /// to retrieve information about.
  Future<BatchGetRouterNetworkInterfaceResponse>
      batchGetRouterNetworkInterface({
    required List<String> arns,
  }) async {
    final $query = <String, List<String>>{
      'arns': arns,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/routerNetworkInterfaces',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetRouterNetworkInterfaceResponse.fromJson(response);
  }

  /// Creates a new router output in AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [RouterOutputServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [configuration] :
  /// The configuration settings for the router output.
  ///
  /// Parameter [maximumBitrate] :
  /// The maximum bitrate for the router output.
  ///
  /// Parameter [name] :
  /// The name of the router output.
  ///
  /// Parameter [routingScope] :
  /// Specifies whether the router output can take inputs that are in different
  /// Regions. REGIONAL (default) - can only take inputs from same Region.
  /// GLOBAL - can take inputs from any Region.
  ///
  /// Parameter [tier] :
  /// The tier level for the router output.
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone where you want to create the router output. This
  /// must be a valid Availability Zone for the region specified by
  /// <code>regionName</code>, or the current region if no
  /// <code>regionName</code> is provided.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for the request to ensure idempotency.
  ///
  /// Parameter [maintenanceConfiguration] :
  /// The maintenance configuration settings for the router output, including
  /// preferred maintenance windows and schedules.
  ///
  /// Parameter [regionName] :
  /// The Amazon Web Services Region for the router output. Defaults to the
  /// current region if not specified.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that can be used to tag this router output.
  Future<CreateRouterOutputResponse> createRouterOutput({
    required RouterOutputConfiguration configuration,
    required int maximumBitrate,
    required String name,
    required RoutingScope routingScope,
    required RouterOutputTier tier,
    String? availabilityZone,
    String? clientToken,
    MaintenanceConfiguration? maintenanceConfiguration,
    String? regionName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'maximumBitrate': maximumBitrate,
      'name': name,
      'routingScope': routingScope.value,
      'tier': tier.value,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (maintenanceConfiguration != null)
        'maintenanceConfiguration': maintenanceConfiguration,
      if (regionName != null) 'regionName': regionName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/routerOutput',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRouterOutputResponse.fromJson(response);
  }

  /// Retrieves information about a specific router output in AWS Elemental
  /// MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router output that you want to
  /// retrieve information about.
  Future<GetRouterOutputResponse> getRouterOutput({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/routerOutput/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRouterOutputResponse.fromJson(response);
  }

  /// Updates the configuration of an existing router output in AWS Elemental
  /// MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router output that you want to
  /// update.
  ///
  /// Parameter [configuration] :
  /// The updated configuration settings for the router output. Changing the
  /// type of the configuration is not supported.
  ///
  /// Parameter [maintenanceConfiguration] :
  /// The updated maintenance configuration settings for the router output,
  /// including any changes to preferred maintenance windows and schedules.
  ///
  /// Parameter [maximumBitrate] :
  /// The updated maximum bitrate for the router output.
  ///
  /// Parameter [name] :
  /// The updated name for the router output.
  ///
  /// Parameter [routingScope] :
  /// Specifies whether the router output can take inputs that are in different
  /// Regions. REGIONAL (default) - can only take inputs from same Region.
  /// GLOBAL - can take inputs from any Region.
  ///
  /// Parameter [tier] :
  /// The updated tier level for the router output.
  Future<UpdateRouterOutputResponse> updateRouterOutput({
    required String arn,
    RouterOutputConfiguration? configuration,
    MaintenanceConfiguration? maintenanceConfiguration,
    int? maximumBitrate,
    String? name,
    RoutingScope? routingScope,
    RouterOutputTier? tier,
  }) async {
    final $payload = <String, dynamic>{
      if (configuration != null) 'configuration': configuration,
      if (maintenanceConfiguration != null)
        'maintenanceConfiguration': maintenanceConfiguration,
      if (maximumBitrate != null) 'maximumBitrate': maximumBitrate,
      if (name != null) 'name': name,
      if (routingScope != null) 'routingScope': routingScope.value,
      if (tier != null) 'tier': tier.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/routerOutput/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRouterOutputResponse.fromJson(response);
  }

  /// Deletes a router output from AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router output that you want to
  /// delete.
  Future<DeleteRouterOutputResponse> deleteRouterOutput({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/routerOutput/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRouterOutputResponse.fromJson(response);
  }

  /// Retrieves a list of router outputs in AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [filters] :
  /// The filters to apply when retrieving the list of router outputs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of router outputs to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token used to retrieve the next page of results.
  Future<ListRouterOutputsResponse> listRouterOutputs({
    List<RouterOutputFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/routerOutputs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRouterOutputsResponse.fromJson(response);
  }

  /// Restarts a router output. This operation can be used to recover from
  /// errors or refresh the output state.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router output that you want to
  /// restart.
  Future<RestartRouterOutputResponse> restartRouterOutput({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/routerOutput/restart/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return RestartRouterOutputResponse.fromJson(response);
  }

  /// Starts a router output in AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router output that you want to
  /// start.
  Future<StartRouterOutputResponse> startRouterOutput({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/routerOutput/start/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return StartRouterOutputResponse.fromJson(response);
  }

  /// Stops a router output in AWS Elemental MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the router output that you want to stop.
  Future<StopRouterOutputResponse> stopRouterOutput({
    required String arn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/v1/routerOutput/stop/${Uri.encodeComponent(arn)}',
      exceptionFnMap: _exceptionFns,
    );
    return StopRouterOutputResponse.fromJson(response);
  }

  /// Associates a router input with a router output in AWS Elemental
  /// MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [routerOutputArn] :
  /// The Amazon Resource Name (ARN) of the router output that you want to
  /// associate with a router input.
  ///
  /// Parameter [routerInputArn] :
  /// The Amazon Resource Name (ARN) of the router input that you want to
  /// associate with a router output.
  Future<TakeRouterInputResponse> takeRouterInput({
    required String routerOutputArn,
    String? routerInputArn,
  }) async {
    final $payload = <String, dynamic>{
      if (routerInputArn != null) 'routerInputArn': routerInputArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/routerOutput/takeRouterInput/${Uri.encodeComponent(routerOutputArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TakeRouterInputResponse.fromJson(response);
  }

  /// Retrieves information about multiple router outputs in AWS Elemental
  /// MediaConnect.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [arns] :
  /// The Amazon Resource Names (ARNs) of the router outputs you want to
  /// retrieve information about.
  Future<BatchGetRouterOutputResponse> batchGetRouterOutput({
    required List<String> arns,
  }) async {
    final $query = <String, List<String>>{
      'arns': arns,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/routerOutputs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetRouterOutputResponse.fromJson(response);
  }
}

/// @nodoc
class ListEntitlementsResponse {
  /// A list of entitlements that have been granted to you from other Amazon Web
  /// Services accounts.
  final List<ListedEntitlement>? entitlements;

  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a ListEntitlements request with
  /// <code>MaxResults</code> set at 5. The service returns the first batch of
  /// results (up to 5) and a NextToken value. To see the next batch of results,
  /// you can submit the <code>ListEntitlements</code> request a second time and
  /// specify the <code>NextToken</code> value.
  final String? nextToken;

  ListEntitlementsResponse({
    this.entitlements,
    this.nextToken,
  });

  factory ListEntitlementsResponse.fromJson(Map<String, dynamic> json) {
    return ListEntitlementsResponse(
      entitlements: (json['entitlements'] as List?)
          ?.nonNulls
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

/// @nodoc
class ListTagsForGlobalResourceResponse {
  /// A map of tag keys and values associated with the global resource.
  final Map<String, String>? tags;

  ListTagsForGlobalResourceResponse({
    this.tags,
  });

  factory ListTagsForGlobalResourceResponse.fromJson(
      Map<String, dynamic> json) {
    return ListTagsForGlobalResourceResponse(
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

/// @nodoc
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

/// @nodoc
class CreateBridgeResponse {
  /// The name of the bridge that was created.
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

/// @nodoc
class DescribeBridgeResponse {
  /// The bridge that you requested a description of.
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

/// @nodoc
class UpdateBridgeResponse {
  /// The bridge that was updated.
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

/// @nodoc
class DeleteBridgeResponse {
  /// The ARN of the deleted bridge.
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

/// @nodoc
class ListBridgesResponse {
  /// A list of bridge summaries.
  final List<ListedBridge>? bridges;

  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListBridges</code> request with
  /// <code>MaxResults</code> set at 5. The service returns the first batch of
  /// results (up to 5) and a <code>NextToken</code> value. To see the next batch
  /// of results, you can submit the <code>ListBridges</code> request a second
  /// time and specify the <code>NextToken</code> value.
  final String? nextToken;

  ListBridgesResponse({
    this.bridges,
    this.nextToken,
  });

  factory ListBridgesResponse.fromJson(Map<String, dynamic> json) {
    return ListBridgesResponse(
      bridges: (json['bridges'] as List?)
          ?.nonNulls
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

/// @nodoc
class AddBridgeOutputsResponse {
  /// The ARN of the bridge that you added outputs to.
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
          ?.nonNulls
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

/// @nodoc
class AddBridgeSourcesResponse {
  /// The ARN of the bridge that you added sources to.
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
          ?.nonNulls
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

/// @nodoc
class RemoveBridgeOutputResponse {
  /// The ARN of the bridge from which the output was removed.
  final String? bridgeArn;

  /// The name of the bridge output that was removed.
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

/// @nodoc
class RemoveBridgeSourceResponse {
  /// The ARN of the bridge from which the source was removed.
  final String? bridgeArn;

  /// The name of the bridge source that was removed.
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

/// @nodoc
class UpdateBridgeOutputResponse {
  /// The ARN of the bridge that was updated.
  final String? bridgeArn;

  /// The bridge output that was updated.
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

/// @nodoc
class UpdateBridgeSourceResponse {
  /// The ARN of the updated bridge source.
  final String? bridgeArn;

  /// The updated bridge source.
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

/// @nodoc
class UpdateBridgeStateResponse {
  /// The ARN of the updated bridge.
  final String? bridgeArn;

  /// The new state of the bridge.
  final DesiredState? desiredState;

  UpdateBridgeStateResponse({
    this.bridgeArn,
    this.desiredState,
  });

  factory UpdateBridgeStateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBridgeStateResponse(
      bridgeArn: json['bridgeArn'] as String?,
      desiredState:
          (json['desiredState'] as String?)?.let(DesiredState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final bridgeArn = this.bridgeArn;
    final desiredState = this.desiredState;
    return {
      if (bridgeArn != null) 'bridgeArn': bridgeArn,
      if (desiredState != null) 'desiredState': desiredState.value,
    };
  }
}

/// @nodoc
class CreateFlowResponse {
  /// The flow that you created.
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

/// @nodoc
class DescribeFlowResponse {
  /// The flow that you requested a description of.
  final Flow? flow;

  /// Any errors that apply currently to the flow. If there are no errors,
  /// MediaConnect will not include this field in the response.
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

/// @nodoc
class UpdateFlowResponse {
  /// The updated flow.
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

/// @nodoc
class DeleteFlowResponse {
  /// The ARN of the flow that was deleted.
  final String? flowArn;

  /// The status of the flow when the <code>DeleteFlow</code> process begins.
  final Status? status;

  DeleteFlowResponse({
    this.flowArn,
    this.status,
  });

  factory DeleteFlowResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFlowResponse(
      flowArn: json['flowArn'] as String?,
      status: (json['status'] as String?)?.let(Status.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final status = this.status;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class ListFlowsResponse {
  /// A list of flow summaries.
  final List<ListedFlow>? flows;

  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListFlows</code> request with MaxResults set
  /// at 5. The service returns the first batch of results (up to 5) and a
  /// <code>NextToken</code> value. To see the next batch of results, you can
  /// submit the <code>ListFlows</code> request a second time and specify the
  /// <code>NextToken</code> value.
  final String? nextToken;

  ListFlowsResponse({
    this.flows,
    this.nextToken,
  });

  factory ListFlowsResponse.fromJson(Map<String, dynamic> json) {
    return ListFlowsResponse(
      flows: (json['flows'] as List?)
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class DescribeFlowSourceMetadataResponse {
  /// The ARN of the flow that DescribeFlowSourceMetadata was performed on.
  final String? flowArn;

  /// Provides a status code and message regarding issues found with the flow
  /// source metadata.
  final List<MessageDetail>? messages;

  /// The NDI® specific information about the flow's source. This includes the
  /// current active NDI sender, a list of all discovered NDI senders, the
  /// associated media streams for the active NDI sender, and any relevant status
  /// messages.
  final NdiSourceMetadataInfo? ndiInfo;

  /// The timestamp of the most recent change in metadata for this flow’s source.
  final DateTime? timestamp;

  /// Information about the flow's transport media.
  final TransportMediaInfo? transportMediaInfo;

  DescribeFlowSourceMetadataResponse({
    this.flowArn,
    this.messages,
    this.ndiInfo,
    this.timestamp,
    this.transportMediaInfo,
  });

  factory DescribeFlowSourceMetadataResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeFlowSourceMetadataResponse(
      flowArn: json['flowArn'] as String?,
      messages: (json['messages'] as List?)
          ?.nonNulls
          .map((e) => MessageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      ndiInfo: json['ndiInfo'] != null
          ? NdiSourceMetadataInfo.fromJson(
              json['ndiInfo'] as Map<String, dynamic>)
          : null,
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
    final ndiInfo = this.ndiInfo;
    final timestamp = this.timestamp;
    final transportMediaInfo = this.transportMediaInfo;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (messages != null) 'messages': messages,
      if (ndiInfo != null) 'ndiInfo': ndiInfo,
      if (timestamp != null) 'timestamp': iso8601ToJson(timestamp),
      if (transportMediaInfo != null) 'transportMediaInfo': transportMediaInfo,
    };
  }
}

/// @nodoc
class DescribeFlowSourceThumbnailResponse {
  /// The details of the thumbnail, including thumbnail base64 string, timecode
  /// and the time when thumbnail was generated.
  final ThumbnailDetails? thumbnailDetails;

  DescribeFlowSourceThumbnailResponse({
    this.thumbnailDetails,
  });

  factory DescribeFlowSourceThumbnailResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeFlowSourceThumbnailResponse(
      thumbnailDetails: json['thumbnailDetails'] != null
          ? ThumbnailDetails.fromJson(
              json['thumbnailDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final thumbnailDetails = this.thumbnailDetails;
    return {
      if (thumbnailDetails != null) 'thumbnailDetails': thumbnailDetails,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class RemoveFlowMediaStreamResponse {
  /// The ARN of the flow that was updated.
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

/// @nodoc
class RemoveFlowOutputResponse {
  /// The ARN of the flow that the output was removed from.
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

/// @nodoc
class RemoveFlowSourceResponse {
  /// The ARN of the flow that the source was removed from.
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

/// @nodoc
class RemoveFlowVpcInterfaceResponse {
  /// The ARN of the flow that is associated with the VPC interface you removed.
  final String? flowArn;

  /// IDs of network interfaces associated with the removed VPC interface that
  /// MediaConnect was unable to remove.
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
              ?.nonNulls
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

/// @nodoc
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

/// @nodoc
class StartFlowResponse {
  /// The ARN of the flow that you started.
  final String? flowArn;

  /// The status of the flow when the <code>StartFlow</code> process begins.
  final Status? status;

  StartFlowResponse({
    this.flowArn,
    this.status,
  });

  factory StartFlowResponse.fromJson(Map<String, dynamic> json) {
    return StartFlowResponse(
      flowArn: json['flowArn'] as String?,
      status: (json['status'] as String?)?.let(Status.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final status = this.status;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class StopFlowResponse {
  /// The ARN of the flow that you stopped.
  final String? flowArn;

  /// The status of the flow when the <code>StopFlow</code> process begins.
  final Status? status;

  StopFlowResponse({
    this.flowArn,
    this.status,
  });

  factory StopFlowResponse.fromJson(Map<String, dynamic> json) {
    return StopFlowResponse(
      flowArn: json['flowArn'] as String?,
      status: (json['status'] as String?)?.let(Status.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final status = this.status;
    return {
      if (flowArn != null) 'flowArn': flowArn,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class UpdateFlowSourceResponse {
  /// The ARN of the flow that you updated.
  final String? flowArn;

  /// The details of the sources that are assigned to the flow.
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

/// @nodoc
class DescribeGatewayInstanceResponse {
  /// The gateway instance that you requested a description of.
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

/// @nodoc
class UpdateGatewayInstanceResponse {
  /// The state of the instance. <code>ACTIVE</code> or <code>INACTIVE</code>.
  final BridgePlacement? bridgePlacement;

  /// The ARN of the instance that was updated.
  final String? gatewayInstanceArn;

  UpdateGatewayInstanceResponse({
    this.bridgePlacement,
    this.gatewayInstanceArn,
  });

  factory UpdateGatewayInstanceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateGatewayInstanceResponse(
      bridgePlacement:
          (json['bridgePlacement'] as String?)?.let(BridgePlacement.fromString),
      gatewayInstanceArn: json['gatewayInstanceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bridgePlacement = this.bridgePlacement;
    final gatewayInstanceArn = this.gatewayInstanceArn;
    return {
      if (bridgePlacement != null) 'bridgePlacement': bridgePlacement.value,
      if (gatewayInstanceArn != null) 'gatewayInstanceArn': gatewayInstanceArn,
    };
  }
}

/// @nodoc
class DeregisterGatewayInstanceResponse {
  /// The ARN of the instance.
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
      instanceState:
          (json['instanceState'] as String?)?.let(InstanceState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayInstanceArn = this.gatewayInstanceArn;
    final instanceState = this.instanceState;
    return {
      if (gatewayInstanceArn != null) 'gatewayInstanceArn': gatewayInstanceArn,
      if (instanceState != null) 'instanceState': instanceState.value,
    };
  }
}

/// @nodoc
class ListGatewayInstancesResponse {
  /// A list of instance summaries.
  final List<ListedGatewayInstance>? instances;

  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListInstances</code> request with MaxResults
  /// set at 5. The service returns the first batch of results (up to 5) and a
  /// <code>NextToken</code> value. To see the next batch of results, you can
  /// submit the <code>ListInstances</code> request a second time and specify the
  /// <code>NextToken</code> value.
  final String? nextToken;

  ListGatewayInstancesResponse({
    this.instances,
    this.nextToken,
  });

  factory ListGatewayInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListGatewayInstancesResponse(
      instances: (json['instances'] as List?)
          ?.nonNulls
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

/// @nodoc
class CreateGatewayResponse {
  /// The gateway that you created.
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

/// @nodoc
class DescribeGatewayResponse {
  /// The gateway that you wanted to describe.
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

/// @nodoc
class DeleteGatewayResponse {
  /// The ARN of the gateway that was deleted.
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

/// @nodoc
class ListGatewaysResponse {
  /// A list of gateway summaries.
  final List<ListedGateway>? gateways;

  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListGateways</code> request with
  /// <code>MaxResults</code> set at 5. The service returns the first batch of
  /// results (up to 5) and a <code>NextToken</code> value. To see the next batch
  /// of results, you can submit the <code>ListGateways</code> request a second
  /// time and specify the <code>NextToken</code> value.
  final String? nextToken;

  ListGatewaysResponse({
    this.gateways,
    this.nextToken,
  });

  factory ListGatewaysResponse.fromJson(Map<String, dynamic> json) {
    return ListGatewaysResponse(
      gateways: (json['gateways'] as List?)
          ?.nonNulls
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

/// @nodoc
class DescribeOfferingResponse {
  /// The offering that you requested a description of.
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

/// @nodoc
class ListOfferingsResponse {
  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListOfferings</code> request with
  /// <code>MaxResults</code> set at 5. The service returns the first batch of
  /// results (up to 5) and a <code>NextToken</code> value. To see the next batch
  /// of results, you can submit the <code>ListOfferings</code> request a second
  /// time and specify the <code>NextToken</code> value.
  final String? nextToken;

  /// A list of offerings that are available to this account in the current Amazon
  /// Web Services Region.
  final List<Offering>? offerings;

  ListOfferingsResponse({
    this.nextToken,
    this.offerings,
  });

  factory ListOfferingsResponse.fromJson(Map<String, dynamic> json) {
    return ListOfferingsResponse(
      nextToken: json['nextToken'] as String?,
      offerings: (json['offerings'] as List?)
          ?.nonNulls
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

/// @nodoc
class PurchaseOfferingResponse {
  /// The details of the reservation that you just created when you purchased the
  /// offering.
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

/// @nodoc
class DescribeReservationResponse {
  /// A pricing agreement for a discounted rate for a specific outbound bandwidth
  /// that your MediaConnect account will use each month over a specific time
  /// period. The discounted rate in the reservation applies to outbound bandwidth
  /// for all flows from your account until your account reaches the amount of
  /// bandwidth in your reservation. If you use more outbound bandwidth than the
  /// agreed upon amount in a single month, the overage is charged at the
  /// on-demand rate.
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

/// @nodoc
class ListReservationsResponse {
  /// The token that identifies the batch of results that you want to see.
  ///
  /// For example, you submit a <code>ListReservations</code> request with
  /// <code>MaxResults</code> set at 5. The service returns the first batch of
  /// results (up to 5) and a <code>NextToken</code> value. To see the next batch
  /// of results, you can submit the <code>ListReservations</code> request a
  /// second time and specify the <code>NextToken</code> value.
  final String? nextToken;

  /// A list of all reservations that have been purchased by this account in the
  /// current Amazon Web Services Region.
  final List<Reservation>? reservations;

  ListReservationsResponse({
    this.nextToken,
    this.reservations,
  });

  factory ListReservationsResponse.fromJson(Map<String, dynamic> json) {
    return ListReservationsResponse(
      nextToken: json['nextToken'] as String?,
      reservations: (json['reservations'] as List?)
          ?.nonNulls
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

/// @nodoc
class CreateRouterInputResponse {
  /// The newly-created router input.
  final RouterInput routerInput;

  CreateRouterInputResponse({
    required this.routerInput,
  });

  factory CreateRouterInputResponse.fromJson(Map<String, dynamic> json) {
    return CreateRouterInputResponse(
      routerInput: RouterInput.fromJson(
          (json['routerInput'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final routerInput = this.routerInput;
    return {
      'routerInput': routerInput,
    };
  }
}

/// @nodoc
class GetRouterInputResponse {
  /// The details of the requested router input, including its configuration,
  /// state, and other attributes.
  final RouterInput routerInput;

  GetRouterInputResponse({
    required this.routerInput,
  });

  factory GetRouterInputResponse.fromJson(Map<String, dynamic> json) {
    return GetRouterInputResponse(
      routerInput: RouterInput.fromJson(
          (json['routerInput'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final routerInput = this.routerInput;
    return {
      'routerInput': routerInput,
    };
  }
}

/// @nodoc
class UpdateRouterInputResponse {
  /// The updated router input.
  final RouterInput routerInput;

  UpdateRouterInputResponse({
    required this.routerInput,
  });

  factory UpdateRouterInputResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRouterInputResponse(
      routerInput: RouterInput.fromJson(
          (json['routerInput'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final routerInput = this.routerInput;
    return {
      'routerInput': routerInput,
    };
  }
}

/// @nodoc
class DeleteRouterInputResponse {
  /// The ARN of the deleted router input.
  final String arn;

  /// The name of the deleted router input.
  final String name;

  /// The current state of the deleted router input, indicating where it is in the
  /// deletion process.
  final RouterInputState state;

  DeleteRouterInputResponse({
    required this.arn,
    required this.name,
    required this.state,
  });

  factory DeleteRouterInputResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRouterInputResponse(
      arn: (json['arn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      state: RouterInputState.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final state = this.state;
    return {
      'arn': arn,
      'name': name,
      'state': state.value,
    };
  }
}

/// @nodoc
class ListRouterInputsResponse {
  /// The summary information for the retrieved router inputs.
  final List<ListedRouterInput> routerInputs;

  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  ListRouterInputsResponse({
    required this.routerInputs,
    this.nextToken,
  });

  factory ListRouterInputsResponse.fromJson(Map<String, dynamic> json) {
    return ListRouterInputsResponse(
      routerInputs: ((json['routerInputs'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedRouterInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routerInputs = this.routerInputs;
    final nextToken = this.nextToken;
    return {
      'routerInputs': routerInputs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetRouterInputSourceMetadataResponse {
  /// The Amazon Resource Name (ARN) of the router input.
  final String arn;

  /// The name of the router input.
  final String name;

  /// Detailed metadata information about the router input source, including
  /// connection state, timestamps, and stream configuration.
  final RouterInputSourceMetadataDetails sourceMetadataDetails;

  GetRouterInputSourceMetadataResponse({
    required this.arn,
    required this.name,
    required this.sourceMetadataDetails,
  });

  factory GetRouterInputSourceMetadataResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRouterInputSourceMetadataResponse(
      arn: (json['arn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      sourceMetadataDetails: RouterInputSourceMetadataDetails.fromJson(
          (json['sourceMetadataDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final sourceMetadataDetails = this.sourceMetadataDetails;
    return {
      'arn': arn,
      'name': name,
      'sourceMetadataDetails': sourceMetadataDetails,
    };
  }
}

/// @nodoc
class GetRouterInputThumbnailResponse {
  /// The ARN of the router input.
  final String arn;

  /// The name of the router input.
  final String name;

  /// The details of the thumbnail associated with the router input, including the
  /// thumbnail image, timecode, timestamp, and any associated error messages.
  final RouterInputThumbnailDetails thumbnailDetails;

  GetRouterInputThumbnailResponse({
    required this.arn,
    required this.name,
    required this.thumbnailDetails,
  });

  factory GetRouterInputThumbnailResponse.fromJson(Map<String, dynamic> json) {
    return GetRouterInputThumbnailResponse(
      arn: (json['arn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      thumbnailDetails: RouterInputThumbnailDetails.fromJson(
          (json['thumbnailDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final thumbnailDetails = this.thumbnailDetails;
    return {
      'arn': arn,
      'name': name,
      'thumbnailDetails': thumbnailDetails,
    };
  }
}

/// @nodoc
class RestartRouterInputResponse {
  /// The ARN of the router input that was restarted.
  final String arn;

  /// The name of the router input that was restarted.
  final String name;

  /// The current state of the router input after the restart operation.
  final RouterInputState state;

  RestartRouterInputResponse({
    required this.arn,
    required this.name,
    required this.state,
  });

  factory RestartRouterInputResponse.fromJson(Map<String, dynamic> json) {
    return RestartRouterInputResponse(
      arn: (json['arn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      state: RouterInputState.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final state = this.state;
    return {
      'arn': arn,
      'name': name,
      'state': state.value,
    };
  }
}

/// @nodoc
class StartRouterInputResponse {
  /// The ARN of the router input that was started.
  final String arn;

  /// The details of the maintenance schedule for the router input.
  final MaintenanceSchedule maintenanceSchedule;

  /// The type of maintenance schedule associated with the router input.
  final MaintenanceScheduleType maintenanceScheduleType;

  /// The name of the router input that was started.
  final String name;

  /// The current state of the router input after being started.
  final RouterInputState state;

  StartRouterInputResponse({
    required this.arn,
    required this.maintenanceSchedule,
    required this.maintenanceScheduleType,
    required this.name,
    required this.state,
  });

  factory StartRouterInputResponse.fromJson(Map<String, dynamic> json) {
    return StartRouterInputResponse(
      arn: (json['arn'] as String?) ?? '',
      maintenanceSchedule: MaintenanceSchedule.fromJson(
          (json['maintenanceSchedule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      maintenanceScheduleType: MaintenanceScheduleType.fromString(
          (json['maintenanceScheduleType'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      state: RouterInputState.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final maintenanceSchedule = this.maintenanceSchedule;
    final maintenanceScheduleType = this.maintenanceScheduleType;
    final name = this.name;
    final state = this.state;
    return {
      'arn': arn,
      'maintenanceSchedule': maintenanceSchedule,
      'maintenanceScheduleType': maintenanceScheduleType.value,
      'name': name,
      'state': state.value,
    };
  }
}

/// @nodoc
class StopRouterInputResponse {
  /// The ARN of the router input that was stopped.
  final String arn;

  /// The name of the router input that was stopped.
  final String name;

  /// The current state of the router input after being stopped.
  final RouterInputState state;

  StopRouterInputResponse({
    required this.arn,
    required this.name,
    required this.state,
  });

  factory StopRouterInputResponse.fromJson(Map<String, dynamic> json) {
    return StopRouterInputResponse(
      arn: (json['arn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      state: RouterInputState.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final state = this.state;
    return {
      'arn': arn,
      'name': name,
      'state': state.value,
    };
  }
}

/// @nodoc
class BatchGetRouterInputResponse {
  /// An array of errors that occurred when retrieving the requested router
  /// inputs.
  final List<BatchGetRouterInputError> errors;

  /// An array of router inputs that were successfully retrieved.
  final List<RouterInput> routerInputs;

  BatchGetRouterInputResponse({
    required this.errors,
    required this.routerInputs,
  });

  factory BatchGetRouterInputResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetRouterInputResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BatchGetRouterInputError.fromJson(e as Map<String, dynamic>))
          .toList(),
      routerInputs: ((json['routerInputs'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouterInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final routerInputs = this.routerInputs;
    return {
      'errors': errors,
      'routerInputs': routerInputs,
    };
  }
}

/// @nodoc
class CreateRouterNetworkInterfaceResponse {
  /// The newly-created router network interface.
  final RouterNetworkInterface routerNetworkInterface;

  CreateRouterNetworkInterfaceResponse({
    required this.routerNetworkInterface,
  });

  factory CreateRouterNetworkInterfaceResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateRouterNetworkInterfaceResponse(
      routerNetworkInterface: RouterNetworkInterface.fromJson(
          (json['routerNetworkInterface'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final routerNetworkInterface = this.routerNetworkInterface;
    return {
      'routerNetworkInterface': routerNetworkInterface,
    };
  }
}

/// @nodoc
class GetRouterNetworkInterfaceResponse {
  /// The details of the requested router network interface, including its
  /// configuration and other attributes.
  final RouterNetworkInterface routerNetworkInterface;

  GetRouterNetworkInterfaceResponse({
    required this.routerNetworkInterface,
  });

  factory GetRouterNetworkInterfaceResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRouterNetworkInterfaceResponse(
      routerNetworkInterface: RouterNetworkInterface.fromJson(
          (json['routerNetworkInterface'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final routerNetworkInterface = this.routerNetworkInterface;
    return {
      'routerNetworkInterface': routerNetworkInterface,
    };
  }
}

/// @nodoc
class UpdateRouterNetworkInterfaceResponse {
  /// The updated router network interface.
  final RouterNetworkInterface routerNetworkInterface;

  UpdateRouterNetworkInterfaceResponse({
    required this.routerNetworkInterface,
  });

  factory UpdateRouterNetworkInterfaceResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateRouterNetworkInterfaceResponse(
      routerNetworkInterface: RouterNetworkInterface.fromJson(
          (json['routerNetworkInterface'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final routerNetworkInterface = this.routerNetworkInterface;
    return {
      'routerNetworkInterface': routerNetworkInterface,
    };
  }
}

/// @nodoc
class DeleteRouterNetworkInterfaceResponse {
  /// The ARN of the deleted router network interface.
  final String arn;

  /// The name of the deleted router network interface.
  final String name;

  /// The current state of the deleted router network interface, indicating where
  /// it is in the deletion process.
  final RouterNetworkInterfaceState state;

  DeleteRouterNetworkInterfaceResponse({
    required this.arn,
    required this.name,
    required this.state,
  });

  factory DeleteRouterNetworkInterfaceResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteRouterNetworkInterfaceResponse(
      arn: (json['arn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      state: RouterNetworkInterfaceState.fromString(
          (json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final state = this.state;
    return {
      'arn': arn,
      'name': name,
      'state': state.value,
    };
  }
}

/// @nodoc
class ListRouterNetworkInterfacesResponse {
  /// The summary information for the retrieved router network interfaces.
  final List<ListedRouterNetworkInterface> routerNetworkInterfaces;

  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  ListRouterNetworkInterfacesResponse({
    required this.routerNetworkInterfaces,
    this.nextToken,
  });

  factory ListRouterNetworkInterfacesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRouterNetworkInterfacesResponse(
      routerNetworkInterfaces: ((json['routerNetworkInterfaces'] as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              ListedRouterNetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routerNetworkInterfaces = this.routerNetworkInterfaces;
    final nextToken = this.nextToken;
    return {
      'routerNetworkInterfaces': routerNetworkInterfaces,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class BatchGetRouterNetworkInterfaceResponse {
  /// An array of errors that occurred when retrieving the requested router
  /// network interfaces.
  final List<BatchGetRouterNetworkInterfaceError> errors;

  /// An array of router network interfaces that were successfully retrieved.
  final List<RouterNetworkInterface> routerNetworkInterfaces;

  BatchGetRouterNetworkInterfaceResponse({
    required this.errors,
    required this.routerNetworkInterfaces,
  });

  factory BatchGetRouterNetworkInterfaceResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetRouterNetworkInterfaceResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchGetRouterNetworkInterfaceError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      routerNetworkInterfaces: ((json['routerNetworkInterfaces'] as List?) ??
              const [])
          .nonNulls
          .map(
              (e) => RouterNetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final routerNetworkInterfaces = this.routerNetworkInterfaces;
    return {
      'errors': errors,
      'routerNetworkInterfaces': routerNetworkInterfaces,
    };
  }
}

/// @nodoc
class CreateRouterOutputResponse {
  /// The newly-created router output.
  final RouterOutput routerOutput;

  CreateRouterOutputResponse({
    required this.routerOutput,
  });

  factory CreateRouterOutputResponse.fromJson(Map<String, dynamic> json) {
    return CreateRouterOutputResponse(
      routerOutput: RouterOutput.fromJson(
          (json['routerOutput'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final routerOutput = this.routerOutput;
    return {
      'routerOutput': routerOutput,
    };
  }
}

/// @nodoc
class GetRouterOutputResponse {
  /// The details of the requested router output, including its configuration,
  /// state, and other attributes.
  final RouterOutput routerOutput;

  GetRouterOutputResponse({
    required this.routerOutput,
  });

  factory GetRouterOutputResponse.fromJson(Map<String, dynamic> json) {
    return GetRouterOutputResponse(
      routerOutput: RouterOutput.fromJson(
          (json['routerOutput'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final routerOutput = this.routerOutput;
    return {
      'routerOutput': routerOutput,
    };
  }
}

/// @nodoc
class UpdateRouterOutputResponse {
  /// The updated router output.
  final RouterOutput routerOutput;

  UpdateRouterOutputResponse({
    required this.routerOutput,
  });

  factory UpdateRouterOutputResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRouterOutputResponse(
      routerOutput: RouterOutput.fromJson(
          (json['routerOutput'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final routerOutput = this.routerOutput;
    return {
      'routerOutput': routerOutput,
    };
  }
}

/// @nodoc
class DeleteRouterOutputResponse {
  /// The ARN of the deleted router output.
  final String arn;

  /// The name of the deleted router output.
  final String name;

  /// The current state of the deleted router output, indicating where it is in
  /// the deletion process.
  final RouterOutputState state;

  DeleteRouterOutputResponse({
    required this.arn,
    required this.name,
    required this.state,
  });

  factory DeleteRouterOutputResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRouterOutputResponse(
      arn: (json['arn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      state: RouterOutputState.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final state = this.state;
    return {
      'arn': arn,
      'name': name,
      'state': state.value,
    };
  }
}

/// @nodoc
class ListRouterOutputsResponse {
  /// The summary information for the retrieved router outputs.
  final List<ListedRouterOutput> routerOutputs;

  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  ListRouterOutputsResponse({
    required this.routerOutputs,
    this.nextToken,
  });

  factory ListRouterOutputsResponse.fromJson(Map<String, dynamic> json) {
    return ListRouterOutputsResponse(
      routerOutputs: ((json['routerOutputs'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListedRouterOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routerOutputs = this.routerOutputs;
    final nextToken = this.nextToken;
    return {
      'routerOutputs': routerOutputs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class RestartRouterOutputResponse {
  /// The ARN of the router output that was restarted.
  final String arn;

  /// The name of the router output that was restarted.
  final String name;

  /// The current state of the router output after the restart operation.
  final RouterOutputState state;

  RestartRouterOutputResponse({
    required this.arn,
    required this.name,
    required this.state,
  });

  factory RestartRouterOutputResponse.fromJson(Map<String, dynamic> json) {
    return RestartRouterOutputResponse(
      arn: (json['arn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      state: RouterOutputState.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final state = this.state;
    return {
      'arn': arn,
      'name': name,
      'state': state.value,
    };
  }
}

/// @nodoc
class StartRouterOutputResponse {
  /// The Amazon Resource Name (ARN) of the router output that was started.
  final String arn;

  /// The details of the maintenance schedule for the router output.
  final MaintenanceSchedule maintenanceSchedule;

  /// The type of maintenance schedule associated with the router output.
  final MaintenanceScheduleType maintenanceScheduleType;

  /// The name of the router output that was started.
  final String name;

  /// The current state of the router output after being started.
  final RouterOutputState state;

  StartRouterOutputResponse({
    required this.arn,
    required this.maintenanceSchedule,
    required this.maintenanceScheduleType,
    required this.name,
    required this.state,
  });

  factory StartRouterOutputResponse.fromJson(Map<String, dynamic> json) {
    return StartRouterOutputResponse(
      arn: (json['arn'] as String?) ?? '',
      maintenanceSchedule: MaintenanceSchedule.fromJson(
          (json['maintenanceSchedule'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      maintenanceScheduleType: MaintenanceScheduleType.fromString(
          (json['maintenanceScheduleType'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      state: RouterOutputState.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final maintenanceSchedule = this.maintenanceSchedule;
    final maintenanceScheduleType = this.maintenanceScheduleType;
    final name = this.name;
    final state = this.state;
    return {
      'arn': arn,
      'maintenanceSchedule': maintenanceSchedule,
      'maintenanceScheduleType': maintenanceScheduleType.value,
      'name': name,
      'state': state.value,
    };
  }
}

/// @nodoc
class StopRouterOutputResponse {
  /// The ARN of the router output that was stopped.
  final String arn;

  /// The name of the router output that was stopped.
  final String name;

  /// The current state of the router output after being stopped.
  final RouterOutputState state;

  StopRouterOutputResponse({
    required this.arn,
    required this.name,
    required this.state,
  });

  factory StopRouterOutputResponse.fromJson(Map<String, dynamic> json) {
    return StopRouterOutputResponse(
      arn: (json['arn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      state: RouterOutputState.fromString((json['state'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final state = this.state;
    return {
      'arn': arn,
      'name': name,
      'state': state.value,
    };
  }
}

/// @nodoc
class TakeRouterInputResponse {
  /// The state of the association between the router input and output.
  final RouterOutputRoutedState routedState;

  /// The ARN of the associated router output.
  final String routerOutputArn;

  /// The name of the associated router output.
  final String routerOutputName;

  /// The ARN of the associated router input.
  final String? routerInputArn;

  /// The name of the associated router input.
  final String? routerInputName;

  TakeRouterInputResponse({
    required this.routedState,
    required this.routerOutputArn,
    required this.routerOutputName,
    this.routerInputArn,
    this.routerInputName,
  });

  factory TakeRouterInputResponse.fromJson(Map<String, dynamic> json) {
    return TakeRouterInputResponse(
      routedState: RouterOutputRoutedState.fromString(
          (json['routedState'] as String?) ?? ''),
      routerOutputArn: (json['routerOutputArn'] as String?) ?? '',
      routerOutputName: (json['routerOutputName'] as String?) ?? '',
      routerInputArn: json['routerInputArn'] as String?,
      routerInputName: json['routerInputName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final routedState = this.routedState;
    final routerOutputArn = this.routerOutputArn;
    final routerOutputName = this.routerOutputName;
    final routerInputArn = this.routerInputArn;
    final routerInputName = this.routerInputName;
    return {
      'routedState': routedState.value,
      'routerOutputArn': routerOutputArn,
      'routerOutputName': routerOutputName,
      if (routerInputArn != null) 'routerInputArn': routerInputArn,
      if (routerInputName != null) 'routerInputName': routerInputName,
    };
  }
}

/// @nodoc
class BatchGetRouterOutputResponse {
  /// An array of errors that occurred when retrieving the requested router
  /// outputs.
  final List<BatchGetRouterOutputError> errors;

  /// An array of router outputs that were successfully retrieved.
  final List<RouterOutput> routerOutputs;

  BatchGetRouterOutputResponse({
    required this.errors,
    required this.routerOutputs,
  });

  factory BatchGetRouterOutputResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetRouterOutputResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BatchGetRouterOutputError.fromJson(e as Map<String, dynamic>))
          .toList(),
      routerOutputs: ((json['routerOutputs'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouterOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final routerOutputs = this.routerOutputs;
    return {
      'errors': errors,
      'routerOutputs': routerOutputs,
    };
  }
}

/// An error that occurred when retrieving multiple router outputs in the
/// BatchGetRouterOutput operation, including the ARN, error code, and error
/// message.
///
/// @nodoc
class BatchGetRouterOutputError {
  /// The Amazon Resource Name (ARN) of the router output for which the error
  /// occurred.
  final String arn;

  /// The error code associated with the error.
  final String code;

  /// A message describing the error.
  final String message;

  BatchGetRouterOutputError({
    required this.arn,
    required this.code,
    required this.message,
  });

  factory BatchGetRouterOutputError.fromJson(Map<String, dynamic> json) {
    return BatchGetRouterOutputError(
      arn: (json['arn'] as String?) ?? '',
      code: (json['code'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final code = this.code;
    final message = this.message;
    return {
      'arn': arn,
      'code': code,
      'message': message,
    };
  }
}

/// A router output in AWS Elemental MediaConnect. A router output is a
/// destination for media content that can receive input from one or more router
/// inputs.
///
/// @nodoc
class RouterOutput {
  /// The Amazon Resource Name (ARN) of the router output.
  final String arn;

  /// The Availability Zone of the router output.
  final String availabilityZone;
  final RouterOutputConfiguration configuration;

  /// The timestamp when the router output was created.
  final DateTime createdAt;

  /// The unique identifier of the router output.
  final String id;

  /// The maintenance configuration settings applied to this router output.
  final MaintenanceConfiguration maintenanceConfiguration;

  /// The type of maintenance configuration applied to this router output.
  final MaintenanceType maintenanceType;

  /// The maximum bitrate for the router output.
  final int maximumBitrate;

  /// The messages associated with the router output.
  final List<RouterOutputMessage> messages;

  /// The name of the router output.
  final String name;

  /// The type of the router output.
  final RouterOutputType outputType;

  /// The Amazon Web Services Region where the router output is located.
  final String regionName;

  /// The current state of the association between the router output and its
  /// input.
  final RouterOutputRoutedState routedState;

  /// Indicates whether the router output is configured for Regional or global
  /// routing.
  final RoutingScope routingScope;

  /// The overall state of the router output.
  final RouterOutputState state;
  final RouterOutputStreamDetails streamDetails;

  /// Key-value pairs that can be used to tag and organize this router output.
  final Map<String, String> tags;

  /// The tier level of the router output.
  final RouterOutputTier tier;

  /// The timestamp when the router output was last updated.
  final DateTime updatedAt;

  /// The IP address of the router output.
  final String? ipAddress;

  /// The current maintenance schedule details for this router output.
  final MaintenanceSchedule? maintenanceSchedule;

  /// The type of maintenance schedule currently in effect for this router output.
  final MaintenanceScheduleType? maintenanceScheduleType;

  /// The Amazon Resource Name (ARN) of the router input associated with the
  /// output.
  final String? routedInputArn;

  RouterOutput({
    required this.arn,
    required this.availabilityZone,
    required this.configuration,
    required this.createdAt,
    required this.id,
    required this.maintenanceConfiguration,
    required this.maintenanceType,
    required this.maximumBitrate,
    required this.messages,
    required this.name,
    required this.outputType,
    required this.regionName,
    required this.routedState,
    required this.routingScope,
    required this.state,
    required this.streamDetails,
    required this.tags,
    required this.tier,
    required this.updatedAt,
    this.ipAddress,
    this.maintenanceSchedule,
    this.maintenanceScheduleType,
    this.routedInputArn,
  });

  factory RouterOutput.fromJson(Map<String, dynamic> json) {
    return RouterOutput(
      arn: (json['arn'] as String?) ?? '',
      availabilityZone: (json['availabilityZone'] as String?) ?? '',
      configuration: RouterOutputConfiguration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      maintenanceConfiguration: MaintenanceConfiguration.fromJson(
          (json['maintenanceConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      maintenanceType: MaintenanceType.fromString(
          (json['maintenanceType'] as String?) ?? ''),
      maximumBitrate: (json['maximumBitrate'] as int?) ?? 0,
      messages: ((json['messages'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouterOutputMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: (json['name'] as String?) ?? '',
      outputType:
          RouterOutputType.fromString((json['outputType'] as String?) ?? ''),
      regionName: (json['regionName'] as String?) ?? '',
      routedState: RouterOutputRoutedState.fromString(
          (json['routedState'] as String?) ?? ''),
      routingScope:
          RoutingScope.fromString((json['routingScope'] as String?) ?? ''),
      state: RouterOutputState.fromString((json['state'] as String?) ?? ''),
      streamDetails: RouterOutputStreamDetails.fromJson(
          (json['streamDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      tier: RouterOutputTier.fromString((json['tier'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      ipAddress: json['ipAddress'] as String?,
      maintenanceSchedule: json['maintenanceSchedule'] != null
          ? MaintenanceSchedule.fromJson(
              json['maintenanceSchedule'] as Map<String, dynamic>)
          : null,
      maintenanceScheduleType: (json['maintenanceScheduleType'] as String?)
          ?.let(MaintenanceScheduleType.fromString),
      routedInputArn: json['routedInputArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZone = this.availabilityZone;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final id = this.id;
    final maintenanceConfiguration = this.maintenanceConfiguration;
    final maintenanceType = this.maintenanceType;
    final maximumBitrate = this.maximumBitrate;
    final messages = this.messages;
    final name = this.name;
    final outputType = this.outputType;
    final regionName = this.regionName;
    final routedState = this.routedState;
    final routingScope = this.routingScope;
    final state = this.state;
    final streamDetails = this.streamDetails;
    final tags = this.tags;
    final tier = this.tier;
    final updatedAt = this.updatedAt;
    final ipAddress = this.ipAddress;
    final maintenanceSchedule = this.maintenanceSchedule;
    final maintenanceScheduleType = this.maintenanceScheduleType;
    final routedInputArn = this.routedInputArn;
    return {
      'arn': arn,
      'availabilityZone': availabilityZone,
      'configuration': configuration,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'maintenanceConfiguration': maintenanceConfiguration,
      'maintenanceType': maintenanceType.value,
      'maximumBitrate': maximumBitrate,
      'messages': messages,
      'name': name,
      'outputType': outputType.value,
      'regionName': regionName,
      'routedState': routedState.value,
      'routingScope': routingScope.value,
      'state': state.value,
      'streamDetails': streamDetails,
      'tags': tags,
      'tier': tier.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (maintenanceSchedule != null)
        'maintenanceSchedule': maintenanceSchedule,
      if (maintenanceScheduleType != null)
        'maintenanceScheduleType': maintenanceScheduleType.value,
      if (routedInputArn != null) 'routedInputArn': routedInputArn,
    };
  }
}

/// @nodoc
class RouterOutputState {
  static const creating = RouterOutputState._('CREATING');
  static const standby = RouterOutputState._('STANDBY');
  static const starting = RouterOutputState._('STARTING');
  static const active = RouterOutputState._('ACTIVE');
  static const stopping = RouterOutputState._('STOPPING');
  static const deleting = RouterOutputState._('DELETING');
  static const updating = RouterOutputState._('UPDATING');
  static const error = RouterOutputState._('ERROR');
  static const recovering = RouterOutputState._('RECOVERING');
  static const migrating = RouterOutputState._('MIGRATING');

  final String value;

  const RouterOutputState._(this.value);

  static const values = [
    creating,
    standby,
    starting,
    active,
    stopping,
    deleting,
    updating,
    error,
    recovering,
    migrating
  ];

  static RouterOutputState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouterOutputState._(value));

  @override
  bool operator ==(other) => other is RouterOutputState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouterOutputType {
  static const standard = RouterOutputType._('STANDARD');
  static const mediaconnectFlow = RouterOutputType._('MEDIACONNECT_FLOW');
  static const medialiveInput = RouterOutputType._('MEDIALIVE_INPUT');

  final String value;

  const RouterOutputType._(this.value);

  static const values = [standard, mediaconnectFlow, medialiveInput];

  static RouterOutputType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouterOutputType._(value));

  @override
  bool operator ==(other) => other is RouterOutputType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration settings for a router output.
///
/// @nodoc
class RouterOutputConfiguration {
  final MediaConnectFlowRouterOutputConfiguration? mediaConnectFlow;
  final MediaLiveInputRouterOutputConfiguration? mediaLiveInput;
  final StandardRouterOutputConfiguration? standard;

  RouterOutputConfiguration({
    this.mediaConnectFlow,
    this.mediaLiveInput,
    this.standard,
  });

  factory RouterOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return RouterOutputConfiguration(
      mediaConnectFlow: json['mediaConnectFlow'] != null
          ? MediaConnectFlowRouterOutputConfiguration.fromJson(
              json['mediaConnectFlow'] as Map<String, dynamic>)
          : null,
      mediaLiveInput: json['mediaLiveInput'] != null
          ? MediaLiveInputRouterOutputConfiguration.fromJson(
              json['mediaLiveInput'] as Map<String, dynamic>)
          : null,
      standard: json['standard'] != null
          ? StandardRouterOutputConfiguration.fromJson(
              json['standard'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaConnectFlow = this.mediaConnectFlow;
    final mediaLiveInput = this.mediaLiveInput;
    final standard = this.standard;
    return {
      if (mediaConnectFlow != null) 'mediaConnectFlow': mediaConnectFlow,
      if (mediaLiveInput != null) 'mediaLiveInput': mediaLiveInput,
      if (standard != null) 'standard': standard,
    };
  }
}

/// @nodoc
class RouterOutputRoutedState {
  static const routed = RouterOutputRoutedState._('ROUTED');
  static const routing = RouterOutputRoutedState._('ROUTING');
  static const unrouted = RouterOutputRoutedState._('UNROUTED');

  final String value;

  const RouterOutputRoutedState._(this.value);

  static const values = [routed, routing, unrouted];

  static RouterOutputRoutedState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouterOutputRoutedState._(value));

  @override
  bool operator ==(other) =>
      other is RouterOutputRoutedState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RoutingScope {
  static const regional = RoutingScope._('REGIONAL');
  static const global = RoutingScope._('GLOBAL');

  final String value;

  const RoutingScope._(this.value);

  static const values = [regional, global];

  static RoutingScope fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RoutingScope._(value));

  @override
  bool operator ==(other) => other is RoutingScope && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouterOutputTier {
  static const output_100 = RouterOutputTier._('OUTPUT_100');
  static const output_50 = RouterOutputTier._('OUTPUT_50');
  static const output_20 = RouterOutputTier._('OUTPUT_20');

  final String value;

  const RouterOutputTier._(this.value);

  static const values = [output_100, output_50, output_20];

  static RouterOutputTier fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouterOutputTier._(value));

  @override
  bool operator ==(other) => other is RouterOutputTier && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the router output's stream, including connection state and
/// destination details. The specific details provided vary based on the router
/// output type.
///
/// @nodoc
class RouterOutputStreamDetails {
  final MediaConnectFlowRouterOutputStreamDetails? mediaConnectFlow;
  final MediaLiveInputRouterOutputStreamDetails? mediaLiveInput;
  final StandardRouterOutputStreamDetails? standard;

  RouterOutputStreamDetails({
    this.mediaConnectFlow,
    this.mediaLiveInput,
    this.standard,
  });

  factory RouterOutputStreamDetails.fromJson(Map<String, dynamic> json) {
    return RouterOutputStreamDetails(
      mediaConnectFlow: json['mediaConnectFlow'] != null
          ? MediaConnectFlowRouterOutputStreamDetails.fromJson(
              json['mediaConnectFlow'] as Map<String, dynamic>)
          : null,
      mediaLiveInput: json['mediaLiveInput'] != null
          ? MediaLiveInputRouterOutputStreamDetails.fromJson(
              json['mediaLiveInput'] as Map<String, dynamic>)
          : null,
      standard: json['standard'] != null
          ? StandardRouterOutputStreamDetails.fromJson(
              json['standard'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaConnectFlow = this.mediaConnectFlow;
    final mediaLiveInput = this.mediaLiveInput;
    final standard = this.standard;
    return {
      if (mediaConnectFlow != null) 'mediaConnectFlow': mediaConnectFlow,
      if (mediaLiveInput != null) 'mediaLiveInput': mediaLiveInput,
      if (standard != null) 'standard': standard,
    };
  }
}

/// @nodoc
class MaintenanceType {
  static const preferredDayTime = MaintenanceType._('PREFERRED_DAY_TIME');
  static const $default = MaintenanceType._('DEFAULT');

  final String value;

  const MaintenanceType._(this.value);

  static const values = [preferredDayTime, $default];

  static MaintenanceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MaintenanceType._(value));

  @override
  bool operator ==(other) => other is MaintenanceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration settings for maintenance operations, including preferred
/// maintenance windows and schedules.
///
/// @nodoc
class MaintenanceConfiguration {
  /// Default maintenance configuration settings.
  final DefaultMaintenanceConfiguration? defaultValue;

  /// Preferred day and time maintenance configuration settings.
  final PreferredDayTimeMaintenanceConfiguration? preferredDayTime;

  MaintenanceConfiguration({
    this.defaultValue,
    this.preferredDayTime,
  });

  factory MaintenanceConfiguration.fromJson(Map<String, dynamic> json) {
    return MaintenanceConfiguration(
      defaultValue: json['default'] != null
          ? DefaultMaintenanceConfiguration.fromJson(
              json['default'] as Map<String, dynamic>)
          : null,
      preferredDayTime: json['preferredDayTime'] != null
          ? PreferredDayTimeMaintenanceConfiguration.fromJson(
              json['preferredDayTime'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultValue = this.defaultValue;
    final preferredDayTime = this.preferredDayTime;
    return {
      if (defaultValue != null) 'default': defaultValue,
      if (preferredDayTime != null) 'preferredDayTime': preferredDayTime,
    };
  }
}

/// @nodoc
class MaintenanceScheduleType {
  static const window = MaintenanceScheduleType._('WINDOW');

  final String value;

  const MaintenanceScheduleType._(this.value);

  static const values = [window];

  static MaintenanceScheduleType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MaintenanceScheduleType._(value));

  @override
  bool operator ==(other) =>
      other is MaintenanceScheduleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of the maintenance schedule.
///
/// @nodoc
class MaintenanceSchedule {
  final WindowMaintenanceSchedule? window;

  MaintenanceSchedule({
    this.window,
  });

  factory MaintenanceSchedule.fromJson(Map<String, dynamic> json) {
    return MaintenanceSchedule(
      window: json['window'] != null
          ? WindowMaintenanceSchedule.fromJson(
              json['window'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final window = this.window;
    return {
      if (window != null) 'window': window,
    };
  }
}

/// Defines a specific time window for maintenance operations.
///
/// @nodoc
class WindowMaintenanceSchedule {
  /// The end time of the maintenance window.
  final DateTime end;

  /// The date and time when the maintenance window is scheduled to occur.
  final DateTime scheduledTime;

  /// The start time of the maintenance window.
  final DateTime start;

  WindowMaintenanceSchedule({
    required this.end,
    required this.scheduledTime,
    required this.start,
  });

  factory WindowMaintenanceSchedule.fromJson(Map<String, dynamic> json) {
    return WindowMaintenanceSchedule(
      end: nonNullableTimeStampFromJson(json['end'] ?? 0),
      scheduledTime: nonNullableTimeStampFromJson(json['scheduledTime'] ?? 0),
      start: nonNullableTimeStampFromJson(json['start'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final scheduledTime = this.scheduledTime;
    final start = this.start;
    return {
      'end': iso8601ToJson(end),
      'scheduledTime': iso8601ToJson(scheduledTime),
      'start': iso8601ToJson(start),
    };
  }
}

/// Configuration for preferred day and time maintenance settings.
///
/// @nodoc
class PreferredDayTimeMaintenanceConfiguration {
  /// The preferred day for maintenance operations.
  final Day day;

  /// The preferred time for maintenance operations.
  final String time;

  PreferredDayTimeMaintenanceConfiguration({
    required this.day,
    required this.time,
  });

  factory PreferredDayTimeMaintenanceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return PreferredDayTimeMaintenanceConfiguration(
      day: Day.fromString((json['day'] as String?) ?? ''),
      time: (json['time'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final day = this.day;
    final time = this.time;
    return {
      'day': day.value,
      'time': time,
    };
  }
}

/// Configuration settings for default maintenance scheduling.
///
/// @nodoc
class DefaultMaintenanceConfiguration {
  DefaultMaintenanceConfiguration();

  factory DefaultMaintenanceConfiguration.fromJson(Map<String, dynamic> _) {
    return DefaultMaintenanceConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class Day {
  static const monday = Day._('MONDAY');
  static const tuesday = Day._('TUESDAY');
  static const wednesday = Day._('WEDNESDAY');
  static const thursday = Day._('THURSDAY');
  static const friday = Day._('FRIDAY');
  static const saturday = Day._('SATURDAY');
  static const sunday = Day._('SUNDAY');

  final String value;

  const Day._(this.value);

  static const values = [
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
  ];

  static Day fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Day._(value));

  @override
  bool operator ==(other) => other is Day && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration details for a standard router output stream type. Contains
/// information about the destination IP address and connection state for basic
/// output routing.
///
/// @nodoc
class StandardRouterOutputStreamDetails {
  /// The IP address where the output stream will be sent. This is the destination
  /// address that will receive the routed media content.
  final String? destinationIpAddress;

  StandardRouterOutputStreamDetails({
    this.destinationIpAddress,
  });

  factory StandardRouterOutputStreamDetails.fromJson(
      Map<String, dynamic> json) {
    return StandardRouterOutputStreamDetails(
      destinationIpAddress: json['destinationIpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationIpAddress = this.destinationIpAddress;
    return {
      if (destinationIpAddress != null)
        'destinationIpAddress': destinationIpAddress,
    };
  }
}

/// Configuration details for a MediaConnect flow when used as a router output
/// destination.
///
/// @nodoc
class MediaConnectFlowRouterOutputStreamDetails {
  MediaConnectFlowRouterOutputStreamDetails();

  factory MediaConnectFlowRouterOutputStreamDetails.fromJson(
      Map<String, dynamic> _) {
    return MediaConnectFlowRouterOutputStreamDetails();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Configuration details for a MediaLive input when used as a router output
/// destination.
///
/// @nodoc
class MediaLiveInputRouterOutputStreamDetails {
  MediaLiveInputRouterOutputStreamDetails();

  factory MediaLiveInputRouterOutputStreamDetails.fromJson(
      Map<String, dynamic> _) {
    return MediaLiveInputRouterOutputStreamDetails();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A message associated with a router output.
///
/// @nodoc
class RouterOutputMessage {
  /// The code associated with the router output message.
  final String code;

  /// The message text associated with the router output message.
  final String message;

  RouterOutputMessage({
    required this.code,
    required this.message,
  });

  factory RouterOutputMessage.fromJson(Map<String, dynamic> json) {
    return RouterOutputMessage(
      code: (json['code'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      'code': code,
      'message': message,
    };
  }
}

/// The configuration settings for a standard router output, including the
/// protocol, protocol-specific configuration, network interface, and
/// availability zone.
///
/// @nodoc
class StandardRouterOutputConfiguration {
  /// The Amazon Resource Name (ARN) of the network interface associated with the
  /// standard router output.
  final String networkInterfaceArn;

  /// The configuration settings for the protocol used by the standard router
  /// output.
  final RouterOutputProtocolConfiguration protocolConfiguration;

  /// The protocol used by the standard router output.
  final RouterOutputProtocol? protocol;

  StandardRouterOutputConfiguration({
    required this.networkInterfaceArn,
    required this.protocolConfiguration,
    this.protocol,
  });

  factory StandardRouterOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return StandardRouterOutputConfiguration(
      networkInterfaceArn: (json['networkInterfaceArn'] as String?) ?? '',
      protocolConfiguration: RouterOutputProtocolConfiguration.fromJson(
          (json['protocolConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      protocol:
          (json['protocol'] as String?)?.let(RouterOutputProtocol.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final networkInterfaceArn = this.networkInterfaceArn;
    final protocolConfiguration = this.protocolConfiguration;
    final protocol = this.protocol;
    return {
      'networkInterfaceArn': networkInterfaceArn,
      'protocolConfiguration': protocolConfiguration,
      if (protocol != null) 'protocol': protocol.value,
    };
  }
}

/// Configuration settings for connecting a router output to a MediaConnect flow
/// source.
///
/// @nodoc
class MediaConnectFlowRouterOutputConfiguration {
  /// The encryption configuration for the flow destination when connected to this
  /// router output.
  final FlowTransitEncryption destinationTransitEncryption;

  /// The ARN of the flow to connect to this router output.
  final String? flowArn;

  /// The ARN of the flow source to connect to this router output.
  final String? flowSourceArn;

  MediaConnectFlowRouterOutputConfiguration({
    required this.destinationTransitEncryption,
    this.flowArn,
    this.flowSourceArn,
  });

  factory MediaConnectFlowRouterOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MediaConnectFlowRouterOutputConfiguration(
      destinationTransitEncryption: FlowTransitEncryption.fromJson(
          (json['destinationTransitEncryption'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      flowArn: json['flowArn'] as String?,
      flowSourceArn: json['flowSourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationTransitEncryption = this.destinationTransitEncryption;
    final flowArn = this.flowArn;
    final flowSourceArn = this.flowSourceArn;
    return {
      'destinationTransitEncryption': destinationTransitEncryption,
      if (flowArn != null) 'flowArn': flowArn,
      if (flowSourceArn != null) 'flowSourceArn': flowSourceArn,
    };
  }
}

/// Configuration settings for connecting a router output to a MediaLive input.
///
/// @nodoc
class MediaLiveInputRouterOutputConfiguration {
  /// The encryption configuration for the MediaLive input when connected to this
  /// router output.
  final MediaLiveTransitEncryption destinationTransitEncryption;

  /// The ARN of the MediaLive input to connect to this router output.
  final String? mediaLiveInputArn;

  /// The index of the MediaLive pipeline to connect to this router output.
  final MediaLiveInputPipelineId? mediaLivePipelineId;

  MediaLiveInputRouterOutputConfiguration({
    required this.destinationTransitEncryption,
    this.mediaLiveInputArn,
    this.mediaLivePipelineId,
  });

  factory MediaLiveInputRouterOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MediaLiveInputRouterOutputConfiguration(
      destinationTransitEncryption: MediaLiveTransitEncryption.fromJson(
          (json['destinationTransitEncryption'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      mediaLiveInputArn: json['mediaLiveInputArn'] as String?,
      mediaLivePipelineId: (json['mediaLivePipelineId'] as String?)
          ?.let(MediaLiveInputPipelineId.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationTransitEncryption = this.destinationTransitEncryption;
    final mediaLiveInputArn = this.mediaLiveInputArn;
    final mediaLivePipelineId = this.mediaLivePipelineId;
    return {
      'destinationTransitEncryption': destinationTransitEncryption,
      if (mediaLiveInputArn != null) 'mediaLiveInputArn': mediaLiveInputArn,
      if (mediaLivePipelineId != null)
        'mediaLivePipelineId': mediaLivePipelineId.value,
    };
  }
}

/// @nodoc
class MediaLiveInputPipelineId {
  static const pipeline_0 = MediaLiveInputPipelineId._('PIPELINE_0');
  static const pipeline_1 = MediaLiveInputPipelineId._('PIPELINE_1');

  final String value;

  const MediaLiveInputPipelineId._(this.value);

  static const values = [pipeline_0, pipeline_1];

  static MediaLiveInputPipelineId fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MediaLiveInputPipelineId._(value));

  @override
  bool operator ==(other) =>
      other is MediaLiveInputPipelineId && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The encryption configuration that defines how content is encrypted during
/// transit between MediaConnect Router and MediaLive. This configuration
/// determines whether encryption keys are automatically managed by the service
/// or manually managed through Secrets Manager.
///
/// @nodoc
class MediaLiveTransitEncryption {
  /// The configuration details for the MediaLive encryption key.
  final MediaLiveTransitEncryptionKeyConfiguration encryptionKeyConfiguration;

  /// The type of encryption key to use for MediaLive transit encryption.
  final MediaLiveTransitEncryptionKeyType? encryptionKeyType;

  MediaLiveTransitEncryption({
    required this.encryptionKeyConfiguration,
    this.encryptionKeyType,
  });

  factory MediaLiveTransitEncryption.fromJson(Map<String, dynamic> json) {
    return MediaLiveTransitEncryption(
      encryptionKeyConfiguration:
          MediaLiveTransitEncryptionKeyConfiguration.fromJson(
              (json['encryptionKeyConfiguration'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      encryptionKeyType: (json['encryptionKeyType'] as String?)
          ?.let(MediaLiveTransitEncryptionKeyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKeyConfiguration = this.encryptionKeyConfiguration;
    final encryptionKeyType = this.encryptionKeyType;
    return {
      'encryptionKeyConfiguration': encryptionKeyConfiguration,
      if (encryptionKeyType != null)
        'encryptionKeyType': encryptionKeyType.value,
    };
  }
}

/// @nodoc
class MediaLiveTransitEncryptionKeyType {
  static const secretsManager =
      MediaLiveTransitEncryptionKeyType._('SECRETS_MANAGER');
  static const automatic = MediaLiveTransitEncryptionKeyType._('AUTOMATIC');

  final String value;

  const MediaLiveTransitEncryptionKeyType._(this.value);

  static const values = [secretsManager, automatic];

  static MediaLiveTransitEncryptionKeyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MediaLiveTransitEncryptionKeyType._(value));

  @override
  bool operator ==(other) =>
      other is MediaLiveTransitEncryptionKeyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration settings for the MediaLive transit encryption key.
///
/// @nodoc
class MediaLiveTransitEncryptionKeyConfiguration {
  final AutomaticEncryptionKeyConfiguration? automatic;
  final SecretsManagerEncryptionKeyConfiguration? secretsManager;

  MediaLiveTransitEncryptionKeyConfiguration({
    this.automatic,
    this.secretsManager,
  });

  factory MediaLiveTransitEncryptionKeyConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MediaLiveTransitEncryptionKeyConfiguration(
      automatic: json['automatic'] != null
          ? AutomaticEncryptionKeyConfiguration.fromJson(
              json['automatic'] as Map<String, dynamic>)
          : null,
      secretsManager: json['secretsManager'] != null
          ? SecretsManagerEncryptionKeyConfiguration.fromJson(
              json['secretsManager'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final automatic = this.automatic;
    final secretsManager = this.secretsManager;
    return {
      if (automatic != null) 'automatic': automatic,
      if (secretsManager != null) 'secretsManager': secretsManager,
    };
  }
}

/// The configuration settings for transit encryption using Secrets Manager,
/// including the secret ARN and role ARN.
///
/// @nodoc
class SecretsManagerEncryptionKeyConfiguration {
  /// The ARN of the IAM role assumed by MediaConnect to access the Secrets
  /// Manager secret.
  final String roleArn;

  /// The ARN of the Secrets Manager secret used for transit encryption.
  final String secretArn;

  SecretsManagerEncryptionKeyConfiguration({
    required this.roleArn,
    required this.secretArn,
  });

  factory SecretsManagerEncryptionKeyConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SecretsManagerEncryptionKeyConfiguration(
      roleArn: (json['roleArn'] as String?) ?? '',
      secretArn: (json['secretArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final secretArn = this.secretArn;
    return {
      'roleArn': roleArn,
      'secretArn': secretArn,
    };
  }
}

/// Configuration settings for automatic encryption key management, where
/// MediaConnect handles key creation and rotation.
///
/// @nodoc
class AutomaticEncryptionKeyConfiguration {
  AutomaticEncryptionKeyConfiguration();

  factory AutomaticEncryptionKeyConfiguration.fromJson(Map<String, dynamic> _) {
    return AutomaticEncryptionKeyConfiguration();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The configuration that defines how content is encrypted during transit
/// between the MediaConnect router and a MediaConnect flow.
///
/// @nodoc
class FlowTransitEncryption {
  /// The configuration details for the encryption key.
  final FlowTransitEncryptionKeyConfiguration encryptionKeyConfiguration;

  /// The type of encryption key to use for flow transit encryption.
  final FlowTransitEncryptionKeyType? encryptionKeyType;

  FlowTransitEncryption({
    required this.encryptionKeyConfiguration,
    this.encryptionKeyType,
  });

  factory FlowTransitEncryption.fromJson(Map<String, dynamic> json) {
    return FlowTransitEncryption(
      encryptionKeyConfiguration:
          FlowTransitEncryptionKeyConfiguration.fromJson(
              (json['encryptionKeyConfiguration'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      encryptionKeyType: (json['encryptionKeyType'] as String?)
          ?.let(FlowTransitEncryptionKeyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKeyConfiguration = this.encryptionKeyConfiguration;
    final encryptionKeyType = this.encryptionKeyType;
    return {
      'encryptionKeyConfiguration': encryptionKeyConfiguration,
      if (encryptionKeyType != null)
        'encryptionKeyType': encryptionKeyType.value,
    };
  }
}

/// @nodoc
class FlowTransitEncryptionKeyType {
  static const secretsManager =
      FlowTransitEncryptionKeyType._('SECRETS_MANAGER');
  static const automatic = FlowTransitEncryptionKeyType._('AUTOMATIC');

  final String value;

  const FlowTransitEncryptionKeyType._(this.value);

  static const values = [secretsManager, automatic];

  static FlowTransitEncryptionKeyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FlowTransitEncryptionKeyType._(value));

  @override
  bool operator ==(other) =>
      other is FlowTransitEncryptionKeyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration settings for flow transit encryption keys.
///
/// @nodoc
class FlowTransitEncryptionKeyConfiguration {
  final AutomaticEncryptionKeyConfiguration? automatic;
  final SecretsManagerEncryptionKeyConfiguration? secretsManager;

  FlowTransitEncryptionKeyConfiguration({
    this.automatic,
    this.secretsManager,
  });

  factory FlowTransitEncryptionKeyConfiguration.fromJson(
      Map<String, dynamic> json) {
    return FlowTransitEncryptionKeyConfiguration(
      automatic: json['automatic'] != null
          ? AutomaticEncryptionKeyConfiguration.fromJson(
              json['automatic'] as Map<String, dynamic>)
          : null,
      secretsManager: json['secretsManager'] != null
          ? SecretsManagerEncryptionKeyConfiguration.fromJson(
              json['secretsManager'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final automatic = this.automatic;
    final secretsManager = this.secretsManager;
    return {
      if (automatic != null) 'automatic': automatic,
      if (secretsManager != null) 'secretsManager': secretsManager,
    };
  }
}

/// The protocol configuration settings for a router output.
///
/// @nodoc
class RouterOutputProtocolConfiguration {
  final RistRouterOutputConfiguration? rist;
  final RtpRouterOutputConfiguration? rtp;
  final SrtCallerRouterOutputConfiguration? srtCaller;
  final SrtListenerRouterOutputConfiguration? srtListener;

  RouterOutputProtocolConfiguration({
    this.rist,
    this.rtp,
    this.srtCaller,
    this.srtListener,
  });

  factory RouterOutputProtocolConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RouterOutputProtocolConfiguration(
      rist: json['rist'] != null
          ? RistRouterOutputConfiguration.fromJson(
              json['rist'] as Map<String, dynamic>)
          : null,
      rtp: json['rtp'] != null
          ? RtpRouterOutputConfiguration.fromJson(
              json['rtp'] as Map<String, dynamic>)
          : null,
      srtCaller: json['srtCaller'] != null
          ? SrtCallerRouterOutputConfiguration.fromJson(
              json['srtCaller'] as Map<String, dynamic>)
          : null,
      srtListener: json['srtListener'] != null
          ? SrtListenerRouterOutputConfiguration.fromJson(
              json['srtListener'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rist = this.rist;
    final rtp = this.rtp;
    final srtCaller = this.srtCaller;
    final srtListener = this.srtListener;
    return {
      if (rist != null) 'rist': rist,
      if (rtp != null) 'rtp': rtp,
      if (srtCaller != null) 'srtCaller': srtCaller,
      if (srtListener != null) 'srtListener': srtListener,
    };
  }
}

/// @nodoc
class RouterOutputProtocol {
  static const rtp = RouterOutputProtocol._('RTP');
  static const rist = RouterOutputProtocol._('RIST');
  static const srtCaller = RouterOutputProtocol._('SRT_CALLER');
  static const srtListener = RouterOutputProtocol._('SRT_LISTENER');

  final String value;

  const RouterOutputProtocol._(this.value);

  static const values = [rtp, rist, srtCaller, srtListener];

  static RouterOutputProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouterOutputProtocol._(value));

  @override
  bool operator ==(other) =>
      other is RouterOutputProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration settings for a router output using the RIST (Reliable
/// Internet Stream Transport) protocol, including the destination address and
/// port.
///
/// @nodoc
class RistRouterOutputConfiguration {
  /// The destination IP address for the RIST protocol in the router output
  /// configuration.
  final String destinationAddress;

  /// The destination port number for the RIST protocol in the router output
  /// configuration.
  final int destinationPort;

  RistRouterOutputConfiguration({
    required this.destinationAddress,
    required this.destinationPort,
  });

  factory RistRouterOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return RistRouterOutputConfiguration(
      destinationAddress: (json['destinationAddress'] as String?) ?? '',
      destinationPort: (json['destinationPort'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationAddress = this.destinationAddress;
    final destinationPort = this.destinationPort;
    return {
      'destinationAddress': destinationAddress,
      'destinationPort': destinationPort,
    };
  }
}

/// The configuration settings for a router output using the SRT (Secure
/// Reliable Transport) protocol in listener mode, including the port, minimum
/// latency, and encryption key configuration.
///
/// @nodoc
class SrtListenerRouterOutputConfiguration {
  /// The minimum latency in milliseconds for the SRT protocol in listener mode.
  final int minimumLatencyMilliseconds;

  /// The port number for the SRT protocol in listener mode.
  final int port;

  /// Defines the encryption settings for an SRT listener output, including the
  /// encryption key configuration and associated parameters.
  final SrtEncryptionConfiguration? encryptionConfiguration;

  SrtListenerRouterOutputConfiguration({
    required this.minimumLatencyMilliseconds,
    required this.port,
    this.encryptionConfiguration,
  });

  factory SrtListenerRouterOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SrtListenerRouterOutputConfiguration(
      minimumLatencyMilliseconds:
          (json['minimumLatencyMilliseconds'] as int?) ?? 0,
      port: (json['port'] as int?) ?? 0,
      encryptionConfiguration: json['encryptionConfiguration'] != null
          ? SrtEncryptionConfiguration.fromJson(
              json['encryptionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final minimumLatencyMilliseconds = this.minimumLatencyMilliseconds;
    final port = this.port;
    final encryptionConfiguration = this.encryptionConfiguration;
    return {
      'minimumLatencyMilliseconds': minimumLatencyMilliseconds,
      'port': port,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
    };
  }
}

/// The configuration settings for a router output using the SRT (Secure
/// Reliable Transport) protocol in caller mode, including the destination
/// address and port, minimum latency, stream ID, and encryption key
/// configuration.
///
/// @nodoc
class SrtCallerRouterOutputConfiguration {
  /// The destination IP address for the SRT protocol in caller mode.
  final String destinationAddress;

  /// The destination port number for the SRT protocol in caller mode.
  final int destinationPort;

  /// The minimum latency in milliseconds for the SRT protocol in caller mode.
  final int minimumLatencyMilliseconds;

  /// Defines the encryption settings for an SRT caller output, including the
  /// encryption key configuration and associated parameters.
  final SrtEncryptionConfiguration? encryptionConfiguration;

  /// The stream ID for the SRT protocol in caller mode.
  final String? streamId;

  SrtCallerRouterOutputConfiguration({
    required this.destinationAddress,
    required this.destinationPort,
    required this.minimumLatencyMilliseconds,
    this.encryptionConfiguration,
    this.streamId,
  });

  factory SrtCallerRouterOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SrtCallerRouterOutputConfiguration(
      destinationAddress: (json['destinationAddress'] as String?) ?? '',
      destinationPort: (json['destinationPort'] as int?) ?? 0,
      minimumLatencyMilliseconds:
          (json['minimumLatencyMilliseconds'] as int?) ?? 0,
      encryptionConfiguration: json['encryptionConfiguration'] != null
          ? SrtEncryptionConfiguration.fromJson(
              json['encryptionConfiguration'] as Map<String, dynamic>)
          : null,
      streamId: json['streamId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationAddress = this.destinationAddress;
    final destinationPort = this.destinationPort;
    final minimumLatencyMilliseconds = this.minimumLatencyMilliseconds;
    final encryptionConfiguration = this.encryptionConfiguration;
    final streamId = this.streamId;
    return {
      'destinationAddress': destinationAddress,
      'destinationPort': destinationPort,
      'minimumLatencyMilliseconds': minimumLatencyMilliseconds,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (streamId != null) 'streamId': streamId,
    };
  }
}

/// The configuration settings for a router output using the RTP (Real-Time
/// Transport Protocol) protocol, including the destination address and port,
/// and forward error correction state.
///
/// @nodoc
class RtpRouterOutputConfiguration {
  /// The destination IP address for the RTP protocol in the router output
  /// configuration.
  final String destinationAddress;

  /// The destination port number for the RTP protocol in the router output
  /// configuration.
  final int destinationPort;

  /// The state of forward error correction for the RTP protocol in the router
  /// output configuration.
  final ForwardErrorCorrectionState? forwardErrorCorrection;

  RtpRouterOutputConfiguration({
    required this.destinationAddress,
    required this.destinationPort,
    this.forwardErrorCorrection,
  });

  factory RtpRouterOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return RtpRouterOutputConfiguration(
      destinationAddress: (json['destinationAddress'] as String?) ?? '',
      destinationPort: (json['destinationPort'] as int?) ?? 0,
      forwardErrorCorrection: (json['forwardErrorCorrection'] as String?)
          ?.let(ForwardErrorCorrectionState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationAddress = this.destinationAddress;
    final destinationPort = this.destinationPort;
    final forwardErrorCorrection = this.forwardErrorCorrection;
    return {
      'destinationAddress': destinationAddress,
      'destinationPort': destinationPort,
      if (forwardErrorCorrection != null)
        'forwardErrorCorrection': forwardErrorCorrection.value,
    };
  }
}

/// @nodoc
class ForwardErrorCorrectionState {
  static const enabled = ForwardErrorCorrectionState._('ENABLED');
  static const disabled = ForwardErrorCorrectionState._('DISABLED');

  final String value;

  const ForwardErrorCorrectionState._(this.value);

  static const values = [enabled, disabled];

  static ForwardErrorCorrectionState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ForwardErrorCorrectionState._(value));

  @override
  bool operator ==(other) =>
      other is ForwardErrorCorrectionState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the configuration settings for encrypting SRT streams, including
/// the encryption key details and encryption parameters.
///
/// @nodoc
class SrtEncryptionConfiguration {
  /// Specifies the encryption key configuration used for encrypting SRT streams,
  /// including the key source and associated credentials.
  final SecretsManagerEncryptionKeyConfiguration encryptionKey;

  SrtEncryptionConfiguration({
    required this.encryptionKey,
  });

  factory SrtEncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return SrtEncryptionConfiguration(
      encryptionKey: SecretsManagerEncryptionKeyConfiguration.fromJson(
          (json['encryptionKey'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKey = this.encryptionKey;
    return {
      'encryptionKey': encryptionKey,
    };
  }
}

/// A summary of a router output, including its name, type, ARN, ID, state,
/// routed state, and other key details. This structure is used in the response
/// of the ListRouterOutputs operation.
///
/// @nodoc
class ListedRouterOutput {
  /// The Amazon Resource Name (ARN) of the router output.
  final String arn;

  /// The Availability Zone of the router output.
  final String availabilityZone;

  /// The timestamp when the router output was created.
  final DateTime createdAt;

  /// The unique identifier of the router output.
  final String id;

  /// The maximum bitrate of the router output.
  final int maximumBitrate;

  /// The number of messages associated with the router output.
  final int messageCount;

  /// The name of the router output.
  final String name;

  /// The type of the router output.
  final RouterOutputType outputType;

  /// The AAmazon Web Services Region where the router output is located.
  final String regionName;

  /// The current state of the association between the router output and its
  /// input.
  final RouterOutputRoutedState routedState;

  /// Indicates whether the router output is configured for Regional or global
  /// routing.
  final RoutingScope routingScope;

  /// The overall state of the router output.
  final RouterOutputState state;

  /// The timestamp when the router output was last updated.
  final DateTime updatedAt;

  /// The details of the maintenance schedule for the listed router output.
  final MaintenanceSchedule? maintenanceSchedule;

  /// The type of maintenance schedule currently associated with the listed router
  /// output.
  final MaintenanceScheduleType? maintenanceScheduleType;

  /// The ARN of the network interface associated with the router output.
  final String? networkInterfaceArn;

  /// The ARN of the router input associated with the output.
  final String? routedInputArn;

  ListedRouterOutput({
    required this.arn,
    required this.availabilityZone,
    required this.createdAt,
    required this.id,
    required this.maximumBitrate,
    required this.messageCount,
    required this.name,
    required this.outputType,
    required this.regionName,
    required this.routedState,
    required this.routingScope,
    required this.state,
    required this.updatedAt,
    this.maintenanceSchedule,
    this.maintenanceScheduleType,
    this.networkInterfaceArn,
    this.routedInputArn,
  });

  factory ListedRouterOutput.fromJson(Map<String, dynamic> json) {
    return ListedRouterOutput(
      arn: (json['arn'] as String?) ?? '',
      availabilityZone: (json['availabilityZone'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      maximumBitrate: (json['maximumBitrate'] as int?) ?? 0,
      messageCount: (json['messageCount'] as int?) ?? 0,
      name: (json['name'] as String?) ?? '',
      outputType:
          RouterOutputType.fromString((json['outputType'] as String?) ?? ''),
      regionName: (json['regionName'] as String?) ?? '',
      routedState: RouterOutputRoutedState.fromString(
          (json['routedState'] as String?) ?? ''),
      routingScope:
          RoutingScope.fromString((json['routingScope'] as String?) ?? ''),
      state: RouterOutputState.fromString((json['state'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      maintenanceSchedule: json['maintenanceSchedule'] != null
          ? MaintenanceSchedule.fromJson(
              json['maintenanceSchedule'] as Map<String, dynamic>)
          : null,
      maintenanceScheduleType: (json['maintenanceScheduleType'] as String?)
          ?.let(MaintenanceScheduleType.fromString),
      networkInterfaceArn: json['networkInterfaceArn'] as String?,
      routedInputArn: json['routedInputArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZone = this.availabilityZone;
    final createdAt = this.createdAt;
    final id = this.id;
    final maximumBitrate = this.maximumBitrate;
    final messageCount = this.messageCount;
    final name = this.name;
    final outputType = this.outputType;
    final regionName = this.regionName;
    final routedState = this.routedState;
    final routingScope = this.routingScope;
    final state = this.state;
    final updatedAt = this.updatedAt;
    final maintenanceSchedule = this.maintenanceSchedule;
    final maintenanceScheduleType = this.maintenanceScheduleType;
    final networkInterfaceArn = this.networkInterfaceArn;
    final routedInputArn = this.routedInputArn;
    return {
      'arn': arn,
      'availabilityZone': availabilityZone,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'maximumBitrate': maximumBitrate,
      'messageCount': messageCount,
      'name': name,
      'outputType': outputType.value,
      'regionName': regionName,
      'routedState': routedState.value,
      'routingScope': routingScope.value,
      'state': state.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (maintenanceSchedule != null)
        'maintenanceSchedule': maintenanceSchedule,
      if (maintenanceScheduleType != null)
        'maintenanceScheduleType': maintenanceScheduleType.value,
      if (networkInterfaceArn != null)
        'networkInterfaceArn': networkInterfaceArn,
      if (routedInputArn != null) 'routedInputArn': routedInputArn,
    };
  }
}

/// A filter that can be used to retrieve a list of router outputs.
///
/// @nodoc
class RouterOutputFilter {
  /// The names of the router outputs to include in the filter.
  final List<String>? nameContains;

  /// The Amazon Resource Names (ARNs) of the network interfaces associated with
  /// the router outputs to include in the filter.
  final List<String>? networkInterfaceArns;

  /// The types of router outputs to include in the filter.
  final List<RouterOutputType>? outputTypes;

  /// The AWS Regions of the router outputs to include in the filter.
  final List<String>? regionNames;

  /// The ARNs of the router inputs associated with the router outputs to include
  /// in the filter.
  final List<String>? routedInputArns;

  /// Filter criteria to list router outputs based on their routing scope.
  final List<RoutingScope>? routingScopes;

  RouterOutputFilter({
    this.nameContains,
    this.networkInterfaceArns,
    this.outputTypes,
    this.regionNames,
    this.routedInputArns,
    this.routingScopes,
  });

  Map<String, dynamic> toJson() {
    final nameContains = this.nameContains;
    final networkInterfaceArns = this.networkInterfaceArns;
    final outputTypes = this.outputTypes;
    final regionNames = this.regionNames;
    final routedInputArns = this.routedInputArns;
    final routingScopes = this.routingScopes;
    return {
      if (nameContains != null) 'nameContains': nameContains,
      if (networkInterfaceArns != null)
        'networkInterfaceArns': networkInterfaceArns,
      if (outputTypes != null)
        'outputTypes': outputTypes.map((e) => e.value).toList(),
      if (regionNames != null) 'regionNames': regionNames,
      if (routedInputArns != null) 'routedInputArns': routedInputArns,
      if (routingScopes != null)
        'routingScopes': routingScopes.map((e) => e.value).toList(),
    };
  }
}

/// An error that occurred when retrieving multiple router network interfaces in
/// the BatchGetRouterNetworkInterface operation, including the ARN, error code,
/// and error message.
///
/// @nodoc
class BatchGetRouterNetworkInterfaceError {
  /// The Amazon Resource Name (ARN) of the router network interface for which the
  /// error occurred.
  final String arn;

  /// The error code associated with the error.
  final String code;

  /// A message describing the error.
  final String message;

  BatchGetRouterNetworkInterfaceError({
    required this.arn,
    required this.code,
    required this.message,
  });

  factory BatchGetRouterNetworkInterfaceError.fromJson(
      Map<String, dynamic> json) {
    return BatchGetRouterNetworkInterfaceError(
      arn: (json['arn'] as String?) ?? '',
      code: (json['code'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final code = this.code;
    final message = this.message;
    return {
      'arn': arn,
      'code': code,
      'message': message,
    };
  }
}

/// A router network interface in AWS Elemental MediaConnect. A router network
/// interface is a network interface that can be associated with one or more
/// router inputs and outputs.
///
/// @nodoc
class RouterNetworkInterface {
  /// The Amazon Resource Name (ARN) of the router network interface.
  final String arn;

  /// The number of router inputs associated with the network interface.
  final int associatedInputCount;

  /// The number of router outputs associated with the network interface.
  final int associatedOutputCount;
  final RouterNetworkInterfaceConfiguration configuration;

  /// The timestamp when the router network interface was created.
  final DateTime createdAt;

  /// The unique identifier of the router network interface.
  final String id;

  /// The name of the router network interface.
  final String name;

  /// The type of the router network interface.
  final RouterNetworkInterfaceType networkInterfaceType;

  /// The Amazon Web Services Region where the router network interface is
  /// located.
  final String regionName;

  /// The current state of the router network interface.
  final RouterNetworkInterfaceState state;

  /// Key-value pairs that can be used to tag and organize this router network
  /// interface.
  final Map<String, String> tags;

  /// The timestamp when the router network interface was last updated.
  final DateTime updatedAt;

  RouterNetworkInterface({
    required this.arn,
    required this.associatedInputCount,
    required this.associatedOutputCount,
    required this.configuration,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.networkInterfaceType,
    required this.regionName,
    required this.state,
    required this.tags,
    required this.updatedAt,
  });

  factory RouterNetworkInterface.fromJson(Map<String, dynamic> json) {
    return RouterNetworkInterface(
      arn: (json['arn'] as String?) ?? '',
      associatedInputCount: (json['associatedInputCount'] as int?) ?? 0,
      associatedOutputCount: (json['associatedOutputCount'] as int?) ?? 0,
      configuration: RouterNetworkInterfaceConfiguration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      networkInterfaceType: RouterNetworkInterfaceType.fromString(
          (json['networkInterfaceType'] as String?) ?? ''),
      regionName: (json['regionName'] as String?) ?? '',
      state: RouterNetworkInterfaceState.fromString(
          (json['state'] as String?) ?? ''),
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedInputCount = this.associatedInputCount;
    final associatedOutputCount = this.associatedOutputCount;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final networkInterfaceType = this.networkInterfaceType;
    final regionName = this.regionName;
    final state = this.state;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'arn': arn,
      'associatedInputCount': associatedInputCount,
      'associatedOutputCount': associatedOutputCount,
      'configuration': configuration,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'name': name,
      'networkInterfaceType': networkInterfaceType.value,
      'regionName': regionName,
      'state': state.value,
      'tags': tags,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class RouterNetworkInterfaceState {
  static const creating = RouterNetworkInterfaceState._('CREATING');
  static const active = RouterNetworkInterfaceState._('ACTIVE');
  static const updating = RouterNetworkInterfaceState._('UPDATING');
  static const deleting = RouterNetworkInterfaceState._('DELETING');
  static const error = RouterNetworkInterfaceState._('ERROR');
  static const recovering = RouterNetworkInterfaceState._('RECOVERING');

  final String value;

  const RouterNetworkInterfaceState._(this.value);

  static const values = [
    creating,
    active,
    updating,
    deleting,
    error,
    recovering
  ];

  static RouterNetworkInterfaceState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouterNetworkInterfaceState._(value));

  @override
  bool operator ==(other) =>
      other is RouterNetworkInterfaceState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouterNetworkInterfaceType {
  static const public = RouterNetworkInterfaceType._('PUBLIC');
  static const vpc = RouterNetworkInterfaceType._('VPC');

  final String value;

  const RouterNetworkInterfaceType._(this.value);

  static const values = [public, vpc];

  static RouterNetworkInterfaceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouterNetworkInterfaceType._(value));

  @override
  bool operator ==(other) =>
      other is RouterNetworkInterfaceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration settings for a router network interface.
///
/// @nodoc
class RouterNetworkInterfaceConfiguration {
  final PublicRouterNetworkInterfaceConfiguration? public;
  final VpcRouterNetworkInterfaceConfiguration? vpc;

  RouterNetworkInterfaceConfiguration({
    this.public,
    this.vpc,
  });

  factory RouterNetworkInterfaceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RouterNetworkInterfaceConfiguration(
      public: json['public'] != null
          ? PublicRouterNetworkInterfaceConfiguration.fromJson(
              json['public'] as Map<String, dynamic>)
          : null,
      vpc: json['vpc'] != null
          ? VpcRouterNetworkInterfaceConfiguration.fromJson(
              json['vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final public = this.public;
    final vpc = this.vpc;
    return {
      if (public != null) 'public': public,
      if (vpc != null) 'vpc': vpc,
    };
  }
}

/// The configuration settings for a public router network interface, including
/// the list of allowed CIDR blocks.
///
/// @nodoc
class PublicRouterNetworkInterfaceConfiguration {
  /// The list of allowed CIDR blocks for the public router network interface.
  final List<PublicRouterNetworkInterfaceRule> allowRules;

  PublicRouterNetworkInterfaceConfiguration({
    required this.allowRules,
  });

  factory PublicRouterNetworkInterfaceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return PublicRouterNetworkInterfaceConfiguration(
      allowRules: ((json['allowRules'] as List?) ?? const [])
          .nonNulls
          .map((e) => PublicRouterNetworkInterfaceRule.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowRules = this.allowRules;
    return {
      'allowRules': allowRules,
    };
  }
}

/// The configuration settings for a router network interface within a VPC,
/// including the security group IDs and subnet ID.
///
/// @nodoc
class VpcRouterNetworkInterfaceConfiguration {
  /// The IDs of the security groups to associate with the router network
  /// interface within the VPC.
  final List<String> securityGroupIds;

  /// The ID of the subnet within the VPC to associate the router network
  /// interface with.
  final String subnetId;

  VpcRouterNetworkInterfaceConfiguration({
    required this.securityGroupIds,
    required this.subnetId,
  });

  factory VpcRouterNetworkInterfaceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return VpcRouterNetworkInterfaceConfiguration(
      securityGroupIds: ((json['securityGroupIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      subnetId: (json['subnetId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetId = this.subnetId;
    return {
      'securityGroupIds': securityGroupIds,
      'subnetId': subnetId,
    };
  }
}

/// A rule that allows a specific CIDR block to access the public router network
/// interface.
///
/// @nodoc
class PublicRouterNetworkInterfaceRule {
  /// The CIDR block that is allowed to access the public router network
  /// interface.
  final String cidr;

  PublicRouterNetworkInterfaceRule({
    required this.cidr,
  });

  factory PublicRouterNetworkInterfaceRule.fromJson(Map<String, dynamic> json) {
    return PublicRouterNetworkInterfaceRule(
      cidr: (json['cidr'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final cidr = this.cidr;
    return {
      'cidr': cidr,
    };
  }
}

/// A summary of a router network interface, including its name, type, ARN, ID,
/// associated input/output counts, state, and other key details. This structure
/// is used in the response of the ListRouterNetworkInterfaces operation.
///
/// @nodoc
class ListedRouterNetworkInterface {
  /// The Amazon Resource Name (ARN) of the router network interface.
  final String arn;

  /// The number of router inputs associated with the network interface.
  final int associatedInputCount;

  /// The number of router outputs associated with the network interface.
  final int associatedOutputCount;

  /// The timestamp when the network interface was created.
  final DateTime createdAt;

  /// The unique identifier of the router network interface.
  final String id;

  /// The name of the router network interface.
  final String name;

  /// The type of the router network interface.
  final RouterNetworkInterfaceType networkInterfaceType;

  /// The Amazon Web Services Region where the router network interface is
  /// located.
  final String regionName;

  /// The current state of the router network interface.
  final RouterNetworkInterfaceState state;

  /// The timestamp when the router network interface was last updated.
  final DateTime updatedAt;

  ListedRouterNetworkInterface({
    required this.arn,
    required this.associatedInputCount,
    required this.associatedOutputCount,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.networkInterfaceType,
    required this.regionName,
    required this.state,
    required this.updatedAt,
  });

  factory ListedRouterNetworkInterface.fromJson(Map<String, dynamic> json) {
    return ListedRouterNetworkInterface(
      arn: (json['arn'] as String?) ?? '',
      associatedInputCount: (json['associatedInputCount'] as int?) ?? 0,
      associatedOutputCount: (json['associatedOutputCount'] as int?) ?? 0,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      networkInterfaceType: RouterNetworkInterfaceType.fromString(
          (json['networkInterfaceType'] as String?) ?? ''),
      regionName: (json['regionName'] as String?) ?? '',
      state: RouterNetworkInterfaceState.fromString(
          (json['state'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final associatedInputCount = this.associatedInputCount;
    final associatedOutputCount = this.associatedOutputCount;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final networkInterfaceType = this.networkInterfaceType;
    final regionName = this.regionName;
    final state = this.state;
    final updatedAt = this.updatedAt;
    return {
      'arn': arn,
      'associatedInputCount': associatedInputCount,
      'associatedOutputCount': associatedOutputCount,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'name': name,
      'networkInterfaceType': networkInterfaceType.value,
      'regionName': regionName,
      'state': state.value,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// A filter that can be used to retrieve a list of router network interfaces.
///
/// @nodoc
class RouterNetworkInterfaceFilter {
  /// The names of the router network interfaces to include in the filter.
  final List<String>? nameContains;

  /// The types of router network interfaces to include in the filter.
  final List<RouterNetworkInterfaceType>? networkInterfaceTypes;

  /// The AWS Regions of the router network interfaces to include in the filter.
  final List<String>? regionNames;

  RouterNetworkInterfaceFilter({
    this.nameContains,
    this.networkInterfaceTypes,
    this.regionNames,
  });

  Map<String, dynamic> toJson() {
    final nameContains = this.nameContains;
    final networkInterfaceTypes = this.networkInterfaceTypes;
    final regionNames = this.regionNames;
    return {
      if (nameContains != null) 'nameContains': nameContains,
      if (networkInterfaceTypes != null)
        'networkInterfaceTypes':
            networkInterfaceTypes.map((e) => e.value).toList(),
      if (regionNames != null) 'regionNames': regionNames,
    };
  }
}

/// An error that occurred when retrieving multiple router inputs in the
/// BatchGetRouterInput operation, including the ARN, error code, and error
/// message.
///
/// @nodoc
class BatchGetRouterInputError {
  /// The Amazon Resource Name (ARN) of the router input for which the error
  /// occurred.
  final String arn;

  /// The error code associated with the error.
  final String code;

  /// A message describing the error.
  final String message;

  BatchGetRouterInputError({
    required this.arn,
    required this.code,
    required this.message,
  });

  factory BatchGetRouterInputError.fromJson(Map<String, dynamic> json) {
    return BatchGetRouterInputError(
      arn: (json['arn'] as String?) ?? '',
      code: (json['code'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final code = this.code;
    final message = this.message;
    return {
      'arn': arn,
      'code': code,
      'message': message,
    };
  }
}

/// A router input in AWS Elemental MediaConnect. A router input is a source of
/// media content that can be routed to one or more router outputs.
///
/// @nodoc
class RouterInput {
  /// The Amazon Resource Name (ARN) of the router input.
  final String arn;

  /// The Availability Zone of the router input.
  final String availabilityZone;
  final RouterInputConfiguration configuration;

  /// The timestamp when the router input was created.
  final DateTime createdAt;

  /// The unique identifier of the router input.
  final String id;

  /// The type of the router input.
  final RouterInputType inputType;

  /// The maintenance configuration settings applied to this router input.
  final MaintenanceConfiguration maintenanceConfiguration;

  /// The type of maintenance configuration applied to this router input.
  final MaintenanceType maintenanceType;

  /// The maximum bitrate for the router input.
  final int maximumBitrate;

  /// The messages associated with the router input.
  final List<RouterInputMessage> messages;

  /// The name of the router input.
  final String name;

  /// The Amazon Web Services Region where the router input is located.
  final String regionName;

  /// The number of router outputs associated with the router input.
  final int routedOutputs;

  /// Indicates whether the router input is configured for Regional or global
  /// routing.
  final RoutingScope routingScope;

  /// The current state of the router input.
  final RouterInputState state;
  final RouterInputStreamDetails streamDetails;

  /// Key-value pairs that can be used to tag and organize this router input.
  final Map<String, String> tags;

  /// The tier level of the router input.
  final RouterInputTier tier;
  final RouterInputTransitEncryption transitEncryption;

  /// The timestamp when the router input was last updated.
  final DateTime updatedAt;

  /// The IP address of the router input.
  final String? ipAddress;

  /// The current maintenance schedule details for this router input.
  final MaintenanceSchedule? maintenanceSchedule;

  /// The type of maintenance schedule currently in effect for this router input.
  final MaintenanceScheduleType? maintenanceScheduleType;

  /// The maximum number of outputs that can be simultaneously routed to this
  /// input.
  final int? maximumRoutedOutputs;

  RouterInput({
    required this.arn,
    required this.availabilityZone,
    required this.configuration,
    required this.createdAt,
    required this.id,
    required this.inputType,
    required this.maintenanceConfiguration,
    required this.maintenanceType,
    required this.maximumBitrate,
    required this.messages,
    required this.name,
    required this.regionName,
    required this.routedOutputs,
    required this.routingScope,
    required this.state,
    required this.streamDetails,
    required this.tags,
    required this.tier,
    required this.transitEncryption,
    required this.updatedAt,
    this.ipAddress,
    this.maintenanceSchedule,
    this.maintenanceScheduleType,
    this.maximumRoutedOutputs,
  });

  factory RouterInput.fromJson(Map<String, dynamic> json) {
    return RouterInput(
      arn: (json['arn'] as String?) ?? '',
      availabilityZone: (json['availabilityZone'] as String?) ?? '',
      configuration: RouterInputConfiguration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      inputType:
          RouterInputType.fromString((json['inputType'] as String?) ?? ''),
      maintenanceConfiguration: MaintenanceConfiguration.fromJson(
          (json['maintenanceConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      maintenanceType: MaintenanceType.fromString(
          (json['maintenanceType'] as String?) ?? ''),
      maximumBitrate: (json['maximumBitrate'] as int?) ?? 0,
      messages: ((json['messages'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouterInputMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: (json['name'] as String?) ?? '',
      regionName: (json['regionName'] as String?) ?? '',
      routedOutputs: (json['routedOutputs'] as int?) ?? 0,
      routingScope:
          RoutingScope.fromString((json['routingScope'] as String?) ?? ''),
      state: RouterInputState.fromString((json['state'] as String?) ?? ''),
      streamDetails: RouterInputStreamDetails.fromJson(
          (json['streamDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
      tier: RouterInputTier.fromString((json['tier'] as String?) ?? ''),
      transitEncryption: RouterInputTransitEncryption.fromJson(
          (json['transitEncryption'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      ipAddress: json['ipAddress'] as String?,
      maintenanceSchedule: json['maintenanceSchedule'] != null
          ? MaintenanceSchedule.fromJson(
              json['maintenanceSchedule'] as Map<String, dynamic>)
          : null,
      maintenanceScheduleType: (json['maintenanceScheduleType'] as String?)
          ?.let(MaintenanceScheduleType.fromString),
      maximumRoutedOutputs: json['maximumRoutedOutputs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZone = this.availabilityZone;
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final id = this.id;
    final inputType = this.inputType;
    final maintenanceConfiguration = this.maintenanceConfiguration;
    final maintenanceType = this.maintenanceType;
    final maximumBitrate = this.maximumBitrate;
    final messages = this.messages;
    final name = this.name;
    final regionName = this.regionName;
    final routedOutputs = this.routedOutputs;
    final routingScope = this.routingScope;
    final state = this.state;
    final streamDetails = this.streamDetails;
    final tags = this.tags;
    final tier = this.tier;
    final transitEncryption = this.transitEncryption;
    final updatedAt = this.updatedAt;
    final ipAddress = this.ipAddress;
    final maintenanceSchedule = this.maintenanceSchedule;
    final maintenanceScheduleType = this.maintenanceScheduleType;
    final maximumRoutedOutputs = this.maximumRoutedOutputs;
    return {
      'arn': arn,
      'availabilityZone': availabilityZone,
      'configuration': configuration,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'inputType': inputType.value,
      'maintenanceConfiguration': maintenanceConfiguration,
      'maintenanceType': maintenanceType.value,
      'maximumBitrate': maximumBitrate,
      'messages': messages,
      'name': name,
      'regionName': regionName,
      'routedOutputs': routedOutputs,
      'routingScope': routingScope.value,
      'state': state.value,
      'streamDetails': streamDetails,
      'tags': tags,
      'tier': tier.value,
      'transitEncryption': transitEncryption,
      'updatedAt': iso8601ToJson(updatedAt),
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (maintenanceSchedule != null)
        'maintenanceSchedule': maintenanceSchedule,
      if (maintenanceScheduleType != null)
        'maintenanceScheduleType': maintenanceScheduleType.value,
      if (maximumRoutedOutputs != null)
        'maximumRoutedOutputs': maximumRoutedOutputs,
    };
  }
}

/// @nodoc
class RouterInputState {
  static const creating = RouterInputState._('CREATING');
  static const standby = RouterInputState._('STANDBY');
  static const starting = RouterInputState._('STARTING');
  static const active = RouterInputState._('ACTIVE');
  static const stopping = RouterInputState._('STOPPING');
  static const deleting = RouterInputState._('DELETING');
  static const updating = RouterInputState._('UPDATING');
  static const error = RouterInputState._('ERROR');
  static const recovering = RouterInputState._('RECOVERING');
  static const migrating = RouterInputState._('MIGRATING');

  final String value;

  const RouterInputState._(this.value);

  static const values = [
    creating,
    standby,
    starting,
    active,
    stopping,
    deleting,
    updating,
    error,
    recovering,
    migrating
  ];

  static RouterInputState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouterInputState._(value));

  @override
  bool operator ==(other) => other is RouterInputState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RouterInputType {
  static const standard = RouterInputType._('STANDARD');
  static const failover = RouterInputType._('FAILOVER');
  static const merge = RouterInputType._('MERGE');
  static const mediaconnectFlow = RouterInputType._('MEDIACONNECT_FLOW');
  static const medialiveChannel = RouterInputType._('MEDIALIVE_CHANNEL');

  final String value;

  const RouterInputType._(this.value);

  static const values = [
    standard,
    failover,
    merge,
    mediaconnectFlow,
    medialiveChannel
  ];

  static RouterInputType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouterInputType._(value));

  @override
  bool operator ==(other) => other is RouterInputType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration settings for a router input.
///
/// @nodoc
class RouterInputConfiguration {
  final FailoverRouterInputConfiguration? failover;
  final MediaConnectFlowRouterInputConfiguration? mediaConnectFlow;
  final MediaLiveChannelRouterInputConfiguration? mediaLiveChannel;
  final MergeRouterInputConfiguration? merge;
  final StandardRouterInputConfiguration? standard;

  RouterInputConfiguration({
    this.failover,
    this.mediaConnectFlow,
    this.mediaLiveChannel,
    this.merge,
    this.standard,
  });

  factory RouterInputConfiguration.fromJson(Map<String, dynamic> json) {
    return RouterInputConfiguration(
      failover: json['failover'] != null
          ? FailoverRouterInputConfiguration.fromJson(
              json['failover'] as Map<String, dynamic>)
          : null,
      mediaConnectFlow: json['mediaConnectFlow'] != null
          ? MediaConnectFlowRouterInputConfiguration.fromJson(
              json['mediaConnectFlow'] as Map<String, dynamic>)
          : null,
      mediaLiveChannel: json['mediaLiveChannel'] != null
          ? MediaLiveChannelRouterInputConfiguration.fromJson(
              json['mediaLiveChannel'] as Map<String, dynamic>)
          : null,
      merge: json['merge'] != null
          ? MergeRouterInputConfiguration.fromJson(
              json['merge'] as Map<String, dynamic>)
          : null,
      standard: json['standard'] != null
          ? StandardRouterInputConfiguration.fromJson(
              json['standard'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final failover = this.failover;
    final mediaConnectFlow = this.mediaConnectFlow;
    final mediaLiveChannel = this.mediaLiveChannel;
    final merge = this.merge;
    final standard = this.standard;
    return {
      if (failover != null) 'failover': failover,
      if (mediaConnectFlow != null) 'mediaConnectFlow': mediaConnectFlow,
      if (mediaLiveChannel != null) 'mediaLiveChannel': mediaLiveChannel,
      if (merge != null) 'merge': merge,
      if (standard != null) 'standard': standard,
    };
  }
}

/// @nodoc
class RouterInputTier {
  static const input_100 = RouterInputTier._('INPUT_100');
  static const input_50 = RouterInputTier._('INPUT_50');
  static const input_20 = RouterInputTier._('INPUT_20');

  final String value;

  const RouterInputTier._(this.value);

  static const values = [input_100, input_50, input_20];

  static RouterInputTier fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouterInputTier._(value));

  @override
  bool operator ==(other) => other is RouterInputTier && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The transit encryption settings for a router input.
///
/// @nodoc
class RouterInputTransitEncryption {
  /// Contains the configuration details for the encryption key used in transit
  /// encryption, including the key source and associated parameters.
  final RouterInputTransitEncryptionKeyConfiguration encryptionKeyConfiguration;

  /// Specifies the type of encryption key to use for transit encryption.
  final RouterInputTransitEncryptionKeyType? encryptionKeyType;

  RouterInputTransitEncryption({
    required this.encryptionKeyConfiguration,
    this.encryptionKeyType,
  });

  factory RouterInputTransitEncryption.fromJson(Map<String, dynamic> json) {
    return RouterInputTransitEncryption(
      encryptionKeyConfiguration:
          RouterInputTransitEncryptionKeyConfiguration.fromJson(
              (json['encryptionKeyConfiguration'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      encryptionKeyType: (json['encryptionKeyType'] as String?)
          ?.let(RouterInputTransitEncryptionKeyType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKeyConfiguration = this.encryptionKeyConfiguration;
    final encryptionKeyType = this.encryptionKeyType;
    return {
      'encryptionKeyConfiguration': encryptionKeyConfiguration,
      if (encryptionKeyType != null)
        'encryptionKeyType': encryptionKeyType.value,
    };
  }
}

/// Configuration details for the router input stream.
///
/// @nodoc
class RouterInputStreamDetails {
  final FailoverRouterInputStreamDetails? failover;
  final MediaConnectFlowRouterInputStreamDetails? mediaConnectFlow;
  final MediaLiveChannelRouterInputStreamDetails? mediaLiveChannel;
  final MergeRouterInputStreamDetails? merge;
  final StandardRouterInputStreamDetails? standard;

  RouterInputStreamDetails({
    this.failover,
    this.mediaConnectFlow,
    this.mediaLiveChannel,
    this.merge,
    this.standard,
  });

  factory RouterInputStreamDetails.fromJson(Map<String, dynamic> json) {
    return RouterInputStreamDetails(
      failover: json['failover'] != null
          ? FailoverRouterInputStreamDetails.fromJson(
              json['failover'] as Map<String, dynamic>)
          : null,
      mediaConnectFlow: json['mediaConnectFlow'] != null
          ? MediaConnectFlowRouterInputStreamDetails.fromJson(
              json['mediaConnectFlow'] as Map<String, dynamic>)
          : null,
      mediaLiveChannel: json['mediaLiveChannel'] != null
          ? MediaLiveChannelRouterInputStreamDetails.fromJson(
              json['mediaLiveChannel'] as Map<String, dynamic>)
          : null,
      merge: json['merge'] != null
          ? MergeRouterInputStreamDetails.fromJson(
              json['merge'] as Map<String, dynamic>)
          : null,
      standard: json['standard'] != null
          ? StandardRouterInputStreamDetails.fromJson(
              json['standard'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final failover = this.failover;
    final mediaConnectFlow = this.mediaConnectFlow;
    final mediaLiveChannel = this.mediaLiveChannel;
    final merge = this.merge;
    final standard = this.standard;
    return {
      if (failover != null) 'failover': failover,
      if (mediaConnectFlow != null) 'mediaConnectFlow': mediaConnectFlow,
      if (mediaLiveChannel != null) 'mediaLiveChannel': mediaLiveChannel,
      if (merge != null) 'merge': merge,
      if (standard != null) 'standard': standard,
    };
  }
}

/// Configuration details for a standard router input stream type.
///
/// @nodoc
class StandardRouterInputStreamDetails {
  /// The source IP address for the standard router input stream.
  final String? sourceIpAddress;

  StandardRouterInputStreamDetails({
    this.sourceIpAddress,
  });

  factory StandardRouterInputStreamDetails.fromJson(Map<String, dynamic> json) {
    return StandardRouterInputStreamDetails(
      sourceIpAddress: json['sourceIpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceIpAddress = this.sourceIpAddress;
    return {
      if (sourceIpAddress != null) 'sourceIpAddress': sourceIpAddress,
    };
  }
}

/// Configuration details for a MediaLive channel when used as a router input
/// source.
///
/// @nodoc
class MediaLiveChannelRouterInputStreamDetails {
  MediaLiveChannelRouterInputStreamDetails();

  factory MediaLiveChannelRouterInputStreamDetails.fromJson(
      Map<String, dynamic> _) {
    return MediaLiveChannelRouterInputStreamDetails();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Configuration details for a failover router input that can automatically
/// switch between two sources.
///
/// @nodoc
class FailoverRouterInputStreamDetails {
  /// Configuration details for the secondary source (index 1) in the failover
  /// setup.
  final FailoverRouterInputIndexedStreamDetails sourceIndexOneStreamDetails;

  /// Configuration details for the primary source (index 0) in the failover
  /// setup.
  final FailoverRouterInputIndexedStreamDetails sourceIndexZeroStreamDetails;

  FailoverRouterInputStreamDetails({
    required this.sourceIndexOneStreamDetails,
    required this.sourceIndexZeroStreamDetails,
  });

  factory FailoverRouterInputStreamDetails.fromJson(Map<String, dynamic> json) {
    return FailoverRouterInputStreamDetails(
      sourceIndexOneStreamDetails:
          FailoverRouterInputIndexedStreamDetails.fromJson(
              (json['sourceIndexOneStreamDetails'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      sourceIndexZeroStreamDetails:
          FailoverRouterInputIndexedStreamDetails.fromJson(
              (json['sourceIndexZeroStreamDetails'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceIndexOneStreamDetails = this.sourceIndexOneStreamDetails;
    final sourceIndexZeroStreamDetails = this.sourceIndexZeroStreamDetails;
    return {
      'sourceIndexOneStreamDetails': sourceIndexOneStreamDetails,
      'sourceIndexZeroStreamDetails': sourceIndexZeroStreamDetails,
    };
  }
}

/// Configuration details for a MediaConnect flow when used as a router input
/// source.
///
/// @nodoc
class MediaConnectFlowRouterInputStreamDetails {
  MediaConnectFlowRouterInputStreamDetails();

  factory MediaConnectFlowRouterInputStreamDetails.fromJson(
      Map<String, dynamic> _) {
    return MediaConnectFlowRouterInputStreamDetails();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Configuration details for a merge router input that combines two input
/// sources.
///
/// @nodoc
class MergeRouterInputStreamDetails {
  /// Configuration details for the second source (index 1) in the merge setup.
  final MergeRouterInputIndexedStreamDetails sourceIndexOneStreamDetails;

  /// Configuration details for the first source (index 0) in the merge setup.
  final MergeRouterInputIndexedStreamDetails sourceIndexZeroStreamDetails;

  MergeRouterInputStreamDetails({
    required this.sourceIndexOneStreamDetails,
    required this.sourceIndexZeroStreamDetails,
  });

  factory MergeRouterInputStreamDetails.fromJson(Map<String, dynamic> json) {
    return MergeRouterInputStreamDetails(
      sourceIndexOneStreamDetails:
          MergeRouterInputIndexedStreamDetails.fromJson(
              (json['sourceIndexOneStreamDetails'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      sourceIndexZeroStreamDetails:
          MergeRouterInputIndexedStreamDetails.fromJson(
              (json['sourceIndexZeroStreamDetails'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceIndexOneStreamDetails = this.sourceIndexOneStreamDetails;
    final sourceIndexZeroStreamDetails = this.sourceIndexZeroStreamDetails;
    return {
      'sourceIndexOneStreamDetails': sourceIndexOneStreamDetails,
      'sourceIndexZeroStreamDetails': sourceIndexZeroStreamDetails,
    };
  }
}

/// Configuration details for an indexed stream in a merge router input setup.
///
/// @nodoc
class MergeRouterInputIndexedStreamDetails {
  /// The index number (0 or 1) assigned to this source in the merge
  /// configuration.
  final int sourceIndex;

  /// The IP address of the source for this indexed stream in the merge setup.
  final String? sourceIpAddress;

  MergeRouterInputIndexedStreamDetails({
    required this.sourceIndex,
    this.sourceIpAddress,
  });

  factory MergeRouterInputIndexedStreamDetails.fromJson(
      Map<String, dynamic> json) {
    return MergeRouterInputIndexedStreamDetails(
      sourceIndex: (json['sourceIndex'] as int?) ?? 0,
      sourceIpAddress: json['sourceIpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceIndex = this.sourceIndex;
    final sourceIpAddress = this.sourceIpAddress;
    return {
      'sourceIndex': sourceIndex,
      if (sourceIpAddress != null) 'sourceIpAddress': sourceIpAddress,
    };
  }
}

/// Configuration details for an indexed stream in a failover router input
/// setup.
///
/// @nodoc
class FailoverRouterInputIndexedStreamDetails {
  /// The index number (0 or 1) assigned to this source in the failover
  /// configuration.
  final int sourceIndex;

  /// The IP address of the source for this indexed stream.
  final String? sourceIpAddress;

  FailoverRouterInputIndexedStreamDetails({
    required this.sourceIndex,
    this.sourceIpAddress,
  });

  factory FailoverRouterInputIndexedStreamDetails.fromJson(
      Map<String, dynamic> json) {
    return FailoverRouterInputIndexedStreamDetails(
      sourceIndex: (json['sourceIndex'] as int?) ?? 0,
      sourceIpAddress: json['sourceIpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceIndex = this.sourceIndex;
    final sourceIpAddress = this.sourceIpAddress;
    return {
      'sourceIndex': sourceIndex,
      if (sourceIpAddress != null) 'sourceIpAddress': sourceIpAddress,
    };
  }
}

/// @nodoc
class RouterInputTransitEncryptionKeyType {
  static const secretsManager =
      RouterInputTransitEncryptionKeyType._('SECRETS_MANAGER');
  static const automatic = RouterInputTransitEncryptionKeyType._('AUTOMATIC');

  final String value;

  const RouterInputTransitEncryptionKeyType._(this.value);

  static const values = [secretsManager, automatic];

  static RouterInputTransitEncryptionKeyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouterInputTransitEncryptionKeyType._(value));

  @override
  bool operator ==(other) =>
      other is RouterInputTransitEncryptionKeyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the configuration settings for transit encryption keys.
///
/// @nodoc
class RouterInputTransitEncryptionKeyConfiguration {
  final AutomaticEncryptionKeyConfiguration? automatic;
  final SecretsManagerEncryptionKeyConfiguration? secretsManager;

  RouterInputTransitEncryptionKeyConfiguration({
    this.automatic,
    this.secretsManager,
  });

  factory RouterInputTransitEncryptionKeyConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RouterInputTransitEncryptionKeyConfiguration(
      automatic: json['automatic'] != null
          ? AutomaticEncryptionKeyConfiguration.fromJson(
              json['automatic'] as Map<String, dynamic>)
          : null,
      secretsManager: json['secretsManager'] != null
          ? SecretsManagerEncryptionKeyConfiguration.fromJson(
              json['secretsManager'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final automatic = this.automatic;
    final secretsManager = this.secretsManager;
    return {
      if (automatic != null) 'automatic': automatic,
      if (secretsManager != null) 'secretsManager': secretsManager,
    };
  }
}

/// A message associated with a router input, including a code and a message.
///
/// @nodoc
class RouterInputMessage {
  /// The code associated with the router input message.
  final String code;

  /// The message text associated with the router input message.
  final String message;

  RouterInputMessage({
    required this.code,
    required this.message,
  });

  factory RouterInputMessage.fromJson(Map<String, dynamic> json) {
    return RouterInputMessage(
      code: (json['code'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      'code': code,
      'message': message,
    };
  }
}

/// The configuration settings for a standard router input, including the
/// protocol, protocol-specific configuration, network interface, and
/// availability zone.
///
/// @nodoc
class StandardRouterInputConfiguration {
  /// The Amazon Resource Name (ARN) of the network interface associated with the
  /// standard router input.
  final String networkInterfaceArn;

  /// The configuration settings for the protocol used by the standard router
  /// input.
  final RouterInputProtocolConfiguration protocolConfiguration;

  /// The protocol used by the standard router input.
  final RouterInputProtocol? protocol;

  StandardRouterInputConfiguration({
    required this.networkInterfaceArn,
    required this.protocolConfiguration,
    this.protocol,
  });

  factory StandardRouterInputConfiguration.fromJson(Map<String, dynamic> json) {
    return StandardRouterInputConfiguration(
      networkInterfaceArn: (json['networkInterfaceArn'] as String?) ?? '',
      protocolConfiguration: RouterInputProtocolConfiguration.fromJson(
          (json['protocolConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      protocol:
          (json['protocol'] as String?)?.let(RouterInputProtocol.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final networkInterfaceArn = this.networkInterfaceArn;
    final protocolConfiguration = this.protocolConfiguration;
    final protocol = this.protocol;
    return {
      'networkInterfaceArn': networkInterfaceArn,
      'protocolConfiguration': protocolConfiguration,
      if (protocol != null) 'protocol': protocol.value,
    };
  }
}

/// Configuration settings for connecting a router input to a MediaLive channel
/// output.
///
/// @nodoc
class MediaLiveChannelRouterInputConfiguration {
  final MediaLiveTransitEncryption sourceTransitDecryption;

  /// The ARN of the MediaLive channel to connect to this router input.
  final String? mediaLiveChannelArn;

  /// The name of the MediaLive channel output to connect to this router input.
  final String? mediaLiveChannelOutputName;

  /// The index of the MediaLive pipeline to connect to this router input.
  final MediaLiveChannelPipelineId? mediaLivePipelineId;

  MediaLiveChannelRouterInputConfiguration({
    required this.sourceTransitDecryption,
    this.mediaLiveChannelArn,
    this.mediaLiveChannelOutputName,
    this.mediaLivePipelineId,
  });

  factory MediaLiveChannelRouterInputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MediaLiveChannelRouterInputConfiguration(
      sourceTransitDecryption: MediaLiveTransitEncryption.fromJson(
          (json['sourceTransitDecryption'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      mediaLiveChannelArn: json['mediaLiveChannelArn'] as String?,
      mediaLiveChannelOutputName: json['mediaLiveChannelOutputName'] as String?,
      mediaLivePipelineId: (json['mediaLivePipelineId'] as String?)
          ?.let(MediaLiveChannelPipelineId.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceTransitDecryption = this.sourceTransitDecryption;
    final mediaLiveChannelArn = this.mediaLiveChannelArn;
    final mediaLiveChannelOutputName = this.mediaLiveChannelOutputName;
    final mediaLivePipelineId = this.mediaLivePipelineId;
    return {
      'sourceTransitDecryption': sourceTransitDecryption,
      if (mediaLiveChannelArn != null)
        'mediaLiveChannelArn': mediaLiveChannelArn,
      if (mediaLiveChannelOutputName != null)
        'mediaLiveChannelOutputName': mediaLiveChannelOutputName,
      if (mediaLivePipelineId != null)
        'mediaLivePipelineId': mediaLivePipelineId.value,
    };
  }
}

/// Configuration settings for a failover router input that allows switching
/// between two input sources.
///
/// @nodoc
class FailoverRouterInputConfiguration {
  /// The ARN of the network interface to use for this failover router input.
  final String networkInterfaceArn;

  /// A list of exactly two protocol configurations for the failover input
  /// sources. Both must use the same protocol type.
  final List<FailoverRouterInputProtocolConfiguration> protocolConfigurations;

  /// The mode for determining source priority in failover configurations.
  final FailoverInputSourcePriorityMode sourcePriorityMode;

  /// The index (0 or 1) that specifies which source in the protocol
  /// configurations list is currently active. Used to control which of the two
  /// failover sources is currently selected. This field is ignored when
  /// sourcePriorityMode is set to NO_PRIORITY
  final int? primarySourceIndex;

  FailoverRouterInputConfiguration({
    required this.networkInterfaceArn,
    required this.protocolConfigurations,
    required this.sourcePriorityMode,
    this.primarySourceIndex,
  });

  factory FailoverRouterInputConfiguration.fromJson(Map<String, dynamic> json) {
    return FailoverRouterInputConfiguration(
      networkInterfaceArn: (json['networkInterfaceArn'] as String?) ?? '',
      protocolConfigurations:
          ((json['protocolConfigurations'] as List?) ?? const [])
              .nonNulls
              .map((e) => FailoverRouterInputProtocolConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      sourcePriorityMode: FailoverInputSourcePriorityMode.fromString(
          (json['sourcePriorityMode'] as String?) ?? ''),
      primarySourceIndex: json['primarySourceIndex'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkInterfaceArn = this.networkInterfaceArn;
    final protocolConfigurations = this.protocolConfigurations;
    final sourcePriorityMode = this.sourcePriorityMode;
    final primarySourceIndex = this.primarySourceIndex;
    return {
      'networkInterfaceArn': networkInterfaceArn,
      'protocolConfigurations': protocolConfigurations,
      'sourcePriorityMode': sourcePriorityMode.value,
      if (primarySourceIndex != null) 'primarySourceIndex': primarySourceIndex,
    };
  }
}

/// Configuration settings for connecting a router input to a flow output.
///
/// @nodoc
class MediaConnectFlowRouterInputConfiguration {
  /// The decryption configuration for the flow source when connected to this
  /// router input.
  final FlowTransitEncryption sourceTransitDecryption;

  /// The ARN of the flow to connect to.
  final String? flowArn;

  /// The ARN of the flow output to connect to this router input.
  final String? flowOutputArn;

  MediaConnectFlowRouterInputConfiguration({
    required this.sourceTransitDecryption,
    this.flowArn,
    this.flowOutputArn,
  });

  factory MediaConnectFlowRouterInputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MediaConnectFlowRouterInputConfiguration(
      sourceTransitDecryption: FlowTransitEncryption.fromJson(
          (json['sourceTransitDecryption'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      flowArn: json['flowArn'] as String?,
      flowOutputArn: json['flowOutputArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceTransitDecryption = this.sourceTransitDecryption;
    final flowArn = this.flowArn;
    final flowOutputArn = this.flowOutputArn;
    return {
      'sourceTransitDecryption': sourceTransitDecryption,
      if (flowArn != null) 'flowArn': flowArn,
      if (flowOutputArn != null) 'flowOutputArn': flowOutputArn,
    };
  }
}

/// Configuration settings for a merge router input that combines two input
/// sources.
///
/// @nodoc
class MergeRouterInputConfiguration {
  /// The time window in milliseconds for merging the two input sources.
  final int mergeRecoveryWindowMilliseconds;

  /// The ARN of the network interface to use for this merge router input.
  final String networkInterfaceArn;

  /// A list of exactly two protocol configurations for the merge input sources.
  /// Both must use the same protocol type.
  final List<MergeRouterInputProtocolConfiguration> protocolConfigurations;

  MergeRouterInputConfiguration({
    required this.mergeRecoveryWindowMilliseconds,
    required this.networkInterfaceArn,
    required this.protocolConfigurations,
  });

  factory MergeRouterInputConfiguration.fromJson(Map<String, dynamic> json) {
    return MergeRouterInputConfiguration(
      mergeRecoveryWindowMilliseconds:
          (json['mergeRecoveryWindowMilliseconds'] as int?) ?? 0,
      networkInterfaceArn: (json['networkInterfaceArn'] as String?) ?? '',
      protocolConfigurations:
          ((json['protocolConfigurations'] as List?) ?? const [])
              .nonNulls
              .map((e) => MergeRouterInputProtocolConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final mergeRecoveryWindowMilliseconds =
        this.mergeRecoveryWindowMilliseconds;
    final networkInterfaceArn = this.networkInterfaceArn;
    final protocolConfigurations = this.protocolConfigurations;
    return {
      'mergeRecoveryWindowMilliseconds': mergeRecoveryWindowMilliseconds,
      'networkInterfaceArn': networkInterfaceArn,
      'protocolConfigurations': protocolConfigurations,
    };
  }
}

/// Protocol configuration settings for merge router inputs.
///
/// @nodoc
class MergeRouterInputProtocolConfiguration {
  final RistRouterInputConfiguration? rist;
  final RtpRouterInputConfiguration? rtp;

  MergeRouterInputProtocolConfiguration({
    this.rist,
    this.rtp,
  });

  factory MergeRouterInputProtocolConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MergeRouterInputProtocolConfiguration(
      rist: json['rist'] != null
          ? RistRouterInputConfiguration.fromJson(
              json['rist'] as Map<String, dynamic>)
          : null,
      rtp: json['rtp'] != null
          ? RtpRouterInputConfiguration.fromJson(
              json['rtp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rist = this.rist;
    final rtp = this.rtp;
    return {
      if (rist != null) 'rist': rist,
      if (rtp != null) 'rtp': rtp,
    };
  }
}

/// The configuration settings for a Router Input using the RTP (Real-Time
/// Transport Protocol) protocol, including the port and forward error
/// correction state.
///
/// @nodoc
class RtpRouterInputConfiguration {
  /// The port number used for the RTP protocol in the router input configuration.
  final int port;

  /// The state of forward error correction for the RTP protocol in the router
  /// input configuration.
  final ForwardErrorCorrectionState? forwardErrorCorrection;

  RtpRouterInputConfiguration({
    required this.port,
    this.forwardErrorCorrection,
  });

  factory RtpRouterInputConfiguration.fromJson(Map<String, dynamic> json) {
    return RtpRouterInputConfiguration(
      port: (json['port'] as int?) ?? 0,
      forwardErrorCorrection: (json['forwardErrorCorrection'] as String?)
          ?.let(ForwardErrorCorrectionState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final forwardErrorCorrection = this.forwardErrorCorrection;
    return {
      'port': port,
      if (forwardErrorCorrection != null)
        'forwardErrorCorrection': forwardErrorCorrection.value,
    };
  }
}

/// The configuration settings for a router input using the RIST (Reliable
/// Internet Stream Transport) protocol, including the port and recovery
/// latency.
///
/// @nodoc
class RistRouterInputConfiguration {
  /// The port number used for the RIST protocol in the router input
  /// configuration.
  final int port;

  /// The recovery latency in milliseconds for the RIST protocol in the router
  /// input configuration.
  final int recoveryLatencyMilliseconds;

  RistRouterInputConfiguration({
    required this.port,
    required this.recoveryLatencyMilliseconds,
  });

  factory RistRouterInputConfiguration.fromJson(Map<String, dynamic> json) {
    return RistRouterInputConfiguration(
      port: (json['port'] as int?) ?? 0,
      recoveryLatencyMilliseconds:
          (json['recoveryLatencyMilliseconds'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final port = this.port;
    final recoveryLatencyMilliseconds = this.recoveryLatencyMilliseconds;
    return {
      'port': port,
      'recoveryLatencyMilliseconds': recoveryLatencyMilliseconds,
    };
  }
}

/// @nodoc
class FailoverInputSourcePriorityMode {
  static const noPriority = FailoverInputSourcePriorityMode._('NO_PRIORITY');
  static const primarySecondary =
      FailoverInputSourcePriorityMode._('PRIMARY_SECONDARY');

  final String value;

  const FailoverInputSourcePriorityMode._(this.value);

  static const values = [noPriority, primarySecondary];

  static FailoverInputSourcePriorityMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FailoverInputSourcePriorityMode._(value));

  @override
  bool operator ==(other) =>
      other is FailoverInputSourcePriorityMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Protocol configuration settings for failover router inputs.
///
/// @nodoc
class FailoverRouterInputProtocolConfiguration {
  final RistRouterInputConfiguration? rist;
  final RtpRouterInputConfiguration? rtp;
  final SrtCallerRouterInputConfiguration? srtCaller;
  final SrtListenerRouterInputConfiguration? srtListener;

  FailoverRouterInputProtocolConfiguration({
    this.rist,
    this.rtp,
    this.srtCaller,
    this.srtListener,
  });

  factory FailoverRouterInputProtocolConfiguration.fromJson(
      Map<String, dynamic> json) {
    return FailoverRouterInputProtocolConfiguration(
      rist: json['rist'] != null
          ? RistRouterInputConfiguration.fromJson(
              json['rist'] as Map<String, dynamic>)
          : null,
      rtp: json['rtp'] != null
          ? RtpRouterInputConfiguration.fromJson(
              json['rtp'] as Map<String, dynamic>)
          : null,
      srtCaller: json['srtCaller'] != null
          ? SrtCallerRouterInputConfiguration.fromJson(
              json['srtCaller'] as Map<String, dynamic>)
          : null,
      srtListener: json['srtListener'] != null
          ? SrtListenerRouterInputConfiguration.fromJson(
              json['srtListener'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rist = this.rist;
    final rtp = this.rtp;
    final srtCaller = this.srtCaller;
    final srtListener = this.srtListener;
    return {
      if (rist != null) 'rist': rist,
      if (rtp != null) 'rtp': rtp,
      if (srtCaller != null) 'srtCaller': srtCaller,
      if (srtListener != null) 'srtListener': srtListener,
    };
  }
}

/// The configuration settings for a router input using the SRT (Secure Reliable
/// Transport) protocol in listener mode, including the port, minimum latency,
/// and decryption key configuration.
///
/// @nodoc
class SrtListenerRouterInputConfiguration {
  /// The minimum latency in milliseconds for the SRT protocol in listener mode.
  final int minimumLatencyMilliseconds;

  /// The port number for the SRT protocol in listener mode.
  final int port;

  /// Specifies the decryption settings for an SRT listener input, including the
  /// encryption key configuration and associated parameters.
  final SrtDecryptionConfiguration? decryptionConfiguration;

  SrtListenerRouterInputConfiguration({
    required this.minimumLatencyMilliseconds,
    required this.port,
    this.decryptionConfiguration,
  });

  factory SrtListenerRouterInputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SrtListenerRouterInputConfiguration(
      minimumLatencyMilliseconds:
          (json['minimumLatencyMilliseconds'] as int?) ?? 0,
      port: (json['port'] as int?) ?? 0,
      decryptionConfiguration: json['decryptionConfiguration'] != null
          ? SrtDecryptionConfiguration.fromJson(
              json['decryptionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final minimumLatencyMilliseconds = this.minimumLatencyMilliseconds;
    final port = this.port;
    final decryptionConfiguration = this.decryptionConfiguration;
    return {
      'minimumLatencyMilliseconds': minimumLatencyMilliseconds,
      'port': port,
      if (decryptionConfiguration != null)
        'decryptionConfiguration': decryptionConfiguration,
    };
  }
}

/// The configuration settings for a router input using the SRT (Secure Reliable
/// Transport) protocol in caller mode, including the source address and port,
/// minimum latency, stream ID, and decryption key configuration.
///
/// @nodoc
class SrtCallerRouterInputConfiguration {
  /// The minimum latency in milliseconds for the SRT protocol in caller mode.
  final int minimumLatencyMilliseconds;

  /// The source IP address for the SRT protocol in caller mode.
  final String sourceAddress;

  /// The source port number for the SRT protocol in caller mode.
  final int sourcePort;

  /// Specifies the decryption settings for an SRT caller input, including the
  /// encryption key configuration and associated parameters.
  final SrtDecryptionConfiguration? decryptionConfiguration;

  /// The stream ID for the SRT protocol in caller mode.
  final String? streamId;

  SrtCallerRouterInputConfiguration({
    required this.minimumLatencyMilliseconds,
    required this.sourceAddress,
    required this.sourcePort,
    this.decryptionConfiguration,
    this.streamId,
  });

  factory SrtCallerRouterInputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SrtCallerRouterInputConfiguration(
      minimumLatencyMilliseconds:
          (json['minimumLatencyMilliseconds'] as int?) ?? 0,
      sourceAddress: (json['sourceAddress'] as String?) ?? '',
      sourcePort: (json['sourcePort'] as int?) ?? 0,
      decryptionConfiguration: json['decryptionConfiguration'] != null
          ? SrtDecryptionConfiguration.fromJson(
              json['decryptionConfiguration'] as Map<String, dynamic>)
          : null,
      streamId: json['streamId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final minimumLatencyMilliseconds = this.minimumLatencyMilliseconds;
    final sourceAddress = this.sourceAddress;
    final sourcePort = this.sourcePort;
    final decryptionConfiguration = this.decryptionConfiguration;
    final streamId = this.streamId;
    return {
      'minimumLatencyMilliseconds': minimumLatencyMilliseconds,
      'sourceAddress': sourceAddress,
      'sourcePort': sourcePort,
      if (decryptionConfiguration != null)
        'decryptionConfiguration': decryptionConfiguration,
      if (streamId != null) 'streamId': streamId,
    };
  }
}

/// Contains the configuration settings for decrypting SRT streams, including
/// the encryption key details and decryption parameters.
///
/// @nodoc
class SrtDecryptionConfiguration {
  /// Specifies the encryption key configuration used for decrypting SRT streams,
  /// including the key source and associated credentials.
  final SecretsManagerEncryptionKeyConfiguration encryptionKey;

  SrtDecryptionConfiguration({
    required this.encryptionKey,
  });

  factory SrtDecryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return SrtDecryptionConfiguration(
      encryptionKey: SecretsManagerEncryptionKeyConfiguration.fromJson(
          (json['encryptionKey'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKey = this.encryptionKey;
    return {
      'encryptionKey': encryptionKey,
    };
  }
}

/// @nodoc
class MediaLiveChannelPipelineId {
  static const pipeline_0 = MediaLiveChannelPipelineId._('PIPELINE_0');
  static const pipeline_1 = MediaLiveChannelPipelineId._('PIPELINE_1');

  final String value;

  const MediaLiveChannelPipelineId._(this.value);

  static const values = [pipeline_0, pipeline_1];

  static MediaLiveChannelPipelineId fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MediaLiveChannelPipelineId._(value));

  @override
  bool operator ==(other) =>
      other is MediaLiveChannelPipelineId && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The protocol configuration settings for a router input.
///
/// @nodoc
class RouterInputProtocolConfiguration {
  final RistRouterInputConfiguration? rist;
  final RtpRouterInputConfiguration? rtp;
  final SrtCallerRouterInputConfiguration? srtCaller;
  final SrtListenerRouterInputConfiguration? srtListener;

  RouterInputProtocolConfiguration({
    this.rist,
    this.rtp,
    this.srtCaller,
    this.srtListener,
  });

  factory RouterInputProtocolConfiguration.fromJson(Map<String, dynamic> json) {
    return RouterInputProtocolConfiguration(
      rist: json['rist'] != null
          ? RistRouterInputConfiguration.fromJson(
              json['rist'] as Map<String, dynamic>)
          : null,
      rtp: json['rtp'] != null
          ? RtpRouterInputConfiguration.fromJson(
              json['rtp'] as Map<String, dynamic>)
          : null,
      srtCaller: json['srtCaller'] != null
          ? SrtCallerRouterInputConfiguration.fromJson(
              json['srtCaller'] as Map<String, dynamic>)
          : null,
      srtListener: json['srtListener'] != null
          ? SrtListenerRouterInputConfiguration.fromJson(
              json['srtListener'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final rist = this.rist;
    final rtp = this.rtp;
    final srtCaller = this.srtCaller;
    final srtListener = this.srtListener;
    return {
      if (rist != null) 'rist': rist,
      if (rtp != null) 'rtp': rtp,
      if (srtCaller != null) 'srtCaller': srtCaller,
      if (srtListener != null) 'srtListener': srtListener,
    };
  }
}

/// @nodoc
class RouterInputProtocol {
  static const rtp = RouterInputProtocol._('RTP');
  static const rist = RouterInputProtocol._('RIST');
  static const srtCaller = RouterInputProtocol._('SRT_CALLER');
  static const srtListener = RouterInputProtocol._('SRT_LISTENER');

  final String value;

  const RouterInputProtocol._(this.value);

  static const values = [rtp, rist, srtCaller, srtListener];

  static RouterInputProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RouterInputProtocol._(value));

  @override
  bool operator ==(other) =>
      other is RouterInputProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a thumbnail associated with a router input, including the
/// thumbnail messages, the thumbnail image, the timecode, and the timestamp.
///
/// @nodoc
class RouterInputThumbnailDetails {
  /// The messages associated with the router input thumbnail.
  final List<RouterInputMessage> thumbnailMessages;

  /// The thumbnail image, encoded as a Base64-encoded binary data object.
  final Uint8List? thumbnail;

  /// The timecode associated with the thumbnail.
  final String? timecode;

  /// The timestamp associated with the thumbnail.
  final DateTime? timestamp;

  RouterInputThumbnailDetails({
    required this.thumbnailMessages,
    this.thumbnail,
    this.timecode,
    this.timestamp,
  });

  factory RouterInputThumbnailDetails.fromJson(Map<String, dynamic> json) {
    return RouterInputThumbnailDetails(
      thumbnailMessages: ((json['thumbnailMessages'] as List?) ?? const [])
          .nonNulls
          .map((e) => RouterInputMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: _s.decodeNullableUint8List(json['thumbnail'] as String?),
      timecode: json['timecode'] as String?,
      timestamp: timeStampFromJson(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final thumbnailMessages = this.thumbnailMessages;
    final thumbnail = this.thumbnail;
    final timecode = this.timecode;
    final timestamp = this.timestamp;
    return {
      'thumbnailMessages': thumbnailMessages,
      if (thumbnail != null) 'thumbnail': base64Encode(thumbnail),
      if (timecode != null) 'timecode': timecode,
      if (timestamp != null) 'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Detailed metadata information about a router input source.
///
/// @nodoc
class RouterInputSourceMetadataDetails {
  /// Collection of metadata messages associated with the router input source.
  final List<RouterInputMessage> sourceMetadataMessages;

  /// The timestamp when the metadata was last updated.
  final DateTime timestamp;

  /// Metadata information specific to the router input configuration and state.
  final RouterInputMetadata? routerInputMetadata;

  RouterInputSourceMetadataDetails({
    required this.sourceMetadataMessages,
    required this.timestamp,
    this.routerInputMetadata,
  });

  factory RouterInputSourceMetadataDetails.fromJson(Map<String, dynamic> json) {
    return RouterInputSourceMetadataDetails(
      sourceMetadataMessages: ((json['sourceMetadataMessages'] as List?) ??
              const [])
          .nonNulls
          .map((e) => RouterInputMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
      routerInputMetadata: json['routerInputMetadata'] != null
          ? RouterInputMetadata.fromJson(
              json['routerInputMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceMetadataMessages = this.sourceMetadataMessages;
    final timestamp = this.timestamp;
    final routerInputMetadata = this.routerInputMetadata;
    return {
      'sourceMetadataMessages': sourceMetadataMessages,
      'timestamp': iso8601ToJson(timestamp),
      if (routerInputMetadata != null)
        'routerInputMetadata': routerInputMetadata,
    };
  }
}

/// Metadata information associated with the router input, including stream
/// details and connection state.
///
/// @nodoc
class RouterInputMetadata {
  final TransportMediaInfo? transportStreamMediaInfo;

  RouterInputMetadata({
    this.transportStreamMediaInfo,
  });

  factory RouterInputMetadata.fromJson(Map<String, dynamic> json) {
    return RouterInputMetadata(
      transportStreamMediaInfo: json['transportStreamMediaInfo'] != null
          ? TransportMediaInfo.fromJson(
              json['transportStreamMediaInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transportStreamMediaInfo = this.transportStreamMediaInfo;
    return {
      if (transportStreamMediaInfo != null)
        'transportStreamMediaInfo': transportStreamMediaInfo,
    };
  }
}

/// The metadata of the transport stream in the current flow's source.
///
/// @nodoc
class TransportMediaInfo {
  /// The list of transport stream programs in the current flow's source.
  final List<TransportStreamProgram> programs;

  TransportMediaInfo({
    required this.programs,
  });

  factory TransportMediaInfo.fromJson(Map<String, dynamic> json) {
    return TransportMediaInfo(
      programs: ((json['programs'] as List?) ?? const [])
          .nonNulls
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

/// The metadata of a single transport stream program.
///
/// @nodoc
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
      pcrPid: (json['pcrPid'] as int?) ?? 0,
      programNumber: (json['programNumber'] as int?) ?? 0,
      programPid: (json['programPid'] as int?) ?? 0,
      streams: ((json['streams'] as List?) ?? const [])
          .nonNulls
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

/// The metadata of an elementary transport stream.
///
/// @nodoc
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

  /// The frame resolution used by the video stream.
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
      pid: (json['pid'] as int?) ?? 0,
      streamType: (json['streamType'] as String?) ?? '',
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

/// The frame resolution used by the video stream.
///
/// @nodoc
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
      frameHeight: (json['frameHeight'] as int?) ?? 0,
      frameWidth: (json['frameWidth'] as int?) ?? 0,
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

/// A summary of a router input, including its name, type, ARN, ID, state, and
/// other key details. This structure is used in the response of the
/// ListRouterInputs operation.
///
/// @nodoc
class ListedRouterInput {
  /// The Amazon Resource Name (ARN) of the router input.
  final String arn;

  /// The Availability Zone of the router input.
  final String availabilityZone;

  /// The timestamp when the router input was created.
  final DateTime createdAt;

  /// The unique identifier of the router input.
  final String id;

  /// The type of the router input.
  final RouterInputType inputType;

  /// The maximum bitrate of the router input.
  final int maximumBitrate;

  /// The number of messages associated with the router input.
  final int messageCount;

  /// The name of the router input.
  final String name;

  /// The Amazon Web Services Region where the router input is located.
  final String regionName;

  /// The number of router outputs that are associated with this router input.
  final int routedOutputs;

  /// Indicates whether the router input is configured for Regional or global
  /// routing.
  final RoutingScope routingScope;

  /// The overall state of the router input.
  final RouterInputState state;

  /// The timestamp when the router input was last updated.
  final DateTime updatedAt;

  /// The details of the maintenance schedule for the listed router input.
  final MaintenanceSchedule? maintenanceSchedule;

  /// The type of maintenance schedule currently associated with the listed router
  /// input.
  final MaintenanceScheduleType? maintenanceScheduleType;

  /// The ARN of the network interface associated with the router input.
  final String? networkInterfaceArn;

  ListedRouterInput({
    required this.arn,
    required this.availabilityZone,
    required this.createdAt,
    required this.id,
    required this.inputType,
    required this.maximumBitrate,
    required this.messageCount,
    required this.name,
    required this.regionName,
    required this.routedOutputs,
    required this.routingScope,
    required this.state,
    required this.updatedAt,
    this.maintenanceSchedule,
    this.maintenanceScheduleType,
    this.networkInterfaceArn,
  });

  factory ListedRouterInput.fromJson(Map<String, dynamic> json) {
    return ListedRouterInput(
      arn: (json['arn'] as String?) ?? '',
      availabilityZone: (json['availabilityZone'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      inputType:
          RouterInputType.fromString((json['inputType'] as String?) ?? ''),
      maximumBitrate: (json['maximumBitrate'] as int?) ?? 0,
      messageCount: (json['messageCount'] as int?) ?? 0,
      name: (json['name'] as String?) ?? '',
      regionName: (json['regionName'] as String?) ?? '',
      routedOutputs: (json['routedOutputs'] as int?) ?? 0,
      routingScope:
          RoutingScope.fromString((json['routingScope'] as String?) ?? ''),
      state: RouterInputState.fromString((json['state'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      maintenanceSchedule: json['maintenanceSchedule'] != null
          ? MaintenanceSchedule.fromJson(
              json['maintenanceSchedule'] as Map<String, dynamic>)
          : null,
      maintenanceScheduleType: (json['maintenanceScheduleType'] as String?)
          ?.let(MaintenanceScheduleType.fromString),
      networkInterfaceArn: json['networkInterfaceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZone = this.availabilityZone;
    final createdAt = this.createdAt;
    final id = this.id;
    final inputType = this.inputType;
    final maximumBitrate = this.maximumBitrate;
    final messageCount = this.messageCount;
    final name = this.name;
    final regionName = this.regionName;
    final routedOutputs = this.routedOutputs;
    final routingScope = this.routingScope;
    final state = this.state;
    final updatedAt = this.updatedAt;
    final maintenanceSchedule = this.maintenanceSchedule;
    final maintenanceScheduleType = this.maintenanceScheduleType;
    final networkInterfaceArn = this.networkInterfaceArn;
    return {
      'arn': arn,
      'availabilityZone': availabilityZone,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'inputType': inputType.value,
      'maximumBitrate': maximumBitrate,
      'messageCount': messageCount,
      'name': name,
      'regionName': regionName,
      'routedOutputs': routedOutputs,
      'routingScope': routingScope.value,
      'state': state.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (maintenanceSchedule != null)
        'maintenanceSchedule': maintenanceSchedule,
      if (maintenanceScheduleType != null)
        'maintenanceScheduleType': maintenanceScheduleType.value,
      if (networkInterfaceArn != null)
        'networkInterfaceArn': networkInterfaceArn,
    };
  }
}

/// A filter that can be used to retrieve a list of router inputs.
///
/// @nodoc
class RouterInputFilter {
  /// The types of router inputs to include in the filter.
  final List<RouterInputType>? inputTypes;

  /// The names of the router inputs to include in the filter.
  final List<String>? nameContains;

  /// The Amazon Resource Names (ARNs) of the network interfaces associated with
  /// the router inputs to include in the filter.
  final List<String>? networkInterfaceArns;

  /// The AWS Regions of the router inputs to include in the filter.
  final List<String>? regionNames;

  /// Filter criteria to list router inputs based on their routing scope (REGIONAL
  /// or GLOBAL).
  final List<RoutingScope>? routingScopes;

  RouterInputFilter({
    this.inputTypes,
    this.nameContains,
    this.networkInterfaceArns,
    this.regionNames,
    this.routingScopes,
  });

  Map<String, dynamic> toJson() {
    final inputTypes = this.inputTypes;
    final nameContains = this.nameContains;
    final networkInterfaceArns = this.networkInterfaceArns;
    final regionNames = this.regionNames;
    final routingScopes = this.routingScopes;
    return {
      if (inputTypes != null)
        'inputTypes': inputTypes.map((e) => e.value).toList(),
      if (nameContains != null) 'nameContains': nameContains,
      if (networkInterfaceArns != null)
        'networkInterfaceArns': networkInterfaceArns,
      if (regionNames != null) 'regionNames': regionNames,
      if (routingScopes != null)
        'routingScopes': routingScopes.map((e) => e.value).toList(),
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
///
/// @nodoc
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
      currencyCode: (json['currencyCode'] as String?) ?? '',
      duration: (json['duration'] as int?) ?? 0,
      durationUnits:
          DurationUnits.fromString((json['durationUnits'] as String?) ?? ''),
      end: (json['end'] as String?) ?? '',
      offeringArn: (json['offeringArn'] as String?) ?? '',
      offeringDescription: (json['offeringDescription'] as String?) ?? '',
      pricePerUnit: (json['pricePerUnit'] as String?) ?? '',
      priceUnits: PriceUnits.fromString((json['priceUnits'] as String?) ?? ''),
      reservationArn: (json['reservationArn'] as String?) ?? '',
      reservationName: (json['reservationName'] as String?) ?? '',
      reservationState: ReservationState.fromString(
          (json['reservationState'] as String?) ?? ''),
      resourceSpecification: ResourceSpecification.fromJson(
          (json['resourceSpecification'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      start: (json['start'] as String?) ?? '',
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
      'durationUnits': durationUnits.value,
      'end': end,
      'offeringArn': offeringArn,
      'offeringDescription': offeringDescription,
      'pricePerUnit': pricePerUnit,
      'priceUnits': priceUnits.value,
      'reservationArn': reservationArn,
      'reservationName': reservationName,
      'reservationState': reservationState.value,
      'resourceSpecification': resourceSpecification,
      'start': start,
    };
  }
}

/// @nodoc
class DurationUnits {
  static const months = DurationUnits._('MONTHS');

  final String value;

  const DurationUnits._(this.value);

  static const values = [months];

  static DurationUnits fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DurationUnits._(value));

  @override
  bool operator ==(other) => other is DurationUnits && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PriceUnits {
  static const hourly = PriceUnits._('HOURLY');

  final String value;

  const PriceUnits._(this.value);

  static const values = [hourly];

  static PriceUnits fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PriceUnits._(value));

  @override
  bool operator ==(other) => other is PriceUnits && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ReservationState {
  static const active = ReservationState._('ACTIVE');
  static const expired = ReservationState._('EXPIRED');
  static const processing = ReservationState._('PROCESSING');
  static const canceled = ReservationState._('CANCELED');

  final String value;

  const ReservationState._(this.value);

  static const values = [active, expired, processing, canceled];

  static ReservationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReservationState._(value));

  @override
  bool operator ==(other) => other is ReservationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A definition of what is being billed for, including the type and amount.
///
/// @nodoc
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
      resourceType:
          ResourceType.fromString((json['resourceType'] as String?) ?? ''),
      reservedBitrate: json['reservedBitrate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final reservedBitrate = this.reservedBitrate;
    return {
      'resourceType': resourceType.value,
      if (reservedBitrate != null) 'reservedBitrate': reservedBitrate,
    };
  }
}

/// @nodoc
class ResourceType {
  static const mbpsOutboundBandwidth =
      ResourceType._('Mbps_Outbound_Bandwidth');

  final String value;

  const ResourceType._(this.value);

  static const values = [mbpsOutboundBandwidth];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A savings plan that reserves a certain amount of outbound bandwidth usage at
/// a discounted rate each month over a period of time.
///
/// @nodoc
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
      currencyCode: (json['currencyCode'] as String?) ?? '',
      duration: (json['duration'] as int?) ?? 0,
      durationUnits:
          DurationUnits.fromString((json['durationUnits'] as String?) ?? ''),
      offeringArn: (json['offeringArn'] as String?) ?? '',
      offeringDescription: (json['offeringDescription'] as String?) ?? '',
      pricePerUnit: (json['pricePerUnit'] as String?) ?? '',
      priceUnits: PriceUnits.fromString((json['priceUnits'] as String?) ?? ''),
      resourceSpecification: ResourceSpecification.fromJson(
          (json['resourceSpecification'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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
      'durationUnits': durationUnits.value,
      'offeringArn': offeringArn,
      'offeringDescription': offeringDescription,
      'pricePerUnit': pricePerUnit,
      'priceUnits': priceUnits.value,
      'resourceSpecification': resourceSpecification,
    };
  }
}

/// A summary of a gateway, including its name, ARN, and status.
///
/// @nodoc
class ListedGateway {
  /// The Amazon Resource Name (ARN) of the gateway.
  final String gatewayArn;

  /// The status of the gateway.
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
      gatewayArn: (json['gatewayArn'] as String?) ?? '',
      gatewayState:
          GatewayState.fromString((json['gatewayState'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final gatewayArn = this.gatewayArn;
    final gatewayState = this.gatewayState;
    final name = this.name;
    return {
      'gatewayArn': gatewayArn,
      'gatewayState': gatewayState.value,
      'name': name,
    };
  }
}

/// @nodoc
class GatewayState {
  static const creating = GatewayState._('CREATING');
  static const active = GatewayState._('ACTIVE');
  static const updating = GatewayState._('UPDATING');
  static const error = GatewayState._('ERROR');
  static const deleting = GatewayState._('DELETING');
  static const deleted = GatewayState._('DELETED');

  final String value;

  const GatewayState._(this.value);

  static const values = [creating, active, updating, error, deleting, deleted];

  static GatewayState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => GatewayState._(value));

  @override
  bool operator ==(other) => other is GatewayState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The settings for a gateway, including its networks.
///
/// @nodoc
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

  /// Messages with information about the gateway.
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
      egressCidrBlocks: ((json['egressCidrBlocks'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      gatewayArn: (json['gatewayArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      networks: ((json['networks'] as List?) ?? const [])
          .nonNulls
          .map((e) => GatewayNetwork.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatewayMessages: (json['gatewayMessages'] as List?)
          ?.nonNulls
          .map((e) => MessageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      gatewayState:
          (json['gatewayState'] as String?)?.let(GatewayState.fromString),
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
      if (gatewayState != null) 'gatewayState': gatewayState.value,
    };
  }
}

/// The network settings for a gateway.
///
/// @nodoc
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
      cidrBlock: (json['cidrBlock'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
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

/// The details of an error message.
///
/// @nodoc
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
      code: (json['code'] as String?) ?? '',
      message: (json['message'] as String?) ?? '',
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

/// A summary of an instance.
///
/// @nodoc
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
      gatewayArn: (json['gatewayArn'] as String?) ?? '',
      gatewayInstanceArn: (json['gatewayInstanceArn'] as String?) ?? '',
      instanceId: (json['instanceId'] as String?) ?? '',
      instanceState:
          (json['instanceState'] as String?)?.let(InstanceState.fromString),
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
      if (instanceState != null) 'instanceState': instanceState.value,
    };
  }
}

/// @nodoc
class InstanceState {
  static const registering = InstanceState._('REGISTERING');
  static const active = InstanceState._('ACTIVE');
  static const deregistering = InstanceState._('DEREGISTERING');
  static const deregistered = InstanceState._('DEREGISTERED');
  static const registrationError = InstanceState._('REGISTRATION_ERROR');
  static const deregistrationError = InstanceState._('DEREGISTRATION_ERROR');

  final String value;

  const InstanceState._(this.value);

  static const values = [
    registering,
    active,
    deregistering,
    deregistered,
    registrationError,
    deregistrationError
  ];

  static InstanceState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InstanceState._(value));

  @override
  bool operator ==(other) => other is InstanceState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BridgePlacement {
  static const available = BridgePlacement._('AVAILABLE');
  static const locked = BridgePlacement._('LOCKED');

  final String value;

  const BridgePlacement._(this.value);

  static const values = [available, locked];

  static BridgePlacement fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BridgePlacement._(value));

  @override
  bool operator ==(other) => other is BridgePlacement && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The settings for an instance in a gateway.
///
/// @nodoc
class GatewayInstance {
  /// The availability of the instance to host new bridges. The bridgePlacement
  /// property can be LOCKED or AVAILABLE. If it is LOCKED, no new bridges can be
  /// deployed to this instance. If it is AVAILABLE, new bridges can be deployed
  /// to this instance.
  final BridgePlacement bridgePlacement;

  /// The connection state of the instance.
  final ConnectionStatus connectionStatus;

  /// The Amazon Resource Name (ARN) of the instance.
  final String gatewayArn;

  /// The ARN of the gateway.
  final String gatewayInstanceArn;

  /// The instance ID generated by the SSM install. This will begin with "mi-".
  final String instanceId;

  /// The status of the instance.
  final InstanceState instanceState;

  /// The running bridge count.
  final int runningBridgeCount;

  /// Messages with information about the gateway.
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
      bridgePlacement: BridgePlacement.fromString(
          (json['bridgePlacement'] as String?) ?? ''),
      connectionStatus: ConnectionStatus.fromString(
          (json['connectionStatus'] as String?) ?? ''),
      gatewayArn: (json['gatewayArn'] as String?) ?? '',
      gatewayInstanceArn: (json['gatewayInstanceArn'] as String?) ?? '',
      instanceId: (json['instanceId'] as String?) ?? '',
      instanceState:
          InstanceState.fromString((json['instanceState'] as String?) ?? ''),
      runningBridgeCount: (json['runningBridgeCount'] as int?) ?? 0,
      instanceMessages: (json['instanceMessages'] as List?)
          ?.nonNulls
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
      'bridgePlacement': bridgePlacement.value,
      'connectionStatus': connectionStatus.value,
      'gatewayArn': gatewayArn,
      'gatewayInstanceArn': gatewayInstanceArn,
      'instanceId': instanceId,
      'instanceState': instanceState.value,
      'runningBridgeCount': runningBridgeCount,
      if (instanceMessages != null) 'instanceMessages': instanceMessages,
    };
  }
}

/// @nodoc
class ConnectionStatus {
  static const connected = ConnectionStatus._('CONNECTED');
  static const disconnected = ConnectionStatus._('DISCONNECTED');

  final String value;

  const ConnectionStatus._(this.value);

  static const values = [connected, disconnected];

  static ConnectionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectionStatus._(value));

  @override
  bool operator ==(other) => other is ConnectionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The settings for the source of the flow.
///
/// @nodoc
class Source {
  /// The name of the source.
  final String name;

  /// The ARN of the source.
  final String sourceArn;

  /// The ARN of the router output that's currently connected to this source.
  final String? connectedRouterOutputArn;

  /// Percentage from 0-100 of the data transfer cost to be billed to the
  /// subscriber.
  final int? dataTransferSubscriberFeePercent;

  /// The type of encryption that is used on the content ingested from this
  /// source.
  final Encryption? decryption;

  /// A description for the source. This value is not used or seen outside of the
  /// current MediaConnect account.
  final String? description;

  /// The ARN of the entitlement that allows you to subscribe to content that
  /// comes from another Amazon Web Services account. The entitlement is set by
  /// the content originator and the ARN is generated as part of the originator's
  /// flow.
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

  /// The IP address of the device that is currently sending content to this
  /// source.
  /// <note>
  /// <ul>
  /// <li>
  /// For sources that use protocols where you specify the origin (such as SRT
  /// Caller), this value matches the configured origin address.
  /// </li>
  /// <li>
  /// For sources that use listener protocols (such as SRT Listener or RTP), this
  /// value shows the address of the connected sender.
  /// </li>
  /// <li>
  /// Peer IP addresses aren't available for entitlements and CDI/ST2110 sources.
  /// </li>
  /// <li>
  /// The peer IP address might not be visible for flows that haven't been started
  /// yet, or flows that were started before May 2025. In these cases, restart
  /// your flow to see the peer IP address.
  /// </li>
  /// </ul> </note>
  final String? peerIpAddress;

  /// Indicates if router integration is enabled or disabled on the flow source.
  final State? routerIntegrationState;

  /// The decryption configuration for the flow source when router integration is
  /// enabled.
  final FlowTransitEncryption? routerIntegrationTransitDecryption;

  /// The IP address that the flow communicates with to initiate connection with
  /// the sender.
  final int? senderControlPort;

  /// The port that the flow uses to send outbound requests to initiate connection
  /// with the sender.
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
    this.connectedRouterOutputArn,
    this.dataTransferSubscriberFeePercent,
    this.decryption,
    this.description,
    this.entitlementArn,
    this.gatewayBridgeSource,
    this.ingestIp,
    this.ingestPort,
    this.mediaStreamSourceConfigurations,
    this.peerIpAddress,
    this.routerIntegrationState,
    this.routerIntegrationTransitDecryption,
    this.senderControlPort,
    this.senderIpAddress,
    this.transport,
    this.vpcInterfaceName,
    this.whitelistCidr,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      name: (json['name'] as String?) ?? '',
      sourceArn: (json['sourceArn'] as String?) ?? '',
      connectedRouterOutputArn: json['connectedRouterOutputArn'] as String?,
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
              ?.nonNulls
              .map((e) => MediaStreamSourceConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      peerIpAddress: json['peerIpAddress'] as String?,
      routerIntegrationState:
          (json['routerIntegrationState'] as String?)?.let(State.fromString),
      routerIntegrationTransitDecryption:
          json['routerIntegrationTransitDecryption'] != null
              ? FlowTransitEncryption.fromJson(
                  json['routerIntegrationTransitDecryption']
                      as Map<String, dynamic>)
              : null,
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
    final connectedRouterOutputArn = this.connectedRouterOutputArn;
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
    final peerIpAddress = this.peerIpAddress;
    final routerIntegrationState = this.routerIntegrationState;
    final routerIntegrationTransitDecryption =
        this.routerIntegrationTransitDecryption;
    final senderControlPort = this.senderControlPort;
    final senderIpAddress = this.senderIpAddress;
    final transport = this.transport;
    final vpcInterfaceName = this.vpcInterfaceName;
    final whitelistCidr = this.whitelistCidr;
    return {
      'name': name,
      'sourceArn': sourceArn,
      if (connectedRouterOutputArn != null)
        'connectedRouterOutputArn': connectedRouterOutputArn,
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
      if (peerIpAddress != null) 'peerIpAddress': peerIpAddress,
      if (routerIntegrationState != null)
        'routerIntegrationState': routerIntegrationState.value,
      if (routerIntegrationTransitDecryption != null)
        'routerIntegrationTransitDecryption':
            routerIntegrationTransitDecryption,
      if (senderControlPort != null) 'senderControlPort': senderControlPort,
      if (senderIpAddress != null) 'senderIpAddress': senderIpAddress,
      if (transport != null) 'transport': transport,
      if (vpcInterfaceName != null) 'vpcInterfaceName': vpcInterfaceName,
      if (whitelistCidr != null) 'whitelistCidr': whitelistCidr,
    };
  }
}

/// Encryption information.
///
/// @nodoc
class Encryption {
  /// The ARN of the role that you created during setup (when you set up
  /// MediaConnect as a trusted entity).
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

  /// The Amazon Web Services Region that the API Gateway proxy endpoint was
  /// created in. This parameter is required for SPEKE encryption and is not valid
  /// for static key encryption.
  final String? region;

  /// An identifier for the content. The service sends this value to the key
  /// server to identify the current endpoint. The resource ID is also known as
  /// the content ID. This parameter is required for SPEKE encryption and is not
  /// valid for static key encryption.
  final String? resourceId;

  /// The ARN of the secret that you created in Secrets Manager to store the
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
      roleArn: (json['roleArn'] as String?) ?? '',
      algorithm: (json['algorithm'] as String?)?.let(Algorithm.fromString),
      constantInitializationVector:
          json['constantInitializationVector'] as String?,
      deviceId: json['deviceId'] as String?,
      keyType: (json['keyType'] as String?)?.let(KeyType.fromString),
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
      if (algorithm != null) 'algorithm': algorithm.value,
      if (constantInitializationVector != null)
        'constantInitializationVector': constantInitializationVector,
      if (deviceId != null) 'deviceId': deviceId,
      if (keyType != null) 'keyType': keyType.value,
      if (region != null) 'region': region,
      if (resourceId != null) 'resourceId': resourceId,
      if (secretArn != null) 'secretArn': secretArn,
      if (url != null) 'url': url,
    };
  }
}

/// Attributes related to the transport stream that are used in a source or
/// output.
///
/// @nodoc
class Transport {
  /// The protocol that is used by the source or output.
  /// <note>
  /// Elemental MediaConnect no longer supports the Fujitsu QoS protocol. This
  /// reference is maintained for legacy purposes only.
  /// </note>
  final Protocol protocol;

  /// The range of IP addresses that should be allowed to initiate output requests
  /// to this flow. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16
  final List<String>? cidrAllowList;

  /// The smoothing max bitrate (in bps) for RIST, RTP, and RTP-FEC streams.
  final int? maxBitrate;

  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based and Zixi-based streams.
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

  /// The timecode source for NDI output frames. For NDI outputs, this field is
  /// always present and defaults to <code>EMBEDDED_TIMECODE</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>EMBEDDED_TIMECODE</code> - Preserves timecodes from the input
  /// transport stream. The timecodes must be embedded in the video stream as SEI
  /// timing messages. If no embedded timecode is detected, MediaConnect uses the
  /// UTC system time instead.
  /// </li>
  /// <li>
  /// <code>UTC_SYSTEM_TIME</code> - Generates timecodes based on the system clock
  /// time when each frame is sent.
  /// </li>
  /// </ul>
  final NdiOutputTimecodeSource? ndiOutputTimecodeSource;

  /// A suffix for the name of the NDI® sender that the flow creates. If a custom
  /// name isn't specified, MediaConnect uses the output name.
  final String? ndiProgramName;

  /// The settings for the NDI source. This includes the exact name of the
  /// upstream NDI sender that you want to connect to your source.
  final NdiSourceSettings? ndiSourceSettings;

  /// A quality setting for the NDI Speed HQ encoder.
  final int? ndiSpeedHqQuality;

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
    this.ndiOutputTimecodeSource,
    this.ndiProgramName,
    this.ndiSourceSettings,
    this.ndiSpeedHqQuality,
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
      protocol: Protocol.fromString((json['protocol'] as String?) ?? ''),
      cidrAllowList: (json['cidrAllowList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      maxBitrate: json['maxBitrate'] as int?,
      maxLatency: json['maxLatency'] as int?,
      maxSyncBuffer: json['maxSyncBuffer'] as int?,
      minLatency: json['minLatency'] as int?,
      ndiOutputTimecodeSource: (json['ndiOutputTimecodeSource'] as String?)
          ?.let(NdiOutputTimecodeSource.fromString),
      ndiProgramName: json['ndiProgramName'] as String?,
      ndiSourceSettings: json['ndiSourceSettings'] != null
          ? NdiSourceSettings.fromJson(
              json['ndiSourceSettings'] as Map<String, dynamic>)
          : null,
      ndiSpeedHqQuality: json['ndiSpeedHqQuality'] as int?,
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
    final ndiOutputTimecodeSource = this.ndiOutputTimecodeSource;
    final ndiProgramName = this.ndiProgramName;
    final ndiSourceSettings = this.ndiSourceSettings;
    final ndiSpeedHqQuality = this.ndiSpeedHqQuality;
    final remoteId = this.remoteId;
    final senderControlPort = this.senderControlPort;
    final senderIpAddress = this.senderIpAddress;
    final smoothingLatency = this.smoothingLatency;
    final sourceListenerAddress = this.sourceListenerAddress;
    final sourceListenerPort = this.sourceListenerPort;
    final streamId = this.streamId;
    return {
      'protocol': protocol.value,
      if (cidrAllowList != null) 'cidrAllowList': cidrAllowList,
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (maxLatency != null) 'maxLatency': maxLatency,
      if (maxSyncBuffer != null) 'maxSyncBuffer': maxSyncBuffer,
      if (minLatency != null) 'minLatency': minLatency,
      if (ndiOutputTimecodeSource != null)
        'ndiOutputTimecodeSource': ndiOutputTimecodeSource.value,
      if (ndiProgramName != null) 'ndiProgramName': ndiProgramName,
      if (ndiSourceSettings != null) 'ndiSourceSettings': ndiSourceSettings,
      if (ndiSpeedHqQuality != null) 'ndiSpeedHqQuality': ndiSpeedHqQuality,
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

/// The source configuration for cloud flows receiving a stream from a bridge.
///
/// @nodoc
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
      bridgeArn: (json['bridgeArn'] as String?) ?? '',
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

/// @nodoc
class State {
  static const enabled = State._('ENABLED');
  static const disabled = State._('DISABLED');

  final String value;

  const State._(this.value);

  static const values = [enabled, disabled];

  static State fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => State._(value));

  @override
  bool operator ==(other) => other is State && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The settings for attaching a VPC interface to an resource.
///
/// @nodoc
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

/// @nodoc
class Protocol {
  static const zixiPush = Protocol._('zixi-push');
  static const rtpFec = Protocol._('rtp-fec');
  static const rtp = Protocol._('rtp');
  static const zixiPull = Protocol._('zixi-pull');
  static const rist = Protocol._('rist');
  static const st2110Jpegxs = Protocol._('st2110-jpegxs');
  static const cdi = Protocol._('cdi');
  static const srtListener = Protocol._('srt-listener');
  static const srtCaller = Protocol._('srt-caller');
  static const fujitsuQos = Protocol._('fujitsu-qos');
  static const udp = Protocol._('udp');
  static const ndiSpeedHq = Protocol._('ndi-speed-hq');

  final String value;

  const Protocol._(this.value);

  static const values = [
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
    ndiSpeedHq
  ];

  static Protocol fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Protocol._(value));

  @override
  bool operator ==(other) => other is Protocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The settings for the NDI® source. This includes the exact name of the
/// upstream NDI sender that you want to connect to your source.
///
/// @nodoc
class NdiSourceSettings {
  /// The exact name of an existing NDI sender that's registered with your
  /// discovery server. If included, the format of this name must be
  /// <code>MACHINENAME (ProgramName)</code>.
  final String? sourceName;

  NdiSourceSettings({
    this.sourceName,
  });

  factory NdiSourceSettings.fromJson(Map<String, dynamic> json) {
    return NdiSourceSettings(
      sourceName: json['sourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceName = this.sourceName;
    return {
      if (sourceName != null) 'sourceName': sourceName,
    };
  }
}

/// @nodoc
class NdiOutputTimecodeSource {
  static const embeddedTimecode =
      NdiOutputTimecodeSource._('EMBEDDED_TIMECODE');
  static const utcSystemTime = NdiOutputTimecodeSource._('UTC_SYSTEM_TIME');

  final String value;

  const NdiOutputTimecodeSource._(this.value);

  static const values = [embeddedTimecode, utcSystemTime];

  static NdiOutputTimecodeSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NdiOutputTimecodeSource._(value));

  @override
  bool operator ==(other) =>
      other is NdiOutputTimecodeSource && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The media stream that is associated with the source, and the parameters for
/// that association.
///
/// @nodoc
class MediaStreamSourceConfiguration {
  /// The format that was used to encode the data. For ancillary data streams, set
  /// the encoding name to smpte291. For audio streams, set the encoding name to
  /// pcm. For video, 2110 streams, set the encoding name to raw. For video, JPEG
  /// XS streams, set the encoding name to jxsv.
  final EncodingName encodingName;

  /// A name that helps you distinguish one media stream from another.
  final String mediaStreamName;

  /// The media streams that you want to associate with the source.
  final List<InputConfiguration>? inputConfigurations;

  MediaStreamSourceConfiguration({
    required this.encodingName,
    required this.mediaStreamName,
    this.inputConfigurations,
  });

  factory MediaStreamSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return MediaStreamSourceConfiguration(
      encodingName:
          EncodingName.fromString((json['encodingName'] as String?) ?? ''),
      mediaStreamName: (json['mediaStreamName'] as String?) ?? '',
      inputConfigurations: (json['inputConfigurations'] as List?)
          ?.nonNulls
          .map((e) => InputConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final encodingName = this.encodingName;
    final mediaStreamName = this.mediaStreamName;
    final inputConfigurations = this.inputConfigurations;
    return {
      'encodingName': encodingName.value,
      'mediaStreamName': mediaStreamName,
      if (inputConfigurations != null)
        'inputConfigurations': inputConfigurations,
    };
  }
}

/// @nodoc
class EncodingName {
  static const jxsv = EncodingName._('jxsv');
  static const raw = EncodingName._('raw');
  static const smpte291 = EncodingName._('smpte291');
  static const pcm = EncodingName._('pcm');

  final String value;

  const EncodingName._(this.value);

  static const values = [jxsv, raw, smpte291, pcm];

  static EncodingName fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EncodingName._(value));

  @override
  bool operator ==(other) => other is EncodingName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The transport parameters that are associated with an incoming media stream.
///
/// @nodoc
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
      inputIp: (json['inputIp'] as String?) ?? '',
      inputPort: (json['inputPort'] as int?) ?? 0,
      interface: Interface.fromJson(
          (json['interface'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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

/// The VPC interface that is used for the media stream associated with the
/// source or output.
///
/// @nodoc
class Interface {
  /// The name of the VPC interface.
  final String name;

  Interface({
    required this.name,
  });

  factory Interface.fromJson(Map<String, dynamic> json) {
    return Interface(
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// @nodoc
class Algorithm {
  static const aes128 = Algorithm._('aes128');
  static const aes192 = Algorithm._('aes192');
  static const aes256 = Algorithm._('aes256');

  final String value;

  const Algorithm._(this.value);

  static const values = [aes128, aes192, aes256];

  static Algorithm fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Algorithm._(value));

  @override
  bool operator ==(other) => other is Algorithm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class KeyType {
  static const speke = KeyType._('speke');
  static const staticKey = KeyType._('static-key');
  static const srtPassword = KeyType._('srt-password');

  final String value;

  const KeyType._(this.value);

  static const values = [speke, staticKey, srtPassword];

  static KeyType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => KeyType._(value));

  @override
  bool operator ==(other) => other is KeyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the encryption of the flow.
///
/// @nodoc
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

  /// The Amazon Web Services Region that the API Gateway proxy endpoint was
  /// created in. This parameter is required for SPEKE encryption and is not valid
  /// for static key encryption.
  final String? region;

  /// An identifier for the content. The service sends this value to the key
  /// server to identify the current endpoint. The resource ID is also known as
  /// the content ID. This parameter is required for SPEKE encryption and is not
  /// valid for static key encryption.
  final String? resourceId;

  /// The ARN of the role that you created during setup (when you set up
  /// MediaConnect as a trusted entity).
  final String? roleArn;

  /// The ARN of the secret that you created in Secrets Manager to store the
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
      if (algorithm != null) 'algorithm': algorithm.value,
      if (constantInitializationVector != null)
        'constantInitializationVector': constantInitializationVector,
      if (deviceId != null) 'deviceId': deviceId,
      if (keyType != null) 'keyType': keyType.value,
      if (region != null) 'region': region,
      if (resourceId != null) 'resourceId': resourceId,
      if (roleArn != null) 'roleArn': roleArn,
      if (secretArn != null) 'secretArn': secretArn,
      if (url != null) 'url': url,
    };
  }
}

/// The source configuration for cloud flows receiving a stream from a bridge.
///
/// @nodoc
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

/// The media stream that you want to associate with the source, and the
/// parameters for that association.
///
/// @nodoc
class MediaStreamSourceConfigurationRequest {
  /// The format that was used to encode the data. For ancillary data streams, set
  /// the encoding name to smpte291. For audio streams, set the encoding name to
  /// pcm. For video, 2110 streams, set the encoding name to raw. For video, JPEG
  /// XS streams, set the encoding name to jxsv.
  final EncodingName encodingName;

  /// The name of the media stream.
  final String mediaStreamName;

  /// The media streams that you want to associate with the source.
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
      'encodingName': encodingName.value,
      'mediaStreamName': mediaStreamName,
      if (inputConfigurations != null)
        'inputConfigurations': inputConfigurations,
    };
  }
}

/// The transport parameters that you want to associate with an incoming media
/// stream.
///
/// @nodoc
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

/// The VPC interface that you want to designate where the media stream is
/// coming from or going to.
///
/// @nodoc
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

/// The settings for an output.
///
/// @nodoc
class Output {
  /// The name of the output. This value must be unique within the current flow.
  final String name;

  /// The ARN of the output.
  final String outputArn;

  /// The ARN of the bridge added to this output.
  final String? bridgeArn;

  /// The bridge output ports currently in use.
  final List<int>? bridgePorts;

  /// The ARN of the router input that's connected to this flow output.
  final String? connectedRouterInputArn;

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

  /// The input ARN of the MediaLive channel. This parameter is relevant only for
  /// outputs that were added by creating a MediaLive input.
  final String? mediaLiveInputArn;

  /// The configuration for each media stream that is associated with the output.
  final List<MediaStreamOutputConfiguration>? mediaStreamOutputConfigurations;

  /// An indication of whether the output is transmitting data or not.
  final OutputStatus? outputStatus;

  /// The IP address of the device that is currently receiving content from this
  /// output.
  /// <note>
  /// <ul>
  /// <li>
  /// For outputs that use protocols where you specify the destination (such as
  /// SRT Caller or Zixi Push), this value matches the configured destination
  /// address.
  /// </li>
  /// <li>
  /// For outputs that use listener protocols (such as SRT Listener), this value
  /// shows the address of the connected receiver.
  /// </li>
  /// <li>
  /// Peer IP addresses aren't available for entitlements, managed MediaLive
  /// outputs, NDI® sources and outputs, and CDI/ST2110 outputs.
  /// </li>
  /// <li>
  /// The peer IP address might not be visible for flows that haven't been started
  /// yet, or flows that were started before May 2025. In these cases, restart
  /// your flow to see the peer IP address.
  /// </li>
  /// </ul> </note>
  final String? peerIpAddress;

  /// The port to use when content is distributed to this output.
  final int? port;

  /// Indicates if router integration is enabled or disabled on the flow output.
  final State? routerIntegrationState;

  /// The encryption configuration for the output when router integration is
  /// enabled.
  final FlowTransitEncryption? routerIntegrationTransitEncryption;

  /// Attributes related to the transport stream that are used in the output.
  final Transport? transport;

  /// The name of the VPC interface attachment to use for this output.
  final VpcInterfaceAttachment? vpcInterfaceAttachment;

  Output({
    required this.name,
    required this.outputArn,
    this.bridgeArn,
    this.bridgePorts,
    this.connectedRouterInputArn,
    this.dataTransferSubscriberFeePercent,
    this.description,
    this.destination,
    this.encryption,
    this.entitlementArn,
    this.listenerAddress,
    this.mediaLiveInputArn,
    this.mediaStreamOutputConfigurations,
    this.outputStatus,
    this.peerIpAddress,
    this.port,
    this.routerIntegrationState,
    this.routerIntegrationTransitEncryption,
    this.transport,
    this.vpcInterfaceAttachment,
  });

  factory Output.fromJson(Map<String, dynamic> json) {
    return Output(
      name: (json['name'] as String?) ?? '',
      outputArn: (json['outputArn'] as String?) ?? '',
      bridgeArn: json['bridgeArn'] as String?,
      bridgePorts: (json['bridgePorts'] as List?)
          ?.nonNulls
          .map((e) => e as int)
          .toList(),
      connectedRouterInputArn: json['connectedRouterInputArn'] as String?,
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
              ?.nonNulls
              .map((e) => MediaStreamOutputConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      outputStatus:
          (json['outputStatus'] as String?)?.let(OutputStatus.fromString),
      peerIpAddress: json['peerIpAddress'] as String?,
      port: json['port'] as int?,
      routerIntegrationState:
          (json['routerIntegrationState'] as String?)?.let(State.fromString),
      routerIntegrationTransitEncryption:
          json['routerIntegrationTransitEncryption'] != null
              ? FlowTransitEncryption.fromJson(
                  json['routerIntegrationTransitEncryption']
                      as Map<String, dynamic>)
              : null,
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
    final connectedRouterInputArn = this.connectedRouterInputArn;
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
    final outputStatus = this.outputStatus;
    final peerIpAddress = this.peerIpAddress;
    final port = this.port;
    final routerIntegrationState = this.routerIntegrationState;
    final routerIntegrationTransitEncryption =
        this.routerIntegrationTransitEncryption;
    final transport = this.transport;
    final vpcInterfaceAttachment = this.vpcInterfaceAttachment;
    return {
      'name': name,
      'outputArn': outputArn,
      if (bridgeArn != null) 'bridgeArn': bridgeArn,
      if (bridgePorts != null) 'bridgePorts': bridgePorts,
      if (connectedRouterInputArn != null)
        'connectedRouterInputArn': connectedRouterInputArn,
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
      if (outputStatus != null) 'outputStatus': outputStatus.value,
      if (peerIpAddress != null) 'peerIpAddress': peerIpAddress,
      if (port != null) 'port': port,
      if (routerIntegrationState != null)
        'routerIntegrationState': routerIntegrationState.value,
      if (routerIntegrationTransitEncryption != null)
        'routerIntegrationTransitEncryption':
            routerIntegrationTransitEncryption,
      if (transport != null) 'transport': transport,
      if (vpcInterfaceAttachment != null)
        'vpcInterfaceAttachment': vpcInterfaceAttachment,
    };
  }
}

/// @nodoc
class OutputStatus {
  static const enabled = OutputStatus._('ENABLED');
  static const disabled = OutputStatus._('DISABLED');

  final String value;

  const OutputStatus._(this.value);

  static const values = [enabled, disabled];

  static OutputStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OutputStatus._(value));

  @override
  bool operator ==(other) => other is OutputStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The media stream that is associated with the output, and the parameters for
/// that association.
///
/// @nodoc
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

  /// A collection of parameters that determine how MediaConnect will convert the
  /// content. These fields only apply to outputs on flows that have a CDI source.
  final EncodingParameters? encodingParameters;

  MediaStreamOutputConfiguration({
    required this.encodingName,
    required this.mediaStreamName,
    this.destinationConfigurations,
    this.encodingParameters,
  });

  factory MediaStreamOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return MediaStreamOutputConfiguration(
      encodingName:
          EncodingName.fromString((json['encodingName'] as String?) ?? ''),
      mediaStreamName: (json['mediaStreamName'] as String?) ?? '',
      destinationConfigurations: (json['destinationConfigurations'] as List?)
          ?.nonNulls
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
      'encodingName': encodingName.value,
      'mediaStreamName': mediaStreamName,
      if (destinationConfigurations != null)
        'destinationConfigurations': destinationConfigurations,
      if (encodingParameters != null) 'encodingParameters': encodingParameters,
    };
  }
}

/// A collection of parameters that determine how MediaConnect will convert the
/// content. These fields only apply to outputs on flows that have a CDI source.
///
/// @nodoc
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
      compressionFactor: (json['compressionFactor'] as double?) ?? 0,
      encoderProfile:
          EncoderProfile.fromString((json['encoderProfile'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final compressionFactor = this.compressionFactor;
    final encoderProfile = this.encoderProfile;
    return {
      'compressionFactor': compressionFactor,
      'encoderProfile': encoderProfile.value,
    };
  }
}

/// @nodoc
class EncoderProfile {
  static const main = EncoderProfile._('main');
  static const high = EncoderProfile._('high');

  final String value;

  const EncoderProfile._(this.value);

  static const values = [main, high];

  static EncoderProfile fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncoderProfile._(value));

  @override
  bool operator ==(other) => other is EncoderProfile && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The transport parameters that you want to associate with an outbound media
/// stream.
///
/// @nodoc
class DestinationConfiguration {
  /// The IP address where you want MediaConnect to send contents of the media
  /// stream.
  final String destinationIp;

  /// The port that you want MediaConnect to use when it distributes the media
  /// stream to the output.
  final int destinationPort;

  /// The VPC interface that you want to use for the media stream associated with
  /// the output.
  final Interface interface;

  /// The IP address that the receiver requires in order to establish a connection
  /// with the flow. This value is represented by the elastic network interface IP
  /// address of the VPC. This field applies only to outputs that use the CDI or
  /// ST 2110 JPEG XS or protocol.
  final String outboundIp;

  DestinationConfiguration({
    required this.destinationIp,
    required this.destinationPort,
    required this.interface,
    required this.outboundIp,
  });

  factory DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return DestinationConfiguration(
      destinationIp: (json['destinationIp'] as String?) ?? '',
      destinationPort: (json['destinationPort'] as int?) ?? 0,
      interface: Interface.fromJson(
          (json['interface'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      outboundIp: (json['outboundIp'] as String?) ?? '',
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

/// The media stream that you want to associate with the output, and the
/// parameters for that association.
///
/// @nodoc
class MediaStreamOutputConfigurationRequest {
  /// The format that will be used to encode the data. For ancillary data streams,
  /// set the encoding name to smpte291. For audio streams, set the encoding name
  /// to pcm. For video, 2110 streams, set the encoding name to raw. For video,
  /// JPEG XS streams, set the encoding name to jxsv.
  final EncodingName encodingName;

  /// The name of the media stream that is associated with the output.
  final String mediaStreamName;

  /// The media streams that you want to associate with the output.
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
      'encodingName': encodingName.value,
      'mediaStreamName': mediaStreamName,
      if (destinationConfigurations != null)
        'destinationConfigurations': destinationConfigurations,
      if (encodingParameters != null) 'encodingParameters': encodingParameters,
    };
  }
}

/// A collection of parameters that determine how MediaConnect will convert the
/// content. These fields only apply to outputs on flows that have a CDI source.
///
/// @nodoc
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
      'encoderProfile': encoderProfile.value,
    };
  }
}

/// The definition of a media stream that you want to associate with the output.
///
/// @nodoc
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

/// A media stream represents one component of your content, such as video,
/// audio, or ancillary data. After you add a media stream to your flow, you can
/// associate it with sources and outputs that use the ST 2110 JPEG XS or CDI
/// protocol.
///
/// @nodoc
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
      fmt: (json['fmt'] as int?) ?? 0,
      mediaStreamId: (json['mediaStreamId'] as int?) ?? 0,
      mediaStreamName: (json['mediaStreamName'] as String?) ?? '',
      mediaStreamType: MediaStreamType.fromString(
          (json['mediaStreamType'] as String?) ?? ''),
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
      'mediaStreamType': mediaStreamType.value,
      if (attributes != null) 'attributes': attributes,
      if (clockRate != null) 'clockRate': clockRate,
      if (description != null) 'description': description,
      if (videoFormat != null) 'videoFormat': videoFormat,
    };
  }
}

/// Attributes that are related to the media stream.
///
/// @nodoc
class MediaStreamAttributes {
  /// The settings that you want to use to define the media stream.
  final Fmtp fmtp;

  /// The audio language, in a format that is recognized by the receiver.
  final String? lang;

  MediaStreamAttributes({
    required this.fmtp,
    this.lang,
  });

  factory MediaStreamAttributes.fromJson(Map<String, dynamic> json) {
    return MediaStreamAttributes(
      fmtp: Fmtp.fromJson(
          (json['fmtp'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
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

/// @nodoc
class MediaStreamType {
  static const video = MediaStreamType._('video');
  static const audio = MediaStreamType._('audio');
  static const ancillaryData = MediaStreamType._('ancillary-data');

  final String value;

  const MediaStreamType._(this.value);

  static const values = [video, audio, ancillaryData];

  static MediaStreamType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MediaStreamType._(value));

  @override
  bool operator ==(other) => other is MediaStreamType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A set of parameters that define the media stream.
///
/// @nodoc
class Fmtp {
  /// The format of the audio channel.
  final String? channelOrder;

  /// The format used for the representation of color.
  final Colorimetry? colorimetry;

  /// The frame rate for the video stream, in frames/second. For example:
  /// 60000/1001.
  final String? exactFramerate;

  /// The pixel aspect ratio (PAR) of the video.
  final String? par;

  /// The encoding range of the video.
  final Range? range;

  /// The type of compression that was used to smooth the video’s appearance.
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
      colorimetry:
          (json['colorimetry'] as String?)?.let(Colorimetry.fromString),
      exactFramerate: json['exactFramerate'] as String?,
      par: json['par'] as String?,
      range: (json['range'] as String?)?.let(Range.fromString),
      scanMode: (json['scanMode'] as String?)?.let(ScanMode.fromString),
      tcs: (json['tcs'] as String?)?.let(Tcs.fromString),
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
      if (colorimetry != null) 'colorimetry': colorimetry.value,
      if (exactFramerate != null) 'exactFramerate': exactFramerate,
      if (par != null) 'par': par,
      if (range != null) 'range': range.value,
      if (scanMode != null) 'scanMode': scanMode.value,
      if (tcs != null) 'tcs': tcs.value,
    };
  }
}

/// @nodoc
class Colorimetry {
  static const bt601 = Colorimetry._('BT601');
  static const bt709 = Colorimetry._('BT709');
  static const bt2020 = Colorimetry._('BT2020');
  static const bt2100 = Colorimetry._('BT2100');
  static const st2065_1 = Colorimetry._('ST2065-1');
  static const st2065_3 = Colorimetry._('ST2065-3');
  static const xyz = Colorimetry._('XYZ');

  final String value;

  const Colorimetry._(this.value);

  static const values = [bt601, bt709, bt2020, bt2100, st2065_1, st2065_3, xyz];

  static Colorimetry fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Colorimetry._(value));

  @override
  bool operator ==(other) => other is Colorimetry && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Range {
  static const narrow = Range._('NARROW');
  static const full = Range._('FULL');
  static const fullprotect = Range._('FULLPROTECT');

  final String value;

  const Range._(this.value);

  static const values = [narrow, full, fullprotect];

  static Range fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Range._(value));

  @override
  bool operator ==(other) => other is Range && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ScanMode {
  static const progressive = ScanMode._('progressive');
  static const interlace = ScanMode._('interlace');
  static const progressiveSegmentedFrame =
      ScanMode._('progressive-segmented-frame');

  final String value;

  const ScanMode._(this.value);

  static const values = [progressive, interlace, progressiveSegmentedFrame];

  static ScanMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScanMode._(value));

  @override
  bool operator ==(other) => other is ScanMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Tcs {
  static const sdr = Tcs._('SDR');
  static const pq = Tcs._('PQ');
  static const hlg = Tcs._('HLG');
  static const linear = Tcs._('LINEAR');
  static const bt2100linpq = Tcs._('BT2100LINPQ');
  static const bt2100linhlg = Tcs._('BT2100LINHLG');
  static const st2065_1 = Tcs._('ST2065-1');
  static const st428_1 = Tcs._('ST428-1');
  static const density = Tcs._('DENSITY');

  final String value;

  const Tcs._(this.value);

  static const values = [
    sdr,
    pq,
    hlg,
    linear,
    bt2100linpq,
    bt2100linhlg,
    st2065_1,
    st428_1,
    density
  ];

  static Tcs fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Tcs._(value));

  @override
  bool operator ==(other) => other is Tcs && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Attributes that are related to the media stream.
///
/// @nodoc
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

/// The settings that you want to use to define the media stream.
///
/// @nodoc
class FmtpRequest {
  /// The format of the audio channel.
  final String? channelOrder;

  /// The format that is used for the representation of color.
  final Colorimetry? colorimetry;

  /// The frame rate for the video stream, in frames/second. For example:
  /// 60000/1001. If you specify a whole number, MediaConnect uses a ratio of N/1.
  /// For example, if you specify 60, MediaConnect uses 60/1 as the
  /// <code>exactFramerate</code>.
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
      if (colorimetry != null) 'colorimetry': colorimetry.value,
      if (exactFramerate != null) 'exactFramerate': exactFramerate,
      if (par != null) 'par': par,
      if (range != null) 'range': range.value,
      if (scanMode != null) 'scanMode': scanMode.value,
      if (tcs != null) 'tcs': tcs.value,
    };
  }
}

/// The settings for a flow entitlement.
///
/// @nodoc
class Entitlement {
  /// The ARN of the entitlement.
  final String entitlementArn;

  /// The name of the entitlement.
  final String name;

  /// The Amazon Web Services account IDs that you want to share your content
  /// with. The receiving accounts (subscribers) will be allowed to create their
  /// own flow using your content as the source.
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
      entitlementArn: (json['entitlementArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      subscribers: ((json['subscribers'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      dataTransferSubscriberFeePercent:
          json['dataTransferSubscriberFeePercent'] as int?,
      description: json['description'] as String?,
      encryption: json['encryption'] != null
          ? Encryption.fromJson(json['encryption'] as Map<String, dynamic>)
          : null,
      entitlementStatus: (json['entitlementStatus'] as String?)
          ?.let(EntitlementStatus.fromString),
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
        'entitlementStatus': entitlementStatus.value,
    };
  }
}

/// @nodoc
class EntitlementStatus {
  static const enabled = EntitlementStatus._('ENABLED');
  static const disabled = EntitlementStatus._('DISABLED');

  final String value;

  const EntitlementStatus._(this.value);

  static const values = [enabled, disabled];

  static EntitlementStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EntitlementStatus._(value));

  @override
  bool operator ==(other) => other is EntitlementStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Status {
  static const standby = Status._('STANDBY');
  static const active = Status._('ACTIVE');
  static const updating = Status._('UPDATING');
  static const deleting = Status._('DELETING');
  static const starting = Status._('STARTING');
  static const stopping = Status._('STOPPING');
  static const error = Status._('ERROR');

  final String value;

  const Status._(this.value);

  static const values = [
    standby,
    active,
    updating,
    deleting,
    starting,
    stopping,
    error
  ];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The entitlements that you want to grant on a flow.
///
/// @nodoc
class GrantEntitlementRequest {
  /// The Amazon Web Services account IDs that you want to share your content
  /// with. The receiving accounts (subscribers) will be allowed to create their
  /// own flows using your content as the source.
  final List<String> subscribers;

  /// Percentage from 0-100 of the data transfer cost to be billed to the
  /// subscriber.
  final int? dataTransferSubscriberFeePercent;

  /// A description of the entitlement. This description appears only on the
  /// MediaConnect console and will not be seen by the subscriber or end user.
  final String? description;

  /// The type of encryption that will be used on the output that is associated
  /// with this entitlement. Allowable encryption types: static-key, speke.
  final Encryption? encryption;

  /// An indication of whether the new entitlement should be enabled or disabled
  /// as soon as it is created. If you don’t specify the entitlementStatus field
  /// in your request, MediaConnect sets it to ENABLED.
  final EntitlementStatus? entitlementStatus;

  /// The key-value pairs that can be used to tag and organize the entitlement.
  final Map<String, String>? entitlementTags;

  /// The name of the entitlement. This value must be unique within the current
  /// flow.
  final String? name;

  GrantEntitlementRequest({
    required this.subscribers,
    this.dataTransferSubscriberFeePercent,
    this.description,
    this.encryption,
    this.entitlementStatus,
    this.entitlementTags,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final subscribers = this.subscribers;
    final dataTransferSubscriberFeePercent =
        this.dataTransferSubscriberFeePercent;
    final description = this.description;
    final encryption = this.encryption;
    final entitlementStatus = this.entitlementStatus;
    final entitlementTags = this.entitlementTags;
    final name = this.name;
    return {
      'subscribers': subscribers,
      if (dataTransferSubscriberFeePercent != null)
        'dataTransferSubscriberFeePercent': dataTransferSubscriberFeePercent,
      if (description != null) 'description': description,
      if (encryption != null) 'encryption': encryption,
      if (entitlementStatus != null)
        'entitlementStatus': entitlementStatus.value,
      if (entitlementTags != null) 'entitlementTags': entitlementTags,
      if (name != null) 'name': name,
    };
  }
}

/// The details of the thumbnail, including thumbnail base64 string, timecode
/// and the time when thumbnail was generated.
///
/// @nodoc
class ThumbnailDetails {
  /// The ARN of the flow that DescribeFlowSourceThumbnail was performed on.
  final String flowArn;

  /// Status code and messages about the flow source thumbnail.
  final List<MessageDetail> thumbnailMessages;

  /// Thumbnail Base64 string.
  final String? thumbnail;

  /// Timecode of thumbnail.
  final String? timecode;

  /// The timestamp of when thumbnail was generated.
  final DateTime? timestamp;

  ThumbnailDetails({
    required this.flowArn,
    required this.thumbnailMessages,
    this.thumbnail,
    this.timecode,
    this.timestamp,
  });

  factory ThumbnailDetails.fromJson(Map<String, dynamic> json) {
    return ThumbnailDetails(
      flowArn: (json['flowArn'] as String?) ?? '',
      thumbnailMessages: ((json['thumbnailMessages'] as List?) ?? const [])
          .nonNulls
          .map((e) => MessageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: json['thumbnail'] as String?,
      timecode: json['timecode'] as String?,
      timestamp: timeStampFromJson(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    final thumbnailMessages = this.thumbnailMessages;
    final thumbnail = this.thumbnail;
    final timecode = this.timecode;
    final timestamp = this.timestamp;
    return {
      'flowArn': flowArn,
      'thumbnailMessages': thumbnailMessages,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (timecode != null) 'timecode': timecode,
      if (timestamp != null) 'timestamp': iso8601ToJson(timestamp),
    };
  }
}

/// Comprehensive information about the NDI® source that's associated with a
/// flow. This includes the currently active NDI source, a list of all
/// discovered NDI senders, metadata about the media streams, and any relevant
/// status messages.
///
/// @nodoc
class NdiSourceMetadataInfo {
  /// A list of the available upstream NDI senders aggregated from all of your
  /// configured discovery servers.
  final List<NdiSourceInfo> discoveredSources;

  /// Detailed information about the media streams (video, audio, and so on) that
  /// are part of the active NDI source.
  final NdiMediaInfo mediaInfo;

  /// Any status messages or error codes related to the NDI source and its
  /// metadata.
  final List<MessageDetail> messages;

  /// The connected NDI sender that's currently sending source content to the
  /// flow's NDI source.
  final NdiSourceInfo? activeSource;

  NdiSourceMetadataInfo({
    required this.discoveredSources,
    required this.mediaInfo,
    required this.messages,
    this.activeSource,
  });

  factory NdiSourceMetadataInfo.fromJson(Map<String, dynamic> json) {
    return NdiSourceMetadataInfo(
      discoveredSources: ((json['discoveredSources'] as List?) ?? const [])
          .nonNulls
          .map((e) => NdiSourceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      mediaInfo: NdiMediaInfo.fromJson(
          (json['mediaInfo'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      messages: ((json['messages'] as List?) ?? const [])
          .nonNulls
          .map((e) => MessageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      activeSource: json['activeSource'] != null
          ? NdiSourceInfo.fromJson(json['activeSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final discoveredSources = this.discoveredSources;
    final mediaInfo = this.mediaInfo;
    final messages = this.messages;
    final activeSource = this.activeSource;
    return {
      'discoveredSources': discoveredSources,
      'mediaInfo': mediaInfo,
      'messages': messages,
      if (activeSource != null) 'activeSource': activeSource,
    };
  }
}

/// Information about a single NDI® sender, including its name.
///
/// @nodoc
class NdiSourceInfo {
  /// The name of the upstream NDI sender.
  final String sourceName;

  NdiSourceInfo({
    required this.sourceName,
  });

  factory NdiSourceInfo.fromJson(Map<String, dynamic> json) {
    return NdiSourceInfo(
      sourceName: (json['sourceName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final sourceName = this.sourceName;
    return {
      'sourceName': sourceName,
    };
  }
}

/// Metadata about the audio and video media that is part of the NDI® source
/// content. This includes details about the individual media streams.
///
/// @nodoc
class NdiMediaInfo {
  /// A list of the individual media streams that make up the NDI source. This
  /// includes details about each stream's codec, resolution, frame rate, audio
  /// channels, and other parameters.
  final List<NdiMediaStreamInfo> streams;

  NdiMediaInfo({
    required this.streams,
  });

  factory NdiMediaInfo.fromJson(Map<String, dynamic> json) {
    return NdiMediaInfo(
      streams: ((json['streams'] as List?) ?? const [])
          .nonNulls
          .map((e) => NdiMediaStreamInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final streams = this.streams;
    return {
      'streams': streams,
    };
  }
}

/// Detailed information about a single media stream that is part of an NDI®
/// source. This includes details about the stream type, codec, resolution,
/// frame rate, audio channels, and sample rate.
///
/// @nodoc
class NdiMediaStreamInfo {
  /// The codec used for the media stream. For NDI sources, use
  /// <code>speed-hq</code>.
  final String codec;

  /// A unique identifier for the media stream.
  final int streamId;

  /// The type of media stream (for example, <code>Video</code> or
  /// <code>Audio</code>).
  final String streamType;

  /// The number of audio channels in the stream. Used when the
  /// <code>streamType</code> is <code>Audio</code>.
  final int? channels;

  /// The number of video frames displayed per second. Used when the
  /// <code>streamType</code> is <code>Video</code>.
  final String? frameRate;

  /// The width and height dimensions of the video frame in pixels. Used when the
  /// <code>streamType</code> is <code>Video</code>.
  final FrameResolution? frameResolution;

  /// The number of audio samples captured per second, measured in kilohertz
  /// (kHz). Used when the <code>streamType</code> is <code>Audio</code>.
  final int? sampleRate;

  /// The method used to display video frames. Used when the
  /// <code>streamType</code> is <code>Video</code>.
  final ScanMode? scanMode;

  NdiMediaStreamInfo({
    required this.codec,
    required this.streamId,
    required this.streamType,
    this.channels,
    this.frameRate,
    this.frameResolution,
    this.sampleRate,
    this.scanMode,
  });

  factory NdiMediaStreamInfo.fromJson(Map<String, dynamic> json) {
    return NdiMediaStreamInfo(
      codec: (json['codec'] as String?) ?? '',
      streamId: (json['streamId'] as int?) ?? 0,
      streamType: (json['streamType'] as String?) ?? '',
      channels: json['channels'] as int?,
      frameRate: json['frameRate'] as String?,
      frameResolution: json['frameResolution'] != null
          ? FrameResolution.fromJson(
              json['frameResolution'] as Map<String, dynamic>)
          : null,
      sampleRate: json['sampleRate'] as int?,
      scanMode: (json['scanMode'] as String?)?.let(ScanMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final codec = this.codec;
    final streamId = this.streamId;
    final streamType = this.streamType;
    final channels = this.channels;
    final frameRate = this.frameRate;
    final frameResolution = this.frameResolution;
    final sampleRate = this.sampleRate;
    final scanMode = this.scanMode;
    return {
      'codec': codec,
      'streamId': streamId,
      'streamType': streamType,
      if (channels != null) 'channels': channels,
      if (frameRate != null) 'frameRate': frameRate,
      if (frameResolution != null) 'frameResolution': frameResolution,
      if (sampleRate != null) 'sampleRate': sampleRate,
      if (scanMode != null) 'scanMode': scanMode.value,
    };
  }
}

/// The settings for a VPC source.
///
/// @nodoc
class VpcInterface {
  /// Immutable and has to be a unique against other VpcInterfaces in this Flow.
  final String name;

  /// IDs of the network interfaces created in customer's account by MediaConnect.
  final List<String> networkInterfaceIds;

  /// The type of network interface.
  final NetworkInterfaceType networkInterfaceType;

  /// A role Arn MediaConnect can assume to create ENIs in your account.
  final String roleArn;

  /// Security Group IDs to be used on ENI.
  final List<String> securityGroupIds;

  /// Subnet must be in the AZ of the Flow.
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
      name: (json['name'] as String?) ?? '',
      networkInterfaceIds: ((json['networkInterfaceIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      networkInterfaceType: NetworkInterfaceType.fromString(
          (json['networkInterfaceType'] as String?) ?? ''),
      roleArn: (json['roleArn'] as String?) ?? '',
      securityGroupIds: ((json['securityGroupIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      subnetId: (json['subnetId'] as String?) ?? '',
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
      'networkInterfaceType': networkInterfaceType.value,
      'roleArn': roleArn,
      'securityGroupIds': securityGroupIds,
      'subnetId': subnetId,
    };
  }
}

/// @nodoc
class NetworkInterfaceType {
  static const ena = NetworkInterfaceType._('ena');
  static const efa = NetworkInterfaceType._('efa');

  final String value;

  const NetworkInterfaceType._(this.value);

  static const values = [ena, efa];

  static NetworkInterfaceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkInterfaceType._(value));

  @override
  bool operator ==(other) =>
      other is NetworkInterfaceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of the VPC interfaces that you want to add to the flow.
///
/// @nodoc
class VpcInterfaceRequest {
  /// The name for the VPC interface. This name must be unique within the flow.
  final String name;

  /// The Amazon Resource Name (ARN) of the role that you created when you set up
  /// MediaConnect as a trusted service.
  final String roleArn;

  /// A virtual firewall to control inbound and outbound traffic.
  final List<String> securityGroupIds;

  /// The subnet IDs that you want to use for your VPC interface. A range of IP
  /// addresses in your VPC. When you create your VPC, you specify a range of IPv4
  /// addresses for the VPC in the form of a Classless Inter-Domain Routing (CIDR)
  /// block; for example, 10.0.0.0/16. This is the primary CIDR block for your
  /// VPC. When you create a subnet for your VPC, you specify the CIDR block for
  /// the subnet, which is a subset of the VPC CIDR block. The subnets that you
  /// use across all VPC interfaces on the flow must be in the same Availability
  /// Zone as the flow.
  final String subnetId;

  /// The type of network interface.
  final NetworkInterfaceType? networkInterfaceType;

  /// The key-value pairs that can be used to tag and organize the VPC network
  /// interface.
  final Map<String, String>? vpcInterfaceTags;

  VpcInterfaceRequest({
    required this.name,
    required this.roleArn,
    required this.securityGroupIds,
    required this.subnetId,
    this.networkInterfaceType,
    this.vpcInterfaceTags,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final roleArn = this.roleArn;
    final securityGroupIds = this.securityGroupIds;
    final subnetId = this.subnetId;
    final networkInterfaceType = this.networkInterfaceType;
    final vpcInterfaceTags = this.vpcInterfaceTags;
    return {
      'name': name,
      'roleArn': roleArn,
      'securityGroupIds': securityGroupIds,
      'subnetId': subnetId,
      if (networkInterfaceType != null)
        'networkInterfaceType': networkInterfaceType.value,
      if (vpcInterfaceTags != null) 'vpcInterfaceTags': vpcInterfaceTags,
    };
  }
}

/// The settings for the source of the flow.
///
/// @nodoc
class SetSourceRequest {
  /// The type of encryption that is used on the content ingested from this
  /// source. Allowable encryption types: static-key.
  final Encryption? decryption;

  /// A description for the source. This value is not used or seen outside of the
  /// current MediaConnect account.
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
  /// RIST-based and Zixi-based streams.
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

  /// The settings for the NDI® source. This includes the exact name of the
  /// upstream NDI sender that you want to connect to your source.
  final NdiSourceSettings? ndiSourceSettings;

  /// The protocol that is used by the source.
  /// <note>
  /// Elemental MediaConnect no longer supports the Fujitsu QoS protocol. This
  /// reference is maintained for legacy purposes only.
  /// </note>
  final Protocol? protocol;

  /// Indicates whether to enable or disable router integration when setting a
  /// flow source.
  final State? routerIntegrationState;

  /// The decryption configuration for the flow source when router integration is
  /// enabled. Specifies how the source content should be decrypted when router
  /// integration is used.
  final FlowTransitEncryption? routerIntegrationTransitDecryption;

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

  /// The key-value pairs that can be used to tag and organize the source.
  final Map<String, String>? sourceTags;

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
    this.ndiSourceSettings,
    this.protocol,
    this.routerIntegrationState,
    this.routerIntegrationTransitDecryption,
    this.senderControlPort,
    this.senderIpAddress,
    this.sourceListenerAddress,
    this.sourceListenerPort,
    this.sourceTags,
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
    final ndiSourceSettings = this.ndiSourceSettings;
    final protocol = this.protocol;
    final routerIntegrationState = this.routerIntegrationState;
    final routerIntegrationTransitDecryption =
        this.routerIntegrationTransitDecryption;
    final senderControlPort = this.senderControlPort;
    final senderIpAddress = this.senderIpAddress;
    final sourceListenerAddress = this.sourceListenerAddress;
    final sourceListenerPort = this.sourceListenerPort;
    final sourceTags = this.sourceTags;
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
      if (ndiSourceSettings != null) 'ndiSourceSettings': ndiSourceSettings,
      if (protocol != null) 'protocol': protocol.value,
      if (routerIntegrationState != null)
        'routerIntegrationState': routerIntegrationState.value,
      if (routerIntegrationTransitDecryption != null)
        'routerIntegrationTransitDecryption':
            routerIntegrationTransitDecryption,
      if (senderControlPort != null) 'senderControlPort': senderControlPort,
      if (senderIpAddress != null) 'senderIpAddress': senderIpAddress,
      if (sourceListenerAddress != null)
        'sourceListenerAddress': sourceListenerAddress,
      if (sourceListenerPort != null) 'sourceListenerPort': sourceListenerPort,
      if (sourceTags != null) 'sourceTags': sourceTags,
      if (streamId != null) 'streamId': streamId,
      if (vpcInterfaceName != null) 'vpcInterfaceName': vpcInterfaceName,
      if (whitelistCidr != null) 'whitelistCidr': whitelistCidr,
    };
  }
}

/// The source configuration for cloud flows receiving a stream from a bridge.
///
/// @nodoc
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

/// A request to add an output to a flow.
///
/// @nodoc
class AddOutputRequest {
  /// The range of IP addresses that should be allowed to initiate output requests
  /// to this flow. These IP addresses should be in the form of a Classless
  /// Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16.
  final List<String>? cidrAllowList;

  /// A description of the output. This description appears only on the Audit
  /// Manager console and will not be seen by the end user.
  final String? description;

  /// The IP address from which video will be sent to output destinations.
  final String? destination;

  /// The type of key used for the encryption. If no keyType is provided, the
  /// service will use the default setting (static-key). Allowable encryption
  /// types: static-key.
  final Encryption? encryption;

  /// The maximum latency in milliseconds. This parameter applies only to
  /// RIST-based and Zixi-based streams.
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

  /// Controls how MediaConnect generates timecodes for NDI output frames. If you
  /// don't specify this field, MediaConnect uses <code>EMBEDDED_TIMECODE</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>EMBEDDED_TIMECODE</code> (default) - Preserves timecodes from the
  /// input transport stream. The timecodes must be embedded in the video stream
  /// as SEI timing messages. If no embedded timecode is detected, MediaConnect
  /// uses the UTC system time instead.
  /// </li>
  /// <li>
  /// <code>UTC_SYSTEM_TIME</code> - Generates timecodes based on the system clock
  /// time when each frame is sent.
  /// </li>
  /// </ul>
  final NdiOutputTimecodeSource? ndiOutputTimecodeSource;

  /// A suffix for the name of the NDI® sender that the flow creates. If a custom
  /// name isn't specified, MediaConnect uses the output name.
  final String? ndiProgramName;

  /// A quality setting for the NDI Speed HQ encoder.
  final int? ndiSpeedHqQuality;

  /// An indication of whether the new output should be enabled or disabled as
  /// soon as it is created. If you don't specify the outputStatus field in your
  /// request, MediaConnect sets it to ENABLED.
  final OutputStatus? outputStatus;

  /// The key-value pairs that can be used to tag and organize the output.
  final Map<String, String>? outputTags;

  /// The port to use when content is distributed to this output.
  final int? port;

  /// The protocol to use for the output.
  /// <note>
  /// Elemental MediaConnect no longer supports the Fujitsu QoS protocol. This
  /// reference is maintained for legacy purposes only.
  /// </note>
  final Protocol? protocol;

  /// The remote ID for the Zixi-pull output stream.
  final String? remoteId;

  /// Indicates whether to enable or disable router integration when creating a
  /// new flow output.
  final State? routerIntegrationState;
  final FlowTransitEncryption? routerIntegrationTransitEncryption;

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
    this.cidrAllowList,
    this.description,
    this.destination,
    this.encryption,
    this.maxLatency,
    this.mediaStreamOutputConfigurations,
    this.minLatency,
    this.name,
    this.ndiOutputTimecodeSource,
    this.ndiProgramName,
    this.ndiSpeedHqQuality,
    this.outputStatus,
    this.outputTags,
    this.port,
    this.protocol,
    this.remoteId,
    this.routerIntegrationState,
    this.routerIntegrationTransitEncryption,
    this.senderControlPort,
    this.smoothingLatency,
    this.streamId,
    this.vpcInterfaceAttachment,
  });

  Map<String, dynamic> toJson() {
    final cidrAllowList = this.cidrAllowList;
    final description = this.description;
    final destination = this.destination;
    final encryption = this.encryption;
    final maxLatency = this.maxLatency;
    final mediaStreamOutputConfigurations =
        this.mediaStreamOutputConfigurations;
    final minLatency = this.minLatency;
    final name = this.name;
    final ndiOutputTimecodeSource = this.ndiOutputTimecodeSource;
    final ndiProgramName = this.ndiProgramName;
    final ndiSpeedHqQuality = this.ndiSpeedHqQuality;
    final outputStatus = this.outputStatus;
    final outputTags = this.outputTags;
    final port = this.port;
    final protocol = this.protocol;
    final remoteId = this.remoteId;
    final routerIntegrationState = this.routerIntegrationState;
    final routerIntegrationTransitEncryption =
        this.routerIntegrationTransitEncryption;
    final senderControlPort = this.senderControlPort;
    final smoothingLatency = this.smoothingLatency;
    final streamId = this.streamId;
    final vpcInterfaceAttachment = this.vpcInterfaceAttachment;
    return {
      if (cidrAllowList != null) 'cidrAllowList': cidrAllowList,
      if (description != null) 'description': description,
      if (destination != null) 'destination': destination,
      if (encryption != null) 'encryption': encryption,
      if (maxLatency != null) 'maxLatency': maxLatency,
      if (mediaStreamOutputConfigurations != null)
        'mediaStreamOutputConfigurations': mediaStreamOutputConfigurations,
      if (minLatency != null) 'minLatency': minLatency,
      if (name != null) 'name': name,
      if (ndiOutputTimecodeSource != null)
        'ndiOutputTimecodeSource': ndiOutputTimecodeSource.value,
      if (ndiProgramName != null) 'ndiProgramName': ndiProgramName,
      if (ndiSpeedHqQuality != null) 'ndiSpeedHqQuality': ndiSpeedHqQuality,
      if (outputStatus != null) 'outputStatus': outputStatus.value,
      if (outputTags != null) 'outputTags': outputTags,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.value,
      if (remoteId != null) 'remoteId': remoteId,
      if (routerIntegrationState != null)
        'routerIntegrationState': routerIntegrationState.value,
      if (routerIntegrationTransitEncryption != null)
        'routerIntegrationTransitEncryption':
            routerIntegrationTransitEncryption,
      if (senderControlPort != null) 'senderControlPort': senderControlPort,
      if (smoothingLatency != null) 'smoothingLatency': smoothingLatency,
      if (streamId != null) 'streamId': streamId,
      if (vpcInterfaceAttachment != null)
        'vpcInterfaceAttachment': vpcInterfaceAttachment,
    };
  }
}

/// The media stream that you want to add to the flow.
///
/// @nodoc
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

  /// The key-value pairs that can be used to tag and organize the media stream.
  final Map<String, String>? mediaStreamTags;

  /// The resolution of the video.
  final String? videoFormat;

  AddMediaStreamRequest({
    required this.mediaStreamId,
    required this.mediaStreamName,
    required this.mediaStreamType,
    this.attributes,
    this.clockRate,
    this.description,
    this.mediaStreamTags,
    this.videoFormat,
  });

  Map<String, dynamic> toJson() {
    final mediaStreamId = this.mediaStreamId;
    final mediaStreamName = this.mediaStreamName;
    final mediaStreamType = this.mediaStreamType;
    final attributes = this.attributes;
    final clockRate = this.clockRate;
    final description = this.description;
    final mediaStreamTags = this.mediaStreamTags;
    final videoFormat = this.videoFormat;
    return {
      'mediaStreamId': mediaStreamId,
      'mediaStreamName': mediaStreamName,
      'mediaStreamType': mediaStreamType.value,
      if (attributes != null) 'attributes': attributes,
      if (clockRate != null) 'clockRate': clockRate,
      if (description != null) 'description': description,
      if (mediaStreamTags != null) 'mediaStreamTags': mediaStreamTags,
      if (videoFormat != null) 'videoFormat': videoFormat,
    };
  }
}

/// A summary of a flow, including its ARN, Availability Zone, and source type.
///
/// @nodoc
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
  /// than an MediaConnect flow owned by another Amazon Web Services account) or
  /// entitled (originated at a MediaConnect flow owned by another Amazon Web
  /// Services account).
  final SourceType sourceType;

  /// The current status of the flow.
  final Status status;

  /// The maintenance settings for the flow.
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
      availabilityZone: (json['availabilityZone'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      flowArn: (json['flowArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      sourceType: SourceType.fromString((json['sourceType'] as String?) ?? ''),
      status: Status.fromString((json['status'] as String?) ?? ''),
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
      'sourceType': sourceType.value,
      'status': status.value,
      if (maintenance != null) 'maintenance': maintenance,
    };
  }
}

/// @nodoc
class SourceType {
  static const owned = SourceType._('OWNED');
  static const entitled = SourceType._('ENTITLED');

  final String value;

  const SourceType._(this.value);

  static const values = [owned, entitled];

  static SourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SourceType._(value));

  @override
  bool operator ==(other) => other is SourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The maintenance setting of a flow.
///
/// @nodoc
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
      maintenanceDay:
          (json['maintenanceDay'] as String?)?.let(MaintenanceDay.fromString),
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
      if (maintenanceDay != null) 'maintenanceDay': maintenanceDay.value,
      if (maintenanceDeadline != null)
        'maintenanceDeadline': maintenanceDeadline,
      if (maintenanceScheduledDate != null)
        'maintenanceScheduledDate': maintenanceScheduledDate,
      if (maintenanceStartHour != null)
        'maintenanceStartHour': maintenanceStartHour,
    };
  }
}

/// @nodoc
class MaintenanceDay {
  static const monday = MaintenanceDay._('Monday');
  static const tuesday = MaintenanceDay._('Tuesday');
  static const wednesday = MaintenanceDay._('Wednesday');
  static const thursday = MaintenanceDay._('Thursday');
  static const friday = MaintenanceDay._('Friday');
  static const saturday = MaintenanceDay._('Saturday');
  static const sunday = MaintenanceDay._('Sunday');

  final String value;

  const MaintenanceDay._(this.value);

  static const values = [
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday
  ];

  static MaintenanceDay fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MaintenanceDay._(value));

  @override
  bool operator ==(other) => other is MaintenanceDay && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The settings for a flow, including its source, outputs, and entitlements.
///
/// @nodoc
class Flow {
  /// The Availability Zone that you want to create the flow in. These options are
  /// limited to the Availability Zones within the current Amazon Web Services
  /// Region.
  final String availabilityZone;

  /// The entitlements in this flow.
  final List<Entitlement> entitlements;

  /// The Amazon Resource Name (ARN) of the flow.
  final String flowArn;

  /// The name of the flow.
  final String name;

  /// The outputs in this flow.
  final List<Output> outputs;

  /// The source for the flow.
  final Source source;

  /// The current status of the flow.
  final Status status;

  /// A description of the flow. This value is not used or seen outside of the
  /// current MediaConnect account.
  final String? description;

  /// The IP address from which video will be sent to output destinations.
  final String? egressIp;

  /// The encoding configuration to apply to the NDI® source when transcoding it
  /// to a transport stream for downstream distribution.
  final EncodingConfig? encodingConfig;

  /// Determines the processing capacity and feature set of the flow.
  final FlowSize? flowSize;

  /// The maintenance settings for the flow.
  final Maintenance? maintenance;

  /// The media streams that are associated with the flow. After you associate a
  /// media stream with a source, you can also associate it with outputs on the
  /// flow.
  final List<MediaStream>? mediaStreams;

  /// Specifies the configuration settings for a flow's NDI source or output.
  /// Required when the flow includes an NDI source or output.
  final NdiConfig? ndiConfig;

  /// The settings for the source failover.
  final FailoverConfig? sourceFailoverConfig;

  /// The settings for source monitoring.
  final MonitoringConfig? sourceMonitoringConfig;

  /// The settings for the sources that are assigned to the flow.
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
    this.encodingConfig,
    this.flowSize,
    this.maintenance,
    this.mediaStreams,
    this.ndiConfig,
    this.sourceFailoverConfig,
    this.sourceMonitoringConfig,
    this.sources,
    this.vpcInterfaces,
  });

  factory Flow.fromJson(Map<String, dynamic> json) {
    return Flow(
      availabilityZone: (json['availabilityZone'] as String?) ?? '',
      entitlements: ((json['entitlements'] as List?) ?? const [])
          .nonNulls
          .map((e) => Entitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
      flowArn: (json['flowArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      outputs: ((json['outputs'] as List?) ?? const [])
          .nonNulls
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: Source.fromJson((json['source'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      status: Status.fromString((json['status'] as String?) ?? ''),
      description: json['description'] as String?,
      egressIp: json['egressIp'] as String?,
      encodingConfig: json['encodingConfig'] != null
          ? EncodingConfig.fromJson(
              json['encodingConfig'] as Map<String, dynamic>)
          : null,
      flowSize: (json['flowSize'] as String?)?.let(FlowSize.fromString),
      maintenance: json['maintenance'] != null
          ? Maintenance.fromJson(json['maintenance'] as Map<String, dynamic>)
          : null,
      mediaStreams: (json['mediaStreams'] as List?)
          ?.nonNulls
          .map((e) => MediaStream.fromJson(e as Map<String, dynamic>))
          .toList(),
      ndiConfig: json['ndiConfig'] != null
          ? NdiConfig.fromJson(json['ndiConfig'] as Map<String, dynamic>)
          : null,
      sourceFailoverConfig: json['sourceFailoverConfig'] != null
          ? FailoverConfig.fromJson(
              json['sourceFailoverConfig'] as Map<String, dynamic>)
          : null,
      sourceMonitoringConfig: json['sourceMonitoringConfig'] != null
          ? MonitoringConfig.fromJson(
              json['sourceMonitoringConfig'] as Map<String, dynamic>)
          : null,
      sources: (json['sources'] as List?)
          ?.nonNulls
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcInterfaces: (json['vpcInterfaces'] as List?)
          ?.nonNulls
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
    final encodingConfig = this.encodingConfig;
    final flowSize = this.flowSize;
    final maintenance = this.maintenance;
    final mediaStreams = this.mediaStreams;
    final ndiConfig = this.ndiConfig;
    final sourceFailoverConfig = this.sourceFailoverConfig;
    final sourceMonitoringConfig = this.sourceMonitoringConfig;
    final sources = this.sources;
    final vpcInterfaces = this.vpcInterfaces;
    return {
      'availabilityZone': availabilityZone,
      'entitlements': entitlements,
      'flowArn': flowArn,
      'name': name,
      'outputs': outputs,
      'source': source,
      'status': status.value,
      if (description != null) 'description': description,
      if (egressIp != null) 'egressIp': egressIp,
      if (encodingConfig != null) 'encodingConfig': encodingConfig,
      if (flowSize != null) 'flowSize': flowSize.value,
      if (maintenance != null) 'maintenance': maintenance,
      if (mediaStreams != null) 'mediaStreams': mediaStreams,
      if (ndiConfig != null) 'ndiConfig': ndiConfig,
      if (sourceFailoverConfig != null)
        'sourceFailoverConfig': sourceFailoverConfig,
      if (sourceMonitoringConfig != null)
        'sourceMonitoringConfig': sourceMonitoringConfig,
      if (sources != null) 'sources': sources,
      if (vpcInterfaces != null) 'vpcInterfaces': vpcInterfaces,
    };
  }
}

/// The settings for source failover.
///
/// @nodoc
class FailoverConfig {
  /// The type of failover you choose for this flow. MERGE combines the source
  /// streams into a single stream, allowing graceful recovery from any
  /// single-source loss. FAILOVER allows switching between different streams.
  final FailoverMode? failoverMode;

  /// Search window time to look for dash-7 packets.
  final int? recoveryWindow;

  /// The priority you want to assign to a source. You can have a primary stream
  /// and a backup stream or two equally prioritized streams.
  final SourcePriority? sourcePriority;

  /// The state of source failover on the flow. If the state is inactive, the flow
  /// can have only one source. If the state is active, the flow can have one or
  /// two sources.
  final State? state;

  FailoverConfig({
    this.failoverMode,
    this.recoveryWindow,
    this.sourcePriority,
    this.state,
  });

  factory FailoverConfig.fromJson(Map<String, dynamic> json) {
    return FailoverConfig(
      failoverMode:
          (json['failoverMode'] as String?)?.let(FailoverMode.fromString),
      recoveryWindow: json['recoveryWindow'] as int?,
      sourcePriority: json['sourcePriority'] != null
          ? SourcePriority.fromJson(
              json['sourcePriority'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.let(State.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final failoverMode = this.failoverMode;
    final recoveryWindow = this.recoveryWindow;
    final sourcePriority = this.sourcePriority;
    final state = this.state;
    return {
      if (failoverMode != null) 'failoverMode': failoverMode.value,
      if (recoveryWindow != null) 'recoveryWindow': recoveryWindow,
      if (sourcePriority != null) 'sourcePriority': sourcePriority,
      if (state != null) 'state': state.value,
    };
  }
}

/// The settings for source monitoring.
///
/// @nodoc
class MonitoringConfig {
  /// Contains the settings for audio stream metrics monitoring.
  final List<AudioMonitoringSetting>? audioMonitoringSettings;

  /// Indicates whether content quality analysis is enabled or disabled.
  final ContentQualityAnalysisState? contentQualityAnalysisState;

  /// Indicates whether thumbnails are enabled or disabled.
  final ThumbnailState? thumbnailState;

  /// Contains the settings for video stream metrics monitoring.
  final List<VideoMonitoringSetting>? videoMonitoringSettings;

  MonitoringConfig({
    this.audioMonitoringSettings,
    this.contentQualityAnalysisState,
    this.thumbnailState,
    this.videoMonitoringSettings,
  });

  factory MonitoringConfig.fromJson(Map<String, dynamic> json) {
    return MonitoringConfig(
      audioMonitoringSettings: (json['audioMonitoringSettings'] as List?)
          ?.nonNulls
          .map(
              (e) => AudioMonitoringSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      contentQualityAnalysisState:
          (json['contentQualityAnalysisState'] as String?)
              ?.let(ContentQualityAnalysisState.fromString),
      thumbnailState:
          (json['thumbnailState'] as String?)?.let(ThumbnailState.fromString),
      videoMonitoringSettings: (json['videoMonitoringSettings'] as List?)
          ?.nonNulls
          .map(
              (e) => VideoMonitoringSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final audioMonitoringSettings = this.audioMonitoringSettings;
    final contentQualityAnalysisState = this.contentQualityAnalysisState;
    final thumbnailState = this.thumbnailState;
    final videoMonitoringSettings = this.videoMonitoringSettings;
    return {
      if (audioMonitoringSettings != null)
        'audioMonitoringSettings': audioMonitoringSettings,
      if (contentQualityAnalysisState != null)
        'contentQualityAnalysisState': contentQualityAnalysisState.value,
      if (thumbnailState != null) 'thumbnailState': thumbnailState.value,
      if (videoMonitoringSettings != null)
        'videoMonitoringSettings': videoMonitoringSettings,
    };
  }
}

/// @nodoc
class FlowSize {
  static const medium = FlowSize._('MEDIUM');
  static const large = FlowSize._('LARGE');
  static const large_4x = FlowSize._('LARGE_4X');

  final String value;

  const FlowSize._(this.value);

  static const values = [medium, large, large_4x];

  static FlowSize fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FlowSize._(value));

  @override
  bool operator ==(other) => other is FlowSize && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the configuration settings for NDI sources and outputs.
///
/// @nodoc
class NdiConfig {
  /// A prefix for the names of the NDI sources that the flow creates. If a custom
  /// name isn't specified, MediaConnect generates a unique 12-character ID as the
  /// prefix.
  final String? machineName;

  /// A list of up to three NDI discovery server configurations. While not
  /// required by the API, this configuration is necessary for NDI functionality
  /// to work properly.
  final List<NdiDiscoveryServerConfig>? ndiDiscoveryServers;

  /// A setting that controls whether NDI® sources or outputs can be used in the
  /// flow.
  ///
  /// The default value is <code>DISABLED</code>. This value must be set as
  /// <code>ENABLED</code> for your flow to support NDI sources or outputs.
  final NdiState? ndiState;

  NdiConfig({
    this.machineName,
    this.ndiDiscoveryServers,
    this.ndiState,
  });

  factory NdiConfig.fromJson(Map<String, dynamic> json) {
    return NdiConfig(
      machineName: json['machineName'] as String?,
      ndiDiscoveryServers: (json['ndiDiscoveryServers'] as List?)
          ?.nonNulls
          .map((e) =>
              NdiDiscoveryServerConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      ndiState: (json['ndiState'] as String?)?.let(NdiState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final machineName = this.machineName;
    final ndiDiscoveryServers = this.ndiDiscoveryServers;
    final ndiState = this.ndiState;
    return {
      if (machineName != null) 'machineName': machineName,
      if (ndiDiscoveryServers != null)
        'ndiDiscoveryServers': ndiDiscoveryServers,
      if (ndiState != null) 'ndiState': ndiState.value,
    };
  }
}

/// The encoding configuration to apply to the NDI® source when transcoding it
/// to a transport stream for downstream distribution. You can choose between
/// several predefined encoding profiles based on common use cases.
///
/// @nodoc
class EncodingConfig {
  /// The encoding profile to use when transcoding the NDI source content to a
  /// transport stream. You can change this value while the flow is running.
  final EncodingProfile? encodingProfile;

  /// The maximum video bitrate to use when transcoding the NDI source to a
  /// transport stream. This parameter enables you to override the default video
  /// bitrate within the encoding profile's supported range.
  ///
  /// The supported range is 10,000,000 - 50,000,000 bits per second (bps). If you
  /// don't specify a value, MediaConnect uses the default value of 20,000,000
  /// bps.
  final int? videoMaxBitrate;

  EncodingConfig({
    this.encodingProfile,
    this.videoMaxBitrate,
  });

  factory EncodingConfig.fromJson(Map<String, dynamic> json) {
    return EncodingConfig(
      encodingProfile:
          (json['encodingProfile'] as String?)?.let(EncodingProfile.fromString),
      videoMaxBitrate: json['videoMaxBitrate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final encodingProfile = this.encodingProfile;
    final videoMaxBitrate = this.videoMaxBitrate;
    return {
      if (encodingProfile != null) 'encodingProfile': encodingProfile.value,
      if (videoMaxBitrate != null) 'videoMaxBitrate': videoMaxBitrate,
    };
  }
}

/// @nodoc
class EncodingProfile {
  static const distributionH264Default =
      EncodingProfile._('DISTRIBUTION_H264_DEFAULT');
  static const contributionH264Default =
      EncodingProfile._('CONTRIBUTION_H264_DEFAULT');

  final String value;

  const EncodingProfile._(this.value);

  static const values = [distributionH264Default, contributionH264Default];

  static EncodingProfile fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncodingProfile._(value));

  @override
  bool operator ==(other) => other is EncodingProfile && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class NdiState {
  static const enabled = NdiState._('ENABLED');
  static const disabled = NdiState._('DISABLED');

  final String value;

  const NdiState._(this.value);

  static const values = [enabled, disabled];

  static NdiState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => NdiState._(value));

  @override
  bool operator ==(other) => other is NdiState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the configuration settings for individual NDI® discovery servers.
/// A maximum of 3 servers is allowed.
///
/// @nodoc
class NdiDiscoveryServerConfig {
  /// The unique network address of the NDI discovery server.
  final String discoveryServerAddress;

  /// The identifier for the Virtual Private Cloud (VPC) network interface used by
  /// the flow.
  final String vpcInterfaceAdapter;

  /// The port for the NDI discovery server. Defaults to 5959 if a custom port
  /// isn't specified.
  final int? discoveryServerPort;

  NdiDiscoveryServerConfig({
    required this.discoveryServerAddress,
    required this.vpcInterfaceAdapter,
    this.discoveryServerPort,
  });

  factory NdiDiscoveryServerConfig.fromJson(Map<String, dynamic> json) {
    return NdiDiscoveryServerConfig(
      discoveryServerAddress: (json['discoveryServerAddress'] as String?) ?? '',
      vpcInterfaceAdapter: (json['vpcInterfaceAdapter'] as String?) ?? '',
      discoveryServerPort: json['discoveryServerPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final discoveryServerAddress = this.discoveryServerAddress;
    final vpcInterfaceAdapter = this.vpcInterfaceAdapter;
    final discoveryServerPort = this.discoveryServerPort;
    return {
      'discoveryServerAddress': discoveryServerAddress,
      'vpcInterfaceAdapter': vpcInterfaceAdapter,
      if (discoveryServerPort != null)
        'discoveryServerPort': discoveryServerPort,
    };
  }
}

/// @nodoc
class ThumbnailState {
  static const enabled = ThumbnailState._('ENABLED');
  static const disabled = ThumbnailState._('DISABLED');

  final String value;

  const ThumbnailState._(this.value);

  static const values = [enabled, disabled];

  static ThumbnailState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ThumbnailState._(value));

  @override
  bool operator ==(other) => other is ThumbnailState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ContentQualityAnalysisState {
  static const enabled = ContentQualityAnalysisState._('ENABLED');
  static const disabled = ContentQualityAnalysisState._('DISABLED');

  final String value;

  const ContentQualityAnalysisState._(this.value);

  static const values = [enabled, disabled];

  static ContentQualityAnalysisState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContentQualityAnalysisState._(value));

  @override
  bool operator ==(other) =>
      other is ContentQualityAnalysisState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the configuration for video stream metrics monitoring.
///
/// @nodoc
class VideoMonitoringSetting {
  /// Detects video frames that are black.
  final BlackFrames? blackFrames;

  /// Detects video frames that have not changed.
  final FrozenFrames? frozenFrames;

  VideoMonitoringSetting({
    this.blackFrames,
    this.frozenFrames,
  });

  factory VideoMonitoringSetting.fromJson(Map<String, dynamic> json) {
    return VideoMonitoringSetting(
      blackFrames: json['blackFrames'] != null
          ? BlackFrames.fromJson(json['blackFrames'] as Map<String, dynamic>)
          : null,
      frozenFrames: json['frozenFrames'] != null
          ? FrozenFrames.fromJson(json['frozenFrames'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final blackFrames = this.blackFrames;
    final frozenFrames = this.frozenFrames;
    return {
      if (blackFrames != null) 'blackFrames': blackFrames,
      if (frozenFrames != null) 'frozenFrames': frozenFrames,
    };
  }
}

/// Configures settings for the <code>BlackFrames</code> metric.
///
/// @nodoc
class BlackFrames {
  /// Indicates whether the <code>BlackFrames</code> metric is enabled or
  /// disabled..
  final State? state;

  /// Specifies the number of consecutive seconds of black frames that triggers an
  /// event or alert.
  final int? thresholdSeconds;

  BlackFrames({
    this.state,
    this.thresholdSeconds,
  });

  factory BlackFrames.fromJson(Map<String, dynamic> json) {
    return BlackFrames(
      state: (json['state'] as String?)?.let(State.fromString),
      thresholdSeconds: json['thresholdSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final thresholdSeconds = this.thresholdSeconds;
    return {
      if (state != null) 'state': state.value,
      if (thresholdSeconds != null) 'thresholdSeconds': thresholdSeconds,
    };
  }
}

/// Configures settings for the <code>FrozenFrames</code> metric.
///
/// @nodoc
class FrozenFrames {
  /// Indicates whether the <code>FrozenFrames</code> metric is enabled or
  /// disabled.
  final State? state;

  /// Specifies the number of consecutive seconds of a static image that triggers
  /// an event or alert.
  final int? thresholdSeconds;

  FrozenFrames({
    this.state,
    this.thresholdSeconds,
  });

  factory FrozenFrames.fromJson(Map<String, dynamic> json) {
    return FrozenFrames(
      state: (json['state'] as String?)?.let(State.fromString),
      thresholdSeconds: json['thresholdSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final thresholdSeconds = this.thresholdSeconds;
    return {
      if (state != null) 'state': state.value,
      if (thresholdSeconds != null) 'thresholdSeconds': thresholdSeconds,
    };
  }
}

/// Specifies the configuration for audio stream metrics monitoring.
///
/// @nodoc
class AudioMonitoringSetting {
  /// Detects periods of silence.
  final SilentAudio? silentAudio;

  AudioMonitoringSetting({
    this.silentAudio,
  });

  factory AudioMonitoringSetting.fromJson(Map<String, dynamic> json) {
    return AudioMonitoringSetting(
      silentAudio: json['silentAudio'] != null
          ? SilentAudio.fromJson(json['silentAudio'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final silentAudio = this.silentAudio;
    return {
      if (silentAudio != null) 'silentAudio': silentAudio,
    };
  }
}

/// Configures settings for the <code>SilentAudio</code> metric.
///
/// @nodoc
class SilentAudio {
  /// Indicates whether the <code>SilentAudio</code> metric is enabled or
  /// disabled.
  final State? state;

  /// Specifies the number of consecutive seconds of silence that triggers an
  /// event or alert.
  final int? thresholdSeconds;

  SilentAudio({
    this.state,
    this.thresholdSeconds,
  });

  factory SilentAudio.fromJson(Map<String, dynamic> json) {
    return SilentAudio(
      state: (json['state'] as String?)?.let(State.fromString),
      thresholdSeconds: json['thresholdSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final thresholdSeconds = this.thresholdSeconds;
    return {
      if (state != null) 'state': state.value,
      if (thresholdSeconds != null) 'thresholdSeconds': thresholdSeconds,
    };
  }
}

/// @nodoc
class FailoverMode {
  static const merge = FailoverMode._('MERGE');
  static const failover = FailoverMode._('FAILOVER');

  final String value;

  const FailoverMode._(this.value);

  static const values = [merge, failover];

  static FailoverMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FailoverMode._(value));

  @override
  bool operator ==(other) => other is FailoverMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The priority you want to assign to a source. You can have a primary stream
/// and a backup stream or two equally prioritized streams.
///
/// @nodoc
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

/// The settings for source failover.
///
/// @nodoc
class UpdateFailoverConfig {
  /// The type of failover you choose for this flow. MERGE combines the source
  /// streams into a single stream, allowing graceful recovery from any
  /// single-source loss. FAILOVER allows switching between different streams.
  final FailoverMode? failoverMode;

  /// Recovery window time to look for dash-7 packets.
  final int? recoveryWindow;

  /// The priority you want to assign to a source. You can have a primary stream
  /// and a backup stream or two equally prioritized streams.
  final SourcePriority? sourcePriority;

  /// The state of source failover on the flow. If the state is inactive, the flow
  /// can have only one source. If the state is active, the flow can have one or
  /// two sources.
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
      if (failoverMode != null) 'failoverMode': failoverMode.value,
      if (recoveryWindow != null) 'recoveryWindow': recoveryWindow,
      if (sourcePriority != null) 'sourcePriority': sourcePriority,
      if (state != null) 'state': state.value,
    };
  }
}

/// Update maintenance setting for a flow.
///
/// @nodoc
class UpdateMaintenance {
  /// A day of a week when the maintenance will happen.
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
      if (maintenanceDay != null) 'maintenanceDay': maintenanceDay.value,
      if (maintenanceScheduledDate != null)
        'maintenanceScheduledDate': maintenanceScheduledDate,
      if (maintenanceStartHour != null)
        'maintenanceStartHour': maintenanceStartHour,
    };
  }
}

/// Messages that provide the state of the flow.
///
/// @nodoc
class Messages {
  /// A list of errors that might have been generated from processes on this flow.
  final List<String> errors;

  Messages({
    required this.errors,
  });

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
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

/// Create a maintenance setting for a flow.
///
/// @nodoc
class AddMaintenance {
  /// A day of a week when the maintenance will happen.
  final MaintenanceDay maintenanceDay;

  /// UTC time when the maintenance will happen.
  ///
  /// Use 24-hour HH:MM format.
  ///
  /// Minutes must be 00.
  ///
  /// Example: 13:00.
  ///
  /// The default value is 02:00.
  final String maintenanceStartHour;

  AddMaintenance({
    required this.maintenanceDay,
    required this.maintenanceStartHour,
  });

  Map<String, dynamic> toJson() {
    final maintenanceDay = this.maintenanceDay;
    final maintenanceStartHour = this.maintenanceStartHour;
    return {
      'maintenanceDay': maintenanceDay.value,
      'maintenanceStartHour': maintenanceStartHour,
    };
  }
}

/// @nodoc
class DesiredState {
  static const active = DesiredState._('ACTIVE');
  static const standby = DesiredState._('STANDBY');
  static const deleted = DesiredState._('DELETED');

  final String value;

  const DesiredState._(this.value);

  static const values = [active, standby, deleted];

  static DesiredState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DesiredState._(value));

  @override
  bool operator ==(other) => other is DesiredState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The bridge's source.
///
/// @nodoc
class BridgeSource {
  /// The source of the associated flow.
  final BridgeFlowSource? flowSource;

  /// The network source for the bridge.
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

/// The source of the bridge. A flow source originates in MediaConnect as an
/// existing cloud flow.
///
/// @nodoc
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
      flowArn: (json['flowArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
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

/// The source of the bridge. A network source originates at your premises.
///
/// @nodoc
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
  /// <note>
  /// Elemental MediaConnect no longer supports the Fujitsu QoS protocol. This
  /// reference is maintained for legacy purposes only.
  /// </note>
  final Protocol protocol;

  /// The settings related to the multicast source.
  final MulticastSourceSettings? multicastSourceSettings;

  BridgeNetworkSource({
    required this.multicastIp,
    required this.name,
    required this.networkName,
    required this.port,
    required this.protocol,
    this.multicastSourceSettings,
  });

  factory BridgeNetworkSource.fromJson(Map<String, dynamic> json) {
    return BridgeNetworkSource(
      multicastIp: (json['multicastIp'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      networkName: (json['networkName'] as String?) ?? '',
      port: (json['port'] as int?) ?? 0,
      protocol: Protocol.fromString((json['protocol'] as String?) ?? ''),
      multicastSourceSettings: json['multicastSourceSettings'] != null
          ? MulticastSourceSettings.fromJson(
              json['multicastSourceSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final multicastIp = this.multicastIp;
    final name = this.name;
    final networkName = this.networkName;
    final port = this.port;
    final protocol = this.protocol;
    final multicastSourceSettings = this.multicastSourceSettings;
    return {
      'multicastIp': multicastIp,
      'name': name,
      'networkName': networkName,
      'port': port,
      'protocol': protocol.value,
      if (multicastSourceSettings != null)
        'multicastSourceSettings': multicastSourceSettings,
    };
  }
}

/// The settings related to the multicast source.
///
/// @nodoc
class MulticastSourceSettings {
  /// The IP address of the source for source-specific multicast (SSM).
  final String? multicastSourceIp;

  MulticastSourceSettings({
    this.multicastSourceIp,
  });

  factory MulticastSourceSettings.fromJson(Map<String, dynamic> json) {
    return MulticastSourceSettings(
      multicastSourceIp: json['multicastSourceIp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final multicastSourceIp = this.multicastSourceIp;
    return {
      if (multicastSourceIp != null) 'multicastSourceIp': multicastSourceIp,
    };
  }
}

/// Update the flow source of the bridge.
///
/// @nodoc
class UpdateBridgeFlowSourceRequest {
  /// The Amazon Resource Name (ARN) that identifies the MediaConnect resource
  /// from which to delete tags.
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

/// Update the network source of the bridge.
///
/// @nodoc
class UpdateBridgeNetworkSourceRequest {
  /// The network source multicast IP.
  final String? multicastIp;

  /// The settings related to the multicast source.
  final MulticastSourceSettings? multicastSourceSettings;

  /// The network source's gateway network name.
  final String? networkName;

  /// The network source port.
  final int? port;

  /// The network source protocol.
  /// <note>
  /// Elemental MediaConnect no longer supports the Fujitsu QoS protocol. This
  /// reference is maintained for legacy purposes only.
  /// </note>
  final Protocol? protocol;

  UpdateBridgeNetworkSourceRequest({
    this.multicastIp,
    this.multicastSourceSettings,
    this.networkName,
    this.port,
    this.protocol,
  });

  Map<String, dynamic> toJson() {
    final multicastIp = this.multicastIp;
    final multicastSourceSettings = this.multicastSourceSettings;
    final networkName = this.networkName;
    final port = this.port;
    final protocol = this.protocol;
    return {
      if (multicastIp != null) 'multicastIp': multicastIp,
      if (multicastSourceSettings != null)
        'multicastSourceSettings': multicastSourceSettings,
      if (networkName != null) 'networkName': networkName,
      if (port != null) 'port': port,
      if (protocol != null) 'protocol': protocol.value,
    };
  }
}

/// The output of the bridge.
///
/// @nodoc
class BridgeOutput {
  /// The output of the associated flow.
  final BridgeFlowOutput? flowOutput;

  /// The network output for the bridge.
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

/// The output of the bridge. A flow output is delivered to the Amazon Web
/// Services cloud.
///
/// @nodoc
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
      flowArn: (json['flowArn'] as String?) ?? '',
      flowSourceArn: (json['flowSourceArn'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
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

/// The output of the bridge. A network output is delivered to your premises.
///
/// @nodoc
class BridgeNetworkOutput {
  /// The network output IP address.
  final String ipAddress;

  /// The network output name.
  final String name;

  /// The network output's gateway network name.
  final String networkName;

  /// The network output's port.
  final int port;

  /// The network output protocol.
  /// <note>
  /// Elemental MediaConnect no longer supports the Fujitsu QoS protocol. This
  /// reference is maintained for legacy purposes only.
  /// </note>
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
      ipAddress: (json['ipAddress'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      networkName: (json['networkName'] as String?) ?? '',
      port: (json['port'] as int?) ?? 0,
      protocol: Protocol.fromString((json['protocol'] as String?) ?? ''),
      ttl: (json['ttl'] as int?) ?? 0,
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
      'protocol': protocol.value,
      'ttl': ttl,
    };
  }
}

/// Update an existing network output.
///
/// @nodoc
class UpdateBridgeNetworkOutputRequest {
  /// The network output IP Address.
  final String? ipAddress;

  /// The network output's gateway network name.
  final String? networkName;

  /// The network output port.
  final int? port;

  /// The network output protocol.
  /// <note>
  /// Elemental MediaConnect no longer supports the Fujitsu QoS protocol. This
  /// reference is maintained for legacy purposes only.
  /// </note>
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
      if (protocol != null) 'protocol': protocol.value,
      if (ttl != null) 'ttl': ttl,
    };
  }
}

/// Add an output to a bridge.
///
/// @nodoc
class AddBridgeSourceRequest {
  /// The source of the flow.
  final AddBridgeFlowSourceRequest? flowSource;

  /// The source of the network.
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

/// Add a flow source to an existing bridge.
///
/// @nodoc
class AddBridgeFlowSourceRequest {
  /// The Amazon Resource Number (ARN) of the flow to use as a source of this
  /// bridge.
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

/// Add a network source to an existing bridge.
///
/// @nodoc
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
  /// <note>
  /// Elemental MediaConnect no longer supports the Fujitsu QoS protocol. This
  /// reference is maintained for legacy purposes only.
  /// </note>
  final Protocol protocol;

  /// The settings related to the multicast source.
  final MulticastSourceSettings? multicastSourceSettings;

  AddBridgeNetworkSourceRequest({
    required this.multicastIp,
    required this.name,
    required this.networkName,
    required this.port,
    required this.protocol,
    this.multicastSourceSettings,
  });

  Map<String, dynamic> toJson() {
    final multicastIp = this.multicastIp;
    final name = this.name;
    final networkName = this.networkName;
    final port = this.port;
    final protocol = this.protocol;
    final multicastSourceSettings = this.multicastSourceSettings;
    return {
      'multicastIp': multicastIp,
      'name': name,
      'networkName': networkName,
      'port': port,
      'protocol': protocol.value,
      if (multicastSourceSettings != null)
        'multicastSourceSettings': multicastSourceSettings,
    };
  }
}

/// Add outputs to the specified bridge.
///
/// @nodoc
class AddBridgeOutputRequest {
  /// The network output of the bridge. A network output is delivered to your
  /// premises.
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

/// Add a network output to an existing bridge.
///
/// @nodoc
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
  /// <note>
  /// Elemental MediaConnect no longer supports the Fujitsu QoS protocol. This
  /// reference is maintained for legacy purposes only.
  /// </note>
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
      'protocol': protocol.value,
      'ttl': ttl,
    };
  }
}

/// Displays details of the selected bridge.
///
/// @nodoc
class ListedBridge {
  /// The ARN of the bridge.
  final String bridgeArn;

  /// The state of the bridge.
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
      bridgeArn: (json['bridgeArn'] as String?) ?? '',
      bridgeState:
          BridgeState.fromString((json['bridgeState'] as String?) ?? ''),
      bridgeType: (json['bridgeType'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      placementArn: (json['placementArn'] as String?) ?? '',
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
      'bridgeState': bridgeState.value,
      'bridgeType': bridgeType,
      'name': name,
      'placementArn': placementArn,
    };
  }
}

/// @nodoc
class BridgeState {
  static const creating = BridgeState._('CREATING');
  static const standby = BridgeState._('STANDBY');
  static const starting = BridgeState._('STARTING');
  static const deploying = BridgeState._('DEPLOYING');
  static const active = BridgeState._('ACTIVE');
  static const stopping = BridgeState._('STOPPING');
  static const deleting = BridgeState._('DELETING');
  static const deleted = BridgeState._('DELETED');
  static const startFailed = BridgeState._('START_FAILED');
  static const startPending = BridgeState._('START_PENDING');
  static const stopFailed = BridgeState._('STOP_FAILED');
  static const updating = BridgeState._('UPDATING');

  final String value;

  const BridgeState._(this.value);

  static const values = [
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
    updating
  ];

  static BridgeState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => BridgeState._(value));

  @override
  bool operator ==(other) => other is BridgeState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A Bridge is the connection between your data center's Instances and the
/// Amazon Web Services cloud. A bridge can be used to send video from the
/// Amazon Web Services cloud to your data center or from your data center to
/// the Amazon Web Services cloud.
///
/// @nodoc
class Bridge {
  /// The Amazon Resource Number (ARN) of the bridge.
  final String bridgeArn;

  /// The state of the bridge.
  final BridgeState bridgeState;

  /// The name of the bridge.
  final String name;

  /// The placement Amazon Resource Number (ARN) of the bridge.
  final String placementArn;

  /// Messages with details about the bridge.
  final List<MessageDetail>? bridgeMessages;

  /// An egress bridge is a cloud-to-ground bridge. The content comes from an
  /// existing MediaConnect flow and is delivered to your premises.
  final EgressGatewayBridge? egressGatewayBridge;

  /// An ingress bridge is a ground-to-cloud bridge. The content originates at
  /// your premises and is delivered to the cloud.
  final IngressGatewayBridge? ingressGatewayBridge;

  /// The outputs on this bridge.
  final List<BridgeOutput>? outputs;

  /// The settings for source failover.
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
      bridgeArn: (json['bridgeArn'] as String?) ?? '',
      bridgeState:
          BridgeState.fromString((json['bridgeState'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      placementArn: (json['placementArn'] as String?) ?? '',
      bridgeMessages: (json['bridgeMessages'] as List?)
          ?.nonNulls
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
          ?.nonNulls
          .map((e) => BridgeOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceFailoverConfig: json['sourceFailoverConfig'] != null
          ? FailoverConfig.fromJson(
              json['sourceFailoverConfig'] as Map<String, dynamic>)
          : null,
      sources: (json['sources'] as List?)
          ?.nonNulls
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
      'bridgeState': bridgeState.value,
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

/// Create a bridge with the egress bridge type. An egress bridge is a
/// cloud-to-ground bridge. The content comes from an existing MediaConnect flow
/// and is delivered to your premises.
///
/// @nodoc
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
      maxBitrate: (json['maxBitrate'] as int?) ?? 0,
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

/// Create a bridge with the ingress bridge type. An ingress bridge is a
/// ground-to-cloud bridge. The content originates at your premises and is
/// delivered to the cloud.
///
/// @nodoc
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
      maxBitrate: (json['maxBitrate'] as int?) ?? 0,
      maxOutputs: (json['maxOutputs'] as int?) ?? 0,
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

/// Update an existing egress-type bridge.
///
/// @nodoc
class UpdateEgressGatewayBridgeRequest {
  /// The maximum expected bitrate (in bps).
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

/// Update an existing ingress-type bridge.
///
/// @nodoc
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

/// Create a bridge with the egress bridge type. An egress bridge is a
/// cloud-to-ground bridge. The content comes from an existing MediaConnect flow
/// and is delivered to your premises.
///
/// @nodoc
class AddEgressGatewayBridgeRequest {
  /// The maximum expected bitrate (in bps) of the egress bridge.
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

/// Create a bridge with the ingress bridge type. An ingress bridge is a
/// ground-to-cloud bridge. The content originates at your premises and is
/// delivered to the cloud.
///
/// @nodoc
class AddIngressGatewayBridgeRequest {
  /// The maximum expected bitrate (in bps) of the ingress bridge.
  final int maxBitrate;

  /// The maximum number of expected outputs on the ingress bridge.
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

/// An entitlement that has been granted to you from other Amazon Web Services
/// accounts.
///
/// @nodoc
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
      entitlementArn: (json['entitlementArn'] as String?) ?? '',
      entitlementName: (json['entitlementName'] as String?) ?? '',
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

/// @nodoc
class AddFlowOutputs420Exception extends _s.GenericAwsException {
  AddFlowOutputs420Exception({String? type, String? message})
      : super(type: type, code: 'AddFlowOutputs420Exception', message: message);
}

/// @nodoc
class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class CreateBridge420Exception extends _s.GenericAwsException {
  CreateBridge420Exception({String? type, String? message})
      : super(type: type, code: 'CreateBridge420Exception', message: message);
}

/// @nodoc
class CreateFlow420Exception extends _s.GenericAwsException {
  CreateFlow420Exception({String? type, String? message})
      : super(type: type, code: 'CreateFlow420Exception', message: message);
}

/// @nodoc
class CreateGateway420Exception extends _s.GenericAwsException {
  CreateGateway420Exception({String? type, String? message})
      : super(type: type, code: 'CreateGateway420Exception', message: message);
}

/// @nodoc
class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

/// @nodoc
class GrantFlowEntitlements420Exception extends _s.GenericAwsException {
  GrantFlowEntitlements420Exception({String? type, String? message})
      : super(
            type: type,
            code: 'GrantFlowEntitlements420Exception',
            message: message);
}

/// @nodoc
class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

/// @nodoc
class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

/// @nodoc
class RouterInputServiceQuotaExceededException extends _s.GenericAwsException {
  RouterInputServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'RouterInputServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class RouterNetworkInterfaceServiceQuotaExceededException
    extends _s.GenericAwsException {
  RouterNetworkInterfaceServiceQuotaExceededException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'RouterNetworkInterfaceServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class RouterOutputServiceQuotaExceededException extends _s.GenericAwsException {
  RouterOutputServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'RouterOutputServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

/// @nodoc
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
  'RouterInputServiceQuotaExceededException': (type, message) =>
      RouterInputServiceQuotaExceededException(type: type, message: message),
  'RouterNetworkInterfaceServiceQuotaExceededException': (type, message) =>
      RouterNetworkInterfaceServiceQuotaExceededException(
          type: type, message: message),
  'RouterOutputServiceQuotaExceededException': (type, message) =>
      RouterOutputServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
