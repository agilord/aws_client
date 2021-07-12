// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// Transit Gateway Network Manager (Network Manager) enables you to create a
/// global network, in which you can monitor your AWS and on-premises networks
/// that are built around transit gateways.
///
/// The Network Manager APIs are supported in the US West (Oregon) Region only.
/// You must specify the <code>us-west-2</code> Region in all requests made to
/// Network Manager.
class NetworkManager {
  final _s.RestJsonProtocol _protocol;
  NetworkManager({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'networkmanager',
            signingName: 'networkmanager',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates a customer gateway with a device and optionally, with a link.
  /// If you specify a link, it must be associated with the specified device.
  ///
  /// You can only associate customer gateways that are connected to a VPN
  /// attachment on a transit gateway. The transit gateway must be registered in
  /// your global network. When you register a transit gateway, customer
  /// gateways that are connected to the transit gateway are automatically
  /// included in the global network. To list customer gateways that are
  /// connected to a transit gateway, use the <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeVpnConnections.html">DescribeVpnConnections</a>
  /// EC2 API and filter by <code>transit-gateway-id</code>.
  ///
  /// You cannot associate a customer gateway with more than one device and
  /// link.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [customerGatewayArn] :
  /// The Amazon Resource Name (ARN) of the customer gateway. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html#amazonec2-resources-for-iam-policies">Resources
  /// Defined by Amazon EC2</a>.
  ///
  /// Parameter [deviceId] :
  /// The ID of the device.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [linkId] :
  /// The ID of the link.
  Future<AssociateCustomerGatewayResponse> associateCustomerGateway({
    required String customerGatewayArn,
    required String deviceId,
    required String globalNetworkId,
    String? linkId,
  }) async {
    ArgumentError.checkNotNull(customerGatewayArn, 'customerGatewayArn');
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    final $payload = <String, dynamic>{
      'CustomerGatewayArn': customerGatewayArn,
      'DeviceId': deviceId,
      if (linkId != null) 'LinkId': linkId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/customer-gateway-associations',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateCustomerGatewayResponse.fromJson(response);
  }

  /// Associates a link to a device. A device can be associated to multiple
  /// links and a link can be associated to multiple devices. The device and
  /// link must be in the same global network and the same site.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceId] :
  /// The ID of the device.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [linkId] :
  /// The ID of the link.
  Future<AssociateLinkResponse> associateLink({
    required String deviceId,
    required String globalNetworkId,
    required String linkId,
  }) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    ArgumentError.checkNotNull(linkId, 'linkId');
    final $payload = <String, dynamic>{
      'DeviceId': deviceId,
      'LinkId': linkId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/link-associations',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateLinkResponse.fromJson(response);
  }

  /// Associates a transit gateway Connect peer with a device, and optionally,
  /// with a link. If you specify a link, it must be associated with the
  /// specified device.
  ///
  /// You can only associate transit gateway Connect peers that have been
  /// created on a transit gateway that's registered in your global network.
  ///
  /// You cannot associate a transit gateway Connect peer with more than one
  /// device and link.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceId] :
  /// The ID of the device.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [transitGatewayConnectPeerArn] :
  /// The Amazon Resource Name (ARN) of the Connect peer.
  ///
  /// Parameter [linkId] :
  /// The ID of the link.
  Future<AssociateTransitGatewayConnectPeerResponse>
      associateTransitGatewayConnectPeer({
    required String deviceId,
    required String globalNetworkId,
    required String transitGatewayConnectPeerArn,
    String? linkId,
  }) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    ArgumentError.checkNotNull(
        transitGatewayConnectPeerArn, 'transitGatewayConnectPeerArn');
    final $payload = <String, dynamic>{
      'DeviceId': deviceId,
      'TransitGatewayConnectPeerArn': transitGatewayConnectPeerArn,
      if (linkId != null) 'LinkId': linkId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/transit-gateway-connect-peer-associations',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateTransitGatewayConnectPeerResponse.fromJson(response);
  }

  /// Creates a connection between two devices. The devices can be a physical or
  /// virtual appliance that connects to a third-party appliance in a VPC, or a
  /// physical appliance that connects to another physical appliance in an
  /// on-premises network.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectedDeviceId] :
  /// The ID of the second device in the connection.
  ///
  /// Parameter [deviceId] :
  /// The ID of the first device in the connection.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [connectedLinkId] :
  /// The ID of the link for the second device.
  ///
  /// Parameter [description] :
  /// A description of the connection.
  ///
  /// Length Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [linkId] :
  /// The ID of the link for the first device.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the resource during creation.
  Future<CreateConnectionResponse> createConnection({
    required String connectedDeviceId,
    required String deviceId,
    required String globalNetworkId,
    String? connectedLinkId,
    String? description,
    String? linkId,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(connectedDeviceId, 'connectedDeviceId');
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    final $payload = <String, dynamic>{
      'ConnectedDeviceId': connectedDeviceId,
      'DeviceId': deviceId,
      if (connectedLinkId != null) 'ConnectedLinkId': connectedLinkId,
      if (description != null) 'Description': description,
      if (linkId != null) 'LinkId': linkId,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/connections',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConnectionResponse.fromJson(response);
  }

  /// Creates a new device in a global network. If you specify both a site ID
  /// and a location, the location of the site is used for visualization in the
  /// Network Manager console.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [awsLocation] :
  /// The AWS location of the device.
  ///
  /// Parameter [description] :
  /// A description of the device.
  ///
  /// Length Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [location] :
  /// The location of the device.
  ///
  /// Parameter [model] :
  /// The model of the device.
  ///
  /// Length Constraints: Maximum length of 128 characters.
  ///
  /// Parameter [serialNumber] :
  /// The serial number of the device.
  ///
  /// Length Constraints: Maximum length of 128 characters.
  ///
  /// Parameter [siteId] :
  /// The ID of the site.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the resource during creation.
  ///
  /// Parameter [type] :
  /// The type of the device.
  ///
  /// Parameter [vendor] :
  /// The vendor of the device.
  ///
  /// Length Constraints: Maximum length of 128 characters.
  Future<CreateDeviceResponse> createDevice({
    required String globalNetworkId,
    AWSLocation? awsLocation,
    String? description,
    Location? location,
    String? model,
    String? serialNumber,
    String? siteId,
    List<Tag>? tags,
    String? type,
    String? vendor,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    final $payload = <String, dynamic>{
      if (awsLocation != null) 'AWSLocation': awsLocation,
      if (description != null) 'Description': description,
      if (location != null) 'Location': location,
      if (model != null) 'Model': model,
      if (serialNumber != null) 'SerialNumber': serialNumber,
      if (siteId != null) 'SiteId': siteId,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type,
      if (vendor != null) 'Vendor': vendor,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/devices',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDeviceResponse.fromJson(response);
  }

  /// Creates a new, empty global network.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [description] :
  /// A description of the global network.
  ///
  /// Length Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the resource during creation.
  Future<CreateGlobalNetworkResponse> createGlobalNetwork({
    String? description,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/global-networks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGlobalNetworkResponse.fromJson(response);
  }

  /// Creates a new link for a specified site.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [bandwidth] :
  /// The upload speed and download speed in Mbps.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [siteId] :
  /// The ID of the site.
  ///
  /// Parameter [description] :
  /// A description of the link.
  ///
  /// Length Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [provider] :
  /// The provider of the link.
  ///
  /// Constraints: Cannot include the following characters: | \ ^
  ///
  /// Length Constraints: Maximum length of 128 characters.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the resource during creation.
  ///
  /// Parameter [type] :
  /// The type of the link.
  ///
  /// Constraints: Cannot include the following characters: | \ ^
  ///
  /// Length Constraints: Maximum length of 128 characters.
  Future<CreateLinkResponse> createLink({
    required Bandwidth bandwidth,
    required String globalNetworkId,
    required String siteId,
    String? description,
    String? provider,
    List<Tag>? tags,
    String? type,
  }) async {
    ArgumentError.checkNotNull(bandwidth, 'bandwidth');
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    ArgumentError.checkNotNull(siteId, 'siteId');
    final $payload = <String, dynamic>{
      'Bandwidth': bandwidth,
      'SiteId': siteId,
      if (description != null) 'Description': description,
      if (provider != null) 'Provider': provider,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/links',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLinkResponse.fromJson(response);
  }

  /// Creates a new site in a global network.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [description] :
  /// A description of your site.
  ///
  /// Length Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [location] :
  /// The site location. This information is used for visualization in the
  /// Network Manager console. If you specify the address, the latitude and
  /// longitude are automatically calculated.
  ///
  /// <ul>
  /// <li>
  /// <code>Address</code>: The physical address of the site.
  /// </li>
  /// <li>
  /// <code>Latitude</code>: The latitude of the site.
  /// </li>
  /// <li>
  /// <code>Longitude</code>: The longitude of the site.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// The tags to apply to the resource during creation.
  Future<CreateSiteResponse> createSite({
    required String globalNetworkId,
    String? description,
    Location? location,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (location != null) 'Location': location,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/sites',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSiteResponse.fromJson(response);
  }

  /// Deletes the specified connection in your global network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  Future<DeleteConnectionResponse> deleteConnection({
    required String connectionId,
    required String globalNetworkId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/connections/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConnectionResponse.fromJson(response);
  }

  /// Deletes an existing device. You must first disassociate the device from
  /// any links and customer gateways.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceId] :
  /// The ID of the device.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  Future<DeleteDeviceResponse> deleteDevice({
    required String deviceId,
    required String globalNetworkId,
  }) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/devices/${Uri.encodeComponent(deviceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDeviceResponse.fromJson(response);
  }

  /// Deletes an existing global network. You must first delete all global
  /// network objects (devices, links, and sites) and deregister all transit
  /// gateways.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  Future<DeleteGlobalNetworkResponse> deleteGlobalNetwork({
    required String globalNetworkId,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/global-networks/${Uri.encodeComponent(globalNetworkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteGlobalNetworkResponse.fromJson(response);
  }

  /// Deletes an existing link. You must first disassociate the link from any
  /// devices and customer gateways.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [linkId] :
  /// The ID of the link.
  Future<DeleteLinkResponse> deleteLink({
    required String globalNetworkId,
    required String linkId,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    ArgumentError.checkNotNull(linkId, 'linkId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/links/${Uri.encodeComponent(linkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteLinkResponse.fromJson(response);
  }

  /// Deletes an existing site. The site cannot be associated with any device or
  /// link.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [siteId] :
  /// The ID of the site.
  Future<DeleteSiteResponse> deleteSite({
    required String globalNetworkId,
    required String siteId,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    ArgumentError.checkNotNull(siteId, 'siteId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/sites/${Uri.encodeComponent(siteId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSiteResponse.fromJson(response);
  }

  /// Deregisters a transit gateway from your global network. This action does
  /// not delete your transit gateway, or modify any of its attachments. This
  /// action removes any customer gateway associations.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [transitGatewayArn] :
  /// The Amazon Resource Name (ARN) of the transit gateway.
  Future<DeregisterTransitGatewayResponse> deregisterTransitGateway({
    required String globalNetworkId,
    required String transitGatewayArn,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    ArgumentError.checkNotNull(transitGatewayArn, 'transitGatewayArn');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/transit-gateway-registrations/${Uri.encodeComponent(transitGatewayArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeregisterTransitGatewayResponse.fromJson(response);
  }

  /// Describes one or more global networks. By default, all global networks are
  /// described. To describe the objects in your global network, you must use
  /// the appropriate <code>Get*</code> action. For example, to list the transit
  /// gateways in your global network, use
  /// <a>GetTransitGatewayRegistrations</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkIds] :
  /// The IDs of one or more global networks. The maximum is 10.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<DescribeGlobalNetworksResponse> describeGlobalNetworks({
    List<String>? globalNetworkIds,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (globalNetworkIds != null) 'globalNetworkIds': globalNetworkIds,
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/global-networks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGlobalNetworksResponse.fromJson(response);
  }

  /// Disassociates a customer gateway from a device and a link.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [customerGatewayArn] :
  /// The Amazon Resource Name (ARN) of the customer gateway. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html#amazonec2-resources-for-iam-policies">Resources
  /// Defined by Amazon EC2</a>.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  Future<DisassociateCustomerGatewayResponse> disassociateCustomerGateway({
    required String customerGatewayArn,
    required String globalNetworkId,
  }) async {
    ArgumentError.checkNotNull(customerGatewayArn, 'customerGatewayArn');
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/customer-gateway-associations/${Uri.encodeComponent(customerGatewayArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateCustomerGatewayResponse.fromJson(response);
  }

  /// Disassociates an existing device from a link. You must first disassociate
  /// any customer gateways that are associated with the link.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceId] :
  /// The ID of the device.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [linkId] :
  /// The ID of the link.
  Future<DisassociateLinkResponse> disassociateLink({
    required String deviceId,
    required String globalNetworkId,
    required String linkId,
  }) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    ArgumentError.checkNotNull(linkId, 'linkId');
    final $query = <String, List<String>>{
      'deviceId': [deviceId],
      'linkId': [linkId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/link-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateLinkResponse.fromJson(response);
  }

  /// Disassociates a transit gateway Connect peer from a device and link.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [transitGatewayConnectPeerArn] :
  /// The Amazon Resource Name (ARN) of the transit gateway Connect peer.
  Future<DisassociateTransitGatewayConnectPeerResponse>
      disassociateTransitGatewayConnectPeer({
    required String globalNetworkId,
    required String transitGatewayConnectPeerArn,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    ArgumentError.checkNotNull(
        transitGatewayConnectPeerArn, 'transitGatewayConnectPeerArn');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/transit-gateway-connect-peer-associations/${Uri.encodeComponent(transitGatewayConnectPeerArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateTransitGatewayConnectPeerResponse.fromJson(response);
  }

  /// Gets information about one or more of your connections in a global
  /// network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [connectionIds] :
  /// One or more connection IDs.
  ///
  /// Parameter [deviceId] :
  /// The ID of the device.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<GetConnectionsResponse> getConnections({
    required String globalNetworkId,
    List<String>? connectionIds,
    String? deviceId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (connectionIds != null) 'connectionIds': connectionIds,
      if (deviceId != null) 'deviceId': [deviceId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/connections',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectionsResponse.fromJson(response);
  }

  /// Gets the association information for customer gateways that are associated
  /// with devices and links in your global network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [customerGatewayArns] :
  /// One or more customer gateway Amazon Resource Names (ARNs). For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html#amazonec2-resources-for-iam-policies">Resources
  /// Defined by Amazon EC2</a>. The maximum is 10.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<GetCustomerGatewayAssociationsResponse>
      getCustomerGatewayAssociations({
    required String globalNetworkId,
    List<String>? customerGatewayArns,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (customerGatewayArns != null)
        'customerGatewayArns': customerGatewayArns,
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/customer-gateway-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCustomerGatewayAssociationsResponse.fromJson(response);
  }

  /// Gets information about one or more of your devices in a global network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [deviceIds] :
  /// One or more device IDs. The maximum is 10.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [siteId] :
  /// The ID of the site.
  Future<GetDevicesResponse> getDevices({
    required String globalNetworkId,
    List<String>? deviceIds,
    int? maxResults,
    String? nextToken,
    String? siteId,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (deviceIds != null) 'deviceIds': deviceIds,
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (siteId != null) 'siteId': [siteId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/devices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDevicesResponse.fromJson(response);
  }

  /// Gets the link associations for a device or a link. Either the device ID or
  /// the link ID must be specified.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [deviceId] :
  /// The ID of the device.
  ///
  /// Parameter [linkId] :
  /// The ID of the link.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<GetLinkAssociationsResponse> getLinkAssociations({
    required String globalNetworkId,
    String? deviceId,
    String? linkId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (deviceId != null) 'deviceId': [deviceId],
      if (linkId != null) 'linkId': [linkId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/link-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLinkAssociationsResponse.fromJson(response);
  }

  /// Gets information about one or more links in a specified global network.
  ///
  /// If you specify the site ID, you cannot specify the type or provider in the
  /// same request. You can specify the type and provider in the same request.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [linkIds] :
  /// One or more link IDs. The maximum is 10.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [provider] :
  /// The link provider.
  ///
  /// Parameter [siteId] :
  /// The ID of the site.
  ///
  /// Parameter [type] :
  /// The link type.
  Future<GetLinksResponse> getLinks({
    required String globalNetworkId,
    List<String>? linkIds,
    int? maxResults,
    String? nextToken,
    String? provider,
    String? siteId,
    String? type,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (linkIds != null) 'linkIds': linkIds,
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (provider != null) 'provider': [provider],
      if (siteId != null) 'siteId': [siteId],
      if (type != null) 'type': [type],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/links',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLinksResponse.fromJson(response);
  }

  /// Gets information about one or more of your sites in a global network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [siteIds] :
  /// One or more site IDs. The maximum is 10.
  Future<GetSitesResponse> getSites({
    required String globalNetworkId,
    int? maxResults,
    String? nextToken,
    List<String>? siteIds,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (siteIds != null) 'siteIds': siteIds,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/sites',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSitesResponse.fromJson(response);
  }

  /// Gets information about one or more of your transit gateway Connect peer
  /// associations in a global network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [transitGatewayConnectPeerArns] :
  /// One or more transit gateway Connect peer Amazon Resource Names (ARNs).
  Future<GetTransitGatewayConnectPeerAssociationsResponse>
      getTransitGatewayConnectPeerAssociations({
    required String globalNetworkId,
    int? maxResults,
    String? nextToken,
    List<String>? transitGatewayConnectPeerArns,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (transitGatewayConnectPeerArns != null)
        'transitGatewayConnectPeerArns': transitGatewayConnectPeerArns,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/transit-gateway-connect-peer-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTransitGatewayConnectPeerAssociationsResponse.fromJson(response);
  }

  /// Gets information about the transit gateway registrations in a specified
  /// global network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [transitGatewayArns] :
  /// The Amazon Resource Names (ARNs) of one or more transit gateways. The
  /// maximum is 10.
  Future<GetTransitGatewayRegistrationsResponse>
      getTransitGatewayRegistrations({
    required String globalNetworkId,
    int? maxResults,
    String? nextToken,
    List<String>? transitGatewayArns,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (transitGatewayArns != null) 'transitGatewayArns': transitGatewayArns,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/transit-gateway-registrations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTransitGatewayRegistrationsResponse.fromJson(response);
  }

  /// Lists the tags for a specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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

  /// Registers a transit gateway in your global network. The transit gateway
  /// can be in any AWS Region, but it must be owned by the same AWS account
  /// that owns the global network. You cannot register a transit gateway in
  /// more than one global network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [transitGatewayArn] :
  /// The Amazon Resource Name (ARN) of the transit gateway. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html#amazonec2-resources-for-iam-policies">Resources
  /// Defined by Amazon EC2</a>.
  Future<RegisterTransitGatewayResponse> registerTransitGateway({
    required String globalNetworkId,
    required String transitGatewayArn,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    ArgumentError.checkNotNull(transitGatewayArn, 'transitGatewayArn');
    final $payload = <String, dynamic>{
      'TransitGatewayArn': transitGatewayArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/transit-gateway-registrations',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterTransitGatewayResponse.fromJson(response);
  }

  /// Tags a specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the specified resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to remove from the specified resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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

  /// Updates the information for an existing connection. To remove information
  /// for any of the parameters, specify an empty string.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [connectedLinkId] :
  /// The ID of the link for the second device in the connection.
  ///
  /// Parameter [description] :
  /// A description of the connection.
  ///
  /// Length Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [linkId] :
  /// The ID of the link for the first device in the connection.
  Future<UpdateConnectionResponse> updateConnection({
    required String connectionId,
    required String globalNetworkId,
    String? connectedLinkId,
    String? description,
    String? linkId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    final $payload = <String, dynamic>{
      if (connectedLinkId != null) 'ConnectedLinkId': connectedLinkId,
      if (description != null) 'Description': description,
      if (linkId != null) 'LinkId': linkId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/connections/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConnectionResponse.fromJson(response);
  }

  /// Updates the details for an existing device. To remove information for any
  /// of the parameters, specify an empty string.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [deviceId] :
  /// The ID of the device.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [awsLocation] :
  /// The AWS location of the device.
  ///
  /// Parameter [description] :
  /// A description of the device.
  ///
  /// Length Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [model] :
  /// The model of the device.
  ///
  /// Length Constraints: Maximum length of 128 characters.
  ///
  /// Parameter [serialNumber] :
  /// The serial number of the device.
  ///
  /// Length Constraints: Maximum length of 128 characters.
  ///
  /// Parameter [siteId] :
  /// The ID of the site.
  ///
  /// Parameter [type] :
  /// The type of the device.
  ///
  /// Parameter [vendor] :
  /// The vendor of the device.
  ///
  /// Length Constraints: Maximum length of 128 characters.
  Future<UpdateDeviceResponse> updateDevice({
    required String deviceId,
    required String globalNetworkId,
    AWSLocation? awsLocation,
    String? description,
    Location? location,
    String? model,
    String? serialNumber,
    String? siteId,
    String? type,
    String? vendor,
  }) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    final $payload = <String, dynamic>{
      if (awsLocation != null) 'AWSLocation': awsLocation,
      if (description != null) 'Description': description,
      if (location != null) 'Location': location,
      if (model != null) 'Model': model,
      if (serialNumber != null) 'SerialNumber': serialNumber,
      if (siteId != null) 'SiteId': siteId,
      if (type != null) 'Type': type,
      if (vendor != null) 'Vendor': vendor,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/devices/${Uri.encodeComponent(deviceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDeviceResponse.fromJson(response);
  }

  /// Updates an existing global network. To remove information for any of the
  /// parameters, specify an empty string.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of your global network.
  ///
  /// Parameter [description] :
  /// A description of the global network.
  ///
  /// Length Constraints: Maximum length of 256 characters.
  Future<UpdateGlobalNetworkResponse> updateGlobalNetwork({
    required String globalNetworkId,
    String? description,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/global-networks/${Uri.encodeComponent(globalNetworkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGlobalNetworkResponse.fromJson(response);
  }

  /// Updates the details for an existing link. To remove information for any of
  /// the parameters, specify an empty string.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [linkId] :
  /// The ID of the link.
  ///
  /// Parameter [bandwidth] :
  /// The upload and download speed in Mbps.
  ///
  /// Parameter [description] :
  /// A description of the link.
  ///
  /// Length Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [provider] :
  /// The provider of the link.
  ///
  /// Length Constraints: Maximum length of 128 characters.
  ///
  /// Parameter [type] :
  /// The type of the link.
  ///
  /// Length Constraints: Maximum length of 128 characters.
  Future<UpdateLinkResponse> updateLink({
    required String globalNetworkId,
    required String linkId,
    Bandwidth? bandwidth,
    String? description,
    String? provider,
    String? type,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    ArgumentError.checkNotNull(linkId, 'linkId');
    final $payload = <String, dynamic>{
      if (bandwidth != null) 'Bandwidth': bandwidth,
      if (description != null) 'Description': description,
      if (provider != null) 'Provider': provider,
      if (type != null) 'Type': type,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/links/${Uri.encodeComponent(linkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLinkResponse.fromJson(response);
  }

  /// Updates the information for an existing site. To remove information for
  /// any of the parameters, specify an empty string.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [siteId] :
  /// The ID of your site.
  ///
  /// Parameter [description] :
  /// A description of your site.
  ///
  /// Length Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [location] :
  /// The site location:
  ///
  /// <ul>
  /// <li>
  /// <code>Address</code>: The physical address of the site.
  /// </li>
  /// <li>
  /// <code>Latitude</code>: The latitude of the site.
  /// </li>
  /// <li>
  /// <code>Longitude</code>: The longitude of the site.
  /// </li>
  /// </ul>
  Future<UpdateSiteResponse> updateSite({
    required String globalNetworkId,
    required String siteId,
    String? description,
    Location? location,
  }) async {
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    ArgumentError.checkNotNull(siteId, 'siteId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (location != null) 'Location': location,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/sites/${Uri.encodeComponent(siteId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSiteResponse.fromJson(response);
  }
}

/// Specifies a location in AWS.
class AWSLocation {
  /// The Amazon Resource Name (ARN) of the subnet the device is located in.
  final String? subnetArn;

  /// The Zone the device is located in. This can be the ID of an Availability
  /// Zone, Local Zone, Wavelength Zone, or an Outpost.
  final String? zone;

  AWSLocation({
    this.subnetArn,
    this.zone,
  });

  factory AWSLocation.fromJson(Map<String, dynamic> json) {
    return AWSLocation(
      subnetArn: json['SubnetArn'] as String?,
      zone: json['Zone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetArn = this.subnetArn;
    final zone = this.zone;
    return {
      if (subnetArn != null) 'SubnetArn': subnetArn,
      if (zone != null) 'Zone': zone,
    };
  }
}

class AssociateCustomerGatewayResponse {
  /// The customer gateway association.
  final CustomerGatewayAssociation? customerGatewayAssociation;

  AssociateCustomerGatewayResponse({
    this.customerGatewayAssociation,
  });

  factory AssociateCustomerGatewayResponse.fromJson(Map<String, dynamic> json) {
    return AssociateCustomerGatewayResponse(
      customerGatewayAssociation: json['CustomerGatewayAssociation'] != null
          ? CustomerGatewayAssociation.fromJson(
              json['CustomerGatewayAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerGatewayAssociation = this.customerGatewayAssociation;
    return {
      if (customerGatewayAssociation != null)
        'CustomerGatewayAssociation': customerGatewayAssociation,
    };
  }
}

class AssociateLinkResponse {
  /// The link association.
  final LinkAssociation? linkAssociation;

  AssociateLinkResponse({
    this.linkAssociation,
  });

  factory AssociateLinkResponse.fromJson(Map<String, dynamic> json) {
    return AssociateLinkResponse(
      linkAssociation: json['LinkAssociation'] != null
          ? LinkAssociation.fromJson(
              json['LinkAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final linkAssociation = this.linkAssociation;
    return {
      if (linkAssociation != null) 'LinkAssociation': linkAssociation,
    };
  }
}

class AssociateTransitGatewayConnectPeerResponse {
  /// The transit gateway Connect peer association.
  final TransitGatewayConnectPeerAssociation?
      transitGatewayConnectPeerAssociation;

  AssociateTransitGatewayConnectPeerResponse({
    this.transitGatewayConnectPeerAssociation,
  });

  factory AssociateTransitGatewayConnectPeerResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateTransitGatewayConnectPeerResponse(
      transitGatewayConnectPeerAssociation:
          json['TransitGatewayConnectPeerAssociation'] != null
              ? TransitGatewayConnectPeerAssociation.fromJson(
                  json['TransitGatewayConnectPeerAssociation']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transitGatewayConnectPeerAssociation =
        this.transitGatewayConnectPeerAssociation;
    return {
      if (transitGatewayConnectPeerAssociation != null)
        'TransitGatewayConnectPeerAssociation':
            transitGatewayConnectPeerAssociation,
    };
  }
}

/// Describes bandwidth information.
class Bandwidth {
  /// Download speed in Mbps.
  final int? downloadSpeed;

  /// Upload speed in Mbps.
  final int? uploadSpeed;

  Bandwidth({
    this.downloadSpeed,
    this.uploadSpeed,
  });

  factory Bandwidth.fromJson(Map<String, dynamic> json) {
    return Bandwidth(
      downloadSpeed: json['DownloadSpeed'] as int?,
      uploadSpeed: json['UploadSpeed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final downloadSpeed = this.downloadSpeed;
    final uploadSpeed = this.uploadSpeed;
    return {
      if (downloadSpeed != null) 'DownloadSpeed': downloadSpeed,
      if (uploadSpeed != null) 'UploadSpeed': uploadSpeed,
    };
  }
}

/// Describes a connection.
class Connection {
  /// The ID of the second device in the connection.
  final String? connectedDeviceId;

  /// The ID of the link for the second device in the connection.
  final String? connectedLinkId;

  /// The Amazon Resource Name (ARN) of the connection.
  final String? connectionArn;

  /// The ID of the connection.
  final String? connectionId;

  /// The date and time that the connection was created.
  final DateTime? createdAt;

  /// The description of the connection.
  final String? description;

  /// The ID of the first device in the connection.
  final String? deviceId;

  /// The ID of the global network.
  final String? globalNetworkId;

  /// The ID of the link for the first device in the connection.
  final String? linkId;

  /// The state of the connection.
  final ConnectionState? state;

  /// The tags for the connection.
  final List<Tag>? tags;

  Connection({
    this.connectedDeviceId,
    this.connectedLinkId,
    this.connectionArn,
    this.connectionId,
    this.createdAt,
    this.description,
    this.deviceId,
    this.globalNetworkId,
    this.linkId,
    this.state,
    this.tags,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      connectedDeviceId: json['ConnectedDeviceId'] as String?,
      connectedLinkId: json['ConnectedLinkId'] as String?,
      connectionArn: json['ConnectionArn'] as String?,
      connectionId: json['ConnectionId'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      deviceId: json['DeviceId'] as String?,
      globalNetworkId: json['GlobalNetworkId'] as String?,
      linkId: json['LinkId'] as String?,
      state: (json['State'] as String?)?.toConnectionState(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectedDeviceId = this.connectedDeviceId;
    final connectedLinkId = this.connectedLinkId;
    final connectionArn = this.connectionArn;
    final connectionId = this.connectionId;
    final createdAt = this.createdAt;
    final description = this.description;
    final deviceId = this.deviceId;
    final globalNetworkId = this.globalNetworkId;
    final linkId = this.linkId;
    final state = this.state;
    final tags = this.tags;
    return {
      if (connectedDeviceId != null) 'ConnectedDeviceId': connectedDeviceId,
      if (connectedLinkId != null) 'ConnectedLinkId': connectedLinkId,
      if (connectionArn != null) 'ConnectionArn': connectionArn,
      if (connectionId != null) 'ConnectionId': connectionId,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (deviceId != null) 'DeviceId': deviceId,
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (linkId != null) 'LinkId': linkId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum ConnectionState {
  pending,
  available,
  deleting,
  updating,
}

extension on ConnectionState {
  String toValue() {
    switch (this) {
      case ConnectionState.pending:
        return 'PENDING';
      case ConnectionState.available:
        return 'AVAILABLE';
      case ConnectionState.deleting:
        return 'DELETING';
      case ConnectionState.updating:
        return 'UPDATING';
    }
  }
}

extension on String {
  ConnectionState toConnectionState() {
    switch (this) {
      case 'PENDING':
        return ConnectionState.pending;
      case 'AVAILABLE':
        return ConnectionState.available;
      case 'DELETING':
        return ConnectionState.deleting;
      case 'UPDATING':
        return ConnectionState.updating;
    }
    throw Exception('$this is not known in enum ConnectionState');
  }
}

class CreateConnectionResponse {
  /// Information about the connection.
  final Connection? connection;

  CreateConnectionResponse({
    this.connection,
  });

  factory CreateConnectionResponse.fromJson(Map<String, dynamic> json) {
    return CreateConnectionResponse(
      connection: json['Connection'] != null
          ? Connection.fromJson(json['Connection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      if (connection != null) 'Connection': connection,
    };
  }
}

class CreateDeviceResponse {
  /// Information about the device.
  final Device? device;

  CreateDeviceResponse({
    this.device,
  });

  factory CreateDeviceResponse.fromJson(Map<String, dynamic> json) {
    return CreateDeviceResponse(
      device: json['Device'] != null
          ? Device.fromJson(json['Device'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final device = this.device;
    return {
      if (device != null) 'Device': device,
    };
  }
}

class CreateGlobalNetworkResponse {
  /// Information about the global network object.
  final GlobalNetwork? globalNetwork;

  CreateGlobalNetworkResponse({
    this.globalNetwork,
  });

  factory CreateGlobalNetworkResponse.fromJson(Map<String, dynamic> json) {
    return CreateGlobalNetworkResponse(
      globalNetwork: json['GlobalNetwork'] != null
          ? GlobalNetwork.fromJson(
              json['GlobalNetwork'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final globalNetwork = this.globalNetwork;
    return {
      if (globalNetwork != null) 'GlobalNetwork': globalNetwork,
    };
  }
}

class CreateLinkResponse {
  /// Information about the link.
  final Link? link;

  CreateLinkResponse({
    this.link,
  });

  factory CreateLinkResponse.fromJson(Map<String, dynamic> json) {
    return CreateLinkResponse(
      link: json['Link'] != null
          ? Link.fromJson(json['Link'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final link = this.link;
    return {
      if (link != null) 'Link': link,
    };
  }
}

class CreateSiteResponse {
  /// Information about the site.
  final Site? site;

  CreateSiteResponse({
    this.site,
  });

  factory CreateSiteResponse.fromJson(Map<String, dynamic> json) {
    return CreateSiteResponse(
      site: json['Site'] != null
          ? Site.fromJson(json['Site'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final site = this.site;
    return {
      if (site != null) 'Site': site,
    };
  }
}

/// Describes the association between a customer gateway, a device, and a link.
class CustomerGatewayAssociation {
  /// The Amazon Resource Name (ARN) of the customer gateway.
  final String? customerGatewayArn;

  /// The ID of the device.
  final String? deviceId;

  /// The ID of the global network.
  final String? globalNetworkId;

  /// The ID of the link.
  final String? linkId;

  /// The association state.
  final CustomerGatewayAssociationState? state;

  CustomerGatewayAssociation({
    this.customerGatewayArn,
    this.deviceId,
    this.globalNetworkId,
    this.linkId,
    this.state,
  });

  factory CustomerGatewayAssociation.fromJson(Map<String, dynamic> json) {
    return CustomerGatewayAssociation(
      customerGatewayArn: json['CustomerGatewayArn'] as String?,
      deviceId: json['DeviceId'] as String?,
      globalNetworkId: json['GlobalNetworkId'] as String?,
      linkId: json['LinkId'] as String?,
      state: (json['State'] as String?)?.toCustomerGatewayAssociationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final customerGatewayArn = this.customerGatewayArn;
    final deviceId = this.deviceId;
    final globalNetworkId = this.globalNetworkId;
    final linkId = this.linkId;
    final state = this.state;
    return {
      if (customerGatewayArn != null) 'CustomerGatewayArn': customerGatewayArn,
      if (deviceId != null) 'DeviceId': deviceId,
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (linkId != null) 'LinkId': linkId,
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum CustomerGatewayAssociationState {
  pending,
  available,
  deleting,
  deleted,
}

extension on CustomerGatewayAssociationState {
  String toValue() {
    switch (this) {
      case CustomerGatewayAssociationState.pending:
        return 'PENDING';
      case CustomerGatewayAssociationState.available:
        return 'AVAILABLE';
      case CustomerGatewayAssociationState.deleting:
        return 'DELETING';
      case CustomerGatewayAssociationState.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  CustomerGatewayAssociationState toCustomerGatewayAssociationState() {
    switch (this) {
      case 'PENDING':
        return CustomerGatewayAssociationState.pending;
      case 'AVAILABLE':
        return CustomerGatewayAssociationState.available;
      case 'DELETING':
        return CustomerGatewayAssociationState.deleting;
      case 'DELETED':
        return CustomerGatewayAssociationState.deleted;
    }
    throw Exception(
        '$this is not known in enum CustomerGatewayAssociationState');
  }
}

class DeleteConnectionResponse {
  /// Information about the connection.
  final Connection? connection;

  DeleteConnectionResponse({
    this.connection,
  });

  factory DeleteConnectionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteConnectionResponse(
      connection: json['Connection'] != null
          ? Connection.fromJson(json['Connection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      if (connection != null) 'Connection': connection,
    };
  }
}

class DeleteDeviceResponse {
  /// Information about the device.
  final Device? device;

  DeleteDeviceResponse({
    this.device,
  });

  factory DeleteDeviceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDeviceResponse(
      device: json['Device'] != null
          ? Device.fromJson(json['Device'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final device = this.device;
    return {
      if (device != null) 'Device': device,
    };
  }
}

class DeleteGlobalNetworkResponse {
  /// Information about the global network.
  final GlobalNetwork? globalNetwork;

  DeleteGlobalNetworkResponse({
    this.globalNetwork,
  });

  factory DeleteGlobalNetworkResponse.fromJson(Map<String, dynamic> json) {
    return DeleteGlobalNetworkResponse(
      globalNetwork: json['GlobalNetwork'] != null
          ? GlobalNetwork.fromJson(
              json['GlobalNetwork'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final globalNetwork = this.globalNetwork;
    return {
      if (globalNetwork != null) 'GlobalNetwork': globalNetwork,
    };
  }
}

class DeleteLinkResponse {
  /// Information about the link.
  final Link? link;

  DeleteLinkResponse({
    this.link,
  });

  factory DeleteLinkResponse.fromJson(Map<String, dynamic> json) {
    return DeleteLinkResponse(
      link: json['Link'] != null
          ? Link.fromJson(json['Link'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final link = this.link;
    return {
      if (link != null) 'Link': link,
    };
  }
}

class DeleteSiteResponse {
  /// Information about the site.
  final Site? site;

  DeleteSiteResponse({
    this.site,
  });

  factory DeleteSiteResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSiteResponse(
      site: json['Site'] != null
          ? Site.fromJson(json['Site'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final site = this.site;
    return {
      if (site != null) 'Site': site,
    };
  }
}

class DeregisterTransitGatewayResponse {
  /// The transit gateway registration information.
  final TransitGatewayRegistration? transitGatewayRegistration;

  DeregisterTransitGatewayResponse({
    this.transitGatewayRegistration,
  });

  factory DeregisterTransitGatewayResponse.fromJson(Map<String, dynamic> json) {
    return DeregisterTransitGatewayResponse(
      transitGatewayRegistration: json['TransitGatewayRegistration'] != null
          ? TransitGatewayRegistration.fromJson(
              json['TransitGatewayRegistration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transitGatewayRegistration = this.transitGatewayRegistration;
    return {
      if (transitGatewayRegistration != null)
        'TransitGatewayRegistration': transitGatewayRegistration,
    };
  }
}

class DescribeGlobalNetworksResponse {
  /// Information about the global networks.
  final List<GlobalNetwork>? globalNetworks;

  /// The token for the next page of results.
  final String? nextToken;

  DescribeGlobalNetworksResponse({
    this.globalNetworks,
    this.nextToken,
  });

  factory DescribeGlobalNetworksResponse.fromJson(Map<String, dynamic> json) {
    return DescribeGlobalNetworksResponse(
      globalNetworks: (json['GlobalNetworks'] as List?)
          ?.whereNotNull()
          .map((e) => GlobalNetwork.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final globalNetworks = this.globalNetworks;
    final nextToken = this.nextToken;
    return {
      if (globalNetworks != null) 'GlobalNetworks': globalNetworks,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Describes a device.
class Device {
  /// The AWS location of the device.
  final AWSLocation? awsLocation;

  /// The date and time that the site was created.
  final DateTime? createdAt;

  /// The description of the device.
  final String? description;

  /// The Amazon Resource Name (ARN) of the device.
  final String? deviceArn;

  /// The ID of the device.
  final String? deviceId;

  /// The ID of the global network.
  final String? globalNetworkId;

  /// The site location.
  final Location? location;

  /// The device model.
  final String? model;

  /// The device serial number.
  final String? serialNumber;

  /// The site ID.
  final String? siteId;

  /// The device state.
  final DeviceState? state;

  /// The tags for the device.
  final List<Tag>? tags;

  /// The device type.
  final String? type;

  /// The device vendor.
  final String? vendor;

  Device({
    this.awsLocation,
    this.createdAt,
    this.description,
    this.deviceArn,
    this.deviceId,
    this.globalNetworkId,
    this.location,
    this.model,
    this.serialNumber,
    this.siteId,
    this.state,
    this.tags,
    this.type,
    this.vendor,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      awsLocation: json['AWSLocation'] != null
          ? AWSLocation.fromJson(json['AWSLocation'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      deviceArn: json['DeviceArn'] as String?,
      deviceId: json['DeviceId'] as String?,
      globalNetworkId: json['GlobalNetworkId'] as String?,
      location: json['Location'] != null
          ? Location.fromJson(json['Location'] as Map<String, dynamic>)
          : null,
      model: json['Model'] as String?,
      serialNumber: json['SerialNumber'] as String?,
      siteId: json['SiteId'] as String?,
      state: (json['State'] as String?)?.toDeviceState(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['Type'] as String?,
      vendor: json['Vendor'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsLocation = this.awsLocation;
    final createdAt = this.createdAt;
    final description = this.description;
    final deviceArn = this.deviceArn;
    final deviceId = this.deviceId;
    final globalNetworkId = this.globalNetworkId;
    final location = this.location;
    final model = this.model;
    final serialNumber = this.serialNumber;
    final siteId = this.siteId;
    final state = this.state;
    final tags = this.tags;
    final type = this.type;
    final vendor = this.vendor;
    return {
      if (awsLocation != null) 'AWSLocation': awsLocation,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (deviceArn != null) 'DeviceArn': deviceArn,
      if (deviceId != null) 'DeviceId': deviceId,
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (location != null) 'Location': location,
      if (model != null) 'Model': model,
      if (serialNumber != null) 'SerialNumber': serialNumber,
      if (siteId != null) 'SiteId': siteId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type,
      if (vendor != null) 'Vendor': vendor,
    };
  }
}

enum DeviceState {
  pending,
  available,
  deleting,
  updating,
}

extension on DeviceState {
  String toValue() {
    switch (this) {
      case DeviceState.pending:
        return 'PENDING';
      case DeviceState.available:
        return 'AVAILABLE';
      case DeviceState.deleting:
        return 'DELETING';
      case DeviceState.updating:
        return 'UPDATING';
    }
  }
}

extension on String {
  DeviceState toDeviceState() {
    switch (this) {
      case 'PENDING':
        return DeviceState.pending;
      case 'AVAILABLE':
        return DeviceState.available;
      case 'DELETING':
        return DeviceState.deleting;
      case 'UPDATING':
        return DeviceState.updating;
    }
    throw Exception('$this is not known in enum DeviceState');
  }
}

class DisassociateCustomerGatewayResponse {
  /// Information about the customer gateway association.
  final CustomerGatewayAssociation? customerGatewayAssociation;

  DisassociateCustomerGatewayResponse({
    this.customerGatewayAssociation,
  });

  factory DisassociateCustomerGatewayResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateCustomerGatewayResponse(
      customerGatewayAssociation: json['CustomerGatewayAssociation'] != null
          ? CustomerGatewayAssociation.fromJson(
              json['CustomerGatewayAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerGatewayAssociation = this.customerGatewayAssociation;
    return {
      if (customerGatewayAssociation != null)
        'CustomerGatewayAssociation': customerGatewayAssociation,
    };
  }
}

class DisassociateLinkResponse {
  /// Information about the link association.
  final LinkAssociation? linkAssociation;

  DisassociateLinkResponse({
    this.linkAssociation,
  });

  factory DisassociateLinkResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateLinkResponse(
      linkAssociation: json['LinkAssociation'] != null
          ? LinkAssociation.fromJson(
              json['LinkAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final linkAssociation = this.linkAssociation;
    return {
      if (linkAssociation != null) 'LinkAssociation': linkAssociation,
    };
  }
}

class DisassociateTransitGatewayConnectPeerResponse {
  /// The transit gateway Connect peer association.
  final TransitGatewayConnectPeerAssociation?
      transitGatewayConnectPeerAssociation;

  DisassociateTransitGatewayConnectPeerResponse({
    this.transitGatewayConnectPeerAssociation,
  });

  factory DisassociateTransitGatewayConnectPeerResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateTransitGatewayConnectPeerResponse(
      transitGatewayConnectPeerAssociation:
          json['TransitGatewayConnectPeerAssociation'] != null
              ? TransitGatewayConnectPeerAssociation.fromJson(
                  json['TransitGatewayConnectPeerAssociation']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transitGatewayConnectPeerAssociation =
        this.transitGatewayConnectPeerAssociation;
    return {
      if (transitGatewayConnectPeerAssociation != null)
        'TransitGatewayConnectPeerAssociation':
            transitGatewayConnectPeerAssociation,
    };
  }
}

class GetConnectionsResponse {
  /// Information about the connections.
  final List<Connection>? connections;

  /// The token to use for the next page of results.
  final String? nextToken;

  GetConnectionsResponse({
    this.connections,
    this.nextToken,
  });

  factory GetConnectionsResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectionsResponse(
      connections: (json['Connections'] as List?)
          ?.whereNotNull()
          .map((e) => Connection.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    final nextToken = this.nextToken;
    return {
      if (connections != null) 'Connections': connections,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetCustomerGatewayAssociationsResponse {
  /// The customer gateway associations.
  final List<CustomerGatewayAssociation>? customerGatewayAssociations;

  /// The token for the next page of results.
  final String? nextToken;

  GetCustomerGatewayAssociationsResponse({
    this.customerGatewayAssociations,
    this.nextToken,
  });

  factory GetCustomerGatewayAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCustomerGatewayAssociationsResponse(
      customerGatewayAssociations: (json['CustomerGatewayAssociations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              CustomerGatewayAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customerGatewayAssociations = this.customerGatewayAssociations;
    final nextToken = this.nextToken;
    return {
      if (customerGatewayAssociations != null)
        'CustomerGatewayAssociations': customerGatewayAssociations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetDevicesResponse {
  /// The devices.
  final List<Device>? devices;

  /// The token for the next page of results.
  final String? nextToken;

  GetDevicesResponse({
    this.devices,
    this.nextToken,
  });

  factory GetDevicesResponse.fromJson(Map<String, dynamic> json) {
    return GetDevicesResponse(
      devices: (json['Devices'] as List?)
          ?.whereNotNull()
          .map((e) => Device.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devices = this.devices;
    final nextToken = this.nextToken;
    return {
      if (devices != null) 'Devices': devices,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetLinkAssociationsResponse {
  /// The link associations.
  final List<LinkAssociation>? linkAssociations;

  /// The token for the next page of results.
  final String? nextToken;

  GetLinkAssociationsResponse({
    this.linkAssociations,
    this.nextToken,
  });

  factory GetLinkAssociationsResponse.fromJson(Map<String, dynamic> json) {
    return GetLinkAssociationsResponse(
      linkAssociations: (json['LinkAssociations'] as List?)
          ?.whereNotNull()
          .map((e) => LinkAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final linkAssociations = this.linkAssociations;
    final nextToken = this.nextToken;
    return {
      if (linkAssociations != null) 'LinkAssociations': linkAssociations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetLinksResponse {
  /// The links.
  final List<Link>? links;

  /// The token for the next page of results.
  final String? nextToken;

  GetLinksResponse({
    this.links,
    this.nextToken,
  });

  factory GetLinksResponse.fromJson(Map<String, dynamic> json) {
    return GetLinksResponse(
      links: (json['Links'] as List?)
          ?.whereNotNull()
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final links = this.links;
    final nextToken = this.nextToken;
    return {
      if (links != null) 'Links': links,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetSitesResponse {
  /// The token for the next page of results.
  final String? nextToken;

  /// The sites.
  final List<Site>? sites;

  GetSitesResponse({
    this.nextToken,
    this.sites,
  });

  factory GetSitesResponse.fromJson(Map<String, dynamic> json) {
    return GetSitesResponse(
      nextToken: json['NextToken'] as String?,
      sites: (json['Sites'] as List?)
          ?.whereNotNull()
          .map((e) => Site.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sites = this.sites;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sites != null) 'Sites': sites,
    };
  }
}

class GetTransitGatewayConnectPeerAssociationsResponse {
  /// The token to use for the next page of results.
  final String? nextToken;

  /// Information about the transit gateway Connect peer associations.
  final List<TransitGatewayConnectPeerAssociation>?
      transitGatewayConnectPeerAssociations;

  GetTransitGatewayConnectPeerAssociationsResponse({
    this.nextToken,
    this.transitGatewayConnectPeerAssociations,
  });

  factory GetTransitGatewayConnectPeerAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTransitGatewayConnectPeerAssociationsResponse(
      nextToken: json['NextToken'] as String?,
      transitGatewayConnectPeerAssociations:
          (json['TransitGatewayConnectPeerAssociations'] as List?)
              ?.whereNotNull()
              .map((e) => TransitGatewayConnectPeerAssociation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final transitGatewayConnectPeerAssociations =
        this.transitGatewayConnectPeerAssociations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (transitGatewayConnectPeerAssociations != null)
        'TransitGatewayConnectPeerAssociations':
            transitGatewayConnectPeerAssociations,
    };
  }
}

class GetTransitGatewayRegistrationsResponse {
  /// The token for the next page of results.
  final String? nextToken;

  /// The transit gateway registrations.
  final List<TransitGatewayRegistration>? transitGatewayRegistrations;

  GetTransitGatewayRegistrationsResponse({
    this.nextToken,
    this.transitGatewayRegistrations,
  });

  factory GetTransitGatewayRegistrationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTransitGatewayRegistrationsResponse(
      nextToken: json['NextToken'] as String?,
      transitGatewayRegistrations: (json['TransitGatewayRegistrations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              TransitGatewayRegistration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final transitGatewayRegistrations = this.transitGatewayRegistrations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (transitGatewayRegistrations != null)
        'TransitGatewayRegistrations': transitGatewayRegistrations,
    };
  }
}

/// Describes a global network.
class GlobalNetwork {
  /// The date and time that the global network was created.
  final DateTime? createdAt;

  /// The description of the global network.
  final String? description;

  /// The Amazon Resource Name (ARN) of the global network.
  final String? globalNetworkArn;

  /// The ID of the global network.
  final String? globalNetworkId;

  /// The state of the global network.
  final GlobalNetworkState? state;

  /// The tags for the global network.
  final List<Tag>? tags;

  GlobalNetwork({
    this.createdAt,
    this.description,
    this.globalNetworkArn,
    this.globalNetworkId,
    this.state,
    this.tags,
  });

  factory GlobalNetwork.fromJson(Map<String, dynamic> json) {
    return GlobalNetwork(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      globalNetworkArn: json['GlobalNetworkArn'] as String?,
      globalNetworkId: json['GlobalNetworkId'] as String?,
      state: (json['State'] as String?)?.toGlobalNetworkState(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final globalNetworkArn = this.globalNetworkArn;
    final globalNetworkId = this.globalNetworkId;
    final state = this.state;
    final tags = this.tags;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (globalNetworkArn != null) 'GlobalNetworkArn': globalNetworkArn,
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum GlobalNetworkState {
  pending,
  available,
  deleting,
  updating,
}

extension on GlobalNetworkState {
  String toValue() {
    switch (this) {
      case GlobalNetworkState.pending:
        return 'PENDING';
      case GlobalNetworkState.available:
        return 'AVAILABLE';
      case GlobalNetworkState.deleting:
        return 'DELETING';
      case GlobalNetworkState.updating:
        return 'UPDATING';
    }
  }
}

extension on String {
  GlobalNetworkState toGlobalNetworkState() {
    switch (this) {
      case 'PENDING':
        return GlobalNetworkState.pending;
      case 'AVAILABLE':
        return GlobalNetworkState.available;
      case 'DELETING':
        return GlobalNetworkState.deleting;
      case 'UPDATING':
        return GlobalNetworkState.updating;
    }
    throw Exception('$this is not known in enum GlobalNetworkState');
  }
}

/// Describes a link.
class Link {
  /// The bandwidth for the link.
  final Bandwidth? bandwidth;

  /// The date and time that the link was created.
  final DateTime? createdAt;

  /// The description of the link.
  final String? description;

  /// The ID of the global network.
  final String? globalNetworkId;

  /// The Amazon Resource Name (ARN) of the link.
  final String? linkArn;

  /// The ID of the link.
  final String? linkId;

  /// The provider of the link.
  final String? provider;

  /// The ID of the site.
  final String? siteId;

  /// The state of the link.
  final LinkState? state;

  /// The tags for the link.
  final List<Tag>? tags;

  /// The type of the link.
  final String? type;

  Link({
    this.bandwidth,
    this.createdAt,
    this.description,
    this.globalNetworkId,
    this.linkArn,
    this.linkId,
    this.provider,
    this.siteId,
    this.state,
    this.tags,
    this.type,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      bandwidth: json['Bandwidth'] != null
          ? Bandwidth.fromJson(json['Bandwidth'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      globalNetworkId: json['GlobalNetworkId'] as String?,
      linkArn: json['LinkArn'] as String?,
      linkId: json['LinkId'] as String?,
      provider: json['Provider'] as String?,
      siteId: json['SiteId'] as String?,
      state: (json['State'] as String?)?.toLinkState(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bandwidth = this.bandwidth;
    final createdAt = this.createdAt;
    final description = this.description;
    final globalNetworkId = this.globalNetworkId;
    final linkArn = this.linkArn;
    final linkId = this.linkId;
    final provider = this.provider;
    final siteId = this.siteId;
    final state = this.state;
    final tags = this.tags;
    final type = this.type;
    return {
      if (bandwidth != null) 'Bandwidth': bandwidth,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (linkArn != null) 'LinkArn': linkArn,
      if (linkId != null) 'LinkId': linkId,
      if (provider != null) 'Provider': provider,
      if (siteId != null) 'SiteId': siteId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type,
    };
  }
}

/// Describes the association between a device and a link.
class LinkAssociation {
  /// The device ID for the link association.
  final String? deviceId;

  /// The ID of the global network.
  final String? globalNetworkId;

  /// The state of the association.
  final LinkAssociationState? linkAssociationState;

  /// The ID of the link.
  final String? linkId;

  LinkAssociation({
    this.deviceId,
    this.globalNetworkId,
    this.linkAssociationState,
    this.linkId,
  });

  factory LinkAssociation.fromJson(Map<String, dynamic> json) {
    return LinkAssociation(
      deviceId: json['DeviceId'] as String?,
      globalNetworkId: json['GlobalNetworkId'] as String?,
      linkAssociationState:
          (json['LinkAssociationState'] as String?)?.toLinkAssociationState(),
      linkId: json['LinkId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final globalNetworkId = this.globalNetworkId;
    final linkAssociationState = this.linkAssociationState;
    final linkId = this.linkId;
    return {
      if (deviceId != null) 'DeviceId': deviceId,
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (linkAssociationState != null)
        'LinkAssociationState': linkAssociationState.toValue(),
      if (linkId != null) 'LinkId': linkId,
    };
  }
}

enum LinkAssociationState {
  pending,
  available,
  deleting,
  deleted,
}

extension on LinkAssociationState {
  String toValue() {
    switch (this) {
      case LinkAssociationState.pending:
        return 'PENDING';
      case LinkAssociationState.available:
        return 'AVAILABLE';
      case LinkAssociationState.deleting:
        return 'DELETING';
      case LinkAssociationState.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  LinkAssociationState toLinkAssociationState() {
    switch (this) {
      case 'PENDING':
        return LinkAssociationState.pending;
      case 'AVAILABLE':
        return LinkAssociationState.available;
      case 'DELETING':
        return LinkAssociationState.deleting;
      case 'DELETED':
        return LinkAssociationState.deleted;
    }
    throw Exception('$this is not known in enum LinkAssociationState');
  }
}

enum LinkState {
  pending,
  available,
  deleting,
  updating,
}

extension on LinkState {
  String toValue() {
    switch (this) {
      case LinkState.pending:
        return 'PENDING';
      case LinkState.available:
        return 'AVAILABLE';
      case LinkState.deleting:
        return 'DELETING';
      case LinkState.updating:
        return 'UPDATING';
    }
  }
}

extension on String {
  LinkState toLinkState() {
    switch (this) {
      case 'PENDING':
        return LinkState.pending;
      case 'AVAILABLE':
        return LinkState.available;
      case 'DELETING':
        return LinkState.deleting;
      case 'UPDATING':
        return LinkState.updating;
    }
    throw Exception('$this is not known in enum LinkState');
  }
}

class ListTagsForResourceResponse {
  /// The list of tags.
  final List<Tag>? tagList;

  ListTagsForResourceResponse({
    this.tagList,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tagList: (json['TagList'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagList = this.tagList;
    return {
      if (tagList != null) 'TagList': tagList,
    };
  }
}

/// Describes a location.
class Location {
  /// The physical address.
  final String? address;

  /// The latitude.
  final String? latitude;

  /// The longitude.
  final String? longitude;

  Location({
    this.address,
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['Address'] as String?,
      latitude: json['Latitude'] as String?,
      longitude: json['Longitude'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final latitude = this.latitude;
    final longitude = this.longitude;
    return {
      if (address != null) 'Address': address,
      if (latitude != null) 'Latitude': latitude,
      if (longitude != null) 'Longitude': longitude,
    };
  }
}

class RegisterTransitGatewayResponse {
  /// Information about the transit gateway registration.
  final TransitGatewayRegistration? transitGatewayRegistration;

  RegisterTransitGatewayResponse({
    this.transitGatewayRegistration,
  });

  factory RegisterTransitGatewayResponse.fromJson(Map<String, dynamic> json) {
    return RegisterTransitGatewayResponse(
      transitGatewayRegistration: json['TransitGatewayRegistration'] != null
          ? TransitGatewayRegistration.fromJson(
              json['TransitGatewayRegistration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transitGatewayRegistration = this.transitGatewayRegistration;
    return {
      if (transitGatewayRegistration != null)
        'TransitGatewayRegistration': transitGatewayRegistration,
    };
  }
}

/// Describes a site.
class Site {
  /// The date and time that the site was created.
  final DateTime? createdAt;

  /// The description of the site.
  final String? description;

  /// The ID of the global network.
  final String? globalNetworkId;

  /// The location of the site.
  final Location? location;

  /// The Amazon Resource Name (ARN) of the site.
  final String? siteArn;

  /// The ID of the site.
  final String? siteId;

  /// The state of the site.
  final SiteState? state;

  /// The tags for the site.
  final List<Tag>? tags;

  Site({
    this.createdAt,
    this.description,
    this.globalNetworkId,
    this.location,
    this.siteArn,
    this.siteId,
    this.state,
    this.tags,
  });

  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      globalNetworkId: json['GlobalNetworkId'] as String?,
      location: json['Location'] != null
          ? Location.fromJson(json['Location'] as Map<String, dynamic>)
          : null,
      siteArn: json['SiteArn'] as String?,
      siteId: json['SiteId'] as String?,
      state: (json['State'] as String?)?.toSiteState(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final globalNetworkId = this.globalNetworkId;
    final location = this.location;
    final siteArn = this.siteArn;
    final siteId = this.siteId;
    final state = this.state;
    final tags = this.tags;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (location != null) 'Location': location,
      if (siteArn != null) 'SiteArn': siteArn,
      if (siteId != null) 'SiteId': siteId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum SiteState {
  pending,
  available,
  deleting,
  updating,
}

extension on SiteState {
  String toValue() {
    switch (this) {
      case SiteState.pending:
        return 'PENDING';
      case SiteState.available:
        return 'AVAILABLE';
      case SiteState.deleting:
        return 'DELETING';
      case SiteState.updating:
        return 'UPDATING';
    }
  }
}

extension on String {
  SiteState toSiteState() {
    switch (this) {
      case 'PENDING':
        return SiteState.pending;
      case 'AVAILABLE':
        return SiteState.available;
      case 'DELETING':
        return SiteState.deleting;
      case 'UPDATING':
        return SiteState.updating;
    }
    throw Exception('$this is not known in enum SiteState');
  }
}

/// Describes a tag.
class Tag {
  /// The tag key.
  ///
  /// Length Constraints: Maximum length of 128 characters.
  final String? key;

  /// The tag value.
  ///
  /// Length Constraints: Maximum length of 256 characters.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
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

/// Describes a transit gateway Connect peer association.
class TransitGatewayConnectPeerAssociation {
  /// The ID of the device.
  final String? deviceId;

  /// The ID of the global network.
  final String? globalNetworkId;

  /// The ID of the link.
  final String? linkId;

  /// The state of the association.
  final TransitGatewayConnectPeerAssociationState? state;

  /// The Amazon Resource Name (ARN) of the transit gateway Connect peer.
  final String? transitGatewayConnectPeerArn;

  TransitGatewayConnectPeerAssociation({
    this.deviceId,
    this.globalNetworkId,
    this.linkId,
    this.state,
    this.transitGatewayConnectPeerArn,
  });

  factory TransitGatewayConnectPeerAssociation.fromJson(
      Map<String, dynamic> json) {
    return TransitGatewayConnectPeerAssociation(
      deviceId: json['DeviceId'] as String?,
      globalNetworkId: json['GlobalNetworkId'] as String?,
      linkId: json['LinkId'] as String?,
      state: (json['State'] as String?)
          ?.toTransitGatewayConnectPeerAssociationState(),
      transitGatewayConnectPeerArn:
          json['TransitGatewayConnectPeerArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceId = this.deviceId;
    final globalNetworkId = this.globalNetworkId;
    final linkId = this.linkId;
    final state = this.state;
    final transitGatewayConnectPeerArn = this.transitGatewayConnectPeerArn;
    return {
      if (deviceId != null) 'DeviceId': deviceId,
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (linkId != null) 'LinkId': linkId,
      if (state != null) 'State': state.toValue(),
      if (transitGatewayConnectPeerArn != null)
        'TransitGatewayConnectPeerArn': transitGatewayConnectPeerArn,
    };
  }
}

enum TransitGatewayConnectPeerAssociationState {
  pending,
  available,
  deleting,
  deleted,
}

extension on TransitGatewayConnectPeerAssociationState {
  String toValue() {
    switch (this) {
      case TransitGatewayConnectPeerAssociationState.pending:
        return 'PENDING';
      case TransitGatewayConnectPeerAssociationState.available:
        return 'AVAILABLE';
      case TransitGatewayConnectPeerAssociationState.deleting:
        return 'DELETING';
      case TransitGatewayConnectPeerAssociationState.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  TransitGatewayConnectPeerAssociationState
      toTransitGatewayConnectPeerAssociationState() {
    switch (this) {
      case 'PENDING':
        return TransitGatewayConnectPeerAssociationState.pending;
      case 'AVAILABLE':
        return TransitGatewayConnectPeerAssociationState.available;
      case 'DELETING':
        return TransitGatewayConnectPeerAssociationState.deleting;
      case 'DELETED':
        return TransitGatewayConnectPeerAssociationState.deleted;
    }
    throw Exception(
        '$this is not known in enum TransitGatewayConnectPeerAssociationState');
  }
}

/// Describes the registration of a transit gateway to a global network.
class TransitGatewayRegistration {
  /// The ID of the global network.
  final String? globalNetworkId;

  /// The state of the transit gateway registration.
  final TransitGatewayRegistrationStateReason? state;

  /// The Amazon Resource Name (ARN) of the transit gateway.
  final String? transitGatewayArn;

  TransitGatewayRegistration({
    this.globalNetworkId,
    this.state,
    this.transitGatewayArn,
  });

  factory TransitGatewayRegistration.fromJson(Map<String, dynamic> json) {
    return TransitGatewayRegistration(
      globalNetworkId: json['GlobalNetworkId'] as String?,
      state: json['State'] != null
          ? TransitGatewayRegistrationStateReason.fromJson(
              json['State'] as Map<String, dynamic>)
          : null,
      transitGatewayArn: json['TransitGatewayArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final globalNetworkId = this.globalNetworkId;
    final state = this.state;
    final transitGatewayArn = this.transitGatewayArn;
    return {
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (state != null) 'State': state,
      if (transitGatewayArn != null) 'TransitGatewayArn': transitGatewayArn,
    };
  }
}

enum TransitGatewayRegistrationState {
  pending,
  available,
  deleting,
  deleted,
  failed,
}

extension on TransitGatewayRegistrationState {
  String toValue() {
    switch (this) {
      case TransitGatewayRegistrationState.pending:
        return 'PENDING';
      case TransitGatewayRegistrationState.available:
        return 'AVAILABLE';
      case TransitGatewayRegistrationState.deleting:
        return 'DELETING';
      case TransitGatewayRegistrationState.deleted:
        return 'DELETED';
      case TransitGatewayRegistrationState.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  TransitGatewayRegistrationState toTransitGatewayRegistrationState() {
    switch (this) {
      case 'PENDING':
        return TransitGatewayRegistrationState.pending;
      case 'AVAILABLE':
        return TransitGatewayRegistrationState.available;
      case 'DELETING':
        return TransitGatewayRegistrationState.deleting;
      case 'DELETED':
        return TransitGatewayRegistrationState.deleted;
      case 'FAILED':
        return TransitGatewayRegistrationState.failed;
    }
    throw Exception(
        '$this is not known in enum TransitGatewayRegistrationState');
  }
}

/// Describes the status of a transit gateway registration.
class TransitGatewayRegistrationStateReason {
  /// The code for the state reason.
  final TransitGatewayRegistrationState? code;

  /// The message for the state reason.
  final String? message;

  TransitGatewayRegistrationStateReason({
    this.code,
    this.message,
  });

  factory TransitGatewayRegistrationStateReason.fromJson(
      Map<String, dynamic> json) {
    return TransitGatewayRegistrationStateReason(
      code: (json['Code'] as String?)?.toTransitGatewayRegistrationState(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
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

class UpdateConnectionResponse {
  /// Information about the connection.
  final Connection? connection;

  UpdateConnectionResponse({
    this.connection,
  });

  factory UpdateConnectionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateConnectionResponse(
      connection: json['Connection'] != null
          ? Connection.fromJson(json['Connection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connection = this.connection;
    return {
      if (connection != null) 'Connection': connection,
    };
  }
}

class UpdateDeviceResponse {
  /// Information about the device.
  final Device? device;

  UpdateDeviceResponse({
    this.device,
  });

  factory UpdateDeviceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDeviceResponse(
      device: json['Device'] != null
          ? Device.fromJson(json['Device'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final device = this.device;
    return {
      if (device != null) 'Device': device,
    };
  }
}

class UpdateGlobalNetworkResponse {
  /// Information about the global network object.
  final GlobalNetwork? globalNetwork;

  UpdateGlobalNetworkResponse({
    this.globalNetwork,
  });

  factory UpdateGlobalNetworkResponse.fromJson(Map<String, dynamic> json) {
    return UpdateGlobalNetworkResponse(
      globalNetwork: json['GlobalNetwork'] != null
          ? GlobalNetwork.fromJson(
              json['GlobalNetwork'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final globalNetwork = this.globalNetwork;
    return {
      if (globalNetwork != null) 'GlobalNetwork': globalNetwork,
    };
  }
}

class UpdateLinkResponse {
  /// Information about the link.
  final Link? link;

  UpdateLinkResponse({
    this.link,
  });

  factory UpdateLinkResponse.fromJson(Map<String, dynamic> json) {
    return UpdateLinkResponse(
      link: json['Link'] != null
          ? Link.fromJson(json['Link'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final link = this.link;
    return {
      if (link != null) 'Link': link,
    };
  }
}

class UpdateSiteResponse {
  /// Information about the site.
  final Site? site;

  UpdateSiteResponse({
    this.site,
  });

  factory UpdateSiteResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSiteResponse(
      site: json['Site'] != null
          ? Site.fromJson(json['Site'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final site = this.site;
    return {
      if (site != null) 'Site': site,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
