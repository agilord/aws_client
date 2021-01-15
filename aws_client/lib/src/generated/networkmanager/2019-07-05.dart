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

part '2019-07-05.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String customerGatewayArn,
    @_s.required String deviceId,
    @_s.required String globalNetworkId,
    String linkId,
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
    @_s.required String deviceId,
    @_s.required String globalNetworkId,
    @_s.required String linkId,
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
    @_s.required String deviceId,
    @_s.required String globalNetworkId,
    @_s.required String transitGatewayConnectPeerArn,
    String linkId,
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
    @_s.required String connectedDeviceId,
    @_s.required String deviceId,
    @_s.required String globalNetworkId,
    String connectedLinkId,
    String description,
    String linkId,
    List<Tag> tags,
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
    @_s.required String globalNetworkId,
    AWSLocation awsLocation,
    String description,
    Location location,
    String model,
    String serialNumber,
    String siteId,
    List<Tag> tags,
    String type,
    String vendor,
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
    String description,
    List<Tag> tags,
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
    @_s.required Bandwidth bandwidth,
    @_s.required String globalNetworkId,
    @_s.required String siteId,
    String description,
    String provider,
    List<Tag> tags,
    String type,
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
    @_s.required String globalNetworkId,
    String description,
    Location location,
    List<Tag> tags,
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
    @_s.required String connectionId,
    @_s.required String globalNetworkId,
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
    @_s.required String deviceId,
    @_s.required String globalNetworkId,
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
    @_s.required String globalNetworkId,
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
    @_s.required String globalNetworkId,
    @_s.required String linkId,
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
    @_s.required String globalNetworkId,
    @_s.required String siteId,
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
    @_s.required String globalNetworkId,
    @_s.required String transitGatewayArn,
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
    List<String> globalNetworkIds,
    int maxResults,
    String nextToken,
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
    @_s.required String customerGatewayArn,
    @_s.required String globalNetworkId,
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
    @_s.required String deviceId,
    @_s.required String globalNetworkId,
    @_s.required String linkId,
  }) async {
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    ArgumentError.checkNotNull(globalNetworkId, 'globalNetworkId');
    ArgumentError.checkNotNull(linkId, 'linkId');
    final $query = <String, List<String>>{
      if (deviceId != null) 'deviceId': [deviceId],
      if (linkId != null) 'linkId': [linkId],
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
    @_s.required String globalNetworkId,
    @_s.required String transitGatewayConnectPeerArn,
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
    @_s.required String globalNetworkId,
    List<String> connectionIds,
    String deviceId,
    int maxResults,
    String nextToken,
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
    @_s.required String globalNetworkId,
    List<String> customerGatewayArns,
    int maxResults,
    String nextToken,
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
    @_s.required String globalNetworkId,
    List<String> deviceIds,
    int maxResults,
    String nextToken,
    String siteId,
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
    @_s.required String globalNetworkId,
    String deviceId,
    String linkId,
    int maxResults,
    String nextToken,
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
    @_s.required String globalNetworkId,
    List<String> linkIds,
    int maxResults,
    String nextToken,
    String provider,
    String siteId,
    String type,
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
    @_s.required String globalNetworkId,
    int maxResults,
    String nextToken,
    List<String> siteIds,
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
    @_s.required String globalNetworkId,
    int maxResults,
    String nextToken,
    List<String> transitGatewayConnectPeerArns,
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
    @_s.required String globalNetworkId,
    int maxResults,
    String nextToken,
    List<String> transitGatewayArns,
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
    @_s.required String globalNetworkId,
    @_s.required String transitGatewayArn,
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
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
    @_s.required String connectionId,
    @_s.required String globalNetworkId,
    String connectedLinkId,
    String description,
    String linkId,
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
    @_s.required String deviceId,
    @_s.required String globalNetworkId,
    AWSLocation awsLocation,
    String description,
    Location location,
    String model,
    String serialNumber,
    String siteId,
    String type,
    String vendor,
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
    @_s.required String globalNetworkId,
    String description,
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
    @_s.required String globalNetworkId,
    @_s.required String linkId,
    Bandwidth bandwidth,
    String description,
    String provider,
    String type,
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
    @_s.required String globalNetworkId,
    @_s.required String siteId,
    String description,
    Location location,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AWSLocation {
  /// The Amazon Resource Name (ARN) of the subnet the device is located in.
  @_s.JsonKey(name: 'SubnetArn')
  final String subnetArn;

  /// The Zone the device is located in. This can be the ID of an Availability
  /// Zone, Local Zone, Wavelength Zone, or an Outpost.
  @_s.JsonKey(name: 'Zone')
  final String zone;

  AWSLocation({
    this.subnetArn,
    this.zone,
  });
  factory AWSLocation.fromJson(Map<String, dynamic> json) =>
      _$AWSLocationFromJson(json);

  Map<String, dynamic> toJson() => _$AWSLocationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateCustomerGatewayResponse {
  /// The customer gateway association.
  @_s.JsonKey(name: 'CustomerGatewayAssociation')
  final CustomerGatewayAssociation customerGatewayAssociation;

  AssociateCustomerGatewayResponse({
    this.customerGatewayAssociation,
  });
  factory AssociateCustomerGatewayResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateCustomerGatewayResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateLinkResponse {
  /// The link association.
  @_s.JsonKey(name: 'LinkAssociation')
  final LinkAssociation linkAssociation;

  AssociateLinkResponse({
    this.linkAssociation,
  });
  factory AssociateLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateLinkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateTransitGatewayConnectPeerResponse {
  /// The transit gateway Connect peer association.
  @_s.JsonKey(name: 'TransitGatewayConnectPeerAssociation')
  final TransitGatewayConnectPeerAssociation
      transitGatewayConnectPeerAssociation;

  AssociateTransitGatewayConnectPeerResponse({
    this.transitGatewayConnectPeerAssociation,
  });
  factory AssociateTransitGatewayConnectPeerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateTransitGatewayConnectPeerResponseFromJson(json);
}

/// Describes bandwidth information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Bandwidth {
  /// Download speed in Mbps.
  @_s.JsonKey(name: 'DownloadSpeed')
  final int downloadSpeed;

  /// Upload speed in Mbps.
  @_s.JsonKey(name: 'UploadSpeed')
  final int uploadSpeed;

  Bandwidth({
    this.downloadSpeed,
    this.uploadSpeed,
  });
  factory Bandwidth.fromJson(Map<String, dynamic> json) =>
      _$BandwidthFromJson(json);

  Map<String, dynamic> toJson() => _$BandwidthToJson(this);
}

/// Describes a connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Connection {
  /// The ID of the second device in the connection.
  @_s.JsonKey(name: 'ConnectedDeviceId')
  final String connectedDeviceId;

  /// The ID of the link for the second device in the connection.
  @_s.JsonKey(name: 'ConnectedLinkId')
  final String connectedLinkId;

  /// The Amazon Resource Name (ARN) of the connection.
  @_s.JsonKey(name: 'ConnectionArn')
  final String connectionArn;

  /// The ID of the connection.
  @_s.JsonKey(name: 'ConnectionId')
  final String connectionId;

  /// The date and time that the connection was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The description of the connection.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ID of the first device in the connection.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  /// The ID of the global network.
  @_s.JsonKey(name: 'GlobalNetworkId')
  final String globalNetworkId;

  /// The ID of the link for the first device in the connection.
  @_s.JsonKey(name: 'LinkId')
  final String linkId;

  /// The state of the connection.
  @_s.JsonKey(name: 'State')
  final ConnectionState state;

  /// The tags for the connection.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

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
  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
}

enum ConnectionState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('UPDATING')
  updating,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConnectionResponse {
  /// Information about the connection.
  @_s.JsonKey(name: 'Connection')
  final Connection connection;

  CreateConnectionResponse({
    this.connection,
  });
  factory CreateConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateConnectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeviceResponse {
  /// Information about the device.
  @_s.JsonKey(name: 'Device')
  final Device device;

  CreateDeviceResponse({
    this.device,
  });
  factory CreateDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGlobalNetworkResponse {
  /// Information about the global network object.
  @_s.JsonKey(name: 'GlobalNetwork')
  final GlobalNetwork globalNetwork;

  CreateGlobalNetworkResponse({
    this.globalNetwork,
  });
  factory CreateGlobalNetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGlobalNetworkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLinkResponse {
  /// Information about the link.
  @_s.JsonKey(name: 'Link')
  final Link link;

  CreateLinkResponse({
    this.link,
  });
  factory CreateLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLinkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSiteResponse {
  /// Information about the site.
  @_s.JsonKey(name: 'Site')
  final Site site;

  CreateSiteResponse({
    this.site,
  });
  factory CreateSiteResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSiteResponseFromJson(json);
}

/// Describes the association between a customer gateway, a device, and a link.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CustomerGatewayAssociation {
  /// The Amazon Resource Name (ARN) of the customer gateway.
  @_s.JsonKey(name: 'CustomerGatewayArn')
  final String customerGatewayArn;

  /// The ID of the device.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  /// The ID of the global network.
  @_s.JsonKey(name: 'GlobalNetworkId')
  final String globalNetworkId;

  /// The ID of the link.
  @_s.JsonKey(name: 'LinkId')
  final String linkId;

  /// The association state.
  @_s.JsonKey(name: 'State')
  final CustomerGatewayAssociationState state;

  CustomerGatewayAssociation({
    this.customerGatewayArn,
    this.deviceId,
    this.globalNetworkId,
    this.linkId,
    this.state,
  });
  factory CustomerGatewayAssociation.fromJson(Map<String, dynamic> json) =>
      _$CustomerGatewayAssociationFromJson(json);
}

enum CustomerGatewayAssociationState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConnectionResponse {
  /// Information about the connection.
  @_s.JsonKey(name: 'Connection')
  final Connection connection;

  DeleteConnectionResponse({
    this.connection,
  });
  factory DeleteConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteConnectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDeviceResponse {
  /// Information about the device.
  @_s.JsonKey(name: 'Device')
  final Device device;

  DeleteDeviceResponse({
    this.device,
  });
  factory DeleteDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGlobalNetworkResponse {
  /// Information about the global network.
  @_s.JsonKey(name: 'GlobalNetwork')
  final GlobalNetwork globalNetwork;

  DeleteGlobalNetworkResponse({
    this.globalNetwork,
  });
  factory DeleteGlobalNetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteGlobalNetworkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLinkResponse {
  /// Information about the link.
  @_s.JsonKey(name: 'Link')
  final Link link;

  DeleteLinkResponse({
    this.link,
  });
  factory DeleteLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteLinkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSiteResponse {
  /// Information about the site.
  @_s.JsonKey(name: 'Site')
  final Site site;

  DeleteSiteResponse({
    this.site,
  });
  factory DeleteSiteResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSiteResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterTransitGatewayResponse {
  /// The transit gateway registration information.
  @_s.JsonKey(name: 'TransitGatewayRegistration')
  final TransitGatewayRegistration transitGatewayRegistration;

  DeregisterTransitGatewayResponse({
    this.transitGatewayRegistration,
  });
  factory DeregisterTransitGatewayResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeregisterTransitGatewayResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGlobalNetworksResponse {
  /// Information about the global networks.
  @_s.JsonKey(name: 'GlobalNetworks')
  final List<GlobalNetwork> globalNetworks;

  /// The token for the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeGlobalNetworksResponse({
    this.globalNetworks,
    this.nextToken,
  });
  factory DescribeGlobalNetworksResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeGlobalNetworksResponseFromJson(json);
}

/// Describes a device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Device {
  /// The AWS location of the device.
  @_s.JsonKey(name: 'AWSLocation')
  final AWSLocation awsLocation;

  /// The date and time that the site was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The description of the device.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Amazon Resource Name (ARN) of the device.
  @_s.JsonKey(name: 'DeviceArn')
  final String deviceArn;

  /// The ID of the device.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  /// The ID of the global network.
  @_s.JsonKey(name: 'GlobalNetworkId')
  final String globalNetworkId;

  /// The site location.
  @_s.JsonKey(name: 'Location')
  final Location location;

  /// The device model.
  @_s.JsonKey(name: 'Model')
  final String model;

  /// The device serial number.
  @_s.JsonKey(name: 'SerialNumber')
  final String serialNumber;

  /// The site ID.
  @_s.JsonKey(name: 'SiteId')
  final String siteId;

  /// The device state.
  @_s.JsonKey(name: 'State')
  final DeviceState state;

  /// The tags for the device.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// The device type.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The device vendor.
  @_s.JsonKey(name: 'Vendor')
  final String vendor;

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
  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}

enum DeviceState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('UPDATING')
  updating,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateCustomerGatewayResponse {
  /// Information about the customer gateway association.
  @_s.JsonKey(name: 'CustomerGatewayAssociation')
  final CustomerGatewayAssociation customerGatewayAssociation;

  DisassociateCustomerGatewayResponse({
    this.customerGatewayAssociation,
  });
  factory DisassociateCustomerGatewayResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateCustomerGatewayResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateLinkResponse {
  /// Information about the link association.
  @_s.JsonKey(name: 'LinkAssociation')
  final LinkAssociation linkAssociation;

  DisassociateLinkResponse({
    this.linkAssociation,
  });
  factory DisassociateLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateLinkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateTransitGatewayConnectPeerResponse {
  /// The transit gateway Connect peer association.
  @_s.JsonKey(name: 'TransitGatewayConnectPeerAssociation')
  final TransitGatewayConnectPeerAssociation
      transitGatewayConnectPeerAssociation;

  DisassociateTransitGatewayConnectPeerResponse({
    this.transitGatewayConnectPeerAssociation,
  });
  factory DisassociateTransitGatewayConnectPeerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateTransitGatewayConnectPeerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConnectionsResponse {
  /// Information about the connections.
  @_s.JsonKey(name: 'Connections')
  final List<Connection> connections;

  /// The token to use for the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetConnectionsResponse({
    this.connections,
    this.nextToken,
  });
  factory GetConnectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConnectionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCustomerGatewayAssociationsResponse {
  /// The customer gateway associations.
  @_s.JsonKey(name: 'CustomerGatewayAssociations')
  final List<CustomerGatewayAssociation> customerGatewayAssociations;

  /// The token for the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetCustomerGatewayAssociationsResponse({
    this.customerGatewayAssociations,
    this.nextToken,
  });
  factory GetCustomerGatewayAssociationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetCustomerGatewayAssociationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDevicesResponse {
  /// The devices.
  @_s.JsonKey(name: 'Devices')
  final List<Device> devices;

  /// The token for the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetDevicesResponse({
    this.devices,
    this.nextToken,
  });
  factory GetDevicesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDevicesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLinkAssociationsResponse {
  /// The link associations.
  @_s.JsonKey(name: 'LinkAssociations')
  final List<LinkAssociation> linkAssociations;

  /// The token for the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetLinkAssociationsResponse({
    this.linkAssociations,
    this.nextToken,
  });
  factory GetLinkAssociationsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLinkAssociationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLinksResponse {
  /// The links.
  @_s.JsonKey(name: 'Links')
  final List<Link> links;

  /// The token for the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetLinksResponse({
    this.links,
    this.nextToken,
  });
  factory GetLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLinksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSitesResponse {
  /// The token for the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The sites.
  @_s.JsonKey(name: 'Sites')
  final List<Site> sites;

  GetSitesResponse({
    this.nextToken,
    this.sites,
  });
  factory GetSitesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSitesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTransitGatewayConnectPeerAssociationsResponse {
  /// The token to use for the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the transit gateway Connect peer associations.
  @_s.JsonKey(name: 'TransitGatewayConnectPeerAssociations')
  final List<TransitGatewayConnectPeerAssociation>
      transitGatewayConnectPeerAssociations;

  GetTransitGatewayConnectPeerAssociationsResponse({
    this.nextToken,
    this.transitGatewayConnectPeerAssociations,
  });
  factory GetTransitGatewayConnectPeerAssociationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetTransitGatewayConnectPeerAssociationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTransitGatewayRegistrationsResponse {
  /// The token for the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The transit gateway registrations.
  @_s.JsonKey(name: 'TransitGatewayRegistrations')
  final List<TransitGatewayRegistration> transitGatewayRegistrations;

  GetTransitGatewayRegistrationsResponse({
    this.nextToken,
    this.transitGatewayRegistrations,
  });
  factory GetTransitGatewayRegistrationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetTransitGatewayRegistrationsResponseFromJson(json);
}

/// Describes a global network.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GlobalNetwork {
  /// The date and time that the global network was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The description of the global network.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Amazon Resource Name (ARN) of the global network.
  @_s.JsonKey(name: 'GlobalNetworkArn')
  final String globalNetworkArn;

  /// The ID of the global network.
  @_s.JsonKey(name: 'GlobalNetworkId')
  final String globalNetworkId;

  /// The state of the global network.
  @_s.JsonKey(name: 'State')
  final GlobalNetworkState state;

  /// The tags for the global network.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  GlobalNetwork({
    this.createdAt,
    this.description,
    this.globalNetworkArn,
    this.globalNetworkId,
    this.state,
    this.tags,
  });
  factory GlobalNetwork.fromJson(Map<String, dynamic> json) =>
      _$GlobalNetworkFromJson(json);
}

enum GlobalNetworkState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('UPDATING')
  updating,
}

/// Describes a link.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Link {
  /// The bandwidth for the link.
  @_s.JsonKey(name: 'Bandwidth')
  final Bandwidth bandwidth;

  /// The date and time that the link was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The description of the link.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ID of the global network.
  @_s.JsonKey(name: 'GlobalNetworkId')
  final String globalNetworkId;

  /// The Amazon Resource Name (ARN) of the link.
  @_s.JsonKey(name: 'LinkArn')
  final String linkArn;

  /// The ID of the link.
  @_s.JsonKey(name: 'LinkId')
  final String linkId;

  /// The provider of the link.
  @_s.JsonKey(name: 'Provider')
  final String provider;

  /// The ID of the site.
  @_s.JsonKey(name: 'SiteId')
  final String siteId;

  /// The state of the link.
  @_s.JsonKey(name: 'State')
  final LinkState state;

  /// The tags for the link.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// The type of the link.
  @_s.JsonKey(name: 'Type')
  final String type;

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
  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}

/// Describes the association between a device and a link.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LinkAssociation {
  /// The device ID for the link association.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  /// The ID of the global network.
  @_s.JsonKey(name: 'GlobalNetworkId')
  final String globalNetworkId;

  /// The state of the association.
  @_s.JsonKey(name: 'LinkAssociationState')
  final LinkAssociationState linkAssociationState;

  /// The ID of the link.
  @_s.JsonKey(name: 'LinkId')
  final String linkId;

  LinkAssociation({
    this.deviceId,
    this.globalNetworkId,
    this.linkAssociationState,
    this.linkId,
  });
  factory LinkAssociation.fromJson(Map<String, dynamic> json) =>
      _$LinkAssociationFromJson(json);
}

enum LinkAssociationState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

enum LinkState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('UPDATING')
  updating,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The list of tags.
  @_s.JsonKey(name: 'TagList')
  final List<Tag> tagList;

  ListTagsForResourceResponse({
    this.tagList,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Describes a location.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Location {
  /// The physical address.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// The latitude.
  @_s.JsonKey(name: 'Latitude')
  final String latitude;

  /// The longitude.
  @_s.JsonKey(name: 'Longitude')
  final String longitude;

  Location({
    this.address,
    this.latitude,
    this.longitude,
  });
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterTransitGatewayResponse {
  /// Information about the transit gateway registration.
  @_s.JsonKey(name: 'TransitGatewayRegistration')
  final TransitGatewayRegistration transitGatewayRegistration;

  RegisterTransitGatewayResponse({
    this.transitGatewayRegistration,
  });
  factory RegisterTransitGatewayResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterTransitGatewayResponseFromJson(json);
}

/// Describes a site.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Site {
  /// The date and time that the site was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The description of the site.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ID of the global network.
  @_s.JsonKey(name: 'GlobalNetworkId')
  final String globalNetworkId;

  /// The location of the site.
  @_s.JsonKey(name: 'Location')
  final Location location;

  /// The Amazon Resource Name (ARN) of the site.
  @_s.JsonKey(name: 'SiteArn')
  final String siteArn;

  /// The ID of the site.
  @_s.JsonKey(name: 'SiteId')
  final String siteId;

  /// The state of the site.
  @_s.JsonKey(name: 'State')
  final SiteState state;

  /// The tags for the site.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

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
  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
}

enum SiteState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('UPDATING')
  updating,
}

/// Describes a tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The tag key.
  ///
  /// Length Constraints: Maximum length of 128 characters.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The tag value.
  ///
  /// Length Constraints: Maximum length of 256 characters.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// Describes a transit gateway Connect peer association.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TransitGatewayConnectPeerAssociation {
  /// The ID of the device.
  @_s.JsonKey(name: 'DeviceId')
  final String deviceId;

  /// The ID of the global network.
  @_s.JsonKey(name: 'GlobalNetworkId')
  final String globalNetworkId;

  /// The ID of the link.
  @_s.JsonKey(name: 'LinkId')
  final String linkId;

  /// The state of the association.
  @_s.JsonKey(name: 'State')
  final TransitGatewayConnectPeerAssociationState state;

  /// The Amazon Resource Name (ARN) of the transit gateway Connect peer.
  @_s.JsonKey(name: 'TransitGatewayConnectPeerArn')
  final String transitGatewayConnectPeerArn;

  TransitGatewayConnectPeerAssociation({
    this.deviceId,
    this.globalNetworkId,
    this.linkId,
    this.state,
    this.transitGatewayConnectPeerArn,
  });
  factory TransitGatewayConnectPeerAssociation.fromJson(
          Map<String, dynamic> json) =>
      _$TransitGatewayConnectPeerAssociationFromJson(json);
}

enum TransitGatewayConnectPeerAssociationState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

/// Describes the registration of a transit gateway to a global network.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TransitGatewayRegistration {
  /// The ID of the global network.
  @_s.JsonKey(name: 'GlobalNetworkId')
  final String globalNetworkId;

  /// The state of the transit gateway registration.
  @_s.JsonKey(name: 'State')
  final TransitGatewayRegistrationStateReason state;

  /// The Amazon Resource Name (ARN) of the transit gateway.
  @_s.JsonKey(name: 'TransitGatewayArn')
  final String transitGatewayArn;

  TransitGatewayRegistration({
    this.globalNetworkId,
    this.state,
    this.transitGatewayArn,
  });
  factory TransitGatewayRegistration.fromJson(Map<String, dynamic> json) =>
      _$TransitGatewayRegistrationFromJson(json);
}

enum TransitGatewayRegistrationState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('FAILED')
  failed,
}

/// Describes the status of a transit gateway registration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TransitGatewayRegistrationStateReason {
  /// The code for the state reason.
  @_s.JsonKey(name: 'Code')
  final TransitGatewayRegistrationState code;

  /// The message for the state reason.
  @_s.JsonKey(name: 'Message')
  final String message;

  TransitGatewayRegistrationStateReason({
    this.code,
    this.message,
  });
  factory TransitGatewayRegistrationStateReason.fromJson(
          Map<String, dynamic> json) =>
      _$TransitGatewayRegistrationStateReasonFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConnectionResponse {
  /// Information about the connection.
  @_s.JsonKey(name: 'Connection')
  final Connection connection;

  UpdateConnectionResponse({
    this.connection,
  });
  factory UpdateConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateConnectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDeviceResponse {
  /// Information about the device.
  @_s.JsonKey(name: 'Device')
  final Device device;

  UpdateDeviceResponse({
    this.device,
  });
  factory UpdateDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeviceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGlobalNetworkResponse {
  /// Information about the global network object.
  @_s.JsonKey(name: 'GlobalNetwork')
  final GlobalNetwork globalNetwork;

  UpdateGlobalNetworkResponse({
    this.globalNetwork,
  });
  factory UpdateGlobalNetworkResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateGlobalNetworkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateLinkResponse {
  /// Information about the link.
  @_s.JsonKey(name: 'Link')
  final Link link;

  UpdateLinkResponse({
    this.link,
  });
  factory UpdateLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateLinkResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSiteResponse {
  /// Information about the site.
  @_s.JsonKey(name: 'Site')
  final Site site;

  UpdateSiteResponse({
    this.site,
  });
  factory UpdateSiteResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSiteResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
