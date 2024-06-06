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

/// Amazon Web Services Private 5G is a managed service that makes it easy to
/// deploy, operate, and scale your own private mobile network at your
/// on-premises location. Private 5G provides the pre-configured hardware and
/// software for mobile networks, helps automate setup, and scales capacity on
/// demand to support additional devices as needed.
class Private5G {
  final _s.RestJsonProtocol _protocol;
  Private5G({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'private-networks',
            signingName: 'private-networks',
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

  /// Acknowledges that the specified network order was received.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [orderArn] :
  /// The Amazon Resource Name (ARN) of the order.
  Future<AcknowledgeOrderReceiptResponse> acknowledgeOrderReceipt({
    required String orderArn,
  }) async {
    final $payload = <String, dynamic>{
      'orderArn': orderArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/orders/acknowledge',
      exceptionFnMap: _exceptionFns,
    );
    return AcknowledgeOrderReceiptResponse.fromJson(response);
  }

  /// Activates the specified device identifier.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceIdentifierArn] :
  /// The Amazon Resource Name (ARN) of the device identifier.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How
  /// to ensure idempotency</a>.
  Future<ActivateDeviceIdentifierResponse> activateDeviceIdentifier({
    required String deviceIdentifierArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'deviceIdentifierArn': deviceIdentifierArn,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/device-identifiers/activate',
      exceptionFnMap: _exceptionFns,
    );
    return ActivateDeviceIdentifierResponse.fromJson(response);
  }

  /// Activates the specified network site.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkSiteArn] :
  /// The Amazon Resource Name (ARN) of the network site.
  ///
  /// Parameter [shippingAddress] :
  /// The shipping address of the network site.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How
  /// to ensure idempotency</a>.
  ///
  /// Parameter [commitmentConfiguration] :
  /// Determines the duration and renewal status of the commitment period for
  /// all pending radio units.
  ///
  /// If you include <code>commitmentConfiguration</code> in the
  /// <code>ActivateNetworkSiteRequest</code> action, you must specify the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// The commitment period for the radio unit. You can choose a 60-day, 1-year,
  /// or 3-year period.
  /// </li>
  /// <li>
  /// Whether you want your commitment period to automatically renew for one
  /// more year after your current commitment period expires.
  /// </li>
  /// </ul>
  /// For pricing, see <a href="http://aws.amazon.com/private5g/pricing">Amazon
  /// Web Services Private 5G Pricing</a>.
  ///
  /// If you do not include <code>commitmentConfiguration</code> in the
  /// <code>ActivateNetworkSiteRequest</code> action, the commitment period is
  /// set to 60-days.
  Future<ActivateNetworkSiteResponse> activateNetworkSite({
    required String networkSiteArn,
    required Address shippingAddress,
    String? clientToken,
    CommitmentConfiguration? commitmentConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'networkSiteArn': networkSiteArn,
      'shippingAddress': shippingAddress,
      if (clientToken != null) 'clientToken': clientToken,
      if (commitmentConfiguration != null)
        'commitmentConfiguration': commitmentConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/network-sites/activate',
      exceptionFnMap: _exceptionFns,
    );
    return ActivateNetworkSiteResponse.fromJson(response);
  }

  /// Configures the specified network resource.
  ///
  /// Use this action to specify the geographic position of the hardware. You
  /// must provide Certified Professional Installer (CPI) credentials in the
  /// request so that we can obtain spectrum grants. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/private-networks/latest/userguide/radio-units.html">Radio
  /// units</a> in the <i>Amazon Web Services Private 5G User Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [accessPointArn] :
  /// The Amazon Resource Name (ARN) of the network resource.
  ///
  /// Parameter [cpiSecretKey] :
  /// A Base64 encoded string of the CPI certificate associated with the CPI
  /// user who is certifying the coordinates of the network resource.
  ///
  /// Parameter [cpiUserId] :
  /// The CPI user ID of the CPI user who is certifying the coordinates of the
  /// network resource.
  ///
  /// Parameter [cpiUserPassword] :
  /// The CPI password associated with the CPI certificate in
  /// <code>cpiSecretKey</code>.
  ///
  /// Parameter [cpiUsername] :
  /// The CPI user name of the CPI user who is certifying the coordinates of the
  /// radio unit.
  ///
  /// Parameter [position] :
  /// The position of the network resource.
  Future<ConfigureAccessPointResponse> configureAccessPoint({
    required String accessPointArn,
    String? cpiSecretKey,
    String? cpiUserId,
    String? cpiUserPassword,
    String? cpiUsername,
    Position? position,
  }) async {
    final $payload = <String, dynamic>{
      'accessPointArn': accessPointArn,
      if (cpiSecretKey != null) 'cpiSecretKey': cpiSecretKey,
      if (cpiUserId != null) 'cpiUserId': cpiUserId,
      if (cpiUserPassword != null) 'cpiUserPassword': cpiUserPassword,
      if (cpiUsername != null) 'cpiUsername': cpiUsername,
      if (position != null) 'position': position,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/network-resources/configure',
      exceptionFnMap: _exceptionFns,
    );
    return ConfigureAccessPointResponse.fromJson(response);
  }

  /// Creates a network.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkName] :
  /// The name of the network. You can't change the name after you create the
  /// network.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How
  /// to ensure idempotency</a>.
  ///
  /// Parameter [description] :
  /// The description of the network.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the network.
  Future<CreateNetworkResponse> createNetwork({
    required String networkName,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'networkName': networkName,
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/networks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNetworkResponse.fromJson(response);
  }

  /// Creates a network site.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkArn] :
  /// The Amazon Resource Name (ARN) of the network.
  ///
  /// Parameter [networkSiteName] :
  /// The name of the site. You can't change the name after you create the site.
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone that is the parent of this site. You can't change
  /// the Availability Zone after you create the site.
  ///
  /// Parameter [availabilityZoneId] :
  /// The ID of the Availability Zone that is the parent of this site. You can't
  /// change the Availability Zone after you create the site.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How
  /// to ensure idempotency</a>.
  ///
  /// Parameter [description] :
  /// The description of the site.
  ///
  /// Parameter [pendingPlan] :
  /// Information about the pending plan for this site.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the network site.
  Future<CreateNetworkSiteResponse> createNetworkSite({
    required String networkArn,
    required String networkSiteName,
    String? availabilityZone,
    String? availabilityZoneId,
    String? clientToken,
    String? description,
    SitePlan? pendingPlan,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'networkArn': networkArn,
      'networkSiteName': networkSiteName,
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
      if (pendingPlan != null) 'pendingPlan': pendingPlan,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/network-sites',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNetworkSiteResponse.fromJson(response);
  }

  /// Deactivates the specified device identifier.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceIdentifierArn] :
  /// The Amazon Resource Name (ARN) of the device identifier.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How
  /// to ensure idempotency</a>.
  Future<DeactivateDeviceIdentifierResponse> deactivateDeviceIdentifier({
    required String deviceIdentifierArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'deviceIdentifierArn': deviceIdentifierArn,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/device-identifiers/deactivate',
      exceptionFnMap: _exceptionFns,
    );
    return DeactivateDeviceIdentifierResponse.fromJson(response);
  }

  /// Deletes the specified network. You must delete network sites before you
  /// delete the network. For more information, see <a
  /// href="https://docs.aws.amazon.com/private-networks/latest/APIReference/API_DeleteNetworkSite.html">DeleteNetworkSite</a>
  /// in the <i>API Reference for Amazon Web Services Private 5G</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkArn] :
  /// The Amazon Resource Name (ARN) of the network.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How
  /// to ensure idempotency</a>.
  Future<DeleteNetworkResponse> deleteNetwork({
    required String networkArn,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/networks/${Uri.encodeComponent(networkArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteNetworkResponse.fromJson(response);
  }

  /// Deletes the specified network site. Return the hardware after you delete
  /// the network site. You are responsible for minimum charges. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/private-networks/latest/userguide/hardware-maintenance.html">Hardware
  /// returns</a> in the <i>Amazon Web Services Private 5G User Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkSiteArn] :
  /// The Amazon Resource Name (ARN) of the network site.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How
  /// to ensure idempotency</a>.
  Future<DeleteNetworkSiteResponse> deleteNetworkSite({
    required String networkSiteArn,
    String? clientToken,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/network-sites/${Uri.encodeComponent(networkSiteArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteNetworkSiteResponse.fromJson(response);
  }

  /// Gets the specified device identifier.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceIdentifierArn] :
  /// The Amazon Resource Name (ARN) of the device identifier.
  Future<GetDeviceIdentifierResponse> getDeviceIdentifier({
    required String deviceIdentifierArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/device-identifiers/${Uri.encodeComponent(deviceIdentifierArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeviceIdentifierResponse.fromJson(response);
  }

  /// Gets the specified network.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkArn] :
  /// The Amazon Resource Name (ARN) of the network.
  Future<GetNetworkResponse> getNetwork({
    required String networkArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/networks/${Uri.encodeComponent(networkArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkResponse.fromJson(response);
  }

  /// Gets the specified network resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkResourceArn] :
  /// The Amazon Resource Name (ARN) of the network resource.
  Future<GetNetworkResourceResponse> getNetworkResource({
    required String networkResourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/network-resources/${Uri.encodeComponent(networkResourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkResourceResponse.fromJson(response);
  }

  /// Gets the specified network site.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkSiteArn] :
  /// The Amazon Resource Name (ARN) of the network site.
  Future<GetNetworkSiteResponse> getNetworkSite({
    required String networkSiteArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/network-sites/${Uri.encodeComponent(networkSiteArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkSiteResponse.fromJson(response);
  }

  /// Gets the specified order.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [orderArn] :
  /// The Amazon Resource Name (ARN) of the order.
  Future<GetOrderResponse> getOrder({
    required String orderArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/orders/${Uri.encodeComponent(orderArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOrderResponse.fromJson(response);
  }

  /// Lists device identifiers. Add filters to your request to return a more
  /// specific list of results. Use filters to match the Amazon Resource Name
  /// (ARN) of an order, the status of device identifiers, or the ARN of the
  /// traffic group.
  ///
  /// If you specify multiple filters, filters are joined with an OR, and the
  /// request returns results that match all of the specified filters.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkArn] :
  /// The Amazon Resource Name (ARN) of the network.
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// <ul>
  /// <li>
  /// <code>ORDER</code> - The Amazon Resource Name (ARN) of the order.
  /// </li>
  /// <li>
  /// <code>STATUS</code> - The status (<code>ACTIVE</code> |
  /// <code>INACTIVE</code>).
  /// </li>
  /// <li>
  /// <code>TRAFFIC_GROUP</code> - The Amazon Resource Name (ARN) of the traffic
  /// group.
  /// </li>
  /// </ul>
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [startToken] :
  /// The token for the next page of results.
  Future<ListDeviceIdentifiersResponse> listDeviceIdentifiers({
    required String networkArn,
    Map<DeviceIdentifierFilterKeys, List<String>>? filters,
    int? maxResults,
    String? startToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $payload = <String, dynamic>{
      'networkArn': networkArn,
      if (filters != null)
        'filters': filters.map((k, e) => MapEntry(k.toValue(), e)),
      if (maxResults != null) 'maxResults': maxResults,
      if (startToken != null) 'startToken': startToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/device-identifiers/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListDeviceIdentifiersResponse.fromJson(response);
  }

  /// Lists network resources. Add filters to your request to return a more
  /// specific list of results. Use filters to match the Amazon Resource Name
  /// (ARN) of an order or the status of network resources.
  ///
  /// If you specify multiple filters, filters are joined with an OR, and the
  /// request returns results that match all of the specified filters.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkArn] :
  /// The Amazon Resource Name (ARN) of the network.
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// <ul>
  /// <li>
  /// <code>ORDER</code> - The Amazon Resource Name (ARN) of the order.
  /// </li>
  /// <li>
  /// <code>STATUS</code> - The status (<code>AVAILABLE</code> |
  /// <code>DELETED</code> | <code>DELETING</code> | <code>PENDING</code> |
  /// <code>PENDING_RETURN</code> | <code>PROVISIONING</code> |
  /// <code>SHIPPED</code>).
  /// </li>
  /// </ul>
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [startToken] :
  /// The token for the next page of results.
  Future<ListNetworkResourcesResponse> listNetworkResources({
    required String networkArn,
    Map<NetworkResourceFilterKeys, List<String>>? filters,
    int? maxResults,
    String? startToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $payload = <String, dynamic>{
      'networkArn': networkArn,
      if (filters != null)
        'filters': filters.map((k, e) => MapEntry(k.toValue(), e)),
      if (maxResults != null) 'maxResults': maxResults,
      if (startToken != null) 'startToken': startToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/network-resources',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkResourcesResponse.fromJson(response);
  }

  /// Lists network sites. Add filters to your request to return a more specific
  /// list of results. Use filters to match the status of the network site.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkArn] :
  /// The Amazon Resource Name (ARN) of the network.
  ///
  /// Parameter [filters] :
  /// The filters. Add filters to your request to return a more specific list of
  /// results. Use filters to match the status of the network sites.
  ///
  /// <ul>
  /// <li>
  /// <code>STATUS</code> - The status (<code>AVAILABLE</code> |
  /// <code>CREATED</code> | <code>DELETED</code> | <code>DEPROVISIONING</code>
  /// | <code>PROVISIONING</code>).
  /// </li>
  /// </ul>
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [startToken] :
  /// The token for the next page of results.
  Future<ListNetworkSitesResponse> listNetworkSites({
    required String networkArn,
    Map<NetworkSiteFilterKeys, List<String>>? filters,
    int? maxResults,
    String? startToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $payload = <String, dynamic>{
      'networkArn': networkArn,
      if (filters != null)
        'filters': filters.map((k, e) => MapEntry(k.toValue(), e)),
      if (maxResults != null) 'maxResults': maxResults,
      if (startToken != null) 'startToken': startToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/network-sites/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkSitesResponse.fromJson(response);
  }

  /// Lists networks. Add filters to your request to return a more specific list
  /// of results. Use filters to match the status of the network.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// <ul>
  /// <li>
  /// <code>STATUS</code> - The status (<code>AVAILABLE</code> |
  /// <code>CREATED</code> | <code>DELETED</code> | <code>DEPROVISIONING</code>
  /// | <code>PROVISIONING</code>).
  /// </li>
  /// </ul>
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [startToken] :
  /// The token for the next page of results.
  Future<ListNetworksResponse> listNetworks({
    Map<NetworkFilterKeys, List<String>>? filters,
    int? maxResults,
    String? startToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $payload = <String, dynamic>{
      if (filters != null)
        'filters': filters.map((k, e) => MapEntry(k.toValue(), e)),
      if (maxResults != null) 'maxResults': maxResults,
      if (startToken != null) 'startToken': startToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/networks/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworksResponse.fromJson(response);
  }

  /// Lists orders. Add filters to your request to return a more specific list
  /// of results. Use filters to match the Amazon Resource Name (ARN) of the
  /// network site or the status of the order.
  ///
  /// If you specify multiple filters, filters are joined with an OR, and the
  /// request returns results that match all of the specified filters.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkArn] :
  /// The Amazon Resource Name (ARN) of the network.
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// <ul>
  /// <li>
  /// <code>NETWORK_SITE</code> - The Amazon Resource Name (ARN) of the network
  /// site.
  /// </li>
  /// <li>
  /// <code>STATUS</code> - The status (<code>ACKNOWLEDGING</code> |
  /// <code>ACKNOWLEDGED</code> | <code>UNACKNOWLEDGED</code>).
  /// </li>
  /// </ul>
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [startToken] :
  /// The token for the next page of results.
  Future<ListOrdersResponse> listOrders({
    required String networkArn,
    Map<OrderFilterKeys, List<String>>? filters,
    int? maxResults,
    String? startToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $payload = <String, dynamic>{
      'networkArn': networkArn,
      if (filters != null)
        'filters': filters.map((k, e) => MapEntry(k.toValue(), e)),
      if (maxResults != null) 'maxResults': maxResults,
      if (startToken != null) 'startToken': startToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/orders/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListOrdersResponse.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Checks the health of the service.
  ///
  /// May throw [InternalServerException].
  Future<PingResponse> ping() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/ping',
      exceptionFnMap: _exceptionFns,
    );
    return PingResponse.fromJson(response);
  }

  /// Use this action to do the following tasks:
  ///
  /// <ul>
  /// <li>
  /// Update the duration and renewal status of the commitment period for a
  /// radio unit. The update goes into effect immediately.
  /// </li>
  /// <li>
  /// Request a replacement for a network resource.
  /// </li>
  /// <li>
  /// Request that you return a network resource.
  /// </li>
  /// </ul>
  /// After you submit a request to replace or return a network resource, the
  /// status of the network resource changes to
  /// <code>CREATING_SHIPPING_LABEL</code>. The shipping label is available when
  /// the status of the network resource is <code>PENDING_RETURN</code>. After
  /// the network resource is successfully returned, its status changes to
  /// <code>DELETED</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/private-networks/latest/userguide/radio-units.html#return-radio-unit">Return
  /// a radio unit</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkResourceArn] :
  /// The Amazon Resource Name (ARN) of the network resource.
  ///
  /// Parameter [updateType] :
  /// The update type.
  ///
  /// <ul>
  /// <li>
  /// <code>REPLACE</code> - Submits a request to replace a defective radio
  /// unit. We provide a shipping label that you can use for the return process
  /// and we ship a replacement radio unit to you.
  /// </li>
  /// <li>
  /// <code>RETURN</code> - Submits a request to return a radio unit that you no
  /// longer need. We provide a shipping label that you can use for the return
  /// process.
  /// </li>
  /// <li>
  /// <code>COMMITMENT</code> - Submits a request to change or renew the
  /// commitment period. If you choose this value, then you must set <a
  /// href="https://docs.aws.amazon.com/private-networks/latest/APIReference/API_StartNetworkResourceUpdate.html#privatenetworks-StartNetworkResourceUpdate-request-commitmentConfiguration">
  /// <code>commitmentConfiguration</code> </a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [commitmentConfiguration] :
  /// Use this action to extend and automatically renew the commitment period
  /// for the radio unit. You can do the following:
  ///
  /// <ul>
  /// <li>
  /// Change a 60-day commitment to a 1-year or 3-year commitment. The change is
  /// immediate and the hourly rate decreases to the rate for the new commitment
  /// period.
  /// </li>
  /// <li>
  /// Change a 1-year commitment to a 3-year commitment. The change is immediate
  /// and the hourly rate decreases to the rate for the 3-year commitment
  /// period.
  /// </li>
  /// <li>
  /// Set a 1-year commitment to automatically renew for an additional 1 year.
  /// The hourly rate for the additional year will continue to be the same as
  /// your existing 1-year rate.
  /// </li>
  /// <li>
  /// Set a 3-year commitment to automatically renew for an additional 1 year.
  /// The hourly rate for the additional year will continue to be the same as
  /// your existing 3-year rate.
  /// </li>
  /// <li>
  /// Turn off a previously-enabled automatic renewal on a 1-year or 3-year
  /// commitment. You cannot use the automatic-renewal option for a 60-day
  /// commitment.
  /// </li>
  /// </ul>
  /// For pricing, see <a href="http://aws.amazon.com/private5g/pricing">Amazon
  /// Web Services Private 5G Pricing</a>.
  ///
  /// Parameter [returnReason] :
  /// The reason for the return. Providing a reason for a return is optional.
  ///
  /// Parameter [shippingAddress] :
  /// The shipping address. If you don't provide a shipping address when
  /// replacing or returning a network resource, we use the address from the
  /// original order for the network resource.
  Future<StartNetworkResourceUpdateResponse> startNetworkResourceUpdate({
    required String networkResourceArn,
    required UpdateType updateType,
    CommitmentConfiguration? commitmentConfiguration,
    String? returnReason,
    Address? shippingAddress,
  }) async {
    final $payload = <String, dynamic>{
      'networkResourceArn': networkResourceArn,
      'updateType': updateType.toValue(),
      if (commitmentConfiguration != null)
        'commitmentConfiguration': commitmentConfiguration,
      if (returnReason != null) 'returnReason': returnReason,
      if (shippingAddress != null) 'shippingAddress': shippingAddress,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/network-resources/update',
      exceptionFnMap: _exceptionFns,
    );
    return StartNetworkResourceUpdateResponse.fromJson(response);
  }

  /// Adds tags to the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
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

  /// Updates the specified network site.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkSiteArn] :
  /// The Amazon Resource Name (ARN) of the network site.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How
  /// to ensure idempotency</a>.
  ///
  /// Parameter [description] :
  /// The description.
  Future<UpdateNetworkSiteResponse> updateNetworkSite({
    required String networkSiteArn,
    String? clientToken,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'networkSiteArn': networkSiteArn,
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/network-sites/site',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateNetworkSiteResponse.fromJson(response);
  }

  /// Updates the specified network site plan.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [networkSiteArn] :
  /// The Amazon Resource Name (ARN) of the network site.
  ///
  /// Parameter [pendingPlan] :
  /// The pending plan.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Run_Instance_Idempotency.html">How
  /// to ensure idempotency</a>.
  Future<UpdateNetworkSiteResponse> updateNetworkSitePlan({
    required String networkSiteArn,
    required SitePlan pendingPlan,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'networkSiteArn': networkSiteArn,
      'pendingPlan': pendingPlan,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/network-sites/plan',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateNetworkSiteResponse.fromJson(response);
  }
}

class AcknowledgeOrderReceiptResponse {
  /// Information about the order.
  final Order order;

  AcknowledgeOrderReceiptResponse({
    required this.order,
  });

  factory AcknowledgeOrderReceiptResponse.fromJson(Map<String, dynamic> json) {
    return AcknowledgeOrderReceiptResponse(
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final order = this.order;
    return {
      'order': order,
    };
  }
}

enum AcknowledgmentStatus {
  acknowledging,
  acknowledged,
  unacknowledged,
}

extension AcknowledgmentStatusValueExtension on AcknowledgmentStatus {
  String toValue() {
    switch (this) {
      case AcknowledgmentStatus.acknowledging:
        return 'ACKNOWLEDGING';
      case AcknowledgmentStatus.acknowledged:
        return 'ACKNOWLEDGED';
      case AcknowledgmentStatus.unacknowledged:
        return 'UNACKNOWLEDGED';
    }
  }
}

extension AcknowledgmentStatusFromString on String {
  AcknowledgmentStatus toAcknowledgmentStatus() {
    switch (this) {
      case 'ACKNOWLEDGING':
        return AcknowledgmentStatus.acknowledging;
      case 'ACKNOWLEDGED':
        return AcknowledgmentStatus.acknowledged;
      case 'UNACKNOWLEDGED':
        return AcknowledgmentStatus.unacknowledged;
    }
    throw Exception('$this is not known in enum AcknowledgmentStatus');
  }
}

class ActivateDeviceIdentifierResponse {
  /// Information about the device identifier.
  final DeviceIdentifier deviceIdentifier;

  /// The tags on the device identifier.
  final Map<String, String>? tags;

  ActivateDeviceIdentifierResponse({
    required this.deviceIdentifier,
    this.tags,
  });

  factory ActivateDeviceIdentifierResponse.fromJson(Map<String, dynamic> json) {
    return ActivateDeviceIdentifierResponse(
      deviceIdentifier: DeviceIdentifier.fromJson(
          json['deviceIdentifier'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceIdentifier = this.deviceIdentifier;
    final tags = this.tags;
    return {
      'deviceIdentifier': deviceIdentifier,
      if (tags != null) 'tags': tags,
    };
  }
}

class ActivateNetworkSiteResponse {
  /// Information about the network site.
  final NetworkSite? networkSite;

  ActivateNetworkSiteResponse({
    this.networkSite,
  });

  factory ActivateNetworkSiteResponse.fromJson(Map<String, dynamic> json) {
    return ActivateNetworkSiteResponse(
      networkSite: json['networkSite'] != null
          ? NetworkSite.fromJson(json['networkSite'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final networkSite = this.networkSite;
    return {
      if (networkSite != null) 'networkSite': networkSite,
    };
  }
}

/// Information about an address.
class Address {
  /// The city for this address.
  final String city;

  /// The country for this address.
  final String country;

  /// The recipient's name for this address.
  final String name;

  /// The postal code for this address.
  final String postalCode;

  /// The state or province for this address.
  final String stateOrProvince;

  /// The first line of the street address.
  final String street1;

  /// The company name for this address.
  final String? company;

  /// The recipient's email address.
  final String? emailAddress;

  /// The recipient's phone number.
  final String? phoneNumber;

  /// The second line of the street address.
  final String? street2;

  /// The third line of the street address.
  final String? street3;

  Address({
    required this.city,
    required this.country,
    required this.name,
    required this.postalCode,
    required this.stateOrProvince,
    required this.street1,
    this.company,
    this.emailAddress,
    this.phoneNumber,
    this.street2,
    this.street3,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'] as String,
      country: json['country'] as String,
      name: json['name'] as String,
      postalCode: json['postalCode'] as String,
      stateOrProvince: json['stateOrProvince'] as String,
      street1: json['street1'] as String,
      company: json['company'] as String?,
      emailAddress: json['emailAddress'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      street2: json['street2'] as String?,
      street3: json['street3'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final city = this.city;
    final country = this.country;
    final name = this.name;
    final postalCode = this.postalCode;
    final stateOrProvince = this.stateOrProvince;
    final street1 = this.street1;
    final company = this.company;
    final emailAddress = this.emailAddress;
    final phoneNumber = this.phoneNumber;
    final street2 = this.street2;
    final street3 = this.street3;
    return {
      'city': city,
      'country': country,
      'name': name,
      'postalCode': postalCode,
      'stateOrProvince': stateOrProvince,
      'street1': street1,
      if (company != null) 'company': company,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (street2 != null) 'street2': street2,
      if (street3 != null) 'street3': street3,
    };
  }
}

/// Determines the duration and renewal status of the commitment period for a
/// radio unit.
///
/// For pricing, see <a href="http://aws.amazon.com/private5g/pricing">Amazon
/// Web Services Private 5G Pricing</a>.
class CommitmentConfiguration {
  /// Determines whether the commitment period for a radio unit is set to
  /// automatically renew for an additional 1 year after your current commitment
  /// period expires.
  ///
  /// Set to <code>True</code>, if you want your commitment period to
  /// automatically renew. Set to <code>False</code> if you do not want your
  /// commitment to automatically renew.
  ///
  /// You can do the following:
  ///
  /// <ul>
  /// <li>
  /// Set a 1-year commitment to automatically renew for an additional 1 year. The
  /// hourly rate for the additional year will continue to be the same as your
  /// existing 1-year rate.
  /// </li>
  /// <li>
  /// Set a 3-year commitment to automatically renew for an additional 1 year. The
  /// hourly rate for the additional year will continue to be the same as your
  /// existing 3-year rate.
  /// </li>
  /// <li>
  /// Turn off a previously-enabled automatic renewal on a 1-year or 3-year
  /// commitment.
  /// </li>
  /// </ul>
  /// You cannot use the automatic-renewal option for a 60-day commitment.
  final bool automaticRenewal;

  /// The duration of the commitment period for the radio unit. You can choose a
  /// 60-day, 1-year, or 3-year period.
  final CommitmentLength commitmentLength;

  CommitmentConfiguration({
    required this.automaticRenewal,
    required this.commitmentLength,
  });

  factory CommitmentConfiguration.fromJson(Map<String, dynamic> json) {
    return CommitmentConfiguration(
      automaticRenewal: json['automaticRenewal'] as bool,
      commitmentLength:
          (json['commitmentLength'] as String).toCommitmentLength(),
    );
  }

  Map<String, dynamic> toJson() {
    final automaticRenewal = this.automaticRenewal;
    final commitmentLength = this.commitmentLength;
    return {
      'automaticRenewal': automaticRenewal,
      'commitmentLength': commitmentLength.toValue(),
    };
  }
}

/// Shows the duration, the date and time that the contract started and ends,
/// and the renewal status of the commitment period for the radio unit.
class CommitmentInformation {
  /// The duration and renewal status of the commitment period for the radio unit.
  final CommitmentConfiguration commitmentConfiguration;

  /// The date and time that the commitment period ends. If you do not cancel or
  /// renew the commitment before the expiration date, you will be billed at the
  /// 60-day-commitment rate.
  final DateTime? expiresOn;

  /// The date and time that the commitment period started.
  final DateTime? startAt;

  CommitmentInformation({
    required this.commitmentConfiguration,
    this.expiresOn,
    this.startAt,
  });

  factory CommitmentInformation.fromJson(Map<String, dynamic> json) {
    return CommitmentInformation(
      commitmentConfiguration: CommitmentConfiguration.fromJson(
          json['commitmentConfiguration'] as Map<String, dynamic>),
      expiresOn: timeStampFromJson(json['expiresOn']),
      startAt: timeStampFromJson(json['startAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final commitmentConfiguration = this.commitmentConfiguration;
    final expiresOn = this.expiresOn;
    final startAt = this.startAt;
    return {
      'commitmentConfiguration': commitmentConfiguration,
      if (expiresOn != null) 'expiresOn': iso8601ToJson(expiresOn),
      if (startAt != null) 'startAt': iso8601ToJson(startAt),
    };
  }
}

enum CommitmentLength {
  sixtyDays,
  oneYear,
  threeYears,
}

extension CommitmentLengthValueExtension on CommitmentLength {
  String toValue() {
    switch (this) {
      case CommitmentLength.sixtyDays:
        return 'SIXTY_DAYS';
      case CommitmentLength.oneYear:
        return 'ONE_YEAR';
      case CommitmentLength.threeYears:
        return 'THREE_YEARS';
    }
  }
}

extension CommitmentLengthFromString on String {
  CommitmentLength toCommitmentLength() {
    switch (this) {
      case 'SIXTY_DAYS':
        return CommitmentLength.sixtyDays;
      case 'ONE_YEAR':
        return CommitmentLength.oneYear;
      case 'THREE_YEARS':
        return CommitmentLength.threeYears;
    }
    throw Exception('$this is not known in enum CommitmentLength');
  }
}

class ConfigureAccessPointResponse {
  /// Information about the network resource.
  final NetworkResource accessPoint;

  ConfigureAccessPointResponse({
    required this.accessPoint,
  });

  factory ConfigureAccessPointResponse.fromJson(Map<String, dynamic> json) {
    return ConfigureAccessPointResponse(
      accessPoint:
          NetworkResource.fromJson(json['accessPoint'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final accessPoint = this.accessPoint;
    return {
      'accessPoint': accessPoint,
    };
  }
}

class CreateNetworkResponse {
  /// Information about the network.
  final Network network;

  /// The network tags.
  final Map<String, String>? tags;

  CreateNetworkResponse({
    required this.network,
    this.tags,
  });

  factory CreateNetworkResponse.fromJson(Map<String, dynamic> json) {
    return CreateNetworkResponse(
      network: Network.fromJson(json['network'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final network = this.network;
    final tags = this.tags;
    return {
      'network': network,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateNetworkSiteResponse {
  /// Information about the network site.
  final NetworkSite? networkSite;

  /// The network site tags.
  final Map<String, String>? tags;

  CreateNetworkSiteResponse({
    this.networkSite,
    this.tags,
  });

  factory CreateNetworkSiteResponse.fromJson(Map<String, dynamic> json) {
    return CreateNetworkSiteResponse(
      networkSite: json['networkSite'] != null
          ? NetworkSite.fromJson(json['networkSite'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final networkSite = this.networkSite;
    final tags = this.tags;
    return {
      if (networkSite != null) 'networkSite': networkSite,
      if (tags != null) 'tags': tags,
    };
  }
}

class DeactivateDeviceIdentifierResponse {
  /// Information about the device identifier.
  final DeviceIdentifier deviceIdentifier;

  DeactivateDeviceIdentifierResponse({
    required this.deviceIdentifier,
  });

  factory DeactivateDeviceIdentifierResponse.fromJson(
      Map<String, dynamic> json) {
    return DeactivateDeviceIdentifierResponse(
      deviceIdentifier: DeviceIdentifier.fromJson(
          json['deviceIdentifier'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceIdentifier = this.deviceIdentifier;
    return {
      'deviceIdentifier': deviceIdentifier,
    };
  }
}

class DeleteNetworkResponse {
  /// Information about the network.
  final Network network;

  DeleteNetworkResponse({
    required this.network,
  });

  factory DeleteNetworkResponse.fromJson(Map<String, dynamic> json) {
    return DeleteNetworkResponse(
      network: Network.fromJson(json['network'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final network = this.network;
    return {
      'network': network,
    };
  }
}

class DeleteNetworkSiteResponse {
  /// Information about the network site.
  final NetworkSite? networkSite;

  DeleteNetworkSiteResponse({
    this.networkSite,
  });

  factory DeleteNetworkSiteResponse.fromJson(Map<String, dynamic> json) {
    return DeleteNetworkSiteResponse(
      networkSite: json['networkSite'] != null
          ? NetworkSite.fromJson(json['networkSite'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final networkSite = this.networkSite;
    return {
      if (networkSite != null) 'networkSite': networkSite,
    };
  }
}

/// Information about a subscriber of a device that can use a network.
class DeviceIdentifier {
  /// The creation time of this device identifier.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the device identifier.
  final String? deviceIdentifierArn;

  /// The Integrated Circuit Card Identifier of the device identifier.
  final String? iccid;

  /// The International Mobile Subscriber Identity of the device identifier.
  final String? imsi;

  /// The Amazon Resource Name (ARN) of the network on which the device identifier
  /// appears.
  final String? networkArn;

  /// The Amazon Resource Name (ARN) of the order used to purchase the device
  /// identifier.
  final String? orderArn;

  /// The status of the device identifier.
  final DeviceIdentifierStatus? status;

  /// The Amazon Resource Name (ARN) of the traffic group to which the device
  /// identifier belongs.
  final String? trafficGroupArn;

  /// The vendor of the device identifier.
  final String? vendor;

  DeviceIdentifier({
    this.createdAt,
    this.deviceIdentifierArn,
    this.iccid,
    this.imsi,
    this.networkArn,
    this.orderArn,
    this.status,
    this.trafficGroupArn,
    this.vendor,
  });

  factory DeviceIdentifier.fromJson(Map<String, dynamic> json) {
    return DeviceIdentifier(
      createdAt: timeStampFromJson(json['createdAt']),
      deviceIdentifierArn: json['deviceIdentifierArn'] as String?,
      iccid: json['iccid'] as String?,
      imsi: json['imsi'] as String?,
      networkArn: json['networkArn'] as String?,
      orderArn: json['orderArn'] as String?,
      status: (json['status'] as String?)?.toDeviceIdentifierStatus(),
      trafficGroupArn: json['trafficGroupArn'] as String?,
      vendor: json['vendor'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final deviceIdentifierArn = this.deviceIdentifierArn;
    final iccid = this.iccid;
    final imsi = this.imsi;
    final networkArn = this.networkArn;
    final orderArn = this.orderArn;
    final status = this.status;
    final trafficGroupArn = this.trafficGroupArn;
    final vendor = this.vendor;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (deviceIdentifierArn != null)
        'deviceIdentifierArn': deviceIdentifierArn,
      if (iccid != null) 'iccid': iccid,
      if (imsi != null) 'imsi': imsi,
      if (networkArn != null) 'networkArn': networkArn,
      if (orderArn != null) 'orderArn': orderArn,
      if (status != null) 'status': status.toValue(),
      if (trafficGroupArn != null) 'trafficGroupArn': trafficGroupArn,
      if (vendor != null) 'vendor': vendor,
    };
  }
}

enum DeviceIdentifierFilterKeys {
  status,
  order,
  trafficGroup,
}

extension DeviceIdentifierFilterKeysValueExtension
    on DeviceIdentifierFilterKeys {
  String toValue() {
    switch (this) {
      case DeviceIdentifierFilterKeys.status:
        return 'STATUS';
      case DeviceIdentifierFilterKeys.order:
        return 'ORDER';
      case DeviceIdentifierFilterKeys.trafficGroup:
        return 'TRAFFIC_GROUP';
    }
  }
}

extension DeviceIdentifierFilterKeysFromString on String {
  DeviceIdentifierFilterKeys toDeviceIdentifierFilterKeys() {
    switch (this) {
      case 'STATUS':
        return DeviceIdentifierFilterKeys.status;
      case 'ORDER':
        return DeviceIdentifierFilterKeys.order;
      case 'TRAFFIC_GROUP':
        return DeviceIdentifierFilterKeys.trafficGroup;
    }
    throw Exception('$this is not known in enum DeviceIdentifierFilterKeys');
  }
}

enum DeviceIdentifierStatus {
  active,
  inactive,
}

extension DeviceIdentifierStatusValueExtension on DeviceIdentifierStatus {
  String toValue() {
    switch (this) {
      case DeviceIdentifierStatus.active:
        return 'ACTIVE';
      case DeviceIdentifierStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension DeviceIdentifierStatusFromString on String {
  DeviceIdentifierStatus toDeviceIdentifierStatus() {
    switch (this) {
      case 'ACTIVE':
        return DeviceIdentifierStatus.active;
      case 'INACTIVE':
        return DeviceIdentifierStatus.inactive;
    }
    throw Exception('$this is not known in enum DeviceIdentifierStatus');
  }
}

enum ElevationReference {
  agl,
  amsl,
}

extension ElevationReferenceValueExtension on ElevationReference {
  String toValue() {
    switch (this) {
      case ElevationReference.agl:
        return 'AGL';
      case ElevationReference.amsl:
        return 'AMSL';
    }
  }
}

extension ElevationReferenceFromString on String {
  ElevationReference toElevationReference() {
    switch (this) {
      case 'AGL':
        return ElevationReference.agl;
      case 'AMSL':
        return ElevationReference.amsl;
    }
    throw Exception('$this is not known in enum ElevationReference');
  }
}

enum ElevationUnit {
  feet,
}

extension ElevationUnitValueExtension on ElevationUnit {
  String toValue() {
    switch (this) {
      case ElevationUnit.feet:
        return 'FEET';
    }
  }
}

extension ElevationUnitFromString on String {
  ElevationUnit toElevationUnit() {
    switch (this) {
      case 'FEET':
        return ElevationUnit.feet;
    }
    throw Exception('$this is not known in enum ElevationUnit');
  }
}

class GetDeviceIdentifierResponse {
  /// Information about the device identifier.
  final DeviceIdentifier? deviceIdentifier;

  /// The device identifier tags.
  final Map<String, String>? tags;

  GetDeviceIdentifierResponse({
    this.deviceIdentifier,
    this.tags,
  });

  factory GetDeviceIdentifierResponse.fromJson(Map<String, dynamic> json) {
    return GetDeviceIdentifierResponse(
      deviceIdentifier: json['deviceIdentifier'] != null
          ? DeviceIdentifier.fromJson(
              json['deviceIdentifier'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final deviceIdentifier = this.deviceIdentifier;
    final tags = this.tags;
    return {
      if (deviceIdentifier != null) 'deviceIdentifier': deviceIdentifier,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetNetworkResourceResponse {
  /// Information about the network resource.
  final NetworkResource networkResource;

  /// The network resource tags.
  final Map<String, String>? tags;

  GetNetworkResourceResponse({
    required this.networkResource,
    this.tags,
  });

  factory GetNetworkResourceResponse.fromJson(Map<String, dynamic> json) {
    return GetNetworkResourceResponse(
      networkResource: NetworkResource.fromJson(
          json['networkResource'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final networkResource = this.networkResource;
    final tags = this.tags;
    return {
      'networkResource': networkResource,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetNetworkResponse {
  /// Information about the network.
  final Network network;

  /// The network tags.
  final Map<String, String>? tags;

  GetNetworkResponse({
    required this.network,
    this.tags,
  });

  factory GetNetworkResponse.fromJson(Map<String, dynamic> json) {
    return GetNetworkResponse(
      network: Network.fromJson(json['network'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final network = this.network;
    final tags = this.tags;
    return {
      'network': network,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetNetworkSiteResponse {
  /// Information about the network site.
  final NetworkSite? networkSite;

  /// The network site tags.
  final Map<String, String>? tags;

  GetNetworkSiteResponse({
    this.networkSite,
    this.tags,
  });

  factory GetNetworkSiteResponse.fromJson(Map<String, dynamic> json) {
    return GetNetworkSiteResponse(
      networkSite: json['networkSite'] != null
          ? NetworkSite.fromJson(json['networkSite'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final networkSite = this.networkSite;
    final tags = this.tags;
    return {
      if (networkSite != null) 'networkSite': networkSite,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetOrderResponse {
  /// Information about the order.
  final Order order;

  /// The order tags.
  final Map<String, String>? tags;

  GetOrderResponse({
    required this.order,
    this.tags,
  });

  factory GetOrderResponse.fromJson(Map<String, dynamic> json) {
    return GetOrderResponse(
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final order = this.order;
    final tags = this.tags;
    return {
      'order': order,
      if (tags != null) 'tags': tags,
    };
  }
}

enum HealthStatus {
  initial,
  healthy,
  unhealthy,
}

extension HealthStatusValueExtension on HealthStatus {
  String toValue() {
    switch (this) {
      case HealthStatus.initial:
        return 'INITIAL';
      case HealthStatus.healthy:
        return 'HEALTHY';
      case HealthStatus.unhealthy:
        return 'UNHEALTHY';
    }
  }
}

extension HealthStatusFromString on String {
  HealthStatus toHealthStatus() {
    switch (this) {
      case 'INITIAL':
        return HealthStatus.initial;
      case 'HEALTHY':
        return HealthStatus.healthy;
      case 'UNHEALTHY':
        return HealthStatus.unhealthy;
    }
    throw Exception('$this is not known in enum HealthStatus');
  }
}

class ListDeviceIdentifiersResponse {
  /// Information about the device identifiers.
  final List<DeviceIdentifier>? deviceIdentifiers;

  /// The token for the next page of results.
  final String? nextToken;

  ListDeviceIdentifiersResponse({
    this.deviceIdentifiers,
    this.nextToken,
  });

  factory ListDeviceIdentifiersResponse.fromJson(Map<String, dynamic> json) {
    return ListDeviceIdentifiersResponse(
      deviceIdentifiers: (json['deviceIdentifiers'] as List?)
          ?.whereNotNull()
          .map((e) => DeviceIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceIdentifiers = this.deviceIdentifiers;
    final nextToken = this.nextToken;
    return {
      if (deviceIdentifiers != null) 'deviceIdentifiers': deviceIdentifiers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkResourcesResponse {
  /// Information about network resources.
  final List<NetworkResource>? networkResources;

  /// The token for the next page of results.
  final String? nextToken;

  ListNetworkResourcesResponse({
    this.networkResources,
    this.nextToken,
  });

  factory ListNetworkResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListNetworkResourcesResponse(
      networkResources: (json['networkResources'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkResources = this.networkResources;
    final nextToken = this.nextToken;
    return {
      if (networkResources != null) 'networkResources': networkResources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkSitesResponse {
  /// Information about the network sites.
  final List<NetworkSite>? networkSites;

  /// The token for the next page of results.
  final String? nextToken;

  ListNetworkSitesResponse({
    this.networkSites,
    this.nextToken,
  });

  factory ListNetworkSitesResponse.fromJson(Map<String, dynamic> json) {
    return ListNetworkSitesResponse(
      networkSites: (json['networkSites'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkSite.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkSites = this.networkSites;
    final nextToken = this.nextToken;
    return {
      if (networkSites != null) 'networkSites': networkSites,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworksResponse {
  /// The networks.
  final List<Network>? networks;

  /// The token for the next page of results.
  final String? nextToken;

  ListNetworksResponse({
    this.networks,
    this.nextToken,
  });

  factory ListNetworksResponse.fromJson(Map<String, dynamic> json) {
    return ListNetworksResponse(
      networks: (json['networks'] as List?)
          ?.whereNotNull()
          .map((e) => Network.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networks = this.networks;
    final nextToken = this.nextToken;
    return {
      if (networks != null) 'networks': networks,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListOrdersResponse {
  /// The token for the next page of results.
  final String? nextToken;

  /// Information about the orders.
  final List<Order>? orders;

  ListOrdersResponse({
    this.nextToken,
    this.orders,
  });

  factory ListOrdersResponse.fromJson(Map<String, dynamic> json) {
    return ListOrdersResponse(
      nextToken: json['nextToken'] as String?,
      orders: (json['orders'] as List?)
          ?.whereNotNull()
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final orders = this.orders;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (orders != null) 'orders': orders,
    };
  }
}

class ListTagsForResourceResponse {
  /// The resource tags.
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

/// Information about a name/value pair.
class NameValuePair {
  /// The name of the pair.
  final String name;

  /// The value of the pair.
  final String? value;

  NameValuePair({
    required this.name,
    this.value,
  });

  factory NameValuePair.fromJson(Map<String, dynamic> json) {
    return NameValuePair(
      name: json['name'] as String,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// Information about a network.
class Network {
  /// The Amazon Resource Name (ARN) of the network.
  final String networkArn;

  /// The name of the network.
  final String networkName;

  /// The status of the network.
  final NetworkStatus status;

  /// The creation time of the network.
  final DateTime? createdAt;

  /// The description of the network.
  final String? description;

  /// The status reason of the network.
  final String? statusReason;

  Network({
    required this.networkArn,
    required this.networkName,
    required this.status,
    this.createdAt,
    this.description,
    this.statusReason,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      networkArn: json['networkArn'] as String,
      networkName: json['networkName'] as String,
      status: (json['status'] as String).toNetworkStatus(),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkArn = this.networkArn;
    final networkName = this.networkName;
    final status = this.status;
    final createdAt = this.createdAt;
    final description = this.description;
    final statusReason = this.statusReason;
    return {
      'networkArn': networkArn,
      'networkName': networkName,
      'status': status.toValue(),
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

enum NetworkFilterKeys {
  status,
}

extension NetworkFilterKeysValueExtension on NetworkFilterKeys {
  String toValue() {
    switch (this) {
      case NetworkFilterKeys.status:
        return 'STATUS';
    }
  }
}

extension NetworkFilterKeysFromString on String {
  NetworkFilterKeys toNetworkFilterKeys() {
    switch (this) {
      case 'STATUS':
        return NetworkFilterKeys.status;
    }
    throw Exception('$this is not known in enum NetworkFilterKeys');
  }
}

/// Information about a network resource.
class NetworkResource {
  /// The attributes of the network resource.
  final List<NameValuePair>? attributes;

  /// Information about the commitment period for the radio unit. Shows the
  /// duration, the date and time that the contract started and ends, and the
  /// renewal status of the commitment period.
  final CommitmentInformation? commitmentInformation;

  /// The creation time of the network resource.
  final DateTime? createdAt;

  /// The description of the network resource.
  final String? description;

  /// The health of the network resource.
  final HealthStatus? health;

  /// The model of the network resource.
  final String? model;

  /// The Amazon Resource Name (ARN) of the network on which this network resource
  /// appears.
  final String? networkArn;

  /// The Amazon Resource Name (ARN) of the network resource.
  final String? networkResourceArn;

  /// The Amazon Resource Name (ARN) of the network site on which this network
  /// resource appears.
  final String? networkSiteArn;

  /// The Amazon Resource Name (ARN) of the order used to purchase this network
  /// resource.
  final String? orderArn;

  /// The position of the network resource.
  final Position? position;

  /// Information about a request to return the network resource.
  final ReturnInformation? returnInformation;

  /// The serial number of the network resource.
  final String? serialNumber;

  /// The status of the network resource.
  final NetworkResourceStatus? status;

  /// The status reason of the network resource.
  final String? statusReason;

  /// The type of the network resource.
  final NetworkResourceType? type;

  /// The vendor of the network resource.
  final String? vendor;

  NetworkResource({
    this.attributes,
    this.commitmentInformation,
    this.createdAt,
    this.description,
    this.health,
    this.model,
    this.networkArn,
    this.networkResourceArn,
    this.networkSiteArn,
    this.orderArn,
    this.position,
    this.returnInformation,
    this.serialNumber,
    this.status,
    this.statusReason,
    this.type,
    this.vendor,
  });

  factory NetworkResource.fromJson(Map<String, dynamic> json) {
    return NetworkResource(
      attributes: (json['attributes'] as List?)
          ?.whereNotNull()
          .map((e) => NameValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      commitmentInformation: json['commitmentInformation'] != null
          ? CommitmentInformation.fromJson(
              json['commitmentInformation'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      health: (json['health'] as String?)?.toHealthStatus(),
      model: json['model'] as String?,
      networkArn: json['networkArn'] as String?,
      networkResourceArn: json['networkResourceArn'] as String?,
      networkSiteArn: json['networkSiteArn'] as String?,
      orderArn: json['orderArn'] as String?,
      position: json['position'] != null
          ? Position.fromJson(json['position'] as Map<String, dynamic>)
          : null,
      returnInformation: json['returnInformation'] != null
          ? ReturnInformation.fromJson(
              json['returnInformation'] as Map<String, dynamic>)
          : null,
      serialNumber: json['serialNumber'] as String?,
      status: (json['status'] as String?)?.toNetworkResourceStatus(),
      statusReason: json['statusReason'] as String?,
      type: (json['type'] as String?)?.toNetworkResourceType(),
      vendor: json['vendor'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final commitmentInformation = this.commitmentInformation;
    final createdAt = this.createdAt;
    final description = this.description;
    final health = this.health;
    final model = this.model;
    final networkArn = this.networkArn;
    final networkResourceArn = this.networkResourceArn;
    final networkSiteArn = this.networkSiteArn;
    final orderArn = this.orderArn;
    final position = this.position;
    final returnInformation = this.returnInformation;
    final serialNumber = this.serialNumber;
    final status = this.status;
    final statusReason = this.statusReason;
    final type = this.type;
    final vendor = this.vendor;
    return {
      if (attributes != null) 'attributes': attributes,
      if (commitmentInformation != null)
        'commitmentInformation': commitmentInformation,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (health != null) 'health': health.toValue(),
      if (model != null) 'model': model,
      if (networkArn != null) 'networkArn': networkArn,
      if (networkResourceArn != null) 'networkResourceArn': networkResourceArn,
      if (networkSiteArn != null) 'networkSiteArn': networkSiteArn,
      if (orderArn != null) 'orderArn': orderArn,
      if (position != null) 'position': position,
      if (returnInformation != null) 'returnInformation': returnInformation,
      if (serialNumber != null) 'serialNumber': serialNumber,
      if (status != null) 'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
      if (type != null) 'type': type.toValue(),
      if (vendor != null) 'vendor': vendor,
    };
  }
}

/// Information about a network resource definition.
class NetworkResourceDefinition {
  /// The count in the network resource definition.
  final int count;

  /// The type in the network resource definition.
  final NetworkResourceDefinitionType type;

  /// The options in the network resource definition.
  final List<NameValuePair>? options;

  NetworkResourceDefinition({
    required this.count,
    required this.type,
    this.options,
  });

  factory NetworkResourceDefinition.fromJson(Map<String, dynamic> json) {
    return NetworkResourceDefinition(
      count: json['count'] as int,
      type: (json['type'] as String).toNetworkResourceDefinitionType(),
      options: (json['options'] as List?)
          ?.whereNotNull()
          .map((e) => NameValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final type = this.type;
    final options = this.options;
    return {
      'count': count,
      'type': type.toValue(),
      if (options != null) 'options': options,
    };
  }
}

enum NetworkResourceDefinitionType {
  radioUnit,
  deviceIdentifier,
}

extension NetworkResourceDefinitionTypeValueExtension
    on NetworkResourceDefinitionType {
  String toValue() {
    switch (this) {
      case NetworkResourceDefinitionType.radioUnit:
        return 'RADIO_UNIT';
      case NetworkResourceDefinitionType.deviceIdentifier:
        return 'DEVICE_IDENTIFIER';
    }
  }
}

extension NetworkResourceDefinitionTypeFromString on String {
  NetworkResourceDefinitionType toNetworkResourceDefinitionType() {
    switch (this) {
      case 'RADIO_UNIT':
        return NetworkResourceDefinitionType.radioUnit;
      case 'DEVICE_IDENTIFIER':
        return NetworkResourceDefinitionType.deviceIdentifier;
    }
    throw Exception('$this is not known in enum NetworkResourceDefinitionType');
  }
}

enum NetworkResourceFilterKeys {
  order,
  status,
}

extension NetworkResourceFilterKeysValueExtension on NetworkResourceFilterKeys {
  String toValue() {
    switch (this) {
      case NetworkResourceFilterKeys.order:
        return 'ORDER';
      case NetworkResourceFilterKeys.status:
        return 'STATUS';
    }
  }
}

extension NetworkResourceFilterKeysFromString on String {
  NetworkResourceFilterKeys toNetworkResourceFilterKeys() {
    switch (this) {
      case 'ORDER':
        return NetworkResourceFilterKeys.order;
      case 'STATUS':
        return NetworkResourceFilterKeys.status;
    }
    throw Exception('$this is not known in enum NetworkResourceFilterKeys');
  }
}

enum NetworkResourceStatus {
  pending,
  shipped,
  provisioning,
  provisioned,
  available,
  deleting,
  pendingReturn,
  deleted,
  creatingShippingLabel,
}

extension NetworkResourceStatusValueExtension on NetworkResourceStatus {
  String toValue() {
    switch (this) {
      case NetworkResourceStatus.pending:
        return 'PENDING';
      case NetworkResourceStatus.shipped:
        return 'SHIPPED';
      case NetworkResourceStatus.provisioning:
        return 'PROVISIONING';
      case NetworkResourceStatus.provisioned:
        return 'PROVISIONED';
      case NetworkResourceStatus.available:
        return 'AVAILABLE';
      case NetworkResourceStatus.deleting:
        return 'DELETING';
      case NetworkResourceStatus.pendingReturn:
        return 'PENDING_RETURN';
      case NetworkResourceStatus.deleted:
        return 'DELETED';
      case NetworkResourceStatus.creatingShippingLabel:
        return 'CREATING_SHIPPING_LABEL';
    }
  }
}

extension NetworkResourceStatusFromString on String {
  NetworkResourceStatus toNetworkResourceStatus() {
    switch (this) {
      case 'PENDING':
        return NetworkResourceStatus.pending;
      case 'SHIPPED':
        return NetworkResourceStatus.shipped;
      case 'PROVISIONING':
        return NetworkResourceStatus.provisioning;
      case 'PROVISIONED':
        return NetworkResourceStatus.provisioned;
      case 'AVAILABLE':
        return NetworkResourceStatus.available;
      case 'DELETING':
        return NetworkResourceStatus.deleting;
      case 'PENDING_RETURN':
        return NetworkResourceStatus.pendingReturn;
      case 'DELETED':
        return NetworkResourceStatus.deleted;
      case 'CREATING_SHIPPING_LABEL':
        return NetworkResourceStatus.creatingShippingLabel;
    }
    throw Exception('$this is not known in enum NetworkResourceStatus');
  }
}

enum NetworkResourceType {
  radioUnit,
}

extension NetworkResourceTypeValueExtension on NetworkResourceType {
  String toValue() {
    switch (this) {
      case NetworkResourceType.radioUnit:
        return 'RADIO_UNIT';
    }
  }
}

extension NetworkResourceTypeFromString on String {
  NetworkResourceType toNetworkResourceType() {
    switch (this) {
      case 'RADIO_UNIT':
        return NetworkResourceType.radioUnit;
    }
    throw Exception('$this is not known in enum NetworkResourceType');
  }
}

/// Information about a network site.
class NetworkSite {
  /// The Amazon Resource Name (ARN) of the network to which the network site
  /// belongs.
  final String networkArn;

  /// The Amazon Resource Name (ARN) of the network site.
  final String networkSiteArn;

  /// The name of the network site.
  final String networkSiteName;

  /// The status of the network site.
  final NetworkSiteStatus status;

  /// The parent Availability Zone for the network site.
  final String? availabilityZone;

  /// The parent Availability Zone ID for the network site.
  final String? availabilityZoneId;

  /// The creation time of the network site.
  final DateTime? createdAt;

  /// The current plan of the network site.
  final SitePlan? currentPlan;

  /// The description of the network site.
  final String? description;

  /// The pending plan of the network site.
  final SitePlan? pendingPlan;

  /// The status reason of the network site.
  final String? statusReason;

  NetworkSite({
    required this.networkArn,
    required this.networkSiteArn,
    required this.networkSiteName,
    required this.status,
    this.availabilityZone,
    this.availabilityZoneId,
    this.createdAt,
    this.currentPlan,
    this.description,
    this.pendingPlan,
    this.statusReason,
  });

  factory NetworkSite.fromJson(Map<String, dynamic> json) {
    return NetworkSite(
      networkArn: json['networkArn'] as String,
      networkSiteArn: json['networkSiteArn'] as String,
      networkSiteName: json['networkSiteName'] as String,
      status: (json['status'] as String).toNetworkSiteStatus(),
      availabilityZone: json['availabilityZone'] as String?,
      availabilityZoneId: json['availabilityZoneId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      currentPlan: json['currentPlan'] != null
          ? SitePlan.fromJson(json['currentPlan'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      pendingPlan: json['pendingPlan'] != null
          ? SitePlan.fromJson(json['pendingPlan'] as Map<String, dynamic>)
          : null,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkArn = this.networkArn;
    final networkSiteArn = this.networkSiteArn;
    final networkSiteName = this.networkSiteName;
    final status = this.status;
    final availabilityZone = this.availabilityZone;
    final availabilityZoneId = this.availabilityZoneId;
    final createdAt = this.createdAt;
    final currentPlan = this.currentPlan;
    final description = this.description;
    final pendingPlan = this.pendingPlan;
    final statusReason = this.statusReason;
    return {
      'networkArn': networkArn,
      'networkSiteArn': networkSiteArn,
      'networkSiteName': networkSiteName,
      'status': status.toValue(),
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (availabilityZoneId != null) 'availabilityZoneId': availabilityZoneId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (currentPlan != null) 'currentPlan': currentPlan,
      if (description != null) 'description': description,
      if (pendingPlan != null) 'pendingPlan': pendingPlan,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

enum NetworkSiteFilterKeys {
  status,
}

extension NetworkSiteFilterKeysValueExtension on NetworkSiteFilterKeys {
  String toValue() {
    switch (this) {
      case NetworkSiteFilterKeys.status:
        return 'STATUS';
    }
  }
}

extension NetworkSiteFilterKeysFromString on String {
  NetworkSiteFilterKeys toNetworkSiteFilterKeys() {
    switch (this) {
      case 'STATUS':
        return NetworkSiteFilterKeys.status;
    }
    throw Exception('$this is not known in enum NetworkSiteFilterKeys');
  }
}

enum NetworkSiteStatus {
  created,
  provisioning,
  available,
  deprovisioning,
  deleted,
}

extension NetworkSiteStatusValueExtension on NetworkSiteStatus {
  String toValue() {
    switch (this) {
      case NetworkSiteStatus.created:
        return 'CREATED';
      case NetworkSiteStatus.provisioning:
        return 'PROVISIONING';
      case NetworkSiteStatus.available:
        return 'AVAILABLE';
      case NetworkSiteStatus.deprovisioning:
        return 'DEPROVISIONING';
      case NetworkSiteStatus.deleted:
        return 'DELETED';
    }
  }
}

extension NetworkSiteStatusFromString on String {
  NetworkSiteStatus toNetworkSiteStatus() {
    switch (this) {
      case 'CREATED':
        return NetworkSiteStatus.created;
      case 'PROVISIONING':
        return NetworkSiteStatus.provisioning;
      case 'AVAILABLE':
        return NetworkSiteStatus.available;
      case 'DEPROVISIONING':
        return NetworkSiteStatus.deprovisioning;
      case 'DELETED':
        return NetworkSiteStatus.deleted;
    }
    throw Exception('$this is not known in enum NetworkSiteStatus');
  }
}

enum NetworkStatus {
  created,
  provisioning,
  available,
  deprovisioning,
  deleted,
}

extension NetworkStatusValueExtension on NetworkStatus {
  String toValue() {
    switch (this) {
      case NetworkStatus.created:
        return 'CREATED';
      case NetworkStatus.provisioning:
        return 'PROVISIONING';
      case NetworkStatus.available:
        return 'AVAILABLE';
      case NetworkStatus.deprovisioning:
        return 'DEPROVISIONING';
      case NetworkStatus.deleted:
        return 'DELETED';
    }
  }
}

extension NetworkStatusFromString on String {
  NetworkStatus toNetworkStatus() {
    switch (this) {
      case 'CREATED':
        return NetworkStatus.created;
      case 'PROVISIONING':
        return NetworkStatus.provisioning;
      case 'AVAILABLE':
        return NetworkStatus.available;
      case 'DEPROVISIONING':
        return NetworkStatus.deprovisioning;
      case 'DELETED':
        return NetworkStatus.deleted;
    }
    throw Exception('$this is not known in enum NetworkStatus');
  }
}

/// Information about an order.
class Order {
  /// The acknowledgement status of the order.
  final AcknowledgmentStatus? acknowledgmentStatus;

  /// The creation time of the order.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the network associated with this order.
  final String? networkArn;

  /// The Amazon Resource Name (ARN) of the network site associated with this
  /// order.
  final String? networkSiteArn;

  /// The Amazon Resource Name (ARN) of the order.
  final String? orderArn;

  /// A list of the network resources placed in the order.
  final List<OrderedResourceDefinition>? orderedResources;

  /// The shipping address of the order.
  final Address? shippingAddress;

  /// The tracking information of the order.
  final List<TrackingInformation>? trackingInformation;

  Order({
    this.acknowledgmentStatus,
    this.createdAt,
    this.networkArn,
    this.networkSiteArn,
    this.orderArn,
    this.orderedResources,
    this.shippingAddress,
    this.trackingInformation,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      acknowledgmentStatus:
          (json['acknowledgmentStatus'] as String?)?.toAcknowledgmentStatus(),
      createdAt: timeStampFromJson(json['createdAt']),
      networkArn: json['networkArn'] as String?,
      networkSiteArn: json['networkSiteArn'] as String?,
      orderArn: json['orderArn'] as String?,
      orderedResources: (json['orderedResources'] as List?)
          ?.whereNotNull()
          .map((e) =>
              OrderedResourceDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      shippingAddress: json['shippingAddress'] != null
          ? Address.fromJson(json['shippingAddress'] as Map<String, dynamic>)
          : null,
      trackingInformation: (json['trackingInformation'] as List?)
          ?.whereNotNull()
          .map((e) => TrackingInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final acknowledgmentStatus = this.acknowledgmentStatus;
    final createdAt = this.createdAt;
    final networkArn = this.networkArn;
    final networkSiteArn = this.networkSiteArn;
    final orderArn = this.orderArn;
    final orderedResources = this.orderedResources;
    final shippingAddress = this.shippingAddress;
    final trackingInformation = this.trackingInformation;
    return {
      if (acknowledgmentStatus != null)
        'acknowledgmentStatus': acknowledgmentStatus.toValue(),
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (networkArn != null) 'networkArn': networkArn,
      if (networkSiteArn != null) 'networkSiteArn': networkSiteArn,
      if (orderArn != null) 'orderArn': orderArn,
      if (orderedResources != null) 'orderedResources': orderedResources,
      if (shippingAddress != null) 'shippingAddress': shippingAddress,
      if (trackingInformation != null)
        'trackingInformation': trackingInformation,
    };
  }
}

enum OrderFilterKeys {
  status,
  networkSite,
}

extension OrderFilterKeysValueExtension on OrderFilterKeys {
  String toValue() {
    switch (this) {
      case OrderFilterKeys.status:
        return 'STATUS';
      case OrderFilterKeys.networkSite:
        return 'NETWORK_SITE';
    }
  }
}

extension OrderFilterKeysFromString on String {
  OrderFilterKeys toOrderFilterKeys() {
    switch (this) {
      case 'STATUS':
        return OrderFilterKeys.status;
      case 'NETWORK_SITE':
        return OrderFilterKeys.networkSite;
    }
    throw Exception('$this is not known in enum OrderFilterKeys');
  }
}

/// Details of the network resources in the order.
class OrderedResourceDefinition {
  /// The number of network resources in the order.
  final int count;

  /// The type of network resource in the order.
  final NetworkResourceDefinitionType type;

  /// The duration and renewal status of the commitment period for each radio unit
  /// in the order. Does not show details if the resource type is
  /// DEVICE_IDENTIFIER.
  final CommitmentConfiguration? commitmentConfiguration;

  OrderedResourceDefinition({
    required this.count,
    required this.type,
    this.commitmentConfiguration,
  });

  factory OrderedResourceDefinition.fromJson(Map<String, dynamic> json) {
    return OrderedResourceDefinition(
      count: json['count'] as int,
      type: (json['type'] as String).toNetworkResourceDefinitionType(),
      commitmentConfiguration: json['commitmentConfiguration'] != null
          ? CommitmentConfiguration.fromJson(
              json['commitmentConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final type = this.type;
    final commitmentConfiguration = this.commitmentConfiguration;
    return {
      'count': count,
      'type': type.toValue(),
      if (commitmentConfiguration != null)
        'commitmentConfiguration': commitmentConfiguration,
    };
  }
}

class PingResponse {
  /// Information about the health of the service.
  final String? status;

  PingResponse({
    this.status,
  });

  factory PingResponse.fromJson(Map<String, dynamic> json) {
    return PingResponse(
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status,
    };
  }
}

/// Information about a position.
class Position {
  /// The elevation of the equipment at this position.
  final double? elevation;

  /// The reference point from which elevation is reported.
  final ElevationReference? elevationReference;

  /// The units used to measure the elevation of the position.
  final ElevationUnit? elevationUnit;

  /// The latitude of the position.
  final double? latitude;

  /// The longitude of the position.
  final double? longitude;

  Position({
    this.elevation,
    this.elevationReference,
    this.elevationUnit,
    this.latitude,
    this.longitude,
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      elevation: json['elevation'] as double?,
      elevationReference:
          (json['elevationReference'] as String?)?.toElevationReference(),
      elevationUnit: (json['elevationUnit'] as String?)?.toElevationUnit(),
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final elevation = this.elevation;
    final elevationReference = this.elevationReference;
    final elevationUnit = this.elevationUnit;
    final latitude = this.latitude;
    final longitude = this.longitude;
    return {
      if (elevation != null) 'elevation': elevation,
      if (elevationReference != null)
        'elevationReference': elevationReference.toValue(),
      if (elevationUnit != null) 'elevationUnit': elevationUnit.toValue(),
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    };
  }
}

/// Information about a request to return a network resource.
class ReturnInformation {
  /// The Amazon Resource Name (ARN) of the replacement order.
  final String? replacementOrderArn;

  /// The reason for the return. If the return request did not include a reason
  /// for the return, this value is null.
  final String? returnReason;

  /// The shipping address.
  final Address? shippingAddress;

  /// The URL of the shipping label. The shipping label is available for download
  /// only if the status of the network resource is <code>PENDING_RETURN</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/private-networks/latest/userguide/radio-units.html#return-radio-unit">Return
  /// a radio unit</a>.
  final String? shippingLabel;

  ReturnInformation({
    this.replacementOrderArn,
    this.returnReason,
    this.shippingAddress,
    this.shippingLabel,
  });

  factory ReturnInformation.fromJson(Map<String, dynamic> json) {
    return ReturnInformation(
      replacementOrderArn: json['replacementOrderArn'] as String?,
      returnReason: json['returnReason'] as String?,
      shippingAddress: json['shippingAddress'] != null
          ? Address.fromJson(json['shippingAddress'] as Map<String, dynamic>)
          : null,
      shippingLabel: json['shippingLabel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replacementOrderArn = this.replacementOrderArn;
    final returnReason = this.returnReason;
    final shippingAddress = this.shippingAddress;
    final shippingLabel = this.shippingLabel;
    return {
      if (replacementOrderArn != null)
        'replacementOrderArn': replacementOrderArn,
      if (returnReason != null) 'returnReason': returnReason,
      if (shippingAddress != null) 'shippingAddress': shippingAddress,
      if (shippingLabel != null) 'shippingLabel': shippingLabel,
    };
  }
}

/// Information about a site plan.
class SitePlan {
  /// The options of the plan.
  final List<NameValuePair>? options;

  /// The resource definitions of the plan.
  final List<NetworkResourceDefinition>? resourceDefinitions;

  SitePlan({
    this.options,
    this.resourceDefinitions,
  });

  factory SitePlan.fromJson(Map<String, dynamic> json) {
    return SitePlan(
      options: (json['options'] as List?)
          ?.whereNotNull()
          .map((e) => NameValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceDefinitions: (json['resourceDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              NetworkResourceDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final options = this.options;
    final resourceDefinitions = this.resourceDefinitions;
    return {
      if (options != null) 'options': options,
      if (resourceDefinitions != null)
        'resourceDefinitions': resourceDefinitions,
    };
  }
}

class StartNetworkResourceUpdateResponse {
  /// The network resource.
  final NetworkResource? networkResource;

  StartNetworkResourceUpdateResponse({
    this.networkResource,
  });

  factory StartNetworkResourceUpdateResponse.fromJson(
      Map<String, dynamic> json) {
    return StartNetworkResourceUpdateResponse(
      networkResource: json['networkResource'] != null
          ? NetworkResource.fromJson(
              json['networkResource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final networkResource = this.networkResource;
    return {
      if (networkResource != null) 'networkResource': networkResource,
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

/// Information about tracking a shipment.
class TrackingInformation {
  /// The tracking number of the shipment.
  final String? trackingNumber;

  TrackingInformation({
    this.trackingNumber,
  });

  factory TrackingInformation.fromJson(Map<String, dynamic> json) {
    return TrackingInformation(
      trackingNumber: json['trackingNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trackingNumber = this.trackingNumber;
    return {
      if (trackingNumber != null) 'trackingNumber': trackingNumber,
    };
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

class UpdateNetworkSiteResponse {
  /// Information about the network site.
  final NetworkSite? networkSite;

  /// The network site tags.
  final Map<String, String>? tags;

  UpdateNetworkSiteResponse({
    this.networkSite,
    this.tags,
  });

  factory UpdateNetworkSiteResponse.fromJson(Map<String, dynamic> json) {
    return UpdateNetworkSiteResponse(
      networkSite: json['networkSite'] != null
          ? NetworkSite.fromJson(json['networkSite'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final networkSite = this.networkSite;
    final tags = this.tags;
    return {
      if (networkSite != null) 'networkSite': networkSite,
      if (tags != null) 'tags': tags,
    };
  }
}

enum UpdateType {
  replace,
  $return,
  commitment,
}

extension UpdateTypeValueExtension on UpdateType {
  String toValue() {
    switch (this) {
      case UpdateType.replace:
        return 'REPLACE';
      case UpdateType.$return:
        return 'RETURN';
      case UpdateType.commitment:
        return 'COMMITMENT';
    }
  }
}

extension UpdateTypeFromString on String {
  UpdateType toUpdateType() {
    switch (this) {
      case 'REPLACE':
        return UpdateType.replace;
      case 'RETURN':
        return UpdateType.$return;
      case 'COMMITMENT':
        return UpdateType.commitment;
    }
    throw Exception('$this is not known in enum UpdateType');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
